import XCTest
@testable import Physical

final class PhysicalTests: XCTestCase {
	override func setUpWithError() throws {
		Physical.Globals.shared.sigfigs = nil
	}
	
	override func tearDownWithError() throws {
	}
	
	func testSigfigs() {
		XCTAssert((13.49999.mm.sigfigs(2)) == 13.mm)
		XCTAssert((13.51.mm.sigfigs(2)) != 13.mm)
	}
	
	func testEqualityHashability() {
		let a = 3.m
		let b = Set<Physical>([a])
		let c = Set<Physical>([a, a])
		
		XCTAssert(b == c)
	}
	
    func testAdditionSigfigs() {
		XCTAssert((3.4.mm + 10.mm.sigfigs(2)) == 13.mm)
		
		XCTAssertEqual(4.8.squareMeters, 4.8.meters(2))
		XCTAssertEqual(3.4.squareMeters + 1.42.squareMeters, 4.8.squareMeters)
		XCTAssertEqual(3.4.meters(2) + 1.42.squareMeters, 4.8.squareMeters)
		XCTAssertEqual(36.6.squareFeet + 1.4.squareMeters, 4.8.squareMeters)
		
		print(36.6.feet(2) + 1.4.squareMeters → .squareMeters)
		XCTAssertEqual(36.6.feet(2) + 1.4.squareMeters, 4.8.squareMeters)
		
		XCTAssertEqual(1.pascals, 1.pascals(1))
		XCTAssertEqual(576123.pascals, 5.68589193.atm)
		XCTAssertEqual(576123.pascals(1), 5.68589193.atm)
		XCTAssertEqual(1.857e15.pascals(3), 1.7848.atmosphericPressure(3))
		
		XCTAssertEqual(1.km.sigfigs(4) + 10.m.sigfigs(2), 1010.m.sigfigs(4))
		XCTAssertEqual((1000.m.sigfigs(6) + 5.m), 1005.m)
		XCTAssertEqual(1.km + 10.m.sigfigs(2), 1.km)
		XCTAssertEqual(1.π.m.sigfigs(5) + sqrt(2).m.sigfigs(5), 4.5558.m.sigfigs(5))
    }
	
	func testFeetMeters() {
		let areaRug = 2.ft * 4.ft
		
		XCTAssertEqual(areaRug.value, 8) // ← checks that the units are ft^2
		XCTAssertEqual(areaRug, (0.743224 ± 1%).squareMeters)
	}
	
	func testMultiplicationSigfigs() {
//		let a = 2.10101.N
//		let b = 4.0.m.sigfigs(2)
//		print(a * b)
//		let c = 8.4.J
//		print(c)
		XCTAssertEqual(2.10101.N * 4.0.m.sigfigs(2), 8.4.J)
//		print(2e3.N * 4.400.m.sigfigs(4))
//		print(9.km.newtons(1))
		XCTAssertEqual(2e3.N * 4.400.m.sigfigs(4), 9.km.newtons(1))
		XCTAssertEqual(20_800.N.m(1).s(1), 20_800.J.s(1))
		XCTAssertEqual(2e3.N.sigfigs(4) * 4.000.m.sigfigs(4) * 2.600.s.sigfigs(4), 20_800.N.m(1).s(1))
	}
	
	func testMaximumError() {
		for (q, a) in [
			(0.1.m.sigfigs(4), 0.00005),
			(0.5.s.sigfigs(4), 0.00025),
			(100.J.sigfigs(4), 0.05),
			(1000.L.sigfigs(4), 0.5),
			(5000.constant.sigfigs(4), 2.5),
			(9990.feet.sigfigs(4), 4.995),
			(10_000.acres.sigfigs(4), 5)
		] {
			let max = q.maximumError
			XCTAssertEqual(max.value, a)
			XCTAssertEqual(max.sigfigs, 16)
		}
	}
	
	func testZeroCase() {
		XCTAssertEqual((12.s - 0.s).sigfigs, 2)
	}
	
	func testMagnetic1() {
		let B = 0.5001.teslas
		let q = 1.602e-19.coulombs
		let m = 9.11e-31.kg
		let v = 6.01e7.mps
		let r = m * v / (q * B)
		
		XCTAssert(r ~ 1.ft)
		XCTAssert(abs(r.value - 0.000_683) < 0.000_000_5)
		XCTAssertEqual(r, (0.000_683 ± 0.000_000_5).m)
		XCTAssertEqual(r, (0.000_683 ± 0.1%).m)
		XCTAssertEqual(r, 683.μm)
	}
	
