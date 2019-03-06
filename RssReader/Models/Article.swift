//
//  Article.swift
//  RssReader
//
//  Created by admin on 21/02/2019.
//  Copyright © 2019 Hamza Chaouachi. All rights reserved.
//

import Foundation
import RealmSwift

class  Article : Object {
    
    @objc dynamic var titre: String = ""
    @objc dynamic var contenu : String = ""
  
    var parentCategory = LinkingObjects(fromType: Category.self , property : "articles")
 
}
