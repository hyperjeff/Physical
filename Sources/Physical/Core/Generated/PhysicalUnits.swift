import Foundation

public extension Physical {
	
	func merge(with: Physical) -> Physical {
		if invertSuffixes {
			var out = self / with
			out.invertSuffixes = true
			return out
		}
		else {
			return self * with
		}
	}
	
	// Custom and Extended units (✔︎ now automated)
	
	var binaryRadians: Physical { binaryRadians(1) }
	func binaryRadians(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.binaryRadians, exponent)], sigfigs: sigfigs))
	}
	
	var milliArcSeconds: Physical { milliArcSeconds(1) }
	func milliArcSeconds(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.milliArcSeconds, exponent)], sigfigs: sigfigs))
	}
	
	var microArcSeconds: Physical { microArcSeconds(1) }
	func microArcSeconds(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.microArcSeconds, exponent)], sigfigs: sigfigs))
	}
	
	var barns: Physical { barns(1) }
	func barns(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.barns, exponent)], sigfigs: sigfigs))
	}
	
	var days: Physical { days(1) }
	func days(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.days, exponent)], sigfigs: sigfigs))
	}
	
	var years: Physical { years(1) }
	func years(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.years, exponent)], sigfigs: sigfigs))
	}
	
	var kiloannum: Physical { kiloannum(1) }
	func kiloannum(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.kiloannum, exponent)], sigfigs: sigfigs))
	}
	
	var megaannum: Physical { megaannum(1) }
	func megaannum(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.megaannum, exponent)], sigfigs: sigfigs))
	}
	
	var gigaannum: Physical { gigaannum(1) }
	func gigaannum(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.gigaannum, exponent)], sigfigs: sigfigs))
	}
	
	var teraannum: Physical { teraannum(1) }
	func teraannum(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.teraannum, exponent)], sigfigs: sigfigs))
	}
	
	var petaannum: Physical { petaannum(1) }
	func petaannum(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.petaannum, exponent)], sigfigs: sigfigs))
	}
	
	var exaannum: Physical { exaannum(1) }
	func exaannum(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.exaannum, exponent)], sigfigs: sigfigs))
	}
	
	var ergs: Physical { ergs(1) }
	func ergs(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.ergs, exponent)], sigfigs: sigfigs))
	}
	
	var britishThermalUnits: Physical { britishThermalUnits(1) }
	func britishThermalUnits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.britishThermalUnits, exponent)], sigfigs: sigfigs))
	}
	
	var electronvolts: Physical { electronvolts(1) }
	func electronvolts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.electronvolts, exponent)], sigfigs: sigfigs))
	}
	
	var angstroms: Physical { angstroms(1) }
	func angstroms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.angstroms, exponent)], sigfigs: sigfigs))
	}
	
	var daltons: Physical { daltons(1) }
	func daltons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.daltons, exponent)], sigfigs: sigfigs))
	}
	
	var pascals: Physical { pascals(1) }
	func pascals(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.pascals, exponent)], sigfigs: sigfigs))
	}
	
	var atmosphericPressure: Physical { atmosphericPressure(1) }
	func atmosphericPressure(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.atmosphericPressure, exponent)], sigfigs: sigfigs))
	}
	
	var rankine: Physical { rankine(1) }
	func rankine(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitTemperature.rankine, exponent)], sigfigs: sigfigs))
	}
	
	var particles: Physical { particles(1) }
	func particles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAmount.particles, exponent)], sigfigs: sigfigs))
	}
	
	var moles: Physical { moles(1) }
	func moles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAmount.moles, exponent)], sigfigs: sigfigs))
	}
	
	var revolutionsPerSecond: Physical { revolutionsPerSecond(1) }
	func revolutionsPerSecond(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngularSpeed.revolutionsPerSecond, exponent)], sigfigs: sigfigs))
	}
	
	var radiansPerSecond: Physical { radiansPerSecond(1) }
	func radiansPerSecond(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngularSpeed.radiansPerSecond, exponent)], sigfigs: sigfigs))
	}
	
	var degreesPerSecond: Physical { degreesPerSecond(1) }
	func degreesPerSecond(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngularSpeed.degreesPerSecond, exponent)], sigfigs: sigfigs))
	}
	
	var farads: Physical { farads(1) }
	func farads(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCapacitance.farads, exponent)], sigfigs: sigfigs))
	}
	
	var siemens: Physical { siemens(1) }
	func siemens(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricConductance.siemens, exponent)], sigfigs: sigfigs))
	}
	
	var henries: Physical { henries(1) }
	func henries(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricInductance.henries, exponent)], sigfigs: sigfigs))
	}
	
	var newtons: Physical { newtons(1) }
	func newtons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitForce.newtons, exponent)], sigfigs: sigfigs))
	}
	
	var poundsForce: Physical { poundsForce(1) }
	func poundsForce(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitForce.poundsForce, exponent)], sigfigs: sigfigs))
	}
	
	var dynes: Physical { dynes(1) }
	func dynes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitForce.dynes, exponent)], sigfigs: sigfigs))
	}
	
	var poundals: Physical { poundals(1) }
	func poundals(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitForce.poundals, exponent)], sigfigs: sigfigs))
	}
	
	var kips: Physical { kips(1) }
	func kips(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitForce.kips, exponent)], sigfigs: sigfigs))
	}
	
	var kilogramForce: Physical { kilogramForce(1) }
	func kilogramForce(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitForce.kilogramForce, exponent)], sigfigs: sigfigs))
	}
	
	var grays: Physical { grays(1) }
	func grays(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitIonizingRadiation.grays, exponent)], sigfigs: sigfigs))
	}
	
	var sieverts: Physical { sieverts(1) }
	func sieverts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitIonizingRadiation.sieverts, exponent)], sigfigs: sigfigs))
	}
	
	var candelas: Physical { candelas(1) }
	func candelas(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLuminousIntensity.candelas, exponent)], sigfigs: sigfigs))
	}
	
	var lumens: Physical { lumens(1) }
	func lumens(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLuminousFlux.lumens, exponent)], sigfigs: sigfigs))
	}
	
	var webers: Physical { webers(1) }
	func webers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMagneticFlux.webers, exponent)], sigfigs: sigfigs))
	}
	
	var teslas: Physical { teslas(1) }
	func teslas(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMagneticFluxDensity.teslas, exponent)], sigfigs: sigfigs))
	}
	
	var gauss: Physical { gauss(1) }
	func gauss(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMagneticFluxDensity.gauss, exponent)], sigfigs: sigfigs))
	}
	
	var steradians: Physical { steradians(1) }
	func steradians(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitSolidAngle.steradians, exponent)], sigfigs: sigfigs))
	}

	var squareDegrees: Physical { squareDegrees(1) }
	func squareDegrees(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitSolidAngle.squareDegrees, exponent)], sigfigs: sigfigs))
	}
	
	// Hand-picked convenience units  (✔︎ now automated)
	//
	// also see:  https://github.com/apple/swift-corelibs-foundation/blob/8a0ed08449db6b7175f7f0c9a677591ff8ef64c8/Sources/Foundation/Unit.swift
	
	var hr: Physical { hours(1) }
	func hrs(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.hours, exponent)], sigfigs: sigfigs))
	}
	
	var min: Physical { minutes(1) }
	func min(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.minutes, exponent)], sigfigs: sigfigs))
	}
	
	var s: Physical { seconds(1) }
	func s(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.seconds, exponent)], sigfigs: sigfigs))
	}
	
	var sec: Physical { seconds(1) }
	func sec(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.seconds, exponent)], sigfigs: sigfigs))
	}
	
	var ms: Physical { milliseconds(1) }
	func ms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.milliseconds, exponent)], sigfigs: sigfigs))
	}
	
	var μs: Physical { microseconds(1) }
	func μs(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.microseconds, exponent)], sigfigs: sigfigs))
	}
	
	var ns: Physical { nanoseconds(1) }
	func ns(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.nanoseconds, exponent)], sigfigs: sigfigs))
	}
	
	var ps: Physical { picoseconds(1) }
	func ps(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.picoseconds, exponent)], sigfigs: sigfigs))
	}
	
	var F: Physical { farads(1) }
	func F(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCapacitance.farads, exponent)], sigfigs: sigfigs))
	}
	
	var C: Physical { coulombs(1) }
	func C(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCharge.coulombs, exponent)], sigfigs: sigfigs))
	}
	
	var A: Physical { amperes(1) }
	func A(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCurrent.amperes, exponent)], sigfigs: sigfigs))
	}
	
	var MV: Physical { megavolts(1) }
	func MV(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.megavolts, exponent)], sigfigs: sigfigs))
	}
	
	var kV: Physical { kilovolts(1) }
	func kV(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.kilovolts, exponent)], sigfigs: sigfigs))
	}
	
	var V: Physical { volts(1) }
	func V(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.volts, exponent)], sigfigs: sigfigs))
	}
	
	var mV: Physical { millivolts(1) }
	func mV(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.millivolts, exponent)], sigfigs: sigfigs))
	}
	
	var μV: Physical { microvolts(1) }
	func μV(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.microvolts, exponent)], sigfigs: sigfigs))
	}
	
	var Ω: Physical { ohms(1) }
	func Ω(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricResistance.ohms, exponent)], sigfigs: sigfigs))
	}
	
	var J: Physical { joules(1) }
	func J(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.joules, exponent)], sigfigs: sigfigs))
	}
	
	var cal: Physical { calories(1) }
	func cal(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.calories, exponent)], sigfigs: sigfigs))
	}
	
	var kWh: Physical { kilowattHours(1) }
	func kWh(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.kilowattHours, exponent)], sigfigs: sigfigs))
	}
	
	var bTU: Physical { britishThermalUnits(1) }
	func bTU(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.britishThermalUnits, exponent)], sigfigs: sigfigs))
	}
	
	var eV: Physical { electronvolts(1) }
	func eV(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.electronvolts, exponent)], sigfigs: sigfigs))
	}
	
	var N: Physical { newtons(1) }
	func N(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitForce.newtons, exponent)], sigfigs: sigfigs))
	}
	
	var THz: Physical { terahertz(1) }
	func THz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.terahertz, exponent)], sigfigs: sigfigs))
	}
	
	var GHz: Physical { gigahertz(1) }
	func GHz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.gigahertz, exponent)], sigfigs: sigfigs))
	}
	
	var MHz: Physical { megahertz(1) }
	func MHz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.megahertz, exponent)], sigfigs: sigfigs))
	}
	
	var kHz: Physical { kilohertz(1) }
	func kHz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.kilohertz, exponent)], sigfigs: sigfigs))
	}
	
	var Hz: Physical { hertz(1) }
	func Hz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.hertz, exponent)], sigfigs: sigfigs))
	}
	
	var fps: Physical { framesPerSecond(1) }
	func fps(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.framesPerSecond, exponent)], sigfigs: sigfigs))
	}
	
	var m: Physical { meters(1) }
	func m(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.meters, exponent)], sigfigs: sigfigs))
	}
	
	var cm: Physical { centimeters(1) }
	func cm(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.centimeters, exponent)], sigfigs: sigfigs))
	}
	
	var mm: Physical { millimeters(1) }
	func mm(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.millimeters, exponent)], sigfigs: sigfigs))
	}
	
	var μm: Physical { micrometers(1) }
	func μm(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.micrometers, exponent)], sigfigs: sigfigs))
	}
	
	var nm: Physical { nanometers(1) }
	func nm(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.nanometers, exponent)], sigfigs: sigfigs))
	}
	
	var pm: Physical { picometers(1) }
	func pm(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.picometers, exponent)], sigfigs: sigfigs))
	}
	
	var kg: Physical { kilograms(1) }
	func kg(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.kilograms, exponent)], sigfigs: sigfigs))
	}
	
	var g: Physical { grams(1) }
	func g(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.grams, exponent)], sigfigs: sigfigs))
	}
	
	var dg: Physical { decigrams(1) }
	func dg(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.decigrams, exponent)], sigfigs: sigfigs))
	}
	
	var cg: Physical { centigrams(1) }
	func cg(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.centigrams, exponent)], sigfigs: sigfigs))
	}
	
	var mg: Physical { milligrams(1) }
	func mg(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.milligrams, exponent)], sigfigs: sigfigs))
	}
	
	var μg: Physical { micrograms(1) }
	func μg(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.micrograms, exponent)], sigfigs: sigfigs))
	}
	
	var ng: Physical { nanograms(1) }
	func ng(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.nanograms, exponent)], sigfigs: sigfigs))
	}
	
	var pg: Physical { picograms(1) }
	func pg(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.picograms, exponent)], sigfigs: sigfigs))
	}
	
	var oz: Physical { ounces(1) }
	func oz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.ounces, exponent)], sigfigs: sigfigs))
	}
	
	var TW: Physical { terawatts(1) }
	func TW(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.terawatts, exponent)], sigfigs: sigfigs))
	}
	
	var GW: Physical { gigawatts(1) }
	func GW(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.gigawatts, exponent)], sigfigs: sigfigs))
	}
	
	var MW: Physical { megawatts(1) }
	func MW(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.megawatts, exponent)], sigfigs: sigfigs))
	}
	
	var kW: Physical { kilowatts(1) }
	func kW(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.kilowatts, exponent)], sigfigs: sigfigs))
	}
	
	var W: Physical { watts(1) }
	func W(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.watts, exponent)], sigfigs: sigfigs))
	}
	
	var mW: Physical { milliwatts(1) }
	func mW(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.milliwatts, exponent)], sigfigs: sigfigs))
	}
	
	var μW: Physical { microwatts(1) }
	func μW(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.microwatts, exponent)], sigfigs: sigfigs))
	}
	
	var nW: Physical { nanowatts(1) }
	func nW(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.nanowatts, exponent)], sigfigs: sigfigs))
	}
	
	var pW: Physical { picowatts(1) }
	func pW(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.picowatts, exponent)], sigfigs: sigfigs))
	}
	
	var fW: Physical { femtowatts(1) }
	func fW(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.femtowatts, exponent)], sigfigs: sigfigs))
	}
	
	var hp: Physical { horsepower(1) }
	func hp(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.horsepower, exponent)], sigfigs: sigfigs))
	}
	
	var mps: Physical { metersPerSecond(1) }
	func mps(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitSpeed.metersPerSecond, exponent)], sigfigs: sigfigs))
	}
	
	var kph: Physical { kilometersPerHour(1) }
	func kph(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitSpeed.kilometersPerHour, exponent)], sigfigs: sigfigs))
	}
	
	var mph: Physical { milesPerHour(1) }
	func mph(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitSpeed.milesPerHour, exponent)], sigfigs: sigfigs))
	}
	
	var K: Physical { kelvin(1) }
	func K(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitTemperature.kelvin, exponent)], sigfigs: sigfigs))
	}
	
	var ML: Physical { megaliters(1) }
	func ML(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.megaliters, exponent)], sigfigs: sigfigs))
	}
	
	var kL: Physical { kiloliters(1) }
	func kL(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.kiloliters, exponent)], sigfigs: sigfigs))
	}
	
	var L: Physical { liters(1) }
	func L(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.liters, exponent)], sigfigs: sigfigs))
	}
	
	var dL: Physical { deciliters(1) }
	func dL(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.deciliters, exponent)], sigfigs: sigfigs))
	}
	
	var cL: Physical { centiliters(1) }
	func cL(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.centiliters, exponent)], sigfigs: sigfigs))
	}
	
	var mL: Physical { milliliters(1) }
	func mL(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.milliliters, exponent)], sigfigs: sigfigs))
	}
	
	
	// Exponentiated units  (✔︎ now automated)
	
	var s²: Physical { seconds(2) }
	var s³: Physical { seconds(3) }
	var s⁴: Physical { seconds(4) }
	var s⁵: Physical { seconds(5) }
	var A²: Physical { amperes(2) }
	var A³: Physical { amperes(3) }
	var A⁴: Physical { amperes(4) }
	var A⁵: Physical { amperes(5) }
	var V²: Physical { volts(2) }
	var V³: Physical { volts(3) }
	var V⁴: Physical { volts(4) }
	var V⁵: Physical { volts(5) }
	var J²: Physical { joules(2) }
	var J³: Physical { joules(3) }
	var J⁴: Physical { joules(4) }
	var J⁵: Physical { joules(5) }
	var N²: Physical { newtons(2) }
	var N³: Physical { newtons(3) }
	var N⁴: Physical { newtons(4) }
	var N⁵: Physical { newtons(5) }
	var m²: Physical { meters(2) }
	var m³: Physical { meters(3) }
	var m⁴: Physical { meters(4) }
	var m⁵: Physical { meters(5) }
	var kg²: Physical { kilograms(2) }
	var kg³: Physical { kilograms(3) }
	var kg⁴: Physical { kilograms(4) }
	var kg⁵: Physical { kilograms(5) }
	var K²: Physical { kelvin(2) }
	var K³: Physical { kelvin(3) }
	var K⁴: Physical { kelvin(4) }
	var K⁵: Physical { kelvin(5) }
	var C²: Physical { celsius(2) }
	var C³: Physical { celsius(3) }
	var C⁴: Physical { celsius(4) }
	var C⁵: Physical { celsius(5) }
	var F²: Physical { fahrenheit(2) }
	var F³: Physical { fahrenheit(3) }
	var F⁴: Physical { fahrenheit(4) }
	var F⁵: Physical { fahrenheit(5) }
	var L²: Physical { liters(2) }
	var L³: Physical { liters(3) }
	var L⁴: Physical { liters(4) }
	var L⁵: Physical { liters(5) }
	
	// Extracted properties from NSUnit.h (✔︎ now automated)
	// Raw units
	
	// special case!: UnitMass.poundsMass → UnitMass.pound
	
	var metersPerSecondSquared: Physical { metersPerSecondSquared(1) }
	func metersPerSecondSquared(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAcceleration.metersPerSecondSquared, exponent)], sigfigs: sigfigs))
	}
	
	var gravity: Physical { gravity(1) }
	func gravity(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAcceleration.gravity, exponent)], sigfigs: sigfigs))
	}
	
	var degrees: Physical { degrees(1) }
	func degrees(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.degrees, exponent)], sigfigs: sigfigs))
	}
	
	var arcMinutes: Physical { arcMinutes(1) }
	func arcMinutes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.arcMinutes, exponent)], sigfigs: sigfigs))
	}
	
	var arcSeconds: Physical { arcSeconds(1) }
	func arcSeconds(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.arcSeconds, exponent)], sigfigs: sigfigs))
	}
	
	var radians: Physical { radians(1) }
	func radians(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.radians, exponent)], sigfigs: sigfigs))
	}
	
	var gradians: Physical { gradians(1) }
	func gradians(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.gradians, exponent)], sigfigs: sigfigs))
	}
	
	var revolutions: Physical { revolutions(1) }
	func revolutions(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.revolutions, exponent)], sigfigs: sigfigs))
	}
	
	var squareMegameters: Physical { squareMegameters(1) }
	func squareMegameters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareMegameters, exponent)], sigfigs: sigfigs))
	}
	
	var squareKilometers: Physical { squareKilometers(1) }
	func squareKilometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareKilometers, exponent)], sigfigs: sigfigs))
	}
	
	var squareMeters: Physical { squareMeters(1) }
	func squareMeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareMeters, exponent)], sigfigs: sigfigs))
	}
	
	var squareCentimeters: Physical { squareCentimeters(1) }
	func squareCentimeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareCentimeters, exponent)], sigfigs: sigfigs))
	}
	
	var squareMillimeters: Physical { squareMillimeters(1) }
	func squareMillimeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareMillimeters, exponent)], sigfigs: sigfigs))
	}
	
	var squareMicrometers: Physical { squareMicrometers(1) }
	func squareMicrometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareMicrometers, exponent)], sigfigs: sigfigs))
	}
	
	var squareNanometers: Physical { squareNanometers(1) }
	func squareNanometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareNanometers, exponent)], sigfigs: sigfigs))
	}
	
	var squareInches: Physical { squareInches(1) }
	func squareInches(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareInches, exponent)], sigfigs: sigfigs))
	}
	
	var squareFeet: Physical { squareFeet(1) }
	func squareFeet(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareFeet, exponent)], sigfigs: sigfigs))
	}
	
	var squareYards: Physical { squareYards(1) }
	func squareYards(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareYards, exponent)], sigfigs: sigfigs))
	}
	
	var squareMiles: Physical { squareMiles(1) }
	func squareMiles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.squareMiles, exponent)], sigfigs: sigfigs))
	}
	
	var acres: Physical { acres(1) }
	func acres(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.acres, exponent)], sigfigs: sigfigs))
	}
	
	var ares: Physical { ares(1) }
	func ares(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.ares, exponent)], sigfigs: sigfigs))
	}
	
	var hectares: Physical { hectares(1) }
	func hectares(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitArea.hectares, exponent)], sigfigs: sigfigs))
	}
	
	var gramsPerLiter: Physical { gramsPerLiter(1) }
	func gramsPerLiter(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitConcentrationMass.gramsPerLiter, exponent)], sigfigs: sigfigs))
	}
	
	var milligramsPerDeciliter: Physical { milligramsPerDeciliter(1) }
	func milligramsPerDeciliter(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitConcentrationMass.milligramsPerDeciliter, exponent)], sigfigs: sigfigs))
	}
	
	var partsPerMillion: Physical { partsPerMillion(1) }
	func partsPerMillion(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDispersion.partsPerMillion, exponent)], sigfigs: sigfigs))
	}
	
	var hours: Physical { hours(1) }
	func hours(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.hours, exponent)], sigfigs: sigfigs))
	}
	
	var minutes: Physical { minutes(1) }
	func minutes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.minutes, exponent)], sigfigs: sigfigs))
	}
	
	var seconds: Physical { seconds(1) }
	func seconds(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.seconds, exponent)], sigfigs: sigfigs))
	}
	
	var milliseconds: Physical { milliseconds(1) }
	func milliseconds(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.milliseconds, exponent)], sigfigs: sigfigs))
	}
	
	var microseconds: Physical { microseconds(1) }
	func microseconds(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.microseconds, exponent)], sigfigs: sigfigs))
	}
	
	var nanoseconds: Physical { nanoseconds(1) }
	func nanoseconds(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.nanoseconds, exponent)], sigfigs: sigfigs))
	}
	
	var picoseconds: Physical { picoseconds(1) }
	func picoseconds(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitDuration.picoseconds, exponent)], sigfigs: sigfigs))
	}
	
	var coulombs: Physical { coulombs(1) }
	func coulombs(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCharge.coulombs, exponent)], sigfigs: sigfigs))
	}
	
	var megaampereHours: Physical { megaampereHours(1) }
	func megaampereHours(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCharge.megaampereHours, exponent)], sigfigs: sigfigs))
	}
	
	var kiloampereHours: Physical { kiloampereHours(1) }
	func kiloampereHours(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCharge.kiloampereHours, exponent)], sigfigs: sigfigs))
	}
	
	var ampereHours: Physical { ampereHours(1) }
	func ampereHours(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCharge.ampereHours, exponent)], sigfigs: sigfigs))
	}
	
	var milliampereHours: Physical { milliampereHours(1) }
	func milliampereHours(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCharge.milliampereHours, exponent)], sigfigs: sigfigs))
	}
	
	var microampereHours: Physical { microampereHours(1) }
	func microampereHours(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCharge.microampereHours, exponent)], sigfigs: sigfigs))
	}
	
	var megaamperes: Physical { megaamperes(1) }
	func megaamperes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCurrent.megaamperes, exponent)], sigfigs: sigfigs))
	}
	
	var kiloamperes: Physical { kiloamperes(1) }
	func kiloamperes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCurrent.kiloamperes, exponent)], sigfigs: sigfigs))
	}
	
	var amperes: Physical { amperes(1) }
	func amperes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCurrent.amperes, exponent)], sigfigs: sigfigs))
	}
	
	var milliamperes: Physical { milliamperes(1) }
	func milliamperes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCurrent.milliamperes, exponent)], sigfigs: sigfigs))
	}
	
	var microamperes: Physical { microamperes(1) }
	func microamperes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricCurrent.microamperes, exponent)], sigfigs: sigfigs))
	}
	
	var megavolts: Physical { megavolts(1) }
	func megavolts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.megavolts, exponent)], sigfigs: sigfigs))
	}
	
	var kilovolts: Physical { kilovolts(1) }
	func kilovolts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.kilovolts, exponent)], sigfigs: sigfigs))
	}
	
	var volts: Physical { volts(1) }
	func volts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.volts, exponent)], sigfigs: sigfigs))
	}
	
	var millivolts: Physical { millivolts(1) }
	func millivolts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.millivolts, exponent)], sigfigs: sigfigs))
	}
	
	var microvolts: Physical { microvolts(1) }
	func microvolts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricPotentialDifference.microvolts, exponent)], sigfigs: sigfigs))
	}
	
	var megaohms: Physical { megaohms(1) }
	func megaohms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricResistance.megaohms, exponent)], sigfigs: sigfigs))
	}
	
	var kiloohms: Physical { kiloohms(1) }
	func kiloohms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricResistance.kiloohms, exponent)], sigfigs: sigfigs))
	}
	
	var ohms: Physical { ohms(1) }
	func ohms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricResistance.ohms, exponent)], sigfigs: sigfigs))
	}
	
	var milliohms: Physical { milliohms(1) }
	func milliohms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricResistance.milliohms, exponent)], sigfigs: sigfigs))
	}
	
	var microohms: Physical { microohms(1) }
	func microohms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitElectricResistance.microohms, exponent)], sigfigs: sigfigs))
	}
	
	var kilojoules: Physical { kilojoules(1) }
	func kilojoules(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.kilojoules, exponent)], sigfigs: sigfigs))
	}
	
	var joules: Physical { joules(1) }
	func joules(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.joules, exponent)], sigfigs: sigfigs))
	}
	
	var kilocalories: Physical { kilocalories(1) }
	func kilocalories(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.kilocalories, exponent)], sigfigs: sigfigs))
	}
	
	var calories: Physical { calories(1) }
	func calories(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.calories, exponent)], sigfigs: sigfigs))
	}
	
	var kilowattHours: Physical { kilowattHours(1) }
	func kilowattHours(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitEnergy.kilowattHours, exponent)], sigfigs: sigfigs))
	}
	
	var terahertz: Physical { terahertz(1) }
	func terahertz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.terahertz, exponent)], sigfigs: sigfigs))
	}
	
	var gigahertz: Physical { gigahertz(1) }
	func gigahertz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.gigahertz, exponent)], sigfigs: sigfigs))
	}
	
	var megahertz: Physical { megahertz(1) }
	func megahertz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.megahertz, exponent)], sigfigs: sigfigs))
	}
	
	var kilohertz: Physical { kilohertz(1) }
	func kilohertz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.kilohertz, exponent)], sigfigs: sigfigs))
	}
	
	var hertz: Physical { hertz(1) }
	func hertz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.hertz, exponent)], sigfigs: sigfigs))
	}
	
	var millihertz: Physical { millihertz(1) }
	func millihertz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.millihertz, exponent)], sigfigs: sigfigs))
	}
	
	var microhertz: Physical { microhertz(1) }
	func microhertz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.microhertz, exponent)], sigfigs: sigfigs))
	}
	
	var nanohertz: Physical { nanohertz(1) }
	func nanohertz(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.nanohertz, exponent)], sigfigs: sigfigs))
	}
	
	var framesPerSecond: Physical { framesPerSecond(1) }
	func framesPerSecond(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFrequency.framesPerSecond, exponent)], sigfigs: sigfigs))
	}
	
	var litersPer100Kilometers: Physical { litersPer100Kilometers(1) }
	func litersPer100Kilometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFuelEfficiency.litersPer100Kilometers, exponent)], sigfigs: sigfigs))
	}
	
	var milesPerImperialGallon: Physical { milesPerImperialGallon(1) }
	func milesPerImperialGallon(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFuelEfficiency.milesPerImperialGallon, exponent)], sigfigs: sigfigs))
	}
	
	var milesPerGallon: Physical { milesPerGallon(1) }
	func milesPerGallon(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitFuelEfficiency.milesPerGallon, exponent)], sigfigs: sigfigs))
	}
	
	var bytes: Physical { bytes(1) }
	func bytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.bytes, exponent)], sigfigs: sigfigs))
	}
	
	var bits: Physical { bits(1) }
	func bits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.bits, exponent)], sigfigs: sigfigs))
	}
	
	var nibbles: Physical { nibbles(1) }
	func nibbles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.nibbles, exponent)], sigfigs: sigfigs))
	}
	
	var yottabytes: Physical { yottabytes(1) }
	func yottabytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.yottabytes, exponent)], sigfigs: sigfigs))
	}
	
	var zettabytes: Physical { zettabytes(1) }
	func zettabytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.zettabytes, exponent)], sigfigs: sigfigs))
	}
	
	var exabytes: Physical { exabytes(1) }
	func exabytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.exabytes, exponent)], sigfigs: sigfigs))
	}
	
	var petabytes: Physical { petabytes(1) }
	func petabytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.petabytes, exponent)], sigfigs: sigfigs))
	}
	
	var terabytes: Physical { terabytes(1) }
	func terabytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.terabytes, exponent)], sigfigs: sigfigs))
	}
	
	var gigabytes: Physical { gigabytes(1) }
	func gigabytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.gigabytes, exponent)], sigfigs: sigfigs))
	}
	
	var megabytes: Physical { megabytes(1) }
	func megabytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.megabytes, exponent)], sigfigs: sigfigs))
	}
	
	var kilobytes: Physical { kilobytes(1) }
	func kilobytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.kilobytes, exponent)], sigfigs: sigfigs))
	}
	
	var yottabits: Physical { yottabits(1) }
	func yottabits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.yottabits, exponent)], sigfigs: sigfigs))
	}
	
	var zettabits: Physical { zettabits(1) }
	func zettabits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.zettabits, exponent)], sigfigs: sigfigs))
	}
	
	var exabits: Physical { exabits(1) }
	func exabits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.exabits, exponent)], sigfigs: sigfigs))
	}
	
	var petabits: Physical { petabits(1) }
	func petabits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.petabits, exponent)], sigfigs: sigfigs))
	}
	
	var terabits: Physical { terabits(1) }
	func terabits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.terabits, exponent)], sigfigs: sigfigs))
	}
	
	var gigabits: Physical { gigabits(1) }
	func gigabits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.gigabits, exponent)], sigfigs: sigfigs))
	}
	
	var megabits: Physical { megabits(1) }
	func megabits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.megabits, exponent)], sigfigs: sigfigs))
	}
	
	var kilobits: Physical { kilobits(1) }
	func kilobits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.kilobits, exponent)], sigfigs: sigfigs))
	}
	
	var yobibytes: Physical { yobibytes(1) }
	func yobibytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.yobibytes, exponent)], sigfigs: sigfigs))
	}
	
	var zebibytes: Physical { zebibytes(1) }
	func zebibytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.zebibytes, exponent)], sigfigs: sigfigs))
	}
	
	var exbibytes: Physical { exbibytes(1) }
	func exbibytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.exbibytes, exponent)], sigfigs: sigfigs))
	}
	
	var pebibytes: Physical { pebibytes(1) }
	func pebibytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.pebibytes, exponent)], sigfigs: sigfigs))
	}
	
	var tebibytes: Physical { tebibytes(1) }
	func tebibytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.tebibytes, exponent)], sigfigs: sigfigs))
	}
	
	var gibibytes: Physical { gibibytes(1) }
	func gibibytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.gibibytes, exponent)], sigfigs: sigfigs))
	}
	
	var mebibytes: Physical { mebibytes(1) }
	func mebibytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.mebibytes, exponent)], sigfigs: sigfigs))
	}
	
	var kibibytes: Physical { kibibytes(1) }
	func kibibytes(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.kibibytes, exponent)], sigfigs: sigfigs))
	}
	
	var yobibits: Physical { yobibits(1) }
	func yobibits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.yobibits, exponent)], sigfigs: sigfigs))
	}
	
	var zebibits: Physical { zebibits(1) }
	func zebibits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.zebibits, exponent)], sigfigs: sigfigs))
	}
	
	var exbibits: Physical { exbibits(1) }
	func exbibits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.exbibits, exponent)], sigfigs: sigfigs))
	}
	
	var pebibits: Physical { pebibits(1) }
	func pebibits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.pebibits, exponent)], sigfigs: sigfigs))
	}
	
	var tebibits: Physical { tebibits(1) }
	func tebibits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.tebibits, exponent)], sigfigs: sigfigs))
	}
	
	var gibibits: Physical { gibibits(1) }
	func gibibits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.gibibits, exponent)], sigfigs: sigfigs))
	}
	
	var mebibits: Physical { mebibits(1) }
	func mebibits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.mebibits, exponent)], sigfigs: sigfigs))
	}
	
	var kibibits: Physical { kibibits(1) }
	func kibibits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitInformationStorage.kibibits, exponent)], sigfigs: sigfigs))
	}
	
	var megameters: Physical { megameters(1) }
	func megameters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.megameters, exponent)], sigfigs: sigfigs))
	}
	
	var kilometers: Physical { kilometers(1) }
	func kilometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.kilometers, exponent)], sigfigs: sigfigs))
	}
	
	var hectometers: Physical { hectometers(1) }
	func hectometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.hectometers, exponent)], sigfigs: sigfigs))
	}
	
	var decameters: Physical { decameters(1) }
	func decameters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.decameters, exponent)], sigfigs: sigfigs))
	}
	
	var meters: Physical { meters(1) }
	func meters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.meters, exponent)], sigfigs: sigfigs))
	}
	
	var decimeters: Physical { decimeters(1) }
	func decimeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.decimeters, exponent)], sigfigs: sigfigs))
	}
	
	var centimeters: Physical { centimeters(1) }
	func centimeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.centimeters, exponent)], sigfigs: sigfigs))
	}
	
	var millimeters: Physical { millimeters(1) }
	func millimeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.millimeters, exponent)], sigfigs: sigfigs))
	}
	
	var micrometers: Physical { micrometers(1) }
	func micrometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.micrometers, exponent)], sigfigs: sigfigs))
	}
	
	var nanometers: Physical { nanometers(1) }
	func nanometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.nanometers, exponent)], sigfigs: sigfigs))
	}
	
	var picometers: Physical { picometers(1) }
	func picometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.picometers, exponent)], sigfigs: sigfigs))
	}
	
	var inches: Physical { inches(1) }
	func inches(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.inches, exponent)], sigfigs: sigfigs))
	}
	
	var feet: Physical { feet(1) }
	func feet(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.feet, exponent)], sigfigs: sigfigs))
	}
	
	var yards: Physical { yards(1) }
	func yards(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.yards, exponent)], sigfigs: sigfigs))
	}
	
	var miles: Physical { miles(1) }
	func miles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.miles, exponent)], sigfigs: sigfigs))
	}
	
	var scandinavianMiles: Physical { scandinavianMiles(1) }
	func scandinavianMiles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.scandinavianMiles, exponent)], sigfigs: sigfigs))
	}
	
	var lightyears: Physical { lightyears(1) }
	func lightyears(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.lightyears, exponent)], sigfigs: sigfigs))
	}
	
	var nauticalMiles: Physical { nauticalMiles(1) }
	func nauticalMiles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.nauticalMiles, exponent)], sigfigs: sigfigs))
	}
	
	var fathoms: Physical { fathoms(1) }
	func fathoms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.fathoms, exponent)], sigfigs: sigfigs))
	}
	
	var furlongs: Physical { furlongs(1) }
	func furlongs(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.furlongs, exponent)], sigfigs: sigfigs))
	}
	
	var astronomicalUnits: Physical { astronomicalUnits(1) }
	func astronomicalUnits(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.astronomicalUnits, exponent)], sigfigs: sigfigs))
	}
	
	var parsecs: Physical { parsecs(1) }
	func parsecs(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitLength.parsecs, exponent)], sigfigs: sigfigs))
	}
	
	var lux: Physical { lux(1) }
	func lux(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitIlluminance.lux, exponent)], sigfigs: sigfigs))
	}
	
	var kilograms: Physical { kilograms(1) }
	func kilograms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.kilograms, exponent)], sigfigs: sigfigs))
	}
	
	var grams: Physical { grams(1) }
	func grams(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.grams, exponent)], sigfigs: sigfigs))
	}
	
	var decigrams: Physical { decigrams(1) }
	func decigrams(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.decigrams, exponent)], sigfigs: sigfigs))
	}
	
	var centigrams: Physical { centigrams(1) }
	func centigrams(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.centigrams, exponent)], sigfigs: sigfigs))
	}
	
	var milligrams: Physical { milligrams(1) }
	func milligrams(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.milligrams, exponent)], sigfigs: sigfigs))
	}
	
	var micrograms: Physical { micrograms(1) }
	func micrograms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.micrograms, exponent)], sigfigs: sigfigs))
	}
	
	var nanograms: Physical { nanograms(1) }
	func nanograms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.nanograms, exponent)], sigfigs: sigfigs))
	}
	
	var picograms: Physical { picograms(1) }
	func picograms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.picograms, exponent)], sigfigs: sigfigs))
	}
	
	var ounces: Physical { ounces(1) }
	func ounces(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.ounces, exponent)], sigfigs: sigfigs))
	}
	
	var poundsMass: Physical { poundsMass(1) }
	func poundsMass(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.pounds, exponent)], sigfigs: sigfigs))
	}
	
	var stones: Physical { stones(1) }
	func stones(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.stones, exponent)], sigfigs: sigfigs))
	}
	
	var metricTons: Physical { metricTons(1) }
	func metricTons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.metricTons, exponent)], sigfigs: sigfigs))
	}
	
	var shortTons: Physical { shortTons(1) }
	func shortTons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.shortTons, exponent)], sigfigs: sigfigs))
	}
	
	var carats: Physical { carats(1) }
	func carats(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.carats, exponent)], sigfigs: sigfigs))
	}
	
	var ouncesTroy: Physical { ouncesTroy(1) }
	func ouncesTroy(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.ouncesTroy, exponent)], sigfigs: sigfigs))
	}
	
	var slugs: Physical { slugs(1) }
	func slugs(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitMass.slugs, exponent)], sigfigs: sigfigs))
	}
	
	var terawatts: Physical { terawatts(1) }
	func terawatts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.terawatts, exponent)], sigfigs: sigfigs))
	}
	
	var gigawatts: Physical { gigawatts(1) }
	func gigawatts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.gigawatts, exponent)], sigfigs: sigfigs))
	}
	
	var megawatts: Physical { megawatts(1) }
	func megawatts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.megawatts, exponent)], sigfigs: sigfigs))
	}
	
	var kilowatts: Physical { kilowatts(1) }
	func kilowatts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.kilowatts, exponent)], sigfigs: sigfigs))
	}
	
	var watts: Physical { watts(1) }
	func watts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.watts, exponent)], sigfigs: sigfigs))
	}
	
	var milliwatts: Physical { milliwatts(1) }
	func milliwatts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.milliwatts, exponent)], sigfigs: sigfigs))
	}
	
	var microwatts: Physical { microwatts(1) }
	func microwatts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.microwatts, exponent)], sigfigs: sigfigs))
	}
	
	var nanowatts: Physical { nanowatts(1) }
	func nanowatts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.nanowatts, exponent)], sigfigs: sigfigs))
	}
	
	var picowatts: Physical { picowatts(1) }
	func picowatts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.picowatts, exponent)], sigfigs: sigfigs))
	}
	
	var femtowatts: Physical { femtowatts(1) }
	func femtowatts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.femtowatts, exponent)], sigfigs: sigfigs))
	}
	
	var horsepower: Physical { horsepower(1) }
	func horsepower(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPower.horsepower, exponent)], sigfigs: sigfigs))
	}
	
	var newtonsPerMetersSquared: Physical { newtonsPerMetersSquared(1) }
	func newtonsPerMetersSquared(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.newtonsPerMetersSquared, exponent)], sigfigs: sigfigs))
	}
	
	var gigapascals: Physical { gigapascals(1) }
	func gigapascals(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.gigapascals, exponent)], sigfigs: sigfigs))
	}
	
	var megapascals: Physical { megapascals(1) }
	func megapascals(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.megapascals, exponent)], sigfigs: sigfigs))
	}
	
	var kilopascals: Physical { kilopascals(1) }
	func kilopascals(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.kilopascals, exponent)], sigfigs: sigfigs))
	}
	
	var hectopascals: Physical { hectopascals(1) }
	func hectopascals(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.hectopascals, exponent)], sigfigs: sigfigs))
	}
	
	var inchesOfMercury: Physical { inchesOfMercury(1) }
	func inchesOfMercury(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.inchesOfMercury, exponent)], sigfigs: sigfigs))
	}
	
	var bars: Physical { bars(1) }
	func bars(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.bars, exponent)], sigfigs: sigfigs))
	}
	
	var millibars: Physical { millibars(1) }
	func millibars(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.millibars, exponent)], sigfigs: sigfigs))
	}
	
	var millimetersOfMercury: Physical { millimetersOfMercury(1) }
	func millimetersOfMercury(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.millimetersOfMercury, exponent)], sigfigs: sigfigs))
	}
	
	var poundsForcePerSquareInch: Physical { poundsForcePerSquareInch(1) }
	func poundsForcePerSquareInch(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitPressure.poundsForcePerSquareInch, exponent)], sigfigs: sigfigs))
	}
	
	var metersPerSecond: Physical { metersPerSecond(1) }
	func metersPerSecond(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitSpeed.metersPerSecond, exponent)], sigfigs: sigfigs))
	}
	
	var kilometersPerHour: Physical { kilometersPerHour(1) }
	func kilometersPerHour(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitSpeed.kilometersPerHour, exponent)], sigfigs: sigfigs))
	}
	
	var milesPerHour: Physical { milesPerHour(1) }
	func milesPerHour(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitSpeed.milesPerHour, exponent)], sigfigs: sigfigs))
	}
	
	var knots: Physical { knots(1) }
	func knots(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitSpeed.knots, exponent)], sigfigs: sigfigs))
	}
	
	var kelvin: Physical { kelvin(1) }
	func kelvin(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitTemperature.kelvin, exponent)], sigfigs: sigfigs))
	}
	
	var celsius: Physical { celsius(1) }
	func celsius(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitTemperature.celsius, exponent)], sigfigs: sigfigs))
	}
	
	var fahrenheit: Physical { fahrenheit(1) }
	func fahrenheit(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitTemperature.fahrenheit, exponent)], sigfigs: sigfigs))
	}
	
	var megaliters: Physical { megaliters(1) }
	func megaliters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.megaliters, exponent)], sigfigs: sigfigs))
	}
	
	var kiloliters: Physical { kiloliters(1) }
	func kiloliters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.kiloliters, exponent)], sigfigs: sigfigs))
	}
	
	var liters: Physical { liters(1) }
	func liters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.liters, exponent)], sigfigs: sigfigs))
	}
	
	var deciliters: Physical { deciliters(1) }
	func deciliters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.deciliters, exponent)], sigfigs: sigfigs))
	}
	
	var centiliters: Physical { centiliters(1) }
	func centiliters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.centiliters, exponent)], sigfigs: sigfigs))
	}
	
	var milliliters: Physical { milliliters(1) }
	func milliliters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.milliliters, exponent)], sigfigs: sigfigs))
	}
	
	var cubicKilometers: Physical { cubicKilometers(1) }
	func cubicKilometers(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cubicKilometers, exponent)], sigfigs: sigfigs))
	}
	
	var cubicMeters: Physical { cubicMeters(1) }
	func cubicMeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cubicMeters, exponent)], sigfigs: sigfigs))
	}
	
	var cubicDecimeters: Physical { cubicDecimeters(1) }
	func cubicDecimeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cubicDecimeters, exponent)], sigfigs: sigfigs))
	}
	
	var cubicCentimeters: Physical { cubicCentimeters(1) }
	func cubicCentimeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cubicCentimeters, exponent)], sigfigs: sigfigs))
	}
	
	var cubicMillimeters: Physical { cubicMillimeters(1) }
	func cubicMillimeters(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cubicMillimeters, exponent)], sigfigs: sigfigs))
	}
	
	var cubicInches: Physical { cubicInches(1) }
	func cubicInches(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cubicInches, exponent)], sigfigs: sigfigs))
	}
	
	var cubicFeet: Physical { cubicFeet(1) }
	func cubicFeet(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cubicFeet, exponent)], sigfigs: sigfigs))
	}
	
	var cubicYards: Physical { cubicYards(1) }
	func cubicYards(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cubicYards, exponent)], sigfigs: sigfigs))
	}
	
	var cubicMiles: Physical { cubicMiles(1) }
	func cubicMiles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cubicMiles, exponent)], sigfigs: sigfigs))
	}
	
	var acreFeet: Physical { acreFeet(1) }
	func acreFeet(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.acreFeet, exponent)], sigfigs: sigfigs))
	}
	
	var bushels: Physical { bushels(1) }
	func bushels(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.bushels, exponent)], sigfigs: sigfigs))
	}
	
	var teaspoons: Physical { teaspoons(1) }
	func teaspoons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.teaspoons, exponent)], sigfigs: sigfigs))
	}
	
	var tablespoons: Physical { tablespoons(1) }
	func tablespoons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.tablespoons, exponent)], sigfigs: sigfigs))
	}
	
	var fluidOunces: Physical { fluidOunces(1) }
	func fluidOunces(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.fluidOunces, exponent)], sigfigs: sigfigs))
	}
	
	var cups: Physical { cups(1) }
	func cups(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.cups, exponent)], sigfigs: sigfigs))
	}
	
	var pints: Physical { pints(1) }
	func pints(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.pints, exponent)], sigfigs: sigfigs))
	}
	
	var quarts: Physical { quarts(1) }
	func quarts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.quarts, exponent)], sigfigs: sigfigs))
	}
	
	var gallons: Physical { gallons(1) }
	func gallons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.gallons, exponent)], sigfigs: sigfigs))
	}
	
	var imperialTeaspoons: Physical { imperialTeaspoons(1) }
	func imperialTeaspoons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.imperialTeaspoons, exponent)], sigfigs: sigfigs))
	}
	
	var imperialTablespoons: Physical { imperialTablespoons(1) }
	func imperialTablespoons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.imperialTablespoons, exponent)], sigfigs: sigfigs))
	}
	
	var imperialFluidOunces: Physical { imperialFluidOunces(1) }
	func imperialFluidOunces(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.imperialFluidOunces, exponent)], sigfigs: sigfigs))
	}
	
	var imperialPints: Physical { imperialPints(1) }
	func imperialPints(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.imperialPints, exponent)], sigfigs: sigfigs))
	}
	
	var imperialQuarts: Physical { imperialQuarts(1) }
	func imperialQuarts(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.imperialQuarts, exponent)], sigfigs: sigfigs))
	}
	
	var imperialGallons: Physical { imperialGallons(1) }
	func imperialGallons(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.imperialGallons, exponent)], sigfigs: sigfigs))
	}
	
	var metricCups: Physical { metricCups(1) }
	func metricCups(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitVolume.metricCups, exponent)], sigfigs: sigfigs))
	}
	
}

