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

        // TODO refactor to reduce the number of nested UIViewables
        self.scrollView.addSubview(
            div(style(padding:(0,0,0,left:15)), subviews:
                div(foreach:[Int](1...20)) { (i:Int) in
                    return div(
                        div(style(display:.Flex(.Row), padding:(top:10,right:10,bottom:10,0)),
                            image("friends", contentMode:.ScaleAspectFill).style(style(width:40, height:40, backgroundColor:.orangeColor())),
                            div(style(padding:(0,0,0,left:10)),
                                label("Name", font:.boldSystemFontOfSize(20)),
                                label("This is test \(String(i)) of the emergency broadcast system", lineBreakMode:.ByTruncatingTail, numberOfLines:1, font:.systemFontOfSize(12)).style(style(display:.Block, padding:(top:2,0,0,0)))
                            )
                        ),
                        hr(padding:(top:0,0,0,0), color:.lightGrayColor())
                    )
                }
            )
        )
    }
}