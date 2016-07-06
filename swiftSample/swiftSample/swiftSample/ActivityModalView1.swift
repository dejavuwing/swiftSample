//
//  ActivityModalView1.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 6..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import Foundation
import UIKit

public class ActivityModalView1 {
    
    var containerView: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    public class var shared: ActivityModalView1
    {
        struct Static
        {
            static let instance: ActivityModalView1 = ActivityModalView1()
        }
        return Static.instance
    }
    
    /*
     show customized activity indicator,
     actually add activity indicator to passing view
     
     @param uiView - add activity indicator to this view
     */
    public func showActivityIndicator(view: UIView)
    {
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor(hex: 0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRectMake(0, 0, 80, 80)
        loadingView.center = view.center
        loadingView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0)
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        activityIndicator.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.height / 2)
        activityIndicator.hidesWhenStopped = true
        
        loadingView.addSubview(activityIndicator)
        containerView.addSubview(loadingView)
        view.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its super view
     
     @param uiView = remove activity indicator from this view
     */
    func hideActivityIndicator()
    {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
    
    //// In order to show the activity indicator, call the function from your view controller
    //// ActivityModalView().showActivityIndicator(self.view)
    
    //// In order to hide the activity indicator, call the function from your view controller
    //// ActivityModalView().hideActivityIndicator(self.view)
    
}

extension UIColor
{
    convenience init(hex: UInt32, alpha: CGFloat)
    {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}