//
//  ViewController6.swift
//  Blueprint
//
//  Created by Alex Winston on 2/2/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

class ViewController6: UIViewableController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 5"        
        self.edgesForExtendedLayout = UIRectEdge.None;

        // NOTE .Flex.Column height defaults to 100% unlike HTML/CSS
        self.view
//            < UIViewable(style:UIViewableStyle(display:.Flex(.Column), backgroundColor:.greenColor()))+>
//                < UIViewable(style:UIViewableStyle(height:100, backgroundColor:.lightGrayColor()))+>
//                    < UIViewable(style:UIViewableStyle(display:.Flex(.Column), height:75, backgroundColor:.yellowColor()))+>
//                        < "Test 1"==.display(.Block)>>
//                        < "Test 2"==.display(.Block)>>
//                    < .view/>
//                < .view/>
//                < UIViewable(style:UIViewableStyle(height:100, backgroundColor:.grayColor()))+>
//                    < UIViewable(style:UIViewableStyle(display:.Flex(.Column), backgroundColor:.yellowColor()))+>
//                        < "Test 1">>
//                        < "Test 2">>
//                    < .view/>
//                < .view/>
//                < UIViewable(style:UIViewableStyle(backgroundColor:.redColor()))+>
//                < .view/>
//            < .view/>
        
//            < UIViewable(style:UIViewableStyle(display:.Flex(.Column), backgroundColor:.lightGrayColor()))+>
//                < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.grayColor()))+>
//                    < "Test1">>
//                    < "Test2"==.display(.Block)>>
//                    < "Test3"==.display(.Block)>>
//                < .view/>
//                < UIViewable(style:UIViewableStyle(height:25, backgroundColor:.orangeColor()))>>
//            < .view/>
        
            < UIViewable(style:UIViewableStyle(display:.Flex(.Column), backgroundColor:.lightGrayColor()))+>
                < UIViewable(style:UIViewableStyle(backgroundColor:.yellowColor()))>>
                < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.orangeColor()))+>
                    < UIViewable(style:UIViewableStyle(display:.Flex(.Column), backgroundColor:.greenColor()))+>
                        // TODO!!! If the height of the label grows larger than the flex column it hangs during layout
                        < "Test 1 asdf asdf asdf asdf asdf asdf asdf asdf asd fasd fasd fasd fasd fasd fasd fasdfasd f asdf asd fasdf asdf TEST"==.display(.Block)>>
                        < "Test 2"==.display(.Block)>>
                    < .view/>
                    < UIViewable(style:UIViewableStyle(display:.Flex(.Column), backgroundColor:.cyanColor()))+>
                        < "Test 3">>
                        < "Test 4">>
                    < .view/>
                < .view/>
                < UIViewable(style:UIViewableStyle(backgroundColor:.redColor()))>>
            < .view/>
    }
}