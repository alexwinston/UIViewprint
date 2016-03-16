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

func input(placeholder placeholder:String, style:UIViewableStyle = UIViewableStyle(), appearance:((UITextField) -> Void)? = nil) -> UIViewable {
    var textField:UITextField?
    return input(&textField, placeholder:placeholder, style:style, appearance:appearance)
}
func input(inout id:UITextField?, placeholder:String, var style:UIViewableStyle = UIViewableStyle(), appearance:((UITextField) -> Void)? = nil) -> UIViewable {
    let textField = UITextField()
    textField.placeholder = placeholder
    textField.sizeToFit()
    
    if let appearance = appearance {
        appearance(textField)
    }
    
    if style.display == nil {
        style.display = .Flex(.Row)
    }
    if style.height != -1 {
        style.height = textField.frame.height
    }
    
    let viewable = UIViewable(style:style)
    viewable.addSubview(textField)
    
    id = textField
    
    return div(style, subviews:[viewable])
}

// UIViewableStyle helper functions
func align(align:UIViewableAlign) -> UIViewableStyle {
    return UIViewableStyle(align:align)
}

class ViewController10: UIViewableController {

    var instructionsLabel:UIViewable?
    var emailTextField:UITextField?
    var passwordTextField:UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Example 6"
        self.edgesForExtendedLayout = UIRectEdge.None;

//        self.view.addSubview(
//            div(align(.Middle(.Left)),
//                label(&instructionsLabel, text:"Please enter your login credentials.", style:align(.Top(.Center))).display(.Block),
//                div(height(10)),
//                div(.Flex(.Row),
//                    div(style(width:100),
//                        label("Email", style:align(.Top(.Right)))
//                    ),
//                    input(&emailTextField, placeholder:"john@doe.com", appearance:roundedCorners)
//                ),
//                div(.Flex(.Row),
//                    div(style(width:100),
//                        label("Password", style:align(.Top(.Right)))
//                    ),
//                    input(placeholder:"", appearance:roundedCorners)
//                ),
//                div(height(10)),
//                button("Login", display:.Flex(.Row), touch:login)
//            )
//        )
        
        self.view.addSubview(
            div(.Flex(.Column),
                div(),
                div(style(padding:(0,right:10,0,left:10)),
                    input(&emailTextField, placeholder:"Email", style:style(padding:(0,0,bottom:5,0)), appearance:largeFontRoundedCorners),
                    input(placeholder:"Password", appearance:largeFontRoundedCorners)
                ),
                div(),
                div(
                    button("Login", display:.Flex(.Row), align:.Bottom(.Left), height:80, touch:login)
                )
            )
        )
    }

    func roundedCorners(textField:UITextField) {
        textField.borderStyle = .RoundedRect
    }
    
    func login(button:UIButton) {
        print(emailTextField!.text)
        if let instructionsLabel = instructionsLabel?.subviews[0] as? UILabel {
            instructionsLabel.text = "This is a test of the emergency broadcast system"
        }
//        self.view.subviews[0].setNeedsLayout()
        if let superview = instructionsLabel?.superview as? UIViewable {
            superview.setNeedsLayout()
        }
    }
    
    func largeFontRoundedCorners(view:UIView) {
        if let textField = view as? UITextField {
            textField.borderStyle = .RoundedRect
            textField.frame.size.height = 54
            textField.font = UIFont(name: "HelveticaNeue-Light", size: 26)
            textField.returnKeyType = .Done
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.debugSubviews(self.view, indent: "")
    }
}