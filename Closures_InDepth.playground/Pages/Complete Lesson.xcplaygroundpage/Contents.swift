import Foundation
import UIKit

// this function's type is
// (String) -> String
func greet(name: String )-> String {
  return "Hello, \(name)!"
}
greet(name: "Louis")

let greetFunc = greet
greetFunc("Louis")

// This closure's type is
// (String) -> String
let greetClosure = { (name: String) -> String in
  return "Hello, \(name)!"
}
greetClosure("Louis")





func printGreetMessage(name: String, msg: (String) -> String) {
  let message = msg(name)
  print(message)
}
printGreetMessage(name: "Louis", msg: greetClosure)

let newMailMessage = { (name: String) -> String in
  return "\(name), You have unread messages."
}
printGreetMessage(name: "Louis", msg: newMailMessage)




// this returns a type (String)->String
func logoutMessage() -> (String)->String {
  return { (name: String) -> String in
    return "You have been logged out, \(name)"
  }
}
let logout: (String)->String = logoutMessage()
logout("Louis") // prints "You have been logged out, Louis"





printGreetMessage(name: "Louis", msg: newMailMessage)
//
// -- or --
//
printGreetMessage(name: "Louis") { (str: String) -> String in
  return "Hey \(str)! You have new friend requests"
}




func sayHelloNow(name: String) -> String {
  let messagePrefix = "Hey, its been awhile"
  let helloMessage = messagePrefix + " \(name)"
  
  return helloMessage
}
print(sayHelloNow(name: "Louis"))

func sayHelloEventually(name: String) -> ()->String {
  let messagePrefix = "Hey, its been awhile"
  
  let sayHello = {
    return messagePrefix + " \(name)"
  }
  
  print("Returning Hello")
  return sayHello
}

let pendingMessage = sayHelloEventually(name: "Louis")
print(pendingMessage())
