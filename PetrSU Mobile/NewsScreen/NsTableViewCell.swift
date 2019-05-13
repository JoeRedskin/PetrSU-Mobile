//
//  NewsTableViewCell.swift
//  PetrSU Mobile
//
//  Created by User on 03/04/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import UIKit

class NsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    func addNews(title: String, imageURL: String){
        titleLabel.text = title
        
        
        if let url = URL(string: imageURL){
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = urlContents {
                        let image = UIImage(data: imageData)
                        self!.imageLabel.image = image   
                    }
                }
            }
        }
        dateLabel.text = "14 mau"
    }
}
