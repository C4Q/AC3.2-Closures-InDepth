import Foundation

public class ClosureExercise {
  public init() {}
  
  /*
   1. Write a function named `applyKTimes` that takes an integer `K` and a `closure`
   and calls the closure `K` times. The closure will not take any parameters and
   will not have a return value.
   */
  public func applyKTimes(K: Int, closure: ()->()) {
    for _ in 0..<K {
      closure()
    }
  }
  
  /*
   2. Write a function named `multipleOfThree` that takes a param called `numbers` of type [Int]
   and uses filter to create an array called multiples that contains all the multiples of 3 
   from the array and then returns that array.
 */
  public func multiplesOfThree(numbers: [Int]) -> [Int] {
    return numbers.filter{ $0 % 3 == 0 && $0 != 0 }
  }
  
  
  /*
   3. Write a func called `findMax` that takes a param `numbers` of type [Int] and returns the 
   largest value in the array. Use reduce to solve this exercise.
  */
  public func findMax(numbers: [Int]) -> Int {
    return numbers.reduce(0) { return max($0, $1) }
  }
  
  /*
   4. Write a func called `joinWords` that takes a param `words` of type [String] and returns the
   concatenation of its elements with a space inbetween each word. Use reduce to solve this problem.
  */
  public func joinWords(words: [String]) -> String {
    return words.reduce("") {
      if $0 == "" {
        return $1
      } else {
        return $0 + " " + $1
      }
    }
  }
  
  /*
   5. Write a function called sortedDivisors that Sort numbers in ascending order by the number of 
   divisors. If two numbers have the same number of divisors the order in which they appear in the 
   sorted array does not matter.
  */
  public func sortedDivisors(numbers: [Int]) -> [Int] {
    func numberOfDivisors(a: Int) -> Int {
      var count = 0
      for i in 1...a {
        if a % i == 0 {
          count = count + 1
        }
      }
      return count
    }
    
    return numbers.sorted(by: { (a: Int, b: Int) -> Bool in
      return numberOfDivisors(a: a) < numberOfDivisors(a: b)
    })
  }
  
  /*
   6. Write a function called `chainedOddSum` that takes a param of `numbers` of type [Int] and returns Int. The function
   should find the sum of the squares of all the odd numbers from `numbers`. Use map, filter and reduce to solve this problem.
 */
  public func chainedOddSum(numbers: [Int]) -> Int {
    return numbers
      .filter{ $0 % 2 == 1 }
      .map{ $0 * $0 }
      .reduce(0, +)
  }
  
  /*
   7. Write a function called `forEachValue` that takes in two parameters: `numbers: [Int]` and a `closure` of type `(Int)->(Int)`.
   The closure should be called for each number in `numbers`. Return the array after it has been iterated over.
   */
  public func forEachValue(numbers: [Int], closure: (Int)->(Int)) -> [Int] {
    return numbers.map{ closure($0) }
  }
  
  /*
   8. Implement a function named `combineArrays` that takes 2 arrays (`a: [Int], b: [Int]`) and a closure that combines
   2 Ints into a single Int. The function combines the two arrays into a single array using the provided closure. Return
   the combined [Int] array.
   
   Assume that the 2 arrays have equal length.
   */
  public func combineArrays(a: [Int], b: [Int], closure: (Int, Int)->Int) -> [Int] {
    var returnArray: [Int] = []
    for i in 0..<a.count {
      returnArray.append(closure(a[i], b[i]))
    }
    
    return returnArray
  }
  
  
}
