//
//  ViewController7.swift
//  Blueprint
//
//  Created by Alex Winston on 2/2/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

class ActionView: UIViewable {
    init(_ actionText:String) {
        super.init()
        
        self
            < UIViewable().align(.Top(.Center)).height(60).backgroundColor(.orangeColor())>>
            < actionText==.align(.Top(.Center)).backgroundColor(.yellowColor())>>
    }

    // https://theswiftdev.com/2015/08/05/swift-init-patterns/
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController7: UIViewableController {
    var bannerView:UIViewable = .view(.style(backgroundColor:.lightGrayColor()))
    var avatarView:UIViewable = UIViewable(style:UIViewableStyle(backgroundColor:.grayColor()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 6"
        self.edgesForExtendedLayout = UIRectEdge.None;
        
        // TODO Layout callback? Use parent references?
        self.view = UIViewable()
        self.view
            < bannerView+>
                < .view(.style(.Flex(.Row), align:.Bottom(.Left)))+>
                    < .view(.style(.Flex(.Row)))+>
                        // TODO Incorrect height when orientation changes from landscape to portrait
                        < avatarView>>
                        < .view(.style(align:.Middle(.Left)))+>
                            < "Alex"==.display(.Block)>>
                            < "Winston"==.display(.Block)>>
                        < .view/>
                    < .view/>
                    < UIViewable(style:UIViewableStyle(align:.Bottom(.Left), width:30, height:30, backgroundColor:.blueColor()))>>
                < .view/>
            < .view/>
            < UIViewable().display(.Flex(.Row))+>
                < UIViewable()+>
                    < .view(.style(align:.Top(.Center), width:30, height:30, backgroundColor:.greenColor()))>>
                    < "Test"==.align(.Top(.Center))>>
                < .view/>
                < UIViewable()+>
                    < UIViewable().align(.Top(.Center)).width(30).height(30).backgroundColor(.greenColor())>>
                    < "Test"==.align(.Top(.Center))>>
                < .view/>
                < UIViewable()+>
                    < UIViewable().align(.Top(.Center)).width(30).height(30).backgroundColor(.greenColor())>>
                    < "Test"==.align(.Top(.Center))>>
                < .view/>
                < UIViewable()+>
                    < UIViewable().align(.Top(.Center)).width(30).height(30).backgroundColor(.greenColor())>>
                    < "Test"==.align(.Top(.Center))>>
                < .view/>
            < .view/>
            < UIViewable().display(.Flex(.Row))+>
                < UIViewable().width(10)>>
                < ActionView("About").backgroundColor(.yellowColor())>>
                < UIViewable().width(10)>>
                < ActionView("Photos").backgroundColor(.yellowColor())>>
                < .width(10)>>
                < UIViewable()+>
                    < UIViewable().align(.Top(.Center)).height(60).backgroundColor(.orangeColor())>>
                    < "Test"==.align(.Top(.Center)).backgroundColor(.yellowColor())>>
                < .view/>
                < UIViewable().width(10)>>
            < .view/>
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let isLandscape:Bool = UIDevice.currentDevice().orientation.isLandscape.boolValue
        let bannerHeight:CGFloat = self.view.frame.height * 0.43
        let avatarHeightMultipler:CGFloat = isLandscape ? 0.75 : 0.43
        let avatarSize = bannerHeight * avatarHeightMultipler
        
        self.bannerView.height(bannerHeight)
        self.avatarView.width(avatarSize).height(avatarSize)
    }
}