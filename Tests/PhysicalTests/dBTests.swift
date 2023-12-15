import XCTest
import Physical

final class dBTests: XCTestCase {

    override func setUpWithError() throws {
		Physical.Globals.shared.sigfigs = 4
	}

    override func tearDownWithError() throws { }
	
	func testBasics() {
		XCTAssertEqual(1.125e3.pascals.dBSPL, 155.dBSPL)
		XCTAssertEqual(0.01.pascals.dBSPL, 53.98.dBSPL)
		XCTAssertEqual(4e-4.pascals.dBSPL, 26.02.dBSPL)
		XCTAssertEqual(1.899e-6.pascals.dBSPL, (-20.45).dBSPL)
		
		XCTAssertEqual(1.pascals.dB(reference: .dBSPL), 93.98.dBSPL)
		XCTAssertEqual(30.watts.dB(reference: .dBm), 44.771.dBm)
		XCTAssertEqual(30.watts.dB(reference: .dBW), 14.771.dBW)
		XCTAssertEqual(20.dBW.dereferencedValue.dBm, 50.dBm)
	}
	
	func testCustomReference() {
		let r = 4e-3.newtons.perSquareMeter
		let p = 4.301e-2.pascals
		let q = p.dB(reference: r)
		
		XCTAssertEqual(q, 20.63.dB(reference: r))
		
		let spl = 0.dBSPL.dereferencedValue
		let a = 4.dB(reference: spl, symbol: "SPL'")
		let b = a.dereferencedValue
		let c = 4.dBSPL.dereferencedValue
		
		XCTAssertEqual(b, c)
	}
	
    func testGeneral() {
		XCTAssertEqual(0.dBm.dereferencedValue, 1.mW)
		XCTAssertEqual((0.dBm * 2).dereferencedValue, 1.mW)
		
		let a = 0.5.watts.dB(reference: 1.watts).value
		let b = round(1000 * a) / 1000
		XCTAssertEqual(b, -3.01)
		
		let c = (-3).dBV.ratio!
		let d = round(1000 * c) / 1000
		XCTAssertEqual(d, 0.708)
		
		XCTAssertEqual(0.5.watts.dB(reference: 10.watts, symbol: "MWP").description, "-13.01 dB MWP")
		XCTAssertEqual(0.05.volts.dBV, (-26.02).dBV)
		
		XCTAssertEqual(20.dBW.dereferencedValue.dBm, 50.dBm)
		XCTAssertEqual(20.dBW → DBReference.dBm, 50.dBm)
		XCTAssertEqual(20.dBW → .dBm, 50.dBm)
		
		XCTAssertEqual(0.dBSPL * 2, 0.dBSPL)
		XCTAssertEqual(1.dBm * 2, 2.dBm)
		XCTAssertEqual(2 * 1.dBm, 2.dBm)
		XCTAssertEqual((0.dBm.dereferencedValue * 2).dBm, 3.01.dBm)
		
		XCTAssertEqual(10.mW.dB(reference: 1.mW) + 10.mW.dB(reference: 2.mW), 100.mW)
		XCTAssertEqual(0.dBm + 2.3.dBm, 2.3.dBm)
		XCTAssertEqual((20.dBSWL.dereferencedValue + 20.dBSWL.dereferencedValue).dBSWL, 23.01.dBSWL)
		XCTAssertEqual(20.dBSWL + 20.dBSWL, 40.dBSWL)
		
		XCTAssertEqual(10.watts - 0.7.dBW + 13.dBW - 137.dBW + 11.dBW - 1.4.dBW, 3.09e-8.mW)
    }
	
	func testMixedUnits() {
		let a = 20.dBm.perKilohertz
		
		XCTAssertEqual(a * 2.kHz, 200.mW)
		XCTAssertTrue((a * 2.kHz).dBSIL.isNotAThing)
	}
	
	func testComparisons() {
		XCTAssertTrue(12.dBSPL < 15.dBSPL)
		XCTAssertFalse(12.dBSPL > 15.dBSPL)
		XCTAssertFalse(15.dBSPL < 12.dBSPL)
		XCTAssertFalse(12.dBV < 12.dBu)
		XCTAssertTrue(12.dBu < 12.dBV)
		XCTAssertFalse(12.dBm < 12.dBSWL)
		XCTAssertTrue(12.dBk > 12.dBW)
		
		XCTAssertFalse(12.dBJ > 12.dBK)
		XCTAssertFalse(12.dBJ < 12.dBK)
		
		XCTAssertTrue(136.5.dBSWL == 166.5.dBf)
		XCTAssertFalse(136.5.dBSWL == 167.5.dBf)
		XCTAssertFalse(136.5.dBSWL == 166.5.dBμ)
	}
	
	func testMultiplication() {
		XCTAssertEqual(6 * 12.dBμV, 72.dBμV)
		
		XCTAssertEqual(12.dBμV * 12.dBμV, 15.85.microvolts(2))
		XCTAssertEqual(12.dBμV ^ 3, 63.1.microvolts(3))
		
		XCTAssertEqual(12.dBμV * 12.dBK, 63.1e-6.K.V)
		
		XCTAssertEqual(40.dBV / 20.meters, 5.V/.m)
		
		XCTAssertEqual(3 / 12.dBm, 0.1893.perMilliwatt)
	}
	
	func testExamples1() {
		let p₁ = 40.dBSPL.dereferencedValue
		let r₁ = 2.meters
		let r₂ = 4.meters
		
		let p₂ = (r₁ / r₂) * p₁
		
		XCTAssertEqual(p₂.dBSPL, 33.98.dBSPL)
		
		XCTAssertEqual((40.dBSPL.dereferencedValue / 2).dBSPL, 33.98.dBSPL)
	}
	
