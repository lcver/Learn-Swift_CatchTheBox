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
    var delay = true
    @IBOutlet weak var a: UIView!
    @IBOutlet weak var b: UIView!
    @IBOutlet weak var c: UIView!
    @IBOutlet weak var d: UIView!
    @IBOutlet weak var e: UIView!
    @IBOutlet weak var f: UIView!
    @IBOutlet weak var g: UIView!
    @IBOutlet weak var h: UIView!
    @IBOutlet weak var i: UIView!
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        let position = [a,b,c,d,e,f,g,h,i]
        
        for item in position {
            if item != e {
                item?.isHidden = true
            }
        }
        super.viewDidLoad()
    }


    @IBAction func randNow(_ sender: Any) {
//        randBoxPosition()
        count = 10
        timer = Timer.scheduledTimer(timeInterval:  0.5, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunction() {
        if count == 0 {
            timer.invalidate()
        }
        
        randBoxPosition()
        visibilityBox(indexPath: randNumber)
        
        timerLabel.text = "\(count)s"
        print(randNumber)
        
        if delay == false {
            count -= 1
        }
        
        if count % 2 == 0 {
            delay = false
        } else {
            delay = true
        }
    }
    
    func visibilityBox(indexPath: Int) {
        let position = [a,b,c,d,e,f,g,h,i]
        
        for item in position {
            item?.isHidden = true
        }
        position[indexPath]?.isHidden = false
    }
    
    func randBoxPosition() {
        var num = Int.random(in: 0...8)
        if randNumber == num {
            num = Int.random(in: 0...8)
        }
        randNumber = num
    }
}

