//
//  ArticleListViewModel.swift
//  TopNews-iOS
//
//  Created by Kazi Abdullah Al Mamun on 10/11/19.
//  Copyright © 2019 Kazi Abdullah Al Mamun. All rights reserved.
//

import Foundation

class ArticleListViewModel {
    
    private var articles: [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
    
    func getArticleViewModelFor(index: Int) -> ArticleViewModel {
        return ArticleViewModel(article: articles[index])
    }
    
    func numberOfRows() -> Int {
        return articles.count
    }
}
