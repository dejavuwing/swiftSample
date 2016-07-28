//
//  GravityAndCollisionViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 15..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class GravityAndCollisionViewController: UIViewController {
    
    
    var redSquareView: UIView!
    var blueSquareView: UIView!
    
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    
    var itemBehaviour: UIDynamicItemBehavior!
    var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 빨간색 정사각형을 만들고 화면에 보이게 한다.
        redSquareView = UIView(frame: CGRect(x:40, y:100, width: 50, height: 50))
        redSquareView.backgroundColor = UIColor.redColor()
        view.addSubview(redSquareView)
        
        // 파란색 정사각형을 만들고 화면에 보이게 한다.
        blueSquareView = UIView(frame: CGRect(x:220, y:100, width: 50, height: 50))
        blueSquareView.backgroundColor = UIColor.blueColor()
        view.addSubview(blueSquareView)
        
        // 에니메이터를 생성한다.
        animator = UIDynamicAnimator(referenceView: view)
        
        // 정사각형에 중력을 적용하고 움직이게 한다.
        gravity = UIGravityBehavior(items: [redSquareView, blueSquareView])
        
        // 빨간색 정사각형에 탄성 부여
        itemBehaviour = UIDynamicItemBehavior(items: [redSquareView])
        itemBehaviour.elasticity = 0.7
        
        animator.addBehavior(gravity)
        animator.addBehavior(itemBehaviour)
        
        // 정사각형에 충돌을 적용하고 움직이게 한다. (외각에 닿으면 바운드한다.)
        collision = UICollisionBehavior(items: [redSquareView, blueSquareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        // If you want to define your own boundaries, you can use the addBoundaryWithIdentifier method to set the bounds
        // collision.addBoundaryWithIdentifier("barrier", fromPoint: CGPointMake(self.view.frame.origin.x, 350), toPoint: CGPointMake(self.view.frame.origin.x + self.view.frame.width, 350))
        animator.addBehavior(collision)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}