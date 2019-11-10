//
//  ArticleViewModel.swift
//  TopNews-iOS
//
//  Created by Kazi Abdullah Al Mamun on 10/11/19.
//  Copyright © 2019 Kazi Abdullah Al Mamun. All rights reserved.
//

import Foundation

class ArticleViewModel {
    
    private var article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    public func getTitle() -> String {
        return article.title ?? ""
    }
    
    public func getDescription() -> String {
        return article.description ?? ""
    }
}
