//
//  NewsTableViewCell.swift
//  PetrSU Mobile
//
//  Created by User on 03/04/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var NewsTitleLabel: UILabel!    
    @IBOutlet weak var NewsDescriptionLabel: UILabel!
    

    func addNews(title: String, description: String){
        NewsTitleLabel.text = title
        NewsDescriptionLabel.text = description
    }
}
