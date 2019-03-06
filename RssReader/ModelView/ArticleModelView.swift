//
//  ArticleModelView.swift
//  RssReader
//
//  Created by admin on 06/03/2019.
//  Copyright © 2019 Hamza Chaouachi. All rights reserved.
//

import Foundation
import FeedKit
class ArticleModelView {
    
    var articlesArray = Array<Article>()
    let article = Article()
    init (){
        
    }
    
   init(feedResult : RSSFeed?) {
    
    for feed in (feedResult?.items)! {
        article.contenu = feed.description!
        article.titre = feed.title!
        articlesArray.append(article)
    }
    
    }
}
