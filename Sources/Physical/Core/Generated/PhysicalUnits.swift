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
	
	var atoms: Physical { atoms(1) }
	func atoms(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAmount.atoms, exponent)], sigfigs: sigfigs))
	}
	
	var beings: Physical { beings(1) }
	func beings(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAmount.beings, exponent)], sigfigs: sigfigs))
	}
	
	var people: Physical { people(1) }
	func people(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAmount.people, exponent)], sigfigs: sigfigs))
	}
	
	var things: Physical { things(1) }
	func things(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAmount.things, exponent)], sigfigs: sigfigs))
	}
	
	var moles: Physical { moles(1) }
	func moles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAmount.moles, exponent)], sigfigs: sigfigs))
	}
	
	var revolutionsPerSecond: Physical { revolutionsPerSecond(1) }
	func revolutionsPerSecond(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngularSpeed.revolutionsPerSecond, exponent)], sigfigs: sigfigs))
	}
	
	var revolutionsPerMinute: Physical { revolutionsPerMinute(1) }
	func revolutionsPerMinute(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngularSpeed.revolutionsPerMinute, exponent)], sigfigs: sigfigs))
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
	
	var cycles: Physical { revolutions(1) }
	func cycles(_ exponent: Int) -> Physical {
		merge(with: Physical(value: 1, units: [(UnitAngle.cycles, exponent)], sigfigs: sigfigs))
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
	
	
	// "per" convenience methods
	
	var perMetersPerSecondSquared: Physical { metersPerSecondSquared(-1) }
	var perGravity: Physical { gravity(-1) }
	var perDegree: Physical { degrees(-1) }
	var perArcMinute: Physical { arcMinutes(-1) }
	var perArcSecond: Physical { arcSeconds(-1) }
	var perRadian: Physical { radians(-1) }
	var perGradian: Physical { gradians(-1) }
	var perRevolution: Physical { revolutions(-1) }
	var perCycle: Physical { cycles(-1) }
	var perSquareMegameter: Physical { squareMegameters(-1) }
	var perSquareKilometer: Physical { squareKilometers(-1) }
	var perSquareMeter: Physical { squareMeters(-1) }
	var perSquareCentimeter: Physical { squareCentimeters(-1) }
	var perSquareMillimeter: Physical { squareMillimeters(-1) }
	var perSquareMicrometer: Physical { squareMicrometers(-1) }
	var perSquareNanometer: Physical { squareNanometers(-1) }
	var perSquareInche: Physical { squareInches(-1) }
	var perSquareFeet: Physical { squareFeet(-1) }
	var perSquareYard: Physical { squareYards(-1) }
	var perSquareMile: Physical { squareMiles(-1) }
	var perAcre: Physical { acres(-1) }
	var perAre: Physical { ares(-1) }
	var perHectare: Physical { hectares(-1) }
	var perGramsPerLiter: Physical { gramsPerLiter(-1) }
	var perMilligramsPerDeciliter: Physical { milligramsPerDeciliter(-1) }
	var perPartsPerMillion: Physical { partsPerMillion(-1) }
	var perHour: Physical { hours(-1) }
	var perMinute: Physical { minutes(-1) }
	var perSecond: Physical { seconds(-1) }
	var perMillisecond: Physical { milliseconds(-1) }
	var perMicrosecond: Physical { microseconds(-1) }
	var perNanosecond: Physical { nanoseconds(-1) }
	var perPicosecond: Physical { picoseconds(-1) }
	var perCoulomb: Physical { coulombs(-1) }
	var perMegaampereHour: Physical { megaampereHours(-1) }
	var perKiloampereHour: Physical { kiloampereHours(-1) }
	var perAmpereHour: Physical { ampereHours(-1) }
	var perMilliampereHour: Physical { milliampereHours(-1) }
	var perMicroampereHour: Physical { microampereHours(-1) }
	var perMegaampere: Physical { megaamperes(-1) }
	var perKiloampere: Physical { kiloamperes(-1) }
	var perAmpere: Physical { amperes(-1) }
	var perMilliampere: Physical { milliamperes(-1) }
	var perMicroampere: Physical { microamperes(-1) }
	var perMegavolt: Physical { megavolts(-1) }
	var perKilovolt: Physical { kilovolts(-1) }
	var perVolt: Physical { volts(-1) }
	var perMillivolt: Physical { millivolts(-1) }
	var perMicrovolt: Physical { microvolts(-1) }
	var perMegaohm: Physical { megaohms(-1) }
	var perKiloohm: Physical { kiloohms(-1) }
	var perOhm: Physical { ohms(-1) }
	var perMilliohm: Physical { milliohms(-1) }
	var perMicroohm: Physical { microohms(-1) }
	var perKilojoule: Physical { kilojoules(-1) }
	var perJoule: Physical { joules(-1) }
	var perKilocalorie: Physical { kilocalories(-1) }
	var perCalorie: Physical { calories(-1) }
	var perKilowattHour: Physical { kilowattHours(-1) }
	var perTerahertz: Physical { terahertz(-1) }
	var perGigahertz: Physical { gigahertz(-1) }
	var perMegahertz: Physical { megahertz(-1) }
	var perKilohertz: Physical { kilohertz(-1) }
	var perHertz: Physical { hertz(-1) }
	var perMillihertz: Physical { millihertz(-1) }
	var perMicrohertz: Physical { microhertz(-1) }
	var perNanohertz: Physical { nanohertz(-1) }
	var perFramesPerSecond: Physical { framesPerSecond(-1) }
	var perLitersPer100Kilometer: Physical { litersPer100Kilometers(-1) }
	var perMilesPerImperialGallon: Physical { milesPerImperialGallon(-1) }
	var perMilesPerGallon: Physical { milesPerGallon(-1) }
	var perByte: Physical { bytes(-1) }
	var perBit: Physical { bits(-1) }
	var perNibble: Physical { nibbles(-1) }
	var perYottabyte: Physical { yottabytes(-1) }
	var perZettabyte: Physical { zettabytes(-1) }
	var perExabyte: Physical { exabytes(-1) }
	var perPetabyte: Physical { petabytes(-1) }
	var perTerabyte: Physical { terabytes(-1) }
	var perGigabyte: Physical { gigabytes(-1) }
	var perMegabyte: Physical { megabytes(-1) }
	var perKilobyte: Physical { kilobytes(-1) }
	var perYottabit: Physical { yottabits(-1) }
	var perZettabit: Physical { zettabits(-1) }
	var perExabit: Physical { exabits(-1) }
	var perPetabit: Physical { petabits(-1) }
	var perTerabit: Physical { terabits(-1) }
	var perGigabit: Physical { gigabits(-1) }
	var perMegabit: Physical { megabits(-1) }
	var perKilobit: Physical { kilobits(-1) }
	var perYobibyte: Physical { yobibytes(-1) }
	var perZebibyte: Physical { zebibytes(-1) }
	var perExbibyte: Physical { exbibytes(-1) }
	var perPebibyte: Physical { pebibytes(-1) }
	var perTebibyte: Physical { tebibytes(-1) }
	var perGibibyte: Physical { gibibytes(-1) }
	var perMebibyte: Physical { mebibytes(-1) }
	var perKibibyte: Physical { kibibytes(-1) }
	var perYobibit: Physical { yobibits(-1) }
	var perZebibit: Physical { zebibits(-1) }
	var perExbibit: Physical { exbibits(-1) }
	var perPebibit: Physical { pebibits(-1) }
	var perTebibit: Physical { tebibits(-1) }
	var perGibibit: Physical { gibibits(-1) }
	var perMebibit: Physical { mebibits(-1) }
	var perKibibit: Physical { kibibits(-1) }
	var perMegameter: Physical { megameters(-1) }
	var perKilometer: Physical { kilometers(-1) }
	var perHectometer: Physical { hectometers(-1) }
	var perDecameter: Physical { decameters(-1) }
	var perMeter: Physical { meters(-1) }
	var perDecimeter: Physical { decimeters(-1) }
	var perCentimeter: Physical { centimeters(-1) }
	var perMillimeter: Physical { millimeters(-1) }
	var perMicrometer: Physical { micrometers(-1) }
	var perNanometer: Physical { nanometers(-1) }
	var perPicometer: Physical { picometers(-1) }
	var perInche: Physical { inches(-1) }
	var perFeet: Physical { feet(-1) }
	var perYard: Physical { yards(-1) }
	var perMile: Physical { miles(-1) }
	var perScandinavianMile: Physical { scandinavianMiles(-1) }
	var perLightyear: Physical { lightyears(-1) }
	var perNauticalMile: Physical { nauticalMiles(-1) }
	var perFathom: Physical { fathoms(-1) }
	var perFurlong: Physical { furlongs(-1) }
	var perAstronomicalUnit: Physical { astronomicalUnits(-1) }
	var perParsec: Physical { parsecs(-1) }
	var perLux: Physical { lux(-1) }
	var perKilogram: Physical { kilograms(-1) }
	var perGram: Physical { grams(-1) }
	var perDecigram: Physical { decigrams(-1) }
	var perCentigram: Physical { centigrams(-1) }
	var perMilligram: Physical { milligrams(-1) }
	var perMicrogram: Physical { micrograms(-1) }
	var perNanogram: Physical { nanograms(-1) }
	var perPicogram: Physical { picograms(-1) }
	var perOunce: Physical { ounces(-1) }
	var perPoundsMas: Physical { poundsMass(-1) }
	var perStone: Physical { stones(-1) }
	var perMetricTon: Physical { metricTons(-1) }
	var perShortTon: Physical { shortTons(-1) }
	var perCarat: Physical { carats(-1) }
	var perOuncesTroy: Physical { ouncesTroy(-1) }
	var perSlug: Physical { slugs(-1) }
	var perTerawatt: Physical { terawatts(-1) }
	var perGigawatt: Physical { gigawatts(-1) }
	var perMegawatt: Physical { megawatts(-1) }
	var perKilowatt: Physical { kilowatts(-1) }
	var perWatt: Physical { watts(-1) }
	var perMilliwatt: Physical { milliwatts(-1) }
	var perMicrowatt: Physical { microwatts(-1) }
	var perNanowatt: Physical { nanowatts(-1) }
	var perPicowatt: Physical { picowatts(-1) }
	var perFemtowatt: Physical { femtowatts(-1) }
	var perHorsepower: Physical { horsepower(-1) }
	var perNewtonsPerMetersSquared: Physical { newtonsPerMetersSquared(-1) }
	var perGigapascal: Physical { gigapascals(-1) }
	var perMegapascal: Physical { megapascals(-1) }
	var perKilopascal: Physical { kilopascals(-1) }
	var perHectopascal: Physical { hectopascals(-1) }
	var perInchesOfMercury: Physical { inchesOfMercury(-1) }
	var perBar: Physical { bars(-1) }
	var perMillibar: Physical { millibars(-1) }
	var perMillimetersOfMercury: Physical { millimetersOfMercury(-1) }
	var perPoundsForcePerSquareInch: Physical { poundsForcePerSquareInch(-1) }
	var perMetersPerSecond: Physical { metersPerSecond(-1) }
	var perKilometersPerHour: Physical { kilometersPerHour(-1) }
	var perMilesPerHour: Physical { milesPerHour(-1) }
	var perKnot: Physical { knots(-1) }
	var perKelvin: Physical { kelvin(-1) }
	var perCelsiu: Physical { celsius(-1) }
	var perFahrenheit: Physical { fahrenheit(-1) }
	var perMegaliter: Physical { megaliters(-1) }
	var perKiloliter: Physical { kiloliters(-1) }
	var perLiter: Physical { liters(-1) }
	var perDeciliter: Physical { deciliters(-1) }
	var perCentiliter: Physical { centiliters(-1) }
	var perMilliliter: Physical { milliliters(-1) }
	var perCubicKilometer: Physical { cubicKilometers(-1) }
	var perCubicMeter: Physical { cubicMeters(-1) }
	var perCubicDecimeter: Physical { cubicDecimeters(-1) }
	var perCubicCentimeter: Physical { cubicCentimeters(-1) }
	var perCubicMillimeter: Physical { cubicMillimeters(-1) }
	var perCubicInche: Physical { cubicInches(-1) }
	var perCubicFeet: Physical { cubicFeet(-1) }
	var perCubicYard: Physical { cubicYards(-1) }
	var perCubicMile: Physical { cubicMiles(-1) }
	var perAcreFeet: Physical { acreFeet(-1) }
	var perBushel: Physical { bushels(-1) }
	var perTeaspoon: Physical { teaspoons(-1) }
	var perTablespoon: Physical { tablespoons(-1) }
	var perFluidOunce: Physical { fluidOunces(-1) }
	var perCup: Physical { cups(-1) }
	var perPint: Physical { pints(-1) }
	var perQuart: Physical { quarts(-1) }
	var perGallon: Physical { gallons(-1) }
	var perImperialTeaspoon: Physical { imperialTeaspoons(-1) }
	var perImperialTablespoon: Physical { imperialTablespoons(-1) }
	var perImperialFluidOunce: Physical { imperialFluidOunces(-1) }
	var perImperialPint: Physical { imperialPints(-1) }
	var perImperialQuart: Physical { imperialQuarts(-1) }
	var perImperialGallon: Physical { imperialGallons(-1) }
	var perMetricCup: Physical { metricCups(-1) }
	
}
