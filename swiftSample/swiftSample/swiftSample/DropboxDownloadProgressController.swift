//
//  DropboxDownloadProgressController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 27..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit
import SwiftyDropbox

class DropboxDownloadProgressController: UIViewController {
    

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    var progressBarTimer: NSTimer!
    var current: Int64 = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.setProgress(0, animated: true)
        progressLabel.text = "0%"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func progressAction(currentBytes: Int64, totalBytes: Int64) {
        let downloadProgress:Float = Float(currentBytes) / Float(totalBytes)
        print("downloadProgress: \(downloadProgress) <---------------------------")
        
        progressView.progress = downloadProgress
        
        let progressPercent = Int(downloadProgress * 100)
        self.progressLabel.text = "\(progressPercent)%"
        
    }
    
    @IBAction func startDownload(sender: UIButton) {
        
        if let client = Dropbox.authorizedClient {
            
            let destination : (NSURL, NSHTTPURLResponse) -> NSURL = { temporaryURL, response in
                let fileManager = NSFileManager.defaultManager()
                let directoryURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
                // generate a unique name for this file in case we've seen it before
                let UUID = NSUUID().UUIDString
                let pathComponent = "\(UUID)-\(response.suggestedFilename!)"
                return directoryURL.URLByAppendingPathComponent(pathComponent)
            }
            
            client.files.download(path: "/20151023_153014.jpg", destination: destination)
                
                .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    print("bytesRead: \(bytesRead)")
                    print("totalBytesRead: \(totalBytesRead)")
                    print("totalBytesExpectedToRead: \(totalBytesExpectedToRead)")
                    
                    self.progressAction(totalBytesRead, totalBytes: totalBytesExpectedToRead)
                }

                .response { response, error in
                    
                    if let (metadata, url) = response {
                        print("*** Download file ***")
                        print("Downloaded file name: \(metadata.name)")
                        print("Downloaded file url: \(url)")
                    } else {
                        print(error!)
                    }
                    
                }
            
        } else {
            if let _ = Dropbox.authorizedClient {
                Dropbox.unlinkClient()
            }
            Dropbox.authorizeFromController(self)
            
        }
        
    }
    
}
