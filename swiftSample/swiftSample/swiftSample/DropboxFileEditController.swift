//
//  DropboxFileEditController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 26..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit
import SwiftyDropbox

class DropboxFileEditController: UIViewController {
    
    let textField = UITextField()
    let messageLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로그인 버튼 추가
        let signInButton = UIButton(type: UIButtonType.System) as UIButton
        signInButton.frame = CGRectMake(10, 100, 100, 30)
        signInButton.backgroundColor = UIColor.lightGrayColor()
        signInButton.setTitle("Sign In", forState: .Normal)
        signInButton.addTarget(self, action: #selector(DropboxFileEditController.signInDropbox), forControlEvents: .TouchUpInside)
        self.view.addSubview(signInButton)
        
        // add textfild
        textField.frame = CGRectMake(10, 140, 300, 30)
        textField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(textField)
        
        // add save button
        let saveButton = UIButton(type: UIButtonType.System)
        saveButton.frame = CGRectMake(10, 180, 100, 30)
        saveButton.backgroundColor = UIColor.lightGrayColor()
        saveButton.setTitle("Save", forState: .Normal)
        saveButton.addTarget(self, action: #selector(DropboxFileEditController.saveText), forControlEvents: .TouchUpInside)
        self.view.addSubview(saveButton)
        
        // add upload button
        let uploadButton = UIButton(type: UIButtonType.System)
        uploadButton.frame = CGRectMake(10, 220, 100, 30)
        uploadButton.backgroundColor = UIColor.lightGrayColor()
        uploadButton.setTitle("Upload", forState: .Normal)
        uploadButton.addTarget(self, action: #selector(DropboxFileEditController.uploadToDropbox), forControlEvents: .TouchUpInside)
        self.view.addSubview(uploadButton)
        
        // add download button
        let downloadButton = UIButton(type: UIButtonType.System)
        downloadButton.frame = CGRectMake(10, 260, 100, 30)
        downloadButton.backgroundColor = UIColor.lightGrayColor()
        downloadButton.setTitle("Download", forState: .Normal)
        downloadButton.addTarget(self, action: #selector(DropboxFileEditController.downloadDropboxFile), forControlEvents: .TouchUpInside)
        self.view.addSubview(downloadButton)
        
        // ファイル内容表示ラベルを追加
        messageLabel.frame = CGRectMake(10, 300, 300, 30)
        self.view.addSubview(messageLabel)
        
        // ファイル一覧取得ボタンを追加
        let getEntriesButton = UIButton(type: UIButtonType.System)
        getEntriesButton.frame = CGRectMake(10, 340, 100, 30)
        getEntriesButton.backgroundColor = UIColor.lightGrayColor()
        getEntriesButton.setTitle("Get Filenames", forState: .Normal)
        getEntriesButton.addTarget(self, action: #selector(DropboxFileEditController.getDropboxEntries), forControlEvents: .TouchUpInside)
        self.view.addSubview(getEntriesButton)
        
        // 削除ボタンを追加
        let deleteButton = UIButton(type: UIButtonType.System)
        deleteButton.frame = CGRectMake(10, 380, 100, 30)
        deleteButton.backgroundColor = UIColor.lightGrayColor()
        deleteButton.setTitle("Delete", forState: .Normal)
        deleteButton.addTarget(self, action: #selector(DropboxFileEditController.deleteDropboxFile), forControlEvents: .TouchUpInside)
        self.view.addSubview(deleteButton)
        
    }
    
    override func didReceiveMemoryWarning() {
        // didReceiveMemoryWarning: 메모리가 부족할 때 시스템에서 자동으로 호출해주는 메소드
        super.didReceiveMemoryWarning()
    }
    
    // 키보드가 올라온 후 화면을 터치하면 키보드가 내려가게 한다.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func signInDropbox() {
        if let _ = Dropbox.authorizedClient {
            Dropbox.unlinkClient()
        }
        Dropbox.authorizeFromController(self)
    }
    
    func saveText() {
        let tmpURL = NSURL(fileURLWithPath: NSTemporaryDirectory())
        let fileURL = tmpURL.URLByAppendingPathComponent("sample.txt")
        do {
            try textField.text?.writeToURL(fileURL, atomically: true, encoding: NSUTF8StringEncoding)
            print("Save text file")
        } catch {}
    }
    
    func uploadToDropbox() {
        let tmpURL = NSURL(fileURLWithPath: NSTemporaryDirectory())
        let fileURL = tmpURL.URLByAppendingPathComponent("sample.txt")
        
        if let client = Dropbox.authorizedClient {
            client.files.upload(path: "/sample.txt", mode: Files.WriteMode.Overwrite, autorename: true, clientModified: NSDate(), mute: false, input: fileURL).response { response, error in
                if let metadata = response {
                    print("Uploaded file name: \(metadata.name)")
                } else {
                    print(error!)
                }
            }
        }
    }
    
    func downloadDropboxFile() {
        if let client = Dropbox.authorizedClient {
            
            // 다운로드 URL 설정
            let destination : (NSURL, NSHTTPURLResponse) -> NSURL = { temporaryURL, response in
                let directoryURL = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
                let pathComponent = "\(NSUUID().UUIDString)-\(response.suggestedFilename!)"
                print("path: \(pathComponent)")
                return directoryURL.URLByAppendingPathComponent(pathComponent)
            }
            
            client.files.download(path: "/sample.txt", destination: destination).response { response, error in
                if let (metadata, url) = response {
                    print("Downloaded file name: \(metadata.name)")
                    
                    // 파일 내용을 표시한다.
                    if let data = NSData(contentsOfURL: url) {
                        self.messageLabel.text = String(data: data, encoding: NSUTF8StringEncoding)
                    }
                } else {
                    print(error!)
                }
            }
        }
    }
    
    // 파일들의 정보를 가져온다.
    func getDropboxEntries() {
        if let client = Dropbox.authorizedClient {
            client.files.listFolder(path: "").response { response, error in
                if let metadata = response {
                    print("Entries: \(metadata.entries)")
                } else {
                    print(error!)
                }
            }
        }
    }
    
    func deleteDropboxFile() {
        if let client = Dropbox.authorizedClient {
            client.files.delete(path: "/sample.txt").response { response, error in
                if let metadata = response {
                    print("Deleted file name: \(metadata.name)")
                } else {
                    print(error!)
                }
            }
        }
    }
    
    
}

