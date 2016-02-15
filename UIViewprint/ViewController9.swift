//
//  ViewController9.swift
//  Blueprint
//
//  Created by Alex Winston on 2/9/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

class ViewController9: UIViewableController,UIScrollViewDelegate {

    let scrollView = UIScrollView()
    var colors:[UIColor] = [UIColor.redColor(), UIColor.orangeColor(), UIColor.greenColor(), UIColor.yellowColor()]
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    var pageControl : UIPageControl = UIPageControl(frame: CGRectMake(50, 300, 200, 50))
    var views:[UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 8"
        self.edgesForExtendedLayout = UIRectEdge.None;
        
        self.scrollView.frame = self.view.frame
        
        let view1 = UIViewable(style:UIViewableStyle(display:.Inline))
//            < .view+>
                < "Test 1">>
//            < .view/>
        self.views.append(view1)
        
        let view2 = UIViewable(style:UIViewableStyle(display:.Flex(.Column)))
//            < .view+>
                < "Test 2a"==.display(.Block)>>
                < "Test 2b"==.display(.Block)>>
//            < .view/>
        self.views.append(view2)
        
        let view3 = UIViewable(style:UIViewableStyle(display:.Flex(.Column)))
            < .view+>
                < "Test 3a">>
                < "Test 3b">>
            < .view/>
        self.views.append(view3)
        
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        
        self.view.addSubview(scrollView)
        for index in 0..<views.count {
            let subView = views[index]
            subView.frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            subView.backgroundColor = colors[index]
            self.scrollView.addSubview(subView)
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * CGFloat(views.count), self.scrollView.frame.size.height)
        
        configurePageControl()
        pageControl.addTarget(self, action: Selector("changePage:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many views were added.
        
        self.pageControl.numberOfPages = views.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.redColor()
        self.pageControl.pageIndicatorTintColor = UIColor.blackColor()
        self.pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        self.view.addSubview(pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var contentRect = CGRectZero;
        for subview in self.scrollView.subviews {
            contentRect = CGRectUnion(contentRect, subview.frame);
        }
        self.scrollView.contentSize = contentRect.size;
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        //        self.view.frame.size = size
        self.scrollView.frame.size = size
        for subview in self.view.subviews {
            subview.layoutSubviews()
        }
        self.debugSubviews(self.view, indent: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}