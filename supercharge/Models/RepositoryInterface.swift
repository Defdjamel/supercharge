//
//  RepositoryInterface.swift
//  supercharge
//
//  Created by james on 11/04/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit


/**
 RepositoryInterface is an interface of Repository
 Used to populate View and Cell.
 */
protocol RepositoryInterface {
    var id_text: String? { get }
    var title: String? { get }
    var sub_title: String? { get }
    var avatar_owner_url: URL? { get }
    var licence_name: String? { get }
   
}
