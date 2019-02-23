//
//  MangaViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/02/03.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class MangaViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var runnerimageView: UIImageView!
    
    @IBOutlet var runButton: UIButton!
    
    var imageArray = [UIImage]()
    
    var timer1 = Timer()
    
    var timer2 = Timer()
    
    var countUp = 0
    
    var updateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countLabel.text = "0"
        let image0 = UIImage(named:"dash0.png")
        let image1 = UIImage(named:"dash1.png")
        let image2 = UIImage(named:"dash2.png")
        let image3 = UIImage(named:"dash3.png")
        let image4 = UIImage(named:"dash4.png")
        let image5 = UIImage(named:"dash5.png")
    
    imageArray = [image0!,image1!,image2!,image3!,image4!,image5!]
        
    }
    
    @IBAction func run(_ sender: Any) {
        runButton.isEnabled = false
        
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.countUp = self.countUp + 1
            self.countLabel.text = String(self.countUp)
            
        })
        
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            
            if (self.updateCount > 5) {
            
            self.updateCount = 0
            self.runnerimageView.image = UIImage(named: "dash0.png")
            
            }
            else{
                
                self.runnerimageView.image = self.imageArray[self.updateCount]
            }
            self.updateCount = self.updateCount + 1
            
            
        })
    }
    
    @IBAction func stop(_ sender: Any) {
        runButton.isEnabled = true
        
        timer1.invalidate()
        timer2.invalidate()
    }

}