// type casting
public extension Physical {
	// Custom units
	
	var to_particles: Physical {
		to(UnitAmount.particles)
	}
	var to_moles: Physical {
		to(UnitAmount.moles)
	}
	var to_farads: Physical {
		to(UnitElectricCapacitance.farads)
	}
	var to_siemens: Physical {
		to(UnitElectricConductance.siemens)
	}
	var to_henries: Physical {
		to(UnitElectricInductance.henries)
	}
	var to_newtons: Physical {
		to(UnitForce.newtons)
	}
	var to_grays: Physical {
		to(UnitIonizingRadiation.grays)
	}
	var to_sieverts: Physical {
		to(UnitIonizingRadiation.sieverts)
	}
	var to_candelas: Physical {
		to(UnitLuminousIntensity.candelas)
	}
	var to_lumens: Physical {
		to(UnitLuminousFlux.lumens)
	}
	var to_webers: Physical {
		to(UnitMagneticFlux.webers)
	}
	var to_teslas: Physical {
		to(UnitMagneticFluxDensity.teslas)
	}
	var to_gauss: Physical {
		to(UnitMagneticFluxDensity.gauss)
	}
	
	// Extended units
	
	var to_barns: Physical {
		to(UnitArea.barns)
	}
	var to_days: Physical {
		to(UnitDuration.days)
	}
	var to_years: Physical {
		to(UnitDuration.years)
	}
	var to_britishThermalUnits: Physical {
		to(UnitEnergy.britishThermalUnits)
	}
	var to_electronvolts: Physical {
		to(UnitEnergy.electronvolts)
	}
	var to_angstroms: Physical {
		to(UnitLength.angstroms)
	}
	var to_pascals: Physical {
		to(UnitPressure.pascals)
	}
	var to_atmosphericPressure: Physical {
		to(UnitPressure.atmosphericPressure)
	}
	var to_rankine: Physical {
		to(UnitTemperature.rankine)
	}
	
