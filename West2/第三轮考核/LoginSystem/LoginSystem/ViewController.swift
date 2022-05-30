//
//  ViewController.swift
//  LoginSystem
//
//  Created by 林宏宇 on 2021/12/13.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x:140,y:160,width:200,height:30))
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
              
                secondVC.message = userName.text
            }
        }

    @IBOutlet weak var userName: UITextField!
    

    @IBOutlet weak var passWord: UITextField!
    
    @IBAction func onLogin(_ sender: Any) {
        if self.userName.text! == "12345" && self.passWord.text! == "12345"{
        }else {
            print("user or password is not correct")
                showAlert()
//                reStart()
        }
    }
    
  
    @IBAction func showAlert(){
        var alert :UIAlertController
        if userName.text == "12345" {
             alert = UIAlertController(title: "登录失败", message: "密码错误", preferredStyle: .alert)
        }else {
            alert = UIAlertController(title: "登录失败", message: "账号不存在", preferredStyle: .alert)
        }
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                present(alert,animated: true,completion: nil)
    }
//    struct ImageView:View{
//        var body: some View{
//            Image("p1")
//        }
//    }
//    struct Image_Previews:PreviewProvider{
//        static var previews: some View{
//            Group {
//                ImageView()
//                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//            }
//        }
//    }
    func reStart(){
        userName.text! = ""
        passWord.text! = ""
    }
    
}

