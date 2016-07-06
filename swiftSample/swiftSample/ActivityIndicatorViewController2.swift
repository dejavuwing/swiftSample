//
//  ActivityIndicatorViewController2.swift
//  swiftSample
//
//  Created by ngle on 2016. 6. 30..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class ActivityIndicatorViewController2: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func startActivityIndicator(sender: UIButton) {
        ActivityModalView().showActivityIndicator(self.view)
    }
    
    
    @IBAction func endActivityIndicator(sender: UIButton) {
        ActivityModalView().hideActivityIndicator(self.view)
        
    }
    
    
    
}
