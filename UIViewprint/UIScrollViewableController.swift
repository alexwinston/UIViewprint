//
//  UIScrollViewableController.swift
//  Blueprint
//
//  Created by Alex Winston on 2/9/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import UIKit

class UIScrollViewableController: UIViewableController {
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.frame = self.view.frame
        self.view.addSubview(self.scrollView)
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
        super.debugSubviews(self.view, indent: "")
    }

}