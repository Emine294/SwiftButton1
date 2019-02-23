//
//  WebKitViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/02/03.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    
    var urlString:String = "https://www.youtube.com/watch?v=7MaF-bWeLGw"
    
    var indicator:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        guard let url = URL(string: urlString)else{
            return
        }
        
        let req = URLRequest(url:url,
                             cachePolicy: .returnCacheDataElseLoad,
                             timeoutInterval:100)
        
        self.webView.load(req)
        
    }
    
    
    @IBAction func back(_ sender: Any) {
    
    webView.goBack()
    }
    
    @IBAction func next(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func reflesh(_ sender: Any) {
        webView.reload()
        
    }
    
    func setIndicator(){
        
        indicator = UIActivityIndicatorView()
        
        indicator.frame = CGRect(x:0,y:0, width: 100,height:100)
        indicator.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.height/2)
        indicator.hidesWhenStopped = true
        indicator.style = .gray
        
        self.webView.addSubview(indicator)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        indicator.stopAnimating()
    }
    
}
