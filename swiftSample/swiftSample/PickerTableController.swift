//
//  PickerTableController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 4..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class PickerTableController: UITableViewController
{
    var pickerList: [String] = ["기본 Picker 구현",
                                "두 개의 Picker 구현",
                                "다양한 Format으로 Picker 구현",
                                "기본 Date Picker 구현",
                                "날짜 계산 (DatePicker)"
    ]
    
    var pickerDesc: [String] = ["Picker선택 후 change for background color",
                                "피자 주문하기",
                                "Formatting a UIPickerView",
                                "날짜 선택 기본 구현",
                                "delivery 날짜 계산"
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
        return self.pickerList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // define to cell of style and name
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "PickerListCell")
        
        cell.textLabel?.text = self.pickerList[indexPath.row]
        cell.detailTextLabel?.text = self.pickerDesc[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // move to page
        switch (indexPath.row)
        {
        case 0:
            self.performSegueWithIdentifier("goDefaultPicker", sender: self)
        case 1:
            self.performSegueWithIdentifier("goPizzaPicker", sender: self)
        case 2:
            self.performSegueWithIdentifier("goFormattingPicker", sender: self)
        case 3:
            self.performSegueWithIdentifier("goDatePicker", sender: self)
        case 4:
            self.performSegueWithIdentifier("goDeliveryDatePicker", sender: self)
        default:
            print("#\(indexPath.row)")
            return
            
        }
    }
    
}
