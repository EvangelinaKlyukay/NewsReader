//
//  ArticleViewCell.swift
//  NewsReader
//
//  Created by Евангелина Клюкай on 21.08.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class ArticleViewCell: UITableViewCell {
    
    @IBOutlet weak var previewImageView: WebImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
     
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E dd MMM yyyy"
        return formatter
    }()
    
    var article: Article? {
        didSet {
            guard let article = self.article else { return }
            
            titleLabel.text = article.title
            informationLabel.text = "\(article.author) • \(dateFormatter.string(from: article.date))"
            previewImageView.load(url: article.previewUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        previewImageView.layer.cornerRadius = 12
    }
}
