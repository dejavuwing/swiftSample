//
//  ImagePickerwithCameraController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 13..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerwithCameraController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
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
    
    
    // PickerView Delegate Methods
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
    
    func openCamera() {
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        else {
            let alertWarning = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .Alert)
            let alertOK = UIAlertAction(title: "OK", style: .Default) {
                (action) in
            }
            
            alertWarning.addAction(alertOK)
            presentViewController(alertWarning, animated: true, completion: nil)
        }
    }
    
    func openGallary() {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    
    @IBAction func selectImageBtn(sender: UIButton) {
        
        // 알림창 인스턴스 생성
        let alertController = UIAlertController(title: nil, message: "Choose Image", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            UIAlertAction in
        }
        
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) {
            UIAlertAction in
            self.openCamera()
        }
        
        let gallaryAction = UIAlertAction(title: "Gallary", style: .Default) {
            UIAlertAction in
            self.openGallary()
        }
        
        alertController.addAction(cameraAction)
        alertController.addAction(gallaryAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)

    }

}