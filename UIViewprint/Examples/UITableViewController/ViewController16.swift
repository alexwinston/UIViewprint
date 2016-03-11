//
//  ViewController16.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class App {
    var name:String
    
    init(name:String) {
        self.name = name
    }
}

class ViewController16: UITableViewableController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Example 16"
        self.edgesForExtendedLayout = UIRectEdge.None;

        let apps:[App] = [
            App(name:"iSlash Heroes"),
            App(name:"Tomb of the Mask"),
            App(name:"Day One 2 Journal + Notes + diary"),
            App(name:"twofold inc."),
            App(name:"Guides by Lonely Planet"),
            App(name:"Dungelot: Shattered Lands"),
            App(name:"iSlash Heroes"),
            App(name:"Tomb of the Mask"),
            App(name:"Day One 2 Journal + Notes + diary"),
            App(name:"twofold inc."),
            App(name:"Guides by Lonely Planet"),
            App(name:"Dungelot: Shattered Lands")
        ]

        self.table(
            header: div(style(height:100, backgroundColor:.lightGrayColor()),
                label("Editors' Choice", style:style(align:.Middle(.Center)))
            ),
            sections: [
                section(touchRow,
                    rows: [
                        row(
                            label("Our editors continually sift through the latest releases and updates, recognizing the most invaluable apps and the most entertaining games as Editors' Choice selections.").display(.Block)
                        )
                    ]
                ),
                section(touchRow, foreach:[Int](1...1000)) { (s:AnyObject) in
                    let s = s as! Int
//                section(touchRow, foreach:apps) { (s:AnyObject) in
//                    let s = s as! App
                    return div(padding:(top:10, right:10, bottom:10, left:10),
                        label("Left \(s)").display(.Block),
                        label("Right \(s)").align(.Top(.Right))
                    )
                },
                section(touchRow,
                    rows: [
                        div(.Flex(.Row),
                            button("Redeem", touch:handleRedeem).display(.Flex(.Row)).padding((10,10,10,10)),
                            button("Send Gift", touch:handleSendGift).display(.Flex(.Row)).padding((10,10,10,10))
                        )
                    ]
                ),
                section(touchRow,
                    rows: [
                        div(style(display:.Flex(.Row), padding:(top:10, right:10, bottom:10, left:10)),
                            button("Redeem", touch:handleRedeem).display(.Flex(.Row)),
                            button("Send Gift", touch:handleSendGift).display(.Flex(.Row))
                        )
                    ]
                )
            ],
            footer: div(style(display:.Flex(.Row), padding:(top:5, right:5, bottom:5, left:5)),
                button("Redeem", touch:handleRedeem).display(.Flex(.Row)).style(
                    style(padding:(10,10,10,10), backgroundColor:.lightGrayColor())),
                button("Send Gift", touch:handleSendGift).display(.Flex(.Row)).style(
                    style(padding:(10,10,10,10), backgroundColor:.grayColor()))
            )
        )

    }

    func touchRow(indexPath:NSIndexPath) {
        print("touch \(indexPath.section) \(indexPath.row)")
    }
    
    func handleRedeem(button:UIButton) {
    }
    
    func handleSendGift(button:UIButton) {
    }
}