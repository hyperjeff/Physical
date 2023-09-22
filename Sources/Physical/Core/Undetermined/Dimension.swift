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
	UnitSolidAngle.self,
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
	UnitSolidAngle.baseUnit(),
//	UnitDispersion.baseUnit(),
//	UnitFrequency.baseUnit(),
//	UnitInformationStorage.baseUnit(),
]

public let fundamentalSIDimensions = [
	UnitAmount.self,
	UnitAngle.self,
	UnitDuration.self,
	UnitElectricCurrent.self,
	UnitLength.self,
	UnitIlluminance.self,
	UnitMass.self,
	UnitSolidAngle.self,
	UnitTemperature.self,
]

extension Dimension {
	public var dimensionSymbol: String {
		switch self {
			case is UnitAngle: return "A"
			case is UnitLength: return "L"
			case is UnitMass: return "M"
			case is UnitDuration: return "T"
			case is UnitElectricCurrent: return "I"
			case is UnitTemperature: return "Θ"
			case is UnitAmount: return "N"
			case is UnitSolidAngle: return "Ω"
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
			case 1: out += self < 0 ? "¹" : ""
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
	public var m = 0
	public var s = 0
	public var kg = 0
	public var A = 0
	public var mol = 0
	public var K = 0
	public var cdl = 0
	public var rad = 0
	public var st = 0
	
	// purely just to make it accessible publicly
	public init() {}
	
	public init(m m1: Int, s s1: Int, kg k1: Int, A A1: Int, mol mo1: Int, K K1: Int, cdl c1: Int, rad r1: Int, st st1: Int) {
		m = m1
		s = s1
		kg = k1
		A = A1
		mol = mo1
		K = K1
		cdl = c1
		rad = r1
		st = st1
	}
	
	public func nonZeroElements() -> FundamentalBaseVector {
		FBV(m: m.oneOrZero, s: s.oneOrZero, kg: kg.oneOrZero, A: A.oneOrZero, mol: mol.oneOrZero, K: K.oneOrZero, cdl: cdl.oneOrZero, rad: rad.oneOrZero, st: st.oneOrZero)
	}
	
	static public func ∔ (left: FundamentalBaseVector, right: FundamentalBaseVector) -> FundamentalBaseVector {
		FBV(
			m: left.m + right.m,
			s: left.s + right.s,
			kg: left.kg + right.kg,
			A: left.A + right.A,
			mol: left.mol + right.mol,
			K: left.K + right.K,
			cdl: left.cdl + right.cdl,
			rad: left.rad + right.rad,
			st: left.st + right.st
		)
	}
	
	public func projectsInto(multiplyUsedBaseVector z: FundamentalBaseVector) -> Bool {
		(m   != 0 && 1 < z.m)   ||
		(s   != 0 && 1 < z.s)   ||
		(kg  != 0 && 1 < z.kg)  ||
		(A   != 0 && 1 < z.A)   ||
		(mol != 0 && 1 < z.mol) ||
		(K   != 0 && 1 < z.K)   ||
		(cdl != 0 && 1 < z.cdl) ||
		(rad != 0 && 1 < z.rad) ||
		(st  != 0 && 1 < z.st)
	}
	
}

fileprivate typealias FBV = FundamentalBaseVector
//typealias FundamentalBaseVector = (m: Int, s: Int, kg: Int, A: Int, mol: Int, K: Int, cdl: Int)

// TODO: Add a unit test to check for any redundant vectors

public let fundamentalBaseVector: [Dimension : FundamentalBaseVector] = [
	UnitAcceleration.baseUnit()                : FBV(m:  1, s: -2, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitActivity.baseUnit()                    : FBV(m:  0, s: -1, kg:  0, A:  0, mol: 1, K: 0, cdl: 0, rad: 0, st: 0),
	UnitAmount.baseUnit()                      : FBV(m:  0, s:  0, kg:  0, A:  0, mol: 1, K: 0, cdl: 0, rad: 0, st: 0),
	UnitAngle.baseUnit()                       : FBV(m:  0, s:  0, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 1, st: 0),
	UnitAngularSpeed.baseUnit()                : FBV(m:  0, s: -1, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 1, st: 0),
	UnitArea.baseUnit()                        : FBV(m:  2, s:  0, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitConcentrationMass.baseUnit()           : FBV(m: -3, s:  0, kg:  1, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitDuration.baseUnit()                    : FBV(m:  0, s:  1, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitElectricCapacitance.baseUnit()         : FBV(m: -2, s:  4, kg: -1, A:  2, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitElectricCharge.baseUnit()              : FBV(m:  0, s:  1, kg:  0, A:  1, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitElectricConductance.baseUnit()         : FBV(m: -2, s:  3, kg: -1, A:  2, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitElectricCurrent.baseUnit()             : FBV(m:  0, s:  0, kg:  0, A:  1, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitElectricInductance.baseUnit()          : FBV(m:  2, s: -2, kg:  1, A: -2, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitElectricPotentialDifference.baseUnit() : FBV(m:  2, s: -3, kg:  1, A: -1, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitElectricResistance.baseUnit()          : FBV(m:  2, s: -3, kg:  1, A: -2, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitEnergy.baseUnit()                      : FBV(m:  2, s: -2, kg:  1, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitForce.baseUnit()                       : FBV(m:  1, s: -2, kg:  1, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitFrequency.baseUnit()                   : FBV(m:  0, s: -1, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitIlluminance.baseUnit()                 : FBV(m:  0, s:  0, kg:  0, A:  0, mol: 0, K: 0, cdl: 1, rad: 0, st: 0),
	UnitIonizingRadiation.baseUnit()           : FBV(m:  2, s: -2, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitLength.baseUnit()                      : FBV(m:  1, s:  0, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitLuminousFlux.baseUnit()                : FBV(m:  0, s:  0, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 1),
	UnitLuminousIntensity.baseUnit()           : FBV(m:  0, s:  0, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitMagneticFlux.baseUnit()                : FBV(m:  2, s: -2, kg:  1, A: -1, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitMagneticFluxDensity.baseUnit()         : FBV(m:  0, s: -2, kg:  1, A: -1, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitMass.baseUnit()                        : FBV(m:  0, s:  0, kg:  1, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitPower.baseUnit()                       : FBV(m:  2, s: -3, kg:  1, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitPressure.baseUnit()                    : FBV(m: -1, s: -2, kg:  1, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitSolidAngle.baseUnit()                  : FBV(m:  0, s:  0, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 1, st: 1),
	UnitSpeed.baseUnit()                       : FBV(m:  1, s: -1, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
	UnitTemperature.baseUnit()                 : FBV(m:  0, s:  0, kg:  0, A:  0, mol: 0, K: 1, cdl: 0, rad: 0, st: 0),
	UnitVolume.baseUnit()                      : FBV(m:  3, s:  0, kg:  0, A:  0, mol: 0, K: 0, cdl: 0, rad: 0, st: 0),
]

public extension Dimension {
	func isCompositeDimension() -> Bool {
		return !fundamentalDimensions.contains(self)
	}
}
