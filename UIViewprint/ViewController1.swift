//
//  ViewController1.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

class AppModel {
    var name:String = ""
    var developer:String = ""
    var rating:String = ""
    var category:String = ""
    var reviews:Int = 0
}

class CircleView:UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        // Get the Graphics Context
        let context = UIGraphicsGetCurrentContext();
        
        // Set the circle outerline-width
        CGContextSetLineWidth(context, 1.0);
        
        // Set the circle outerline-colour
        UIColor.redColor().set()
        
        // Create Circle
        CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2, (frame.size.width - 2)/2, 0.0, CGFloat(M_PI * 2.0), 1)
        
        // Draw
        CGContextStrokePath(context);
    }
}

class ViewController1: UIScrollViewableController {
    
    // TODO? UIViewable should keep a reference to it's style
    let sellerLabelView = UIViewable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "App Details Example"
        
        let appModel = AppModel()
        appModel.name = "Day One 2 Journal + Notes"
        appModel.developer = "Bloom Built, LLC"
        appModel.rating = "4+"
        appModel.category = "Lifestyle"
        appModel.reviews = 385
        
        let items = ["Details", "Reviews", "Related"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        
        let appImageView = UIViewable().width(100).height(100).backgroundColor(.orangeColor())
        // https://www.weheartswift.com/bezier-paths-gesture-recognizers/
        appImageView.style { (view:UIView) -> Void in
            view.backgroundColor = UIColor.redColor()
            view.layer.cornerRadius = 10.0
            view.clipsToBounds = true
        }
        
        super.scrollView
            < .view+>
                < .flexRow()+>
                    < appImageView>>
                    < .view+>
                        < .flexRow()+>
                            < appModel.name>>
                            < appModel.rating==.width(25).height(25).backgroundColor(.lightGrayColor())>>
                        < .view/>
                        < "\(appModel.developer) >"==.display(.Block)>>
                        < .view+>
                            < "Editor's Choice"==.backgroundColor(.lightGrayColor())>>
                        < .view/>
                        < .flexRow()+>
                            < UIViewable().display(.Flex(.Row)).align(.Bottom(.Left))+>
                                < UIViewable().display(.Flex(.Row)).align(.Middle(.Left))+>
                                    < CircleView(frame:CGRect(x:0, y:0, width:10, height:10))>>
                                    < .view(.style(height:10, width:1, backgroundColor:.blackColor()))>>
                                    < CircleView(frame:CGRect(x:0, y:0, width:10, height:10))>>
                                    < .view(.style(height:10, width:1, backgroundColor:.blackColor()))>>
                                    < CircleView(frame:CGRect(x:0, y:0, width:10, height:10))>>
                                    < .view(.style(height:10, width:1, backgroundColor:.blackColor()))>>
                                    < .view>>
                                    < .view(.style(height:10, width:1, backgroundColor:.blackColor()))>>
                                    < .view>>
                                < .view/>
                                < .label("(\(appModel.reviews))", font:UIFont.systemFontOfSize(12))>>
                            < .view/>
                            < "$4.99"==.width(50).height(25).backgroundColor(.cyanColor())>>
                        < .view/>
                    < .view/>
                < .view/>
                < .flexRow()+>
                    < .view(.style(width:15, height:15, backgroundColor:.orangeColor()))>>
                    < "Offers Apple Watch App for iPhone">>
                < .view/>
//                < .view+>
                    < UIViewable.view(segmentedControl).display(.Inline).align(.Top(.Center))>>
//                < .view/>
                < UIViewable().height(1).backgroundColor(.blackColor())>>
                < "App Store Editor's Notes"==.display(.Block)>>
                < "This is a test of the emergency broadcast system"==.display(.Block)>>
                < UIViewable().height(1).backgroundColor(.blackColor())>>
                < "Information"==.display(.Block)>>
                < .view+>
                    < .flexRow()+>
                        < sellerLabelView+>
                            < "Seller:"==.align(.Top(.Right))>>
                        < .view/>
                        < appModel.developer>>
                    < .view/>
                    < .flexRow()+>
                        < .view(.style(width:120))+>
                            < "Category:"==.align(.Top(.Right))>>
                        < .view/>
                        < appModel.category>>
                    < .view/>
                    < .flexRow()+>
                        < .view(.style(width:120))+>
                            < "Compatibility:"==.align(.Top(.Right))>>
                        < .view/>
                        < "Requires iOS 9.0 or later. Compatible with iPhone, iPad, and iPos touch.">>
                    < .view/>
                < .view/>
            < .view/>
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
//        self.thirdWidthStyle.width = CGFloat(self.view.frame.width * 0.33)
        self.sellerLabelView.width(CGFloat(self.view.frame.width * 0.33))
    }
}
