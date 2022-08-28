import Foundation
import Accelerate

extension Array where Element == Double {
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
}

public extension Array where Element == Double {
	var constant: Physical {
		Physical(values: self, units: [:], sigfigs: 0)
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

}

