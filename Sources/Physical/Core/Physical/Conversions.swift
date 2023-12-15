import Foundation
import Accelerate

public extension Physical {
	
	var isUnitless: Bool {
		return if let kind = kindOfQuantity {
			switch kind {
				case KindOfQuantity.decibel(reference: _, symbol: _):
					false
				case KindOfQuantity.standardDecibel(reference: _):
					false
				default:
					units.isEmpty
			}
		}
		else {
			units.isEmpty
		}
	}
	
	var isDimensionless: Bool {
		isUnitless
	}
	
	/// Reduces compound dimensions to a collection of base dimensions
	/// without switching to fundamental units unless necessary.
	mutating func decomposeMixedUnits() {
		if !(units.containsCompositeDimensions() ||
			 (1 < units.count && units.containsNonZeroOffsetUnits())) {
			return
		}
		
		let multiplyUsedVector = units
			.compactMap { fundamentalBaseVector[$0.key] }
			.map { $0.nonZeroElements() }
			.reduce(FundamentalBaseVector()) { a, b in a ∔ b } // ← eventually want to hide this operator within the api
		
		// unit test candidate: If count == 2 and any components of multiplyUsedVector are greater than 1, then both are affected units.
		
		var newValue = value
		var newUnits: DimensionDictionary = [:]
		
		for (base, (unit, exponent)) in units {
			
			// ex: (speed, (mph, -2))
			
			func set(baseUnit: Dimension, toExponent: TieredNumber) {
				if toExponent == .integer(0) { return }
				
				if let (_, exponentSoFar) = newUnits[baseUnit] {
					let newExponent = (exponent * toExponent) + exponentSoFar
					
					if newExponent.isZero {
						newUnits.removeValue(forKey: baseUnit)
					}
					else {
						newUnits[baseUnit] = (baseUnit, newExponent)
					}
				}
				else {
					newUnits[baseUnit] = (baseUnit, exponent * toExponent)
				}
			}
			
			if let baseVector = fundamentalBaseVector[base],
			   (base.isCompositeDimension() ||
				baseVector.projectsInto(multiplyUsedBaseVector: multiplyUsedVector)) {
				
				set(baseUnit: UnitLength.baseUnit(),            toExponent: .integer(baseVector.length))
				set(baseUnit: UnitDuration.baseUnit(),          toExponent: .integer(baseVector.duration))
				set(baseUnit: UnitMass.baseUnit(),              toExponent: .integer(baseVector.mass))
				set(baseUnit: UnitElectricCurrent.baseUnit(),   toExponent: .integer(baseVector.current))
				set(baseUnit: UnitAmount.baseUnit(),            toExponent: .integer(baseVector.amount))
				set(baseUnit: UnitTemperature.baseUnit(),       toExponent: .integer(baseVector.temperature))
				set(baseUnit: UnitLuminousIntensity.baseUnit(), toExponent: .integer(baseVector.luminousIntensity))
				set(baseUnit: UnitAngle.baseUnit(),             toExponent: .integer(baseVector.angle))
				set(baseUnit: UnitSolidAngle.baseUnit(),        toExponent: .integer(baseVector.solidAngle))
				
				switch base {
					// TODO: What is the exhaustive list of special cases here?
					
					case UnitVolume.baseUnit():
						newValue *= pow(Measurement(value: 1, unit: unit).converted(to: UnitVolume.cubicMeters).value, exponent: exponent)
						
					default:
						if base != unit {
							newValue *= pow(Measurement(value: 1, unit: unit).converted(to: base).value, exponent: exponent)
						}
				}
			}
			else {
				newUnits[base] = (unit, exponent)
			}
		}
		
		units = newUnits
		value = newValue
	}
	
	/// Converts units to fundamental dimensions and their base units
	/// - Parameter unitsToConvert: Specific unit dimensions to convert. If none are specified, then all are converted.
	mutating func convertToFundamentalUnits(unitsToConvert: [Dimension] = []) {
		var newValue = value
		var newValues = values
		var newUnits: DimensionDictionary = [:]
		
		let hasNonZeroOffsets = units.containsNonZeroOffsetUnits()
		
		if hasNonZeroOffsets {
			if units.count == 1 {
				if case KindOfQuantity.difference? = kindOfQuantity,
				   let unit = units.first?.value.unit,
				   unit.isKind(of: UnitTemperature.self),
				   let scaling = (unit.converter as? UnitConverterLinear)?.coefficient {
					self = Physical(value: value * scaling, unit: UnitTemperature.baseUnit(), sigfigs: sigfigs)
					
					return
				}
			}
			else {
				errorStack.append("Convert to fundamental units using non-zero offset with multiple units for \(self)")
				self = .notAThing
				
				return
			}
		}
		
		for (base, (var unit, exponent)) in units {
			if base == unit {
				newUnits[base] = (base, exponent)
			}
			else {
				if hasNonZeroOffsets {
					// FIXME: add array version
					
					newValue = Measurement(value: value, unit: unit).converted(to: base).value
				}
				else {
					var unitValue: Double = 1
					
					if unit == UnitLength.feet {
						unit = UnitLength.inches
						unitValue = 12
					}
					
					let scaling = pow(Measurement(value: unitValue, unit: unit).converted(to: base).value, Double(exponent.realValue))
					
					if let values = values {
						var result = [Double](repeating: 0, count: values.count)
						cblas_daxpy(Int32(values.count), scaling, values, 1, &result, 1)
						
						newValues = result
					}
					
					newValue *= scaling
				}
				
				if newUnits.keys.contains(base),
				   let currentUnit = newUnits[base] {
					newUnits[base] = (base, currentUnit.exponent + exponent)
				}
				else {
					newUnits[base] = (base, exponent)
				}
			}
		}
		
		if !newUnits.isEmpty {
			units = newUnits
			value = newValue
			values = newValues
		}
	}
	
