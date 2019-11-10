//
//  Article.swift
//  TopNews-iOS
//
//  Created by Kazi Abdullah Al Mamun on 10/11/19.
//  Copyright © 2019 Kazi Abdullah Al Mamun. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    
    let title: String?
    let description: String?
}
