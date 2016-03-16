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

class AppDetails {
    var name:String = ""
    var developer:String = ""
    var rating:String = ""
    var category:String = ""
    var price:String = ""
    var reviews:Int = 0
    var editorsNotes:String = ""
}

class StarView:UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect:CGRect) {
        let aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [ 1.0, 149.0/255.0, 0.0, 1.0 ])
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 1.0)
        
        CGContextBeginPath(context)
        CGContextSetFillColorWithColor(context, aColor)
        CGContextSetStrokeColorWithColor(context, aColor)
        
        let xCenter:CGFloat = 5.0
        let yCenter:CGFloat = 5.5
        
        let w:CGFloat = 10.0
        let r:CGFloat = w / 2.0;
        let flip:CGFloat = -1.0;
        let theta:CGFloat = 2.0 * CGFloat(M_PI) * CGFloat(2.0 / 5.0) // 144 degrees
        
        CGContextMoveToPoint(context, xCenter, r*flip+yCenter)
        
        for (var k=1; k<5; k++) {
            let x = r * sin(CGFloat(k) * theta)
            let y = r * cos(CGFloat(k) * theta)
            CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter)
        }
        
        CGContextClosePath(context)
        CGContextFillPath(context)
    }
}

class ViewController1: UIScrollViewableController {
    
    var sellerLabel:UIViewable?
    var categoryLabel:UIViewable?
    var compatibilityLabel:UIViewable?

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDetails = AppDetails()
        appDetails.name = "Day One 2 Journal + Notes"
        appDetails.developer = "Bloom Built, LLC"
        appDetails.rating = " 4+"
        appDetails.category = "Lifestyle"
        appDetails.price = "4.99"
        appDetails.reviews = 385
        appDetails.editorsNotes = "It's hard to make the best even better, but the sequel to Day One lives up to the expectations -- and then some."

