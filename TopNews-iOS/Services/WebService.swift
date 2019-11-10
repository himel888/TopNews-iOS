//
//  WebService.swift
//  TopNews-iOS
//
//  Created by Kazi Abdullah Al Mamun on 10/11/19.
//  Copyright © 2019 Kazi Abdullah Al Mamun. All rights reserved.
//

import Foundation

class WebService {
    
    
    public func getArticles(completion: @escaping ([Article]?) -> Void) {
        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-10-10&sortBy=publishedAt&apiKey=3a6b05f124a74f5886f1ab7784e324c1")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                completion(nil)
            } else if let data = data {
                do {
                    let articleList = try JSONDecoder().decode(ArticleList.self, from: data)
                    if !articleList.articles.isEmpty {
                        completion(articleList.articles)
                    } else {
                        completion(nil)
                    }
                } catch {
                    print(error)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
