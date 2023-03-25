import XCTest
@testable import Physical

final class PhysicalTests: XCTestCase {
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
		
		XCTAssertEqual((1.s / 1°.kg).description, (1.s / 1.kg).description)
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
	
	/*
	func testUnitPromotion() {
		let F = 1.ft * 20.lbs / (1.minutes^2)
		XCTAssert(F.convertUp(to: 1.newtons).sigfigs(5) == 7.6808e-4.newtons)
		XCTAssert(F.to_newtons.sigfigs(5) == 7.6808e-4.newtons)
		XCTAssert(F.convertUp(to: 1.parsecs) == .notAThing)
		XCTAssert((F * 1.yards).convertUp(to: 1.joules).sigfigs(5) == 7.0233e-4.joules)
		XCTAssert(((F * 1.yards).convertUp(to: 1.joules) / 1.meters).sigfigs(5) == 7.0233e-4.kg.m(1).s(-2))
		XCTAssert(F.withFundamentalUnits.sigfigs(5) == 7.6808e-4.kg.m(1).s(-2))
	}*/
	
	/*
	func testBasicNumericComparisons() {
		let x: Float = 12.3456
		let y: Double = 12.3456
//		let z: Float80 = 12.3456
		
		let p = Physical(value: Doublex, unit: UnitPower.horsepower) / 4
		let q = Physical(value: y, unit: UnitPower.horsepower) / 4
//		let r = Physical(value: z, unit: UnitPower.horsepower) / 4
		print(p.description)
//		XCTAssert(p.description == r.description)
		XCTAssert(p.description == q.description)
//		XCTAssert(q.description == r.description)
	}*/
	
	// MARK: - Physics -
	
	func testTires() {
		// Base on this video from Darien: https://www.youtube.com/watch?v=NYvKxsYFqO8
		
		//_________________________________________/ Physical constants
		let airDensity = 1.225.kg.m(-3)
		let gravity = Physical.Constants.Earth.surfaceGravity
		
		//_________________________________________/ Characteristics of the car
		let groundClearance = 6.inches
		let frontalArea = 2.2.squareMeters
		let dragCoefficient = 0.25
		let mass = 1800.kg
		
		//_________________________________________/ Choice of tires
		let narrowTire = 205.mm
		let wideTire = 305.mm
		
		//_________________________________________/ Driving scenario
		let speed = 75.mph
		let distance = 320.km
		
		//_________________________________________/ Step 1. Energies required to overcome air drag
		
		func energyRequiredToOvercomeDrag(forArea area: Physical) -> Physical {
			airDensity * (speed^2) * dragCoefficient * area * distance / 2
		}
		
		let areaExposedNarrowPerTire = groundClearance * narrowTire
		let areaExposedWidePerTire = groundClearance * wideTire
		let ΔareaExposed = 2 * (areaExposedWidePerTire - areaExposedNarrowPerTire)
		
		print(energyRequiredToOvercomeDrag(forArea: frontalArea).sigfigs(3) → .kilowattHours)
		print(energyRequiredToOvercomeDrag(forArea: frontalArea + ΔareaExposed).sigfigs(3) → .kilowattHours)
		
		//_________________________________________/ Step 2. Rolling resistance
		
		let bestCaseEnergy  = 0.005 * mass * gravity * distance
		let badCaseEnergy   = 0.015 * mass * gravity * distance
		let realisticEnergySavings = (0.01 - 0.008) * mass * gravity * distance
		
		//		print((bestCaseEnergy.to_kilowattHours.sigfigs(3), badCaseEnergy.to_kilowattHours.sigfigs(3)))
		//		print(realisticEnergySavings.to_kilowattHours.sigfigs(3))
		
		//_________________________________________/ Step 3. Wheel size
		
		
		
		//		print("")
	}
	
