//
//  ImagePickerTableController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 13..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerTableController: UITableViewController
{
    var ImagePickerList: [String] = ["Image Picker",
                                     "with Camera"
    ]
    
    var ImagePickerDesc: [String] = ["기본 이미지 픽커",
                                     "카메라 불러오기와 겔러리 보기"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // return to whole count of pickerList
        return self.ImagePickerList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // define to cell of style and name
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "imagePickerListCell")
        
        cell.textLabel?.text = self.ImagePickerList[indexPath.row]
        cell.detailTextLabel?.text = self.ImagePickerDesc[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // move to page
        switch (indexPath.row)
        {
        case 0:
            self.performSegueWithIdentifier("goDefaultImagePicker", sender: self)
        case 1:
            self.performSegueWithIdentifier("goImagePickerwithCamera", sender: self)
        default:
            print("#\(indexPath.row)")
            return
        }
    }
    
}
