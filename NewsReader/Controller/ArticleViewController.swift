//
//  NewsViewController.swift
//  NewsReader
//
//  Created by Евангелина Клюкай on 21.08.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    var article: Article?
    
    @IBOutlet weak var imageArticle: WebImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var autorDateLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E dd MMM yyyy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let article = article {
            titleLabel.text = article.title
            autorDateLabel.text = "\(article.author) • \(dateFormatter.string(from: article.date))"
            articleLabel.text = article.details
            imageArticle.load(url: article.previewUrl)
            
            imageArticle.layer.cornerRadius = 10
            imageArticle.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            
        }
    }
}
