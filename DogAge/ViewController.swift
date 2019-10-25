//
//  ViewController.swift
//  DogAge
//
//  Created by Sailesh Kasaju on 10/4/19.
//  Copyright © 2019 Sailesh Kasaju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var dogAgeTextField: UITextField!
  
  @IBOutlet weak var humanAgeLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  @IBAction func calculateButtonPressed(_ sender: UIButton) {
    if dogAgeTextField.text != "" {
      let dogAge = Int(dogAgeTextField.text!)
      humanAgeLabel.text = "In human years: \(calculateHumanAgeForSmallDog(dogAge: dogAge!)) years"
    } else {
      humanAgeLabel.text = "Please input dog age!"
    }
  }
  
  func calculateHumanAgeForSmallDog(dogAge: Int) -> Int {
    var humanAge = 0
    if dogAge == 0 {
      return humanAge
    }
    if dogAge == 1 {
      humanAge = 15
    } else if dogAge == 2 {
      humanAge = 24
    } else {
      humanAge = ((dogAge - 2) * 4) + 24
    }
    return humanAge
  }
  
  func calculateHumanAgeForMediumDog(dogAge: Int) -> Int {
    var humanAge: Int
    if dogAge <= 5 {
      humanAge = calculateHumanAgeForSmallDog(dogAge: dogAge)
    } else if dogAge == 6 {
      humanAge = 42
    } else {
      humanAge = Int(((Double(dogAge) - 6.0) * 4.5) + 42.0)
      if !dogAge.isMultiple(of: 2) {
        humanAge += 1
      }
    }
    return humanAge
  }
  
  func calculateHumanAgeForLargeDog(dogAge: Int) -> Int {
    var humanAge: Int
    let humanAgeMapper = [45, 50, 55, 61, 66, 72, 77, 82, 88, 93, 120]
    if dogAge <= 5 {
      humanAge = calculateHumanAgeForSmallDog(dogAge: dogAge)
    } else if dogAge <= 16 {
      humanAge = humanAgeMapper[dogAge - 5]
    } else {
      humanAge = 999
    }
    return humanAge
  }
    
}

