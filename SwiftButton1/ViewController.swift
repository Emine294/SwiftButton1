//
//  ViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/02/03.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func changeImage(_ sender: Any) {

        count = count + 1
        
        if count > 5 {
            imageView.image = UIImage(named: "background")
        }
        if count > 10 {
            imageView.image = UIImage(named: "beach")
        }
        
    }
    
}