	// Extracted properties from NSUnit.h
	// Raw units
	
	var to_metersPerSecondSquared: Physical {
		to(UnitAcceleration.metersPerSecondSquared)
	}
	var to_gravity: Physical {
		to(UnitAcceleration.gravity)
	}
	
	var to_degrees: Physical {
		to(UnitAngle.degrees)
	}
	var to_arcMinutes: Physical {
		to(UnitAngle.arcMinutes)
	}
	var to_arcSeconds: Physical {
		to(UnitAngle.arcSeconds)
	}
	var to_radians: Physical {
		to(UnitAngle.radians)
	}
	var to_gradians: Physical {
		to(UnitAngle.gradians)
	}
	var to_revolutions: Physical {
		to(UnitAngle.revolutions)
	}
	
	var to_squareMegameters: Physical {
		to(UnitArea.squareMegameters)
	}
	var to_squareKilometers: Physical {
		to(UnitArea.squareKilometers)
	}
	var to_squareMeters: Physical {
		to(UnitArea.squareMeters)
	}
	var to_squareCentimeters: Physical {
		to(UnitArea.squareCentimeters)
	}
	var to_squareMillimeters: Physical {
		to(UnitArea.squareMillimeters)
	}
	var to_squareMicrometers: Physical {
		to(UnitArea.squareMicrometers)
	}
	var to_squareNanometers: Physical {
		to(UnitArea.squareNanometers)
	}
	var to_squareInches: Physical {
		to(UnitArea.squareInches)
	}
	var to_squareFeet: Physical {
		to(UnitArea.squareFeet)
	}
	var to_squareYards: Physical {
		to(UnitArea.squareYards)
	}
	var to_squareMiles: Physical {
		to(UnitArea.squareMiles)
	}
	var to_acres: Physical {
		to(UnitArea.acres)
	}
	var to_ares: Physical {
		to(UnitArea.ares)
	}
	var to_hectares: Physical {
		to(UnitArea.hectares)
	}
	
