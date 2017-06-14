# AC3.2-Closures-InDepth
---

### Objective

- To review what we already have covered on closures in swift
- To explore the "lifetime" of a closure in the context of a function
- Lastly, to look at `@escaping` closures and their common usages

### Readings

#### Further Readings:

#### Vocabulary

- `@escaping` closure

---

###1. Reviewing what we know

####Comparing Closures to Functions

Closures are simply blocks of code that we want to run at some point. In this regard, they are no different than functions. For example, say we wanted to create a function that is used to print out a greeting for a user. We may want to pass in the user's name as a `String` and expect to get back a formatted `String`. For that we could write something like: 

```swift 
// This closure's type is
// (String) -> String
func greet(name: String )-> String {
  return "Hello, \(name)!"
}
greet(name: "Louis") // returns "Hello, Louis!"
```

####Closures as variables

It's possible to execute the exact same code, in pretty much the same manner by writing it using a closure:

```swift
// This closure's type is
// (String) -> String
let greetClosure = { (name: String) -> String in
  return "Hello, \(name)!"
}
greetClosure("Louis") // returns "Hello, Louis!"
```

The syntax looks a bit different between the two, but functionally they are the same. 

You may be wondering why/how we assigned our closure's code to a variable. This is a language feature of Swift: functions are treated as *first class citizens*, which means that closures can be used in any way a primitive or `Foundation` type can be. One of those uses is assigning closures to variables to be used later in code. This is why we can store our block of code in a variable, and then run that code everytime we call `greetClosure`. 

But this isn't exclusive to closures, you can assign functions to variables as well:

```swift
let greetFunc = greet // remember, greet() is of type (String) -> String
greetFunc("Louis") // returns "Hello, Louis!"
```

It's worth repeatng, functions and closures are very similar!

>> Image

####Closures as function parameters

Another feature of first-class citizenship is being able to be passed to a function as a parameter. Closures can be passed to functions as parameters so long as they match the type the parameter is expecting. Let's say we have a couple of these `greet`-based functions and wanted a simple way to print them out. We could write a function that accepted the same type as the function (`(String) -> String`) and passed that along to a `print` statement:

```swift
func printGreetMessage(name: String, msg: (String) -> String) {
  let message = msg(name) // msg is a closure of type (String)->String, which is why we can pass it in the name parameter
  print(message)
}
printGreetMessage(name: "Louis", msg: greetClosure) // prints "Hello, Louis!"
```

Now, if we had other closures for other messages, we could re-use this function to print them out:

```
let newMailMessage = { (name: String) -> String in
  return "\(name), You have unread messages."
}
printGreetMessage(name: "Louis", msg: newMailMessage) // prints "Louis, You have unread messages"
```

####Closures as function return values

Closures can also be returned as values themselves:

```swift
// this returns a type (String)->String
func logoutMessage() -> (String)->String {
  return { (name: String) -> String in
    return "You have been logged out, \(name)"
  }
}
let logout: (String)->String = logoutMessage()
logout("Louis") // prints "You have been logged out, Louis"
```

In this example `logout` is a variable that contains a closure of type `(String)->String`. To actually run the code in the closure, we pass it the one `String` parameter it is expecting. This in turn gets treated as the `name: String` parameter in the closure and finally the formatted `String` gets returned. 

####Trailing Closures

There is a special syntax for functions where their last parameter is a closure, which is called *trailing closure syntax*. Looking back at the `printGreetMessage` function, we could rewrite a call to the function like so:

```swift
printGreetMessage(name: "Louis") { (str: String) -> String in
  return "Hey \(str)! You have new friend requests" // returns "Hey Louis! You have new friend requests"
}
```

This allows you to define your closure code inline, rather than passing it in as a variable. There are many reasons for using trailing closure syntax, and one very common situation that you'll see them are in making network requests.  

---

###2. Lifetime of a closure

You've probably already heard and experienced that a closure "captures" the environment in which it is defined; meaning that in the scope of the closure, variable state can be stored/updated long after the execution of a function would have terminated.



---
###3. Escaping Closures - What and When


---
###4. Exercises