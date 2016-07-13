//
//  ActivityModalView2.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 6..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

public class ActivityModalview2 {
    
    var containerView: UIView = UIView()
    var loadingView: UIView = UIView()
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    public class var shared: ActivityModalview2
    {
        struct Static
        {
            static let instance: ActivityModalview2 = ActivityModalview2()
        }
        return Static.instance
    }

    /*
     Define UIColor from hex value
     
     @param rgbValue - hex color value
     @param alpha = transparency level
     */
    func UIColorFromHex(rgbValue: UInt32, alpha: Double=1.0) -> UIColor
    {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
    /**
     
     // Functions for showing activity indicator with text
     @param uiView – shows activity indicator in this view
     **/
    func showActivityIndicator(uiView: UIView) {
        
        containerView.frame = CGRectMake(0.0, 0.0, uiView.frame.size.width, 1400); // size for containerview
        containerView.clipsToBounds = true
        containerView.backgroundColor = UIColorFromHex(0xffffff, alpha: 0.3) // style for container view
        
        loadingView.frame = CGRectMake(0, 0, 300, 50)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 15
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50) // size of activity indicator view
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge // style of actiovity indicator view
        loadingView.addSubview(activityIndicator)
        
        let loadingLabel : UILabel = UILabel(frame: CGRect(x: 50, y: 0, width: 250, height: 50)) // Size of label near activity indicator view
        
        loadingLabel.textColor = UIColor.whiteColor() // style of label
        loadingView.addSubview(loadingLabel)
        loadingLabel.text = "Loading…" // text for label
        
        containerView.addSubview(loadingView)
        uiView.addSubview(containerView)
        activityIndicator.startAnimating()
    }
    
    /**
     Hide activity indicator
     @param uiView – remove activity indicator from this view
     */
    // Functions for activity indicator
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
    
}



