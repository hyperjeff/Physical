import Foundation

public extension BinaryFloatingPoint {
	// Custom exponential units  (✔︎ now automated)
	
	var s²: Physical {
		Physical(value: Double(self), units: [(UnitDuration.seconds, 2)], sigfigs: Double(self).sigfigs)
	}
	var s³: Physical {
		Physical(value: Double(self), units: [(UnitDuration.seconds, 3)], sigfigs: Double(self).sigfigs)
	}
	var s⁴: Physical {
		Physical(value: Double(self), units: [(UnitDuration.seconds, 4)], sigfigs: Double(self).sigfigs)
	}
	var s⁵: Physical {
		Physical(value: Double(self), units: [(UnitDuration.seconds, 5)], sigfigs: Double(self).sigfigs)
	}
	var A²: Physical {
		Physical(value: Double(self), units: [(UnitElectricCurrent.amperes, 2)], sigfigs: Double(self).sigfigs)
	}
	var A³: Physical {
		Physical(value: Double(self), units: [(UnitElectricCurrent.amperes, 3)], sigfigs: Double(self).sigfigs)
	}
	var A⁴: Physical {
		Physical(value: Double(self), units: [(UnitElectricCurrent.amperes, 4)], sigfigs: Double(self).sigfigs)
	}
	var A⁵: Physical {
		Physical(value: Double(self), units: [(UnitElectricCurrent.amperes, 5)], sigfigs: Double(self).sigfigs)
	}
	var V²: Physical {
		Physical(value: Double(self), units: [(UnitElectricPotentialDifference.volts, 2)], sigfigs: Double(self).sigfigs)
	}
	var V³: Physical {
		Physical(value: Double(self), units: [(UnitElectricPotentialDifference.volts, 3)], sigfigs: Double(self).sigfigs)
	}
	var V⁴: Physical {
		Physical(value: Double(self), units: [(UnitElectricPotentialDifference.volts, 4)], sigfigs: Double(self).sigfigs)
	}
	var V⁵: Physical {
		Physical(value: Double(self), units: [(UnitElectricPotentialDifference.volts, 5)], sigfigs: Double(self).sigfigs)
	}
	var J²: Physical {
		Physical(value: Double(self), units: [(UnitEnergy.joules, 2)], sigfigs: Double(self).sigfigs)
	}
	var J³: Physical {
		Physical(value: Double(self), units: [(UnitEnergy.joules, 3)], sigfigs: Double(self).sigfigs)
	}
	var J⁴: Physical {
		Physical(value: Double(self), units: [(UnitEnergy.joules, 4)], sigfigs: Double(self).sigfigs)
	}
	var J⁵: Physical {
		Physical(value: Double(self), units: [(UnitEnergy.joules, 5)], sigfigs: Double(self).sigfigs)
	}
	var N²: Physical {
		Physical(value: Double(self), units: [(UnitForce.newtons, 2)], sigfigs: Double(self).sigfigs)
	}
	var N³: Physical {
		Physical(value: Double(self), units: [(UnitForce.newtons, 3)], sigfigs: Double(self).sigfigs)
	}
	var N⁴: Physical {
		Physical(value: Double(self), units: [(UnitForce.newtons, 4)], sigfigs: Double(self).sigfigs)
	}
	var N⁵: Physical {
		Physical(value: Double(self), units: [(UnitForce.newtons, 5)], sigfigs: Double(self).sigfigs)
	}
	var m²: Physical {
		Physical(value: Double(self), units: [(UnitLength.meters, 2)], sigfigs: Double(self).sigfigs)
	}
	var m³: Physical {
		Physical(value: Double(self), units: [(UnitLength.meters, 3)], sigfigs: Double(self).sigfigs)
	}
	var m⁴: Physical {
		Physical(value: Double(self), units: [(UnitLength.meters, 4)], sigfigs: Double(self).sigfigs)
	}
	var m⁵: Physical {
		Physical(value: Double(self), units: [(UnitLength.meters, 5)], sigfigs: Double(self).sigfigs)
	}
	var kg²: Physical {
		Physical(value: Double(self), units: [(UnitMass.kilograms, 2)], sigfigs: Double(self).sigfigs)
	}
	var kg³: Physical {
		Physical(value: Double(self), units: [(UnitMass.kilograms, 3)], sigfigs: Double(self).sigfigs)
	}
	var kg⁴: Physical {
		Physical(value: Double(self), units: [(UnitMass.kilograms, 4)], sigfigs: Double(self).sigfigs)
	}
	var kg⁵: Physical {
		Physical(value: Double(self), units: [(UnitMass.kilograms, 5)], sigfigs: Double(self).sigfigs)
	}
	var K²: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.kelvin, 2)], sigfigs: Double(self).sigfigs)
	}
	var K³: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.kelvin, 3)], sigfigs: Double(self).sigfigs)
	}
	var K⁴: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.kelvin, 4)], sigfigs: Double(self).sigfigs)
	}
	var K⁵: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.kelvin, 5)], sigfigs: Double(self).sigfigs)
	}
	var C²: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.celsius, 2)], sigfigs: Double(self).sigfigs)
	}
	var C³: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.celsius, 3)], sigfigs: Double(self).sigfigs)
	}
	var C⁴: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.celsius, 4)], sigfigs: Double(self).sigfigs)
	}
	var C⁵: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.celsius, 5)], sigfigs: Double(self).sigfigs)
	}
	var F²: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.fahrenheit, 2)], sigfigs: Double(self).sigfigs)
	}
	var F³: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.fahrenheit, 3)], sigfigs: Double(self).sigfigs)
	}
	var F⁴: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.fahrenheit, 4)], sigfigs: Double(self).sigfigs)
	}
	var F⁵: Physical {
		Physical(value: Double(self), units: [(UnitTemperature.fahrenheit, 5)], sigfigs: Double(self).sigfigs)
	}
	var L²: Physical {
		Physical(value: Double(self), units: [(UnitVolume.liters, 2)], sigfigs: Double(self).sigfigs)
	}
	var L³: Physical {
		Physical(value: Double(self), units: [(UnitVolume.liters, 3)], sigfigs: Double(self).sigfigs)
	}
	var L⁴: Physical {
		Physical(value: Double(self), units: [(UnitVolume.liters, 4)], sigfigs: Double(self).sigfigs)
	}
	var L⁵: Physical {
		Physical(value: Double(self), units: [(UnitVolume.liters, 5)], sigfigs: Double(self).sigfigs)
	}
	
	// Custom units (NOT AUTOGENERATED YET!)
	
	var becquerel: Physical {
		Physical(value: Double(self), unit: UnitActivity.becquerel)
	}
	var particles: Physical {
		Physical(value: Double(self), unit: UnitAmount.particles)
	}
	var atoms: Physical {
		Physical(value: Double(self), unit: UnitAmount.atoms)
	}
	var beings: Physical {
		Physical(value: Double(self), unit: UnitAmount.beings)
	}
	var people: Physical {
		Physical(value: Double(self), unit: UnitAmount.people)
	}
	var things: Physical {
		Physical(value: Double(self), unit: UnitAmount.things)
	}
	var moles: Physical {
		Physical(value: Double(self), unit: UnitAmount.moles)
	}
	var farads: Physical {
		Physical(value: Double(self), unit: UnitElectricCapacitance.farads)
	}
	var siemens: Physical {
		Physical(value: Double(self), unit: UnitElectricConductance.siemens)
	}
	var henries: Physical {
		Physical(value: Double(self), unit: UnitElectricInductance.henries)
	}
	var newtons: Physical {
		Physical(value: Double(self), unit: UnitForce.newtons)
	}
	var N: Physical {
		Physical(value: Double(self), unit: UnitForce.newtons)
	}
	var poundsForce: Physical {
		Physical(value: Double(self), unit: UnitForce.poundsForce)
	}
	var lbf: Physical {
		Physical(value: Double(self), unit: UnitForce.poundsForce)
	}
	var F: Physical {
		Physical(value: Double(self), unit: UnitElectricCapacitance.farads)
	}
	var S: Physical {
		Physical(value: Double(self), unit: UnitElectricConductance.siemens)
	}
	var H: Physical {
		Physical(value: Double(self), unit: UnitElectricInductance.henries)
	}
	var grays: Physical {
		Physical(value: Double(self), unit: UnitIonizingRadiation.grays)
	}
	var sieverts: Physical {
		Physical(value: Double(self), unit: UnitIonizingRadiation.sieverts)
	}
	var candelas: Physical {
		Physical(value: Double(self), unit: UnitLuminousIntensity.candelas)
	}
	var lumens: Physical {
		Physical(value: Double(self), unit: UnitLuminousFlux.lumens)
	}
	var webers: Physical {
		Physical(value: Double(self), unit: UnitMagneticFlux.webers)
	}
	var teslas: Physical {
		Physical(value: Double(self), unit: UnitMagneticFluxDensity.teslas)
	}
	var gauss: Physical {
		Physical(value: Double(self), unit: UnitMagneticFluxDensity.gauss)
	}
	var daltons: Physical {
		Physical(value: Double(self), unit: UnitMass.daltons)
	}
	var degreesPerSecond: Physical {
		Physical(value: Double(self), unit: UnitAngularSpeed.degreesPerSecond)
	}
	var radiansPerSecond: Physical {
		Physical(value: Double(self), unit: UnitAngularSpeed.radiansPerSecond)
	}
	var revolutionsPerSecond: Physical {
		Physical(value: Double(self), unit: UnitAngularSpeed.revolutionsPerSecond)
	}
	var revolutionsPerMinute: Physical {
		Physical(value: Double(self), unit: UnitAngularSpeed.revolutionsPerMinute)
	}
	var steradians: Physical {
		Physical(value: Double(self), unit: UnitSolidAngle.steradians)
	}
	var squareDegrees: Physical {
		Physical(value: Double(self), unit: UnitSolidAngle.squareDegrees)
	}
	
	// Extended units (NOT AUTOGENERATED YET!)
	
	var barns: Physical {
		Physical(value: Double(self), unit: UnitArea.barns)
	}
	var years: Physical {
		Physical(value: Double(self), unit: UnitDuration.years)
	}
	var yrs: Physical {
		Physical(value: Double(self), unit: UnitDuration.years)
	}
	var yr: Physical {
		Physical(value: Double(self), unit: UnitDuration.years)
	}
	var ergs: Physical {
		Physical(value: Double(self), unit: UnitEnergy.ergs)
	}
	var btu: Physical {
		Physical(value: Double(self), unit: UnitEnergy.britishThermalUnits)
	}
	var eV: Physical {
		Physical(value: Double(self), unit: UnitEnergy.electronvolts)
	}
	var Å: Physical {
		Physical(value: Double(self), unit: UnitLength.angstroms)
	}
	var pascals: Physical {
		Physical(value: Double(self), unit: UnitPressure.pascals)
	}
	var atm: Physical {
		Physical(value: Double(self), unit: UnitPressure.atmosphericPressure)
	}
	var britishThermalUnits: Physical {
		Physical(value: Double(self), unit: UnitEnergy.britishThermalUnits)
	}
	var electronvolts: Physical {
		Physical(value: Double(self), unit: UnitEnergy.electronvolts)
	}
	var angstroms: Physical {
		Physical(value: Double(self), unit: UnitLength.angstroms)
	}
	var atmosphericPressure: Physical {
		Physical(value: Double(self), unit: UnitPressure.atmosphericPressure)
	}
	var rankine: Physical {
		Physical(value: Double(self), unit: UnitTemperature.rankine)
	}
	
	// Extracted properties from NSUnit.h
	// Raw units
	
	var metersPerSecondSquared: Physical {
		Physical(value: Double(self), unit: UnitAcceleration.metersPerSecondSquared)
	}
	var mps2: Physical {
		Physical(value: Double(self), unit: UnitAcceleration.metersPerSecondSquared)
	}
	var gravity: Physical {
		Physical(value: Double(self), unit: UnitAcceleration.gravity)
	}
	
	var degrees: Physical {
		Physical(value: Double(self), unit: UnitAngle.degrees)
	}
	var arcMinutes: Physical {
		Physical(value: Double(self), unit: UnitAngle.arcMinutes)
	}
	var arcSeconds: Physical {
		Physical(value: Double(self), unit: UnitAngle.arcSeconds)
	}
	var radians: Physical {
		Physical(value: Double(self), unit: UnitAngle.radians)
	}
	var gradians: Physical {
		Physical(value: Double(self), unit: UnitAngle.gradians)
	}
	var revolutions: Physical {
		Physical(value: Double(self), unit: UnitAngle.revolutions)
	}
	
	var squareMegameters: Physical {
		Physical(value: Double(self), unit: UnitArea.squareMegameters)
	}
	var squareKilometers: Physical {
		Physical(value: Double(self), unit: UnitArea.squareKilometers)
	}
	var squareMeters: Physical {
		Physical(value: Double(self), unit: UnitArea.squareMeters)
	}
	var squareCentimeters: Physical {
		Physical(value: Double(self), unit: UnitArea.squareCentimeters)
	}
	var squareMillimeters: Physical {
		Physical(value: Double(self), unit: UnitArea.squareMillimeters)
	}
	var squareMicrometers: Physical {
		Physical(value: Double(self), unit: UnitArea.squareMicrometers)
	}
	var squareNanometers: Physical {
		Physical(value: Double(self), unit: UnitArea.squareNanometers)
	}
	var squareInches: Physical {
		Physical(value: Double(self), unit: UnitArea.squareInches)
	}
	var squareFeet: Physical {
		Physical(value: Double(self), unit: UnitArea.squareFeet)
	}
	var squareYards: Physical {
		Physical(value: Double(self), unit: UnitArea.squareYards)
	}
	var squareMiles: Physical {
		Physical(value: Double(self), unit: UnitArea.squareMiles)
	}
	var acres: Physical {
		Physical(value: Double(self), unit: UnitArea.acres)
	}
	var ares: Physical {
		Physical(value: Double(self), unit: UnitArea.ares)
	}
	var hectares: Physical {
		Physical(value: Double(self), unit: UnitArea.hectares)
	}
	
	var gramsPerLiter: Physical {
		Physical(value: Double(self), unit: UnitConcentrationMass.gramsPerLiter)
	}
	var milligramsPerDeciliter: Physical {
		Physical(value: Double(self), unit: UnitConcentrationMass.milligramsPerDeciliter)
	}
	
	var ppm: Physical {
		Physical(value: Double(self), unit: UnitDispersion.partsPerMillion)
	}
	
	var partsPerMillion: Physical {
		Physical(value: Double(self), unit: UnitDispersion.partsPerMillion)
	}
	
	var hours: Physical {
		Physical(value: Double(self), unit: UnitDuration.hours)
	}
	var minutes: Physical {
		Physical(value: Double(self), unit: UnitDuration.minutes)
	}
	var seconds: Physical {
		Physical(value: Double(self), unit: UnitDuration.seconds)
	}
	var milliseconds: Physical {
		Physical(value: Double(self), unit: UnitDuration.milliseconds)
	}
	var microseconds: Physical {
		Physical(value: Double(self), unit: UnitDuration.microseconds)
	}
	var nanoseconds: Physical {
		Physical(value: Double(self), unit: UnitDuration.nanoseconds)
	}
	var picoseconds: Physical {
		Physical(value: Double(self), unit: UnitDuration.picoseconds)
	}
	var hrs: Physical {
		Physical(value: Double(self), unit: UnitDuration.hours)
	}
	var min: Physical {
		Physical(value: Double(self), unit: UnitDuration.minutes)
	}
	var s: Physical {
		Physical(value: Double(self), unit: UnitDuration.seconds)
	}
	var ms: Physical {
		Physical(value: Double(self), unit: UnitDuration.milliseconds)
	}
	var μs: Physical {
		Physical(value: Double(self), unit: UnitDuration.microseconds)
	}
	var ns: Physical {
		Physical(value: Double(self), unit: UnitDuration.nanoseconds)
	}
	var ps: Physical {
		Physical(value: Double(self), unit: UnitDuration.picoseconds)
	}
	
	var coulombs: Physical {
		Physical(value: Double(self), unit: UnitElectricCharge.coulombs)
	}
	var megaampereHours: Physical {
		Physical(value: Double(self), unit: UnitElectricCharge.megaampereHours)
	}
	var kiloampereHours: Physical {
		Physical(value: Double(self), unit: UnitElectricCharge.kiloampereHours)
	}
	var ampereHours: Physical {
		Physical(value: Double(self), unit: UnitElectricCharge.ampereHours)
	}
	var milliampereHours: Physical {
		Physical(value: Double(self), unit: UnitElectricCharge.milliampereHours)
	}
	var microampereHours: Physical {
		Physical(value: Double(self), unit: UnitElectricCharge.microampereHours)
	}
	
	var megaamperes: Physical {
		Physical(value: Double(self), unit: UnitElectricCurrent.megaamperes)
	}
	var kiloamperes: Physical {
		Physical(value: Double(self), unit: UnitElectricCurrent.kiloamperes)
	}
	var amperes: Physical {
		Physical(value: Double(self), unit: UnitElectricCurrent.amperes)
	}
	var milliamperes: Physical {
		Physical(value: Double(self), unit: UnitElectricCurrent.milliamperes)
	}
	var microamperes: Physical {
		Physical(value: Double(self), unit: UnitElectricCurrent.microamperes)
	}
	var A: Physical {
		Physical(value: Double(self), unit: UnitElectricCurrent.amperes)
	}
	var mA: Physical {
		Physical(value: Double(self), unit: UnitElectricCurrent.milliamperes)
	}
	var μA: Physical {
		Physical(value: Double(self), unit: UnitElectricCurrent.microamperes)
	}
	
	var megavolts: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.megavolts)
	}
	var kilovolts: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.kilovolts)
	}
	var volts: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.volts)
	}
	var millivolts: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.millivolts)
	}
	var microvolts: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.microvolts)
	}
	var MV: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.megavolts)
	}
	var kV: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.kilovolts)
	}
	var V: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.volts)
	}
	var mV: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.millivolts)
	}
	var μV: Physical {
		Physical(value: Double(self), unit: UnitElectricPotentialDifference.microvolts)
	}
	
	var megaohms: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.megaohms)
	}
	var kiloohms: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.kiloohms)
	}
	var ohms: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.ohms)
	}
	var milliohms: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.milliohms)
	}
	var microohms: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.microohms)
	}
	var MΩ: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.megaohms)
	}
	var kΩ: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.kiloohms)
	}
	var Ω: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.ohms)
	}
	var mΩ: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.milliohms)
	}
	var μΩ: Physical {
		Physical(value: Double(self), unit: UnitElectricResistance.microohms)
	}
	
	var kilojoules: Physical {
		Physical(value: Double(self), unit: UnitEnergy.kilojoules)
	}
	var joules: Physical {
		Physical(value: Double(self), unit: UnitEnergy.joules)
	}
	var kilocalories: Physical {
		Physical(value: Double(self), unit: UnitEnergy.kilocalories)
	}
	var calories: Physical {
		Physical(value: Double(self), unit: UnitEnergy.calories)
	}
	var kilowattHours: Physical {
		Physical(value: Double(self), unit: UnitEnergy.kilowattHours)
	}
	var kJ: Physical {
		Physical(value: Double(self), unit: UnitEnergy.kilojoules)
	}
	var J: Physical {
		Physical(value: Double(self), unit: UnitEnergy.joules)
	}
	var cal: Physical {
		Physical(value: Double(self), unit: UnitEnergy.calories)
	}
	var kwh: Physical {
		Physical(value: Double(self), unit: UnitEnergy.kilowattHours)
	}
	
	var THz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.terahertz)
	}
	var GHz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.gigahertz)
	}
	var MHz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.megahertz)
	}
	var kHz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.kilohertz)
	}
	var Hz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.hertz)
	}
	var mHz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.millihertz)
	}
	var μHz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.microhertz)
	}
	var nHz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.nanohertz)
	}
	var terahertz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.terahertz)
	}
	var gigahertz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.gigahertz)
	}
	var megahertz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.megahertz)
	}
	var kilohertz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.kilohertz)
	}
	var hertz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.hertz)
	}
	var millihertz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.millihertz)
	}
	var microhertz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.microhertz)
	}
	var nanohertz: Physical {
		Physical(value: Double(self), unit: UnitFrequency.nanohertz)
	}
	
	var framesPerSecond: Physical {
		Physical(value: Double(self), unit: UnitFrequency.framesPerSecond)
	}
	
	var litersPer100Kilometers: Physical {
		Physical(value: Double(self), unit: UnitFuelEfficiency.litersPer100Kilometers)
	}
	var milesPerImperialGallon: Physical {
		Physical(value: Double(self), unit: UnitFuelEfficiency.milesPerImperialGallon)
	}
	var milesPerGallon: Physical {
		Physical(value: Double(self), unit: UnitFuelEfficiency.milesPerGallon)
	}
	
	var bytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.bytes)
	}
	var bits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.bits)
	}
	var nibbles: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.nibbles)
	}
	var yottabytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.yottabytes)
	}
	var zettabytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.zettabytes)
	}
	var exabytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.exabytes)
	}
	var petabytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.petabytes)
	}
	var terabytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.terabytes)
	}
	var gigabytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.gigabytes)
	}
	var megabytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.megabytes)
	}
	var kilobytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.kilobytes)
	}
	var yottabits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.yottabits)
	}
	var zettabits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.zettabits)
	}
	var exabits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.exabits)
	}
	var petabits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.petabits)
	}
	var terabits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.terabits)
	}
	var gigabits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.gigabits)
	}
	var megabits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.megabits)
	}
	var kilobits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.kilobits)
	}
	var yobibytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.yobibytes)
	}
	var zebibytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.zebibytes)
	}
	var exbibytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.exbibytes)
	}
	var pebibytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.pebibytes)
	}
	var tebibytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.tebibytes)
	}
	var gibibytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.gibibytes)
	}
	var mebibytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.mebibytes)
	}
	var kibibytes: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.kibibytes)
	}
	var yobibits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.yobibits)
	}
	var zebibits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.zebibits)
	}
	var exbibits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.exbibits)
	}
	var pebibits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.pebibits)
	}
	var tebibits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.tebibits)
	}
	var gibibits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.gibibits)
	}
	var mebibits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.mebibits)
	}
	var kibibits: Physical {
		Physical(value: Double(self), unit: UnitInformationStorage.kibibits)
	}
	
	var Mm: Physical {
		Physical(value: Double(self), unit: UnitLength.megameters)
	}
	var km: Physical {
		Physical(value: Double(self), unit: UnitLength.kilometers)
	}
	var megameters: Physical {
		Physical(value: Double(self), unit: UnitLength.megameters)
	}
	var kilometers: Physical {
		Physical(value: Double(self), unit: UnitLength.kilometers)
	}
	var hectometers: Physical {
		Physical(value: Double(self), unit: UnitLength.hectometers)
	}
	var decameters: Physical {
		Physical(value: Double(self), unit: UnitLength.decameters)
	}
	var meters: Physical {
		Physical(value: Double(self), unit: UnitLength.meters)
	}
	var m: Physical {
		Physical(value: Double(self), unit: UnitLength.meters)
	}
	var decimeters: Physical {
		Physical(value: Double(self), unit: UnitLength.decimeters)
	}
	var centimeters: Physical {
		Physical(value: Double(self), unit: UnitLength.centimeters)
	}
	var millimeters: Physical {
		Physical(value: Double(self), unit: UnitLength.millimeters)
	}
	var micrometers: Physical {
		Physical(value: Double(self), unit: UnitLength.micrometers)
	}
	var nanometers: Physical {
		Physical(value: Double(self), unit: UnitLength.nanometers)
	}
	var picometers: Physical {
		Physical(value: Double(self), unit: UnitLength.picometers)
	}
	var cm: Physical {
		Physical(value: Double(self), unit: UnitLength.centimeters)
	}
	var mm: Physical {
		Physical(value: Double(self), unit: UnitLength.millimeters)
	}
	var μm: Physical {
		Physical(value: Double(self), unit: UnitLength.micrometers)
	}
	var nm: Physical {
		Physical(value: Double(self), unit: UnitLength.nanometers)
	}
	var pm: Physical {
		Physical(value: Double(self), unit: UnitLength.picometers)
	}
	var inches: Physical {
		Physical(value: Double(self), unit: UnitLength.inches)
	}
	var feet: Physical {
		Physical(value: Double(self), unit: UnitLength.feet)
	}
	var ft: Physical {
		Physical(value: Double(self), unit: UnitLength.feet)
	}
	var yards: Physical {
		Physical(value: Double(self), unit: UnitLength.yards)
	}
	var miles: Physical {
		Physical(value: Double(self), unit: UnitLength.miles)
	}
	var scandinavianMiles: Physical {
		Physical(value: Double(self), unit: UnitLength.scandinavianMiles)
	}
	var lightyears: Physical {
		Physical(value: Double(self), unit: UnitLength.lightyears)
	}
	var ly: Physical {
		Physical(value: Double(self), unit: UnitLength.lightyears)
	}
	var nauticalMiles: Physical {
		Physical(value: Double(self), unit: UnitLength.nauticalMiles)
	}
	var fathoms: Physical {
		Physical(value: Double(self), unit: UnitLength.fathoms)
	}
	var furlongs: Physical {
		Physical(value: Double(self), unit: UnitLength.furlongs)
	}
	var astronomicalUnits: Physical {
		Physical(value: Double(self), unit: UnitLength.astronomicalUnits)
	}
	var au: Physical {
		Physical(value: Double(self), unit: UnitLength.astronomicalUnits)
	}
	var parsecs: Physical {
		Physical(value: Double(self), unit: UnitLength.parsecs)
	}
	
	var lux: Physical {
		Physical(value: Double(self), unit: UnitIlluminance.lux)
	}
	
	var kilograms: Physical {
		Physical(value: Double(self), unit: UnitMass.kilograms)
	}
	var grams: Physical {
		Physical(value: Double(self), unit: UnitMass.grams)
	}
	var decigrams: Physical {
		Physical(value: Double(self), unit: UnitMass.decigrams)
	}
	var centigrams: Physical {
		Physical(value: Double(self), unit: UnitMass.centigrams)
	}
	var milligrams: Physical {
		Physical(value: Double(self), unit: UnitMass.milligrams)
	}
	var micrograms: Physical {
		Physical(value: Double(self), unit: UnitMass.micrograms)
	}
	var nanograms: Physical {
		Physical(value: Double(self), unit: UnitMass.nanograms)
	}
	var picograms: Physical {
		Physical(value: Double(self), unit: UnitMass.picograms)
	}
	var ounces: Physical {
		Physical(value: Double(self), unit: UnitMass.ounces)
	}
	var poundsMass: Physical {
		Physical(value: Double(self), unit: UnitMass.pounds)
	}
	var kg: Physical {
		Physical(value: Double(self), unit: UnitMass.kilograms)
	}
	var g: Physical {
		Physical(value: Double(self), unit: UnitMass.grams)
	}
	var dg: Physical {
		Physical(value: Double(self), unit: UnitMass.decigrams)
	}
	var cg: Physical {
		Physical(value: Double(self), unit: UnitMass.centigrams)
	}
	var mg: Physical {
		Physical(value: Double(self), unit: UnitMass.milligrams)
	}
	var μg: Physical {
		Physical(value: Double(self), unit: UnitMass.micrograms)
	}
	var ng: Physical {
		Physical(value: Double(self), unit: UnitMass.nanograms)
	}
	var pg: Physical {
		Physical(value: Double(self), unit: UnitMass.picograms)
	}
	var oz: Physical {
		Physical(value: Double(self), unit: UnitMass.ounces)
	}
	var lbs: Physical {
		Physical(value: Double(self), unit: UnitMass.pounds)
	}
	var stones: Physical {
		Physical(value: Double(self), unit: UnitMass.stones)
	}
	var metricTons: Physical {
		Physical(value: Double(self), unit: UnitMass.metricTons)
	}
	var shortTons: Physical {
		Physical(value: Double(self), unit: UnitMass.shortTons)
	}
	var carats: Physical {
		Physical(value: Double(self), unit: UnitMass.carats)
	}
	var ouncesTroy: Physical {
		Physical(value: Double(self), unit: UnitMass.ouncesTroy)
	}
	var slugs: Physical {
		Physical(value: Double(self), unit: UnitMass.slugs)
	}
	
	var terawatts: Physical {
		Physical(value: Double(self), unit: UnitPower.terawatts)
	}
	var gigawatts: Physical {
		Physical(value: Double(self), unit: UnitPower.gigawatts)
	}
	var megawatts: Physical {
		Physical(value: Double(self), unit: UnitPower.megawatts)
	}
	var kilowatts: Physical {
		Physical(value: Double(self), unit: UnitPower.kilowatts)
	}
	var watts: Physical {
		Physical(value: Double(self), unit: UnitPower.watts)
	}
	var milliwatts: Physical {
		Physical(value: Double(self), unit: UnitPower.milliwatts)
	}
	var microwatts: Physical {
		Physical(value: Double(self), unit: UnitPower.microwatts)
	}
	var nanowatts: Physical {
		Physical(value: Double(self), unit: UnitPower.nanowatts)
	}
	var picowatts: Physical {
		Physical(value: Double(self), unit: UnitPower.picowatts)
	}
	var femtowatts: Physical {
		Physical(value: Double(self), unit: UnitPower.femtowatts)
	}
	var horsepower: Physical {
		Physical(value: Double(self), unit: UnitPower.horsepower)
	}
	var TW: Physical {
		Physical(value: Double(self), unit: UnitPower.terawatts)
	}
	var GW: Physical {
		Physical(value: Double(self), unit: UnitPower.gigawatts)
	}
	var MW: Physical {
		Physical(value: Double(self), unit: UnitPower.megawatts)
	}
	var kW: Physical {
		Physical(value: Double(self), unit: UnitPower.kilowatts)
	}
	var W: Physical {
		Physical(value: Double(self), unit: UnitPower.watts)
	}
	var mW: Physical {
		Physical(value: Double(self), unit: UnitPower.milliwatts)
	}
	var μW: Physical {
		Physical(value: Double(self), unit: UnitPower.microwatts)
	}
	var nW: Physical {
		Physical(value: Double(self), unit: UnitPower.nanowatts)
	}
	var pW: Physical {
		Physical(value: Double(self), unit: UnitPower.picowatts)
	}
	var fW: Physical {
		Physical(value: Double(self), unit: UnitPower.femtowatts)
	}
	var hp: Physical {
		Physical(value: Double(self), unit: UnitPower.horsepower)
	}
	
	var newtonsPerMetersSquared: Physical {
		Physical(value: Double(self), unit: UnitPressure.newtonsPerMetersSquared)
	}
	var gigapascals: Physical {
		Physical(value: Double(self), unit: UnitPressure.gigapascals)
	}
	var megapascals: Physical {
		Physical(value: Double(self), unit: UnitPressure.megapascals)
	}
	var kilopascals: Physical {
		Physical(value: Double(self), unit: UnitPressure.kilopascals)
	}
	var hectopascals: Physical {
		Physical(value: Double(self), unit: UnitPressure.hectopascals)
	}
	var inchesOfMercury: Physical {
		Physical(value: Double(self), unit: UnitPressure.inchesOfMercury)
	}
	var bars: Physical {
		Physical(value: Double(self), unit: UnitPressure.bars)
	}
	var millibars: Physical {
		Physical(value: Double(self), unit: UnitPressure.millibars)
	}
	var millimetersOfMercury: Physical {
		Physical(value: Double(self), unit: UnitPressure.millimetersOfMercury)
	}
	var poundsForcePerSquareInch: Physical {
		Physical(value: Double(self), unit: UnitPressure.poundsForcePerSquareInch)
	}
	
	var metersPerSecond: Physical {
		Physical(value: Double(self), unit: UnitSpeed.metersPerSecond)
	}
	var kilometersPerHour: Physical {
		Physical(value: Double(self), unit: UnitSpeed.kilometersPerHour)
	}
	var milesPerHour: Physical {
		Physical(value: Double(self), unit: UnitSpeed.milesPerHour)
	}
	var mps: Physical {
		Physical(value: Double(self), unit: UnitSpeed.metersPerSecond)
	}
	var kph: Physical {
		Physical(value: Double(self), unit: UnitSpeed.kilometersPerHour)
	}
	var mph: Physical {
		Physical(value: Double(self), unit: UnitSpeed.milesPerHour)
	}
	var knots: Physical {
		Physical(value: Double(self), unit: UnitSpeed.knots)
	}
	
	var kelvin: Physical {
		Physical(value: Double(self), unit: UnitTemperature.kelvin)
	}
	var celsius: Physical {
		Physical(value: Double(self), unit: UnitTemperature.celsius)
	}
	var fahrenheit: Physical {
		Physical(value: Double(self), unit: UnitTemperature.fahrenheit)
	}
	
	var K: Physical {
		Physical(value: Double(self), unit: UnitTemperature.kelvin)
	}
	var ℃: Physical {
		Physical(value: Double(self), unit: UnitTemperature.celsius)
	}
	var ℉: Physical {
		Physical(value: Double(self), unit: UnitTemperature.fahrenheit)
	}
	
	var megaliters: Physical {
		Physical(value: Double(self), unit: UnitVolume.megaliters)
	}
	var kiloliters: Physical {
		Physical(value: Double(self), unit: UnitVolume.kiloliters)
	}
	var liters: Physical {
		Physical(value: Double(self), unit: UnitVolume.liters)
	}
	var deciliters: Physical {
		Physical(value: Double(self), unit: UnitVolume.deciliters)
	}
	var centiliters: Physical {
		Physical(value: Double(self), unit: UnitVolume.centiliters)
	}
	var milliliters: Physical {
		Physical(value: Double(self), unit: UnitVolume.milliliters)
	}
	var ML: Physical {
		Physical(value: Double(self), unit: UnitVolume.megaliters)
	}
	var kL: Physical {
		Physical(value: Double(self), unit: UnitVolume.kiloliters)
	}
	var L: Physical {
		Physical(value: Double(self), unit: UnitVolume.liters)
	}
	var dL: Physical {
		Physical(value: Double(self), unit: UnitVolume.deciliters)
	}
	var cL: Physical {
		Physical(value: Double(self), unit: UnitVolume.centiliters)
	}
	var mL: Physical {
		Physical(value: Double(self), unit: UnitVolume.milliliters)
	}
	var cubicKilometers: Physical {
		Physical(value: Double(self), unit: UnitVolume.cubicKilometers)
	}
	var cubicMeters: Physical {
		Physical(value: Double(self), unit: UnitVolume.cubicMeters)
	}
	var cubicDecimeters: Physical {
		Physical(value: Double(self), unit: UnitVolume.cubicDecimeters)
	}
	var cubicCentimeters: Physical {
		Physical(value: Double(self), unit: UnitVolume.cubicCentimeters)
	}
	var cubicMillimeters: Physical {
		Physical(value: Double(self), unit: UnitVolume.cubicMillimeters)
	}
	var cubicInches: Physical {
		Physical(value: Double(self), unit: UnitVolume.cubicInches)
	}
	var cubicFeet: Physical {
		Physical(value: Double(self), unit: UnitVolume.cubicFeet)
	}
	var cubicYards: Physical {
		Physical(value: Double(self), unit: UnitVolume.cubicYards)
	}
	var cubicMiles: Physical {
		Physical(value: Double(self), unit: UnitVolume.cubicMiles)
	}
	var acreFeet: Physical {
		Physical(value: Double(self), unit: UnitVolume.acreFeet)
	}
	var bushels: Physical {
		Physical(value: Double(self), unit: UnitVolume.bushels)
	}
	var teaspoons: Physical {
		Physical(value: Double(self), unit: UnitVolume.teaspoons)
	}
	var tablespoons: Physical {
		Physical(value: Double(self), unit: UnitVolume.tablespoons)
	}
	var fluidOunces: Physical {
		Physical(value: Double(self), unit: UnitVolume.fluidOunces)
	}
	var cups: Physical {
		Physical(value: Double(self), unit: UnitVolume.cups)
	}
	var pints: Physical {
		Physical(value: Double(self), unit: UnitVolume.pints)
	}
	var quarts: Physical {
		Physical(value: Double(self), unit: UnitVolume.quarts)
	}
	var gallons: Physical {
		Physical(value: Double(self), unit: UnitVolume.gallons)
	}
	var imperialTeaspoons: Physical {
		Physical(value: Double(self), unit: UnitVolume.imperialTeaspoons)
	}
	var imperialTablespoons: Physical {
		Physical(value: Double(self), unit: UnitVolume.imperialTablespoons)
	}
	var imperialFluidOunces: Physical {
		Physical(value: Double(self), unit: UnitVolume.imperialFluidOunces)
	}
	var imperialPints: Physical {
		Physical(value: Double(self), unit: UnitVolume.imperialPints)
	}
	var imperialQuarts: Physical {
		Physical(value: Double(self), unit: UnitVolume.imperialQuarts)
	}
	var imperialGallons: Physical {
		Physical(value: Double(self), unit: UnitVolume.imperialGallons)
	}
	var metricCups: Physical {
		Physical(value: Double(self), unit: UnitVolume.metricCups)
	}
	
	// integer exponent units
	// Custom units
	
	func particles(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAmount.particles, exponent)], sigfigs: Double(self).sigfigs)
	}
	func atoms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAmount.atoms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func beings(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAmount.beings, exponent)], sigfigs: Double(self).sigfigs)
	}
	func people(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAmount.people, exponent)], sigfigs: Double(self).sigfigs)
	}
	func things(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAmount.things, exponent)], sigfigs: Double(self).sigfigs)
	}
	func moles(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAmount.moles, exponent)], sigfigs: Double(self).sigfigs)
	}
	func farads(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCapacitance.farads, exponent)], sigfigs: Double(self).sigfigs)
	}
	func siemens(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricConductance.siemens, exponent)], sigfigs: Double(self).sigfigs)
	}
	func henries(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricInductance.henries, exponent)], sigfigs: Double(self).sigfigs)
	}
	func newtons(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitForce.newtons, exponent)], sigfigs: Double(self).sigfigs)
	}
	func lbf(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitForce.poundsForce, exponent)], sigfigs: Double(self).sigfigs)
	}
	func poundsForce(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitForce.poundsForce, exponent)], sigfigs: Double(self).sigfigs)
	}
	func grays(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitIonizingRadiation.grays, exponent)], sigfigs: Double(self).sigfigs)
	}
	func sieverts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitIonizingRadiation.sieverts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func candelas(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLuminousIntensity.candelas, exponent)], sigfigs: Double(self).sigfigs)
	}
	func lumens(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLuminousFlux.lumens, exponent)], sigfigs: Double(self).sigfigs)
	}
	func webers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMagneticFlux.webers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func teslas(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMagneticFluxDensity.teslas, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gauss(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMagneticFluxDensity.gauss, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	// Extended units
	
	func barns(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.barns, exponent)], sigfigs: Double(self).sigfigs)
	}
	func years(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.years, exponent)], sigfigs: Double(self).sigfigs)
	}
	func yrs(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.years, exponent)], sigfigs: Double(self).sigfigs)
	}
	func yr(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.years, exponent)], sigfigs: Double(self).sigfigs)
	}
	func ergs(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitEnergy.ergs, exponent)], sigfigs: Double(self).sigfigs)
	}
	func britishThermalUnits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitEnergy.britishThermalUnits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func electronvolts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitEnergy.electronvolts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func angstroms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.angstroms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func pascals(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.pascals, exponent)], sigfigs: Double(self).sigfigs)
	}
	func atmosphericPressure(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.atmosphericPressure, exponent)], sigfigs: Double(self).sigfigs)
	}
	func rankine(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitTemperature.rankine, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	// Extracted properties from NSUnit.h
	// Raw units
	
	func metersPerSecondSquared(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAcceleration.metersPerSecondSquared, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gravity(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAcceleration.gravity, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func degrees(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAngle.degrees, exponent)], sigfigs: Double(self).sigfigs)
	}
	func arcMinutes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAngle.arcMinutes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func arcSeconds(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAngle.arcSeconds, exponent)], sigfigs: Double(self).sigfigs)
	}
	func radians(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAngle.radians, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gradians(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAngle.gradians, exponent)], sigfigs: Double(self).sigfigs)
	}
	func revolutions(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitAngle.revolutions, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func squareMegameters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareMegameters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareKilometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareKilometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareMeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareMeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareCentimeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareCentimeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareMillimeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareMillimeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareMicrometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareMicrometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareNanometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareNanometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareInches(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareInches, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareFeet(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareFeet, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareYards(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareYards, exponent)], sigfigs: Double(self).sigfigs)
	}
	func squareMiles(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.squareMiles, exponent)], sigfigs: Double(self).sigfigs)
	}
	func acres(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.acres, exponent)], sigfigs: Double(self).sigfigs)
	}
	func ares(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.ares, exponent)], sigfigs: Double(self).sigfigs)
	}
	func hectares(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitArea.hectares, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func gramsPerLiter(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitConcentrationMass.gramsPerLiter, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milligramsPerDeciliter(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitConcentrationMass.milligramsPerDeciliter, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func partsPerMillion(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDispersion.partsPerMillion, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func hours(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.hours, exponent)], sigfigs: Double(self).sigfigs)
	}
	func minutes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.minutes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func seconds(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.seconds, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milliseconds(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.milliseconds, exponent)], sigfigs: Double(self).sigfigs)
	}
	func microseconds(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.microseconds, exponent)], sigfigs: Double(self).sigfigs)
	}
	func nanoseconds(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.nanoseconds, exponent)], sigfigs: Double(self).sigfigs)
	}
	func picoseconds(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitDuration.picoseconds, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func coulombs(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCharge.coulombs, exponent)], sigfigs: Double(self).sigfigs)
	}
	func megaampereHours(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCharge.megaampereHours, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kiloampereHours(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCharge.kiloampereHours, exponent)], sigfigs: Double(self).sigfigs)
	}
	func ampereHours(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCharge.ampereHours, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milliampereHours(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCharge.milliampereHours, exponent)], sigfigs: Double(self).sigfigs)
	}
	func microampereHours(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCharge.microampereHours, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func megaamperes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCurrent.megaamperes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kiloamperes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCurrent.kiloamperes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func amperes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCurrent.amperes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milliamperes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCurrent.milliamperes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func microamperes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricCurrent.microamperes, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func megavolts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricPotentialDifference.megavolts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilovolts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricPotentialDifference.kilovolts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func volts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricPotentialDifference.volts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func millivolts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricPotentialDifference.millivolts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func microvolts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricPotentialDifference.microvolts, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func megaohms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricResistance.megaohms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kiloohms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricResistance.kiloohms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func ohms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricResistance.ohms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milliohms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricResistance.milliohms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func microohms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitElectricResistance.microohms, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func kilojoules(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitEnergy.kilojoules, exponent)], sigfigs: Double(self).sigfigs)
	}
	func joules(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitEnergy.joules, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilocalories(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitEnergy.kilocalories, exponent)], sigfigs: Double(self).sigfigs)
	}
	func calories(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitEnergy.calories, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilowattHours(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitEnergy.kilowattHours, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func terahertz(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFrequency.terahertz, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gigahertz(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFrequency.gigahertz, exponent)], sigfigs: Double(self).sigfigs)
	}
	func megahertz(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFrequency.megahertz, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilohertz(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFrequency.kilohertz, exponent)], sigfigs: Double(self).sigfigs)
	}
	func hertz(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFrequency.hertz, exponent)], sigfigs: Double(self).sigfigs)
	}
	func millihertz(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFrequency.millihertz, exponent)], sigfigs: Double(self).sigfigs)
	}
	func microhertz(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFrequency.microhertz, exponent)], sigfigs: Double(self).sigfigs)
	}
	func nanohertz(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFrequency.nanohertz, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func framesPerSecond(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFrequency.framesPerSecond, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func litersPer100Kilometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFuelEfficiency.litersPer100Kilometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milesPerImperialGallon(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFuelEfficiency.milesPerImperialGallon, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milesPerGallon(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitFuelEfficiency.milesPerGallon, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func bytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.bytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func bits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.bits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func nibbles(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.nibbles, exponent)], sigfigs: Double(self).sigfigs)
	}
	func yottabytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.yottabytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func zettabytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.zettabytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func exabytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.exabytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func petabytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.petabytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func terabytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.terabytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gigabytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.gigabytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func megabytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.megabytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilobytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.kilobytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func yottabits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.yottabits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func zettabits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.zettabits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func exabits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.exabits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func petabits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.petabits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func terabits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.terabits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gigabits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.gigabits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func megabits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.megabits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilobits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.kilobits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func yobibytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.yobibytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func zebibytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.zebibytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func exbibytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.exbibytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func pebibytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.pebibytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func tebibytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.tebibytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gibibytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.gibibytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func mebibytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.mebibytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kibibytes(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.kibibytes, exponent)], sigfigs: Double(self).sigfigs)
	}
	func yobibits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.yobibits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func zebibits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.zebibits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func exbibits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.exbibits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func pebibits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.pebibits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func tebibits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.tebibits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gibibits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.gibibits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func mebibits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.mebibits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kibibits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitInformationStorage.kibibits, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func megameters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.megameters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.kilometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func hectometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.hectometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func decameters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.decameters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func meters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.meters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func m(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.meters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func decimeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.decimeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func centimeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.centimeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cm(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.centimeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func millimeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.millimeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func micrometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.micrometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func nanometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.nanometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func picometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.picometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func inches(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.inches, exponent)], sigfigs: Double(self).sigfigs)
	}
	func feet(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.feet, exponent)], sigfigs: Double(self).sigfigs)
	}
	func yards(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.yards, exponent)], sigfigs: Double(self).sigfigs)
	}
	func miles(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.miles, exponent)], sigfigs: Double(self).sigfigs)
	}
	func scandinavianMiles(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.scandinavianMiles, exponent)], sigfigs: Double(self).sigfigs)
	}
	func lightyears(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.lightyears, exponent)], sigfigs: Double(self).sigfigs)
	}
	func nauticalMiles(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.nauticalMiles, exponent)], sigfigs: Double(self).sigfigs)
	}
	func fathoms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.fathoms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func furlongs(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.furlongs, exponent)], sigfigs: Double(self).sigfigs)
	}
	func astronomicalUnits(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.astronomicalUnits, exponent)], sigfigs: Double(self).sigfigs)
	}
	func parsecs(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitLength.parsecs, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func lux(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitIlluminance.lux, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func kg(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.kilograms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilograms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.kilograms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func grams(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.grams, exponent)], sigfigs: Double(self).sigfigs)
	}
	func decigrams(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.decigrams, exponent)], sigfigs: Double(self).sigfigs)
	}
	func centigrams(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.centigrams, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milligrams(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.milligrams, exponent)], sigfigs: Double(self).sigfigs)
	}
	func micrograms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.micrograms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func nanograms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.nanograms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func picograms(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.picograms, exponent)], sigfigs: Double(self).sigfigs)
	}
	func ounces(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.ounces, exponent)], sigfigs: Double(self).sigfigs)
	}
	func poundsMass(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.pounds, exponent)], sigfigs: Double(self).sigfigs)
	}
	func stones(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.stones, exponent)], sigfigs: Double(self).sigfigs)
	}
	func metricTons(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.metricTons, exponent)], sigfigs: Double(self).sigfigs)
	}
	func shortTons(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.shortTons, exponent)], sigfigs: Double(self).sigfigs)
	}
	func carats(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.carats, exponent)], sigfigs: Double(self).sigfigs)
	}
	func ouncesTroy(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.ouncesTroy, exponent)], sigfigs: Double(self).sigfigs)
	}
	func slugs(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitMass.slugs, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func terawatts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.terawatts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gigawatts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.gigawatts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func megawatts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.megawatts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilowatts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.kilowatts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func watts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.watts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milliwatts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.milliwatts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func microwatts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.microwatts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func nanowatts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.nanowatts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func picowatts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.picowatts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func femtowatts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.femtowatts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func horsepower(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPower.horsepower, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func newtonsPerMetersSquared(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.newtonsPerMetersSquared, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gigapascals(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.gigapascals, exponent)], sigfigs: Double(self).sigfigs)
	}
	func megapascals(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.megapascals, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilopascals(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.kilopascals, exponent)], sigfigs: Double(self).sigfigs)
	}
	func hectopascals(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.hectopascals, exponent)], sigfigs: Double(self).sigfigs)
	}
	func inchesOfMercury(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.inchesOfMercury, exponent)], sigfigs: Double(self).sigfigs)
	}
	func bars(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.bars, exponent)], sigfigs: Double(self).sigfigs)
	}
	func millibars(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.millibars, exponent)], sigfigs: Double(self).sigfigs)
	}
	func millimetersOfMercury(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.millimetersOfMercury, exponent)], sigfigs: Double(self).sigfigs)
	}
	func poundsForcePerSquareInch(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitPressure.poundsForcePerSquareInch, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func metersPerSecond(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitSpeed.metersPerSecond, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kilometersPerHour(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitSpeed.kilometersPerHour, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milesPerHour(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitSpeed.milesPerHour, exponent)], sigfigs: Double(self).sigfigs)
	}
	func knots(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitSpeed.knots, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func kelvin(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitTemperature.kelvin, exponent)], sigfigs: Double(self).sigfigs)
	}
	func celsius(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitTemperature.celsius, exponent)], sigfigs: Double(self).sigfigs)
	}
	func fahrenheit(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitTemperature.fahrenheit, exponent)], sigfigs: Double(self).sigfigs)
	}
	
	func megaliters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.megaliters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func kiloliters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.kiloliters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func liters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.liters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func deciliters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.deciliters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func centiliters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.centiliters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func milliliters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.milliliters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cubicKilometers(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cubicKilometers, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cubicMeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cubicMeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cubicDecimeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cubicDecimeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cubicCentimeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cubicCentimeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cubicMillimeters(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cubicMillimeters, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cubicInches(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cubicInches, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cubicFeet(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cubicFeet, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cubicYards(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cubicYards, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cubicMiles(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cubicMiles, exponent)], sigfigs: Double(self).sigfigs)
	}
	func acreFeet(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.acreFeet, exponent)], sigfigs: Double(self).sigfigs)
	}
	func bushels(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.bushels, exponent)], sigfigs: Double(self).sigfigs)
	}
	func teaspoons(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.teaspoons, exponent)], sigfigs: Double(self).sigfigs)
	}
	func tablespoons(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.tablespoons, exponent)], sigfigs: Double(self).sigfigs)
	}
	func fluidOunces(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.fluidOunces, exponent)], sigfigs: Double(self).sigfigs)
	}
	func cups(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.cups, exponent)], sigfigs: Double(self).sigfigs)
	}
	func pints(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.pints, exponent)], sigfigs: Double(self).sigfigs)
	}
	func quarts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.quarts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func gallons(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.gallons, exponent)], sigfigs: Double(self).sigfigs)
	}
	func imperialTeaspoons(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.imperialTeaspoons, exponent)], sigfigs: Double(self).sigfigs)
	}
	func imperialTablespoons(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.imperialTablespoons, exponent)], sigfigs: Double(self).sigfigs)
	}
	func imperialFluidOunces(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.imperialFluidOunces, exponent)], sigfigs: Double(self).sigfigs)
	}
	func imperialPints(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.imperialPints, exponent)], sigfigs: Double(self).sigfigs)
	}
	func imperialQuarts(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.imperialQuarts, exponent)], sigfigs: Double(self).sigfigs)
	}
	func imperialGallons(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.imperialGallons, exponent)], sigfigs: Double(self).sigfigs)
	}
	func metricCups(_ exponent: Int) -> Physical {
		Physical(value: Double(self), units: [(UnitVolume.metricCups, exponent)], sigfigs: Double(self).sigfigs)
	}
}
