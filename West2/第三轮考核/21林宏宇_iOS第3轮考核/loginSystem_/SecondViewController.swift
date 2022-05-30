//
//  SecondViewController.swift
//  loginSystem_
//
//  Created by 林宏宇 on 2021/12/11.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
        name.text = names
        p1.layer.cornerRadius = p1.bounds.width*0.5
        p1.layer.masksToBounds = true
        p2.layer.cornerRadius = p2.bounds.width*0.5
        p2.layer.masksToBounds = true
        p3.layer.cornerRadius = p3.bounds.width*0.5
        p3.layer.masksToBounds = true
        p4.layer.cornerRadius = p4.bounds.width*0.5
        p4.layer.masksToBounds = true
        p5.layer.cornerRadius = p5.bounds.width*0.5
        p5.layer.masksToBounds = true
    }
 

    @IBAction func change(_ sender: Any) {
        p2.alpha = 1
        p3.alpha = 1
        p4.alpha = 1
        p5.alpha = 1
    }
    @IBAction func exchange1(_ sender: Any) {
        p6.image = p1.image
        p1.image = p2.image
        p2.image = p6.image
        messageLabel.text = "12345"
        name.text = "Captain"
    }
    
    @IBAction func exchange2(_ sender: Any) {
        p6.image = p1.image
        p1.image = p3.image
        p3.image = p6.image
        messageLabel.text = "123456789"
        name.text = "Sailor"
    }
    
    
    @IBAction func exchange3(_ sender: Any) {
        p6.image = p1.image
        p1.image = p4.image
        p4.image = p6.image
        messageLabel.text = "123456"
        name.text = "King"
    }
    
    @IBAction func exchange4(_ sender: Any) {
        p6.image = p1.image
        p1.image = p5.image
        p5.image = p6.image
        messageLabel.text = "1234567"
        name.text = "Chef"
    }
    
    
    
    
    
    @IBOutlet weak var p1: UIImageView!
    
    @IBOutlet weak var p2: UIImageView!
    
    @IBOutlet weak var p3: UIImageView!
    
    @IBOutlet weak var p4: UIImageView!
    
    @IBOutlet weak var p5: UIImageView!
    
    
    @IBOutlet weak var p6: UIImageView!
    var message : String?
    var names : String?
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBOutlet weak var messageLabel:UILabel!
    @IBOutlet weak var name: UILabel!
    

}
