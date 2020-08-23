//
//  WebImageView.swift
//  NewsReader
//
//  Created by Евангелина Клюкай on 22.08.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {
    func load(url: URL?) {
        self.image = UIImage(named: "placeholder")
        
        guard let url = url else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, respons, error) in
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