	var to_gramsPerLiter: Physical {
		to(UnitConcentrationMass.gramsPerLiter)
	}
	var to_milligramsPerDeciliter: Physical {
		to(UnitConcentrationMass.milligramsPerDeciliter)
	}
	
	var to_partsPerMillion: Physical {
		to(UnitDispersion.partsPerMillion)
	}
	
	var to_hours: Physical {
		to(UnitDuration.hours)
	}
	var to_minutes: Physical {
		to(UnitDuration.minutes)
	}
	var to_seconds: Physical {
		to(UnitDuration.seconds)
	}
	var to_milliseconds: Physical {
		to(UnitDuration.milliseconds)
	}
	var to_microseconds: Physical {
		to(UnitDuration.microseconds)
	}
	var to_nanoseconds: Physical {
		to(UnitDuration.nanoseconds)
	}
	var to_picoseconds: Physical {
		to(UnitDuration.picoseconds)
	}
	
	var to_coulombs: Physical {
		to(UnitElectricCharge.coulombs)
	}
	var to_megaampereHours: Physical {
		to(UnitElectricCharge.megaampereHours)
	}
	var to_kiloampereHours: Physical {
		to(UnitElectricCharge.kiloampereHours)
	}
	var to_ampereHours: Physical {
		to(UnitElectricCharge.ampereHours)
	}
	var to_milliampereHours: Physical {
		to(UnitElectricCharge.milliampereHours)
	}
	var to_microampereHours: Physical {
		to(UnitElectricCharge.microampereHours)
	}
	