	var withBasicUnits: Physical {
		var mutatedSelf = self
		mutatedSelf.decomposeMixedUnits()
		return mutatedSelf
	}
	
	var withFundamentalUnits: Physical {
		var mutatedSelf = self
		mutatedSelf.decomposeMixedUnits()
		mutatedSelf.convertToFundamentalUnits()
		
		return mutatedSelf
	}
	
	var baseUnits: Set<Dimension> {
		units.baseUnits()
	}
	
	func to<T: Dimension>(_ dimension: T) -> Physical {
		if units.keys.count == 1,
		   let (base, unit) = units.first,
		   base ~ dimension,
		   unit.exponent == .integer(1) {
			
			if let toConverter = dimension.converter as? UnitConverterLinear,
			   let fromConverter = unit.unit.converter as? UnitConverterLinear {
				if let values = values {
					var newValues = [Double](repeating: isDifference ? 0 : fromConverter.constant, count: values.count)
					
					cblas_daxpy(Int32(values.count), fromConverter.coefficient / toConverter.coefficient, values, 1, &newValues, 1)
					
					var out = Physical(values: newValues, unit: dimension, sigfigs: sigfigs)
					if isDifference {
						out.kindOfQuantity = .difference
					}
					
					return out
				}
				else if isDifference &&
						(toConverter.constant != 0 || fromConverter.constant != 0) {
					var out = Physical(value: value * fromConverter.coefficient / toConverter.coefficient, unit: dimension, sigfigs: sigfigs)
					out.kindOfQuantity = .difference
					
					return out
				}
			}
			
			let v = Measurement(value: value, unit: unit.unit).converted(to: dimension)
			
			return Physical(value: v.value, unit: dimension, sigfigs: sigfigs)
		}
		
		return convertUp(to: Physical(value: 1, unit: dimension))
	}
	
	func to(units otherUnits: DimensionDictionary) -> Physical? {
		let oneOfOtherUnits = Physical(value: 1, units: otherUnits)
		
		if self ~ oneOfOtherUnits {
			return self.convertUp(to: oneOfOtherUnits)
		}
		
		return nil
	}
	
	func convertUp(to newPhysicalType: Physical) -> Physical {
		if self ~ newPhysicalType {
			return Physical(
				value: (self / newPhysicalType).value,
				units: newPhysicalType.units,
				sigfigs: sigfigs
			)
		}
		
		return Physical.notAThing(logging: "\(self) → \(newPhysicalType)")
	}
	
	func using(_ t: PhysicalConversionType) -> Physical? {
		func usingInternal(start: Physical, _ t: PhysicalConversionType, singularUnits: Bool = false) -> Physical? {
			
			let characteristicDimensionOrder = [
				UnitSolidAngle.self,
				UnitAngle.self,
				UnitTemperature.self,
				UnitIlluminance.self,
				UnitElectricCurrent.self,
				UnitAmount.self,
				UnitMass.self,
				UnitDuration.self,
				UnitLength.self,
			]
			
			if singularUnits && start.withBasicUnits.units.count != 1 {
				return nil
			}
			
			let goal = Physical(value: 1, unit: t.toPhysical())
			
			let A = Set(fundamentalSIDimensions.map { $0.baseUnit() })
			let B = Set(goal.withBasicUnits.units.compactMap { $0.value.unit.baseUnitCheck() })
			let C = Set(start.withBasicUnits.units.compactMap { $0.value.unit.baseUnitCheck() })
			
			let D = A ∩ B ∩ C
			
			var y: Physical? = nil
			
			if !D.isEmpty,
			   let dim = characteristicDimensionOrder
				.first(where: { D.contains($0.baseUnit()) })?
				.baseUnit() {
				
				if let e = goal.withBasicUnits.units[dim]?.exponent,
				   let u = start.withBasicUnits.units[dim]?.exponent {
					switch (e, u) {
						case (let .integer(i), let .integer(j)):
							if j % i == 0 {
								let f = j / i
								let z = goal ^ f
								y = (start.withBasicUnits / z.withBasicUnits) * z
							}
							// TODO: more cases?
						default: break
					}
				}
			}
			
			return y
		}
		
		let selfCopy = self
		var out = usingInternal(start: self, t)
		
		if nil == out {
			var subOut = value.constant
			
			for unit in selfCopy.units {
				let pseudo = Physical(value: 1, units: [unit.key : unit.value])
				
				if let convert = usingInternal(start: pseudo, t, singularUnits: true) {
					subOut *= convert
				}
				else {
					subOut *= pseudo
				}
			}
			
			out = subOut
		}
		
		out?.sigfigs = sigfigs
		
		return out
		
		// TODO: Consider other ways to make this work: 1.joules.perAcres should be convertable into 1.joules.perSquareFoot, etc. One could imagine trying to convert on a per-unit basis before attempting to convert the composite thing. Might have to refactor this function to first try the unit parts, if the whole magilla comes back nil. — Update: We need to *not* do this just blindly for each part, but rather *only* those that are a perfect match (ex: ft² ↔︎ m).
		
	}
	
	func using(_ ys: [PhysicalConversionType]) -> Physical? {
		var out = 1 * self
		
		for y in ys {
			if let yMod = out.using(y) {
				out = yMod
			}
			else {
				return nil
			}
		}
		
		return out
	}

	func to(_ conversionType: PhysicalConversionType) -> Physical {
		self → conversionType
	}
	
	static func → (left: Physical, right: PhysicalConversionType) -> Physical {
		left.to(right.toPhysical())
	}

}
