//
//  Network.swift
//  wzp_challenge
//
//  Created by james on 14/03/2019.
//  Copyright © 2019 intergoldex. All rights reserved.
//

import UIKit

let Hostname = "https://api.github.com/"
let ServiceApi = Hostname + ""
let api_key = "df6f765c265c02c1ef978f6ee3207407cf878f4d"
let maxCount = 20

struct Api {
    static let searchRepositories = ServiceApi + "search/repositories"
}