	func testMagnetic2() {
		let q = Physical.Constants.Particle.Positron.charge
		let m = Physical.Constants.Particle.Positron.mass
		
		let B = MagneticFluxDensity(0.5001, unit: .teslas)
		let v = Speed(6.01e7, unit: .metersPerSecond)
			
		let r₀ = m * v / (q * B)
		
		XCTAssertEqual(r₀, 683.μm)
		
		guard let r = Length(m * v / (q * B)) else {
			XCTAssert(false)
			return
		}
		
		XCTAssertEqual(r.physical, 683.μm)
		
		func orbitalRadiusOfChargeInMagneticField(
			mass: Mass,
			velocity: Speed,
			charge: ElectricCharge,
			magneticFluxDensity: MagneticFluxDensity
		) -> Length? {
			
			Length(mass * velocity / (charge * magneticFluxDensity))
		}
		
		let radius = orbitalRadiusOfChargeInMagneticField(
			mass: Mass(m)!,
			velocity: v,
			charge: ElectricCharge(q)!,
			magneticFluxDensity: B
		)
		
		XCTAssertEqual(radius?.physical, 683.μm)
	}
	
	func testAngles() {
		XCTAssertEqual(1.revolutions, 2.π.radians)
		XCTAssertEqual(2.π.radians, 1.revolutions)
		
		XCTAssertEqual(1.revolutions, 360.degrees)
		XCTAssertEqual(360.degrees, 1.revolutions)
		
		XCTAssertEqual(360.degrees, 2.π.radians)
		XCTAssertEqual(2.π.radians, 360.degrees)
		
		XCTAssertEqual((1.revolutions → .radians).value, 2.π)
		XCTAssertEqual((2.π.radians → .revolutions).value, 1)
		
		XCTAssertEqual((1.revolutions → .degrees).value, 360)
		XCTAssertEqual((360.degrees → .revolutions).value, 1)
		
		XCTAssertEqual((360.degrees → .radians).value, 2.π)
		XCTAssertEqual((2.π.radians → .degrees).value, 360)
		
		XCTAssertEqual(1°.description, "1 °")
		XCTAssertEqual(1°.m(-1).description, "1 ° / m")
		
		XCTAssertEqual(1.radiansPerSecond.description, "1 rad/s")
	}
	
	func testAngularSpeed() {
		XCTAssertEqual(1.revolutionsPerSecond, 2.π.radiansPerSecond)
		XCTAssertEqual(2.π.radiansPerSecond, 1.revolutionsPerSecond)
		
		XCTAssertEqual(60.revolutionsPerMinute, 1.revolutionsPerSecond)
		XCTAssertEqual(2.π.radiansPerSecond, 60.revolutionsPerMinute)
		
		XCTAssertEqual(1.revolutionsPerSecond, 360.degreesPerSecond)
		XCTAssertEqual(360.degreesPerSecond, 1.revolutionsPerSecond)
		
		XCTAssertEqual(360.degreesPerSecond, 2.π.radiansPerSecond)
		XCTAssertEqual(2.π.radiansPerSecond, 360.degreesPerSecond)
		
		XCTAssertEqual((1.revolutionsPerSecond → .radiansPerSecond).value, 2.π)
		XCTAssertEqual((2.π.radiansPerSecond → .revolutionsPerSecond).value, 1)
		
		XCTAssertEqual((1.revolutionsPerSecond → .degreesPerSecond).value, 360)
		XCTAssertEqual((360.degreesPerSecond → .revolutionsPerSecond).value, 1)
		
		XCTAssertEqual((360.degreesPerSecond → .radiansPerSecond).value, 2.π)
		XCTAssertEqual((2.π.radiansPerSecond → .degreesPerSecond).value, 360)

		XCTAssertEqual(1.revolutionsPerSecond.sigfigs(3), 360.degreesPerSecond.sigfigs(3))
		XCTAssertEqual(1.revolutionsPerSecond.sigfigs(3) * 1.s.sigfigs(3), 1.revolutions.sigfigs(3))
		XCTAssertEqual(3.2.revolutionsPerSecond, 20.radiansPerSecond)
		
		XCTAssertEqual(1 / 2.revolutionsPerMinute, 0.5.minutes.perRevolution)
	}
	
