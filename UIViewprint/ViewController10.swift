//
//  ViewController10.swift
//  Blueprint
//
//  Created by Alex Winston on 2/11/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

func div() -> UIViewable { return div(UIViewableStyle()) }
func div(subviews:UIViewable...) -> UIViewable {
    return div(UIViewableStyle(), subviews:subviews)
}
func div(style:UIViewableStyle, subviews:[UIViewable]) -> UIViewable {
    let viewable = UIViewable(style:style)
    for subview in subviews {
        viewable.addSubview(subview)
    }

    return viewable
}
func div(style:UIViewableStyle, _ subviews:UIViewable...) -> UIViewable {
    return div(style, subviews:subviews)
}
func div(display:UIViewableDisplay = .Block, align:UIViewableAlign = .Top(.Left), padding:(top:CGFloat, right:CGFloat, bottom:CGFloat, left:CGFloat) = (0, 0, 0, 0), _ subviews:UIViewable...) -> UIViewable {
    let style = UIViewableStyle(display:display, align:align, padding:padding)
    return div(style, subviews:subviews)
}
func div(foreach foreach:[String], _ view:(String) -> UIView) -> UIView { return UIView() }

// UIViewable control helpers
func button2(title:String, var style:UIViewableStyle = UIViewableStyle(), height:CGFloat? = nil, touch:(UIButton) -> Void) -> UIViewable {
    // TODO .button
    let button = UIButton()
    button.setTitle(title, forState: .Normal)
    button.backgroundColor = .blueColor()
    button.addAction([.TouchUpInside], touch)
    button.sizeToFit()
    
    if let height = height {
        button.frame.size.height = height
    }
    
    if style.display == nil {
        style.display = .Inline
    }
    
    let viewable = UIViewable(style:style)
    viewable.addSubview(button)
//    viewable.align(style.align)
    
    return div(style, subviews:[viewable])
}
func input(placeholder placeholder:String, style:UIViewableStyle = UIViewableStyle(), appearance:((UITextField) -> Void)? = nil) -> UIViewable {
    var textField:UITextField?
    return input(&textField, placeholder:placeholder, style:style, appearance:appearance)
}
func input(inout id:UITextField?, placeholder:String, style:UIViewableStyle = UIViewableStyle(), appearance:((UITextField) -> Void)? = nil) -> UIViewable {
    let textField = UITextField()
    textField.placeholder = placeholder
    textField.sizeToFit()
    
    if let appearance = appearance {
        appearance(textField)
    }
    
    let viewable = UIViewable(style:UIViewableStyle(display:.Flex(.Row), height:textField.frame.height))
    viewable.addSubview(textField)
    
    id = textField
    
    return div(style, subviews:[viewable])
}
// TODO deprecate label, handle style.display default more intelligently
func label2(text:String, lineBreakMode:NSLineBreakMode = .ByWordWrapping, numberOfLines:Int = 0, font:UIFont? = nil, var style:UIViewableStyle = UIViewableStyle(), appearance:((UILabel) -> Void)? = nil) -> UIViewable {
    let label = UILabel()
    label.lineBreakMode = lineBreakMode
    label.numberOfLines = numberOfLines
    label.text = text
    if let font = font {
        label.font = font
    }
    
    if style.display == nil {
        style.display = .Inline
    }
    let viewable = UIViewable(style:style)
    viewable.addSubview(label)
    
    if let appearance = appearance {
        appearance(label)
    }
    label.sizeToFit()
    
    return div(style, subviews:[viewable])
}
func span(width width:CGFloat = -1) -> UIView { return UIView() }

// UIViewableStyle helper functions
func align(align:UIViewableAlign) -> UIViewableStyle {
    return UIViewableStyle(align:align)
}
func padding(top:CGFloat, _ right:CGFloat, _ bottom:CGFloat, _ left:CGFloat) -> UIViewableStyle {
    return UIViewableStyle(padding:UIPadding(top, right, bottom, left))
}

class ViewController10: UIViewableController {

