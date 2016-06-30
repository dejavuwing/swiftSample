//
//  ObjectTableController.swift
//  swiftSample
//
//  Created by ngle on 2016. 6. 29..
//  Copyright © 2016년 ngle. All rights reserved.
//
//  Table View > Content: Static Cells / sections: 3 / Stype: Grouped
//  Table View Section > Rows: 3 / Header: My Second Settings
//

import UIKit

class ObjectTableController: UITableViewController {
    
    
    @IBOutlet weak var segmentedLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var stepperLabel: UILabel!
    
    // strong, weak
    // Strong 타입의 변수나 상수는 프로그램의 어느 곳에서도 더 이상 참조하지 않을 때 메모리에서 제거됨.
    // Weak 타입의 변수나 상수는 시스템이 임의로 메모리에서 제거할 수 있음. (간혹 변수나 상수에 저장해둔 값이 사라지는 형산이 발생할 수도 있음)
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    // slider는 minimum, maximum 값을 지정해야 한다. (기본이 minimum 0, maximum 1)
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
