//
//  ObjectViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 6. 28..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class ObjectViewController: UIViewController {
    
    @IBOutlet weak var segmentedLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var textfieldLabel: UILabel!
    
    // strong, weak
    // Strong 타입의 변수나 상수는 프로그램의 어느 곳에서도 더 이상 참조하지 않을 때 메모리에서 제거됨.
    // Weak 타입의 변수나 상수는 시스템이 임의로 메모리에서 제거할 수 있음. (간혹 변수나 상수에 저장해둔 값이 사라지는 형산이 발생할 수도 있음)
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    // slider는 minimum, maximum 값을 지정해야 한다. (기본이 minimum 0, maximum 1)
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var myTextfield: UITextField!
    
    override func viewDidLoad() {
        // 부모 클레스에 정의되어 있는 viewDidLoad 메쏘드를 실행하다.
        super.viewDidLoad()
        
        // myStepper 초기 설정
        myStepper.wraps = true
        myStepper.autorepeat = true
        myStepper.maximumValue = 100
        
        // wraps : If set to true stepping beyound maximumvalue will return to minimumvalue.
        // autorepeat : If set to true, the user pressing and holding on the stepper repeatedly alters value.
        // maximumvalue : the maximum value of the steppers
        
    }
    
    override func didReceiveMemoryWarning() {
        // didReceiveMemoryWarning: 메모리가 부족할 때 시스템에서 자동으로 호출해주는 메소드
        super.didReceiveMemoryWarning()
    }
    
    // 키보드가 올라온 후 화면을 터치하면 키보드가 내려가게 한다.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func changeSegmentedLabel(sender: UISegmentedControl)
    {
        // segmented controler의 변경값은 selectedSegmentIndex로 가져온다.
        let segmentedText = "changed to \(mySegmentedControl.selectedSegmentIndex)"
        segmentedLabel.text = segmentedText
    }
    
    @IBAction func changeSliderLable(sender: UISlider) {
        
        let currentValue = Int(sender.value)
        sliderLabel.text = "changed to \(currentValue)"
    }
    
    
    @IBAction func changeSwitchLabel(sender: UISwitch) {
        if mySwitch.on
        {
            switchLabel.text = "changed to on"
            // mySwitch.setOn(false, animated: true)
        }
        else {
            switchLabel.text = "changed to off"
            // mySwitch.setOn(true, animated: true)
        }
    }
    
    
    @IBAction func changeStepperLabel(sender: UIStepper) {
        
        let currentValue = Int(sender.value).description
        stepperLabel.text = "changed to \(currentValue)"
    }
    
    
    // segue 방식 화면 전환에서의 데이터 이동
    // segue가 실행되기 전 준비하는 메소드
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let rvc = segue.destinationViewController as? ObjectViewResultController
        {
            rvc.valueSegmentControl = self.mySegmentedControl.selectedSegmentIndex
            rvc.valueSlider = self.mySlider.value
            rvc.valueSwitch = self.mySwitch.on
            rvc.valueStepper = self.myStepper.value
            rvc.valueTextfield = self.myTextfield.text!
        }
    }
    
    @IBAction func onSubmit(sender: UIButton) {
        
        // segue 실행
        performSegueWithIdentifier("goObjectResultView", sender: self)
    }
    
}
