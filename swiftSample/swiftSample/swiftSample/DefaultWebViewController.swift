//
//  DefaultWebViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 6..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class DefaultWebViewController: UIViewController
{
    
    
    @IBOutlet weak var myWebView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://m.nate.com")
        let requestObj = NSURLRequest(URL: url!)
        
        myWebView.loadRequest(requestObj)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func doRefresh(sender: AnyObject) {
        myWebView.reload()
    }
    
    
    @IBAction func stop(sender: AnyObject) {
        myWebView.stopLoading()
    }
    
    
    @IBAction func goForward(sender: AnyObject) {
        myWebView.goForward()
    }
    
    
    @IBAction func goBack(sender: AnyObject) {
        myWebView.goBack()
    }
    
    
}