//
//  DropboxAPIListController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 25..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit
import SwiftyDropbox

class DropboxAPIListController: UITableViewController {
    
    var tableList: [String] = ["dropbox file edit",
                               "Dropbox 파일 다운로드"
    ]
    
    var tableDesc: [String] = ["dropbox의 텍스트 파일을 수정한다.",
                               "파일 다운로드와 프로그래스"
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
            self.performSegueWithIdentifier("goDropboxFileEdit", sender: self)
        case 1:
            self.performSegueWithIdentifier("goDownloadProgress", sender: self)
        default:
            print("#\(indexPath.row)")
            return
        }
    }
    
    // Dropbox 인증 확인
    // https://www.dropbox.com/developers/documentation/swift
    
    func isAuthorizeDropbox() {
        //Dropbox.authorizeFromController(self)
        DropboxAuthManager.sharedAuthManager.authorizeFromController(self)
    }
    
}

