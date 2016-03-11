//
//  UIViewPaddingController.swift
//  UIViewprint
//
//  Created by Alex Winston on 3/9/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class UIViewPaddingController: UITableViewableController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.title = "UIView basic padding example"
            self.edgesForExtendedLayout = UIRectEdge.None;
            
            self.table(
                sections:[
                    section("UIView padding, no subviews",
                        rows:[
                            row(
                                div(style(padding:(top:10,right:10,bottom:10,left:10), backgroundColor:.orangeColor()))
                            )
                        ]
                    ),
                    section("UIView padding, subview fixed height",
                        rows:[
                            row(
                                div(style(padding:(10,10,10,10), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor()))
                                )
                            )
                        ]
                    ),
                    section("UIView mixed padding, subview fixed height",
                        rows:[
                            row(label("top")),
                            row(
                                div(style(padding:(top:10,right:0,bottom:0,left:0), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor()))
                                )
                            ),
                            row(label("right")),
                            row(
                                div(style(padding:(0,10,0,0), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor()))
                                )
                            ),
                            row(label("bottom")),
                            row(
                                div(style(padding:(0,0,10,0), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor()))
                                )
                            ),
                            row(label("left")),
                            row(
                                div(style(padding:(0,0,0,10), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor()))
                                )
                            ),
                            row(label("top and bottom")),
                            row(
                                div(style(padding:(top:10,right:0,bottom:10,left:0), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor()))
                                )
                            ),
                            row(label("left and right")),
                            row(
                                div(style(padding:(top:0,right:10,bottom:0,left:10), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor()))
                                )
                            )
                        ]
                    ),
                    section("UIView padding, subviews fixed height",
                        rows:[
                            row(
                                div(style(padding:(10,10,10,10), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor())),
                                    div(style(height:20, backgroundColor:.lightGrayColor()))
                                )
                            )
                        ]
                    ),
                    section("UIView .Flex(.Row) padding, subview fixed height",
                        rows:[
                            row(
                                div(style(display:.Flex(.Row), padding:(10,10,10,10), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor()))
                                )
                            )
                        ]
                    ),
                    section("UIView .Flex(.Row) padding, subviews fixed height",
                        rows:[
                            row(
                                div(style(display:.Flex(.Row), padding:(10,10,10,10), backgroundColor:.orangeColor()),
                                    div(style(height:10, backgroundColor:.yellowColor())),
                                    div(style(height:10, backgroundColor:.lightGrayColor()))
                                )
                            )
                        ]
                    ),
                    section("UIView padding, 2 subviews fixed height",
                        rows:[
                            row(
                                div(style(padding:(10,10,10,10), backgroundColor:.orangeColor()),
                                    div(style(padding:(10,10,10,10), backgroundColor:.yellowColor()),
                                        div(style(height:10, backgroundColor:.lightGrayColor()))
                                    )
                                )
                            )
                        ]
                    ),
                    section("UIView padding, nested subviews, variable height",
                        rows:[
                            row(
                                div(style(padding:(10,10,10,10), backgroundColor:.orangeColor()),
                                    div(style(padding:(10,10,10,10), backgroundColor:.yellowColor()),
                                        div(style(backgroundColor:.lightGrayColor()),
                                            div(style(height:10, backgroundColor:.grayColor())),
                                            div(style(height:20, backgroundColor:.darkGrayColor()))
                                        )
                                    )
                                )
                            )
                        ]
                    ),
                    section("UIView padding, nested .Flex(.Row) subview",
                        rows:[
                            row(
                                div(style(padding:(10,10,10,10), backgroundColor:.orangeColor()),
                                    div(style(padding:(10,10,10,10), backgroundColor:.yellowColor()),
                                        div(style(display:.Flex(.Row), backgroundColor:.lightGrayColor()),
                                            div(style(height:10, backgroundColor:.grayColor()))
                                        )
                                    )
                                )
                            )
                        ]
                    ),
                    section("UIView padding, nested .Flex(.Row) subviews, variable height",
                        rows:[
                            row(
                                div(style(padding:(10,10,10,10), backgroundColor:.orangeColor()),
                                    div(style(padding:(10,10,10,10), backgroundColor:.yellowColor()),
                                        div(style(display:.Flex(.Row), backgroundColor:.lightGrayColor()),
                                            div(style(height:10, backgroundColor:.grayColor())),
                                            div(style(height:20, backgroundColor:.darkGrayColor()))
                                        )
                                    )
                                )
                            )
                        ]
                    )
                ]
            )
        }
}