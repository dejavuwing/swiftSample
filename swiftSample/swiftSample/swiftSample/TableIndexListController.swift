//
//  TableIndexListController.swift
//  swiftSample
//
//  Created by ngle on 2016. 8. 1..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class TableIndexListController: UITableViewController {
    
    @IBOutlet var jsonTableView: UITableView!
    
    var tableData = []
    var sections = [String: [String]]()
    var sectionCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rowToselect: NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.selectRowAtIndexPath(rowToselect, animated: true, scrollPosition: UITableViewScrollPosition.None)
        
        // 로딩 이미지를 노출시킨다.
        ActivityModalView.shared.showActivityIndicator(self.view)
        getWordListJson("https://raw.githubusercontent.com/dejavuwing/swiftSample/master/swiftSample/swiftSample/swiftSample/Word-List-7.json")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                        
                        if theJSON.count > 0 {
                            let results: NSArray = theJSON["voca"] as! NSArray
                            dispatch_async(dispatch_get_main_queue(), {
                                
                                self.tableData = results
                                
                                // Alphabetize Word (데이터 정렬과 secion 분리를 위해 json 데이터를 넘긴다.)
                                self.sections = self.alphabetizeArray(theJSON)
                                
                                self.jsonTableView.reloadData()
                            })
                        }
                    } catch {
                        print("error serializing JSON: \(error)")
                    }
                }
            }
        }
        networkTask.resume()
    }
    
    func alphabetizeArray(JsonData: NSMutableDictionary) -> [String: [String]] {
        var result = [String: [String]]()
        var words = [String]()
        
        // Json 데이터에서 word를 [String] 으로 뺀다.
        if let voca = JsonData["voca"] as? [[String: AnyObject]] {
            for word in voca {
                if let word = word["word"] as? String {
                    words.append(word)
                }
            }
        }

        for item in words {
            let index = item.startIndex.advancedBy(1)
            let firstLetter = item.substringToIndex(index).uppercaseString
            
            if result[firstLetter] != nil {
                result[firstLetter]!.append(item)
            } else {
                result[firstLetter] = [item]
            }
        }
        
        for (key, value) in result {
            result[key] = value.sort({ (a, b) -> Bool in
                a.lowercaseString < b.lowercaseString
            })
        }

        return result
    }

    // Section의 수를 확인한다.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let keys = sections.keys
        self.sectionCount = keys.count
        
        return keys.count
    }
    
    // Section의 순서와 String을 확인한다.
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Sort Keys
        let keys = sections.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        // print(keys)
        // print(section)
        return keys[section]
    }
    
    // Section 단위의 테이블 수를 확인한다.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Sort Keys
        let keys = sections.keys
        let sortedKeys = keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })

        let key = sortedKeys[section]
        if let words = sections[key] {
            // print("\(key) : \(words.count)")
            return words.count
        }
        
        return 0
    }
    
    // Index에 해당하는 Row를 cell에 확인한다.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "myWordList")
        let keys = sections.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        let key = keys[indexPath.section]
        if let words = sections[key] {
            let word = words[indexPath.row]
            
            cell.textLabel?.text = word
        }

        // Cell을 보여주기 전에 로딩 이미지를 닫느다.
        ActivityModalView.shared.hideActivityIndicator()
        
        return cell
    }
    
    // 왼쪽 Index에 표시할 [String]을 반환한다.
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        let keys = sections.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })

        return keys
    }
    
    // 왼쪽 Index가 taped 되면 index의 string과 번호를 반환한다.
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        print("\(title) : \(index)")
        
        return index
    }
    
    // Table View Delegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let keys = sections.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        let key = keys[indexPath.section]
        if let words = sections[key] {
            print("did Select Row At IndexPath: \(words[indexPath.row])")
        }
    }
    
   

    
}
