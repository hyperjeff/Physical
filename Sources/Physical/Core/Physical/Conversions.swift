import Foundation
import Accelerate

/*
 Possible improvements:
 
 • Are we constantly creating decomposed / elementalized versions of each object? Cache this info? Generate at init time?
 • Cache the above for not just _this_ object, but for all objects created with a given unit set? (Singleton cache)
 */


extension Physical {
	//	public mutating func updateLastAddedUnit(unit: Dimension) {
	//		lastAddedUnit = unit
	//	}
	
	/*
	 [base : [unit:exp]]   Has the feature that the various base units may dimensionally overlap.
	 From here we may want to perhaps various transformations.
	 
	 a) Composite base dimensions → Simple base dimensions   ex:     [m/s] → [m] [s]^-1    ←      decompose units
	 b) Transform non-base units → Base units                ex: miles lbs → m kg          ← fundamentalize units
	 
	 Do we always want (a)?
	 
	 [base : [unit:exp]]      ex: ft lbs mph / acre			← should NOT be possible, since * will force unit unmixing
	 ↓
	 [base : [base:exp]]      ex: N m / A min                ← this possible? NO!
	 ↓
	 [fund : [fund:exp]]      ex: kg m^2 / A s^2             ← ✔︎ tres bien
	 ↓
	 [base : [base:exp]]      ex: J / kg                     ← allowable? units are overlapping. NO!
	 ↓
	 [base : [unit:exp]]      ex: erg / lb                   ← ✔︎ yes, that's fine
	 
	 
	 scenarios:
	 
	 mph * hours   → miles *   hours / hours                             → miles        --- is this automatable ?
	 
	 mph * seconds → miles * seconds / hours → miles * seconds / seconds → miles
	 
	 N * miles → kg m^2 / s^2
	 
	 */
	
	public var isUnitless: Bool {
		units.isEmpty
	}
	// ↑ need to rethink these two things ↓
	public var isDimensionless: Bool {
		units
		//			.filter { $0.value.unit !~ 1°.units.first!.value.unit }
		//			.filter { $0.value.unit !~ 1.steradians.units.first!.value.unit }
			.isEmpty
	}
	
