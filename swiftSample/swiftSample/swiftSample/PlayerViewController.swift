//
//  PlayerViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 8. 23..
//  Copyright © 2016년 ngle. All rights reserved.
//
//  YouTubePlayer: https://github.com/gilesvangruisen/Swift-YouTube-Player

import UIKit
import YouTubePlayer

class PlayerViewController: UIViewController {
    
    //@IBOutlet var playerView: YouTubePlayerView!
    
    @IBOutlet weak var playerView: YouTubePlayerView!
    
    
    var videoID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        print(videoID)
        playerView.loadVideoID(videoID)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
