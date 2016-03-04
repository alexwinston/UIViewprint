//
//  ViewController12.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class ViewController14: UITableViewableController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 12"
        self.edgesForExtendedLayout = UIRectEdge.None;
        
        self.table(
            header: label("Header"),
            sections: [
                section(touchRow,
                    header: "Section One",
                    rows: [
                        row(
                            div(
                                label("Left 1"),
                                label("Right 1").align(.Top(.Right))
                            )
                        ),
                        row(label("Row 2")),
                        row(label("Row 3")),
                        row(label("Row 4")),
                        row(label("Row 5")),
                        row(label("Row 6")),
                        row(label("Row 7")),
                        row(label("Row 8")),
                        row(label("Row 9")),
                        row(label("Row 10")),
                        row(label("Row 11")),
                        row(label("Row 12")),
                        row(label("Row 13")),
                        row(label("Row 14")),
                        row(label("Row 15")),
                        row(label("Row 16")),
                        row(label("Row 17")),
                        row(label("Row 18")),
                        row(label("Row 19")),
                        row(label("Row 20")),
                        row(label("Row 21")),
                        row(label("Row 22")),
                        row(label("Row 23")),
                        row(label("Row 24")),
                        row(label("Row 25")),
                        row(label("Row 26")),
                        row(
                            div(
                                label("Left 27"),
                                label("Right 27").align(.Top(.Right))
                            )
                        )
                    ]
                ),
                section(touchRow,
                    header: "Section Two",
                    rows: [
                        row(
                            div(
                                label("Left 2-1"),
                                label("Right 2-1").align(.Top(.Right))
                            )
                        ),
                        row(label("Row 2-2")),
                        row(label("Row 2-3")),
                        row(label("Row 2-4")),
                        row(label("Row 2-5")),
                        row(label("Row 2-6")),
                        row(label("Row 2-7")),
                        row(label("Row 2-8")),
                        row(label("Row 2-9")),
                        row(label("Row 2-10")),
                        row(label("Row 2-11")),
                        row(label("Row 2-12")),
                        row(label("Row 2-13")),
                        row(label("Row 2-14")),
                        row(label("Row 2-15")),
                        row(label("Row 2-16")),
                        row(label("Row 2-17")),
                        row(label("Row 2-18")),
                        row(label("Row 2-19")),
                        row(label("Row 2-20")),
                        row(label("Row 2-21")),
                        row(label("Row 2-22")),
                        row(label("Row 2-23")),
                        row(label("Row 2-24")),
                        row(label("Row 2-25")),
                        row(label("Row 2-26")),
                        row(
                            div(
                                label("Left 2-27"),
                                label("Right 2-27").align(.Top(.Right))
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