//
//  ProgressBarController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 27..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class ProgressBarController: UIViewController {
    
    @IBOutlet weak var simpleProgress: UIProgressView!
    @IBOutlet weak var simpleLabel: UILabel!
    
    var progressBarTimer:NSTimer!
    
    var current: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleProgress.setProgress(0, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actionTriggered(sender: AnyObject) {
        
        progressBarTimer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(ProgressBarController.progressAction), userInfo: nil, repeats: true)
        
        
    }
    
    func progressAction () {
        // Get current values.
        let i = current
        let max = 100
        
        // If we still have progress to make.
        if i <= max {
            // Compute ratio of 0 to 1 for progress.
            let ratio = Float(i) / Float(max)
            // Set progress.
            simpleProgress.progress = Float(ratio)
            
            // Write message.
            if i >= 99 {
                simpleLabel.text = "Completed"
            } else {
                simpleLabel.text = "Processing \(i) of \(max)..."
                current += 1
            }
            
        }
    }
    
    

}