    var emailTextField:UITextField?
    var passwordTextField:UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Example 6"
        self.edgesForExtendedLayout = UIRectEdge.None;
        
//        self.view
//            < .view+>
//                < .view(style(display:.Inline, backgroundColor:.yellowColor()))+>
//                    < .view(style(display:.Block, height:10, backgroundColor:.purpleColor()))>>
//                    < .view(style(display:.Inline, width:10, height:5, backgroundColor:.redColor()))>>
//                    < .view(style(display:.Inline, backgroundColor:.orangeColor()))+>
//                        < "Testing">>
//                    < .view/>
//                    < .view(style(display:.Inline, width:10, height:5, backgroundColor:.redColor()))>>
//                    < .view(style(display:.Block, height:10, backgroundColor:.purpleColor()))>>
//                < .view/>
//                < "Test">>
//            < .view/>
//        self.view
//            < UIViewable().align(.Middle(.Left))+>
//                < "Please enter your login credentials"==.align(.Top(.Center))>>
//                < .view(style(height:10))>>
//                < .flexRow()+>
//                    < .view(style(width:100))+>
//                        < "Email:"==.align(.Top(.Right))>>
//                    < .view/>
//                    < input(&emailTextField, placeholder:"john@doe.com", style:roundedCorners)>>
//                < .view/>
//                < .flexRow()+>
//                    < .view(style(width:100))+>
//                        < "Password:"==.align(.Top(.Right))>>
//                    < .view/>
//                    < input(&passwordTextField, placeholder:"", style:roundedCorners)>>
//                < .view/>
//                < .view(style(height:20))>>
//                < button("Login", display:.Flex(.Row), touch:login)>>
//            < .view/>

//        self.view.addSubview(
//            div(align:.Middle(.Left),
//                div(style(display:.Flex(.Row), width:10, height:10, backgroundColor:.greenColor())),
//                div(style(padding:(10,10,10,10), backgroundColor:.orangeColor()),
//                    div(style(padding:(10,10,10,10), backgroundColor:.yellowColor()),
//                        label2("Test")
//                    )
//                ),
//                div(style(display:.Inline, padding:(10,10,10,10), backgroundColor:.orangeColor()),
////                    div(style(display:.Inline, padding:(10,10,10,10), backgroundColor:.yellowColor()),
//                        label2("Test")
////                    )
//                ),
//                div(),
//                label2("Please enter your login credentials",
//                    style:style(align:.Top(.Center), padding:(0, 0, 10, 0))),
//                // TODO Flex.Row top and bottom padding
////                div(.Flex(.Row), padding:(0,0,10,0),
//                div(.Flex(.Row),
//                    div(style(width:100),
//                        label2("Email", style:style(align:.Top(.Right), padding:(0,10,0,0)))
//                    ),
//                    input(placeholder:"john@doe.com", appearance:roundedCorners)
//                ),
//                button2("Login", style:style(display:.Flex(.Row), padding:(10,0,0,0)), touch:login)
//            )
//        )

        self.view.addSubview(
            div(.Flex(.Column),
                div(),
                div(.Flex(.Row),
                    div(style(width:10)),
                    div(
                        input(&emailTextField, placeholder:"Email", appearance:largeFontRoundedCorners),
                        div(style(height:10)),
                        input(placeholder:"Password", appearance:largeFontRoundedCorners)
                    ),
                    div(style(width:10))
                ),
                div(),
                div(
                    button("Login", display:.Flex(.Row), align:.Bottom(.Left), height:80, touch:login)
                )
            )
        )

//        self.view
//            < .flexColumn()+>
//                < .view>>
//                < .flexRow()+>
//                    < .view(style(width:10))>>
//                    < .view+>
//                        < input(&emailTextField, placeholder:"Email", style:largeRoundedStyle)>>
//                        < .view(style(height:10))>>
//                        < input("Password", style:largeRoundedStyle)>>
//                    < .view/>
//                    < .view(style(width:10))>>
//                < .view/>
//                < .view>>
//                < .view+>
//                    < UIView.button("Login", display:.Flex(.Row), height:80, touch:login).align(.Bottom(.Left))>>
//                < .view/>
//            < .view/>
    }

    func roundedCorners(textField:UITextField) {
        textField.borderStyle = .RoundedRect
    }
    
    func login(button:UIButton) {
        print(emailTextField!.text)
    }
    
    func largeFontRoundedCorners(view:UIView) {
        if let textField = view as? UITextField {
            textField.borderStyle = .RoundedRect
            textField.frame.size.height = 60
            textField.font = UIFont(name: "HelveticaNeue-Light", size: 26)
            textField.returnKeyType = .Done
        }
    }
}