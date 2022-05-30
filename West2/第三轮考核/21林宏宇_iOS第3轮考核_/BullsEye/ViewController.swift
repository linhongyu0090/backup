//
//  ViewController.swift
//  21林宏宇_iOS第3轮考核
//
//  Created by 林宏宇 on 2021/12/9.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    var currentValue:Int = 0
    var targetValue :Int = 0
    var score : Int = 0
    var round : Int = 0
    @IBOutlet weak var slider :UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    @IBAction func startOver(){
        startNewGame()
        updateLabels()
        
//        let transition = CATransition()
//                transition.type = CATransitionType
//                transition.duration = 1
//                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//                view.layer.add(transition, forKey: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewGame()
        updateLabels()
    }
    
    @IBAction func showAlert() {
        var difference :Int
        let title:String
        round += 1
        if currentValue > targetValue{
            difference = currentValue - targetValue
        } else if currentValue < targetValue{
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        var points = 100 - difference
        if difference == 0 {
            title = "Perfect"
            points += 100
        }else if difference < 5{
            title = "You almost had it!"
            points += 50
        }else if difference < 10{
            title = "Pretty good!"
        }else{
            title = "Not even close…"
        }
        score += points
        let message = "Your scored \(points) points\n"+"The value of the slider is:  \(currentValue) \n" + "The traget value is \(targetValue)\n" + "The difference is: \(difference)"
//        let message = "The value of the slider is:  \(currentValue) \n" + "The traget value is \(targetValue)\n" + "The difference is: \(difference)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
            self.updateLabels()
        })
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
//        startNewRound()
//        updateLabels()
}
    @IBAction func sliderMoved(_ slider: UISlider) {
//            print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
        }
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        }

}
