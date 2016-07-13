//
//  TableSwipe2Controller.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 13..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class TableSwipe2Controller: UITableViewController {
    
    @IBOutlet var bookTableView: UITableView!
    
    var tableData = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Json 파일이름으로 데이터를 가져온다.
    func getJsonFile(fileName: String) -> NSMutableDictionary {
        var theJSON = NSMutableDictionary()
        
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    theJSON = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSMutableDictionary
                    
                }
                catch {}
            }
            catch {}
        }
        return theJSON
    }
    
    // Json 데이터를 불러와 테이블에 넣는다.
    func setTableData() {
        let jsonData = getJsonFile("reddit")
        
        if jsonData.count > 0 {
            let results: NSArray = jsonData["data"]!["children"] as! NSArray
            dispatch_async(dispatch_get_main_queue(), {
                self.tableData = results
                self.bookTableView!.reloadData()
            })
        }
        else {
            print("data empty!")
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "myJsonCell")
        let bookEntry: NSMutableDictionary = self.tableData[indexPath.row] as! NSMutableDictionary
        
        cell.textLabel?.text = bookEntry["data"]!["title"] as? String
        cell.detailTextLabel?.text = bookEntry["data"]!["author"] as? String

        return cell
    }
    
    // 테이블 셀을 옆으로 밀었을때 버튼 노출
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .Normal, title: "More") { action, index in
            print("#\(indexPath.row) more button tapped")
        }
        more.backgroundColor = UIColor.lightGrayColor()
        
        let favorite = UITableViewRowAction(style: .Normal, title: "favorite") { action, index in
            print("#\(indexPath.row) favorite button tapped")
        }
        favorite.backgroundColor = UIColor.orangeColor()
        
        let share = UITableViewRowAction(style: .Normal, title: "share") { action, index in
            print("#\(indexPath.row) share button tapped")
        }
        share.backgroundColor = UIColor.blueColor()
        
        return [share, favorite, more]
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the Cells you would like the actions to appear needs to be editable
        // return false일 경우 테이블 셀을 옆으로 밀지 못한다.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // you need to implement this method too or you can't swipe to display the actions
    }
    
    
    
    
}