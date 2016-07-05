//
//  FormattingPickerViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 4..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class FormattingPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    
    
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myPickerLabel: UILabel!
    
    let pickerData: [String] = ["Mozzarella",
                                "Gorgonzola",
                                "Provolone",
                                "Brie",
                                "Maytag Blue",
                                "Sharp Cheddar",
                                "Monterrey Jack",
                                "Stilthon",
                                "Gouda",
                                "Goat Chees",
                                "Asiago"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myPicker.dataSource = self
        self.myPicker.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myPickerLabel.text = pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!, NSForegroundColorAttributeName:UIColor.blueColor()])
        
        return myTitle
    }
    
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!, NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel.attributedText = myTitle
        
        // color and center the label's background
        let hue = CGFloat(row)/CGFloat(pickerData.count)
        pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        pickerLabel.textAlignment = .Left
        
        return pickerLabel
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 56.0
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 300
    }
    
    
}