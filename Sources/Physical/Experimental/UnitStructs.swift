import Foundation

public class PhysicalUnit: Equatable, Comparable {
	public var physical: Physical = .notAThing
	public static func == (lhs: PhysicalUnit, rhs: PhysicalUnit) -> Bool { lhs.physical == rhs.physical }
	public static func < (lhs: PhysicalUnit, rhs: PhysicalUnit) -> Bool { lhs.physical < rhs.physical }
}

//public func *<T: PhysicalUnit>(lhs: PhysicalUnit, rhs: PhysicalUnit) -> T? { T(lhs.physical * rhs.physical) }
public func * (lhs: PhysicalUnit, rhs: PhysicalUnit) -> Physical { lhs.physical * rhs.physical }
public func * (lhs: PhysicalUnit, rhs: Physical) -> Physical { lhs.physical * rhs }
public func * (lhs: Physical, rhs: PhysicalUnit) -> Physical { lhs * rhs.physical }
public func / (lhs: PhysicalUnit, rhs: PhysicalUnit) -> Physical { lhs.physical / rhs.physical }
public func / (lhs: PhysicalUnit, rhs: Physical) -> Physical { lhs.physical / rhs }
public func / (lhs: Physical, rhs: PhysicalUnit) -> Physical { lhs / rhs.physical }
public func + (lhs: PhysicalUnit, rhs: PhysicalUnit) -> Physical { lhs.physical + rhs.physical }
public func + (lhs: PhysicalUnit, rhs: Physical) -> Physical { lhs.physical + rhs }
public func + (lhs: Physical, rhs: PhysicalUnit) -> Physical { lhs + rhs.physical }
public func - (lhs: PhysicalUnit, rhs: PhysicalUnit) -> Physical { lhs.physical - rhs.physical }
public func - (lhs: PhysicalUnit, rhs: Physical) -> Physical { lhs.physical - rhs }
public func - (lhs: Physical, rhs: PhysicalUnit) -> Physical { lhs - rhs.physical }
public func ^ (lhs: PhysicalUnit, rhs: Double) -> Physical { lhs.physical ^ rhs }

public class Acceleration: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.metersPerSecondSquared { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitAcceleration) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Activity: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.becquerel { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitActivity) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Amount: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.particles { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitAmount) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Angle: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.degrees { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitAngle) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class AngularSpeed: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.revolutionsPerSecond { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitAngularSpeed) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Area: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.squareMeters { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitArea) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class ConcentrationMass: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.gramsPerLiter { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitConcentrationMass) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Dispersion: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.partsPerMillion { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitDispersion) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Duration: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.seconds { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitDuration) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class ElectricCapacitance: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.farads { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricCapacitance) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class ElectricCharge: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.coulombs { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricCharge) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class ElectricConductance: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.siemens { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricConductance) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class ElectricCurrent: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.amperes { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricCurrent) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class ElectricInductance: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.henries { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricInductance) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class ElectricPotentialDifference: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.volts { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricPotentialDifference) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class ElectricResistance: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.ohms { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitElectricResistance) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Energy: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.joules { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitEnergy) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Force: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.newtons { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitForce) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Frequency: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.hertz { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitFrequency) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class FuelEfficiency: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.litersPer100Kilometers { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitFuelEfficiency) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Illuminance: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.lux { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitIlluminance) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class InformationStorage: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.bytes { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitInformationStorage) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class IonizingRadiation: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.grays { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitIonizingRadiation) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Length: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.meters { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitLength) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class LuminousFlux: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.lumens { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitLuminousFlux) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class LuminousIntensity: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.candelas { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitLuminousIntensity) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class MagneticFlux: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.webers { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitMagneticFlux) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class MagneticFluxDensity: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.teslas { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitMagneticFluxDensity) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Mass: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.kilograms { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitMass) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Power: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.watts { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitPower) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Pressure: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.newtonsPerMetersSquared { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitPressure) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class SolidAngle: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.steradians { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitSolidAngle) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Speed: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.metersPerSecond { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitSpeed) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Temperature: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.kelvin { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitTemperature) { super.init(); physical = Physical(value: real, unit: unit) }
}
public class Volume: PhysicalUnit {
	required public init?(_ y: Physical) { super.init(); if y ~ 1.liters { physical = y } else { return nil } }
	public init(_ real: Double, unit: UnitVolume) { super.init(); physical = Physical(value: real, unit: unit) }
}
