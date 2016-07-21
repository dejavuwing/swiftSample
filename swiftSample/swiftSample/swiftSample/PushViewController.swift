//
//  PushViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 18..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class PushViewController: UIViewController {
    
    var redSquareView: UIView!
    var blueSquareView: UIView!
    var animator: UIDynamicAnimator!
    
    /*
     Continuous push will apply a magnitude to the view for the duration of the push.
     This means that the view will accelerate because more energy is continually being
     added to it. With instantaneous push, the push happens only once, and so the view
     does not accelerate as it keeps on moving.
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSquareView = UIView(frame: CGRect(x: 40, y: 100, width: 50, height: 50))
        redSquareView.backgroundColor = UIColor.redColor()
        view.addSubview(redSquareView)
        
        blueSquareView = UIView(frame: CGRect(x: 220, y: 100, width: 50, height: 50))
        blueSquareView.backgroundColor = UIColor.blueColor()
        view.addSubview(blueSquareView)
        
        let continuousPush: UIPushBehavior = UIPushBehavior(items: [redSquareView], mode: UIPushBehaviorMode.Continuous)
        let instantaneousPush: UIPushBehavior = UIPushBehavior(items: [blueSquareView], mode: UIPushBehaviorMode.Instantaneous)
        
        continuousPush.setAngle(CGFloat(M_PI_2), magnitude: 0.3)
        instantaneousPush.setAngle(CGFloat(M_PI_2), magnitude: 0.3)
        
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(continuousPush)
        animator.addBehavior(instantaneousPush)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}