import Foundation


// NOT GENERATED:

public protocol PhysicalType: CustomStringConvertible {
	var physical: Physical { get set }
	init(values: [Double], unit: Dimension)
}

public func +<T: PhysicalType> (lhs: T, rhs: T) -> T {
	var out = lhs
	out.physical += rhs.physical
	return out
}
public func +=<T: PhysicalType> ( lhs: inout T, rhs: T) { lhs.physical += rhs.physical }
public func -=<T: PhysicalType> ( lhs: inout T, rhs: T) { lhs.physical -= rhs.physical }
public func *=<T: PhysicalType> ( lhs: inout T, rhs: T) { lhs.physical *= rhs.physical }
public func /=<T: PhysicalType> ( lhs: inout T, rhs: T) { lhs.physical /= rhs.physical }

public func == (lhs: any PhysicalType, rhs: any PhysicalType) -> Bool { lhs.physical == rhs.physical }
public func < (lhs: any PhysicalType, rhs: any PhysicalType) -> Bool { lhs.physical < rhs.physical }
public func <= (lhs: any PhysicalType, rhs: any PhysicalType) -> Bool { lhs.physical <= rhs.physical }

public func * (lhs: any PhysicalType, rhs: any PhysicalType) -> Physical { lhs.physical * rhs.physical }
public func * (lhs: any PhysicalType, rhs: Physical) -> Physical { lhs.physical * rhs }
public func * (lhs: Physical, rhs: any PhysicalType) -> Physical { lhs * rhs.physical }
public func / (lhs: any PhysicalType, rhs: any PhysicalType) -> Physical { lhs.physical / rhs.physical }
public func / (lhs: any PhysicalType, rhs: Physical) -> Physical { lhs.physical / rhs }
public func / (lhs: Physical, rhs: any PhysicalType) -> Physical { lhs / rhs.physical }
public func + (lhs: any PhysicalType, rhs: Physical) -> Physical { lhs.physical + rhs }
public func + (lhs: Physical, rhs: any PhysicalType) -> Physical { lhs + rhs.physical }
public func - (lhs: any PhysicalType, rhs: Physical) -> Physical { lhs.physical - rhs }
public func - (lhs: Physical, rhs: any PhysicalType) -> Physical { lhs - rhs.physical }
public func ^ (lhs: any PhysicalType, rhs: Double) -> Physical { lhs.physical ^ rhs }

public func *<T: PhysicalType> (lhs: T, rhs: Double) -> T {
	var out = lhs
	out.physical = lhs.physical * rhs
	return out
}
public func /<T: PhysicalType> (lhs: T, rhs: Double) -> T {
	var out = lhs
	out.physical = lhs.physical / rhs
	return out
}
public func *<T: PhysicalType> (lhs: T, rhs: [Double]) -> T? {
	if let newPhys = lhs.physical * rhs {
		var out = lhs
		out.physical = newPhys
		return out
	}
	
	return nil
}
public func *<T: PhysicalType> (lhs: Double, rhs: T) -> T { rhs * lhs }
public func *<T: PhysicalType> (lhs: [Double], rhs: T) -> T? { rhs * lhs }

public prefix func -<T: PhysicalType> (rhs: T) -> T {
	var out = rhs
	out.physical = -1 * rhs.physical
	return out
}

public func exp<T: PhysicalType> (_ number: T) -> T {
	var out = number
	out.physical = exp(number.physical)
	return out
}

public func vectorize<T: PhysicalType>(_ array: [T]) -> T? {
	if let item = array.first,
	   !item.physical.isUnitless {
		let values = array.map { $0.physical.value }
		return T(values: values, unit: item.physical.units.values.first!.unit)
	}
	return nil
}

// GENERATED:_______________________________________________________________________________________

