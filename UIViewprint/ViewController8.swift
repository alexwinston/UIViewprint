//
//  ViewController8.swift
//  Blueprint
//
//  Created by Alex Winston on 2/1/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

infix operator < { associativity left }

class ViewController8: UIViewableController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 7"
        
        self.edgesForExtendedLayout = UIRectEdge.None;
        self.view
            < .flexColumn()+>
                < .flexRow()+>
                    < .view+>
                        < "Top Left"==.align(.Top(.Left)).backgroundColor(.yellowColor())>>
                    < .view/>
                    < .view+>
                        < "Top Center"==.align(.Top(.Center)).backgroundColor(.orangeColor())>>
                    < .view/>
                    < .view+>
                        < "Top Right"==.align(.Top(.Right)).backgroundColor(.redColor())>>
                    < .view/>
                < .view/>
                < UIViewable().style(UIViewableStyle(display:.Flex(.Row), backgroundColor:.lightGrayColor()))+>
                    < UIViewable().align(.Middle(.Left))+>
                        < "Mid Left"==.backgroundColor(.yellowColor())>>
                    < .view/>
                    < UIViewable().align(.Middle(.Center))+>
                        < "Mid Center"==.align(.Middle(.Center)).backgroundColor(.orangeColor())>>
                    < .view/>
                    < UIViewable().align(.Middle(.Right))+>
                        < "Mid Right"==.align(.Middle(.Right)).backgroundColor(.redColor())>>
                    < .view/>
                < .view/>
                < .flexRow()+>
                    // TODO Consider seperating X and Y alignment
                    // NOTE Labels need additional alignment because they are wrapped by viewables
                    < UIViewable().align(.Bottom(.Left))+>
                        < "Bottom Left Test"==.align(.Bottom(.Left)).backgroundColor(.yellowColor())>>
                    < .view/>
                    < UIViewable().align(.Bottom(.Center))+>
                        < "Bottom Ctr"==.align(.Bottom(.Center)).backgroundColor(.orangeColor())>>
                    < .view/>
                    < UIViewable().align(.Bottom(.Right))+>
                        < "Bottom Right"==.align(.Bottom(.Right)).backgroundColor(.redColor())>>
                    < .view/>
                < .view/>
            < .view/>
    }
}