//
//  AlertViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 6. 29..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class AlertViewController: UITableViewController {
    
    var alertList: [String] = ["기본 Alert View",
                               "Two Button Alert View",
                               "Multi Alert View",
                               "Input Field가 있는 Alert View",
                               "Action Sheet",
                               "로그인 Alert 창",
                               "가입창 (sign up)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.alertList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "AlertListCell")
        
        cell.textLabel?.text = self.alertList[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.row)
        {
        case 0:
            alertwithCancle()
        case 1:
            alertTwoButton()
        case 2:
            alertWithMultiAction()
        case 3:
            alertWithInputField()
        case 4:
            alertActionSheet()
        case 5:
            alertLogin()
        case 6:
            alertSignup()
        default:
            return
        }
    }
    
    func alertwithCancle()
    {
        // 알림창 인스턴스를 생성한다.
        let alertController = UIAlertController(title: "UIAlertController", message: "UIAlertView was deprecated", preferredStyle: .Alert)
        
        let alertOK = UIAlertAction(title: "OK", style: .Default) { (action) in
            // 취소 클릭 후 실행될 코드
            print("OK!")
        }
        
        alertController.addAction(alertOK)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func alertTwoButton()
    {
        // 알림창 인스턴스를 생성한다.
        let alertController = UIAlertController(title: "Two Button", message: "Here is message!", preferredStyle: .Alert)
        
        let alertDestructive = UIAlertAction(title: "Destructive", style: .Default) { (action) in
            // 취소 클릭 후 실행될 코드
            print("tapped Default button")
        }
        
        let alertCancle = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // 클릭 시 실행될 코드
            print("tapped Cancel button")
        }
        
        alertController.addAction(alertDestructive)
        alertController.addAction(alertCancle)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func alertWithMultiAction()
    {
        // 알림창 인스턴스를 생성한다.
        let alertController = UIAlertController(title: "Multi Action", message: "액션 선택이 여러가지", preferredStyle: .Alert)
        
        // UIAlertActionStyle에는 Default, Cancel, Destructive가 있다.
        // .Default: Apply the default style to the action's button.
        // .Cancel: Apply a style that indicates the action cancels the operation and leaves things unchanged.
        // .Destructive: Apply a style that indicates the action might change or delete data.
        let alertAction1 = UIAlertAction(title: "Default button", style: .Default) { (action) in
            print("Default button tapped!")
        }
        
        let alertAction2 = UIAlertAction(title: "Cancel button", style: .Cancel) { (action) in
            print("Cancel button tapped!")
        }
        
        let alertAction3 = UIAlertAction(title: "Destructive button", style: .Destructive) { (action) in
            print("Destructive button tapped!")
        }
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        alertController.addAction(alertAction3)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func alertWithInputField()
    {
        var inputTextField: UITextField?
        
        // 알림창 인스턴스를 생성한다.
        // UIAlertControllerStykle에는 ActionSheet와 Alert가 있다.
        let alertController = UIAlertController(title: "Input Your Name", message: "이름을 입력 하세요.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let alertOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            // OK 버튼이 눌렸을때 처리할 코드
            print("input text is \(inputTextField?.text)")
            
        })
        
        let alertCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
            // Cancel 버튼이 눌렸을때 처리할 코드
        })
        
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        
        alertController.addTextFieldWithConfigurationHandler({ (textFild: UITextField!) -> Void in
            textFild.placeholder = "Input your name..,"
            inputTextField = textFild
        })
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func alertActionSheet()
    {
        // 알림창 인스턴스 생성
        let alertController = UIAlertController(title: nil, message: "UIAlertControllerStyle.ActionSheet", preferredStyle: .ActionSheet)
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
            // Cancel일 클릭될때 실행되는 코드
            print("tapped cancel")
        })
        
        let alertNotice1 = UIAlertAction(title: "첫 번째 공지입니다.", style: .Default, handler: { (action) -> Void in
            // 클릭되었을때 실행되는 코드
            print("fierst notice")
        })
        
        let alertNotice2 = UIAlertAction(title: "두 번째 공지입니다.", style: .Default, handler: { (action) -> Void in
            // 클릭되었을 때 실행되는 코드
            print("second notice")
        })
        
        let alertNotice3 = UIAlertAction(title: "홈 페이지 이동", style: .Default, handler: { (action) -> Void in
            // 클릭되었을 때 실행되는 코드
            print("go Home")
        })
        
        alertController.addAction(alertCancel)
        alertController.addAction(alertNotice1)
        alertController.addAction(alertNotice2)
        alertController.addAction(alertNotice3)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func alertLogin()
    {
        var loginTextField: UITextField?
        var passwordTextField: UITextField?
        
        // 알림창 인스턴스를 생성한다.
        let alertController = UIAlertController(title: "Login", message: "로그인 하세요.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let loginAction = UIAlertAction(title: "Login", style: .Default, handler: { (action) -> Void in
            let loginTextField = alertController.textFields![0] as UITextField
            let passwordTextField = alertController.textFields![1] as UITextField
            
            print(loginTextField.text, passwordTextField.text)
        })
        
        let alertForget = UIAlertAction(title: "Forgot password", style: .Destructive, handler: { (action) -> Void in
            // 클릭되었을때 실행되는 코드
            print("I forgot my password.")
        })
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
            // 클릭되었을 때 실행되는 코드
            print("canceled login")
        })
        
        alertController.addTextFieldWithConfigurationHandler({ (textField) in
            loginTextField = textField
            loginTextField?.placeholder = "User Id"
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) in
                loginAction.enabled = textField.text != ""
            })
        })
        
        alertController.addTextFieldWithConfigurationHandler({ (textField) in
            passwordTextField = textField
            passwordTextField?.placeholder = "Password"
            passwordTextField?.secureTextEntry = true
        })
        
        alertController.addAction(loginAction)
        alertController.addAction(alertForget)
        alertController.addAction(alertCancel)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func alertSignup()
    {
        var loginTextField: UITextField?
        var passwordTextField: UITextField?
        var passwordComfirmationTextField: UITextField?
        
        // 알림창 인스턴스를 생성한다.
        let alertController = UIAlertController(title: "Login", message: "로그인 하세요.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let loginAction = UIAlertAction(title: "Sign Up", style: .Default, handler: { (action) -> Void in
            let loginTextField = alertController.textFields![0] as UITextField
            let passwordTextField = alertController.textFields![1] as UITextField
            let passwordComfirmationTextField = alertController.textFields![2] as UITextField
            
            print(loginTextField.text, passwordTextField.text, passwordComfirmationTextField.text)
        })
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
            // 클릭되었을 때 실행되는 코드
            print("canceled login")
        })
        
        // Text Field 추가 (User ID)
        alertController.addTextFieldWithConfigurationHandler({ (textField) in
            loginTextField = textField
            loginTextField?.placeholder = "Email"
            loginTextField?.keyboardType = .EmailAddress
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) in
                loginAction.enabled = textField.text != ""
            })
        })
        
        // Text Field 추가 (password)
        alertController.addTextFieldWithConfigurationHandler({ (textField) in
            passwordTextField = textField
            passwordTextField?.placeholder = "Password"
            passwordTextField?.secureTextEntry = true
        })
        
        // Text Field 추가 (password comfirmation)
        alertController.addTextFieldWithConfigurationHandler({ (textField) in
            passwordComfirmationTextField = textField
            passwordComfirmationTextField?.placeholder = "Password Confirmation"
            passwordComfirmationTextField?.secureTextEntry = true
        })
        
        alertController.addAction(loginAction)
        alertController.addAction(alertCancel)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
}
