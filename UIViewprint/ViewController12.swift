//
//  ViewController12.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class ViewController12: UIScrollViewableController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 11"
//        self.edgesForExtendedLayout = UIRectEdge.None;
        
//        self.view.addSubview(
//            div(
//                div(style(height:10, backgroundColor:.orangeColor())),
//                div(style(height:10, backgroundColor:.yellowColor()),
//                    label("Test")
//                )
//            )
//        )

        self.scrollView.addSubview(
            div(.Flex(.Row),
                div(style(width:15)),
                div(foreach:[Int](1...20)) { (i:Int) in
                    return div(
                        div(height(10)),
                        div(.Flex(.Row),
                            image("friends", contentMode:.ScaleAspectFill).style(style(width:40, height:40, backgroundColor:.orangeColor())),
                            div(style(width:10)),
                            div(
                                label("Name", font:.boldSystemFontOfSize(20)),
                                div(height(2)),
                                label("This is test \(String(i)) of the emergency broadcast system", lineBreakMode:.ByTruncatingTail, numberOfLines:1, font:.systemFontOfSize(12)).style(style(display:.Block))
                            ),
                            div(style(width:10))
                        ),
                        div(height(10)),
                        div(style(height:1, backgroundColor:.lightGrayColor()))
                    )
                }
            )
        )
    }
}