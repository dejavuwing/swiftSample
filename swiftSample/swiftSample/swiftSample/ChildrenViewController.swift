//
//  ChildrenViewController.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 25..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class ChildrenViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    let pageTitles = ["20151022_130006",
                      "20151022_174514",
                      "20151023_153014",
                      "20151024_102126",
                      "20151024_103636",
                      "20151024_120503",
                      "20151024_120507"]
    
    private let images = ["20151022_130006.jpg",
                          "20151022_174514.jpg",
                          "20151023_153014.jpg",
                          "20151024_102126.jpg",
                          "20151024_103636.jpg",
                          "20151024_120503.jpg",
                          "20151024_120507.jpg"]
    
    var count = 0
    
    var pageViewController: UIPageViewController!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        print("swipe left")
    }
    
    @IBAction func swiped(sender: AnyObject) {
        self.pageViewController.view.removeFromSuperview()
        self.pageViewController.removeFromParentViewController()
        reset()
    }
    
    func reset() {
        // Getting the page view controller
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("pageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        // We are substracting 30 because we have a start again button whose height is 30
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - 30)
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    @IBAction func start(sender: AnyObject) {
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    
        var index = (viewController as! PageContentViewController).pageIndex!
        index += 1
        if(index >= self.images.count){
            return nil
        }
        
        return self.viewControllerAtIndex(index)
    
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    
        var index = (viewController as! PageContentViewController).pageIndex!
        if(index <= 0){
            return nil
        }
        index -= 1
    
        return self.viewControllerAtIndex(index)
    
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController? {
        
        if((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return nil
        }
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageContentViewController
        
        pageContentViewController.imageName = self.images[index]
        pageContentViewController.titleText = self.pageTitles[index]
        pageContentViewController.pageIndex = index
        return pageContentViewController
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
