//
//  PostViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/05/30.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class PostViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    var displayName = String()
    var pictureURLString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayName = UserDefaults.standard.object(forKey: "displayName") as! String
        
        pictureURLString = UserDefaults.standard.object(forKey: "pictureURLString") as! String
        
        nameLabel.text = displayName
        profileImageView.sd_setImage(with: URL(string: pictureURLString), completed: nil)
        profileImageView.layer.cornerRadius = 8.0
        profileImageView.clipsToBounds = true
        
    }
    
    @IBAction func post(_ sender: Any) {
        
        let rootRef = Database.database().reference(fromURL:"https://testapp1-2f2f7.firebaseio.com/").child("post").childByAutoId()
        
        let feed = ["comment":textField.text,"userName":nameLabel.text] as [String:Any]
        rootRef.setValue(feed)
        dismiss(animated: true, completion: nil)
        
    }
    
}
