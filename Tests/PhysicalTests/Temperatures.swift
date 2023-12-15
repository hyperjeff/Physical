import Physical
import XCTest

final class Temperatures: XCTestCase {
	
    override func setUpWithError() throws {
		Physical.Globals.shared.sigfigs = 4
    }
	
    override func tearDownWithError() throws { }
	
	func testNormalConversions() {
		XCTAssertEqual(2.kelvin → .celsius, -271.2.celsius)
		XCTAssertEqual(2.kelvin → .fahrenheit, -456.1.fahrenheit)
		XCTAssertEqual(-456.07.fahrenheit → .kelvin, 2.kelvin)
		XCTAssertEqual(-456.07.fahrenheit → .celsius, -271.2.celsius)
		XCTAssertEqual(0.rankine → .kelvin, 0.kelvin)
		XCTAssertEqual(1000.rankine → .kelvin, 555.6.kelvin)
		XCTAssertEqual(1000.rankine → .fahrenheit, 540.3.fahrenheit)
	}
	
	func testComparisons() {
		XCTAssertLessThan(30.fahrenheit, 30.celsius)
		XCTAssertGreaterThan(100.kelvin, 100.rankine)
		XCTAssertLessThan(100.kelvin, 30.fahrenheit)
		XCTAssertGreaterThan(100.kelvin, 30.fahrenheit.difference)
		XCTAssertLessThan(1.celsius, 50.fahrenheit.difference)
		XCTAssertLessThan(50.fahrenheit.difference, 30.celsius)
		XCTAssertLessThan(50.fahrenheit.difference, 30.celsius.difference)
		XCTAssertGreaterThan(50.fahrenheit, 5.celsius.difference)
		
		// that's all and well, but let's make sure < and > express those notions correctly:
		
		XCTAssertTrue(30.fahrenheit < 30.celsius)
		XCTAssertFalse(30.fahrenheit > 30.celsius)
		XCTAssertFalse(100.kelvin < 100.rankine)
		XCTAssertTrue(100.kelvin < 30.fahrenheit)
		XCTAssertFalse(100.kelvin < 30.fahrenheit.difference)
		XCTAssertTrue(1.celsius < 50.fahrenheit.difference)
		XCTAssertTrue(50.fahrenheit.difference < 30.celsius)
		XCTAssertTrue(50.fahrenheit.difference < 30.celsius.difference)
		XCTAssertFalse(50.fahrenheit < 5.celsius.difference)
	}
	
	func testFromCelsius() {
		let start = 30.celsius
		let end = 27.2.celsius
		let a = start - end
		
		XCTAssertEqual(a → .fahrenheit, 5.04.fahrenheit.difference)
		XCTAssertEqual(a → .rankine, 5.04.rankine.difference)
		XCTAssertEqual(a → .celsius, 2.8.celsius.difference)
		XCTAssertEqual(a → .kelvin, 2.8.kelvin.difference)
    }
	
	func testFromFahrenheit() {
		let b₁ = 89.0001.fahrenheit
		let b₂ = 80.0001.fahrenheit
		let b₀ = b₁ - b₂
		
		XCTAssertEqual(b₀ → .celsius, 5.celsius.difference)
		XCTAssertEqual(b₀ → .kelvin, 5.kelvin.difference)
	}
	
	func testFromKelvin() {
		let b₁ = 89.0001.fahrenheit
		let b₂ = 80.0001.fahrenheit
		let b₁K = b₁ → .kelvin
		let b₂K = b₂ → .kelvin
		let bk = (b₁K - b₂K)
		
		XCTAssertEqual(b₁K → .celsius, 31.67.celsius)
		XCTAssertEqual(bk → .celsius, 5.celsius.difference)
		XCTAssertEqual(bk → .fahrenheit, 9.fahrenheit.difference)
		
		XCTAssertEqual(bk → .rankine, 9.rankine) // ← should fail!!!
	}
	
	func testAddingIncrements() {
		let δtemp = 9.rankine.difference
		
		XCTAssertEqual(26.celsius + δtemp, 31.celsius)
		XCTAssertEqual(26.celsius - δtemp, 21.celsius)
		
		let δtest = 10.celsius.difference
		
		XCTAssertEqual(δtemp + δtemp, δtest)
		
		let δother = 6.fahrenheit.difference
		
		XCTAssertEqual(δtemp + δother, 8.333.kelvin.difference)
	}
	
