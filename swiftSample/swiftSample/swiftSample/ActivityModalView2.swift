//
//  ActivityModalView2.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 6..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class ActivityModalview2: UIViewController
{
    /**
     
     // Functions for showing activity indicator with text
     @param uiView – shows activity indicator in this view
     **/
    func showActivityIndicator(uiView: UIView) -> UIView{
        let container: UIView = UIView()
        
        // Container view for adding an activity indicator view
        let loadingView: UIView = UIView()
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        
        container.frame = CGRectMake(0.0, 0.0, uiView.frame.size.width, 1400); // size for containerview
        container.clipsToBounds = true
        container.backgroundColor = UIColor.whiteColor() // style for container view
        
        loadingView.frame = CGRectMake(0, 0, 300, 50)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.redColor()
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 15
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50) // size of activity indicator view
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge // style of actiovity indicator view
        loadingView.addSubview(activityIndicator)
        
        let loadingLabel : UILabel = UILabel(frame: CGRect(x: 50, y: 0, width: 250, height: 50)) // Size of label near activity indicator view
        
        loadingLabel.textColor = UIColor.whiteColor() // style of label
        loadingView.addSubview(loadingLabel)
        loadingLabel.text = "Loading…" // text for label
        
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
        return container
    }
    
    /**
     Hide activity indicator
     @param uiView – remove activity indicator from this view
     */
    // Functions for activity indicator
    
    func hideActivityIndicator( container: UIView) {
        // activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
}



