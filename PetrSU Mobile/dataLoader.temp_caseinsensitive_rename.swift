//
//  DataLoader.swift
//  PetrSU Mobile
//
//  Created by User on 03/04/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import Foundation

class dataLoader {
    
    private let SERVER_URL = "https://petrsu.ru/rss"
    
    func getNews() {
       
        //var news: [NewsList] = []
        
        guard let newsListURL = URL(string: SERVER_URL) else {return}
        if let parser = XMLParser(contentsOf: newsListURL){
            parser.delegate = self as? XMLParserDelegate
            parser.parse()
            print(parser)
            //news = parser
        }
        
    }
    
    
}
