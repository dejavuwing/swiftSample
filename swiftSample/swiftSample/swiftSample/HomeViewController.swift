//
//  RootViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 6. 27..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var objectList: [String] = ["UI Object 기본 연동 (on View)",
                                "UI Object 기본 연동 (on Table)",
                                "UIAlertController"
    ]
    
    var objectDesc: [String] = ["기본 Viewd에서 Segmented Control, Slider, Switch 등의 처리 및 데이터 이동",
                                "기본 Table에서 Segmented Control, Slider, Switch 등의 처리 및 데이터 이동",
                                "다양한 alert view 및 데이터 처리"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // objectList의 전체 count를 반환한다.
        return self.objectList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // cell의 style과 이름을 정의한다.
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "ObjectListCell")
        
        // objectList와 objectDesc에서 indexPath.row에 해당하는 값을 가져온다.
        cell.textLabel?.text = self.objectList[indexPath.row]
        cell.detailTextLabel?.text = self.objectDesc[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        // 클릭된 테이블 열 번호에 따라 페이지를 이동시킨다.
        switch (indexPath.row)
        {
        case 0:
            self.performSegueWithIdentifier("goObjectView", sender: self)
        case 1:
            self.performSegueWithIdentifier("goObjectTable", sender: self)
        case 2:
            self.performSegueWithIdentifier("goAlertTable", sender: self)
        // switch 문에서는 default가 필수로 지정되어야 함.
        default:
            print("#\(indexPath.row)")
            return
        }
    }
    
}