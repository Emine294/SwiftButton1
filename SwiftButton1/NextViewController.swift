//
//  NextViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/02/03.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var changeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func change(_ sender: Any) {
        changeLabel.text = "暗号が解除されました。"
    }
    
}
