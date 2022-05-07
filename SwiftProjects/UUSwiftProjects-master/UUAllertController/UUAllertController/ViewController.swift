//
//  ViewController.swift
//  UUAllertController
//
//  Created by lhn on 2018/11/22.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    绑定一个按钮事件
    @IBAction func ShowAlertAction(_ sender: UIButton) {
//        初始化一个系统弹出框
        let alertController = UIAlertController (title: "My Title", message: "this is an alert", preferredStyle: UIAlertController.Style.alert)
//        初始化一个取消按钮加事件
        let cancelAction = UIAlertAction (title: "Cancel", style: .cancel) { (UIAlertAction) in
//        触发按钮后要做的逻辑写这里
            print("touch cancel")
        }
//        将按钮加到弹出框上
        alertController.addAction(cancelAction)
//        初始化一个确定按钮加事件
        let OKAction = UIAlertAction (title: "OK", style: .default) { (UIAlertAction) in
//        触发按钮后要做的逻辑写这里
            print("touch ok")
        }
//        将按钮加到弹出框上
        alertController.addAction(OKAction)
//        弹出框弹出
        self.present(alertController, animated: true) {
//        弹出后的通知
            print("alert")
        }
    }
    
    @IBAction func ShowActionSheet(_ sender: Any) {
        let alertController = UIAlertController (title: "My Title", message: "This is an alert", preferredStyle: UIAlertController.Style.actionSheet)
        let cancelAction = UIAlertAction (title: "Cancel", style: .cancel) { (UIAlertAction) in
            print("touch actionSheet Cancel")
        }
        alertController.addAction(cancelAction)
        let OKAction = UIAlertAction (title: "OK", style: .default) { (UIAlertAction) in
            print("touch actionSheet OK")
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
            print("alert")
        }
    }
    
    @IBAction func AlertWithFrom(_ sender: Any) {
        let alertController = UIAlertController (title: "My Title", message: "This is an alert", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction (title: "Cancel", style: .cancel) { (UIAlertAction) in
            print("touch cancel")
        }
        alertController.addAction(cancelAction)
        let OKAction = UIAlertAction (title: "OK", style: .default) { (UIAlertAction) in
            print("touch ok")
            let username = alertController.textFields![0].text
            let password = alertController.textFields![1].text
            self.doSomething(username, password: password)
        }
        alertController.addAction(OKAction)
        alertController.addTextField { (textField : UITextField!) in
            textField.placeholder = "User Name"
            textField.isSecureTextEntry = false
        }
        alertController.addTextField { (textField : UITextField!) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        self.present(alertController, animated: true) {
            print("alert")
        }
        
    }
    
    
    @objc func doSomething (_ userName : String?, password : String?) {
        print("username:\(userName ?? "") password :\(password ?? "")")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

