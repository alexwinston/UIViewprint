//
//  AdvancedLayoutExamples.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class AdvancedLayoutExamples: UITableViewableController {
    
    let examples: [ExampleControllerDetails] = [
        ExampleControllerDetails(name:"Example 1", controller:ViewController2.self),
        ExampleControllerDetails(name:"Example 2", controller:ViewController3.self),
        ExampleControllerDetails(name:"Example 3", controller:ViewController4.self),
        ExampleControllerDetails(name:"Example 4", controller:ViewController5.self),
        ExampleControllerDetails(name:"Example 5", controller:ViewController6.self),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UITableView examples"
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