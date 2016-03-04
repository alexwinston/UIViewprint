//
//  ViewController4.swift
//  Blueprint
//
//  Created by Alex Winston on 2/1/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

// https://codepen.io/dudleystorey/pen/umrnE
infix operator < { associativity left }

class ViewController4: UIViewableController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Example 3"

        self.edgesForExtendedLayout = UIRectEdge.None;
        self.view
            < UIViewable(style:UIViewableStyle(backgroundColor:.redColor()))+>
                < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.lightGrayColor()))+>
                    < UIViewable(style:UIViewableStyle(height:100, backgroundColor:.orangeColor()))>>
                    < UIViewable(style:UIViewableStyle(height:10, backgroundColor:.greenColor()))>>
                    < UIViewable(style:UIViewableStyle(width:50, height:50, backgroundColor:.yellowColor()))>>
                < .view/>
                // http://jsbin.com/nobanegavo/edit?html,output
                < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.grayColor()))+>
                    < UIViewable(style:UIViewableStyle(display:.Flex(.Row), width:100, backgroundColor:.magentaColor()))+>
                        // TODO? Constrain width for sizeToFit
                        < "1 test">>
                        < "2 test">>
                        < "3 test">>
                        < "4 test">>
                    < .view/>
                    < UIViewable(style:UIViewableStyle(height:10, backgroundColor:.greenColor()))>>
                    < UIViewable(style:UIViewableStyle(width:75, height:150, backgroundColor:.blueColor()))>>
                < .view/>
                < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.lightGrayColor()))+>
                    < UIViewable(style:UIViewableStyle(width:115, height:100, backgroundColor:.purpleColor()))>>
                    < "This is a test of the emergency broadcast system"==.width(100).height(150).backgroundColor(.greenColor())>>
                    < UIViewable(style:UIViewableStyle(height:50, backgroundColor:.yellowColor()))>>
                < .view/>
                < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.greenColor()))+>
                    < UIViewable(style:UIViewableStyle(height:100, backgroundColor:.grayColor()))>>
                    < UIViewable(style:UIViewableStyle(height:75, backgroundColor:.orangeColor()))>>
                    < UIViewable(style:UIViewableStyle(height:50, backgroundColor:.yellowColor()))>>
                < .view/>
            < .view/>
        
        self.view.layoutIfNeeded()
        self.debugSubviews(self.view, indent: "")
    }
}