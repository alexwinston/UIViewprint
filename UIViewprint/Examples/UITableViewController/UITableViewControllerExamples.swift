//
//  ViewController16.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class UITableViewControllerExamples: UITableViewableController {

    let examples: [ExampleControllerDetails] = [
        ExampleControllerDetails(name:"Advanced foreach example", controller:ViewController16.self),
        ExampleControllerDetails(name:"Variable row height example", controller:VariableRowHeight.self),
        ExampleControllerDetails(name:"Multiple sections example", controller:ViewController13.self),
        ExampleControllerDetails(name:"Static table example", controller:ViewController14.self),
        ExampleControllerDetails(name:"Header and footer example", controller:ViewController15.self),
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