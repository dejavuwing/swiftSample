//
//  JsonTableController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 29..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class JsonTableController: UITableViewController {
    
    var tableList: [String] = ["default Json Table",
                               "Plist Manager"
    ]
    
    var tableDesc: [String] = ["json 데이터를 이용한 기본 테이블 뷰",
                               "Plist 파일 다루기"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블 로딩 시 선택하게 할 Cell 지정
        let rowToselect: NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.selectRowAtIndexPath(rowToselect, animated: false, scrollPosition: UITableViewScrollPosition.None)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 출력하려는 테이블의 전체 Row 수를 리턴한다.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // cell의 style과 이름을 정의한다.
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "jsonListCell")
        
        // tableList와 tableDesc에서 indexPath.row에 해당하는 값을 가져온다.
        cell.textLabel?.text = self.tableList[indexPath.row]
        cell.detailTextLabel?.text = self.tableDesc[indexPath.row]
        
        return cell
    }
    
    // table의 cell을 눌렀을때 처리
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.row) {
        case 0:
            self.performSegueWithIdentifier("goDefaultJsomTableController", sender: self)
        case 1:
            self.performSegueWithIdentifier("goPlistManager", sender: self)
        default:
            print("#\(indexPath.row)")
            return
        }
    
    }
}
