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
    @objc dynamic var id =  0
    @objc dynamic var name = ""
    @objc dynamic var full_name = ""
    @objc dynamic var html_url = ""
    @objc dynamic var language : String?
    @objc dynamic var forks = 0
    @objc dynamic var watchers = 0
    @objc dynamic var score = 0
    @objc dynamic var open_issues = 0
    
    @objc dynamic var owner: User?
    @objc dynamic var licence: Licence?
    
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
        
        if let id = object.object(forKey: "id") as? Int {
            item.id =  id
        }
        
        if let name = object.object(forKey: "name") as? String {
            item.name =  name
        }
        if let full_name = object.object(forKey: "full_name") as? String {
            item.full_name =  full_name
        }
        if let html_url = object.object(forKey: "html_url") as? String {
            item.html_url =  html_url
        }
        if let language = object.object(forKey: "language") as? String {
            item.language =  language
        }
        if let forks = object.object(forKey: "forks") as? Int {
            item.forks =  forks
        }
        if let watchers = object.object(forKey: "watchers") as? Int {
            item.watchers =  watchers
        }
        if let score = object.object(forKey: "score") as? Int {
            item.score =  score
        }
        if let open_issues = object.object(forKey: "open_issues") as? Int {
            item.open_issues =  open_issues
        }
        
        //add Owner
         if let dict = object.object(forKey: "owner") as? NSDictionary {
            let user = User.createOrUpdateObject(dict)
            item.owner = user
        }
        
        //add licence
        if let dict = object.object(forKey: "licence") as? NSDictionary {
            let licence = Licence.createOrUpdateObject(dict)
            item.licence  = licence
        }
      
        try! realm.write {
            realm.add(item, update: true)
        }
        return item
    }
}



/**
    RepositoryInterface is an interface of Repository
Used to populate View and Cell.
*/
extension Repository : RepositoryInterface {
    var id_text: String? {
        return "ID\r\(self.id)"
    }
    
    var title: String? {
        return self.name
    }
    
    var sub_title: String? {
        return self.full_name
    }
    
    var avatar_owner_url: URL? {
        if let owner = owner {
            return URL.init(string: owner.avatar_url)
        }
        
        return nil
    }
    
    var licence_name: String? {
        return ""
    }
    
}