	func testNotAThing() {
		XCTAssert(((1.kg + 1.s) / 1.m).value.isNaN)
		
		XCTAssert((1.kg + 1.s).isNotAThing == true)
		XCTAssert((1.kg + 1.s).isNotAThing)
		XCTAssert((1.kg + 1.s) != .notAThing)
		
		XCTAssert(((1.kg + 1.s) / 1.m).isNotAThing == true)
		XCTAssert(((1.kg + 1.s) / 1.m).isNotAThing)
	}
	
	func testNaNs() {
		XCTAssert(Physical.notAThing.value.isNaN)
		XCTAssert((Double.nan.meters + 2.meters).isNotAThing)
		XCTAssert((Double.nan * 2.meters).isNotAThing)
		XCTAssert((2.meters / Double.nan).isNotAThing)
		XCTAssert((2.meters / 0).isNotAThing)
		XCTAssert((2.meters ^ Double.nan).isNotAThing)
	}
	
	func testBasicVectorOfValues() {
		let a = Physical.Constants.Earth.surfaceGravity
		let m = [12.37, 56.78, 90.12].kg
		
		let F = m * a
		
		XCTAssert( F[0] == 121.3.newtons )
		XCTAssert( F[1] == 556.8.newtons )
		XCTAssert( F[2] == 883.8.newtons )
		
		// also: F == [121.3, 556.8, 883.8].newtons
	}
	
	// MARK: - Physics -
	
	func testLong43() {
		let aluminumPlatTemp = 68.5.℉
		let holeDiameter = 8.00.inches.sigfigs(3)
		let finalTemp = 150.fahrenheit.sigfigs(3)
		
		let α = 23.8e-6.celsius(-1)
		let Δt = (finalTemp - aluminumPlatTemp) → .celsius
		
		let diameterSquared = holeDiameter ^ 2
		let finalDiameter = √(diameterSquared * (1 + 2 * (α * Δt)))
		
		XCTAssert(finalDiameter.sigfigs(3) == 8.01.inches)
	}
	
	func testIonizationEnergyOfHydrogen() {
		let me = Physical.Constants.Particle.Electron.mass
		let c = Physical.Constants.lightSpeed
		let α = Physical.Constants.fineStructure
		
		let E = me * (c ^ 2) * (α ^ 2) / 2
		
		XCTAssert(E == (13.6057 ± 1%).eV)
	}
	
	func testFunctionISSOrbitHeight() {
		let G = Physical.Constants.gravitation
		let earthMass = Physical.Constants.Earth.mass
		let earthRadius = Physical.Constants.Earth.meanRadius
		
		func geosynchronousHeightForOrbit(period: Physical) -> Physical {
			XCTAssert(period ~ 1.s)
			
			let aboveEarth = ∛(G * earthMass * (period ^ 2) / 4.π²)
			return aboveEarth - earthRadius
		}
		
		let orbitHeight = geosynchronousHeightForOrbit(period: 92.min)
		
		XCTAssertEqual(orbitHeight, (235 ± 1%).miles)
	}
	
	func testFunctionISSOrbitHeight2() {
		let G = Physical.Constants.gravitation
		let earthMass = Physical.Constants.Earth.mass
		let earthRadius = Physical.Constants.Earth.meanRadius
		
		func geosynchronousHeightForOrbit(period: Physical) -> Length {
			let aboveEarth = ∛(G * earthMass * (period ^ 2) / 4.π²)
			
			return Length(aboveEarth - earthRadius)!
		}
		
		let orbitHeight = geosynchronousHeightForOrbit(period: 92.min)
		
		XCTAssertEqual(orbitHeight.physical, (235 ± 1%).miles)
	}
	
	func testFunctionISSOrbitHeight3() {
		let G = Physical.Constants.gravitation
		let earthMass = Physical.Constants.Earth.mass
		let earthRadius = Physical.Constants.Earth.meanRadius
		
		func geosynchronousHeightForOrbit(period: Duration) -> Length {
			let aboveEarth = ∛(G * earthMass * (period ^ 2) / 4.π²)
			
			return Length(aboveEarth - earthRadius)!
		}
		
		let orbitHeight = geosynchronousHeightForOrbit(period: Duration(92.min)!)
		print(orbitHeight.physical → .miles)
		XCTAssertEqual(orbitHeight.physical, (235 ± 1%).miles)
	}
	
