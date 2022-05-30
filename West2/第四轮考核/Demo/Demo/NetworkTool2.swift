//
//  NetworkTool2.swift
//  Demo
//
//  Created by 林宏宇 on 2022/2/12.
//

import UIKit
import SwiftyJSON
import Alamofire

class NetworkTool2 {

    static let shared = NetworkTool2()
    
    func request2 (_ completion: @escaping (Error?, Citys?) -> ()) {
        
        let url = "http://apis.juhe.cn/springTravel/citys"

        let parameters : [String:Any] = ["key":"00215f961f3e858092b45f7330e3c8cd"]
        
        AF.request(url,method: .post,parameters: parameters).responseJSON { responds in

                switch responds.result {
                case .success(let value):
                    
                    let json = JSON(value)
                    let citys = Citys()
                    
                    let province_id = json["result"]["province_id"]
                    
                    let province = json["result"]["province"]
                    
                    let citysInfo = json["result"]["citys"]
                    
                    citys.provinceId = province_id.stringValue
                    
                    citys.province = province.stringValue
                    
                    
                    citys.city = citysInfo["city"].stringValue
                    
                    citys.cityId = citysInfo["city_id"].stringValue
                    

                    completion(nil, citys)
                case .failure(let error):
                    completion(error, nil)
            }
        }
    }
    
}
