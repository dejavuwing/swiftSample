//
//  ActivityIndicatorViewController1.swift
//  swiftSample
//
//  Created by ngle on 2016. 6. 30..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class ActivityIndicatorViewController1: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        activityIndicator.center = view.center
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



    @IBAction func startActivityIndicator(sender: UIButton) {
        
        activityIndicator.startAnimating()
    }

    @IBAction func stopActivityIndicator(sender: UIButton) {
        
        activityIndicator.stopAnimating()
    }

}
