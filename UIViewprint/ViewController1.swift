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
    
    var sellerItem = UIViewable()
    var categoryItem = UIViewable()
    var compatibilityItem = UIViewable()
    
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

        super.scrollView
            < .view+>
                < .view(style(height:10))>>
                < .flexRow()+>
                    < width(10)>>
                    < image("logo").width(80).height(80).style(logoStyle)>>
                    < width(10)>>
                    < .view+>
                        < .flexRow()+>
                            < appDetails.name>>
                            < label(appDetails.rating, appearance:ratingLabelStyle).width(20)>>
                            < width(10)>>
                        < .view/>
                        < .view+>
                            < label("\(appDetails.developer)", font:.systemFontOfSize(12))>>
                            < label(" >", font:.systemFontOfSize(11))>>
                        < .view/>
                        < .view+>
                        < label("Editors' Choice", appearance:editorsChoiceLabelStyle)>>
                        < .view/>
                        < .flexRow()+>
                            < .view(style(display:.Flex(.Row), align:.Bottom(.Left)))+>
                                < .view(style(display:.Flex(.Row), align:.Middle(.Left), width:55))+>
                                    < CircleView(frame:CGRect(x:0, y:0, width:10, height:10))>>
                                    < CircleView(frame:CGRect(x:0, y:0, width:10, height:10))>>
                                    < CircleView(frame:CGRect(x:0, y:0, width:10, height:10))>>
                                    < CircleView(frame:CGRect(x:0, y:0, width:10, height:10))>>
                                    < CircleView(frame:CGRect(x:0, y:0, width:10, height:10))>>
                                < .view/>
                                < label("(\(appDetails.reviews))", font:.systemFontOfSize(10))>>
                            < .view/>
                            < width(50).height(20).style(priceStyle)+>
                                < .view(style(display:.Inline, width:3))>>
                                < label("+", font:.boldSystemFontOfSize(8)).align(.Top(.Left))>>
                                < label("$\(appDetails.price)", font:.boldSystemFontOfSize(12)).align(.Middle(.Left))>>
                            < .view/>
                            < width(10)>>
                        < .view/>
                    < .view/>
                < .view/>
                < height(10)>>
                < .flexRow()+>
                    < width(10)>>
                    < image("logo").width(15).height(15).style(watchLogoStyle)>>
                    < width(5)>>
                    < label("Offers Apple Watch App for iPhone", appearance:watchLabelStyle).align(.Middle(.Left))>>
                < .view/>
                < height(10)>>
                < segment(items:["Details", "Reviews", "Related"], color:.grayColor()).align(.Top(.Center))>>
                < hr(padding(top:10), color:.lightGrayColor())>>
                < .flexRow()+>
                    < width(10)>>
                    < .view+>
                        < .view(style(height:40))+>
                            < label("App Store Editors' Notes").align(.Middle(.Left))>>
                        < .view/>
                        < label(appDetails.editorsNotes, style:style(display:.Block), font:.systemFontOfSize(12))>>
                        < hr(padding(top:10, bottom:10), color:.lightGrayColor())>>
                        < label("Supports", style:style(display:.Block))>>
                        < height(10)>>
                        < .flexRow()+>
                            < image("gamecenter").width(30).height(30)>>
                            < .view+>
                                < label("Game Center", font:.systemFontOfSize(12), style:style(display:.Block))>>
                                < label("Challenge friends and check leaderboards and achievements.", style:style(display:.Block), appearance:informationLabelStyle)>>
                            < .view/>
                        < .view/>
                        < hr(padding(top:10, bottom:10), color:.lightGrayColor())>>
                        < label("Information", style:style(display:.Block))>>
                        < .view+>
                            < informationItem(&sellerItem, title:"Seller", description:appDetails.developer)>>
                            < informationItem(&categoryItem, title:"Category", description:appDetails.category)>>
                            < informationItem(&compatibilityItem, title:"Compatibility", description:"Requires iOS 9.0 or later. Compatible with iPhone, iPad, and iPos touch.")>>
                        < .view/>
                    < .view/>
                    < width(10)>>
                < .view/>
            < .view/>
    }
    
    func informationItem(inout view:UIViewable, title:String, description:String) -> UIView {
        return UIViewable()
            < .flexRow()+>
                < view+>
                    < label(title, appearance:informationLabelStyle).align(.Top(.Right))>>
                < .view/>
                < width(10)>>
                < label(description, font:.systemFontOfSize(12))>>
            < .view/>
    }
    
    func layerStyle(layer:CALayer, borderWidth:CGFloat, borderColor:UIColor, cornerRadius:CGFloat = 0) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.CGColor
        layer.cornerRadius = cornerRadius
    }
    
    func logoStyle(view:UIView) {
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
        label.superview!.layer.cornerRadius = 6
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
        
        let informationItemWidth = CGFloat(self.view.frame.width * 0.25)
        self.sellerItem.width(informationItemWidth)
        self.categoryItem.width(informationItemWidth)
        self.compatibilityItem.width(informationItemWidth)
    }
}
