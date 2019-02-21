//
//  Category.swift
//  RssReader
//
//  Created by admin on 21/02/2019.
//  Copyright © 2019 Hamza Chaouachi. All rights reserved.
//

import Foundation
import RealmSwift
class Category : Object {
    @objc dynamic var name: String = ""
    @objc dynamic var Url: String = ""
    let articles = List<Article>()
}
