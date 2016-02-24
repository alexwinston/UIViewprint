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
            div(foreach:[Int](1...100)) { (i:Int) in
                return div(
                    label("Name: "),
                    label("John \(String(i))"),
                    div(style(height:1, backgroundColor:.lightGrayColor()))
                )
            }
        )
    }
}