	func testExamples2() {
		let Icar = 0.6.microwatts.perSquareMeter
		let I₀ = 1e-12.watts.perSquareMeter
		XCTAssertEqual(Icar.dB(reference: I₀), 57.7815.dB(reference: I₀))
		
		let Jcar = 0.6.microwatts
		let J₀ = 1e-12.watts
		XCTAssertEqual(Jcar.dB(reference: J₀), 57.7815.dB(reference: J₀))
		
		let Kcar = 0.6.microwatts.perSquareMeter
		XCTAssertEqual(Kcar.dB(reference: .dBSIL), 57.7815.dBSIL)
	}
	
	func testExamples3() {
		// P = I V, V = I / R -->  P = V² / R  &  V = √(R * P)
		let a = √(24.dBm * 600.ohms) → .volts
		XCTAssertEqual(a, 12.28.V)
		
		// dBV to Voltage
		let b = 24.dBV.dereferencedValue
		XCTAssertEqual(b, 15.85.V)
		
		// Gain
		XCTAssertEqual((70.V / 1.4.V).dB, 33.98.dB(reference: 1.4.V))
		XCTAssertEqual(1.V + 34.dBV, 50.12.V)
		XCTAssertEqual(1.4.V + 34.dBV, 70.17.V)
		
		// Voltage to dB
		XCTAssertEqual((1.4.V / 8.V).dB, -15.14.dB(reference: 8.V))
		XCTAssertEqual(34.dBV - 15.dBV, 19.dBV)
		XCTAssertEqual(8.V + (34.dBV - 15.dBV), 71.3.V)
		XCTAssertEqual((15.5.V / 7.75.V).dB, 6.021.dB(reference: 7.75.V))
		
		// Volts to dBu or dBV
		XCTAssertEqual(8.796.V.dBu, 21.10.dBu)
		
		// SPL Calculations
		// Note from physics: Sound pressure decreases linearly with distance
		XCTAssertEqual(120.dBSPL - (0.dBSPL * (60.feet / 1.meters)).dBSPL, 94.76.dBSPL)
		
		// Watts to dB SPL
		XCTAssertEqual((350.W / 100.W).dB, 5.441.dB(reference: 100.W))
		
		// dB SPL (not!) to Watts
		XCTAssertEqual(100.W + 8.dBW, 631.W)
	}
	
	func testExamples4() {
		XCTAssertEqual(4.77.dBW + 6.99.dBW, 11.76.dBW)
		XCTAssertEqual(4.77.dBW.ratio!, 2.9991625189876507)
		XCTAssertEqual(4.77.dBW.dereferencedValue, 2.999.W)
		XCTAssertEqual(6.99.dBW.dereferencedValue, 5.W)
		XCTAssertEqual(15.W.dBW, 11.76.dBW)
	}
	
	func testExamples5() {
		XCTAssertEqual((10.mW.dB(reference: 2.mW) + 10.mW.dB(reference: 2.mW)).dereferencedValue, 50.mW)
		XCTAssertEqual(10.dBm + 10.dBm, 20.dBm)
		XCTAssertEqual((10.dBm + 10.dBm).dereferencedValue, 100.mW)
		
		//___________________________________________________ all 5W
		XCTAssertEqual(36.99.dBm.dereferencedValue, 5.W)
		XCTAssertEqual(6.99.dBW.dereferencedValue, 5.W)
		XCTAssertEqual((-23.0).dBk.dereferencedValue, 5.012.W)
		
		XCTAssertEqual(50.W.dB(reference: 1.W), 16.99.dB(reference: 1.W))
		XCTAssertEqual(1.995e-13.mW.dBm, -127.dBm)
		
		XCTAssertEqual((10.watts - 0.7.dBW + 13.dBW - 137.dBW + 11.dBW - 1.4.dBW), 3.09e-8.mW)
		
		XCTAssertEqual((10.mW.dB(reference: 1.mW) + 10.mW.dB(reference: 2.mW)).dereferencedValue, 100.mW)
		
		XCTAssertEqual(90.dBm.dereferencedValue, 60.dBW.dereferencedValue)
		XCTAssertEqual(90.dBm, 60.dBW)
		XCTAssertEqual((-26).dBm.dereferencedValue, 2.512.microwatts)
	}
	
//	func testVectors() {
//		
//		// TODO: this == assertion should be true:
////		XCTAssertTrue([0, 1, 2, 3].dBm.dereferencedValues! == [1, 1.259, 1.585, 1.995].milliwatts)
//		
//		XCTAssertEqual([0, 1, 2, 3].dBm.dereferencedValues!, [1.0, 1.2589254117941673, 1.5848931924611136, 1.9952623149688797].milliwatts)
//		XCTAssertEqual([0, 1, 2, 3].dBm.dereferencedValues!.values!, [1.0, 1.2589254117941673, 1.5848931924611136, 1.9952623149688797])
//		Physical.Globals.shared.sigfigs = 16
//		let dbValues = [3, 4.7, 12.1]
////		print(2 * dbValues.dBSPL)
////		XCTAssertEqual(2 * dbValues.dBSPL, [9.021, 10.72, 18.12].dBSPL)
//		XCTAssertTrue(2 * dbValues.dBSPL == [9.020599913279625, 10.72059991327962, 18.12059991327962].dBSPL)
//	}
	
}
