
//
//  IntroThirdController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/04/27.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit
import PGEZTransition

class IntroThirdController: UIViewController {
    
    @IBOutlet var transformView: PGTransformView!
    
    @IBOutlet var title1: PGTransformLabel!
    
    @IBOutlet var title2: PGTransformLabel!
    
    @IBOutlet var image1: PGTransformImageView!
    
    @IBOutlet var nextButton: UIButton!
    
    private var transition:PGTransformPushTransition!
    
    lazy var alert:UIAlertController = {
        
        let alert = UIAlertController.init(title: nil, message: "始めましょう", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitionSetUp()
    }
    
    
    @IBAction func onNext(_ sender: Any) {
        
        self.present(self.alert, animated: true, completion: nil)
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension IntroThirdController{
    
    func transitionSetUp(){
        
        transformView
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndAlpha(0.0, start: 0.0, duration: 1.0)
        
        image1
            .setStartTransform(.rateX(1.0), start: 0.0, duration: 1.0)
            .setStartAlpha(1.0, start: 0.0, duration: 1.0)
            .setEndTransform(.rateX(-1.0), start: 0.0, duration: 1.0)
            .setEndAlpha(1.0, start: 0.0, duration: 1.0)
        
        title1
            .setStartTransform(.rateX(1.0), start: 0.0, duration: 1.0)
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndTransform(.rateX(-1.0), start: 0.0, duration: 1.0)
            .setEndAlpha(1.0, start: 0.0, duration: 0.3)
        
        title2
            .setStartTransform(.rateX(1.0), start: 0.0, duration: 1.0)
            .setStartAlpha(0.0, start: 0.0, duration: 1.0)
            .setEndTransform(.rateX(-1.0), start: 0.0, duration: 1.0)
            .setEndAlpha(0.0, start: 0.0, duration: 0.3)
        
    }
}