public struct Acceleration: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.metersPerSecondSquared { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitAcceleration) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitAcceleration) { physical = Physical(values: reals, unit: unit) }
}
public struct Activity: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.becquerel { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitActivity) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitActivity) { physical = Physical(values: reals, unit: unit) }
}
public struct Amount: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.particles { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitAmount) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitAmount) { physical = Physical(values: reals, unit: unit) }
}
public struct Angle: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.degrees { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitAngle) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitAngle) { physical = Physical(values: reals, unit: unit) }
}
public struct AngularSpeed: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.revolutionsPerSecond { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitAngularSpeed) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitAngularSpeed) { physical = Physical(values: reals, unit: unit) }
}
public struct Area: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.squareMeters { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitArea) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitArea) { physical = Physical(values: reals, unit: unit) }
}
public struct ConcentrationMass: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.gramsPerLiter { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitConcentrationMass) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitConcentrationMass) { physical = Physical(values: reals, unit: unit) }
}
public struct Dispersion: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.partsPerMillion { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitDispersion) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitDispersion) { physical = Physical(values: reals, unit: unit) }
}
public struct Duration: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.seconds { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitDuration) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitDuration) { physical = Physical(values: reals, unit: unit) }
}
public struct ElectricCapacitance: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.farads { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricCapacitance) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitElectricCapacitance) { physical = Physical(values: reals, unit: unit) }
}
public struct ElectricCharge: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.coulombs { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricCharge) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitElectricCharge) { physical = Physical(values: reals, unit: unit) }
}
public struct ElectricConductance: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.siemens { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricConductance) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitElectricConductance) { physical = Physical(values: reals, unit: unit) }
}
public struct ElectricCurrent: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.amperes { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricCurrent) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitElectricCurrent) { physical = Physical(values: reals, unit: unit) }
}
public struct ElectricInductance: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.henries { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricInductance) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitElectricInductance) { physical = Physical(values: reals, unit: unit) }
}
public struct ElectricPotentialDifference: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.volts { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricPotentialDifference) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitElectricPotentialDifference) { physical = Physical(values: reals, unit: unit) }
}
public struct ElectricResistance: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.ohms { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricResistance) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitElectricResistance) { physical = Physical(values: reals, unit: unit) }
}
public struct Energy: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.joules { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitEnergy) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitEnergy) { physical = Physical(values: reals, unit: unit) }
}
public struct Force: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.newtons { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitForce) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitForce) { physical = Physical(values: reals, unit: unit) }
}
public struct Frequency: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.hertz { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitFrequency) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitFrequency) { physical = Physical(values: reals, unit: unit) }
}
public struct FuelEfficiency: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.litersPer100Kilometers { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitFuelEfficiency) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitFuelEfficiency) { physical = Physical(values: reals, unit: unit) }
}
public struct Illuminance: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.lux { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitIlluminance) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitIlluminance) { physical = Physical(values: reals, unit: unit) }
}
public struct InformationStorage: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.bytes { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitInformationStorage) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitInformationStorage) { physical = Physical(values: reals, unit: unit) }
}
public struct IonizingRadiation: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.grays { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitIonizingRadiation) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitIonizingRadiation) { physical = Physical(values: reals, unit: unit) }
}
public struct Length: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.meters { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitLength) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitLength) { physical = Physical(values: reals, unit: unit) }
}
public struct LuminousFlux: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.lumens { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitLuminousFlux) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitLuminousFlux) { physical = Physical(values: reals, unit: unit) }
}
public struct LuminousIntensity: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.candelas { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitLuminousIntensity) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitLuminousIntensity) { physical = Physical(values: reals, unit: unit) }
}
public struct MagneticFlux: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.webers { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitMagneticFlux) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitMagneticFlux) { physical = Physical(values: reals, unit: unit) }
}
public struct MagneticFluxDensity: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.teslas { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitMagneticFluxDensity) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitMagneticFluxDensity) { physical = Physical(values: reals, unit: unit) }
}
public struct Mass: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.kilograms { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitMass) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitMass) { physical = Physical(values: reals, unit: unit) }
}
public struct Power: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.watts { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitPower) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitPower) { physical = Physical(values: reals, unit: unit) }
}
public struct Pressure: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.newtonsPerMetersSquared { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitPressure) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitPressure) { physical = Physical(values: reals, unit: unit) }
}
public struct SolidAngle: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.steradians { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitSolidAngle) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitSolidAngle) { physical = Physical(values: reals, unit: unit) }
}
public struct Speed: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.metersPerSecond { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitSpeed) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitSpeed) { physical = Physical(values: reals, unit: unit) }
}
public struct Temperature: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.kelvin { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitTemperature) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitTemperature) { physical = Physical(values: reals, unit: unit) }
}
public struct Volume: PhysicalType {
	public var physical: Physical
	public var description: String { physical.description }
	public init(values: [Double], unit: Dimension) { physical = Physical(values: values, unit: unit) }
	public init?(_ y: Physical) { if y ~ 1.liters { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitVolume) { physical = Physical(value: real, unit: unit) }
	public init(_ reals: [Double], unit: UnitVolume) { physical = Physical(values: reals, unit: unit) }
}
