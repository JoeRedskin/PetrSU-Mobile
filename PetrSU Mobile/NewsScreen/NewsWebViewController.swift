//
//  NewsWebViewController.swift
//  PetrSU Mobile
//
//  Created by User on 13/05/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import UIKit
import WebKit

class NewsWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var selectedURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedURL =  selectedURL?.replacingOccurrences(of: " ", with:"")
        selectedURL =  selectedURL?.replacingOccurrences(of: "\n", with:"")
        
        //selectedURL = "https://petrsu.ru"
        webView.load(URLRequest(url: URL(string: selectedURL! as String)!))
//        let myURL = URL(string:"https://www.apple.com")
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
    }

}
