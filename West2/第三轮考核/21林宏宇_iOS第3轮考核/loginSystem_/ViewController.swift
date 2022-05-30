//
//  ViewController.swift
//  loginSystem_
//
//  Created by 林宏宇 on 2021/12/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x:100,y:200,width:200,height:30))
        label.text = "LoginSystem"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.red
        label.shadowColor = UIColor.blue
        label.shadowOffset = CGSize(width: 2, height: 2)
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
         
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          

            if segue.identifier == "nextPage" {

                let secondVC = segue.destination as! SecondViewController
 
                secondVC.message = inputTextField.text
                secondVC.names = selectname(inputTextField.text)
            }
        }

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        imageView.center = CGPoint(x:imageView.center.x + translation.x,y:imageView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    
    @IBAction func onLogin(_ sender: Any) {
        if self.inputTextField.text! == "12345" && self.passWord.text! == "12345"
        || self.inputTextField.text! == "123456789" && self.passWord.text! == "123456789"
        || self.inputTextField.text! == "123" && self.passWord.text! == "123" || self.inputTextField.text! == "123456" && self.passWord.text! == "123456" || self.inputTextField.text! == "1234567" && self.passWord.text! == "1234567"{
        }else {
            print("user or password is not correct")
                showAlert()
                reStart()
        }
    }
    
    @IBAction func showAlert() {
        var alert :UIAlertController
        if inputTextField.text == "12345" || inputTextField.text == "123456789" || inputTextField.text == "123" ||
            inputTextField.text == "123456" ||
            inputTextField.text == "1234567"
        {
             alert = UIAlertController(title: "登录失败", message: "密码错误", preferredStyle: .alert)
        }else {
            alert = UIAlertController(title: "登录失败", message: "账号不存在", preferredStyle: .alert)
        }
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                present(alert,animated: true,completion: nil)
    }
    func reStart(){
        inputTextField.text! = ""
        passWord.text! = ""
    }
    func selectname(_:String?) -> String{
        if inputTextField.text == "123"{
            return "Pilot"
        } else if inputTextField.text == "12345"{
            return "Captain"
        } else if inputTextField.text == "123456789"{
            return "Sailor"
        } else if inputTextField.text == "123456"{
            return "King"
        } else if inputTextField.text == "1234567"{
            return "Chef"
        } else {
            return "No"
        }
}
}
