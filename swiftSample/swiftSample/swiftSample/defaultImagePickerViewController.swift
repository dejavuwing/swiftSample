//
//  defaultImagePickerViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 13..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class defaultImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 딜리게이트 지정
        imagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // 이미지 선택
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickerImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ImageView.contentMode = .ScaleAspectFit
            ImageView.image = pickerImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 이미지 선택창 닫기
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func loadImageBtnTapped(sender: UIButton) {
        
        // 수정 기능 옵션
        imagePicker.allowsEditing = false
        
        // 사진 라이브러리 선택
        imagePicker.sourceType = .PhotoLibrary
        
        // 화면에 표시
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    
}