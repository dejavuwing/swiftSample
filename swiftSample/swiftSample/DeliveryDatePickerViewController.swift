//
//  goDeliveryDatePicker.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 4..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class DeliveryDatePickerViewController: UIViewController
{

    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var deliveryDelayPreset: UISegmentedControl!
    
    var delay: NSTimeInterval = 0.0
    var today = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDatePicker.datePickerMode = UIDatePickerMode.Time
        
        let currentDate = NSDate()
        myDatePicker.minimumDate = currentDate
        myDatePicker.date = currentDate
    }
    
    @IBAction func myDateView(sender: UIDatePicker)
    {
        printDate(delayTime())
    }
    
    
    @IBAction func deliveryDelayPreset(sender: UISegmentedControl)
    {
        let index = sender.selectedSegmentIndex
        let delayString: NSString = sender.titleForSegmentAtIndex(index)!
        
        delay = delayString.doubleValue * 60
        printDate(delayTime())
    }
    
    @IBAction func deliveryDate(sender: UISegmentedControl)
    {
        let index = sender.selectedSegmentIndex
        today = index == 0
        
        if today
        {
            myDatePicker.datePickerMode = .Time
        }
        else
        {
            myDatePicker.datePickerMode = .Date
        }
        
        printDate(delayTime())
    }
    
    
    func delayTime() -> NSDate
    {
        myDatePicker.minimumDate = NSDate()
        let pickerTime = myDatePicker.date
        
        print("pickerTime: \(pickerTime)")
        print("delay: \(delay)")
        print("pickerTime.dateByAddingTimeInterval(delay): \(pickerTime.dateByAddingTimeInterval(delay))")
        
        return pickerTime.dateByAddingTimeInterval(delay)
    }
    
    func printDate(date: NSDate)
    {
        let dateFormatter = NSDateFormatter()
        
        var theDateFormat = NSDateFormatterStyle.NoStyle
        
        if !today
        {
            theDateFormat = .ShortStyle
        }
        
        let theTimeFormat = NSDateFormatterStyle.ShortStyle
        
        dateFormatter.dateStyle = theDateFormat
        dateFormatter.timeStyle = theTimeFormat
        
        deliveryTimeLabel.text = "Delivered at " + dateFormatter.stringFromDate(date)
    }
    
    
    
}

