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

class ViewController7: UIViewableController {
//    var bannerView:UIViewable = UIViewable().backgroundColor(UIColor(patternImage:UIImage(named:"banner")!))
    var bannerView:UIViewable = UIViewable()
    var avatarImageView:UIViewable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 6"
        self.edgesForExtendedLayout = .None;
        
        // http://stackoverflow.com/questions/10629403/ios-colorwithpatternimage-stretch-image-full-screen
        bannerView.layer.contents = UIImage(named:"banner")?.CGImage
        
        self.view
            < .view(.style(backgroundColor:.lightGrayColor()))+>
                < bannerView+>
                    < .view(.style(.Flex(.Row), align:.Bottom(.Left)))+>
                        < .view(.style(.Flex(.Row)))+>
                            < width(10)>>
                            // TODO Incorrect height when orientation changes from landscape to portrait
                            < image(&avatarImageView, name:"avatar")>>
                            < .view(.style(align:.Middle(.Left)))+>
                                < label("Alex", display:.Block, style:avatarNameStyle)>>
                                < label("Winston", display:.Block, style:avatarNameStyle)>>
                            < .view/>
                        < .view/>
                        < image("camera").align(.Bottom(.Left)).width(30).height(30)>>
                        < width(10)>>
                    < .view/>
                < .view/>
                < UIViewable().display(.Flex(.Row))+>
                    < buttonBarItemView("Post", labelAlign:.Top(.Center), imageName:"post", imageDisplay:.Block, imageAlign:.Top(.Center))>>
                    < buttonBarItemView("Update Info", labelAlign:.Top(.Center), imageName:"updateInfo", imageDisplay:.Block, imageAlign:.Top(.Center))>>
                    < buttonBarItemView("Activity Log", labelAlign:.Top(.Center), imageName:"activityLog", imageDisplay:.Block, imageAlign:.Top(.Center))>>
                    < buttonBarItemView("More", labelAlign:.Top(.Center), imageName:"more", imageDisplay:.Block, imageAlign:.Top(.Center))>>
                < .view/>
                < height(10)>>
                < UIViewable().display(.Flex(.Row))+>
                    < width(10)>>
                    < imageLabelView("About", imageName:"about")>>
                    < width(10)>>
                    < imageLabelView("Photos", imageName:"photos")>>
                    < width(10)>>
                    < imageLabelView("Friends", imageName:"friends")>>
                    < width(10)>>
                < .view/>
                < height(10)>>
                < UIViewable().display(.Flex(.Row))+>
                    < width(10)>>
                    < buttonBarItemView("Post", imageName:"post")>>
                    < buttonBarItemView("Photo", imageName:"activityLog")>>
                    < buttonBarItemView("Life Event", imageName:"more")>>
                    < width(10)>>
                < .view/>
                < height(10)>>
            < .view/>
    }
    
    func buttonBarItemView(labelText:String, labelAlign:UIViewableAlign? = .Middle(.Left), imageName:String, imageDisplay:UIViewableDisplay? = .Inline, imageAlign:UIViewableAlign? = .Top(.Left)) -> UIView {
        func buttonLabelStyle(label:UILabel) {
            label.textColor = UIColor(red: 106/255.0, green: 113/255.0, blue: 127/255.0, alpha: 1.0)
            label.font = .systemFontOfSize(13.0)
        }
        
        return UIViewable().backgroundColor(.whiteColor())
            < image(imageName).display(imageDisplay!).align(imageAlign!).width(28).height(28)>>
            < label(labelText, style:buttonLabelStyle).align(labelAlign!)>>
    }
    
    func imageLabelView(labelText:String, imageName:String) -> UIView {
        func imageLabelStyle(label:UILabel) {
            label.textColor = UIColor.blackColor()
            label.font = UIFont.boldSystemFontOfSize(14.0)
        }
        
        return UIViewable().backgroundColor(.whiteColor())
            < image(imageName, contentMode:.ScaleAspectFill).display(.Block).align(.Top(.Center)).height(60)>>
            < label(labelText, style:imageLabelStyle).align(.Top(.Center))>>
    }

    func avatarNameStyle(label:UILabel) {
        label.font = UIFont(name: "HelveticaNeue-Light", size: 33)
        label.textColor = .whiteColor()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let isLandscape:Bool = UIDevice.currentDevice().orientation.isLandscape.boolValue
        let bannerHeight:CGFloat = self.view.frame.height * 0.43
        let avatarHeightMultipler:CGFloat = isLandscape ? 0.75 : 0.43
        let avatarSize = bannerHeight * avatarHeightMultipler
        
        self.bannerView.height(bannerHeight)
        self.avatarImageView!.width(avatarSize).height(avatarSize)
    }
}