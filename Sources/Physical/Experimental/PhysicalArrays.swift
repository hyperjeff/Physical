import Foundation
import Accelerate

//____________________________________________________________/ NOT GENERATED

public extension Array where Element == Double {
	static func * (left: Array, right: Double) -> Array {
		var out = left
		cblas_dscal(Int32(out.count), right, &out, 1)
		
		return out
	}
	
	static func * (left: Double, right: Array) -> Array {
		var out = right
		cblas_dscal(Int32(out.count), left, &out, 1)
		
		return out
	}
	
	static func / (left: Array, right: Double) -> Array {
		var out = left
		cblas_dscal(Int32(out.count), 1 / right, &out, 1)
		
		return out
	}
	
	static func + (left: Array, right: Array) -> Array? {
		guard left.count == right.count else { return nil }
		
		var out = right
		cblas_daxpy(Int32(out.count), 1, left, 1, &out, 1)
		
		return out
	}
	
	static func + (left: Array, right: Double) -> Array {
		var out = [Double](repeating: right, count: left.count)
		cblas_daxpy(Int32(out.count), 1, left, 1, &out, 1)
		
		return out
	}
	
	static func + (left: Double, right: Array) -> Array {
		var out = [Double](repeating: left, count: right.count)
		cblas_daxpy(Int32(out.count), 1, right, 1, &out, 1)
		
		return out
	}
	
}

public extension Array where Element == Double {
	var sigfigs: Int {
		self.map { $0.sigfigs }.max() ?? 0
	}
}

public func vectorize(_ array: [Physical]) -> Physical? {
	if let item = array.first,
	   !item.isUnitless {
		
		// perhaps we can make this safety check optional, since it takes time
		for element in array {
			if element !~ item {
				return nil
			}
		}
		
		let homogeneous = array.allSatisfy { $0 ⧖ item }
		let values: [Double]
		
		if homogeneous {
			values = array.map { $0.value }
		}
		else {
			values = array.compactMap { $0.to(units: item.units)?.value }
		}
		
		return Physical(values: values, unit: item.units.values.first!.unit, sigfigs: item.sigfigs)
	}
	
	return nil
}

public extension Physical {
	func mapp(_ transform: (Physical.ValuesType.Element) throws -> Physical) rethrows -> Physical {
		do {
			let values = try map { t in try transform(t).value }
			let value₀ = try transform(self[0])
			let units = value₀.units
			return Physical(values: values, units: units, sigfigs: value₀.sigfigs)
		}
		catch {
			// TODO: add a custom error type for this failure:
			
			throw(error)
		}
	}
	
	func repeated(_ times: Int) -> Physical {
		Physical(values: [Double](repeating: self.value, count: times), units: self.units, sigfigs: self.sigfigs)
	}
	
	var magnitude: Physical {
		if var vector = values {
			let norm = cblas_dnrm2(Int32(vector.count), &vector, 1)
			return Physical(value: norm, units: units, sigfigs: sigfigs)
		}
		
		return self
	}
	
	var x: Physical {
		if let vals = values, vals.count == 2 {
			return self[0]
		}
		
		return .notAThing
	}
	
	var height: Physical { y }
	
	var y: Physical {
		if let vals = values, vals.count == 2 {
			return self[1]
		}
		
		return .notAThing
	}
}

public extension Array where Element == Physical {
	static func → (left: Array<Physical>, right: PhysicalConversionType) -> [Physical] {
		left.map { $0 → right }
	}
}

//____________________________________________________________/ GENERATED


public extension Array where Element == Double {
	
	//____________________________________________________________/ SPECIAL CASES
	
	var constant: Physical {
		Physical(values: self, units: [:], sigfigs: 16)
	}
	
	var s: Physical {
		Physical(values: self, unit: UnitDuration.seconds)
	}
	var m: Physical {
		Physical(values: self, unit: UnitLength.meters)
	}
	var mps: Physical {
		Physical(values: self, unit: UnitSpeed.metersPerSecond)
	}
	var eV: Physical {
		Physical(values: self, unit: UnitEnergy.electronvolts)
	}
	var Ga: Physical {
		Physical(values: self, unit: UnitDuration.gigaannum)
	}
	var kg: Physical {
		Physical(values: self, unit: UnitMass.kilograms)
	}
	
	//____________________________________________________________/ FROM APPLE'S TYPES
	