	func testLong43() {
		let aluminumPlatTemp = 68.5.℉
		let holeDiameter = 8.00.inches.sigfigs(3)
		let finalTemp = 150.fahrenheit.sigfigs(3)
		
		let α = 23.8e-6.celsius(-1)
		let Δt = (finalTemp - aluminumPlatTemp) → .celsius
		
		let diameterSquared = holeDiameter ^ 2
		
		let finalDiameter = √(diameterSquared * (1 + 2 * α * Δt))
		
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
	
	/* ± still needs some thought
	func testPlusMinus() {
		let a = 5.m
		let b = 4 ± 1.1.m
		let c = 2 ± 0.3.m
		let d = 2 ± 0.3.s
		let e = -12.345.miles
		let f = -13.441 ± 2.miles
		let g = 0.constant.gigaannum
		let h = 2 ± 2.3.s
		
		XCTAssert(!(a == c))
		XCTAssert(!(a == d))
		XCTAssertNotEqual(a, b)
		XCTAssertNotEqual(a, c)
		XCTAssertNotEqual(a, d)
		XCTAssertEqual(e, f)
		XCTAssertEqual(g, h)
	}*/
	
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
		XCTAssertEqual(2 * 30.℃.sigfigs(2), 60.℃.sigfigs(2))
		XCTAssertEqual(2 * 30.℉.sigfigs(2), 60.℉.sigfigs(2))
		XCTAssertEqual(2 * 30.K.sigfigs(2), 60.K.sigfigs(2))
		
		XCTAssertEqual((30.℃ - 5.℃).sigfigs(2), 25.℃)
		XCTAssertEqual((30.℉ - 5.℉).sigfigs(2), 25.℉)
		XCTAssertEqual((30.K - 5.K).sigfigs(2), 25.K)
		
		// Addition of different non-zero'd units not allowed
		
		XCTAssert((28.℃ - 5.℉).isNotAThing)
		XCTAssert((28.℃ + 5.K).isNotAThing)
		XCTAssert((28.K - 5.℉).isNotAThing)
		
		// Any multiplication between different non-zero'd units must first convert to the fundamental dimension base
		
		XCTAssert((50.℉.sigfigs(3) / 30.℃.sigfigs(3)).isNotAThing)
		XCTAssert((50.℉.sigfigs(3) / 30.K.sigfigs(3)).isNotAThing)
		XCTAssert((50.K.sigfigs(3) / 30.℃.sigfigs(3)).isNotAThing)
		
		XCTAssertEqual((50.℉.sigfigs(3) / 10.℉.sigfigs(3)), 5.00.constant.sigfigs(3))
		XCTAssertEqual((50.℃.sigfigs(3) / 10.℃.sigfigs(3)), 5.00.constant.sigfigs(3))
		XCTAssertEqual((50.K.sigfigs(3) / 10.K.sigfigs(3)), 5.00.constant.sigfigs(3))
		
		// The other scenario is when units show up with negative exponents
		
		XCTAssert((150.℉.sigfigs(3) * 23.8e-6.celsius(-1)).isNotAThing)
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
	
	// Exam Survival Guide, Physical Chemistry — Jochen Vogt (2017)
	
	func testInterIonicDistanceInSalt() { // 2.2
		let densityNaCl = 2.165.g/.cm(3)
		let massNa = Physical.Constants.Atom.sodium.mass
		let massCl = Physical.Constants.Atom.chlorine.mass
		
		let massNaCl = massCl + massNa
		
		let volume = massNaCl / densityNaCl
		
		let volumeOneMoleNaCl = volume / Physical.Constants.avogadro
		
//		let ionDistance = (volumeOneMoleNaCl / 2) ^ (1/3)
		let ionDistance = ∛(volumeOneMoleNaCl / 2)
		
		XCTAssertEqual(massNaCl, 58.443.g/.moles )
		XCTAssertEqual(volume, 26.994.cm(3)/.moles )
		XCTAssertEqual(volumeOneMoleNaCl, 4.48e-29.m³ )
		XCTAssertEqual(ionDistance, 2.82e-10.m )
	}
	
	// MARK: - Experiments -
	
	func test___PhysicalExponent() {
		XCTAssert((1.minutes ^ 1.ft).isNotAThing)
		
		let R₁ = 22.ohms
		let R₂ = 47.ohms
		let v₀ = 5.volts
		let v = v₀ ^ (1 + R₁/R₂)  // ← what units should this have?
		
		print(v)
	}
	
	func test___() {
		let a = [1.1, 2.2, 3.3].kg + [10.01, 20.02, 33.33].kg
		let b = [1.1, 2.2, 3.3].kg - [10.01, 20.02, 33.33].kg
		
		// b[1] = -18.kg ← would be nice
		
		print(a)
		print(b)
		
		print(a.sigfigs(3))
		print(([1, 2, 3].kg + 10.kg).sigfigs(2))
		print((1.kg + [10, 20, 33].kg).sigfigs(2))
	}
	
	func test____() {
		var l = Physical.Constants.lightSpeed
		var g = 2.N
		var n = 2.N.meters(1).hours(2)
		
		let o = 1.meters(3) → .liters
		print(o)
		print(1.cubicMeters → .liters)
		print(1.L → .cubicMeters)
		print(1.L.withBasicUnits)
		
		let a₀ = 27.g.cm(-3)
		let b₀ = 27.g.cm(-3).watts(-2)
		let c₀ = 14.seconds(-1)
		
		let a = 27.g/.cm(3)
		let b = 27.g/.cm(3).watts(2)
		let c = 14/.seconds
		
		let b₁ = 27.g.per.cm(3).watts(2)
		
		print("\(b) | \(b₁)")
		
		let freeFall = 9.81.m/.s
		
		print(freeFall)
		print((a₀, b₀, c₀))
		print((a, b))
		print(c)
		
		
		let P = 1.atm
		let N = 0.0042.moles
//		let V = 0.1.cubicMeters
		let V = 0.1.meters(3)
		let R = Physical.Constants.molarGas
		let R₁ = 0.08206.atm.liters(1).kelvin(-1).moles(-1)
		let R₂ = 0.08206.atm.liters(1)/.kelvin(1).moles(1)
		
		// experimental single-exponent vars:
		let R₀ = 0.08206.atm.liters/.kelvin.moles
		
		print(P * V / (N * R))
		print(P * V / (N * R₁))
		print(P * V / (N * R₂))
		print(P * V / (N * R₀))
		print(P * V / (N * R) → .celsius)
		print(P * V / (N * R₁) → .celsius)
		
		//    1 atm  *  0.1 m^3      K mol           m^3
		//   -------------------------------  =  290 --- K  =  290,000 K
		//    0.0042 mol  *  0.08206 atm L            L
		
		
//		XCTAssert() // should be 1000
	}
	
	func test_____() {
		let t = 6.celsius
		
		let m = 4.s + 3.m
		let z = m + Physical.notAThing
		
		struct Polly {
			var coefficients: Physical  // ← which *must* be built on an array of values [a, b, c, ...].«unit»
			
			func expand(toOrder order: Int) -> ((Physical) -> Physical) {
				guard let α = coefficients.values,
					  order <= α.count
				else {
					return { _ in .notAThing }
				}
				
				return { x in
					(0..<order).map({ j in α[j] * (x ^ j) }).reduce(x * 0, +)
				}
			}
		}
		
		let x: Physical = [1.2, 0, 11].constant
		let p = Polly(coefficients: x)
		//let f = p.expand(toOrder: 3)
		
		//f(3.m)
		

		
	}
	
	func test_Foster_Tregeagle() {
		let power = 70.megawatts
		let momentOfInertia = 16_000.kg.squareMeters
		let idleLoad = 10.revolutions/.min
		let syncSpeed = 93.75.revolutions/.min
		let Δtime = 3.minutes
		
		let energy1 = momentOfInertia * (idleLoad ^ 2) / 2
		let torqueAverage = (syncSpeed - idleLoad) * momentOfInertia / Δtime
		
		// Type 1 KOQ error test:
		XCTAssert((energy1 + torqueAverage).isNotAThing)

	}
	// what is the point of the following?
//    static var allTests = [
//		("testZeroCase", testZeroCase),
//        ("testAdditionSigfigs", testAdditionSigfigs),
//		("testMultiplicationSigfigs", testMultiplicationSigfigs)
//
//    ]
}

/*
final class PhysicalTypeTests: XCTestCase {
	func testTest() {
		let pt = PhysicalType<UnitDuration>(physical: 3.s)
		
		func add1s(time: PhysicalType<UnitDuration>) -> Physical {
			return 2.s
		}
		
		print(add1s(time: pt))
		
		print(Complex(4.0))
		
		func thisPow<T: Real>(_ x: T, toThe y: T) -> T { pow(x, y) }
		
		print(thisPow(Double(10.0), toThe: Double(12.3456)))
	}
}
*/


/*
 N       kg m        kg
---  =  ------- =  -----
m m     m m s s    m s s
*/
