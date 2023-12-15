import Physical
import XCTest

final class Arrays: XCTestCase {

    func testAverages() {
		Physical.Globals.shared.sigfigs = 3
		
		XCTAssert([].average().isNotAThing)// a bit odd, )
		XCTAssert([1.1.meters, 2.joules, 5.6.meters].average().isNotAThing)
		XCTAssert([2.joules, 1.1.meters, 5.6.meters].average().isNotAThing)
		
		XCTAssertEqual([1.1.meters].average(), 1.1.m)
		XCTAssertEqual([1.1.meters, 5.6.meters].average(), 3.35.m)
		XCTAssertEqual([1.1.meters, 5.6.meters, 12.meters].average(), 6.23.m)
		XCTAssertEqual([20.celsius, 25.celsius, 30.celsius, 50.fahrenheit].average() → .celsius, 21.3.celsius)
    }

}
