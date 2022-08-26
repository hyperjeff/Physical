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

		XCTAssert(3.4.squareMeters + 1.42.squareMeters == 4.8.squareMeters)
		XCTAssert(3.4.meters(2) + 1.42.squareMeters == 4.8.squareMeters)
		XCTAssert(36.6.squareFeet + 1.4.squareMeters == 4.8.squareMeters)
		XCTAssert(36.6.feet(2) + 1.4.squareMeters == 4.8.squareMeters)

		XCTAssert(1.pascals == 1.pascals(1))
		XCTAssert(576123.pascals == 5.68589193.atm)
		XCTAssert(576123.pascals(1) == 5.68589193.atm)
		XCTAssert(1.857e15.pascals(3) == 1.7848.atmosphericPressure(3))
		
		XCTAssert(1.km.sigfigs(4) + 10.m.sigfigs(2) == 1010.m.sigfigs(4))
		XCTAssert((1000.m.sigfigs(6) + 5.m) == 1005.m)
		XCTAssert(1.km + 10.m.sigfigs(2) == 1.km)
		XCTAssert(1.π.m.sigfigs(5) + sqrt(2).m.sigfigs(5) == 4.5558.m.sigfigs(5))
    }
	
	func testFeetMeters() {
		let areaRug = 2.ft * 4.ft
		XCTAssert(areaRug.value == 8) // ← checks that the units are ft^2
		
		XCTAssert(areaRug == (0.743224 ± 1%).squareMeters)
	}
	
	func testMultiplicationSigfigs() {
		XCTAssert(2.10101.N * 4.0.m.sigfigs(2) == 8.4.J)
		XCTAssert(2e3.N * 4.400.m.sigfigs(4) == 9.km.newtons(1))
		XCTAssert(20_800.N.m(1).s(1) == 20_800.J.s(1))
		XCTAssert(2e3.N.sigfigs(4) * 4.000.m.sigfigs(4) * 2.600.s.sigfigs(4) == 20_800.N.m(1).s(1))
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
			XCTAssert(max.value == a)
			XCTAssert(max.sigfigs == 16)
		}
	}
	
	func testZeroCase() {
		XCTAssert((12.s - 0.s).sigfigs == 2)
	}
	
	func testMagnetic1() {
		let B = 0.5001.teslas
		let q = 1.602e-19.coulombs
		let m = 9.11e-31.kg
		let v = 6.01e7.mps
		let r = m * v / (q * B)
		
		XCTAssert(r ~ 1.ft)
		XCTAssert(abs(r.value - 0.000_683) < 0.000_000_5)
		XCTAssert(r == (0.000_683 ± 0.000_000_5).m)
		XCTAssert(r == (0.000_683 ± 0.1%).m)
		XCTAssert(r == 683.μm)
	}
	
	func testMagnetic2() {
		let q = Physical.Constants.Particle.Positron.charge
		let m = Physical.Constants.Particle.Positron.mass
		
		let B = MagneticFluxDensity(0.5001, unit: .teslas)
		let v = Speed(6.01e7, unit: .metersPerSecond)
			
		let r₀ = m * v / (q * B)
		
		XCTAssert(r₀ == 683.μm)
		
		guard let r = Length(m * v / (q * B)) else {
			XCTAssert(false)
			return
		}
		
		XCTAssert(r.physical == 683.μm)
		
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
		
		XCTAssert(radius?.physical == 683.μm)
	}
	
	func testAngularSpeed() {
		XCTAssert(1.revolutionsPerSecond.sigfigs(3) == 360.degreesPerSecond.sigfigs(3))
		XCTAssert(1.revolutionsPerSecond.sigfigs(3) * 1.s.sigfigs(3) == 1.revolutions.sigfigs(3))
	}
	
	func testAngularUnits() {
		XCTAssert(1°.description == "1 °")
		XCTAssert(1°.m(-1).description == "1 ° / m")
		XCTAssert(1°.kg(1).description == 1.kg.description)
		XCTAssert(1°.kg(1).joules(-2).description == 1.kg.joules(-2).description)
		XCTAssert((1.s / 1°.kg(1)).description == (1.s/1.kg).description)
		XCTAssert(1.radiansPerSecond.description == "1 rad/s")
	}
	
	func testNotAThing() {
		XCTAssert(((1.kg + 1.s) / 1.m).value.isNaN)
		
		XCTAssert((1.kg + 1.s).isNotAThing == true)
		XCTAssert((1.kg + 1.s).isNotAThing)
		XCTAssert((1.kg + 1.s) != .notAThing)
		
		XCTAssert(((1.kg + 1.s) / 1.m).isNotAThing == true)
		XCTAssert(((1.kg + 1.s) / 1.m).isNotAThing)
	}
	
	func testBasicVectorOfValues() {
		let a = Physical.Constants.Earth.surfaceGravity
		let m = [12.37, 56.78, 90.12].kg
		
		let F = m * a
		
		XCTAssert(F[0] == 121.3.newtons)
		XCTAssert(F[1] == 556.8.newtons)
		XCTAssert(F[2] == 883.8.newtons)
		
//		XCTAssert(F == [121.3, 556.8, 883.8].N)
	}
	
	/*func testPowers() {
		let a = [12.1, 3.6, -1.2, 0].miles
		
		XCTAssert((a ^ 2) == [146, 13, 1.44, 0].miles)
	} */
	
	// MARK: - Physics -
	
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
		
		XCTAssert( orbitHeight == (235 ± 1%).miles )
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
		
		XCTAssert( orbitHeight.physical == (235 ± 1%).miles )
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
		
		XCTAssert( orbitHeight.physical == (235 ± 1%).miles )
	}
	
	func testPlusMinus() {
		let a = 5.m
		let b = 4 ± 1.1.m
		let c = 2 ± 0.3.m
		let d = 2 ± 0.3.s
		let e = -12.345.miles
		let f = -13.441 ± 2.miles
		let g = 0.constant.gigaannum
		let h = 2 ± 2.3.s
		
//		XCTAssert(a != b)
		XCTAssert(!(a == c))
		XCTAssert(a != c)
		XCTAssert(!(a == d))
		XCTAssert(a != d)
//		XCTAssert(e == f)
		XCTAssert(g == h)
	}
	
	func testMoonWeight() {
		let weight = 1_000.lbf.sigfigs(3)
		let gravity = Physical.Constants.Earth.surfaceGravity
		let moonG = Physical.Constants.Astronomic.Moon.surfaceGravity
		
		let mass = weight / gravity
		let moonWeight = mass * moonG
		
		XCTAssert(mass == 454.kg)
		XCTAssert(mass == 31.1.slugs)
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
		XCTAssert(Δt.to(.s).sigfigs(3) == 8.32.s)
		XCTAssert(Δt.to(UnitDuration.seconds).sigfigs(3) == 8.32.s)
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
		XCTAssert(2 * 30.℃.sigfigs(2) == 60.℃.sigfigs(2))
		XCTAssert(2 * 30.℉.sigfigs(2) == 60.℉.sigfigs(2))
		XCTAssert(2 * 30.K.sigfigs(2) == 60.K.sigfigs(2))
		
		XCTAssert((30.℃ - 5.℃).sigfigs(2) == 25.℃)
		XCTAssert((30.℉ - 5.℉).sigfigs(2) == 25.℉)
		XCTAssert((30.K - 5.K).sigfigs(2) == 25.K)
		
		// Addition of different non-zero'd units not allowed
		
		XCTAssert((28.℃ - 5.℉).isNotAThing)
		XCTAssert((28.℃ + 5.K).isNotAThing)
		XCTAssert((28.K - 5.℉).isNotAThing)
		
		// Any multiplication between different non-zero'd units must first convert to the fundamental dimension base
		
		XCTAssert((50.℉.sigfigs(3) / 30.℃.sigfigs(3)).isNotAThing)
		XCTAssert((50.℉.sigfigs(3) / 30.K.sigfigs(3)).isNotAThing)
		XCTAssert((50.K.sigfigs(3) / 30.℃.sigfigs(3)).isNotAThing)
		
		XCTAssert((50.℉.sigfigs(3) / 10.℉.sigfigs(3)) == 5.00.constant.sigfigs(3))
		XCTAssert((50.℃.sigfigs(3) / 10.℃.sigfigs(3)) == 5.00.constant.sigfigs(3))
		XCTAssert((50.K.sigfigs(3) / 10.K.sigfigs(3)) == 5.00.constant.sigfigs(3))
		
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
	
	func testInterIonicDistanceInSalt() {
		let densityNaCl = 2.165.g/.cm(3)
		let massNa = Physical.Constants.Atom.sodium.mass
		let massCl = Physical.Constants.Atom.chlorine.mass
		
		let massNaCl = massCl + massNa
		
		let volume = massNaCl / densityNaCl
		
		let volumeOneMoleNaCl = volume / Physical.Constants.avogadro
		
//		let ionDistance = (volumeOneMoleNaCl / 2) ^ (1/3)
		let ionDistance = ∛(volumeOneMoleNaCl / 2)
		
		XCTAssert( massNaCl == 58.443.g/.moles )
		XCTAssert( volume == 26.994.cm(3)/.moles )
		XCTAssert( volumeOneMoleNaCl == 4.48e-29.m³ )
		XCTAssert( ionDistance == 2.82e-10.m )
	}
	
}
