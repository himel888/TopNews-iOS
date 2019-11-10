//
//  NewsListTableVC.swift
//  TopNews-iOS
//
//  Created by Kazi Abdullah Al Mamun on 10/11/19.
//  Copyright © 2019 Kazi Abdullah Al Mamun. All rights reserved.
//

import UIKit

class NewsListTableVC: UITableViewController {
    
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    private func initialSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        WebService().getArticles { (articles) in
            if let articles = articles {
                DispatchQueue.main.async {
                    self.articles = articles
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTVCell", for: indexPath) as! ArticleTVCell
        let article = articles[indexPath.row]

        cell.titleLbl.text = article.title
        cell.descriptionLbl.text = article.description

        return cell
    }

}
