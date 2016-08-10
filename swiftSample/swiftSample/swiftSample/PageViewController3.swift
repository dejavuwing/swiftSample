//
//  PageViewController3.swift
//  swiftSample
//
//  Created by ngle on 2016. 8. 10..
//  Copyright © 2016년 ngle. All rights reserved.
//

import UIKit

class PageViewController3: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        // 페이지가 실행될때 처음으로 보여줄 뷰 설정 및 옵션
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .Forward, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // UIStoryboard에서 해당 Controller를 불러온다.
    private func newViewController(controllerName: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(controllerName)
    }
    
    // 만들어져 있는 View Controller들을 불러온다.
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController("ObjectViewController"),
                self.newViewController("ObjectTableViewController"),
                self.newViewController("ChildrenViewController")]
    }()
    
    
}

// MARK: UIPageViewControllerDataSource
extension PageViewController3: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            // 첫번째 페이지에서 오른쪽으로 밀었다면 마지막 페이지가 보이게 한다.
            return orderedViewControllers.last
            // return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllerCount = orderedViewControllers.count
        
        guard orderedViewControllerCount != nextIndex else {
            // 마지막 페이지에서 왼쪽으로 밀었다면 첫번째 페이지가 보이게 한다.
            return orderedViewControllers.first
            // return nil
        }
        
        guard orderedViewControllerCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    // 페이지 하단에 점들이 생기게 한다.
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            firstViewControllerIndex = orderedViewControllers.indexOf(firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
}
