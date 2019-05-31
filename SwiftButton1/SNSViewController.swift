//
//  SNSViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/05/28.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class SNSViewController: UIViewController {
    
    var endImage:UIImage = UIImage()

    @IBOutlet var textView: UITextView!
    
    @IBOutlet var endImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endImageView.image = endImage

        // Do any additional setup after loading the view.
    }
    
    @IBAction func post(_ sender: Any) {
        
        do {
            
            let activityViewController = UIActivityViewController(activityItems: [endImage], applicationActivities: nil)
            present(activityViewController, animated: true,completion: nil)
            
        } catch let error {
            print(error)
        }
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
