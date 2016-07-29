//
//  DefaultJsonTableController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 29..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class DefaultJsonTableController: UITableViewController {
    
    @IBOutlet var jsonTableView: UITableView!
    var tableData = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rowToselect: NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.selectRowAtIndexPath(rowToselect, animated: true, scrollPosition: UITableViewScrollPosition.None)
        
        
        if checkExistFile("Word-List-7.json") {
            // 파일이 있다면 파일에서 불러온다.
            getJsonFile("Word-List-7")
        } else {
            // 파일이 없다면 웹에서 불러온다.
            // 로딩 이미지를 노출시킨다.
            ActivityModalView.shared.showActivityIndicator(self.view)
            getWordListJson("https://raw.githubusercontent.com/dejavuwing/swiftSample/master/swiftSample/swiftSample/swiftSample/Word-List-7.json")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 지정한 파일이 있는지 확인한다.
    func checkExistFile(jsonName: String) -> Bool {
        var exist: Bool = false
        let documentsDirectoryPathString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let documentsDirectoryPath = NSURL(string: documentsDirectoryPathString)!
        
        let jsonFilePath = documentsDirectoryPath.URLByAppendingPathComponent(jsonName)
        let fileManager = NSFileManager.defaultManager()
        var isDirectory: ObjCBool = false
        
        if !fileManager.fileExistsAtPath(jsonFilePath.absoluteString, isDirectory: &isDirectory) {
            exist = false
        } else {
            exist = true
        }
        
        return exist
    }
    
    // Json 데이터를 파일에서 불러온다.
    func getJsonFile(jsonName: String) {
        let documentsDirectoryPathString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let documentsDirectoryPath = NSURL(string: documentsDirectoryPathString)!
        let jsonFilePath = documentsDirectoryPath.URLByAppendingPathComponent(jsonName)
        print(jsonFilePath)
        
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        let jsonPath = paths.stringByAppendingPathComponent("Word-List-7.json")
        print(jsonPath)
        
        let data = try? NSData(contentsOfURL: NSURL(fileURLWithPath: jsonPath), options: NSDataReadingOptions.DataReadingMappedIfSafe)
        do {
            let theJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSMutableDictionary
            if theJSON.count > 0 {
                let results: NSArray = theJSON["voca"] as! NSArray
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableData = results
                    self.jsonTableView!.reloadData()
                })
            }
        }
        catch {}
    }


    // 웹 URL을 통해 Json 데이터를 불러온다.
    func getWordListJson(JsonUrl: String) {
        
        let mySession = NSURLSession.sharedSession()
        let url: NSURL = NSURL(string: JsonUrl)!
        
        let networkTask = mySession.dataTaskWithURL(url) { (data, response, error) -> Void in
            if error != nil {
                print("fetch Failed: \(error?.localizedDescription)")
            } else {
                if let data = data {
                    do {
                        let theJSON = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSMutableDictionary
                        
                        // json 데이터를 파일로 저장
                        self.storeJsonData("Word-List-7.json", jsonSource: theJSON)
                        
                        if theJSON.count > 0 {
                            let results: NSArray = theJSON["voca"] as! NSArray
                            dispatch_async(dispatch_get_main_queue(), {
                                self.tableData = results
                                self.jsonTableView.reloadData()
                            })
                        }
                    } catch {}
                }
            }
        }
        networkTask.resume()
    }
    
    // json 데이터를 저장한다.
    func storeJsonData(jsonName: String, jsonSource: NSMutableDictionary) {
        let documentsDirectoryPathString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let documentsDirectoryPath = NSURL(string: documentsDirectoryPathString)!
        
        let jsonFilePath = documentsDirectoryPath.URLByAppendingPathComponent(jsonName)
        let fileManager = NSFileManager.defaultManager()
        var isDirectory: ObjCBool = false
        
        // creating a .json file in the Documents folder
        if !fileManager.fileExistsAtPath(jsonFilePath.absoluteString, isDirectory: &isDirectory) {
            let created = fileManager.createFileAtPath(jsonFilePath.absoluteString, contents: nil, attributes: nil)
            if created {
                print("File created ")
            } else {
                print("Couldn't create file for some reason")
            }
        } else {
            print("File already exists")
        }
        
        // creating JSON out of the above array
        var jsonData: NSData!
        do {
            jsonData = try NSJSONSerialization.dataWithJSONObject(jsonSource, options: NSJSONWritingOptions())
            
            // json 데이터 확인
            // let jsonString = String(data: jsonData, encoding: NSUTF8StringEncoding)
            // print(jsonString)
            
        } catch let error as NSError {
            print("Array to JSON conversion failed: \(error.localizedDescription)")
        }
        
        // Write that JSON to the file created earlier
        do {
            let file = try NSFileHandle(forWritingToURL: jsonFilePath)
            file.writeData(jsonData)
            print("JSON data was written to the file successfully!")
        } catch let error as NSError {
            print("Couldn't write to file: \(error.localizedDescription)")
        }
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "myWordList")
        let wordEntry: NSMutableDictionary = self.tableData[indexPath.row] as! NSMutableDictionary
        
        cell.textLabel?.text = wordEntry["word"] as? String
        
        // Cell을 보여주기 전에 로딩 이미지를 닫느다.
        ActivityModalView.shared.hideActivityIndicator()
        
        return cell
        
    }

    
}
