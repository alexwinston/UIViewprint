//
//  UIViewableController.swift
//  Blueprint
//
//  Created by Alex Winston on 2/1/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

class UIViewableController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        let viewable = UIViewable()
//        viewable.frame = self.view.frame
//        self.view = viewable
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        self.view.frame.size = size
        for subview in view.subviews {
            subview.layoutSubviews()
        }
        self.debugSubviews(self.view, indent: "")
    }
    
    func debugSubviews(view:UIView, indent:String) {
        let frame = view.frame
        var display:UIViewableDisplay?
        if (Mirror(reflecting: view).subjectType == UIViewable.self) {
            let viewable = view as! UIViewable
            display = viewable.display
        }

        print("\(indent)<\(view.tag) \(display) x=\(frame.origin.x) y=\(frame.origin.y) width=\(frame.width) maxWidth=\(view.maxWidth) height=\(frame.height) maxHeight=\(view.maxHeight)>")
        for i in 0..<view.subviews.count {
            let subview = view.subviews[i] as UIView
            self.debugSubviews(subview, indent: indent + " ")
        }
        print("\(indent)</\(view.tag)>")
    }
}
