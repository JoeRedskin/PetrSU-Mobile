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
    var news: [News] = []
    
    var feeds = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var ftitle = NSMutableString()
    var link = NSMutableString()
    var img:  [AnyObject] = []
    var fdescription = NSMutableString()
    var fdate = NSMutableString()
    
    
    func getNews() {
        guard let newsListURL = URL(string: "https://petrsu.ru/rss") else {return}
        //        print(newsListURL)
        if let parser = XMLParser(contentsOf: newsListURL){
            parser.delegate = self
            parser.shouldProcessNamespaces = false
            parser.shouldReportNamespacePrefixes = false
            parser.shouldResolveExternalEntities = false
            parser.parse()
            print(parser)
            print(parser)
        }
    }
    
    func initWithURL() -> AnyObject {
        startParse()
        return self
    }
    
    func startParse() {
        feeds = []
        guard let newsListURL = URL(string: "https://petrsu.ru/rss") else {return}
        parser = XMLParser(contentsOf: newsListURL)!
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
        parser.parse()
    }
    
    
    func allFeeds() -> NSMutableArray {
        return feeds
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String,
                namespaceURI: String?, qualifiedName qName: String?,
                attributes attributeDict: [String : String]) {
        element = elementName as NSString
        if (element as NSString).isEqual(to: "item") {
            elements =  NSMutableDictionary()
            elements = [:]
            ftitle = NSMutableString()
            ftitle = ""
            link = NSMutableString()
            link = ""
            fdescription = NSMutableString()
            fdescription = ""
            fdate = NSMutableString()
            fdate = ""
        } else if (element as NSString).isEqual(to: "enclosure") {
            if let urlString = attributeDict["url"] {
                img.append(urlString as AnyObject)
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if (elementName as NSString).isEqual(to: "item") {
            if ftitle != "" {
                elements.setObject(ftitle, forKey: "title" as NSCopying)
            }
            if link != "" {
                elements.setObject(link, forKey: "link" as NSCopying)
            }
            if fdescription != "" {
                elements.setObject(fdescription, forKey: "description" as NSCopying)
            }
            if fdate != "" {
                elements.setObject(fdate, forKey: "pubDate" as NSCopying)
            }
            feeds.add(elements)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "title") {
            ftitle.append(string)
        } else if element.isEqual(to: "link") {
            link.append(string)
        } else if element.isEqual(to: "description") {
            fdescription.append(string)
        } else if element.isEqual(to: "pubDate") {
            fdate.append(string)
        }
    }
    
    
    //
    //        func parser(parser: XMLParser, parseErrorOccurred parseError: NSError) {
    //            print("parse error: \(parseError)")
    //        }
    //
    //        func parser(parser: XMLParser, didStartElement elementName: String,
    //                    namespaceURI: String?, qualifiedName qName: String?,
    //                    attributes attributeDict: [NSObject : AnyObject]) {
    //            tempElement = elementName
    //            if elementName == "item" {
    //                tempPost = News()
    //            }
    //        }
    //    }
    //
    //    func parser(parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    //        if elementName == "item" {
    //            if let post = tempPost {
    //                news.append(post)
    //                print(news)
    //            }
    //
    //            tempPost = nil
    //        }
    //    }
    //
    //    func parser(parser: XMLParser, foundCharacters string: String?) {
    //        if let post = tempPost, let str = string {
    //            if tempElement == "title" {
    //                tempPost?.title = post.title+str
    //            } else if tempElement == "link" {
    //                tempPost?.link = post.link+str
    //            } else if tempElement == "pubDate" {
    //                tempPost?.date = post.date+str
    //            }
    //        }
    //    }

    
}