	func testMoonWeight() {
		let weight = 1_000.lbf.sigfigs(3)
		let gravity = Physical.Constants.Earth.surfaceGravity
		let moonG = Physical.Constants.Astronomic.Moon.surfaceGravity
		
		let mass = weight / gravity
		let moonWeight = mass * moonG
		
		XCTAssertEqual(mass, 454.kg)
		XCTAssertEqual(mass, 31.1.slugs)
		XCTAssert(moonWeight == 735.N)
	}
	
	func testPascals() {
		let atmApprox1 = 14.7.lbf.inches(-2)
		let atmApprox2 = 2116.poundsForce.feet(-2)
		let atm = Physical.Constants.Earth.surfacePressure
		
		XCTAssert(atmApprox1 == atm)
		XCTAssert(atmApprox2 == atm)
	}
	
	func testSunEarthLightTime() {
		let c = Physical.Constants.lightSpeed
		let sunEarthDistance = 1.au
		
		let lightMinute = c * (1.minutes / 1.s)
		
		let Δt = sunEarthDistance / lightMinute
		
		XCTAssert((Δt → .s).sigfigs(3) == 8.32.s)
	}
	
	// MARK: - Fluid Mechanics -
	
	// from Fluid Mechanics (7th ed, White):
	
	func testGas() { // p21
		let Λ = Physical.Constants.molarGas
		let Mgas = Physical.Constants.Earth.molecularWeightDryAir
		
		let Rgas = Λ / Mgas
		
		print(Rgas)
		
		let p = Physical.Constants.Earth.standardAtmosphere
		let T = 520.rankine.sigfigs(3)
		
		let ρAir = p / (Rgas * T)
		
		// 2116—"slugs / ft s^2"
		
		XCTAssert(2116.slugs.feet(-1).s(-2) == p)
		XCTAssert(ρAir == 1.22.kg.m(-3))
	}
	
	func testSeawater() { // p25
		let B = 3_000.0
		let pressure = 1_100.atm.sigfigs(4)
		let pressureRatio = pressure / 1.atm.sigfigs(4)
		
		let densityRatio = ((pressureRatio + B) / (B + 1))^(1/7)
		
		XCTAssert(densityRatio == 1.046)
		
		let aveSurfaceDensity = 2.00.slugs.feet(-3).sigfigs(4)
		let ρ = densityRatio * aveSurfaceDensity
		
		XCTAssert(ρ == 2.09.slugs.feet(-3))
	}
	
	func testCapillaryTube() { // p34
		let g = Physical.Constants.Earth.surfaceGravity
		let R = 1.mm
		
		let waterAirGlass   = (  0.0, 0.073, 1_000.0)
		let mercuryAirGlass = (130.0, 0.48, 13_600.0)
		
		func findHeight(_ input: (Double, Double, Double)) -> Physical {
			let Θ = input.0°
			let Υ = input.1.N/.m
			let ρ = input.2.kg/.m³
			
			let γ = ρ * g
			let h = 2 * Υ * cos(Θ) / (γ * R)
			
			return h.sigfigs(2)
		}
		
		XCTAssert( [waterAirGlass, mercuryAirGlass].map { findHeight($0) } == [1.5.cm, -0.46.cm] )
	}
	
	// MARK: - Chemistry -
	
	func testTemperature() {
		Physical.Globals.shared.sigfigs = 3
		
		XCTAssert((2 * 30.℃).isNotAThing)
		XCTAssert((2 * 30.℉).isNotAThing)
		XCTAssertEqual(2 * 30.K, 60.K)
		
		XCTAssertEqual((30.℃ - 5.℃), 25.℃.difference)
		XCTAssertEqual((30.℉ - 5.℉), 25.℉.difference)
		XCTAssertEqual((30.K - 5.K), 25.K.difference)
		
		// Addition of different non-zero'd units not allowed
		
		XCTAssert((28.℃ - 5.℉).isNotAThing)
		XCTAssert((28.℃ + 5.K).isNotAThing)
		XCTAssert((28.K - 5.℉).isNotAThing)
		
		// Any multiplication between different non-zero'd units must first convert to the fundamental dimension base
		
		XCTAssert((50.℉ / 30.℃).isNotAThing)
		XCTAssert((50.℉ / 30.K).isNotAThing)
		XCTAssert((50.K / 30.℃).isNotAThing)
		
		XCTAssertEqual((50.fahrenheit.difference / 10.fahrenheit.difference), 5.constant)
		
//		XCTAssertEqual((50.℉ / 10.℉), 5.constant)
//		XCTAssertEqual((50.℃ / 10.℃), 5.constant)
		
		XCTAssertEqual((50.K / 10.K), 5.constant)
		XCTAssertEqual((50.rankine / 10.rankine), 5.constant)

		// The other scenario is when units show up with negative exponents
		
		XCTAssert((150.℉ * 23.8e-6.celsius(-1)).isNotAThing)
	}
	