        super.scrollView.addSubview(
            div(style(padding:(10,0,0,0)),
                div(style(display:.Flex(.Row), padding:(0,right:10,0,10)),
                    // TODO image padding right
                    image("logo", style:style(width:80, height:80), appearance:logoStyle),
                    div(style(padding:(0,0,0,10)),
                        div(.Flex(.Row),
                            label(appDetails.name),
                            label(appDetails.rating, style:style(width:20, padding:(0,right:10,0,0)), appearance:ratingLabelStyle)
                        ),
                        div(
                            label("\(appDetails.developer)", font:.systemFontOfSize(12)),
                            label(" >", font:.systemFontOfSize(11))
                        ),
                        div(
                            label("Editors' Choice", style:style(padding:(1,5,1,5)), appearance:editorsChoiceLabelStyle)
                        ),
                        div(style(display:.Flex(.Row)),
                            div(style(display:.Flex(.Row), align:.Bottom(.Left)),
                                div(style(display:.Flex(.Row), align:.Middle(.Left), width:55), subviews:
                                    div(foreach:[Int](1...5)) { (i:Int) in
                                        return StarView(frame:CGRect(x:0, y:0, width:10, height:10))
                                    }
                                ),
                                label("(\(appDetails.reviews))", font:.systemFontOfSize(10))
                            ),
                            div(style(width:52, height:24), appearance:priceStyle,
                                label("+", font:.boldSystemFontOfSize(8), style:style(align:.Top(.Left), padding:(0,0,0,3))),
                                label("$\(appDetails.price)", font:.boldSystemFontOfSize(12)).align(.Middle(.Left))
                            )
                        )
                    )
                ),
                div(style(display:.Flex(.Row), padding:(10,10,0,10)),
                    image("logo", style:style(width:15,height:15), appearance:watchLogoStyle),
                    label("Offers Apple Watch App for iPhone", style:style(align:.Middle(.Left), padding:(0,0,0,5)), appearance:watchLabelStyle)
                ),
                segment(style(align:.Top(.Center), padding:(10,0,0,0)), items:["Details", "Reviews", "Related"], color:.grayColor()),
                hr(padding:(top:10,0,0,0), color:.lightGrayColor()),
                div(style(padding:(0,0,0,left:10)),
                    div(style(height:40),
                        label("App Store Editors' Notes").align(.Middle(.Left))
                    ),
                    label(appDetails.editorsNotes, style:style(display:.Block), font:.systemFontOfSize(12)),
                    hr(padding:(top:10,0,0,0), color:.lightGrayColor()),
                    div(style(display:.Flex(.Row), padding:(top:10,0,0,0)),
                        image("gamecenter").width(30).height(30),
                        div(style(padding:(0,0,0,left:10)),
                            label("Game Center", font:.systemFontOfSize(12), style:style(display:.Block)),
                            label("Challenge friends and check leaderboards and achievements.", style:style(display:.Block), appearance:informationLabelStyle)
                        )
                    ),
                    hr(padding:(top:10,0,bottom:10,0), color:.lightGrayColor()),
                    label("Information", style:style(display:.Block)),
                    div(style(padding:(top:5,0,0,0)),
                        informationItem(&sellerLabel, title:"Seller", description:appDetails.developer),
                        informationItem(&categoryLabel, title:"Category", description:appDetails.category),
                        informationItem(&compatibilityLabel, title:"Compatibility", description:"Requires iOS 9.0 or later. Compatible with iPhone, iPad, and iPos touch.")
                    )
                )
            )
        )
    }

    func informationItem(inout view:UIViewable?, title:String, description:String) -> UIViewable {
        return
            div(.Flex(.Row),
                div(&view, style(padding:(0,right:10,0,0)),
                    label(title, appearance:informationLabelStyle).align(.Top(.Right))
                ),
                label(description, font:.systemFontOfSize(12))
            )
    }

    func layerStyle(layer:CALayer, borderWidth:CGFloat, borderColor:UIColor, cornerRadius:CGFloat = 0) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.CGColor
        layer.cornerRadius = cornerRadius
    }

    func logoStyle(view:UIImageView) {
        layerStyle(view.layer, borderWidth:0.5, borderColor:.grayColor(), cornerRadius:15.0)
        view.clipsToBounds = true
    }

    func watchLogoStyle(view:UIView) {
        layerStyle(view.layer, borderWidth:0.5, borderColor:.grayColor(), cornerRadius:7.5)
        view.clipsToBounds = true
    }

    func watchLabelStyle(label:UILabel) {
        label.textColor = UIColor(red: 106/255.0, green: 113/255.0, blue: 127/255.0, alpha: 1.0)
        label.font = .boldSystemFontOfSize(10.0)
    }

    func ratingLabelStyle(label:UILabel) {
        layerStyle(label.superview!.layer, borderWidth:1, borderColor:.grayColor())
        label.textColor = .lightGrayColor()
        label.font = .systemFontOfSize(11)
        label.textAlignment = .Right
    }

    func editorsChoiceLabelStyle(label:UILabel) {
        label.superview!.backgroundColor = .grayColor()
        label.superview!.layer.cornerRadius = 7
        label.superview!.clipsToBounds = true
        
        label.textColor = .whiteColor()
        label.font = .systemFontOfSize(10.0)
    }

    func priceStyle(view:UIView) {
        layerStyle(view.layer, borderWidth:1, borderColor:view.self.tintColor!, cornerRadius:4.0)
        view.clipsToBounds = true
    }

    func informationLabelStyle(label:UILabel) {
        label.textColor = .lightGrayColor()
        label.font = .systemFontOfSize(12.0)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let informationItemWidth = CGFloat(self.view.frame.width * 0.3)
        self.sellerLabel!.width(informationItemWidth)
        self.categoryLabel!.width(informationItemWidth)
        self.compatibilityLabel!.width(informationItemWidth)
    }
}
