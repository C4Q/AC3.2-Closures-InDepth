import XCTest

//
// Code described in detail here: http://initwithstyle.net/2015/11/tdd-in-swift-playgrounds/
//

public class ClosureTests: XCTestCase {
  let observer = PlaygroundTestObserver()
  let center = XCTestObservationCenter.shared()
  let exerciser = ClosureExercise()
  
  public override func setUp() {
    center.addTestObserver(observer)
  }
  
  func testApplyKTimes() {
    
    var testValue = 0
    func incrementValue() {
      testValue = testValue + 10
    }
    let expectedResult = 30
    exerciser.applyKTimes(K: 3, closure: incrementValue)
    
    XCTAssertEqual(expectedResult, testValue, "applyKTimes should run K times")
  }
  
  func testMultiplesOfThree() {
    
    let testArray = [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 18, 24]
    let expectedResult =  [3, 6, 9, 12, 18, 24]
    let actualResult = exerciser.multiplesOfThree(numbers: testArray)
    
    XCTAssertEqual(expectedResult, actualResult, "Array should only have multiples of three")
  }
  
  func testFindMax() {
    let testArray = [102, 31, -3, 989, 23, 2, 0, 1, 2]
    let expectedResult = 989
    let actualResult = exerciser.findMax(numbers: testArray)
    
    XCTAssertEqual(expectedResult, actualResult, "findMax should find the largest Int value in an array")
  }
  
  func testJoinWords() {
    let testArray = ["Coding", "In", "Swift", "Is", "Great!"]
    let expectedResult = "Coding In Swift Is Great!"
    let actualResult = exerciser.joinWords(words: testArray)
    
    XCTAssertEqual(expectedResult, actualResult, "joinWords should concat words with a space inbetween them and have no" +
                                            "trailing or leading whitespace")
  }
  
  func testSortedDivisors() {
    let testArray = [1, 2, 3, 4, 5, 6, 11, 12, 24]
    let expectedResult = [1, 2, 3, 5, 11, 4, 6, 12, 24]
    let actual = exerciser.sortedDivisors(numbers: testArray)
    
    XCTAssertEqual(expectedResult, actual, "sortedDivisors should be sorted in ascending order based on their number of divisors")
  }

  func testChainedOddSum() {
    let testArray = [1, 2, 3, 4, 5, 6, 11, 12, 24] // 1, 3, 5, 11 -> 1, 9, 25, 121 -> 156
    let expectedResult = 156
    let actualResult = exerciser.chainedOddSum(numbers: testArray)
    
    XCTAssertEqual(actualResult, expectedResult, "chainedOddSum should filter out odd numbers, square them, and then sum.")
  }
  
  func testForEachValue() {
    let testArray = [1, 2, 3, 4, 5, 6]
    let testClosure = { (num: Int) in return num * num }
    let expectedResult = [1, 4, 9, 16, 25, 36]
    let actualResult = exerciser.forEachValue(numbers: testArray, closure: testClosure)
    
    XCTAssertEqual(expectedResult, actualResult, "The closure should be applied to each element in the numbers array")
  }
  
  func testCombinedArrays() {
    let testArrayA =  [1, 2, 3, 4, 5, 6]
    let testArrayB =  [1, 1, 2, 3, 5, 8]
    let testClosure = { (a: Int, b: Int) in return a + b }
    let expectedResult = [2, 3, 5, 7, 10, 14]
    let actualResult = exerciser.combineArrays(a: testArrayA, b: testArrayB, closure: testClosure)
    
    XCTAssertEqual(expectedResult, actualResult, "The closure should be performed on both arrays to their respective elements")
  }
}


// --- Required --- //
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
