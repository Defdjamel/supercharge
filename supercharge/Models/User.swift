//
//  user.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {
     @objc dynamic var id =  0
     @objc dynamic var name = ""
     @objc dynamic var avatar_url = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


extension User{
    class func createOrUpdateObject(_ object: NSDictionary) -> User{
        let item = User()
        let realm = try! Realm()
        
        if let id = object.object(forKey: "id") as? Int {
            item.id =  id
        }
        
        if let name = object.object(forKey: "name") as? String {
            item.name =  name
        }
        if let avatar_url = object.object(forKey: "avatar_url") as? String {
            item.avatar_url =  avatar_url
        }
        
        try! realm.write {
            realm.add(item, update: true)
        }
        return item
    }
    
}
