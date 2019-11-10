//
//  NewsListTableVC.swift
//  TopNews-iOS
//
//  Created by Kazi Abdullah Al Mamun on 10/11/19.
//  Copyright © 2019 Kazi Abdullah Al Mamun. All rights reserved.
//

import UIKit

class NewsListTableVC: UITableViewController {
    
    var articleListViewModel: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    private func initialSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        WebService().getArticles { (articles) in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel != nil ? articleListViewModel.numberOfRows() : 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTVCell", for: indexPath) as! ArticleTVCell
        let articleViewModel = articleListViewModel.getArticleViewModelFor(index: indexPath.row)

        cell.titleLbl.text = articleViewModel.getTitle()
        cell.descriptionLbl.text = articleViewModel.getDescription()

        return cell
    }

}
