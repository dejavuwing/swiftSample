//
//  DefaultPickerViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 4..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class DefaultPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    
    // 먼저 Picker 오브젝트의 datasource와 delegater를 ViewController에 연결한다.
    @IBOutlet weak var defaultPicker: UIPickerView!
    
    
    var pickerDataSource: [String] = ["White", "Red", "Green", "Blue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defaultPicker.dataSource = self
        self.defaultPicker.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        // The numberOfComponentsInPickerView method used for the number of columns in the picker element.
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // The numberOfRowsInComponent method used for the number of rows of data in the UIPickerView element so we return the array count.
        return pickerDataSource.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // The pickerView:titleForRow:forComponent: method used for the data for a specific row and specific component.
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch (row)
        {
        case 0:
            self.view.backgroundColor = UIColor.whiteColor()
        case 1:
            self.view.backgroundColor = UIColor.redColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        case 3:
            self.view.backgroundColor = UIColor.blueColor()
        default:
            self.view.backgroundColor = UIColor.whiteColor()
            return
            
        }
    }
    
    
    
}