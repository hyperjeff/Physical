import Foundation

/* Hierarchy from Apple's framework:
 
 Unit -- symbol
 ↑
 Dimension
 ↑
 Unit* -- { specific units }
 
 ex: UnitArea -- { squareInches, hectares, acres, ... }
 */

public let fundamentalDimensions = [
	UnitAmount.baseUnit(),
	UnitDuration.baseUnit(),
	UnitElectricCurrent.baseUnit(),
	UnitIlluminance.baseUnit(),
	UnitLength.baseUnit(),
	UnitMass.baseUnit(),
	UnitTemperature.baseUnit(),
	UnitAngle.baseUnit(),
	UnitSolidAngle.baseUnit(),
]

public let productDimensionLookup = [
	UnitArea.squareMegameters : UnitLength.megameters,
	UnitArea.squareKilometers : UnitLength.kilometers,
	UnitArea.squareMeters : UnitLength.meters,
	UnitArea.squareCentimeters : UnitLength.centimeters,
	UnitArea.squareMillimeters : UnitLength.millimeters,
	UnitArea.squareMicrometers : UnitLength.micrometers,
	UnitArea.squareNanometers : UnitLength.nanometers,
	UnitArea.squareInches : UnitLength.inches,
	UnitArea.squareFeet : UnitLength.feet,
	UnitArea.squareYards : UnitLength.yards,
	UnitArea.squareMiles : UnitLength.miles,
	
	UnitVolume.cubicKilometers : UnitLength.kilometers,
	UnitVolume.cubicMeters : UnitLength.meters,
	UnitVolume.cubicDecimeters : UnitLength.decimeters,
	UnitVolume.cubicCentimeters : UnitLength.centimeters,
	UnitVolume.cubicMillimeters : UnitLength.millimeters,
	UnitVolume.cubicInches : UnitLength.inches,
	UnitVolume.cubicFeet : UnitLength.feet,
	UnitVolume.cubicYards : UnitLength.yards,
	UnitVolume.cubicMiles : UnitLength.miles,
	
	UnitSolidAngle.squareDegrees : UnitAngle.degrees,
	UnitSolidAngle.steradians : UnitAngle.radians, 
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

public extension Int {
	var oneOrZero: Int {
		(self == 0) ? 0 : 1
	}
	
	var drawnExponent: String {
		switch self {
			case 2: "²"
			case 3: "³"
			case 4: "⁴"
			case 5: "⁵"
			case 6: "⁶"
			case 7: "⁷"
			case 8: "⁸"
			case 9: "⁹"
			default: "^\(self)"
		}
	}
	
	// Refactor this!
	
	var drawnExponentGeneral: String {
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
	
	var nonZeroOffsetUnits: [Dimension] {
		values.filter {
			($0.unit.converter as? UnitConverterLinear)?.constant != 0
		}.map { $0.unit }
	}
	
	func containsNonZeroOffsetUnits() -> Bool {
		!nonZeroOffsetUnits.isEmpty
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

public struct FundamentalBaseVector {
	public var length = 0
	public var duration = 0
	public var mass = 0
	public var current = 0
	public var amount = 0
	public var temperature = 0
	public var luminousIntensity = 0
	public var angle = 0
	public var solidAngle = 0
	
	// purely just to make it accessible publicly
	public init() {}
	
	public init(length: Int = 0, duration: Int = 0, mass: Int = 0, current: Int = 0, amount: Int = 0, temperature: Int = 0, luminousIntensity: Int = 0, angle: Int = 0, solidAngle: Int = 0) {
		self.length = length
		self.duration = duration
		self.mass = mass
		self.current = current
		self.amount = amount
		self.temperature = temperature
		self.luminousIntensity = luminousIntensity
		self.angle = angle
		self.solidAngle = solidAngle
	}
	
	public func nonZeroElements() -> FundamentalBaseVector {
		FBV(
			length: length.oneOrZero,
			duration: duration.oneOrZero,
			mass: mass.oneOrZero,
			current: current.oneOrZero,
			amount: amount.oneOrZero,
			temperature: temperature.oneOrZero,
			luminousIntensity: luminousIntensity.oneOrZero,
			angle: angle.oneOrZero,
			solidAngle: solidAngle.oneOrZero
		)
	}
	
	public func exp(_ xs: [Int], power: Double) -> (Bool, [Int]) {
		let ys = xs.map { pow(Double($0), power) }
		let out = !ys.filter { Double(Int($0)) != $0 }.isEmpty
		let ints = ys.map { Int($0) }
		
		return (out, ints)
	}
	
	static public func ∔ (left: FundamentalBaseVector, right: FundamentalBaseVector) -> FundamentalBaseVector {
		FBV(
			length: left.length + right.length,
			duration: left.duration + right.duration,
			mass: left.mass + right.mass,
			current: left.current + right.current,
			amount: left.amount + right.amount,
			temperature: left.temperature + right.temperature,
			luminousIntensity: left.luminousIntensity + right.luminousIntensity,
			angle: left.angle + right.angle,
			solidAngle: left.solidAngle + right.solidAngle
		)
	}
	
	public func projectsInto(multiplyUsedBaseVector z: FundamentalBaseVector) -> Bool {
		(length != 0 && 1 < z.length) ||
		(duration != 0 && 1 < z.duration) ||
		(mass != 0 && 1 < z.mass) ||
		(current != 0 && 1 < z.current) ||
		(amount != 0 && 1 < z.amount) ||
		(temperature != 0 && 1 < z.temperature) ||
		(luminousIntensity != 0 && 1 < z.luminousIntensity) ||
		(angle != 0 && 1 < z.angle) ||
		(solidAngle != 0 && 1 < z.solidAngle)
	}
	
}

fileprivate typealias FBV = FundamentalBaseVector

public let fundamentalBaseVector: [Dimension : FundamentalBaseVector] = [
	UnitAcceleration.baseUnit()                : FBV(length: 1, duration: -2),
	UnitActivity.baseUnit()                    : FBV(duration: -1, amount: 1),
	UnitAmount.baseUnit()                      : FBV(amount: 1),
	UnitAngle.baseUnit()                       : FBV(angle: 1),
	UnitAngularSpeed.baseUnit()                : FBV(duration: -1, angle: 1),
	UnitArea.baseUnit()                        : FBV(length: 2),
	UnitConcentrationMass.baseUnit()           : FBV(length: -3, mass: 1),
	UnitDuration.baseUnit()                    : FBV(duration: 1),
	UnitDynamicViscosity.baseUnit()            : FBV(length: -1, duration: -1, mass: 1),
	UnitElectricCapacitance.baseUnit()         : FBV(length: -2, duration: 4, mass: -1, current: 2),
	UnitElectricCharge.baseUnit()              : FBV(duration: 1, current: 1),
	UnitElectricConductance.baseUnit()         : FBV(length: -2, duration: 3, mass: -1, current: 2),
	UnitElectricCurrent.baseUnit()             : FBV(current: 1),
	UnitElectricInductance.baseUnit()          : FBV(length: 2, duration: -2, mass: 1, current: -2),
	UnitElectricPotentialDifference.baseUnit() : FBV(length: 2, duration: -3, mass: 1, current: -1),
	UnitElectricResistance.baseUnit()          : FBV(length: 2, duration: -3, mass: 1, current: -2),
	UnitEnergy.baseUnit()                      : FBV(length: 2, duration: -2, mass: 1),
	UnitForce.baseUnit()                       : FBV(length: 1, duration: -2, mass: 1),
	UnitFrequency.baseUnit()                   : FBV(duration: -1),
	UnitIlluminance.baseUnit()                 : FBV(length: -2, luminousIntensity: 1, solidAngle: 1),
	UnitIonizingRadiation.baseUnit()           : FBV(length: 2, duration: -2),
	UnitKinematicViscosity.baseUnit()          : FBV(length: 2, duration: -1),
	UnitLength.baseUnit()                      : FBV(length: 1),
	UnitLuminousFlux.baseUnit()                : FBV(luminousIntensity: 1, solidAngle: 1),
	UnitLuminousIntensity.baseUnit()           : FBV(luminousIntensity: 1),
	UnitMagneticFlux.baseUnit()                : FBV(length: 2, duration: -2, mass: 1, current: -1),
	UnitMagneticFluxDensity.baseUnit()         : FBV(duration: -2, mass: 1, current: -1),
	UnitMass.baseUnit()                        : FBV(mass: 1),
	UnitPower.baseUnit()                       : FBV(length: 2, duration: -3, mass: 1),
	UnitPressure.baseUnit()                    : FBV(length: -1, duration: -2, mass: 1),
	UnitSolidAngle.baseUnit()                  : FBV(solidAngle: 1),
	UnitSpeed.baseUnit()                       : FBV(length: 1, duration: -1),
	UnitTemperature.baseUnit()                 : FBV(temperature: 1),
	UnitVolume.baseUnit()                      : FBV(length: 3),
]

public extension Dimension {
	var dimensionSymbol: String {
		switch self {
			case is UnitAngle: "α"
			case is UnitLength: "L"
			case is UnitMass: "M"
			case is UnitDuration: "T"
			case is UnitElectricCurrent: "I"
			case is UnitTemperature: "Θ"
			case is UnitAmount: "N"
			case is UnitSolidAngle: "Ω"
			case is UnitIlluminance: "J"
			default: "?"
		}
	}
	
	func isCompositeDimension() -> Bool {
		return !fundamentalDimensions.contains(self)
	}
	
	var hasNonZeroOffset: Bool {
		(converter as? UnitConverterLinear)?.constant != 0
	}

}
