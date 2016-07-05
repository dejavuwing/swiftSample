//
//  PizzaPickerViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 4..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class PizzaPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myOrder: UILabel!
    
    enum pickerComponent: Int
    {
        case size = 0
        case topping = 1
    }
    
    let pickerData = [
        ["10\"", "14\"", "18\"", "24\""],
        ["Cheese", "Pepperoni", "Sausage", "Veggie", "BBQ", "Chicken"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myPicker.delegate = self
        self.myPicker.dataSource = self
        
        // 페이지 로딩 이후 Picker와 Order text가 맞지 않는 것을 보완한다. (picker 기본 선택값 설정)
        self.myPicker.selectRow(2, inComponent: pickerComponent.size.rawValue, animated: false)
        updateOrder()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateOrder()
    }
    
    func updateOrder()
    {
        let sizeComponent = pickerComponent.size.rawValue
        let toppingComponent = pickerComponent.topping.rawValue
        
        let size = pickerData[sizeComponent][myPicker.selectedRowInComponent(sizeComponent)]
        let topping = pickerData[toppingComponent][myPicker.selectedRowInComponent(toppingComponent)]
        
        myOrder.text = "Pizza: " + size + " " + topping
    }
    
    
}