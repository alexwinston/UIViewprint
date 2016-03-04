//
//  ViewController2.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class Test {
    var i:Int = 0
}

infix operator < { associativity left }

class ViewController2: UIViewableController {
    let test = Test()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        self.title = "Example 1"
        
        // http://www.appcoda.com/uiscrollview-introduction/
        self.scrollView.frame = self.view.frame
        self.view.addSubview(self.scrollView)
        
        let red = UIViewableStyle(backgroundColor:.redColor())
        let orange = UIViewableStyle(backgroundColor:.orangeColor())
        let green = UIViewableStyle(backgroundColor:.greenColor())
        let cyan = UIViewableStyle(backgroundColor:.cyanColor())
        
        let flatSwitch:AIFlatSwitch = AIFlatSwitch(frame: CGRectMake(0, 0, 50, 50))
        
        self.scrollView
            < .view+>
                < UIViewable(tag:1, style:red)+>
                    < UIViewable(tag:2, style:orange)+>
                        < "Testing"==.style(green).display(.Block)>>
                        < "Another test"==.style(cyan)>>
                        < button("Click", touch:handleClick)>>
                    < .view/>
                    < UIViewable(tag:21, style:orange)+>
                        < "Testing"==.style(green).display(.Block)>>
                        < "Another test"==.style(cyan)>>
                        < button("Click", touch:handleClick)>>
                        < UIViewable(tag:91, style:UIViewableStyle(width:20, height:20, backgroundColor:.lightGrayColor()))>>
                    < .view/>
                    < UIViewable(tag:22, style:orange)+>
                        < "Testing"==.style(green).display(.Block)>>
                        < "Another test"==.style(cyan)>>
                        < button("Click", touch:handleClick)>>
                        < UIViewable(tag:92, style:UIViewableStyle(display:.Inline, width:50, height:50, backgroundColor:.lightGrayColor()))>>
                        < flatSwitch>>
                    < .view/>
                    // TODO < />
                    < UIViewable(tag:6, style:UIViewableStyle(width:100, height:100, backgroundColor:.purpleColor()))+>
                    < "This is another test of the emergency broadcast system"==.style(green)/>
                    < UIViewable(tag:7, style:green)+>
                        < "More testing">>
                    < UIViewable(tag:.close)/>
                    < UIViewable(tag:9, style:UIViewableStyle(width:50, height:50, backgroundColor:.cyanColor()))>>
                    // https://jsfiddle.net/j5o8kt2f/
                    < UIViewable(tag:10, style:UIViewableStyle(display:.Inline, backgroundColor:.grayColor()))+>
                        < "Testing dynamic width">>
                        < UIViewable(tag:11, style:UIViewableStyle(width:150, height:150, backgroundColor:.brownColor()))+>
                            < "Test">>
                            < UIViewable(tag:111, style:UIViewableStyle(width:200, height:10, backgroundColor:.greenColor()))+>
                            < UIViewable(tag:1112, style:UIViewableStyle(width:100, height:5, backgroundColor:.magentaColor()))/>
                        < UIViewable(tag:.close)/>
                    < .view/>
                    < "Right"==.style(orange)>>
                    < button("Click again", touch:handleClickAgain)>>
                    < "Test"==.display(.Block).backgroundColor(.lightGrayColor())>>
                < UIViewable(tag:13, style:UIViewableStyle())/>
                < "Below test">>
                < UIViewable(tag:.close)/>
            < UIViewable(tag:.close)/>
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
        
        self.scrollView.frame.size = size
        for subview in self.view.subviews {
            subview.layoutSubviews()
        }
        self.debugSubviews(self.view, indent: "")
    }
    
    func handleClick(button:UIButton) {
        print("clicked \(test.i++)")
    }
    func handleClickAgain(button:UIButton) {
        print("clicked again \(test.i++)")
    }
}
