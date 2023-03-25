import Foundation

// Required for all additional Dimensions, both to existing Units and to custom new Units

public extension Dimension {
	func baseUnitCheck() -> Dimension? {
		switch self {
			// existing dimensions:
			case is UnitAngle: return UnitAngle.baseUnit()
			case is UnitArea: return UnitArea.baseUnit()
			case is UnitDuration: return UnitDuration.baseUnit()
			case is UnitEnergy: return UnitEnergy.baseUnit()
			case is UnitLength: return UnitLength.baseUnit()
			case is UnitMass: return UnitMass.baseUnit()
			case is UnitPressure: return UnitPressure.baseUnit()
			case is UnitTemperature: return UnitTemperature.baseUnit()
			
			// fully custom dimensions:
			case is UnitActivity: return UnitActivity.baseUnit()
			case is UnitAmount: return UnitAmount.baseUnit()
			case is UnitAngularSpeed: return UnitAngularSpeed.baseUnit()
			case is UnitElectricCapacitance: return UnitElectricCapacitance.baseUnit()
			case is UnitElectricConductance: return UnitElectricConductance.baseUnit()
			case is UnitElectricInductance: return UnitElectricInductance.baseUnit()
			case is UnitForce: return UnitForce.baseUnit()
			case is UnitIonizingRadiation: return UnitIonizingRadiation.baseUnit()
			case is UnitLuminousIntensity: return UnitLuminousIntensity.baseUnit()
			case is UnitLuminousFlux: return UnitLuminousFlux.baseUnit()
			case is UnitMagneticFlux: return UnitMagneticFlux.baseUnit()
			case is UnitMagneticFluxDensity: return UnitMagneticFluxDensity.baseUnit()
				
			default: return nil
		}
	}
}

// Additional Dimensions added to existing Units

public extension UnitAngle {
	// overrides: Foundation uses degrees as the base unit, and we wish to make it radians
	static let radians = UnitAngle(symbol: "rad", converter: UnitConverterLinear(coefficient: 1))
	static let gradians = UnitAngle(symbol: "gon", converter: UnitConverterLinear(coefficient: 1.π / 100))
	static let revolutions = UnitAngle(symbol: "rev", converter: UnitConverterLinear(coefficient: 2.π))
	static let degrees = UnitAngle(symbol: "°", converter: UnitConverterLinear(coefficient: 1.π / 180))
	
	// supplementary units:
	static let binaryRadians = UnitAngle(symbol: "brad", converter: UnitConverterLinear(coefficient: 9/10))
//	static let arcMinutes = UnitAngle(symbol: "′", converter: UnitConverterLinear(coefficient: 360/21600))
//	static let arcSeconds = UnitAngle(symbol: "″", converter: UnitConverterLinear(coefficient: 360/1_296_000))
	static let milliArcSeconds = UnitAngle(symbol: "mas", converter: UnitConverterLinear(coefficient: 360/1_296_000_000))
	static let microArcSeconds = UnitAngle(symbol: "μas", converter: UnitConverterLinear(coefficient: 360/1_296_000_000_000))
	
	override class func baseUnit() -> Self { UnitAngle.radians as! Self }
}

public extension UnitArea {
	static let barns = UnitArea(symbol: "b", converter: UnitConverterLinear(coefficient: 10e-28))
}

public extension UnitDuration {
	static let days = UnitDuration(symbol: "d", converter: UnitConverterLinear(coefficient: 86_400))
	static let years = UnitDuration(symbol: "yr", converter: UnitConverterLinear(coefficient: 31_556_952))
	static let kiloannum = UnitDuration(symbol: "ka", converter: UnitConverterLinear(coefficient: 31_556_952e3))
	static let megaannum = UnitDuration(symbol: "Ma", converter: UnitConverterLinear(coefficient: 31_556_952e6))
	static let gigaannum = UnitDuration(symbol: "Ga", converter: UnitConverterLinear(coefficient: 31_556_952e9))
	static let teraannum = UnitDuration(symbol: "Ta", converter: UnitConverterLinear(coefficient: 31_556_952e12))
	static let petaannum = UnitDuration(symbol: "Pa", converter: UnitConverterLinear(coefficient: 31_556_952e15))
	static let exaannum = UnitDuration(symbol: "Ea", converter: UnitConverterLinear(coefficient: 31_556_952e18))
}

public extension UnitEnergy {
	static let ergs = UnitEnergy(symbol: "erg", converter: UnitConverterLinear(coefficient: 1e-7))
	static let britishThermalUnits = UnitEnergy(symbol: "btu", converter: UnitConverterLinear(coefficient: 1055.06))
	static let electronvolts = UnitEnergy(symbol: "eV", converter: UnitConverterLinear(coefficient: 1.602176634e-19))
}

public extension UnitLength {
	static let angstroms = UnitLength(symbol: "Å", converter: UnitConverterLinear(coefficient: 10e-10))
}

public extension UnitMass {
	static let daltons = UnitMass(symbol: "Da", converter: UnitConverterLinear(coefficient: 1.6605390666e-27))
}

public extension UnitPressure {
	static let pascals = UnitPressure(symbol: "Pa", converter: UnitConverterLinear(coefficient: 1))
	static let atmosphericPressure = UnitPressure(symbol: "atm", converter: UnitConverterLinear(coefficient: 101_325))
}

// Rankine units require a special unit converter (i think)

public extension UnitTemperature {
	static let rankine = UnitTemperature(symbol: "°R", converter: UnitConverterLinear(coefficient: 5/9))
}

