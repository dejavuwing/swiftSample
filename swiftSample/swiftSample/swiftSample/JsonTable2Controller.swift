//
//  JsonTable2Controller.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 5..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

// Main.storyboard에서 Table View를 View Controller에 dataSource, delegate를 Outlets로 연결한다.
class JsonTable2Controller: UITableViewController {
    
    @IBOutlet weak var redditListTableView: UITableView!
    
    var tableData = []
    
    var deleteBookIndexPath: NSIndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로딩 이미지를 노출시킨다.
        ActivityModalView1.shared.showActivityIndicator(view)
        getJsonFile("reddit")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getJsonFile(fileName: String) {
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    let theJSON = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSMutableDictionary
                    if theJSON.count > 0 {
                        let results: NSArray = theJSON["data"]!["children"] as! NSArray
                        dispatch_async(dispatch_get_main_queue(), {
                            self.tableData = results
                            self.redditListTableView!.reloadData()
                        })
                    }
                }
                catch {}
            }
            catch {}
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "myJsonCell")
        let redditEntry: NSMutableDictionary = self.tableData[indexPath.row] as! NSMutableDictionary
        
        cell.textLabel?.text = redditEntry["data"]!["title"] as? String
        cell.detailTextLabel?.text = redditEntry["data"]!["author"] as? String
        
        // Cell을 보여주기 전에 로딩 이미지를 닫느다.
        ActivityModalView1.shared.hideActivityIndicator()
        
        return cell
    }
    

    // 왼쪽으로 셀을 슬라이드해서 editingStyle 만들기
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            deleteBookIndexPath = indexPath
            
            let redditEntry: NSMutableDictionary = self.tableData[indexPath.row] as! NSMutableDictionary
            let bookToDelete = redditEntry["data"]!["title"] as? String
            comfirmDelete(bookToDelete!)
        }
    }
    
    func comfirmDelete(book: String) {
        let alert = UIAlertController(title: "Delete Book", message: "Are you sure your want to permanently delete \(book)", preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDeleteBook)
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelDeleteBook)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        // Support display in ipad
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func handleDeleteBook(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deleteBookIndexPath {
            redditListTableView.beginUpdates()
            
            
            // tableData.removeAtIndex[indexPath.row]
            if var bookData = self.tableData as? Array<AnyObject> {
                bookData.removeAtIndex(indexPath.row)
                self.tableData = bookData
            }
            
            // Note that indexPath is wrapped in an array: [indexPath]
            redditListTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            deleteBookIndexPath = nil
            redditListTableView.endUpdates()
        }
    }
    
    func cancelDeleteBook(alertAction: UIAlertAction!) {
        deleteBookIndexPath = nil
    }
    
    
    
    
}