//
//  ViewController.swift
//  AC3.2-Closures-InDepth
//
//  Created by Louis Tur on 6/14/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
//    print(self.longRunningTask())
//    print("Done, ", self.longAdditionTask())
    
    self.longAdditionTask { (result: Int) in
      print("Done, ", result)
    }
    self.view.backgroundColor = .red
  }

  func longRunningTask() -> String {
    
    DispatchQueue.global().async {
      for i in 0...250000{
        print("Count: \(i)")
      }
    }
    
    return "ALL DONE!"
  }
  
  func longAdditionTask() -> Int {
    print("Starting Addition")
    var result = 0
    
    DispatchQueue.global().async {
      result = Array(0...10000000).reduce(0, +)
    }
    
    return result
  }
  
  // 1.
  func longAdditionTask(callback: @escaping (Int)->Void) {
    print("Starting Addition")
    var result = 0
    
    DispatchQueue.global().async {
      result = Array(0...10000000).reduce(0, +)
      
      // 2.
      callback(result)
    }
  }
  
}

