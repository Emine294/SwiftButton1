//
//  TableViewController3.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/02/24.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class TableViewController3: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = String(count2)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