	var to_megaamperes: Physical {
		to(UnitElectricCurrent.megaamperes)
	}
	var to_kiloamperes: Physical {
		to(UnitElectricCurrent.kiloamperes)
	}
	var to_amperes: Physical {
		to(UnitElectricCurrent.amperes)
	}
	var to_milliamperes: Physical {
		to(UnitElectricCurrent.milliamperes)
	}
	var to_microamperes: Physical {
		to(UnitElectricCurrent.microamperes)
	}
	
	var to_megavolts: Physical {
		to(UnitElectricPotentialDifference.megavolts)
	}
	var to_kilovolts: Physical {
		to(UnitElectricPotentialDifference.kilovolts)
	}
	var to_volts: Physical {
		to(UnitElectricPotentialDifference.volts)
	}
	var to_millivolts: Physical {
		to(UnitElectricPotentialDifference.millivolts)
	}
	var to_microvolts: Physical {
		to(UnitElectricPotentialDifference.microvolts)
	}
	
	var to_megaohms: Physical {
		to(UnitElectricResistance.megaohms)
	}
	var to_kiloohms: Physical {
		to(UnitElectricResistance.kiloohms)
	}
	var to_ohms: Physical {
		to(UnitElectricResistance.ohms)
	}
	var to_milliohms: Physical {
		to(UnitElectricResistance.milliohms)
	}
	var to_microohms: Physical {
		to(UnitElectricResistance.microohms)
	}
	
