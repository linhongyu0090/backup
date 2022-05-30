//
//  SceneDelegate.swift
//  Information
//
//  Created by 林宏宇 on 2022/2/9.
//
import UIKit
import MJRefresh

class TotalVC: UIViewController {

    var segmented:UISegmentedControl!
    var scrollView:UIScrollView!
//    var collectView:CollectView!
//    var rangeQueryView:RangeQueryView!
//
    var width:CGFloat!
    var height:CGFloat!
    
    private var tableView:UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tableView.reloadData()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData(from: 10191, to: 10349)
        getData2()
        
                
        let tags = ["全部","收藏","区间查询"] as [Any]
        width = self.view.bounds.size.width
        height = super.view.bounds.size.height
        segmented = UISegmentedControl(items: tags)
        segmented.layer.position = CGPoint(x: width / 2, y: 50)
        segmented.selectedSegmentIndex = 0
        segmented.addTarget(self, action: #selector(segmentDidchange(_:)), for: .valueChanged)
        navigationItem.titleView = segmented
        view.backgroundColor = .systemGray6
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 80, width: width, height: height - 80 ))
                scrollView.delegate = self
                scrollView.isPagingEnabled = true
                scrollView.contentSize = CGSize(width: width * 2, height: height - 80 )
                self.view.addSubview(scrollView)
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 400
        tableView.separatorStyle = .none
        tableView.register(TotalCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGray6
        view.addSubview(tableView)
        scrollView.addSubview(tableView)
        
//        collectView = CollectView(frame: CGRect(x: width, y: 0, width: width, height: height - 80))
//        scrollView.addSubview(collectView)
//
//        rangeQueryView = RangeQueryView(frame: CGRect(x: width * 2, y: 0, width: width, height: height - 80))
//        scrollView.addSubview(rangeQueryView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
}

    @objc func segmentDidchange(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            scrollView.contentOffset.x = 0
        }else if sender.selectedSegmentIndex == 1{
            scrollView.contentOffset.x = width
        }else{
            scrollView.contentOffset.x = width * 2
        }
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= width && scrollView.contentOffset.x <= width * 2 {
            segmented.selectedSegmentIndex = 1
        }else if scrollView.contentOffset.x >= width * 2 {
            segmented.selectedSegmentIndex = 2
        }else{
            segmented.selectedSegmentIndex = 0
        }
    }
    
    var cityInfo = CityInfo()

    func getData(from:Int,to:Int) {
 
        NetworkTool.shared.request(from: from, to: to) { (error,info) in
            if let error = error {
                print(error)
                return
            }
            guard let content = info else {
                print("nil")
                return
            }
            
            self.cityInfo = content
            print(self.cityInfo.toCity)
            print(self.cityInfo.toPolicyIn)
            print(self.cityInfo.fromCity)
            print(self.cityInfo.fromPolicyIn)
        }
    }
    
    var citys = Citys()
    func getData2(){
        NetworkTool2.shared.request2() { (error,citys) in
            if let error = error {
                print(error)
                return
            }
            guard let content = citys else {
                print("nil")
                return
            }
            
            self.citys = content
            print(self.citys.cityId)
            print(self.citys.city)
            print(self.citys.provinceId)
            print(self.citys.province)
        }
    }


}

extension TotalVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as!TotalCell
        if indexPath.row % 2 == 0{
//            cell.setMainTitle("江苏•苏州")
            cell.setMainTitle(self.cityInfo.fromCity)
//            cell.setMainTitle(self.queries.toCity)
            cell.setSubTitle("低风险")
            cell.setInText(self.cityInfo.fromPolicyIn)
//            cell.setInText(self.cityInfo.toPolicy)
            cell.setOutText(self.cityInfo.fromPolicyOut)
            cell.setSubTitle(.systemGreen)
        }else{
            cell.setMainTitle(self.cityInfo.toCity)
//            cell.setMainTitle(self.queries.fromCity)
            cell.setSubTitle("部分地区中、高风险")
            cell.setInText(self.cityInfo.toPolicyIn)
            cell.setOutText(self.cityInfo.toPolicyOut)
            cell.setSubTitle(.brown)
        }
        return cell
        
    }
}
    
extension TotalVC:UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailVC()
//        navigationController?.pushViewController(vc, animated: true)
//        if indexPath.row % 2 == 0{
//            vc.cityName = self.cityInfo.fromCity
//            vc.provinceName = cityInfo.fromCity
//            vc.inDesc = self.cityInfo.fromPolicyIn
//            vc.outDesc = self.cityInfo.fromPolicyOut
//        }else{
//            vc.cityName = self.cityInfo.toCity
//            vc.provinceName = "河北"
//            vc.inDesc = self.cityInfo.toPolicyIn
//            vc.outDesc = self.cityInfo.toPolicyOut
//        }
//    }
}

