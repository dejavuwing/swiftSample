//
//  TableSearchViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 8. 3..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class TableSearchViewController: UITableViewController {
    
    @IBOutlet var jsonTableView: UITableView!
    
    var tableData = []
    var sections = [String: [String]]()
    var sectionCount: Int = 0
    var words = [String]()
    
    // 테이블 검색을 위해
    let searchController = UISearchController(searchResultsController: nil)
    var filteredWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rowToselect: NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.selectRowAtIndexPath(rowToselect, animated: true, scrollPosition: UITableViewScrollPosition.None)
        
        // 로딩 이미지를 노출시킨다.
        ActivityModalView.shared.showActivityIndicator(self.view)
        getWordListJson("https://raw.githubusercontent.com/dejavuwing/swiftSample/master/swiftSample/swiftSample/swiftSample/Word-List-7.json")
        
        // 테이블 뷰 설정
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.tableView.tableHeaderView = searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredWords = words.filter({ word in
            return word.lowercaseString.containsString(searchText.lowercaseString)
        })
        self.jsonTableView.reloadData()
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
        
        // Json 데이터에서 word를 [String] 으로 뺀다.
        if let voca = JsonData["voca"] as? [[String: AnyObject]] {
            // 전체 단어들만 리스트로 담아놓는다.
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
    
    // key를 정렬해 반환한다.
    func getSortedKeys(sections: [String: [String]]) -> [String] {
        let keys = sections.keys
        let sortedKeys = keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        return sortedKeys
    }
    
    // Section의 수를 확인한다.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // 단어를 검색한다면 Section을 보여주지 않는다
        if searchController.active && searchController.searchBar.text != "" {
            return 1
        } else {
            let keys = sections.keys
            self.sectionCount = keys.count
            return keys.count
        }
    }
    
    // Section의 순서와 String을 확인한다.
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // 단어를 검색한다면 Section을 보여주지 않는다
        if searchController.active && searchController.searchBar.text != "" {
            return nil
        } else {
            let sortedKeys = getSortedKeys(sections)
            return sortedKeys[section]
        }
    }
    
    // Section 단위의 테이블 수를 확인한다.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 검색한 단어 수 리턴하기
        if searchController.active && searchController.searchBar.text != "" {
            print("search count : \(filteredWords.count)")
            return filteredWords.count
        } else {
            let sortedKeys = getSortedKeys(sections)
            let key = sortedKeys[section]
            if let words = sections[key] {
                print("section count : \(words.count)")
                return words.count
            }
        }
    
        return 0
    }
    
    // Index에 해당하는 Row를 cell에 확인한다.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "myWordList")
        
        // 검색한 단어를 cell에 전달
        if searchController.active && searchController.searchBar.text != "" {
            let word = filteredWords[indexPath.row]
            cell.textLabel?.text = word
        } else {
            let keys = getSortedKeys(sections)
            let key = keys[indexPath.section]
            if let words = sections[key] {
                let word = words[indexPath.row]
                cell.textLabel?.text = word
            }
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
        
        // 단어를 검색한다면 Section Index를 보여주지 않는다
        if searchController.active && searchController.searchBar.text != "" {
            return nil
        } else {
            return keys
        }
    }
    
    // 왼쪽 Index가 taped 되면 index의 string과 번호를 반환한다.
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        // 단어를 검색한다면 Section을 보여주지 않는다
        if searchController.active && searchController.searchBar.text != "" {
            return 0
        } else {
            print("\(title) : \(index)")
            return index
        }
    }
    
    // Table View Delegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let keys = sections.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        // 단어를 검색한다면 Section을 보여주지 않는다
        if searchController.active && searchController.searchBar.text != "" {
            
            
            print("did Select Row At IndexPath: \(filteredWords[indexPath.row])")
            
        } else {
            let key = keys[indexPath.section]
            if let words = sections[key] {
                print("did Select Row At IndexPath: \(words[indexPath.row])")
            }
        }
    }

}

extension TableSearchViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
}
