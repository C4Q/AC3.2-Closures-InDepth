import XCTest

//
// Code described in detail here: http://initwithstyle.net/2015/11/tdd-in-swift-playgrounds/
//

public class ClosureTests: XCTestCase {
  let observer = PlaygroundTestObserver()
  let center = XCTestObservationCenter.shared()
  
  public override func setUp() {
    center.addTestObserver(observer)
  }
  
  func testShouldFail() {
    XCTFail("You must fail to succeed")
  }
  
  func testShouldPass() {
    XCTAssert(true)
  }
}




class PlaygroundTestObserver: NSObject, XCTestObservation {
  @objc private func testCase(testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
     print("Test failed on line \(lineNumber): \(String(describing: testCase.name)), \(description)")
  }
}



public struct TestRunner {
  public init () {}
  
  public func runTests(testClass: AnyClass) {
    print("\n\n...Running test suite: \(testClass)...\n\n")
    
    let tests = testClass as! XCTestCase.Type
    let testSuite = tests.defaultTestSuite()
    testSuite.run()
    
    let run = testSuite.testRun as! XCTestSuiteRun
    print("\n\nRan \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures\n-----------------------------------------------------------------------------\n")
  }
}
