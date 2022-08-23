import Foundation

// utterly unused anywhere
public let allDimensions = [
	UnitAmount.self,
	UnitAcceleration.self,
	UnitAngle.self,
	UnitAngularSpeed.self,
	UnitArea.self,
	UnitConcentrationMass.self,
	UnitDispersion.self,
	UnitDuration.self,
	UnitElectricCapacitance.self,
	UnitElectricCharge.self,
	UnitElectricConductance.self,
	UnitElectricCurrent.self,
	UnitElectricInductance.self,
	UnitElectricPotentialDifference.self,
	UnitElectricResistance.self,
	UnitEnergy.self,
	UnitForce.self,
	UnitFrequency.self,
	UnitFuelEfficiency.self,
	UnitIonizingRadiation.self,
	UnitIlluminance.self,
	UnitInformationStorage.self,
	UnitLength.self,
	UnitLuminousFlux.self,
	UnitLuminousIntensity.self,
	UnitMagneticFlux.self,
	UnitMagneticFluxDensity.self,
	UnitMass.self,
	UnitPower.self,
	UnitPressure.self,
	UnitSpeed.self,
	UnitTemperature.self,
	UnitVolume.self,
]

// actually used:
public let fundamentalDimensions = [
	UnitAmount.baseUnit(),
	UnitDuration.baseUnit(),
	UnitElectricCurrent.baseUnit(),
	UnitIlluminance.baseUnit(),
	UnitLength.baseUnit(),
	UnitMass.baseUnit(),
	UnitTemperature.baseUnit(),
	
	// not sure what to do with the following:
	
	UnitAngle.baseUnit(),
	UnitDispersion.baseUnit(),
	UnitFrequency.baseUnit(),
	UnitInformationStorage.baseUnit(),
]

public let fundamentalSIDimensions = [
	UnitLength.self,
	UnitMass.self,
	UnitDuration.self,
	UnitElectricCurrent.self,
	UnitTemperature.self,
	UnitAmount.self,
	UnitIlluminance.self,
]

extension Dimension {
	public var dimensionSymbol: String {
		switch self {
			case is UnitLength: return "L"
			case is UnitMass: return "M"
			case is UnitDuration: return "T"
			case is UnitElectricCurrent: return "I"
			case is UnitTemperature: return "Θ"
			case is UnitAmount: return "N"
			case is UnitIlluminance: return "J"
			default: return "?"
		}
	}
}

public let nonZeroOffsetUnits: [Dimension] = [
	UnitTemperature.celsius,
	UnitTemperature.fahrenheit,
]

extension Int {
	var oneOrZero: Int {
		(self == 0) ? 0 : 1
	}
	
	public var drawnExponent: String {
		if self < 2 || 9 < self {
			return "^\(self)"
		}
		else {
			switch self {
				case 2: return "²"
				case 3: return "³"
				case 4: return "⁴"
				case 5: return "⁵"
				case 6: return "⁶"
				case 7: return "⁷"
				case 8: return "⁸"
				case 9: return "⁹"
				default: return "^\(self)"
			}
		}
	}
	
	// Refactor this!
	
	public var drawnExponentGeneral: String {
		var out = ""
		
		if self < 0 {
			out = "⁻"
		}
		
		let a = abs(self)
		
		switch a {
			case 0: break
			case 1: out += "¹"
			case 2: out += "²"
			case 3: out += "³"
			case 4: out += "⁴"
			case 5: out += "⁵"
			case 6: out += "⁶"
			case 7: out += "⁷"
			case 8: out += "⁸"
			case 9: out += "⁹"
			default: out += "^\(self)"
		}
		
		return out
	}
}

public typealias DimensionDictionary = [Dimension : (unit: Dimension, exponent: TieredNumber)]

public extension Dictionary where Key == Dimension, Value == (unit: Dimension, exponent: TieredNumber) {
	func containsCompositeDimensions() -> Bool {
		return !filter {
			$0.key.isCompositeDimension()
		}.isEmpty
	}
	
