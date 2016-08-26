//
//  WebViewTableController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 4..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class WebViewTableController: UITableViewController
{
    var webViewList: [String] = ["기본 Web View 구현",
                                 "내부 HTML 파일 불러오기",
                                 "웹 뷰 네이게이션"
    ]
    
    var webViewDesc: [String] = ["웹 불러오기 (기본): goBack, goForward, reload, stopLoading",
                                 "내부 home.html  파일 웹 뷰 구형",
                                 "땡겨서 refresh"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // return to whole count of pickerList
        return self.webViewList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // define to cell of style and name
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "WebViewListCell")
        
        cell.textLabel?.text = self.webViewList[indexPath.row]
        cell.detailTextLabel?.text = self.webViewDesc[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // move to page
        switch (indexPath.row)
        {
        case 0:
            self.performSegueWithIdentifier("goDefaultWebView", sender: self)
        case 1:
            self.performSegueWithIdentifier("goHtmlFileWebView", sender: self)
        case 2:
            self.performSegueWithIdentifier("goNaviWebView", sender: self)
        default:
            print("#\(indexPath.row)")
            return
        }
    }
    
}
