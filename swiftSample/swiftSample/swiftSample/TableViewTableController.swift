//
//  TableViewTableController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 5..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class TableViewTableController: UITableViewController
{
    
    var tableList: [String] = ["Json table view 1",
                               "Json table view 2"
    ]
    
    var tableDesc: [String] = ["http://www.reddit.com/.json",
                               "http://www.kaleidosblog.com/tutorial"
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rowToselect: NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.selectRowAtIndexPath(rowToselect, animated: true, scrollPosition: UITableViewScrollPosition.None)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // objectList의 전체 count를 반환한다.
        return self.tableList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // cell의 style과 이름을 정의한다.
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "TableListCell")
        
        // objectList와 objectDesc에서 indexPath.row에 해당하는 값을 가져온다.
        cell.textLabel?.text = self.tableList[indexPath.row]
        cell.detailTextLabel?.text = self.tableDesc[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        // 클릭된 테이블 열 번호에 따라 페이지를 이동시킨다.
        switch (indexPath.row)
        {
        case 0:
            self.performSegueWithIdentifier("goJsonTable1", sender: self)
        case 1:
            self.performSegueWithIdentifier("goJsonTable2", sender: self)
        // switch 문에서는 default가 필수로 지정되어야 함.
        default:
            print("#\(indexPath.row)")
            return
        }
    }
    
}
