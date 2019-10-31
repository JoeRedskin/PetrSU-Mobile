//
//  TableViewCell.swift
//  PetrSU Mobile
//
//  Created by User on 10/05/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    func addNews(title: String, date: String, imageURL: String){
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
        //print(date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy HH:mm:ss Z\n"
        let dateAsDate = dateFormatter.date(from: date)
        
        dateFormatter.dateFormat = "d MMM, yyyy"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateAsString = dateFormatter.string(from: dateAsDate!)
        
        dateLabel.text = dateAsString
        

    }
}
