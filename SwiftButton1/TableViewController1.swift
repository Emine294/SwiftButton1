//
//  TableViewController1.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/02/24.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class TableViewController1: UIViewController {

    @IBOutlet var label: UILabel!
    
    var box = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func countUp(_ sender: Any) {
        
        box = box + 1
        
        label.text = String(box)
        
        if box > 10 {
            
            let tableViewController2: TableViewController2 = self.storyboard?.instantiateViewController(withIdentifier: "next") as! TableViewController2
            
            tableViewController2.count = box
            self.navigationController?.pushViewController(tableViewController2, animated: true)
            
        }
        
    }

}
