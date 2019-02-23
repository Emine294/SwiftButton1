//
//  LoginViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/02/03.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var mailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mailTextField.delegate = self
        passwordTextField.delegate = self
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        
        resultLabel.text = mailTextField.text! + " " + passwordTextField.text!
    }
    
}
