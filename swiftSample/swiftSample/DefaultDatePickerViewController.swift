//
//  DefaultDatePickerViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 4..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class DefaultDatePickerViewController: UIViewController
{
    
    @IBOutlet weak var myDatePickerLabel: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 페이지 로딩 시 Label에 오늘 날짜 표시
        updateDate()
    }
    
    @IBAction func datePickerAction(sender: UIDatePicker)
    {
        updateDate()
    }
    
    func updateDate()
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.myDatePickerLabel.text = strDate
    }
    
}