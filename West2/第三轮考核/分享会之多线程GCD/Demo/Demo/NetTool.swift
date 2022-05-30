//
//  NetTool.swift
//  Demo
//
//  Created by 沈欢 on 2021/11/30.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetTool: NSObject {

    static let shared = NetTool()
    
    func fetchMoments(page: Int32,pageSize: Int32,
                      completion: @escaping (Result<[ELMoment], Error>) -> Void) {
        let url = "http....."
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let moments = json["data"].arrayValue.map({ELMoment(json: $0)})
                
                completion(.success(moments))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    func fetchComments(of momentID: Int32, page: Int32,pageSize: Int32,
                      completion: @escaping (Result<[ELComment], Error>)->Void) {
        let url = "http......"
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let comments = json["data"].arrayValue.map({ELComment(json: $0)})
                completion(.success(comments))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}





class ELMoment: NSObject {
    
    var id: Int32 = 666
    
    var comments: [ELComment] = []
    
    init(json: JSON) {
        
    }
}


class ELComment: NSObject {
    
    init(json: JSON) {
        
    }
}
