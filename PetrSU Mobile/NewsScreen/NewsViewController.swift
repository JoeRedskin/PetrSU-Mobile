//
//  NewsViewController.swift
//  PetrSU Mobile
//
//  Created by User on 03/04/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLParserDelegate {
    
    @IBOutlet weak var NewsTableView: UITableView!
    
    var newsList: [News] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "NewsScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewsWebView") as! NewsWebViewController
        
        vc.selectedURL = newsList[indexPath.section].link
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell

        
        //print(newsList[indexPath.row].date ?? "")
        cell.addNews(title: newsList[indexPath.section].title ?? "",
                     date: newsList[indexPath.section].date ?? "",
                     imageURL: newsList[indexPath.section].imageURL ?? "")
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataLoader = DataCollection()
        let myParser = dataLoader.initWithURL() as! DataCollection
        
        newsList = myParser.newsList
        NewsTableView.reloadData()
    }
}
