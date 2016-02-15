//
//  ViewController3.swift
//  Blueprint
//
//  Created by Alex Winston on 2/1/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

class ViewController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Example 2"
        self.edgesForExtendedLayout = UIRectEdge.None;

        self.view = UIViewable()
        self.view
            < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.lightGrayColor()))+>
                < UIViewable(style:UIViewableStyle(height:100, backgroundColor:.orangeColor()))>>
                < UIViewable(style:UIViewableStyle(height:10, backgroundColor:.greenColor()))>>
                < UIViewable(style:UIViewableStyle(width:50, height:50, backgroundColor:.yellowColor()))>>
            < .view/>
            < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.grayColor()))+>
                < UIViewable(style:UIViewableStyle(width:100, height:100, backgroundColor:.magentaColor()))>>
                < UIViewable(style:UIViewableStyle(height:10, backgroundColor:.greenColor()))>>
                < UIViewable(style:UIViewableStyle(width:75, height:150, backgroundColor:.blueColor()))>>
            < .view/>
            // TODO? Multi line labels https://jsbin.com/kekicitomi/edit?html,output
            < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.lightGrayColor()))+>
                < UIViewable(style:UIViewableStyle(width:125, height:100, backgroundColor:.purpleColor()))>>
                < "This is a test of the emergency broadcast system"==.width(100).height(150).backgroundColor(.greenColor())>>
                < UIViewable(style:UIViewableStyle(height:50, backgroundColor:.yellowColor()))>>
            < .view/>
            < UIViewable(style:UIViewableStyle(display:.Flex(.Row), backgroundColor:.greenColor()))+>
                < UIViewable(style:UIViewableStyle(height:100, backgroundColor:.grayColor()))>>
                < UIViewable(style:UIViewableStyle(height:75, backgroundColor:.orangeColor()))>>
                < UIViewable(style:UIViewableStyle(height:50, backgroundColor:.yellowColor()))>>
            < .view/>
    }
}