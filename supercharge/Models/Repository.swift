//
//  repositorie.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit
import RealmSwift

class Repository: Object {
    @objc dynamic var id : NSNumber =  0
    @objc dynamic var name = ""
    @objc dynamic var full_name = ""
    @objc dynamic var html_url = ""
    @objc dynamic var language : String?
    @objc dynamic var forks = 0
    @objc dynamic var watchers = 0
    @objc dynamic var score = 0
    @objc dynamic var open_issues = 0
    
    @objc dynamic var owner: User?
    
    override static func primaryKey() -> String? {
        return "id"
    }

}


//MARK: - Create Repository
extension Repository {
    /**
     Create Realm objects from Json Response
     -> Array(Dictionnary)
     <- Array(Repository)
     */
    class func createOrUpdateObjects(objects: Array<NSDictionary> ) -> Array<Repository>{
        var r : Array<Repository> = []
        for item in objects {
            let e =   createOrUpdateObject(item)
            r.append(e)
        }
        return r
    }
    
    /**
     Create Realm object from Json Response
     -> Dictionnary
     <- Repository
     */
    class func createOrUpdateObject(_ object: NSDictionary) -> Repository{
        let item = Repository()
        let realm = try! Realm()
        
        if let id = object.object(forKey: "id") as? NSNumber {
            item.id =  id
        }
        
        if let name = object.object(forKey: "name") as? String {
            item.name =  name
        }
      
        try! realm.write {
            realm.add(item, update: true)
        }
        return item
    }
}

