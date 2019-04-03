//
//  NewsViewController.swift
//  PetrSU Mobile
//
//  Created by User on 03/04/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLParserDelegate {
    
    
    @IBOutlet weak var NewsTableView: UITableView!
    
    var newsArray: [News] = []
    var myFeed : NSArray = []
    var feedImgs: [AnyObject] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
//        let url = URL(string:feedImgs[indexPath.row] as! String)
//        let data = NSData(contentsOf:url! as URL)
//        var image = UIImage(data:data! as Data)
//
//        image = resizeImage(image: image!, toTheSize: CGSize(width: 70, height: 70))
//
//        let cellImageLayer: CALayer?  = cell.imageView?.layer
//
//        cellImageLayer!.cornerRadius = 35
//        cellImageLayer!.masksToBounds = true
//
//        cell.imageView?.image = image
        cell.addNews(title: ((myFeed.object(at: indexPath.row) as AnyObject).object(forKey: "title") as? String)!, description: ((myFeed.object(at: indexPath.row) as AnyObject).object(forKey: "description") as? String)!)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataLoader = DataCollection()
        let myParser = dataLoader.initWithURL() as! DataCollection
        
        feedImgs = myParser.img as [AnyObject]
        myFeed = myParser.feeds
        //print(myFeed)
        NewsTableView.reloadData()

    }
    
    func resizeImage(image:UIImage, toTheSize size:CGSize)->UIImage{
        
        let scale = CGFloat(max(size.width/image.size.width,
                                size.height/image.size.height))
        let width:CGFloat  = image.size.width * scale
        let height:CGFloat = image.size.height * scale;
        
        let rr:CGRect = CGRect(x: 0, y: 0, width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        image.draw(in: rr)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return newImage!
    }


}