	func containsNonZeroOffsetUnits() -> Bool {
		return !filter {
			nonZeroOffsetUnits.contains($0.value.unit)
		}.isEmpty
	}
	
	func baseUnits() -> Set<Dimension> {
		return Set(map { $0.key })
	}
}

public func equalDimensionDictionaries(_ a: DimensionDictionary, _ b: DimensionDictionary) -> Bool {
	let akeys = a.keys
	let bkeys = b.keys
	
	if akeys.count != bkeys.count { return false }
	if Set(akeys) != Set(bkeys) {
		return false
	}
	
	for key in akeys {
		guard let (akey0, akey1) = a[key],
			  let (bkey0, bkey1) = b[key] else {
			return false
		}
		
		if akey0 != bkey0 || akey1 != bkey1 {
			return false
		}
	}
	
	return true
}

infix operator ∔

public struct FundamentalBaseVector {
	var m = 0
	var s = 0
	var kg = 0
	var A = 0
	var mol = 0
	var K = 0
	var cdl = 0
	
	public func nonZeroElements() -> FundamentalBaseVector {
		FBV(m: m.oneOrZero, s: s.oneOrZero, kg: kg.oneOrZero, A: A.oneOrZero, mol: mol.oneOrZero, K: K.oneOrZero, cdl: cdl.oneOrZero)
	}
	
	static public func ∔ (left: FundamentalBaseVector, right: FundamentalBaseVector) -> FundamentalBaseVector {
		FBV(
			m: left.m + right.m,
			s: left.s + right.s,
			kg: left.kg + right.kg,
			A: left.A + right.A,
			mol: left.mol + right.mol,
			K: left.K + right.K,
			cdl: left.cdl + right.cdl
		)
	}
	
	public func projectsInto(multiplyUsedBaseVector z: FundamentalBaseVector) -> Bool {
		if m   != 0 && 1 < z.m   { return true }
		if s   != 0 && 1 < z.s   { return true }
		if kg  != 0 && 1 < z.kg  { return true }
		if A   != 0 && 1 < z.A   { return true }
		if mol != 0 && 1 < z.mol { return true }
		if K   != 0 && 1 < z.K   { return true }
		if cdl != 0 && 1 < z.cdl { return true }
		
		return false
	}
	
	/*public func multiplyUsedBaseUnits() -> [Dimension] {
		var out: [Dimension] = []
		
		if 1 < m { out.append(UnitLength.baseUnit()) }
		if 1 < s { out.append(UnitDuration.baseUnit()) }
		if 1 < kg { out.append(UnitMass.baseUnit()) }
		if 1 < A { out.append(UnitElectricCurrent.baseUnit()) }
		if 1 < mol { out.append(UnitAmount.baseUnit()) }
		if 1 < K { out.append(UnitTemperature.baseUnit()) }
		if 1 < cdl { out.append(UnitIlluminance.baseUnit()) }
		
		return out
	}*/
}

fileprivate typealias FBV = FundamentalBaseVector
//typealias FundamentalBaseVector = (m: Int, s: Int, kg: Int, A: Int, mol: Int, K: Int, cdl: Int)

