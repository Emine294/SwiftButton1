//
//  AddViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/02/28.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class AddViewController: UIViewController , UITextFieldDelegate{

    var array = [String]()
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        
    }
    
    @IBAction func add(_ sender: Any) {
        
        if (UserDefaults.standard.object(forKey: "todo") != nil){
            array = UserDefaults.standard.object(forKey: "todo") as! [String]
        }
        
        array.append(textField.text!)
        UserDefaults.standard.set(array, forKey: "todo")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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
