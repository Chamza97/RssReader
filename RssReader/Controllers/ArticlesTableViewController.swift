//
//  ArticlesTableViewController.swift
//  RssReader
//
//  Created by admin on 21/02/2019.
//  Copyright © 2019 Hamza Chaouachi. All rights reserved.
//

import UIKit
import RealmSwift

class ArticlesTableViewController: UITableViewController {
    let realm = try! Realm()
    var selectedCategory : Category? {
        didSet{
         loadArticles()
        }
 
    }
    var articles : Results<Article>?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell" ,for : indexPath) as! CustomTableViewCell
        cell.titre.text = articles?[indexPath.row].titre
        cell.articleBody.text = articles?[indexPath.row].contenu
        
        return cell
    }

    func loadArticles(){
        
        articles = selectedCategory?.articles.sorted(byKeyPath: "date", ascending: true)
        tableView.reloadData()
    }

}