public let fundamentalBaseVector: [Dimension : FundamentalBaseVector] = [
	UnitLength.baseUnit()                     : FBV(m:  1, s:  0, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),
	UnitDuration.baseUnit()                   : FBV(m:  0, s:  1, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),
	UnitMass.baseUnit()                       : FBV(m:  0, s:  0, kg:  1, A:  0, mol:  0, K:  0, cdl:  0),
	UnitElectricCurrent.baseUnit()            : FBV(m:  0, s:  0, kg:  0, A:  1, mol:  0, K:  0, cdl:  0),
	UnitAmount.baseUnit()                     : FBV(m:  0, s:  0, kg:  0, A:  0, mol:  1, K:  0, cdl:  0),
	UnitTemperature.baseUnit()                : FBV(m:  0, s:  0, kg:  0, A:  0, mol:  0, K:  1, cdl:  0),
	UnitIlluminance.baseUnit()                : FBV(m:  0, s:  0, kg:  0, A:  0, mol:  0, K:  0, cdl:  1),
	
	//	UnitAngle.self,
	//	UnitDispersion.self,
	//	UnitFrequency.self,
	//	UnitInformationStorage.self,

	UnitAcceleration.baseUnit()                : FBV(m:  1, s: -2, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),
	UnitActivity.baseUnit()                    : FBV(m:  0, s: -1, kg:  0, A:  0, mol:  1, K:  0, cdl:  0),
	UnitArea.baseUnit()                        : FBV(m:  2, s:  0, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),  // **** redundant with FuelEfficiency
	UnitAngularSpeed.baseUnit()                : FBV(m:  0, s: -1, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),
	UnitConcentrationMass.baseUnit()           : FBV(m: -3, s:  0, kg:  1, A:  0, mol:  0, K:  0, cdl:  0),
	UnitElectricCapacitance.baseUnit()         : FBV(m: -2, s:  4, kg: -1, A:  2, mol:  0, K:  0, cdl:  0),
	UnitElectricCharge.baseUnit()              : FBV(m:  0, s:  1, kg:  0, A:  1, mol:  0, K:  0, cdl:  0),
	UnitElectricConductance.baseUnit()         : FBV(m: -2, s:  3, kg: -1, A:  2, mol:  0, K:  0, cdl:  0),
	UnitElectricInductance.baseUnit()          : FBV(m:  2, s: -2, kg:  1, A: -2, mol:  0, K:  0, cdl:  0),
	UnitElectricPotentialDifference.baseUnit() : FBV(m:  2, s: -3, kg:  1, A: -1, mol:  0, K:  0, cdl:  0),
	UnitElectricResistance.baseUnit()          : FBV(m:  2, s: -3, kg:  1, A: -2, mol:  0, K:  0, cdl:  0),
	UnitEnergy.baseUnit()                      : FBV(m:  2, s: -2, kg:  1, A:  0, mol:  0, K:  0, cdl:  0),
	UnitForce.baseUnit()                       : FBV(m:  1, s: -2, kg:  1, A:  0, mol:  0, K:  0, cdl:  0),
	UnitFuelEfficiency.baseUnit()              : FBV(m:  2, s:  0, kg:  0, A:  0, mol:  0, K:  0, cdl:  0), // ? L/100km   **** see above
	UnitIonizingRadiation.baseUnit()           : FBV(m:  2, s: -2, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),
	UnitLuminousFlux.baseUnit()                : FBV(m:  0, s:  0, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),
	UnitLuminousIntensity.baseUnit()           : FBV(m:  0, s:  0, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),
	UnitMagneticFlux.baseUnit()                : FBV(m:  2, s: -2, kg:  1, A: -1, mol:  0, K:  0, cdl:  0),
	UnitMagneticFluxDensity.baseUnit()         : FBV(m:  0, s: -2, kg:  1, A: -1, mol:  0, K:  0, cdl:  0),
	UnitPower.baseUnit()                       : FBV(m:  2, s: -3, kg:  1, A:  0, mol:  0, K:  0, cdl:  0),
	UnitPressure.baseUnit()                    : FBV(m: -1, s: -2, kg:  1, A:  0, mol:  0, K:  0, cdl:  0),
	UnitSpeed.baseUnit()                       : FBV(m:  1, s: -1, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),
	UnitVolume.baseUnit()                      : FBV(m:  3, s:  0, kg:  0, A:  0, mol:  0, K:  0, cdl:  0),
]

public extension Dimension {
	func isCompositeDimension() -> Bool {
		return !fundamentalDimensions.contains(self)
	}
}
