//
//  SceneDelegate.swift
//  Information
//
//  Created by 林宏宇 on 2022/2/9.
//
import UIKit
import SwiftyJSON
import Alamofire

class NetworkTool {

    static let shared = NetworkTool()
    
    func request (from:Int, to:Int,_ completion: @escaping (Error?, CityInfo?) -> ()) {
        
        let url = "http://apis.juhe.cn/springTravel/query"

        let parameters : [String:Any] = ["key":"00215f961f3e858092b45f7330e3c8cd","from":from,"to":to]
        
        AF.request(url,method: .post,parameters: parameters).responseJSON { responds in

                switch responds.result {
                case .success(let value):
                    let json = JSON(value)
                    let info = CityInfo()
//                    print(json)
                    
                    let fromInfo = json["result"]["from_info"]
                    
                    let toInfo = json["result"]["to_info"]
                    
                    info.fromCity = fromInfo["city_name"].stringValue
                    info.fromPolicyIn = fromInfo["low_in_desc"].stringValue
                    info.fromPolicyOut =
                    fromInfo["out_desc"].stringValue
                    
                    info.toCity = toInfo["city_name"].stringValue
                    
                    info.toPolicyIn = toInfo["low_in_desc"].stringValue
                    
                    info.toPolicyOut = toInfo["out_desc"].stringValue

                    completion(nil, info)
                case .failure(let error):
                    completion(error, nil)
            }
        }
    }
    
}