	/// Reduces compound dimensions to a collection of base dimensions
	/// without switching to fundamental units unless necessary.
	public mutating func decomposeMixedUnits() {
		if !(units.containsCompositeDimensions() ||
			 (1 < units.count && units.containsNonZeroOffsetUnits())) {
			return
		}
		
		//		if let (newUnits, newValue) = Physical.Cache.runtime.decomposeMixedUnits[(units, value)] {
		//			units = newUnits
		//			value = newValue
		//			return
		//		}
		
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
				
				// TODO: derive from fundamental units:
				
				set(baseUnit: UnitLength.baseUnit(),            toExponent: .integer(baseVector.m))
				set(baseUnit: UnitDuration.baseUnit(),          toExponent: .integer(baseVector.s))
				set(baseUnit: UnitMass.baseUnit(),              toExponent: .integer(baseVector.kg))
				set(baseUnit: UnitElectricCurrent.baseUnit(),   toExponent: .integer(baseVector.A))
				set(baseUnit: UnitAmount.baseUnit(),            toExponent: .integer(baseVector.mol))
				set(baseUnit: UnitTemperature.baseUnit(),       toExponent: .integer(baseVector.K))
				set(baseUnit: UnitLuminousIntensity.baseUnit(), toExponent: .integer(baseVector.cdl))
				set(baseUnit: UnitAngle.baseUnit(),             toExponent: .integer(baseVector.rad))
				set(baseUnit: UnitSolidAngle.baseUnit(),        toExponent: .integer(baseVector.st))
				
				switch base {
						
						// TODO: What is the exhaustive list of special cases here?
						//       Hz
						
						//					case UnitAngularSpeed.baseUnit():
						//						set(baseUnit: UnitAngle.baseUnit(), toExponent: .integer(1))
						//						newValue *= (360 / 2.π) * pow(Measurement(value: 1, unit: unit).converted(to: UnitAngularSpeed.baseUnit()).value, exponent: exponent)
						
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
		
		//		Physical.Cache.runtime.decomposeMixedUnits[(units, value)] = (newUnits, newValue)
		
		// po [units, newUnits].map { u in u.map({ $0.key.symbol }).joined(separator: ", ") }.joined(separator: " -> ")
		units = newUnits
		value = newValue
	}
	
	/// Converts units to fundamental dimensions and their base units
	/// - Parameter unitsToConvert: Specific unit dimensions to convert. If none are specified, then all are converted.
	public mutating func convertToFundamentalUnits(unitsToConvert: [Dimension] = []) {
		var newValue = value
		var newValues = values
		var newUnits: DimensionDictionary = [:]
		
		let hasNonZeroOffsets = units.containsNonZeroOffsetUnits()
		
		if hasNonZeroOffsets {
			if units.count != 1 {
				errorStack.append("Convert to fundamental units using non-zero offset with multiple units for \(self)")
				self = .notAThing
				
				return
			}
			//			else if units.first?.key == UnitTemperature.baseUnit() {
			//				forgot what i was thinking for this.
			//			}
		}
		
		for (base, (var unit, exponent)) in units {
			
			if base == unit {
				newUnits[base] = (base, exponent)
			}
			else {
				// FIXME: still need for: UnitAngle.degrees
				// and milesPerImperialGallon & milesPerGallon use same units!
				
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
	
	public var withBasicUnits: Physical {
		var mutatedSelf = self
		mutatedSelf.decomposeMixedUnits()
		return mutatedSelf
	}
	
	public var withFundamentalUnits: Physical {
		var mutatedSelf = self
		mutatedSelf.decomposeMixedUnits()
		mutatedSelf.convertToFundamentalUnits()
		
		return mutatedSelf
	}
	
	public var baseUnits: Set<Dimension> {
		units.baseUnits()
	}
	
	/*
	 Special case of a single unit converted to another.
	 What we want is the ability to convert to any other unit, adjusting and scaling as needed
	 4.gallons.converted(to: Newtons) should be possible.
	 */
	public func to<T: Dimension>(_ dimension: T) -> Physical {
		if units.keys.count == 1,
		   let (base, unit) = units.first,
		   base ~ dimension,
		   unit.exponent == .integer(1) {
			
			// FIXME: CREATE TESTS FOR THIS CHANGE!
			
			if let values = values {
				if let toConverter = dimension.converter as? UnitConverterLinear,
				   let fromConverter = unit.unit.converter as? UnitConverterLinear {
					// FIXME: fix for non-zero-offset converters
					
					var out = [Double](repeating: 0, count: values.count)
					
					cblas_daxpy(Int32(values.count), fromConverter.coefficient / toConverter.coefficient, values, 1, &out, 1)
					
					return Physical(values: out, unit: dimension, sigfigs: sigfigs)
				}
			}
			
			let v = Measurement(value: value, unit: unit.unit).converted(to: dimension)
			
			return Physical(value: v.value, unit: dimension, sigfigs: sigfigs)
		}
		
		return convertUp(to: Physical(value: 1, unit: dimension))
	}
	
	public func to(units otherUnits: DimensionDictionary) -> Physical? {
		let oneOfOtherUnits = Physical(value: 1, units: otherUnits)
		
		if self ~ oneOfOtherUnits {
			return self.convertUp(to: oneOfOtherUnits)
		}
		
		return nil
	}
	
	public func convertUp(to newPhysicalType: Physical) -> Physical {
		if self ~ newPhysicalType {
			return Physical(
				value: (self / newPhysicalType).value,
				units: newPhysicalType.units,
				sigfigs: sigfigs
			)
		}
		
		return Physical.notAThing(logging: "\(self) → \(newPhysicalType)")
	}
	
	public func using(_ t: PhysicalConversionType) -> Physical? {
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
		
		return out
		
		// TODO: Consider other ways to make this work: 1.joules.perAcres should be convertable into 1.joules.perSquareFoot, etc. One could imagine trying to convert on a per-unit basis before attempting to convert the composite thing. Might have to refactor this function to first try the unit parts, if the whole magilla comes back nil. — Update: We need to *not* do this just blindly for each part, but rather *only* those that are a perfect match (ex: ft² ↔︎ m).
		
	}
	
	public func using(_ ys: [PhysicalConversionType]) -> Physical? {
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

}
