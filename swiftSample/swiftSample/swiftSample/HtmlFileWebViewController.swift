//
//  HtmlFileWebViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 6..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class HtmlFileWebViewController: UIViewController
{
    
    
    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let localfilePath = NSBundle.mainBundle().URLForResource("home", withExtension: "html")
        let requestObj = NSURLRequest(URL: localfilePath!)
        
        myWebView.loadRequest(requestObj)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}