	var to_kilojoules: Physical {
		to(UnitEnergy.kilojoules)
	}
	var to_joules: Physical {
		to(UnitEnergy.joules)
	}
	var to_kilocalories: Physical {
		to(UnitEnergy.kilocalories)
	}
	var to_calories: Physical {
		to(UnitEnergy.calories)
	}
	var to_kilowattHours: Physical {
		to(UnitEnergy.kilowattHours)
	}
	
	var to_terahertz: Physical {
		to(UnitFrequency.terahertz)
	}
	var to_gigahertz: Physical {
		to(UnitFrequency.gigahertz)
	}
	var to_megahertz: Physical {
		to(UnitFrequency.megahertz)
	}
	var to_kilohertz: Physical {
		to(UnitFrequency.kilohertz)
	}
	var to_hertz: Physical {
		to(UnitFrequency.hertz)
	}
	var to_millihertz: Physical {
		to(UnitFrequency.millihertz)
	}
	var to_microhertz: Physical {
		to(UnitFrequency.microhertz)
	}
	var to_nanohertz: Physical {
		to(UnitFrequency.nanohertz)
	}
	
	var to_framesPerSecond: Physical {
		to(UnitFrequency.framesPerSecond)
	}
	
	var to_litersPer100Kilometers: Physical {
		to(UnitFuelEfficiency.litersPer100Kilometers)
	}
	var to_milesPerImperialGallon: Physical {
		to(UnitFuelEfficiency.milesPerImperialGallon)
	}
	var to_milesPerGallon: Physical {
		to(UnitFuelEfficiency.milesPerGallon)
	}
	
	var to_bytes: Physical {
		to(UnitInformationStorage.bytes)
	}
	var to_bits: Physical {
		to(UnitInformationStorage.bits)
	}
	var to_nibbles: Physical {
		to(UnitInformationStorage.nibbles)
	}
	var to_yottabytes: Physical {
		to(UnitInformationStorage.yottabytes)
	}
	var to_zettabytes: Physical {
		to(UnitInformationStorage.zettabytes)
	}
	var to_exabytes: Physical {
		to(UnitInformationStorage.exabytes)
	}
	var to_petabytes: Physical {
		to(UnitInformationStorage.petabytes)
	}
	var to_terabytes: Physical {
		to(UnitInformationStorage.terabytes)
	}
	var to_gigabytes: Physical {
		to(UnitInformationStorage.gigabytes)
	}
	var to_megabytes: Physical {
		to(UnitInformationStorage.megabytes)
	}
	var to_kilobytes: Physical {
		to(UnitInformationStorage.kilobytes)
	}
	var to_yottabits: Physical {
		to(UnitInformationStorage.yottabits)
	}
	var to_zettabits: Physical {
		to(UnitInformationStorage.zettabits)
	}
	var to_exabits: Physical {
		to(UnitInformationStorage.exabits)
	}
	var to_petabits: Physical {
		to(UnitInformationStorage.petabits)
	}
	var to_terabits: Physical {
		to(UnitInformationStorage.terabits)
	}
	var to_gigabits: Physical {
		to(UnitInformationStorage.gigabits)
	}
	var to_megabits: Physical {
		to(UnitInformationStorage.megabits)
	}
	var to_kilobits: Physical {
		to(UnitInformationStorage.kilobits)
	}
	var to_yobibytes: Physical {
		to(UnitInformationStorage.yobibytes)
	}
	var to_zebibytes: Physical {
		to(UnitInformationStorage.zebibytes)
	}
	var to_exbibytes: Physical {
		to(UnitInformationStorage.exbibytes)
	}
	var to_pebibytes: Physical {
		to(UnitInformationStorage.pebibytes)
	}
	var to_tebibytes: Physical {
		to(UnitInformationStorage.tebibytes)
	}
	var to_gibibytes: Physical {
		to(UnitInformationStorage.gibibytes)
	}
	var to_mebibytes: Physical {
		to(UnitInformationStorage.mebibytes)
	}
	var to_kibibytes: Physical {
		to(UnitInformationStorage.kibibytes)
	}
	var to_yobibits: Physical {
		to(UnitInformationStorage.yobibits)
	}
	var to_zebibits: Physical {
		to(UnitInformationStorage.zebibits)
	}
	var to_exbibits: Physical {
		to(UnitInformationStorage.exbibits)
	}
	var to_pebibits: Physical {
		to(UnitInformationStorage.pebibits)
	}
	var to_tebibits: Physical {
		to(UnitInformationStorage.tebibits)
	}
	var to_gibibits: Physical {
		to(UnitInformationStorage.gibibits)
	}
	var to_mebibits: Physical {
		to(UnitInformationStorage.mebibits)
	}
	var to_kibibits: Physical {
		to(UnitInformationStorage.kibibits)
	}
	
	var to_megameters: Physical {
		to(UnitLength.megameters)
	}
	var to_kilometers: Physical {
		to(UnitLength.kilometers)
	}
	var to_hectometers: Physical {
		to(UnitLength.hectometers)
	}
	var to_decameters: Physical {
		to(UnitLength.decameters)
	}
	var to_meters: Physical {
		to(UnitLength.meters)
	}
	var to_decimeters: Physical {
		to(UnitLength.decimeters)
	}
	var to_centimeters: Physical {
		to(UnitLength.centimeters)
	}
	var to_millimeters: Physical {
		to(UnitLength.millimeters)
	}
	var to_micrometers: Physical {
		to(UnitLength.micrometers)
	}
	var to_nanometers: Physical {
		to(UnitLength.nanometers)
	}
	var to_picometers: Physical {
		to(UnitLength.picometers)
	}
	var to_inches: Physical {
		to(UnitLength.inches)
	}
	var to_feet: Physical {
		to(UnitLength.feet)
	}
	var to_yards: Physical {
		to(UnitLength.yards)
	}
	var to_miles: Physical {
		to(UnitLength.miles)
	}
	var to_scandinavianMiles: Physical {
		to(UnitLength.scandinavianMiles)
	}
	var to_lightyears: Physical {
		to(UnitLength.lightyears)
	}
	var to_nauticalMiles: Physical {
		to(UnitLength.nauticalMiles)
	}
	var to_fathoms: Physical {
		to(UnitLength.fathoms)
	}
	var to_furlongs: Physical {
		to(UnitLength.furlongs)
	}
	var to_astronomicalUnits: Physical {
		to(UnitLength.astronomicalUnits)
	}
	var to_parsecs: Physical {
		to(UnitLength.parsecs)
	}
	
	var to_lux: Physical {
		to(UnitIlluminance.lux)
	}
	
	var to_kilograms: Physical {
		to(UnitMass.kilograms)
	}
	var to_grams: Physical {
		to(UnitMass.grams)
	}
	var to_decigrams: Physical {
		to(UnitMass.decigrams)
	}
	var to_centigrams: Physical {
		to(UnitMass.centigrams)
	}
	var to_milligrams: Physical {
		to(UnitMass.milligrams)
	}
	var to_micrograms: Physical {
		to(UnitMass.micrograms)
	}
	var to_nanograms: Physical {
		to(UnitMass.nanograms)
	}
	var to_picograms: Physical {
		to(UnitMass.picograms)
	}
	var to_ounces: Physical {
		to(UnitMass.ounces)
	}
	var to_poundsMass: Physical {
		to(UnitMass.pounds)
	}
	var to_stones: Physical {
		to(UnitMass.stones)
	}
	var to_metricTons: Physical {
		to(UnitMass.metricTons)
	}
	var to_shortTons: Physical {
		to(UnitMass.shortTons)
	}
	var to_carats: Physical {
		to(UnitMass.carats)
	}
	var to_ouncesTroy: Physical {
		to(UnitMass.ouncesTroy)
	}
	var to_slugs: Physical {
		to(UnitMass.slugs)
	}
	
	var to_terawatts: Physical {
		to(UnitPower.terawatts)
	}
	var to_gigawatts: Physical {
		to(UnitPower.gigawatts)
	}
	var to_megawatts: Physical {
		to(UnitPower.megawatts)
	}
	var to_kilowatts: Physical {
		to(UnitPower.kilowatts)
	}
	var to_watts: Physical {
		to(UnitPower.watts)
	}
	var to_milliwatts: Physical {
		to(UnitPower.milliwatts)
	}
	var to_microwatts: Physical {
		to(UnitPower.microwatts)
	}
	var to_nanowatts: Physical {
		to(UnitPower.nanowatts)
	}
	var to_picowatts: Physical {
		to(UnitPower.picowatts)
	}
	var to_femtowatts: Physical {
		to(UnitPower.femtowatts)
	}
	var to_horsepower: Physical {
		to(UnitPower.horsepower)
	}
	
	var to_newtonsPerMetersSquared: Physical {
		to(UnitPressure.newtonsPerMetersSquared)
	}
	var to_gigapascals: Physical {
		to(UnitPressure.gigapascals)
	}
	var to_megapascals: Physical {
		to(UnitPressure.megapascals)
	}
	var to_kilopascals: Physical {
		to(UnitPressure.kilopascals)
	}
	var to_hectopascals: Physical {
		to(UnitPressure.hectopascals)
	}
	var to_inchesOfMercury: Physical {
		to(UnitPressure.inchesOfMercury)
	}
	var to_bars: Physical {
		to(UnitPressure.bars)
	}
	var to_millibars: Physical {
		to(UnitPressure.millibars)
	}
	var to_millimetersOfMercury: Physical {
		to(UnitPressure.millimetersOfMercury)
	}
	var to_poundsForcePerSquareInch: Physical {
		to(UnitPressure.poundsForcePerSquareInch)
	}
	
	var to_metersPerSecond: Physical {
		to(UnitSpeed.metersPerSecond)
	}
	var to_kilometersPerHour: Physical {
		to(UnitSpeed.kilometersPerHour)
	}
	var to_milesPerHour: Physical {
		to(UnitSpeed.milesPerHour)
	}
	var to_knots: Physical {
		to(UnitSpeed.knots)
	}
	
	var to_kelvin: Physical {
		to(UnitTemperature.kelvin)
	}
	var to_celsius: Physical {
		to(UnitTemperature.celsius)
	}
	var to_fahrenheit: Physical {
		to(UnitTemperature.fahrenheit)
	}
	
