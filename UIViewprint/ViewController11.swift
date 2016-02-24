//
//  ViewController10.swift
//  Blueprint
//
//  Created by Alex Winston on 2/11/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

class ViewController11: UIViewableController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 10"
        self.edgesForExtendedLayout = UIRectEdge.None;

        self.view.addSubview(
            div(
                div(
                    // Pad .Inline viewable with .Inline subview
                    div(style(display:.Inline, backgroundColor:.orangeColor()),
                        div(style(height:10, backgroundColor:.purpleColor())),
                        div(style(display:.Inline, width:10, height:5, backgroundColor:.grayColor())),
                        label("Testing", style:style(backgroundColor:.yellowColor())),
                        div(style(display:.Inline, width:10, height:5, backgroundColor:.grayColor())),
                        div(style(height:10, backgroundColor:.purpleColor()))
                    ),
                    label("Test")
                ),
                div(height(10)),
                // Pad .Block viewable with .Inline subview
                div(style(backgroundColor:.grayColor()),
                    div(style(height:10, backgroundColor:.blueColor())),
                    div(.Flex(.Row),
                        div(style(display:.Inline, width:10, height:5, backgroundColor:.greenColor())),
                        // Add .Block wrapper or .Inline subview becomes .Block because it was wrapped in .Flex(.Row)
                        div(
                            label("Label", style:style(backgroundColor:.lightGrayColor()))
                        ),
                        div(style(display:.Inline, width:10, height:5, backgroundColor:.greenColor()))
                    ),
                    div(style(height:10, backgroundColor:.blueColor()))
                ),
                div(height(10)),
                // Pad .Block viewable with .Block subview
                div(style(backgroundColor:.lightGrayColor()),
                    div(style(height:10, backgroundColor:.purpleColor())),
                    // Add .Flex(.Row) wrapper if superview is .Block
                    div(.Flex(.Row),
                        div(style(display:.Inline, width:10, height:5, backgroundColor:.greenColor())),
                        div(style(height:20, backgroundColor:.yellowColor())),
                        div(style(display:.Inline, width:10, height:5, backgroundColor:.greenColor()))
                    ),
                    div(style(height:10, backgroundColor:.purpleColor()))
                ),
                div(height(10)),
                // Pad .Inline viewable with multiple .Inline subviews
                div(style(display:.Inline, backgroundColor:.grayColor()),
                    div(style(height:10, backgroundColor:.blueColor())),
                    div(style(display:.Inline, width:10, height:5, backgroundColor:.greenColor())),
                    // Add .Inline wrapper if superview is .Inline
                    div(.Inline,
                        label("Label", style:style(backgroundColor:.yellowColor())),
                        label("Label2", font:.systemFontOfSize(20), style:style(backgroundColor:.orangeColor())),
                        div(height(10))
                    ),
                    div(style(display:.Inline, width:10, height:5, backgroundColor:.greenColor())),
                    div(style(height:10, backgroundColor:.blueColor()))
                ),
                div(height(10)),
                // Pad .Inline viewable with .Flex(.Row) subview
                div(style(display:.Inline, width:100, backgroundColor:.grayColor()),
                    div(style(height:10, backgroundColor:.blueColor())),
                    // TODO? .Flex(.Row) width wrong when superview is .Inline unless width is defined
                    div(.Flex(.Row),
                        div(style(display:.Inline, width:10, height:5, backgroundColor:.greenColor())),
                        label("Label", style:style(backgroundColor:.lightGrayColor())),
                        div(style(display:.Inline, width:10, height:5, backgroundColor:.greenColor()))
                    ),
                    div(style(height:10, backgroundColor:.blueColor()))
                )
            )
        )
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        self.debugSubviews(self.view, indent: "")
//    }
}