//
//  ViewController5.swift
//  Blueprint
//
//  Created by Alex Winston on 2/1/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

class ViewController5: UIViewableController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Example 4"
        self.edgesForExtendedLayout = UIRectEdge.None;
        
        self.view
            < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.lightGrayColor()))+>
                < UIViewable(style:UIViewableStyle(display:.Inline, width:50, height:50, backgroundColor:.yellowColor()))>>
                    < label("This is a test of the emergency broadcast system.", lineBreakMode:NSLineBreakMode.ByTruncatingTail, numberOfLines:1)>>
                    < label("This is a test of the emergency broadcast system.", lineBreakMode:.ByTruncatingTail, numberOfLines:2)>>
            < .view/>
    }
}