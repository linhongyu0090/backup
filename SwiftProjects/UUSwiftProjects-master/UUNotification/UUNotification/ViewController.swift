//
//  ViewController.swift
//  UUNotification
//
//  Created by uu on 2019/5/14.
//  Copyright © 2019 UU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        // Do any additional setup after loading the view.
        /// 注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(onRecvTextFieldChangedNotification(noti:)), name: NSNotification.Name(rawValue: "com.FXChat.textFieldChanged"), object: textfield)
    }
    
    deinit {
        /// 移除通知监听
        NotificationCenter.default.removeObserver(self)
    }
    
    /// 调取方法
    @objc func onRecvTextFieldChangedNotification(noti:Notification) {
        textfield = noti.object as? UITextField
        self.titleLabel.text = textfield.text
    }

    @IBAction func touchme(_ sender: Any) {
        let vc = DetailViewController()
        self.present(vc, animated: true) {
            
        }
    }
    
}