	var to_megaliters: Physical {
		to(UnitVolume.megaliters)
	}
	var to_kiloliters: Physical {
		to(UnitVolume.kiloliters)
	}
	var to_liters: Physical {
		to(UnitVolume.liters)
	}
	var to_deciliters: Physical {
		to(UnitVolume.deciliters)
	}
	var to_centiliters: Physical {
		to(UnitVolume.centiliters)
	}
	var to_milliliters: Physical {
		to(UnitVolume.milliliters)
	}
	var to_cubicKilometers: Physical {
		to(UnitVolume.cubicKilometers)
	}
	var to_cubicMeters: Physical {
		to(UnitVolume.cubicMeters)
	}
	var to_cubicDecimeters: Physical {
		to(UnitVolume.cubicDecimeters)
	}
	var to_cubicCentimeters: Physical {
		to(UnitVolume.cubicCentimeters)
	}
	var to_cubicMillimeters: Physical {
		to(UnitVolume.cubicMillimeters)
	}
	var to_cubicInches: Physical {
		to(UnitVolume.cubicInches)
	}
	var to_cubicFeet: Physical {
		to(UnitVolume.cubicFeet)
	}
	var to_cubicYards: Physical {
		to(UnitVolume.cubicYards)
	}
	var to_cubicMiles: Physical {
		to(UnitVolume.cubicMiles)
	}
	var to_acreFeet: Physical {
		to(UnitVolume.acreFeet)
	}
	var to_bushels: Physical {
		to(UnitVolume.bushels)
	}
	var to_teaspoons: Physical {
		to(UnitVolume.teaspoons)
	}
	var to_tablespoons: Physical {
		to(UnitVolume.tablespoons)
	}
	var to_fluidOunces: Physical {
		to(UnitVolume.fluidOunces)
	}
	var to_cups: Physical {
		to(UnitVolume.cups)
	}
	var to_pints: Physical {
		to(UnitVolume.pints)
	}
	var to_quarts: Physical {
		to(UnitVolume.quarts)
	}
	var to_gallons: Physical {
		to(UnitVolume.gallons)
	}
	var to_imperialTeaspoons: Physical {
		to(UnitVolume.imperialTeaspoons)
	}
	var to_imperialTablespoons: Physical {
		to(UnitVolume.imperialTablespoons)
	}
	var to_imperialFluidOunces: Physical {
		to(UnitVolume.imperialFluidOunces)
	}
	var to_imperialPints: Physical {
		to(UnitVolume.imperialPints)
	}
	var to_imperialQuarts: Physical {
		to(UnitVolume.imperialQuarts)
	}
	var to_imperialGallons: Physical {
		to(UnitVolume.imperialGallons)
	}
	var to_metricCups: Physical {
		to(UnitVolume.metricCups)
	}
}

public enum PhysicalConversionType {
	case m, J, Hz, s, particles, moles, farads, siemens, henries, newtons, grays, sieverts, candelas, lumens, webers, teslas, gauss, barns, days, years, britishThermalUnits, electronvolts, angstroms, pascals, atmosphericPressure, rankine, metersPerSecondSquared, gravity, degrees, arcMinutes, arcSeconds, radians, gradians, revolutions, squareMegameters, squareKilometers, squareMeters, squareCentimeters, squareMillimeters, squareMicrometers, squareNanometers, squareInches, squareFeet, squareYards, squareMiles, acres, ares, hectares, gramsPerLiter, milligramsPerDeciliter, partsPerMillion, hours, minutes, seconds, milliseconds, microseconds, nanoseconds, picoseconds, coulombs, megaampereHours, kiloampereHours, ampereHours, milliampereHours, microampereHours, megaamperes, kiloamperes, amperes, milliamperes, microamperes, megavolts, kilovolts, volts, millivolts, microvolts, megaohms, kiloohms, ohms, milliohms, microohms, kilojoules, joules, kilocalories, calories, kilowattHours, terahertz, gigahertz, megahertz, kilohertz, hertz, millihertz, microhertz, nanohertz, framesPerSecond, litersPer100Kilometers, milesPerImperialGallon, milesPerGallon, bytes, bits, nibbles, yottabytes, zettabytes, exabytes, petabytes, terabytes, gigabytes, megabytes, kilobytes, yottabits, zettabits, exabits, petabits, terabits, gigabits, megabits, kilobits, yobibytes, zebibytes, exbibytes, pebibytes, tebibytes, gibibytes, mebibytes, kibibytes, yobibits, zebibits, exbibits, pebibits, tebibits, gibibits, mebibits, kibibits, megameters, kilometers, hectometers, decameters, meters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, feet, yards, miles, scandinavianMiles, lightyears, nauticalMiles, fathoms, furlongs, astronomicalUnits, parsecs, lux, kilograms, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, ounces, pounds, stones, metricTons, shortTons, carats, ouncesTroy, slugs, terawatts, gigawatts, megawatts, kilowatts, watts, milliwatts, microwatts, nanowatts, picowatts, femtowatts, horsepower, newtonsPerMetersSquared, gigapascals, megapascals, kilopascals, hectopascals, inchesOfMercury, bars, millibars, millimetersOfMercury, poundsForcePerSquareInch, metersPerSecond, kilometersPerHour, milesPerHour, knots, kelvin, celsius, fahrenheit, megaliters, kiloliters, liters, deciliters, centiliters, milliliters, cubicKilometers, cubicMeters, cubicDecimeters, cubicCentimeters, cubicMillimeters, cubicInches, cubicFeet, cubicYards, cubicMiles, acreFeet, bushels, teaspoons, tablespoons, fluidOunces, cups, pints, quarts, gallons, imperialTeaspoons, imperialTablespoons, imperialFluidOunces, imperialPints, imperialQuarts, imperialGallons, metricCups,
	
	becquerel, curie, rutherford
}

