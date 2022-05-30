//
//  GroupDemoViewController.swift
//  Demo
//
//  Created by 沈欢 on 2021/11/30.
//

import UIKit

class GroupDemoViewController: UIViewController {
    
    
    private var page: Int32 = 1
    private var moments: [ELMoment] = []
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    func getData() {
        NetTool.shared.fetchMoments(page: self.page, pageSize: 10) {[weak self] result in
             guard let self = self else {return}
             switch result {
             case .success(let moments):
                 self.page += 1
                 
                 self.moments += moments
                 
                 let group = DispatchGroup()
                 
                 for moment in moments {
                     //获取评论
                     group.enter()
                     NetTool.shared.fetchComments(of: moment.id, page: 1, pageSize: 2) { (result) in
                         switch result {
                         case .success(let comments):
                             moment.comments = comments
                         case .failure(let error):
                             debugPrint(error.localizedDescription)
                         }
                         
                         group.leave()
                     }
                 }
                 
                 //处理完 更新UI
                 group.notify(queue: .main) {
                     self.tableView.reloadData()
                 }
                 
                 
             case .failure(_):
                break
             }
         }
     }

}
