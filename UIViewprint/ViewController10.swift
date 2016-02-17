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

class ViewController10: UIViewableController {
    
    var emailTextField:UITextField?
    var passwordTextField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 6"
        self.edgesForExtendedLayout = UIRectEdge.None;
        
        self.view
//            < .view(.style(height:10, backgroundColor:.orangeColor()))>>

//            < UIViewable().align(.Middle(.Left))+>
//                < "Please enter your login credentials"==.align(.Top(.Center))>>
//                < .view(.style(height:10))>>
//                < .flexRow()+>
//                    < .view(.style(width:100))+>
//                        < "Email:"==.align(.Top(.Right))>>
//                    < .view/>
//                    < UIView.input(&emailTextField, placeholder:"john@doe.com", style:roundedCorners)>>
//                < .view/>
//                < .flexRow()+>
//                    < .view(.style(width:100))+>
//                        < "Password:"==.align(.Top(.Right))>>
//                    < .view/>
//                    < .input(&passwordTextField, placeholder:"", style:roundedCorners)>>
//                < .view/>
//                < .view(.style(height:20))>>
//                < UIView.button("Login", display:.Flex(.Row), touch:login)>>
//            < .view/>
        
            < .flexColumn()+>
                < .view>>
                < .flexRow()+>
                    < .view(.style(width:10))>>
                    < .view+>
                        < input(&emailTextField, placeholder:"Email", style:largeRoundedStyle)>>
                        < .view(.style(height:10))>>
                        < input("Password", style:largeRoundedStyle)>>
                    < .view/>
                    < .view(.style(width:10))>>
                < .view/>
                < .view>>
                < .view+>
                    < UIView.button("Login", display:.Flex(.Row), height:80, touch:login).align(.Bottom(.Left))>>
                < .view/>
            < .view/>
    }
    
    func roundedCorners(textField:UITextField) {
        textField.borderStyle = .RoundedRect
    }
    
    func login(button:UIButton) {
        print(emailTextField!.text)
    }
    
    func largeRoundedStyle(view:UIView) {
        if let textField = view as? UITextField {
            textField.borderStyle = .RoundedRect
            textField.frame.size.height = 60
            textField.font = UIFont(name: "HelveticaNeue-Light", size: 26)
            textField.returnKeyType = .Done
        }
    }
}