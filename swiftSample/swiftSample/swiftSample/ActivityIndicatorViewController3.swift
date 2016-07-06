//
//  ActivityIndicatorViewController3.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 6..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicatorViewController3: UIViewController
{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loadingStart(sender: UIButton) {
        
        ActivityModalView1.shared.showActivityIndicator(view)
        setCloseTimer()
    }
    
    func close()
    {
        ActivityModalView1.shared.hideActivityIndicator()
    }
    
    func setCloseTimer()
    {
        _ = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(ActivityIndicatorViewController3.close), userInfo: nil, repeats: false)
    }
    
    
    
    
    
}
