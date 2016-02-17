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
                    < .flexColumn()+>
                        < label("Top Left").align(.Top(.Left)).backgroundColor(.yellowColor())>>
                    < .view/>
                    < .flexColumn()+>
                        < label("Top Center").align(.Top(.Center)).backgroundColor(.orangeColor())>>
                    < .view/>
                    < .flexColumn()+>
                        < label("Top Right").align(.Top(.Right)).backgroundColor(.redColor())>>
                    < .view/>
                < .view/>
                < .view(style(.Flex(.Row), backgroundColor:.lightGrayColor()))+>
                    < .flexColumn()+>
                        < label("Mid Left").align(.Middle(.Left)).backgroundColor(.yellowColor())>>
                    < .view/>
                    < .flexColumn()+>
                        < label("Mid Center").align(.Middle(.Center)).backgroundColor(.orangeColor())>>
                    < .view/>
                    < .flexColumn()+>
                        < label("Mid Right").align(.Middle(.Right)).backgroundColor(.redColor())>>
                    < .view/>
                < .view/>
                < .flexRow()+>
                    < .flexColumn()+>
                        // TODO Fix problem with label not truncating
                        < label("Bottom Left Test", lineBreakMode:.ByTruncatingTail, numberOfLines:1).align(.Bottom(.Left)).backgroundColor(.yellowColor())>>
                    < .view/>
                    < .flexColumn()+>
                        < label("Bottom Ctr").align(.Bottom(.Center)).backgroundColor(.orangeColor())>>
                    < .view/>
                    < .flexColumn()+>
                        < label("Bottom Right").align(.Bottom(.Right)).backgroundColor(.redColor())>>
                    < .view/>
                < .view/>
            < .view/>
    }
}