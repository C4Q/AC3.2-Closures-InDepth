### Closure Exercises

> Note that these exercises are based on those found at the bottom of [this link](https://www.weheartswift.com/closures/). They are being added here for tracking purposes and in case the source link changes. 

---

### 9.1 K Times

Write a function named `applyKTimes` that takes an integer `K` and a `closure` and calls the closure `K` times. The closure will not take any parameters and will not have a return value.

**Solution**
```swift
func applyKTimes(_ K: Int, _ closure: () -> ()) {
    for _ in 1...K {
        closure()
    }
}
```

### 9.2 Div3

Use filter to create an array called multiples that contains all the multiples of 3 from numbers and then print it.

**Solution**
```swift
let numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]

// your code here
let numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]

let multiples = numbers.filter { $0 % 3 == 0 }

print(multiples)
```


### 9.3 Max

Find the largest number from numbers and then print it. Use reduce to solve this exercise.

**Solution**
```swift
let numbers = [4, 7, 1, 9, 6, 5, 6, 9]

let max = numbers.reduce(numbers[0]) {
    if $0 > $1 {
        return $0
    } else {
        return $1
    }
}

print(max) // 9
```

### 9.4 Join

Join all the strings from strings into one using reduce. Add spaces in between strings. Print your result.

**Solution**
```swift
let strings = ["We", "Heart", "Swift"]

let string = strings.reduce("") {
    if $0 == "" {
        return $1
    } else {
        return $0 + " " + $1
    }
}

print(string)
```

### 9.5 Sorting

Sort numbers in ascending order by the number of divisors. If two numbers have the same number of divisors the order in which they appear in the sorted array does not matter.

**Solution**
```swift
var numbers = [1, 2, 3, 4, 5, 6]

numbers.sort(by: { x, y in
    func countDivisors(_ number: Int) -> Int {
        var count = 0
        for i in 1...number {
            if number % i == 0 {
                count += 1
            }
        }
        return count
    }
    return countDivisors(x) < countDivisors(y)
})
```

### 9.6 Chains

Find the sum of the squares of all the odd numbers from numbers and then print it. Use map, filter and reduce to solve this problem.

**Solution**
```swift
var numbers = [1, 2, 3, 4, 5, 6]

let sum = numbers.filter {
        $0 % 2 == 1 //select all the odd numbers
    }.map {
        $0 * $0 // square them
    }.reduce(0, +) // get their sum

print(sum)
```

### 9.7 For each

Implement a function forEach(array: [Int], _ closure: Int -> ()) that takes an array of integers and a closure and runs the closure for each element of the array.

**Solution**
```swift
func forEach(_ array: [Int], _ closure: (Int) -> ()) {
    for number in array {
        closure(number)
    }
}
```

### 9.8 Combine arrays

Implement a function combineArrays that takes 2 arrays and a closure that combines 2 Ints into a single Int. The function combines the two arrays into a single array using the provided closure.
Assume that the 2 arrays have equal length.

**Solution**
```swift
func combineArrays(_ array1: [Int], 
                   _ array2: [Int], 
                   _ closure: (Int,Int) -> Int) -> [Int] {
    var result: [Int] = []
    for i in 0..<array1.count {
        result.append(closure(array1[i],array2[i]))
    }
    return result
}
```