	var metersPerSecondSquared: Physical { Physical(values: self, unit: UnitAcceleration.metersPerSecondSquared) }
	var gravity: Physical { Physical(values: self, unit: UnitAcceleration.gravity) }
	var degrees: Physical { Physical(values: self, unit: UnitAngle.degrees) }
	var arcMinutes: Physical { Physical(values: self, unit: UnitAngle.arcMinutes) }
	var arcSeconds: Physical { Physical(values: self, unit: UnitAngle.arcSeconds) }
	var radians: Physical { Physical(values: self, unit: UnitAngle.radians) }
	var gradians: Physical { Physical(values: self, unit: UnitAngle.gradians) }
	var revolutions: Physical { Physical(values: self, unit: UnitAngle.revolutions) }
	var squareMegameters: Physical { Physical(values: self, unit: UnitArea.squareMegameters) }
	var squareKilometers: Physical { Physical(values: self, unit: UnitArea.squareKilometers) }
	var squareMeters: Physical { Physical(values: self, unit: UnitArea.squareMeters) }
	var squareCentimeters: Physical { Physical(values: self, unit: UnitArea.squareCentimeters) }
	var squareMillimeters: Physical { Physical(values: self, unit: UnitArea.squareMillimeters) }
	var squareMicrometers: Physical { Physical(values: self, unit: UnitArea.squareMicrometers) }
	var squareNanometers: Physical { Physical(values: self, unit: UnitArea.squareNanometers) }
	var squareInches: Physical { Physical(values: self, unit: UnitArea.squareInches) }
	var squareFeet: Physical { Physical(values: self, unit: UnitArea.squareFeet) }
	var squareYards: Physical { Physical(values: self, unit: UnitArea.squareYards) }
	var squareMiles: Physical { Physical(values: self, unit: UnitArea.squareMiles) }
	var acres: Physical { Physical(values: self, unit: UnitArea.acres) }
	var ares: Physical { Physical(values: self, unit: UnitArea.ares) }
	var hectares: Physical { Physical(values: self, unit: UnitArea.hectares) }
	var gramsPerLiter: Physical { Physical(values: self, unit: UnitConcentrationMass.gramsPerLiter) }
	var milligramsPerDeciliter: Physical { Physical(values: self, unit: UnitConcentrationMass.milligramsPerDeciliter) }
	var partsPerMillion: Physical { Physical(values: self, unit: UnitDispersion.partsPerMillion) }
	var hours: Physical { Physical(values: self, unit: UnitDuration.hours) }
	var minutes: Physical { Physical(values: self, unit: UnitDuration.minutes) }
	var seconds: Physical { Physical(values: self, unit: UnitDuration.seconds) }
	var milliseconds: Physical { Physical(values: self, unit: UnitDuration.milliseconds) }
	var microseconds: Physical { Physical(values: self, unit: UnitDuration.microseconds) }
	var nanoseconds: Physical { Physical(values: self, unit: UnitDuration.nanoseconds) }
	var picoseconds: Physical { Physical(values: self, unit: UnitDuration.picoseconds) }
	var coulombs: Physical { Physical(values: self, unit: UnitElectricCharge.coulombs) }
	var megaampereHours: Physical { Physical(values: self, unit: UnitElectricCharge.megaampereHours) }
	var kiloampereHours: Physical { Physical(values: self, unit: UnitElectricCharge.kiloampereHours) }
	var ampereHours: Physical { Physical(values: self, unit: UnitElectricCharge.ampereHours) }
	var milliampereHours: Physical { Physical(values: self, unit: UnitElectricCharge.milliampereHours) }
	var microampereHours: Physical { Physical(values: self, unit: UnitElectricCharge.microampereHours) }
	var megaamperes: Physical { Physical(values: self, unit: UnitElectricCurrent.megaamperes) }
	var kiloamperes: Physical { Physical(values: self, unit: UnitElectricCurrent.kiloamperes) }
	var amperes: Physical { Physical(values: self, unit: UnitElectricCurrent.amperes) }
	var milliamperes: Physical { Physical(values: self, unit: UnitElectricCurrent.milliamperes) }
	var microamperes: Physical { Physical(values: self, unit: UnitElectricCurrent.microamperes) }
	var megavolts: Physical { Physical(values: self, unit: UnitElectricPotentialDifference.megavolts) }
	var kilovolts: Physical { Physical(values: self, unit: UnitElectricPotentialDifference.kilovolts) }
	var volts: Physical { Physical(values: self, unit: UnitElectricPotentialDifference.volts) }
	var millivolts: Physical { Physical(values: self, unit: UnitElectricPotentialDifference.millivolts) }
	var microvolts: Physical { Physical(values: self, unit: UnitElectricPotentialDifference.microvolts) }
	var megaohms: Physical { Physical(values: self, unit: UnitElectricResistance.megaohms) }
	var kiloohms: Physical { Physical(values: self, unit: UnitElectricResistance.kiloohms) }
	var ohms: Physical { Physical(values: self, unit: UnitElectricResistance.ohms) }
	var milliohms: Physical { Physical(values: self, unit: UnitElectricResistance.milliohms) }
	var microohms: Physical { Physical(values: self, unit: UnitElectricResistance.microohms) }
	var kilojoules: Physical { Physical(values: self, unit: UnitEnergy.kilojoules) }
	var joules: Physical { Physical(values: self, unit: UnitEnergy.joules) }
	var kilocalories: Physical { Physical(values: self, unit: UnitEnergy.kilocalories) }
	var calories: Physical { Physical(values: self, unit: UnitEnergy.calories) }
	var kilowattHours: Physical { Physical(values: self, unit: UnitEnergy.kilowattHours) }
	var terahertz: Physical { Physical(values: self, unit: UnitFrequency.terahertz) }
	var gigahertz: Physical { Physical(values: self, unit: UnitFrequency.gigahertz) }
	var megahertz: Physical { Physical(values: self, unit: UnitFrequency.megahertz) }
	var kilohertz: Physical { Physical(values: self, unit: UnitFrequency.kilohertz) }
	var hertz: Physical { Physical(values: self, unit: UnitFrequency.hertz) }
	var millihertz: Physical { Physical(values: self, unit: UnitFrequency.millihertz) }
	var microhertz: Physical { Physical(values: self, unit: UnitFrequency.microhertz) }
	var nanohertz: Physical { Physical(values: self, unit: UnitFrequency.nanohertz) }
	var framesPerSecond: Physical { Physical(values: self, unit: UnitFrequency.framesPerSecond) }
	var litersPer100Kilometers: Physical { Physical(values: self, unit: UnitFuelEfficiency.litersPer100Kilometers) }
	var milesPerImperialGallon: Physical { Physical(values: self, unit: UnitFuelEfficiency.milesPerImperialGallon) }
	var milesPerGallon: Physical { Physical(values: self, unit: UnitFuelEfficiency.milesPerGallon) }
	var bytes: Physical { Physical(values: self, unit: UnitInformationStorage.bytes) }
	var bits: Physical { Physical(values: self, unit: UnitInformationStorage.bits) }
	var nibbles: Physical { Physical(values: self, unit: UnitInformationStorage.nibbles) }
	var yottabytes: Physical { Physical(values: self, unit: UnitInformationStorage.yottabytes) }
	var zettabytes: Physical { Physical(values: self, unit: UnitInformationStorage.zettabytes) }
	var exabytes: Physical { Physical(values: self, unit: UnitInformationStorage.exabytes) }
	var petabytes: Physical { Physical(values: self, unit: UnitInformationStorage.petabytes) }
	var terabytes: Physical { Physical(values: self, unit: UnitInformationStorage.terabytes) }
	var gigabytes: Physical { Physical(values: self, unit: UnitInformationStorage.gigabytes) }
	var megabytes: Physical { Physical(values: self, unit: UnitInformationStorage.megabytes) }
	var kilobytes: Physical { Physical(values: self, unit: UnitInformationStorage.kilobytes) }
	var yottabits: Physical { Physical(values: self, unit: UnitInformationStorage.yottabits) }
	var zettabits: Physical { Physical(values: self, unit: UnitInformationStorage.zettabits) }
	var exabits: Physical { Physical(values: self, unit: UnitInformationStorage.exabits) }
	var petabits: Physical { Physical(values: self, unit: UnitInformationStorage.petabits) }
	var terabits: Physical { Physical(values: self, unit: UnitInformationStorage.terabits) }
	var gigabits: Physical { Physical(values: self, unit: UnitInformationStorage.gigabits) }
	var megabits: Physical { Physical(values: self, unit: UnitInformationStorage.megabits) }
	var kilobits: Physical { Physical(values: self, unit: UnitInformationStorage.kilobits) }
	var yobibytes: Physical { Physical(values: self, unit: UnitInformationStorage.yobibytes) }
	var zebibytes: Physical { Physical(values: self, unit: UnitInformationStorage.zebibytes) }
	var exbibytes: Physical { Physical(values: self, unit: UnitInformationStorage.exbibytes) }
	var pebibytes: Physical { Physical(values: self, unit: UnitInformationStorage.pebibytes) }
	var tebibytes: Physical { Physical(values: self, unit: UnitInformationStorage.tebibytes) }
	var gibibytes: Physical { Physical(values: self, unit: UnitInformationStorage.gibibytes) }
	var mebibytes: Physical { Physical(values: self, unit: UnitInformationStorage.mebibytes) }
	var kibibytes: Physical { Physical(values: self, unit: UnitInformationStorage.kibibytes) }
	var yobibits: Physical { Physical(values: self, unit: UnitInformationStorage.yobibits) }
	var zebibits: Physical { Physical(values: self, unit: UnitInformationStorage.zebibits) }
	var exbibits: Physical { Physical(values: self, unit: UnitInformationStorage.exbibits) }
	var pebibits: Physical { Physical(values: self, unit: UnitInformationStorage.pebibits) }
	var tebibits: Physical { Physical(values: self, unit: UnitInformationStorage.tebibits) }
	var gibibits: Physical { Physical(values: self, unit: UnitInformationStorage.gibibits) }
	var mebibits: Physical { Physical(values: self, unit: UnitInformationStorage.mebibits) }
	var kibibits: Physical { Physical(values: self, unit: UnitInformationStorage.kibibits) }
	var megameters: Physical { Physical(values: self, unit: UnitLength.megameters) }
	var kilometers: Physical { Physical(values: self, unit: UnitLength.kilometers) }
	var hectometers: Physical { Physical(values: self, unit: UnitLength.hectometers) }
	var decameters: Physical { Physical(values: self, unit: UnitLength.decameters) }
	var meters: Physical { Physical(values: self, unit: UnitLength.meters) }
	var decimeters: Physical { Physical(values: self, unit: UnitLength.decimeters) }
	var centimeters: Physical { Physical(values: self, unit: UnitLength.centimeters) }
	var millimeters: Physical { Physical(values: self, unit: UnitLength.millimeters) }
	var micrometers: Physical { Physical(values: self, unit: UnitLength.micrometers) }
	var nanometers: Physical { Physical(values: self, unit: UnitLength.nanometers) }
	var picometers: Physical { Physical(values: self, unit: UnitLength.picometers) }
	var inches: Physical { Physical(values: self, unit: UnitLength.inches) }
	var feet: Physical { Physical(values: self, unit: UnitLength.feet) }
	var yards: Physical { Physical(values: self, unit: UnitLength.yards) }
	var miles: Physical { Physical(values: self, unit: UnitLength.miles) }
	var scandinavianMiles: Physical { Physical(values: self, unit: UnitLength.scandinavianMiles) }
	var lightyears: Physical { Physical(values: self, unit: UnitLength.lightyears) }
	var nauticalMiles: Physical { Physical(values: self, unit: UnitLength.nauticalMiles) }
	var fathoms: Physical { Physical(values: self, unit: UnitLength.fathoms) }
	var furlongs: Physical { Physical(values: self, unit: UnitLength.furlongs) }
	var astronomicalUnits: Physical { Physical(values: self, unit: UnitLength.astronomicalUnits) }
	var parsecs: Physical { Physical(values: self, unit: UnitLength.parsecs) }
	var lux: Physical { Physical(values: self, unit: UnitIlluminance.lux) }
	var kilograms: Physical { Physical(values: self, unit: UnitMass.kilograms) }
	var grams: Physical { Physical(values: self, unit: UnitMass.grams) }
	var decigrams: Physical { Physical(values: self, unit: UnitMass.decigrams) }
	var centigrams: Physical { Physical(values: self, unit: UnitMass.centigrams) }
	var milligrams: Physical { Physical(values: self, unit: UnitMass.milligrams) }
	var micrograms: Physical { Physical(values: self, unit: UnitMass.micrograms) }
	var nanograms: Physical { Physical(values: self, unit: UnitMass.nanograms) }
	var picograms: Physical { Physical(values: self, unit: UnitMass.picograms) }
	var ounces: Physical { Physical(values: self, unit: UnitMass.ounces) }
	var poundsMass: Physical { Physical(values: self, unit: UnitMass.pounds) }
	var stones: Physical { Physical(values: self, unit: UnitMass.stones) }
	var metricTons: Physical { Physical(values: self, unit: UnitMass.metricTons) }
	var shortTons: Physical { Physical(values: self, unit: UnitMass.shortTons) }
	var carats: Physical { Physical(values: self, unit: UnitMass.carats) }
	var ouncesTroy: Physical { Physical(values: self, unit: UnitMass.ouncesTroy) }
	var slugs: Physical { Physical(values: self, unit: UnitMass.slugs) }
	var terawatts: Physical { Physical(values: self, unit: UnitPower.terawatts) }
	var gigawatts: Physical { Physical(values: self, unit: UnitPower.gigawatts) }
	var megawatts: Physical { Physical(values: self, unit: UnitPower.megawatts) }
	var kilowatts: Physical { Physical(values: self, unit: UnitPower.kilowatts) }
	var watts: Physical { Physical(values: self, unit: UnitPower.watts) }
	var milliwatts: Physical { Physical(values: self, unit: UnitPower.milliwatts) }
	var microwatts: Physical { Physical(values: self, unit: UnitPower.microwatts) }
	var nanowatts: Physical { Physical(values: self, unit: UnitPower.nanowatts) }
	var picowatts: Physical { Physical(values: self, unit: UnitPower.picowatts) }
	var femtowatts: Physical { Physical(values: self, unit: UnitPower.femtowatts) }
	var horsepower: Physical { Physical(values: self, unit: UnitPower.horsepower) }
	var newtonsPerMetersSquared: Physical { Physical(values: self, unit: UnitPressure.newtonsPerMetersSquared) }
	var gigapascals: Physical { Physical(values: self, unit: UnitPressure.gigapascals) }
	var megapascals: Physical { Physical(values: self, unit: UnitPressure.megapascals) }
	var kilopascals: Physical { Physical(values: self, unit: UnitPressure.kilopascals) }
	var hectopascals: Physical { Physical(values: self, unit: UnitPressure.hectopascals) }
	var inchesOfMercury: Physical { Physical(values: self, unit: UnitPressure.inchesOfMercury) }
	var bars: Physical { Physical(values: self, unit: UnitPressure.bars) }
	var millibars: Physical { Physical(values: self, unit: UnitPressure.millibars) }
	var millimetersOfMercury: Physical { Physical(values: self, unit: UnitPressure.millimetersOfMercury) }
	var poundsForcePerSquareInch: Physical { Physical(values: self, unit: UnitPressure.poundsForcePerSquareInch) }
	var metersPerSecond: Physical { Physical(values: self, unit: UnitSpeed.metersPerSecond) }
	var kilometersPerHour: Physical { Physical(values: self, unit: UnitSpeed.kilometersPerHour) }
	var milesPerHour: Physical { Physical(values: self, unit: UnitSpeed.milesPerHour) }
	var knots: Physical { Physical(values: self, unit: UnitSpeed.knots) }
	var kelvin: Physical { Physical(values: self, unit: UnitTemperature.kelvin) }
	var celsius: Physical { Physical(values: self, unit: UnitTemperature.celsius) }
	var fahrenheit: Physical { Physical(values: self, unit: UnitTemperature.fahrenheit) }
	var megaliters: Physical { Physical(values: self, unit: UnitVolume.megaliters) }
	var kiloliters: Physical { Physical(values: self, unit: UnitVolume.kiloliters) }
	var liters: Physical { Physical(values: self, unit: UnitVolume.liters) }
	var deciliters: Physical { Physical(values: self, unit: UnitVolume.deciliters) }
	var centiliters: Physical { Physical(values: self, unit: UnitVolume.centiliters) }
	var milliliters: Physical { Physical(values: self, unit: UnitVolume.milliliters) }
	var cubicKilometers: Physical { Physical(values: self, unit: UnitVolume.cubicKilometers) }
	var cubicMeters: Physical { Physical(values: self, unit: UnitVolume.cubicMeters) }
	var cubicDecimeters: Physical { Physical(values: self, unit: UnitVolume.cubicDecimeters) }
	var cubicCentimeters: Physical { Physical(values: self, unit: UnitVolume.cubicCentimeters) }
	var cubicMillimeters: Physical { Physical(values: self, unit: UnitVolume.cubicMillimeters) }
	var cubicInches: Physical { Physical(values: self, unit: UnitVolume.cubicInches) }
	var cubicFeet: Physical { Physical(values: self, unit: UnitVolume.cubicFeet) }
	var cubicYards: Physical { Physical(values: self, unit: UnitVolume.cubicYards) }
	var cubicMiles: Physical { Physical(values: self, unit: UnitVolume.cubicMiles) }
	var acreFeet: Physical { Physical(values: self, unit: UnitVolume.acreFeet) }
	var bushels: Physical { Physical(values: self, unit: UnitVolume.bushels) }
	var teaspoons: Physical { Physical(values: self, unit: UnitVolume.teaspoons) }
	var tablespoons: Physical { Physical(values: self, unit: UnitVolume.tablespoons) }
	var fluidOunces: Physical { Physical(values: self, unit: UnitVolume.fluidOunces) }
	var cups: Physical { Physical(values: self, unit: UnitVolume.cups) }
	var pints: Physical { Physical(values: self, unit: UnitVolume.pints) }
	var quarts: Physical { Physical(values: self, unit: UnitVolume.quarts) }
	var gallons: Physical { Physical(values: self, unit: UnitVolume.gallons) }
	var imperialTeaspoons: Physical { Physical(values: self, unit: UnitVolume.imperialTeaspoons) }
	var imperialTablespoons: Physical { Physical(values: self, unit: UnitVolume.imperialTablespoons) }
	var imperialFluidOunces: Physical { Physical(values: self, unit: UnitVolume.imperialFluidOunces) }
	var imperialPints: Physical { Physical(values: self, unit: UnitVolume.imperialPints) }
	var imperialQuarts: Physical { Physical(values: self, unit: UnitVolume.imperialQuarts) }
	var imperialGallons: Physical { Physical(values: self, unit: UnitVolume.imperialGallons) }
	var metricCups: Physical { Physical(values: self, unit: UnitVolume.metricCups) }
	
