//
//  SnapViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 15..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

// draw a circle by UIView
extension UIView {
    func makeCircular() {
        let cntr: CGPoint = self.center
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.center = cntr
    }
}

// add Tap Gesture Recognizer from the Object library to the view controller.
class SnapViewController: UIViewController {
    
    var squareView: UIView!
    var circleView: UIView!
    var snap: UISnapBehavior!
    var animator: UIDynamicAnimator!
    
    
        // Tap Gesture Recognizer
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
        
        let tapPoint: CGPoint = sender.locationInView(view)
        
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        
        snap = UISnapBehavior(item: circleView, snapToPoint: tapPoint)
        animator.addBehavior(snap)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 파란색 정사각형을 만들고 화면에 보이게 한다.
        // squareView = UIView(frame: CGRect(x:100, y:100, width: 100, height: 100))
        // squareView.backgroundColor = UIColor.blueColor()
        // view.addSubview(squareView)
        
        // 원을 만들고 화면에 보이게 한다.
        circleView = UIView(frame: CGRect(x: 100, y: 100, width:100, height: 100))
        circleView.backgroundColor = UIColor.redColor()
        // circleView.makeCircular()
        view.addSubview(circleView)
        
        
        
        // 에니메이터를 생성한다.
        animator = UIDynamicAnimator(referenceView: view)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}