//
//  ObjectViewResultController.swift
//  swiftSample
//
//  Created by ngle on 2016. 6. 28..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class ObjectViewResultController: UIViewController {
    
    
    @IBOutlet weak var mySegmentedControl: UILabel!
    @IBOutlet weak var mySlider: UILabel!
    @IBOutlet weak var mySwitch: UILabel!
    @IBOutlet weak var myStepper: UILabel!
    @IBOutlet weak var myTextfield: UILabel!
    
    
    @IBOutlet weak var resultSegmentControl: UILabel!
    @IBOutlet weak var resultSlider: UILabel!
    @IBOutlet weak var resultSwitch: UILabel!
    @IBOutlet weak var resultStepper: UILabel!
    @IBOutlet weak var resultTextfield: UILabel!
    
    // 결과값을 전달받을 변수 선언
    var valueSegmentControl : Int = 0
    var valueSlider : Float = 0
    var valueSwitch : Bool = false
    var valueStepper : Double = 0
    var valueTextfield : String = ""
    
    // 화면이 메모리에 로드되고 난 후 실행되는 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultSegmentControl.text = "is \(self.valueSegmentControl)"
        self.resultSlider.text = "is \(self.valueSlider)"
        self.resultSwitch.text = "is \(self.valueSwitch)"
        self.resultStepper.text = "is \(self.valueStepper)"
        self.resultTextfield.text = "is \"\(self.valueTextfield)\""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