	// "per" functions
	
	var perMetersPerSecondSquared: Physical { Physical(values: self, units: [(UnitAcceleration.metersPerSecondSquared, -1)], sigfigs: 16) }
	var perGravity: Physical { Physical(values: self, units: [(UnitAcceleration.gravity, -1)], sigfigs: 16) }
	var perDegree: Physical { Physical(values: self, units: [(UnitAngle.degrees, -1)], sigfigs: 16) }
	var perArcMinute: Physical { Physical(values: self, units: [(UnitAngle.arcMinutes, -1)], sigfigs: 16) }
	var perArcSecond: Physical { Physical(values: self, units: [(UnitAngle.arcSeconds, -1)], sigfigs: 16) }
	var perRadian: Physical { Physical(values: self, units: [(UnitAngle.radians, -1)], sigfigs: 16) }
	var perGradian: Physical { Physical(values: self, units: [(UnitAngle.gradians, -1)], sigfigs: 16) }
	var perRevolution: Physical { Physical(values: self, units: [(UnitAngle.revolutions, -1)], sigfigs: 16) }
	var perSquareMegameter: Physical { Physical(values: self, units: [(UnitArea.squareMegameters, -1)], sigfigs: 16) }
	var perSquareKilometer: Physical { Physical(values: self, units: [(UnitArea.squareKilometers, -1)], sigfigs: 16) }
	var perSquareMeter: Physical { Physical(values: self, units: [(UnitArea.squareMeters, -1)], sigfigs: 16) }
	var perSquareCentimeter: Physical { Physical(values: self, units: [(UnitArea.squareCentimeters, -1)], sigfigs: 16) }
	var perSquareMillimeter: Physical { Physical(values: self, units: [(UnitArea.squareMillimeters, -1)], sigfigs: 16) }
	var perSquareMicrometer: Physical { Physical(values: self, units: [(UnitArea.squareMicrometers, -1)], sigfigs: 16) }
	var perSquareNanometer: Physical { Physical(values: self, units: [(UnitArea.squareNanometers, -1)], sigfigs: 16) }
	var perSquareInche: Physical { Physical(values: self, units: [(UnitArea.squareInches, -1)], sigfigs: 16) }
	var perSquareFeet: Physical { Physical(values: self, units: [(UnitArea.squareFeet, -1)], sigfigs: 16) }
	var perSquareYard: Physical { Physical(values: self, units: [(UnitArea.squareYards, -1)], sigfigs: 16) }
	var perSquareMile: Physical { Physical(values: self, units: [(UnitArea.squareMiles, -1)], sigfigs: 16) }
	var perAcre: Physical { Physical(values: self, units: [(UnitArea.acres, -1)], sigfigs: 16) }
	var perAre: Physical { Physical(values: self, units: [(UnitArea.ares, -1)], sigfigs: 16) }
	var perHectare: Physical { Physical(values: self, units: [(UnitArea.hectares, -1)], sigfigs: 16) }
	var perGramsPerLiter: Physical { Physical(values: self, units: [(UnitConcentrationMass.gramsPerLiter, -1)], sigfigs: 16) }
	var perMilligramsPerDeciliter: Physical { Physical(values: self, units: [(UnitConcentrationMass.milligramsPerDeciliter, -1)], sigfigs: 16) }
	var perPartsPerMillion: Physical { Physical(values: self, units: [(UnitDispersion.partsPerMillion, -1)], sigfigs: 16) }
	var perHour: Physical { Physical(values: self, units: [(UnitDuration.hours, -1)], sigfigs: 16) }
	var perMinute: Physical { Physical(values: self, units: [(UnitDuration.minutes, -1)], sigfigs: 16) }
	var perSecond: Physical { Physical(values: self, units: [(UnitDuration.seconds, -1)], sigfigs: 16) }
	var perMillisecond: Physical { Physical(values: self, units: [(UnitDuration.milliseconds, -1)], sigfigs: 16) }
	var perMicrosecond: Physical { Physical(values: self, units: [(UnitDuration.microseconds, -1)], sigfigs: 16) }
	var perNanosecond: Physical { Physical(values: self, units: [(UnitDuration.nanoseconds, -1)], sigfigs: 16) }
	var perPicosecond: Physical { Physical(values: self, units: [(UnitDuration.picoseconds, -1)], sigfigs: 16) }
	var perCoulomb: Physical { Physical(values: self, units: [(UnitElectricCharge.coulombs, -1)], sigfigs: 16) }
	var perMegaampereHour: Physical { Physical(values: self, units: [(UnitElectricCharge.megaampereHours, -1)], sigfigs: 16) }
	var perKiloampereHour: Physical { Physical(values: self, units: [(UnitElectricCharge.kiloampereHours, -1)], sigfigs: 16) }
	var perAmpereHour: Physical { Physical(values: self, units: [(UnitElectricCharge.ampereHours, -1)], sigfigs: 16) }
	var perMilliampereHour: Physical { Physical(values: self, units: [(UnitElectricCharge.milliampereHours, -1)], sigfigs: 16) }
	var perMicroampereHour: Physical { Physical(values: self, units: [(UnitElectricCharge.microampereHours, -1)], sigfigs: 16) }
	var perMegaampere: Physical { Physical(values: self, units: [(UnitElectricCurrent.megaamperes, -1)], sigfigs: 16) }
	var perKiloampere: Physical { Physical(values: self, units: [(UnitElectricCurrent.kiloamperes, -1)], sigfigs: 16) }
	var perAmpere: Physical { Physical(values: self, units: [(UnitElectricCurrent.amperes, -1)], sigfigs: 16) }
	var perMilliampere: Physical { Physical(values: self, units: [(UnitElectricCurrent.milliamperes, -1)], sigfigs: 16) }
	var perMicroampere: Physical { Physical(values: self, units: [(UnitElectricCurrent.microamperes, -1)], sigfigs: 16) }
	var perMegavolt: Physical { Physical(values: self, units: [(UnitElectricPotentialDifference.megavolts, -1)], sigfigs: 16) }
	var perKilovolt: Physical { Physical(values: self, units: [(UnitElectricPotentialDifference.kilovolts, -1)], sigfigs: 16) }
	var perVolt: Physical { Physical(values: self, units: [(UnitElectricPotentialDifference.volts, -1)], sigfigs: 16) }
	var perMillivolt: Physical { Physical(values: self, units: [(UnitElectricPotentialDifference.millivolts, -1)], sigfigs: 16) }
	var perMicrovolt: Physical { Physical(values: self, units: [(UnitElectricPotentialDifference.microvolts, -1)], sigfigs: 16) }
	var perMegaohm: Physical { Physical(values: self, units: [(UnitElectricResistance.megaohms, -1)], sigfigs: 16) }
	var perKiloohm: Physical { Physical(values: self, units: [(UnitElectricResistance.kiloohms, -1)], sigfigs: 16) }
	var perOhm: Physical { Physical(values: self, units: [(UnitElectricResistance.ohms, -1)], sigfigs: 16) }
	var perMilliohm: Physical { Physical(values: self, units: [(UnitElectricResistance.milliohms, -1)], sigfigs: 16) }
	var perMicroohm: Physical { Physical(values: self, units: [(UnitElectricResistance.microohms, -1)], sigfigs: 16) }
	var perKilojoule: Physical { Physical(values: self, units: [(UnitEnergy.kilojoules, -1)], sigfigs: 16) }
	var perJoule: Physical { Physical(values: self, units: [(UnitEnergy.joules, -1)], sigfigs: 16) }
	var perKilocalorie: Physical { Physical(values: self, units: [(UnitEnergy.kilocalories, -1)], sigfigs: 16) }
	var perCalorie: Physical { Physical(values: self, units: [(UnitEnergy.calories, -1)], sigfigs: 16) }
	var perKilowattHour: Physical { Physical(values: self, units: [(UnitEnergy.kilowattHours, -1)], sigfigs: 16) }
	var perTerahertz: Physical { Physical(values: self, units: [(UnitFrequency.terahertz, -1)], sigfigs: 16) }
	var perGigahertz: Physical { Physical(values: self, units: [(UnitFrequency.gigahertz, -1)], sigfigs: 16) }
	var perMegahertz: Physical { Physical(values: self, units: [(UnitFrequency.megahertz, -1)], sigfigs: 16) }
	var perKilohertz: Physical { Physical(values: self, units: [(UnitFrequency.kilohertz, -1)], sigfigs: 16) }
	var perHertz: Physical { Physical(values: self, units: [(UnitFrequency.hertz, -1)], sigfigs: 16) }
	var perMillihertz: Physical { Physical(values: self, units: [(UnitFrequency.millihertz, -1)], sigfigs: 16) }
	var perMicrohertz: Physical { Physical(values: self, units: [(UnitFrequency.microhertz, -1)], sigfigs: 16) }
	var perNanohertz: Physical { Physical(values: self, units: [(UnitFrequency.nanohertz, -1)], sigfigs: 16) }
	var perFramesPerSecond: Physical { Physical(values: self, units: [(UnitFrequency.framesPerSecond, -1)], sigfigs: 16) }
//	var perLitersPer100Kilometer: Physical { Physical(values: self, units: [(UnitFuelEfficiency.litersPer100Kilometers, -1, sigfigs: 16)]) }
	var perMilesPerImperialGallon: Physical { Physical(values: self, units: [(UnitFuelEfficiency.milesPerImperialGallon, -1)], sigfigs: 16) }
	var perMilesPerGallon: Physical { Physical(values: self, units: [(UnitFuelEfficiency.milesPerGallon, -1)], sigfigs: 16) }
	var perByte: Physical { Physical(values: self, units: [(UnitInformationStorage.bytes, -1)], sigfigs: 16) }
	var perBit: Physical { Physical(values: self, units: [(UnitInformationStorage.bits, -1)], sigfigs: 16) }
	var perNibble: Physical { Physical(values: self, units: [(UnitInformationStorage.nibbles, -1)], sigfigs: 16) }
	var perYottabyte: Physical { Physical(values: self, units: [(UnitInformationStorage.yottabytes, -1)], sigfigs: 16) }
	var perZettabyte: Physical { Physical(values: self, units: [(UnitInformationStorage.zettabytes, -1)], sigfigs: 16) }
	var perExabyte: Physical { Physical(values: self, units: [(UnitInformationStorage.exabytes, -1)], sigfigs: 16) }
	var perPetabyte: Physical { Physical(values: self, units: [(UnitInformationStorage.petabytes, -1)], sigfigs: 16) }
	var perTerabyte: Physical { Physical(values: self, units: [(UnitInformationStorage.terabytes, -1)], sigfigs: 16) }
	var perGigabyte: Physical { Physical(values: self, units: [(UnitInformationStorage.gigabytes, -1)], sigfigs: 16) }
	var perMegabyte: Physical { Physical(values: self, units: [(UnitInformationStorage.megabytes, -1)], sigfigs: 16) }
	var perKilobyte: Physical { Physical(values: self, units: [(UnitInformationStorage.kilobytes, -1)], sigfigs: 16) }
	var perYottabit: Physical { Physical(values: self, units: [(UnitInformationStorage.yottabits, -1)], sigfigs: 16) }
	var perZettabit: Physical { Physical(values: self, units: [(UnitInformationStorage.zettabits, -1)], sigfigs: 16) }
	var perExabit: Physical { Physical(values: self, units: [(UnitInformationStorage.exabits, -1)], sigfigs: 16) }
	var perPetabit: Physical { Physical(values: self, units: [(UnitInformationStorage.petabits, -1)], sigfigs: 16) }
	var perTerabit: Physical { Physical(values: self, units: [(UnitInformationStorage.terabits, -1)], sigfigs: 16) }
	var perGigabit: Physical { Physical(values: self, units: [(UnitInformationStorage.gigabits, -1)], sigfigs: 16) }
	var perMegabit: Physical { Physical(values: self, units: [(UnitInformationStorage.megabits, -1)], sigfigs: 16) }
	var perKilobit: Physical { Physical(values: self, units: [(UnitInformationStorage.kilobits, -1)], sigfigs: 16) }
	var perYobibyte: Physical { Physical(values: self, units: [(UnitInformationStorage.yobibytes, -1)], sigfigs: 16) }
	var perZebibyte: Physical { Physical(values: self, units: [(UnitInformationStorage.zebibytes, -1)], sigfigs: 16) }
	var perExbibyte: Physical { Physical(values: self, units: [(UnitInformationStorage.exbibytes, -1)], sigfigs: 16) }
	var perPebibyte: Physical { Physical(values: self, units: [(UnitInformationStorage.pebibytes, -1)], sigfigs: 16) }
	var perTebibyte: Physical { Physical(values: self, units: [(UnitInformationStorage.tebibytes, -1)], sigfigs: 16) }
	var perGibibyte: Physical { Physical(values: self, units: [(UnitInformationStorage.gibibytes, -1)], sigfigs: 16) }
	var perMebibyte: Physical { Physical(values: self, units: [(UnitInformationStorage.mebibytes, -1)], sigfigs: 16) }
	var perKibibyte: Physical { Physical(values: self, units: [(UnitInformationStorage.kibibytes, -1)], sigfigs: 16) }
	var perYobibit: Physical { Physical(values: self, units: [(UnitInformationStorage.yobibits, -1)], sigfigs: 16) }
	var perZebibit: Physical { Physical(values: self, units: [(UnitInformationStorage.zebibits, -1)], sigfigs: 16) }
	var perExbibit: Physical { Physical(values: self, units: [(UnitInformationStorage.exbibits, -1)], sigfigs: 16) }
	var perPebibit: Physical { Physical(values: self, units: [(UnitInformationStorage.pebibits, -1)], sigfigs: 16) }
	var perTebibit: Physical { Physical(values: self, units: [(UnitInformationStorage.tebibits, -1)], sigfigs: 16) }
	var perGibibit: Physical { Physical(values: self, units: [(UnitInformationStorage.gibibits, -1)], sigfigs: 16) }
	var perMebibit: Physical { Physical(values: self, units: [(UnitInformationStorage.mebibits, -1)], sigfigs: 16) }
	var perKibibit: Physical { Physical(values: self, units: [(UnitInformationStorage.kibibits, -1)], sigfigs: 16) }
	var perMegameter: Physical { Physical(values: self, units: [(UnitLength.megameters, -1)], sigfigs: 16) }
	var perKilometer: Physical { Physical(values: self, units: [(UnitLength.kilometers, -1)], sigfigs: 16) }
	var perHectometer: Physical { Physical(values: self, units: [(UnitLength.hectometers, -1)], sigfigs: 16) }
	var perDecameter: Physical { Physical(values: self, units: [(UnitLength.decameters, -1)], sigfigs: 16) }
	var perMeter: Physical { Physical(values: self, units: [(UnitLength.meters, -1)], sigfigs: 16) }
	var perDecimeter: Physical { Physical(values: self, units: [(UnitLength.decimeters, -1)], sigfigs: 16) }
	var perCentimeter: Physical { Physical(values: self, units: [(UnitLength.centimeters, -1)], sigfigs: 16) }
	var perMillimeter: Physical { Physical(values: self, units: [(UnitLength.millimeters, -1)], sigfigs: 16) }
	var perMicrometer: Physical { Physical(values: self, units: [(UnitLength.micrometers, -1)], sigfigs: 16) }
	var perNanometer: Physical { Physical(values: self, units: [(UnitLength.nanometers, -1)], sigfigs: 16) }
	var perPicometer: Physical { Physical(values: self, units: [(UnitLength.picometers, -1)], sigfigs: 16) }
	var perInche: Physical { Physical(values: self, units: [(UnitLength.inches, -1)], sigfigs: 16) }
	var perFeet: Physical { Physical(values: self, units: [(UnitLength.feet, -1)], sigfigs: 16) }
	var perYard: Physical { Physical(values: self, units: [(UnitLength.yards, -1)], sigfigs: 16) }
	var perMile: Physical { Physical(values: self, units: [(UnitLength.miles, -1)], sigfigs: 16) }
	var perScandinavianMile: Physical { Physical(values: self, units: [(UnitLength.scandinavianMiles, -1)], sigfigs: 16) }
	var perLightyear: Physical { Physical(values: self, units: [(UnitLength.lightyears, -1)], sigfigs: 16) }
	var perNauticalMile: Physical { Physical(values: self, units: [(UnitLength.nauticalMiles, -1)], sigfigs: 16) }
	var perFathom: Physical { Physical(values: self, units: [(UnitLength.fathoms, -1)], sigfigs: 16) }
	var perFurlong: Physical { Physical(values: self, units: [(UnitLength.furlongs, -1)], sigfigs: 16) }
	var perAstronomicalUnit: Physical { Physical(values: self, units: [(UnitLength.astronomicalUnits, -1)], sigfigs: 16) }
	var perParsec: Physical { Physical(values: self, units: [(UnitLength.parsecs, -1)], sigfigs: 16) }
	var perLux: Physical { Physical(values: self, units: [(UnitIlluminance.lux, -1)], sigfigs: 16) }
	var perKilogram: Physical { Physical(values: self, units: [(UnitMass.kilograms, -1)], sigfigs: 16) }
	var perGram: Physical { Physical(values: self, units: [(UnitMass.grams, -1)], sigfigs: 16) }
	var perDecigram: Physical { Physical(values: self, units: [(UnitMass.decigrams, -1)], sigfigs: 16) }
	var perCentigram: Physical { Physical(values: self, units: [(UnitMass.centigrams, -1)], sigfigs: 16) }
	var perMilligram: Physical { Physical(values: self, units: [(UnitMass.milligrams, -1)], sigfigs: 16) }
	var perMicrogram: Physical { Physical(values: self, units: [(UnitMass.micrograms, -1)], sigfigs: 16) }
	var perNanogram: Physical { Physical(values: self, units: [(UnitMass.nanograms, -1)], sigfigs: 16) }
	var perPicogram: Physical { Physical(values: self, units: [(UnitMass.picograms, -1)], sigfigs: 16) }
	var perOunce: Physical { Physical(values: self, units: [(UnitMass.ounces, -1)], sigfigs: 16) }
	var perPoundsMass: Physical { Physical(values: self, units: [(UnitMass.pounds, -1)], sigfigs: 16) }
	var perStone: Physical { Physical(values: self, units: [(UnitMass.stones, -1)], sigfigs: 16) }
	var perMetricTon: Physical { Physical(values: self, units: [(UnitMass.metricTons, -1)], sigfigs: 16) }
	var perShortTon: Physical { Physical(values: self, units: [(UnitMass.shortTons, -1)], sigfigs: 16) }
	var perCarat: Physical { Physical(values: self, units: [(UnitMass.carats, -1)], sigfigs: 16) }
	var perOuncesTroy: Physical { Physical(values: self, units: [(UnitMass.ouncesTroy, -1)], sigfigs: 16) }
	var perSlug: Physical { Physical(values: self, units: [(UnitMass.slugs, -1)], sigfigs: 16) }
	var perTerawatt: Physical { Physical(values: self, units: [(UnitPower.terawatts, -1)], sigfigs: 16) }
	var perGigawatt: Physical { Physical(values: self, units: [(UnitPower.gigawatts, -1)], sigfigs: 16) }
	var perMegawatt: Physical { Physical(values: self, units: [(UnitPower.megawatts, -1)], sigfigs: 16) }
	var perKilowatt: Physical { Physical(values: self, units: [(UnitPower.kilowatts, -1)], sigfigs: 16) }
	var perWatt: Physical { Physical(values: self, units: [(UnitPower.watts, -1)], sigfigs: 16) }
	var perMilliwatt: Physical { Physical(values: self, units: [(UnitPower.milliwatts, -1)], sigfigs: 16) }
	var perMicrowatt: Physical { Physical(values: self, units: [(UnitPower.microwatts, -1)], sigfigs: 16) }
	var perNanowatt: Physical { Physical(values: self, units: [(UnitPower.nanowatts, -1)], sigfigs: 16) }
	var perPicowatt: Physical { Physical(values: self, units: [(UnitPower.picowatts, -1)], sigfigs: 16) }
	var perFemtowatt: Physical { Physical(values: self, units: [(UnitPower.femtowatts, -1)], sigfigs: 16) }
	var perHorsepower: Physical { Physical(values: self, units: [(UnitPower.horsepower, -1)], sigfigs: 16) }
	var perNewtonsPerMetersSquared: Physical { Physical(values: self, units: [(UnitPressure.newtonsPerMetersSquared, -1)], sigfigs: 16) }
	var perGigapascal: Physical { Physical(values: self, units: [(UnitPressure.gigapascals, -1)], sigfigs: 16) }
	var perMegapascal: Physical { Physical(values: self, units: [(UnitPressure.megapascals, -1)], sigfigs: 16) }
	var perKilopascal: Physical { Physical(values: self, units: [(UnitPressure.kilopascals, -1)], sigfigs: 16) }
	var perHectopascal: Physical { Physical(values: self, units: [(UnitPressure.hectopascals, -1)], sigfigs: 16) }
	var perInchesOfMercury: Physical { Physical(values: self, units: [(UnitPressure.inchesOfMercury, -1)], sigfigs: 16) }
	var perBar: Physical { Physical(values: self, units: [(UnitPressure.bars, -1)], sigfigs: 16) }
	var perMillibar: Physical { Physical(values: self, units: [(UnitPressure.millibars, -1)], sigfigs: 16) }
	var perMillimetersOfMercury: Physical { Physical(values: self, units: [(UnitPressure.millimetersOfMercury, -1)], sigfigs: 16) }
	var perPoundsForcePerSquareInch: Physical { Physical(values: self, units: [(UnitPressure.poundsForcePerSquareInch, -1)], sigfigs: 16) }
	var perMetersPerSecond: Physical { Physical(values: self, units: [(UnitSpeed.metersPerSecond, -1)], sigfigs: 16) }
	var perKilometersPerHour: Physical { Physical(values: self, units: [(UnitSpeed.kilometersPerHour, -1)], sigfigs: 16) }
	var perMilesPerHour: Physical { Physical(values: self, units: [(UnitSpeed.milesPerHour, -1)], sigfigs: 16) }
	var perKnot: Physical { Physical(values: self, units: [(UnitSpeed.knots, -1)], sigfigs: 16) }
	var perKelvin: Physical { Physical(values: self, units: [(UnitTemperature.kelvin, -1)], sigfigs: 16) }
	var perCelsius: Physical { Physical(values: self, units: [(UnitTemperature.celsius, -1)], sigfigs: 16) }
	var perFahrenheit: Physical { Physical(values: self, units: [(UnitTemperature.fahrenheit, -1)], sigfigs: 16) }
	var perMegaliter: Physical { Physical(values: self, units: [(UnitVolume.megaliters, -1)], sigfigs: 16) }
	var perKiloliter: Physical { Physical(values: self, units: [(UnitVolume.kiloliters, -1)], sigfigs: 16) }
	var perLiter: Physical { Physical(values: self, units: [(UnitVolume.liters, -1)], sigfigs: 16) }
	var perDeciliter: Physical { Physical(values: self, units: [(UnitVolume.deciliters, -1)], sigfigs: 16) }
	var perCentiliter: Physical { Physical(values: self, units: [(UnitVolume.centiliters, -1)], sigfigs: 16) }
	var perMilliliter: Physical { Physical(values: self, units: [(UnitVolume.milliliters, -1)], sigfigs: 16) }
	var perCubicKilometer: Physical { Physical(values: self, units: [(UnitVolume.cubicKilometers, -1)], sigfigs: 16) }
	var perCubicMeter: Physical { Physical(values: self, units: [(UnitVolume.cubicMeters, -1)], sigfigs: 16) }
	var perCubicDecimeter: Physical { Physical(values: self, units: [(UnitVolume.cubicDecimeters, -1)], sigfigs: 16) }
	var perCubicCentimeter: Physical { Physical(values: self, units: [(UnitVolume.cubicCentimeters, -1)], sigfigs: 16) }
	var perCubicMillimeter: Physical { Physical(values: self, units: [(UnitVolume.cubicMillimeters, -1)], sigfigs: 16) }
	var perCubicInche: Physical { Physical(values: self, units: [(UnitVolume.cubicInches, -1)], sigfigs: 16) }
	var perCubicFeet: Physical { Physical(values: self, units: [(UnitVolume.cubicFeet, -1)], sigfigs: 16) }
	var perCubicYard: Physical { Physical(values: self, units: [(UnitVolume.cubicYards, -1)], sigfigs: 16) }
	var perCubicMile: Physical { Physical(values: self, units: [(UnitVolume.cubicMiles, -1)], sigfigs: 16) }
	var perAcreFeet: Physical { Physical(values: self, units: [(UnitVolume.acreFeet, -1)], sigfigs: 16) }
	var perBushel: Physical { Physical(values: self, units: [(UnitVolume.bushels, -1)], sigfigs: 16) }
	var perTeaspoon: Physical { Physical(values: self, units: [(UnitVolume.teaspoons, -1)], sigfigs: 16) }
	var perTablespoon: Physical { Physical(values: self, units: [(UnitVolume.tablespoons, -1)], sigfigs: 16) }
	var perFluidOunce: Physical { Physical(values: self, units: [(UnitVolume.fluidOunces, -1)], sigfigs: 16) }
	var perCup: Physical { Physical(values: self, units: [(UnitVolume.cups, -1)], sigfigs: 16) }
	var perPint: Physical { Physical(values: self, units: [(UnitVolume.pints, -1)], sigfigs: 16) }
	var perQuart: Physical { Physical(values: self, units: [(UnitVolume.quarts, -1)], sigfigs: 16) }
	var perGallon: Physical { Physical(values: self, units: [(UnitVolume.gallons, -1)], sigfigs: 16) }
	var perImperialTeaspoon: Physical { Physical(values: self, units: [(UnitVolume.imperialTeaspoons, -1)], sigfigs: 16) }
	var perImperialTablespoon: Physical { Physical(values: self, units: [(UnitVolume.imperialTablespoons, -1)], sigfigs: 16) }
	var perImperialFluidOunce: Physical { Physical(values: self, units: [(UnitVolume.imperialFluidOunces, -1)], sigfigs: 16) }
	var perImperialPint: Physical { Physical(values: self, units: [(UnitVolume.imperialPints, -1)], sigfigs: 16) }
	var perImperialQuart: Physical { Physical(values: self, units: [(UnitVolume.imperialQuarts, -1)], sigfigs: 16) }
	var perImperialGallon: Physical { Physical(values: self, units: [(UnitVolume.imperialGallons, -1)], sigfigs: 16) }
	var perMetricCup: Physical { Physical(values: self, units: [(UnitVolume.metricCups, -1)], sigfigs: 16) }

	
	
	//____________________________________________________________/ FROM EXTENSIONS TO APPLE'S UNITS
	
	//____________________________________________________________/ FROM ORIGINAL UNITS
	
	var particles: Physical { Physical(values: self, unit: UnitAmount.particles) }
	var years: Physical { Physical(values: self, unit: UnitDuration.years) }
	var pascals: Physical { Physical(values: self, unit: UnitPressure.pascals) }
}

