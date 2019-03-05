//
//  ArticlesTableViewController.swift
//  RssReader
//
//  Created by admin on 21/02/2019.
//  Copyright © 2019 Hamza Chaouachi. All rights reserved.
//

import UIKit
import RealmSwift
import FeedKit
class ArticlesTableViewController: UITableViewController {
    
    let realm = try! Realm()
    let article = Article()
  
    var selectedCategory : Category? {
        didSet{
            loadArticles()
        }
    }
    var articles : [RSSFeedItem]?
    
    var  feed : RSSFeed?
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        loadArticles()
        tableView.separatorStyle = .none
     
        
        }
        
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articles?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
                cell.titre.text = articles?[indexPath.row].title
       cell.articleBody.text = articles?[indexPath.row].description
        return cell
    }

    func loadArticles(){
        
        
        if let currentCategory = selectedCategory {
            let feedURL = URL(string: currentCategory.Url)!
            let parser = FeedParser(URL: feedURL)
            
            parser.parseAsync { [weak self] (result) in
               
                guard let feed = result.rssFeed, result.isSuccess else {
                    print(result.error!)
                    return
                }
                
                self?.articles = feed.items
                
                // Then back to the Main thread to update the UI.
                DispatchQueue.main.async {
                  
                    self?.tableView.reloadData()
                }
                
            }
        
    }
    }
    func save(article : Article){
        
        do{
            try realm.write {
                realm.add(article)
            }
            
        }catch{
            print("Error save article , \(error)")
        }
    }

}
