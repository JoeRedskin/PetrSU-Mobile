//
//  DataCollection.swift
//  PetrSU Mobile
//
//  Created by User on 03/04/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import Foundation

class DataCollection: NSObject, XMLParserDelegate {
    
    var parser = XMLParser()
    var newsList: [News] = []
    var news: News? = nil
    var element = String()
    var img:  [String] = []
    
    func initWithURL() -> AnyObject {
        startParse()
        return self
    }
    
    func startParse() {
        guard let newsListURL = URL(string: "https://petrsu.ru/rss") else {return}
        parser = XMLParser(contentsOf: newsListURL)!
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
        parser.parse()
    }
    
    func allNews() -> [News] {
        return newsList
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String,
                namespaceURI: String?, qualifiedName qName: String?,
                attributes attributeDict: [String : String]) {
        element = elementName
        if elementName == "item" {
            news = News()
        } else if elementName == "enclosure" {
            if let urlString = attributeDict["url"] {
                img.append(urlString)
                news?.imageURL = urlString
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            if let post = news {
                newsList.append(post)
            }
            news = nil
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if let post = news{
            if element == "title" {
                news?.title = post.title!+string
            } else if element == "link" {
                news?.link = post.link!+string
            } else if element == "description" {
                news?.description = post.description!+string
            } else if element == "pubDate" {
                news?.date = post.date!+string
            }
        }
        
    }
    
}
