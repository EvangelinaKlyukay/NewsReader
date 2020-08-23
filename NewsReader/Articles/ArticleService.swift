//
//  ArticleService.swift
//  NewsReader
//
//  Created by Евангелина Клюкай on 22.08.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation
import FeedKit

struct ArticleService {
    
    static func loadLastArticles(onSuccess: (([Article], String?) -> ())?, onFail: ((Error) -> ())?) {
        NetworkService.load(onSuccess: { (rssFeed) in
            
            var articles: [Article] = []
            
            for item in rssFeed.items ?? [] {
                guard
                    let title = item.title,
                    let details = item.description,
                    let author = item.author,
                    let date = item.pubDate,
                    let previewUrl = item.enclosure?.attributes?.url
                    else { continue }
                
                let article = Article(title: title, details: details, author: author, date: date, previewUrl: URL(string: previewUrl))
                articles.append(article)
            }
            let title = rssFeed.title
            
            
            onSuccess?(articles, title)
        }, onFail: onFail)
    }
}
