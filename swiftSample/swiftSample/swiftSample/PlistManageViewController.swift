//
//  PlistManageViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 8. 9..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class PlistManageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myNewItemKey = "myNewItemKey"
        let myFirstItemKey = "myFirstItemKey"
        let mySecondItemKey = "mySecondItemKey"
        let myThirdItemKey = "myThirdItemKey"
        let myFourthItemKey = "myFourthItemKey"
        let myNonExistingKey = "myNonExistingKey"

        // plist에서 데이터를 읽어온다.
        print("-------------> The Value for Key '\(myNewItemKey)' actually exists. It is: \(PlistManager.sharedInstance.getValueForKey(myNewItemKey))")
        
        // plist의 데이터를 변경한다.
        PlistManager.sharedInstance.saveValue("Hello! Ann!", forKey: myNewItemKey)
        
        // 데이터가 변경되었는지 다시 확인한다.
        print("-------------> The Value for Key '\(myNewItemKey)' actually exists. It is: \(PlistManager.sharedInstance.getValueForKey(myNewItemKey))")
        
        // plist에 데이터를 추가한다.
        PlistManager.sharedInstance.addNewItemWithKey(myFirstItemKey, value: "Rebeloper")
        PlistManager.sharedInstance.addNewItemWithKey(mySecondItemKey, value: 17)
        PlistManager.sharedInstance.addNewItemWithKey(myThirdItemKey, value: true)
        
        // plist의 값을 변경한다.
        PlistManager.sharedInstance.saveValue(28, forKey: mySecondItemKey)
        
        if let mySecondItemKeyValue = PlistManager.sharedInstance.getValueForKey(mySecondItemKey) {
            print("-------------> The Value for Key '\(mySecondItemKey)' actually exists. It is: \(mySecondItemKeyValue)")
            /* Do anything with your value here */
        }
        
        // plist에 존재하지 않는 key의 value를 불러올 경우 실행하지 않기
        if let myNonExistingKeyValue = PlistManager.sharedInstance.getValueForKey(myNonExistingKey) {
            print("This 'print' will never be executed because there is no item with Key '\(myNonExistingKey)' therefore we can never unwrap the 'myNonExistingKeyValue' witch now is nil - '\(myNonExistingKeyValue)'")
            /* Do anything with your value here */
        }
        
        // 아래처럼 타입이 안맞을 경우 에러가 보인다.
        PlistManager.sharedInstance.saveValue("Alex", forKey: myThirdItemKey)
        
        PlistManager.sharedInstance.saveValue(true, forKey: myThirdItemKey)
        
        
        // 다른 타입도 저장할 수 있다.
        let dict = ["name": "John", "age": 34]
        PlistManager.sharedInstance.addNewItemWithKey(myFourthItemKey, value: dict)
        
        if let myFourthItemKeyValue = PlistManager.sharedInstance.getValueForKey(myFourthItemKey) {
            print("-------------> The Value for Key '\(myFourthItemKey)' actually exists. It is: \(myFourthItemKeyValue)")
        }
        
        // plist의 key를 삭제할수 있다.
        PlistManager.sharedInstance.removeItemForKey(myThirdItemKey)
        
        // plist의 모든 key를 삭제할 수 있다.
        PlistManager.sharedInstance.removeAllItemsFromPlist()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
