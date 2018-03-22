//
//  ViewController.swift
//  NoRxFizzBuzz
//
//  Created by 原野誉大 on 2018/03/21.
//  Copyright © 2018年 原野誉大. All rights reserved.
//

import UIKit

enum Type: String {
    case Fizz = "Fizz"
    case Buzz = "Buzz"
    case FizzBuzz = "FizzBuzz"
    case Other = "Other"
    static func ==(lhs: Type, rhs: Type) -> Bool {
        switch (lhs, rhs) {
        case (.Fizz, .Fizz), (.Buzz, .Buzz), (.FizzBuzz, .FizzBuzz), (.Other, .Other):
            return true
        default:
            return false
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var fizz: UILabel!
    @IBOutlet weak var buzz: UILabel!
    @IBOutlet weak var fizzBuzz: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    @IBAction func plus1(_ sender: Any) {
        time += 1
        updateUI()
    }
    @IBAction func plus5(_ sender: Any) {
        time += 5
        updateUI()
    }
    @IBAction func minus1(_ sender: Any) {
        time -= 1
        updateUI()
    }
    @IBAction func minus5(_ sender: Any) {
        time -= 5
        updateUI()
    }
    @IBAction func fizzButton(_ sender: Any) {
        userInput = Type.Fizz.rawValue
    }
    @IBAction func buzzButton(_ sender: Any) {
        userInput = Type.Buzz.rawValue
    }
    @IBAction func fizzbuzzButton(_ sender: Any) {
        userInput = Type.FizzBuzz.rawValue
    }
    
    var time = 0
    var userInput = ""
    var point = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = ""
        updateUI()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
            self?.time += 1
            self?.updateUI()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        number.text = String(time)
        
        var result = false
        
        if time == 0{
            fizz.isHidden = true
            buzz.isHidden = true
            fizzBuzz.isHidden = true
        } else if time % 15 == 0 {
            fizz.isHidden = true
            buzz.isHidden = true
            fizzBuzz.isHidden = false
            if userInput == Type.FizzBuzz.rawValue {
                result = true
            }
        } else if time % 3 == 0 {
            fizz.isHidden = false
            buzz.isHidden = true
            fizzBuzz.isHidden = true
            if userInput == Type.Fizz.rawValue {
                result = true
            }
        } else if time % 5 == 0 {
            fizz.isHidden = true
            buzz.isHidden = false
            fizzBuzz.isHidden = true
            if userInput == Type.Buzz.rawValue {
                result = true
            }
        } else {
            fizz.isHidden = true
            buzz.isHidden = true
            fizzBuzz.isHidden = true
            if userInput == Type.Other.rawValue {
                result = true
            }
        }
        
        if result {
            self.result.text = "Correct"
            self.result.textColor = UIColor.red
            self.point += 1
        } else {
            self.result.text = "Wrong"
            self.result.textColor = UIColor.blue
            self.point -= 1
        }
        
        pointLabel.text = String(point)
        answer.text = userInput
        userInput = Type.Other.rawValue
    }
    
}

