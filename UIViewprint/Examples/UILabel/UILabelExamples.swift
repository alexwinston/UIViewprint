//
//  UILabelExamples.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class UILabelExamples: UITableViewableController {
    
    let examples: [ExampleControllerDetails] = [
        ExampleControllerDetails(name:"Advanced alignment example", controller:ViewController8.self),
        ExampleControllerDetails(name:"Advanced display example", controller:ViewController11.self),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UILabel examples"
        self.edgesForExtendedLayout = UIRectEdge.None;
        
        self.table(
            sections: [
                section(selectExample, foreach:examples) { (example:AnyObject) in
                    let example = example as! ExampleControllerDetails
                    return self.defaultTableViewCell(example.name)
                }
            ]
        )
        
    }
    
    func selectExample(indexPath:NSIndexPath) {
        let controller:UIViewController = self.examples[indexPath.row].controller.init()
        controller.view.frame = view.bounds
        controller.view.backgroundColor = .whiteColor()
        controller.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}