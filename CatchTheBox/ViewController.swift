//
//  ViewController.swift
//  CatchTheBox
//
//  Created by Yapindo on 22/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var scoreNow = 0
    var randNumber = 1
    var timer = Timer()
    var TimerCount: Int!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var HighscoreLabel: UILabel!
    
    var count: Int!
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
        super.viewDidLoad()
        let position = [a,b,c,d,e,f,g,h,i]
        
        for item in position {
            addGesture(item: item!)
            if item != e {
                item?.isHidden = true
            }
        }
        
        
    }


    @IBAction func randNow(_ sender: Any) {
//        randBoxPosition()
        if TimerCount == 0 || TimerCount == nil {
            scoreNow = 0
            ScoreLabel.text = String(scoreNow)
            TimerCount = 10
            count = TimerCount * 2
            timer = Timer.scheduledTimer(timeInterval:  0.5, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func countScore() {
        if TimerCount != 0 {
            scoreNow += 1
            ScoreLabel.text = String(scoreNow)
        }
    }
    
    @objc func timerFunction() {
        if TimerCount == 0 {
            timer.invalidate()
        }
        
        if let Highscore = UserDefaults.standard.object(forKey: "highScore") {
            let score = Highscore as! Int
            if  score < scoreNow {
                UserDefaults.standard.set(scoreNow, forKey: "highScore")
            }
            
            HighscoreLabel.text = "Highscore : \(Highscore)"
        } else {
            UserDefaults.standard.set(0, forKey: "highScore")
        }
        
        randBoxPosition()
        visibilityBox(indexPath: randNumber)
        
        timerLabel.text = "\(String(TimerCount))s"
//        print(randNumber)
        
        if delay == false {
            TimerCount -= 1
        }
        
        if count % 2 == 0 {
            delay = false
        } else {
            delay = true
        }
        count -= 1
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
    
    func addGesture(item: UIView) {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(countScore))
        item.isUserInteractionEnabled = true
        item.addGestureRecognizer(gestureRecognizer)
    }
}

