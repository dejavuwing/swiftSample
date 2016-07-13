//
//  NavigationWebViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 6..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class NavigationWebViewController: UIViewController, UIWebViewDelegate
{
    
    // 할당하고 초기화
    var myWebView: UIWebView = UIWebView()
    
    
    @IBOutlet weak var tooBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://m.nate.com")!))
        
        self.view.addSubview(myWebView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    

    
    
    
    

    
    
    
}