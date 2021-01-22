//
//  ViewController.swift
//  CatchTheBox
//
//  Created by Yapindo on 22/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 10
    var randNumber = 1
    var timer = Timer()
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func randNow(_ sender: Any) {
//        randBoxPosition()
        count = 10
        timer = Timer.scheduledTimer(timeInterval:  1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction() {
        if count == 0 {
            timer.invalidate()
        }
        randBoxPosition()
        timerLabel.text = "\(count)s"
        print(randNumber)
        count -= 1
    }
    
    func randBoxPosition() {
        var num = Int.random(in: 1...9)
        if randNumber == num {
            num = Int.random(in: 1...9)
        }
        randNumber = num
    }
}

