//
//  Licence.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit
import RealmSwift

class Licence: Object {
    @objc dynamic var name = ""
    @objc dynamic var key = ""

}

extension Licence{
    class func createOrUpdateObject(_ object: NSDictionary) -> Licence{
        let item = Licence()
        let realm = try! Realm()
        
        if let name = object.object(forKey: "name") as? String {
            item.name =  name
        }
        if let key = object.object(forKey: "key") as? String {
            item.key =  key
        }
        
        try! realm.write {
            realm.add(item, update: true)
        }
        return item
    }
}