public extension Physical {
	static func → (left: Physical, right: PhysicalConversionType) -> Physical {
		switch right {
			case .becquerel: return left.to(UnitActivity.becquerel)
			case .curie: return left.to(UnitActivity.curie)
			case .rutherford: return left.to(UnitActivity.rutherford)
			case .m: return left.to(UnitLength.meters)
			case .J: return left.to(UnitEnergy.joules)
			case .Hz: return left.to(UnitFrequency.hertz)
			case .s: return left.to(UnitDuration.seconds)
			case .particles: return left.to(UnitAmount.particles)
			case .moles: return left.to(UnitAmount.moles)
			case .farads: return left.to(UnitElectricCapacitance.farads)
			case .siemens: return left.to(UnitElectricConductance.siemens)
			case .henries: return left.to(UnitElectricInductance.henries)
			case .newtons: return left.to(UnitForce.newtons)
			case .grays: return left.to(UnitIonizingRadiation.grays)
			case .sieverts: return left.to(UnitIonizingRadiation.sieverts)
			case .candelas: return left.to(UnitLuminousIntensity.candelas)
			case .lumens: return left.to(UnitLuminousFlux.lumens)
			case .webers: return left.to(UnitMagneticFlux.webers)
			case .teslas: return left.to(UnitMagneticFluxDensity.teslas)
			case .gauss: return left.to(UnitMagneticFluxDensity.gauss)
			case .barns: return left.to(UnitArea.barns)
			case .days: return left.to(UnitDuration.days)
			case .years: return left.to(UnitDuration.years)
			case .britishThermalUnits: return left.to(UnitEnergy.britishThermalUnits)
			case .electronvolts: return left.to(UnitEnergy.electronvolts)
			case .angstroms: return left.to(UnitLength.angstroms)
			case .pascals: return left.to(UnitPressure.pascals)
			case .atmosphericPressure: return left.to(UnitPressure.atmosphericPressure)
			case .rankine: return left.to(UnitTemperature.rankine)
			case .metersPerSecondSquared: return left.to(UnitAcceleration.metersPerSecondSquared)
			case .gravity: return left.to(UnitAcceleration.gravity)
			case .degrees: return left.to(UnitAngle.degrees)
			case .arcMinutes: return left.to(UnitAngle.arcMinutes)
			case .arcSeconds: return left.to(UnitAngle.arcSeconds)
			case .radians: return left.to(UnitAngle.radians)
			case .gradians: return left.to(UnitAngle.gradians)
			case .revolutions: return left.to(UnitAngle.revolutions)
			case .squareMegameters: return left.to(UnitArea.squareMegameters)
			case .squareKilometers: return left.to(UnitArea.squareKilometers)
			case .squareMeters: return left.to(UnitArea.squareMeters)
			case .squareCentimeters: return left.to(UnitArea.squareCentimeters)
			case .squareMillimeters: return left.to(UnitArea.squareMillimeters)
			case .squareMicrometers: return left.to(UnitArea.squareMicrometers)
			case .squareNanometers: return left.to(UnitArea.squareNanometers)
			case .squareInches: return left.to(UnitArea.squareInches)
			case .squareFeet: return left.to(UnitArea.squareFeet)
			case .squareYards: return left.to(UnitArea.squareYards)
			case .squareMiles: return left.to(UnitArea.squareMiles)
			case .acres: return left.to(UnitArea.acres)
			case .ares: return left.to(UnitArea.ares)
			case .hectares: return left.to(UnitArea.hectares)
			case .gramsPerLiter: return left.to(UnitConcentrationMass.gramsPerLiter)
			case .milligramsPerDeciliter: return left.to(UnitConcentrationMass.milligramsPerDeciliter)
			case .partsPerMillion: return left.to(UnitDispersion.partsPerMillion)
			case .hours: return left.to(UnitDuration.hours)
			case .minutes: return left.to(UnitDuration.minutes)
			case .seconds: return left.to(UnitDuration.seconds)
			case .milliseconds: return left.to(UnitDuration.milliseconds)
			case .microseconds: return left.to(UnitDuration.microseconds)
			case .nanoseconds: return left.to(UnitDuration.nanoseconds)
			case .picoseconds: return left.to(UnitDuration.picoseconds)
			case .coulombs: return left.to(UnitElectricCharge.coulombs)
			case .megaampereHours: return left.to(UnitElectricCharge.megaampereHours)
			case .kiloampereHours: return left.to(UnitElectricCharge.kiloampereHours)
			case .ampereHours: return left.to(UnitElectricCharge.ampereHours)
			case .milliampereHours: return left.to(UnitElectricCharge.milliampereHours)
			case .microampereHours: return left.to(UnitElectricCharge.microampereHours)
			case .megaamperes: return left.to(UnitElectricCurrent.megaamperes)
			case .kiloamperes: return left.to(UnitElectricCurrent.kiloamperes)
			case .amperes: return left.to(UnitElectricCurrent.amperes)
			case .milliamperes: return left.to(UnitElectricCurrent.milliamperes)
			case .microamperes: return left.to(UnitElectricCurrent.microamperes)
			case .megavolts: return left.to(UnitElectricPotentialDifference.megavolts)
			case .kilovolts: return left.to(UnitElectricPotentialDifference.kilovolts)
			case .volts: return left.to(UnitElectricPotentialDifference.volts)
			case .millivolts: return left.to(UnitElectricPotentialDifference.millivolts)
			case .microvolts: return left.to(UnitElectricPotentialDifference.microvolts)
			case .megaohms: return left.to(UnitElectricResistance.megaohms)
			case .kiloohms: return left.to(UnitElectricResistance.kiloohms)
			case .ohms: return left.to(UnitElectricResistance.ohms)
			case .milliohms: return left.to(UnitElectricResistance.milliohms)
			case .microohms: return left.to(UnitElectricResistance.microohms)
			case .kilojoules: return left.to(UnitEnergy.kilojoules)
			case .joules: return left.to(UnitEnergy.joules)
			case .kilocalories: return left.to(UnitEnergy.kilocalories)
			case .calories: return left.to(UnitEnergy.calories)
			case .kilowattHours: return left.to(UnitEnergy.kilowattHours)
			case .terahertz: return left.to(UnitFrequency.terahertz)
			case .gigahertz: return left.to(UnitFrequency.gigahertz)
			case .megahertz: return left.to(UnitFrequency.megahertz)
			case .kilohertz: return left.to(UnitFrequency.kilohertz)
			case .hertz: return left.to(UnitFrequency.hertz)
			case .millihertz: return left.to(UnitFrequency.millihertz)
			case .microhertz: return left.to(UnitFrequency.microhertz)
			case .nanohertz: return left.to(UnitFrequency.nanohertz)
			case .framesPerSecond: return left.to(UnitFrequency.framesPerSecond)
			case .litersPer100Kilometers: return left.to(UnitFuelEfficiency.litersPer100Kilometers)
			case .milesPerImperialGallon: return left.to(UnitFuelEfficiency.milesPerImperialGallon)
			case .milesPerGallon: return left.to(UnitFuelEfficiency.milesPerGallon)
			case .bytes: return left.to(UnitInformationStorage.bytes)
			case .bits: return left.to(UnitInformationStorage.bits)
			case .nibbles: return left.to(UnitInformationStorage.nibbles)
			case .yottabytes: return left.to(UnitInformationStorage.yottabytes)
			case .zettabytes: return left.to(UnitInformationStorage.zettabytes)
			case .exabytes: return left.to(UnitInformationStorage.exabytes)
			case .petabytes: return left.to(UnitInformationStorage.petabytes)
			case .terabytes: return left.to(UnitInformationStorage.terabytes)
			case .gigabytes: return left.to(UnitInformationStorage.gigabytes)
			case .megabytes: return left.to(UnitInformationStorage.megabytes)
			case .kilobytes: return left.to(UnitInformationStorage.kilobytes)
			case .yottabits: return left.to(UnitInformationStorage.yottabits)
			case .zettabits: return left.to(UnitInformationStorage.zettabits)
			case .exabits: return left.to(UnitInformationStorage.exabits)
			case .petabits: return left.to(UnitInformationStorage.petabits)
			case .terabits: return left.to(UnitInformationStorage.terabits)
			case .gigabits: return left.to(UnitInformationStorage.gigabits)
			case .megabits: return left.to(UnitInformationStorage.megabits)
			case .kilobits: return left.to(UnitInformationStorage.kilobits)
			case .yobibytes: return left.to(UnitInformationStorage.yobibytes)
			case .zebibytes: return left.to(UnitInformationStorage.zebibytes)
			case .exbibytes: return left.to(UnitInformationStorage.exbibytes)
			case .pebibytes: return left.to(UnitInformationStorage.pebibytes)
			case .tebibytes: return left.to(UnitInformationStorage.tebibytes)
			case .gibibytes: return left.to(UnitInformationStorage.gibibytes)
			case .mebibytes: return left.to(UnitInformationStorage.mebibytes)
			case .kibibytes: return left.to(UnitInformationStorage.kibibytes)
			case .yobibits: return left.to(UnitInformationStorage.yobibits)
			case .zebibits: return left.to(UnitInformationStorage.zebibits)
			case .exbibits: return left.to(UnitInformationStorage.exbibits)
			case .pebibits: return left.to(UnitInformationStorage.pebibits)
			case .tebibits: return left.to(UnitInformationStorage.tebibits)
			case .gibibits: return left.to(UnitInformationStorage.gibibits)
			case .mebibits: return left.to(UnitInformationStorage.mebibits)
			case .kibibits: return left.to(UnitInformationStorage.kibibits)
			case .megameters: return left.to(UnitLength.megameters)
			case .kilometers: return left.to(UnitLength.kilometers)
			case .hectometers: return left.to(UnitLength.hectometers)
			case .decameters: return left.to(UnitLength.decameters)
			case .meters: return left.to(UnitLength.meters)
			case .decimeters: return left.to(UnitLength.decimeters)
			case .centimeters: return left.to(UnitLength.centimeters)
			case .millimeters: return left.to(UnitLength.millimeters)
			case .micrometers: return left.to(UnitLength.micrometers)
			case .nanometers: return left.to(UnitLength.nanometers)
			case .picometers: return left.to(UnitLength.picometers)
			case .inches: return left.to(UnitLength.inches)
			case .feet: return left.to(UnitLength.feet)
			case .yards: return left.to(UnitLength.yards)
			case .miles: return left.to(UnitLength.miles)
			case .scandinavianMiles: return left.to(UnitLength.scandinavianMiles)
			case .lightyears: return left.to(UnitLength.lightyears)
			case .nauticalMiles: return left.to(UnitLength.nauticalMiles)
			case .fathoms: return left.to(UnitLength.fathoms)
			case .furlongs: return left.to(UnitLength.furlongs)
			case .astronomicalUnits: return left.to(UnitLength.astronomicalUnits)
			case .parsecs: return left.to(UnitLength.parsecs)
			case .lux: return left.to(UnitIlluminance.lux)
			case .kilograms: return left.to(UnitMass.kilograms)
			case .grams: return left.to(UnitMass.grams)
			case .decigrams: return left.to(UnitMass.decigrams)
			case .centigrams: return left.to(UnitMass.centigrams)
			case .milligrams: return left.to(UnitMass.milligrams)
			case .micrograms: return left.to(UnitMass.micrograms)
			case .nanograms: return left.to(UnitMass.nanograms)
			case .picograms: return left.to(UnitMass.picograms)
			case .ounces: return left.to(UnitMass.ounces)
			case .pounds: return left.to(UnitMass.pounds)
			case .stones: return left.to(UnitMass.stones)
			case .metricTons: return left.to(UnitMass.metricTons)
			case .shortTons: return left.to(UnitMass.shortTons)
			case .carats: return left.to(UnitMass.carats)
			case .ouncesTroy: return left.to(UnitMass.ouncesTroy)
			case .slugs: return left.to(UnitMass.slugs)
			case .terawatts: return left.to(UnitPower.terawatts)
			case .gigawatts: return left.to(UnitPower.gigawatts)
			case .megawatts: return left.to(UnitPower.megawatts)
			case .kilowatts: return left.to(UnitPower.kilowatts)
			case .watts: return left.to(UnitPower.watts)
			case .milliwatts: return left.to(UnitPower.milliwatts)
			case .microwatts: return left.to(UnitPower.microwatts)
			case .nanowatts: return left.to(UnitPower.nanowatts)
			case .picowatts: return left.to(UnitPower.picowatts)
			case .femtowatts: return left.to(UnitPower.femtowatts)
			case .horsepower: return left.to(UnitPower.horsepower)
			case .newtonsPerMetersSquared: return left.to(UnitPressure.newtonsPerMetersSquared)
			case .gigapascals: return left.to(UnitPressure.gigapascals)
			case .megapascals: return left.to(UnitPressure.megapascals)
			case .kilopascals: return left.to(UnitPressure.kilopascals)
			case .hectopascals: return left.to(UnitPressure.hectopascals)
			case .inchesOfMercury: return left.to(UnitPressure.inchesOfMercury)
			case .bars: return left.to(UnitPressure.bars)
			case .millibars: return left.to(UnitPressure.millibars)
			case .millimetersOfMercury: return left.to(UnitPressure.millimetersOfMercury)
			case .poundsForcePerSquareInch: return left.to(UnitPressure.poundsForcePerSquareInch)
			case .metersPerSecond: return left.to(UnitSpeed.metersPerSecond)
			case .kilometersPerHour: return left.to(UnitSpeed.kilometersPerHour)
			case .milesPerHour: return left.to(UnitSpeed.milesPerHour)
			case .knots: return left.to(UnitSpeed.knots)
			case .kelvin: return left.to(UnitTemperature.kelvin)
			case .celsius: return left.to(UnitTemperature.celsius)
			case .fahrenheit: return left.to(UnitTemperature.fahrenheit)
			case .megaliters: return left.to(UnitVolume.megaliters)
			case .kiloliters: return left.to(UnitVolume.kiloliters)
			case .liters: return left.to(UnitVolume.liters)
			case .deciliters: return left.to(UnitVolume.deciliters)
			case .centiliters: return left.to(UnitVolume.centiliters)
			case .milliliters: return left.to(UnitVolume.milliliters)
			case .cubicKilometers: return left.to(UnitVolume.cubicKilometers)
			case .cubicMeters: return left.to(UnitVolume.cubicMeters)
			case .cubicDecimeters: return left.to(UnitVolume.cubicDecimeters)
			case .cubicCentimeters: return left.to(UnitVolume.cubicCentimeters)
			case .cubicMillimeters: return left.to(UnitVolume.cubicMillimeters)
			case .cubicInches: return left.to(UnitVolume.cubicInches)
			case .cubicFeet: return left.to(UnitVolume.cubicFeet)
			case .cubicYards: return left.to(UnitVolume.cubicYards)
			case .cubicMiles: return left.to(UnitVolume.cubicMiles)
			case .acreFeet: return left.to(UnitVolume.acreFeet)
			case .bushels: return left.to(UnitVolume.bushels)
			case .teaspoons: return left.to(UnitVolume.teaspoons)
			case .tablespoons: return left.to(UnitVolume.tablespoons)
			case .fluidOunces: return left.to(UnitVolume.fluidOunces)
			case .cups: return left.to(UnitVolume.cups)
			case .pints: return left.to(UnitVolume.pints)
			case .quarts: return left.to(UnitVolume.quarts)
			case .gallons: return left.to(UnitVolume.gallons)
			case .imperialTeaspoons: return left.to(UnitVolume.imperialTeaspoons)
			case .imperialTablespoons: return left.to(UnitVolume.imperialTablespoons)
			case .imperialFluidOunces: return left.to(UnitVolume.imperialFluidOunces)
			case .imperialPints: return left.to(UnitVolume.imperialPints)
			case .imperialQuarts: return left.to(UnitVolume.imperialQuarts)
			case .imperialGallons: return left.to(UnitVolume.imperialGallons)
			case .metricCups: return left.to(UnitVolume.metricCups)
		}
	}
}

