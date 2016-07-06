//
//  JsonTable1Controller.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 5..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

// Main.storyboard에서 Table View를 View Controller에 dataSource, delegate를 Outlets로 연결한다.
class JsonTable1Controller: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var redditListTableView: UITableView!
    
    var tableData = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 로딩 이미지를 노출시킨다.
        ActivityModalView1.shared.showActivityIndicator(view)
        getRedditJson("http://www.reddit.com/.json")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getRedditJson(whitchReddit: String)
    {
        let mySession = NSURLSession.sharedSession()
        let url: NSURL = NSURL(string: whitchReddit)!
        
        
        let networkTask = mySession.dataTaskWithURL(url) { (data, response, error) -> Void in
            if error != nil
            {
                print("Fetch Failed: \(error?.localizedDescription)")
            }
            else
            {
                if let data = data
                {
                    do
                    {
                        let theJSON = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSMutableDictionary
                        if theJSON.count > 0
                        {
                            let results: NSArray = theJSON["data"]!["children"] as! NSArray
                            dispatch_async(dispatch_get_main_queue(), {
                                self.tableData = results
                                self.redditListTableView!.reloadData()
                            })
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
        
        }

        networkTask.resume()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "myJsonCell")
        let redditEntry: NSMutableDictionary = self.tableData[indexPath.row] as! NSMutableDictionary
        
        cell.textLabel?.text = redditEntry["data"]!["title"] as? String
        cell.detailTextLabel?.text = redditEntry["data"]!["author"] as? String
        
        // Cell을 보여주기 전에 로딩 이미지를 닫느다.
        ActivityModalView1.shared.hideActivityIndicator()
        
        return cell
    }
    
    
    
    
}