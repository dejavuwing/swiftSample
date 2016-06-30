//
//  ActivityTableController.swift
//  swiftSample
//
//  Created by ngle on 2016. 6. 29..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class ActivityTableController: UITableViewController {
    
    var activityList: [String] = ["기본 로딩 창",
                               "customized activity indicator with function"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activityList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ActivityindicatorListCell")
        
        cell.textLabel?.text = self.activityList[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.row)
        {
        case 0:
            self.performSegueWithIdentifier("goActivityindicaterView1", sender: self)
        case 1:
            self.performSegueWithIdentifier("goActivityindicaterView2", sender: self)
        default:
            return
        }
    }
}