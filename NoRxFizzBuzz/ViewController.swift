//
//  ViewController.swift
//  NoRxFizzBuzz
//
//  Created by 原野誉大 on 2018/03/21.
//  Copyright © 2018年 原野誉大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var fizz: UILabel!
    @IBOutlet weak var buzz: UILabel!
    @IBOutlet weak var fizzBuzz: UILabel!
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
    
    var time = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
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
        
        if time == 0{
            fizz.isHidden = true
            buzz.isHidden = true
            fizzBuzz.isHidden = true
        } else if time % 15 == 0 {
            fizz.isHidden = true
            buzz.isHidden = true
            fizzBuzz.isHidden = false
        } else if time % 3 == 0 {
            fizz.isHidden = false
            buzz.isHidden = true
            fizzBuzz.isHidden = true
        } else if time % 5 == 0 {
            fizz.isHidden = true
            buzz.isHidden = false
            fizzBuzz.isHidden = true
        } else {
            fizz.isHidden = true
            buzz.isHidden = true
            fizzBuzz.isHidden = true
        }
    }

}