// Original Dimensions

public final class UnitActivity: Dimension {
	public static let becquerel = UnitActivity(symbol: "Bq", converter: UnitConverterLinear(coefficient: 1))
	public static let curie = UnitActivity(symbol: "Ci", converter: UnitConverterLinear(coefficient: 3.7e10))
	public static let rutherford = UnitActivity(symbol: "Rd", converter: UnitConverterLinear(coefficient: 1e6))
	
	public override class func baseUnit() -> UnitActivity { becquerel }
}

public final class UnitAmount: Dimension {
	public static let particles = UnitAmount(symbol: "particles", converter: UnitConverterLinear(coefficient: 1))
	public static let atoms = UnitAmount(symbol: "atoms", converter: UnitConverterLinear(coefficient: 1))
	public static let beings = UnitAmount(symbol: "beings", converter: UnitConverterLinear(coefficient: 1))
	public static let people = UnitAmount(symbol: "people", converter: UnitConverterLinear(coefficient: 1))
	public static let things = UnitAmount(symbol: "things", converter: UnitConverterLinear(coefficient: 1))
	public static let moles = UnitAmount(symbol: "mol", converter: UnitConverterLinear(coefficient: 31556952.0))
	
	public override class func baseUnit() -> UnitAmount { things }
}

public final class UnitAngularSpeed: Dimension {
	public static let revolutionsPerMinute = UnitAngularSpeed(symbol: "rpm", converter: UnitConverterLinear(coefficient: 2.π/60))
	public static let revolutionsPerSecond = UnitAngularSpeed(symbol: "rev/s", converter: UnitConverterLinear(coefficient: 2.π))
	public static let radiansPerSecond = UnitAngularSpeed(symbol: "rad/s", converter: UnitConverterLinear(coefficient: 1))
	public static let degreesPerSecond = UnitAngularSpeed(symbol: "°/s", converter: UnitConverterLinear(coefficient: 2.π/360))
	
	public override class func baseUnit() -> UnitAngularSpeed { radiansPerSecond }
}

public final class UnitElectricCapacitance: Dimension {
	public static let farads = UnitElectricCapacitance(symbol: "F", converter: UnitConverterLinear(coefficient: 1))
	
	public override class func baseUnit() -> UnitElectricCapacitance { farads }
}

public final class UnitElectricConductance: Dimension {
	public static let siemens = UnitElectricConductance(symbol: "S", converter: UnitConverterLinear(coefficient: 1))
	
	public override class func baseUnit() -> UnitElectricConductance { siemens }
}

public final class UnitElectricInductance: Dimension {
	public static let henries = UnitElectricInductance(symbol: "H", converter: UnitConverterLinear(coefficient: 1))
	
	public override class func baseUnit() -> UnitElectricInductance { henries }
}

public final class UnitForce: Dimension {
	public static let newtons = UnitForce(symbol: "N", converter: UnitConverterLinear(coefficient: 1))
	public static let poundsForce = UnitForce(symbol: "lbf", converter: UnitConverterLinear(coefficient: 4.448222))
	public static let dynes = UnitForce(symbol: "dyn", converter: UnitConverterLinear(coefficient: 1e-5))
	public static let poundals = UnitForce(symbol: "pdl", converter: UnitConverterLinear(coefficient:  0.138_255))
	public static let kips = UnitForce(symbol: "kip", converter: UnitConverterLinear(coefficient: 4_448.22))
	public static let kilogramForce = UnitForce(symbol: "kgf", converter: UnitConverterLinear(coefficient: 9.806650))
	
	public override class func baseUnit() -> UnitForce { newtons }
}

public final class UnitIonizingRadiation: Dimension {
	public static let grays = UnitIonizingRadiation(symbol: "Gy", converter: UnitConverterLinear(coefficient: 1))
	public static let sieverts = UnitIonizingRadiation(symbol: "Sv", converter: UnitConverterLinear(coefficient: 1))

	public override class func baseUnit() -> UnitIonizingRadiation { grays }
}

public final class UnitLuminousIntensity: Dimension {
	public static let candelas = UnitLuminousIntensity(symbol: "cd", converter: UnitConverterLinear(coefficient: 1))
	
	public override class func baseUnit() -> UnitLuminousIntensity { candelas }
}

public final class UnitLuminousFlux: Dimension {
	public static let lumens = UnitLuminousFlux(symbol: "lm", converter: UnitConverterLinear(coefficient: 1))
	
	public override class func baseUnit() -> UnitLuminousFlux { lumens }
}

public final class UnitMagneticFlux: Dimension {
	public static let webers = UnitMagneticFlux(symbol: "Wb", converter: UnitConverterLinear(coefficient: 1))
	
	public override class func baseUnit() -> UnitMagneticFlux { webers }
}

public final class UnitMagneticFluxDensity: Dimension {
	public static let teslas = UnitMagneticFluxDensity(symbol: "T", converter: UnitConverterLinear(coefficient: 1))
	public static let gauss = UnitMagneticFluxDensity(symbol: "Gs", converter: UnitConverterLinear(coefficient: 10e-4))
	
	public override class func baseUnit() -> UnitMagneticFluxDensity { teslas }
}

public final class UnitSolidAngle: Dimension {
	public static let steradians = UnitSolidAngle(symbol: "sr")
	public static let squareDegrees = UnitSolidAngle(symbol: "deg²", converter: UnitConverterLinear(coefficient: 3.04617e-4))
	
	public override class func baseUnit() -> UnitSolidAngle { steradians }
}
