//
//  NetworkManager.swift
//  wzp_challenge
//
//  Created by james on 14/03/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit
import Alamofire
class NetworkManager: NSObject {
    static let sharedInstance = NetworkManager()
}
//MARK: - REQUESTS
extension NetworkManager {
    func searchRepositories (q: String,page: Int,  success: @escaping (Array<Repository>) -> Void, failed: @escaping () -> Void){
        let service = Api.searchRepositories + "?q=" + q
        let params : [String: Any] = [ "page" : page, "per_page" : maxCount, "accesstoken" : api_key,"sort" : "stars" ,"order" : "desc" ]
        print(service)
          Alamofire.request( service, method: .get ,parameters: params ,encoding: URLEncoding.default).responseJSON { response in
            
            if  let json = response.result.value  as? NSDictionary, let items =  json.object(forKey: "items") as? Array<NSDictionary> {//success
                let items = Repository.createOrUpdateObjects(objects: items)
                success(items)
             }else{
                failed()
            }
        }
        
    }
}
