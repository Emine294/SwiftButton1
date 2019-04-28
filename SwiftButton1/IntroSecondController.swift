//
//  IntroSecondController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/04/27.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit
import PGEZTransition

class IntroSecondController: UIViewController {
    
    @IBOutlet var transformView: PGTransformView!
    
    @IBOutlet var title1: PGTransformLabel!
    
    @IBOutlet var title2: PGTransformLabel!
    
    @IBOutlet var image1: PGTransformImageView!
    
    @IBOutlet var menuView: PGTransformView!
    
    @IBOutlet var jumpButton: UIButton!
    
    @IBOutlet var nextButton: UIButton!
    
    private var transition:PGTransformPushTransition!
    
    private lazy var nextVc:IntroThirdController = {
        
        return UIStoryboard.init(name: "Main",bundle:nil).instantiateViewController(withIdentifier: "IntroThirdController") as! IntroThirdController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitionSetUp()
    }
    
    
    @IBAction func onNext(_ sender: Any) {
        
        self.transition.showTransformViewController()
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension IntroSecondController{
    
    func transitionSetUp(){
        
        self.transition = PGTransformPushTransition.init(target: self, showing: self.nextVc)
        
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
