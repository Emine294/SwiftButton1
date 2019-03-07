//
//  PushViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/03/03.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit
import UserNotifications

class PushViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func push(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        content.title = nameTextField.text!
        content.body = textField.text!
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "ID", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}
