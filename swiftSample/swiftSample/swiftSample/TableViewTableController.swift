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
                               "Json table view 2",
                               "Table Swipe 2",
                               "Table Index List",
                               "Table Search"
    ]
    
    var tableDesc: [String] = ["웹 연결 (http://www.reddit.com/.json)",
                               "Json 파일로 테이블 구성 ",
                               "테이블 셀을 밀어 버튼 노출",
                               "테이블 왼쪽 인덱스 리스트",
                               "테이블에서 검색하기"
        
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
        switch (indexPath.row) {
        case 0:
            self.performSegueWithIdentifier("goJsonTable1", sender: self)
        case 1:
            self.performSegueWithIdentifier("goJsonTable2", sender: self)
        case 2:
            self.performSegueWithIdentifier("goTableSwipe2", sender: self)
        case 3:
            self.performSegueWithIdentifier("goTableIndexList", sender: self)
        case 4:
            self.performSegueWithIdentifier("goTableSearch", sender: self)
        default:
            print("#\(indexPath.row)")
            return
        }
    }
    
}