	func testAddition() {
		XCTAssertTrue((30.fahrenheit - 30.celsius).isNotAThing)
		XCTAssertTrue((30.fahrenheit + 30.celsius).isNotAThing)
		
		XCTAssertEqual(50.fahrenheit + 30.celsius.difference, 104.fahrenheit)
		XCTAssertEqual(30.celsius.difference, 30.celsius.difference)
		XCTAssertEqual(30.celsius.difference → .fahrenheit, 54.fahrenheit.difference)
		XCTAssertEqual(50.fahrenheit + (30.celsius.difference → .fahrenheit), 104.fahrenheit)
		XCTAssertEqual(50.fahrenheit → .celsius, 10.celsius)
		XCTAssertEqual(50.fahrenheit → .kelvin, 283.2.K)
		XCTAssertEqual((50.fahrenheit → .kelvin) + 30.celsius.difference, 313.2.K)
		XCTAssertEqual(((50.fahrenheit → .kelvin) + 30.celsius.difference) → .kelvin, 313.2.K)
		
		XCTAssertEqual(50.fahrenheit.difference + 30.celsius.difference, 57.78.K.difference)
		XCTAssertEqual(50.fahrenheit + 30.celsius.difference, 104.fahrenheit)
		XCTAssertEqual((50.fahrenheit + 30.celsius.difference).difference, 104.fahrenheit.difference)
		XCTAssertEqual((50.fahrenheit + 30.celsius.difference).difference → .kelvin, 57.78.K.difference)
		XCTAssertEqual((50.fahrenheit + 30.celsius.difference).difference → .celsius, 57.78.celsius.difference)
	}
	
	func testMultiplication() {
		XCTAssertTrue((4 * 500.fahrenheit).isNotAThing)
		XCTAssertTrue((500.celsius ^ 4).isNotAThing)
		
		XCTAssertEqual(4 * 500.rankine, 2_000.rankine)
		XCTAssertEqual(500.kelvin ^ 4, 6.25e10.K⁴)
		
		XCTAssertEqual(500.kelvin / 4, 125.K)
		XCTAssertTrue((500.celsius / 4).isNotAThing)
	}
	
	func testMultiplyIncrements() {
		let δtemp = 9.rankine.difference
		
		XCTAssertEqual(2 * δtemp, 10.celsius.difference)
	}
	
	func testVectorSupport() {
		let c = [68.12, 72.22, 120.5].celsius
		let d = [30.31, 71.81, 90.33].celsius
		
		let cd = c - d
		
		XCTAssertEqual(cd, [37.81, 0.41, 30.17].celsius.difference)
		XCTAssertEqual(cd → .fahrenheit, [68.06, 0.738, 54.31].fahrenheit.difference)
		XCTAssertEqual(cd → .rankine, [68.06, 0.738, 54.31].rankine.difference)
		XCTAssertEqual(cd → .celsius, [37.81, 0.41, 30.17].celsius.difference)
		XCTAssertEqual(cd → .kelvin, [37.81, 0.41, 30.17].kelvin.difference)
	}
	
	func testNegativeCases() {
		let C = 41.celsius
		let R = 41.rankine
		let F = 41.fahrenheit
		let K = 41.kelvin
		
		let δT = 9.rankine.difference
		
		// n T = .nAT when T not °K, °R, ΔT -- n Double
		XCTAssert((3 * K).isAThing)
		XCTAssert((3 * R).isAThing)
		XCTAssert((3 * C).isNotAThing)
		XCTAssert((3 * F).isNotAThing)
		XCTAssert((3 * δT).isAThing)
		
		// n T = .nAT when T not °K, °R, ΔT -- n Physical
		// Discussion: Well... if n's not a constant, what's the harm?
//		XCTAssert(false)
		
		// T₁ + T₂ = .nAT if mixed specific units
		XCTAssert((C + R).isNotAThing)
		XCTAssert((C + F).isNotAThing)
		XCTAssert((C + K).isNotAThing)
		XCTAssert((R + F).isNotAThing)
		XCTAssert((R + K).isNotAThing)
		XCTAssert((F + K).isNotAThing)
		
		// T₁ + T₂ = .nAT when T not °K, °R, ΔT
		XCTAssert((R + R).isAThing)
		XCTAssert((K + K).isAThing)
		XCTAssert((C + C).isNotAThing)
		XCTAssert((F + F).isNotAThing)
		
		// T₁ ≠ T₂ when comparing diffs & non-diffs
		XCTAssertNotEqual(δT, 9.rankine)
	}
	
}
