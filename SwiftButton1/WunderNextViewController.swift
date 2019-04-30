//
//  WunderNextViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/04/29.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class WunderNextViewController: UIViewController ,UITextViewDelegate,UIDocumentInteractionControllerDelegate{
    
    lazy private var documentInteractionController = UIDocumentInteractionController()
    
    var selectedNumber:Int = 0

    @IBOutlet var textView: UITextView!
    
    var screenShotImage:UIImage = UIImage()
    
    var titleArray:Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "array") != nil{
            
            titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
            
            textView.text = titleArray[selectedNumber]
        }
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if textView.isFirstResponder{
            textView.resignFirstResponder()
        }
    }
    
    func takeScreenshot(){
        
        let rect = CGRect(x: textView.frame.origin.x, y: textView.frame.origin.y, width: textView.frame.width, height: textView.frame.height)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        textView.drawHierarchy(in: rect, afterScreenUpdates: true)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
    }
    
    
    @IBAction func shareLINE(_ sender: Any) {
        
        takeScreenshot()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            let pastBoard: UIPasteboard = UIPasteboard.general
            
            pastBoard.setData(self.screenShotImage.jpegData(compressionQuality: 0.75)!, forPasteboardType: "public.png")
            
            let lineUrlString: String = String(format: "line://msg/image/%@", pastBoard.name as CVarArg)
            
            UIApplication.shared.open(NSURL(string: lineUrlString)! as URL)
            
        }
    }
    
    
}
