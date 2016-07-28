//
//  PageContentViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 25..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    
    //@IBOutlet weak var bkImageView: UIImageView!
    @IBOutlet weak var heading: UILabel!
    
    var imageView: UIImageView!
    
    var pageIndex: Int?
    var titleText: String!
    var imageName: String!
    
    var scale: CGFloat = 1.0
    var imageWidth: CGFloat = 0
    var imageHeight: CGFloat = 0
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // screen size 확인
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.width
        
        
        // 이미지 이름으로 이미지를 불러온다.
        let image = UIImage(named: imageName)!
        
        // 이미지의 사이즈를 확인한다.
        imageWidth = image.size.width
        imageHeight = image.size.height
        
        // UIImageView 인스턴스를 생성한다.
        imageView = UIImageView(image: image)
        
        // 이미지 크기를 스크린에 맞추기
        scale = screenWidth / imageWidth
        
        imageView.frame = CGRectMake(0, 0, imageWidth * scale, imageHeight * scale)
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        
        self.heading.text = self.titleText
        self.heading.alpha = 0.1
        
        UIView.animateWithDuration(1.0, animations: {
            self.heading.alpha = 1.0
        })
    }
}
