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
//                    let s = s as! App
                    let s = s as! Int
                    return div(
                        div(style(height:10)),
                        div(.Flex(.Row),
                            div(style(width:10)),
                            div(
                                label("Left \(s)").display(.Block),
                                label("Right \(s)").align(.Top(.Right))
                            )
                        ),
                        div(style(height:10))
                    )
//                    return div(
//                        label("Left \(s)").display(.Block),
//                        label("Right \(s)").align(.Top(.Right))
//                    )
                }
            ],
            footer: div(
                button("Redeem", touch:handleRedeem),
                button("Send Gift", touch:handleSendGift)
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