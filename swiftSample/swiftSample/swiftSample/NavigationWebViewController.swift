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
    
    // let viewUrl: String = "http://m.nate.com"
    let viewUrl: String = "https://www.youtube.com/user/EnglishLessons4U"
    
    @IBOutlet weak var tooBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string: viewUrl)!))
        
        self.view.addSubview(myWebView)
        addPullToRefreshToWebView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 땡겨서 refresh
    func addPullToRefreshToWebView(){
        let refreshController:UIRefreshControl = UIRefreshControl()
        
        refreshController.bounds = CGRectMake(0, 50, refreshController.bounds.size.width, refreshController.bounds.size.height)
        refreshController.addTarget(self, action: #selector(NavigationWebViewController.refreshWebView(_:)), forControlEvents: UIControlEvents.ValueChanged)
        refreshController.attributedTitle = NSAttributedString(string: "Pull down to refresh...")
        myWebView.scrollView.addSubview(refreshController)
        
    }
    
    func refreshWebView(refresh:UIRefreshControl){
        myWebView.reload()
        refresh.endRefreshing()
    }
    

    
    
    
    

    
    
    
}