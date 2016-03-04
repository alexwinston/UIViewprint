//
//  ViewController15.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class ViewController15: UITableViewableController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Example 15"
        self.edgesForExtendedLayout = UIRectEdge.None;

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
                section(touchRow,
                    rows: [
                        row(
                            div(
                                label("Left 2-1"),
                                label("Right 2-1").align(.Top(.Right))
                            )
                        )
                    ]
                )
            ],
            footer: div(style(height:100, backgroundColor:.yellowColor()),
                label("Foot 1").backgroundColor(.grayColor()),
                label("Foot 2").align(.Top(.Right)).backgroundColor(.orangeColor())
            )
        )
    }
    
    func touchRow(indexPath:NSIndexPath) {
        print("touch \(indexPath.section) \(indexPath.row)")
    }
}