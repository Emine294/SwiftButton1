//
//  Firebase1ViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/05/29.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit
import LineSDK

class Firebase1ViewController: UIViewController ,LineSDKLoginDelegate{

    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LineSDKLogin.sharedInstance().delegate = self
    }
    
    func didLogin(_ login: LineSDKLogin, credential: LineSDKCredential?, profile: LineSDKProfile?, error: Error?) {
        
        if let displayName = profile?.displayName{
            
            self.displayName = displayName
        }
        
        if let pictureURL = profile?.pictureURL{
            
            self.pictureURLString = pictureURL.absoluteString
        }
        
        UserDefaults.standard.set(self.displayName, forKey: "displayName")
        UserDefaults.standard.set(self.pictureURLString, forKey: "pictureURLString")
        
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        
        LineSDKLogin.sharedInstance().start()
    }
    
}
