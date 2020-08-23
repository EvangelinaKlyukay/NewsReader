//
//  NetworkService.swift
//  NewsReader
//
//  Created by Евангелина Клюкай on 18.08.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation
import FeedKit

struct NetworkService {
   
    static func load(onSuccess:  ((RSSFeed) -> ())?, onFail: ((Error) -> ())?) {
                
        guard let feedURL = URL(string: "http://vc.ru/rss") else {
            let error = NSError(domain: "NetworkManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Не могу создать URL с RSS"])
            onFail?(error)
            return
        }
        let parser = FeedParser(URL: feedURL)
        
        parser.parseAsync { (result) in
            switch result {
            case .success(let feed):
               
                guard let rssFeed = feed.rssFeed else {
                    let error = NSError(domain: "NetworkManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Не могу получить данные из RSS"])
                    onFail?(error)
                    return
                }
                onSuccess?(rssFeed)
                
            case .failure(let error):
                print(error)
                onFail?(error)
            }
        }
    }
 
}
