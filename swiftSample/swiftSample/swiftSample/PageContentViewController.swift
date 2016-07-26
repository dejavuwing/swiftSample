//
//  PageContentViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 25..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    
    @IBOutlet weak var bkImageView: UIImageView!
    @IBOutlet weak var heading: UILabel!
    
    var pageIndex: Int?
    var titleText: String!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bkImageView.image = UIImage(named: imageName)
        self.heading.text = self.titleText
        self.heading.alpha = 0.1
        
        UIView.animateWithDuration(1.0, animations: {
            self.heading.alpha = 1.0
        })
    }
}