	func testRankineTemps() {
		XCTAssert(0.fahrenheit.sigfigs(5) == 459.67.rankine)
		XCTAssert(0.kelvin.sigfigs(3) == 0.rankine.sigfigs(3))
		XCTAssert((-458.67).fahrenheit == 1.rankine)
		XCTAssert(0.celsius.sigfigs(3) == 491.67.rankine)
		XCTAssert(373.1339.kelvin == 671.64102.rankine)
	}
	
	func testPVeqNRT() {
		let P = 1.atm                // ← kg / m s2
		let V = 0.100.cubicMeters
		let N = 0.00420.moles
		
		let R2 = 8.314.J/.K.moles
		
		let R = 8.206e-5.atm.m³/.K.moles
		
		XCTAssert(R ~ R2)
		XCTAssert(R == R2)
		
		let T = (P * V) / (N * R)
		
		XCTAssert((P * V) ~ 1.joules)
		XCTAssert((N * R) ~ 1.atm.m(3)/.K)
		XCTAssert((N * R * T) ~ (P * V))
		XCTAssert(1.fahrenheit ~ T)
	}
	
	func testInterIonicDistanceInSalt() { // 2.2
		let densityNaCl = 2.165.g/.cm(3)
		let massNa = Physical.Constants.Atom.sodium.mass
		let massCl = Physical.Constants.Atom.chlorine.mass
		
		let massNaCl = massCl + massNa
		
		let volume = massNaCl / densityNaCl
		
		let volumeOneMoleNaCl = volume / Physical.Constants.avogadro
		
		let ionDistance = ∛(volumeOneMoleNaCl / 2)
		
		XCTAssertEqual(massNaCl, 58.443.g/.moles )
		XCTAssertEqual(volume, 26.994.cm(3)/.moles )
		XCTAssertEqual(volumeOneMoleNaCl, 4.48e-29.m³ )
		XCTAssertEqual(ionDistance, 2.82e-10.m )
	}
	
	// Reproduces Issue #2
	func testDescription() {
		var length = 5.meters
		XCTAssertEqual(length.description, "5 m")
		XCTAssertEqual(length.unitDescription, "m")
		XCTAssertEqual(length.dimensionalDescription, "L")
		length = 14.millimeters
		XCTAssertEqual(length.description, "14 mm")
		XCTAssertEqual(length.unitDescription, "mm")
		XCTAssertEqual(length.dimensionalDescription, "L")
		length = 8.feet
		XCTAssertEqual(length.description, "8 ft")
		XCTAssertEqual(length.unitDescription, "ft")
		XCTAssertEqual(length.dimensionalDescription, "L")
		
		var area = 2.feet.feet
		XCTAssertEqual(area.description, "2 ft²")
		XCTAssertEqual(area.unitDescription, "ft²")
		XCTAssertEqual(area.dimensionalDescription, "L²")
		area = 6.meters(2)
		XCTAssertEqual(area.description, "6 m²")
		XCTAssertEqual(area.unitDescription, "m²")
		XCTAssertEqual(area.dimensionalDescription, "L²")
		
		var lengthArray = [13, 19].kilometers
		XCTAssertEqual(lengthArray.description, "[13, 19] km")
		XCTAssertEqual(lengthArray.unitDescription, "km")
		XCTAssertEqual(lengthArray.dimensionalDescription, "L")
		lengthArray = [20, 21].miles
		XCTAssertEqual(lengthArray.description, "[20, 21] mi")
		XCTAssertEqual(lengthArray.unitDescription, "mi")
		XCTAssertEqual(lengthArray.dimensionalDescription, "L")
	}
}
