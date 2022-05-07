//
//  DetailViewController.swift
//  UUNotification
//
//  Created by uu on 2019/5/14.
//  Copyright © 2019 UU. All rights reserved.
//
/*
 通知四步骤：
 注册、监听、发送、销毁
 */
import UIKit

class DetailViewController: UIViewController {
    
    public static let textFieldChangedNotification = NSNotification.Name(rawValue: "com.FXChat.textFieldChanged")
    
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "详情"
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        /// 发送通知
        NotificationCenter.default.post(name: DetailViewController.textFieldChangedNotification, object: textfield)
    }
    
    
    @IBAction func touchBack(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
