//
//  UILabelExamples.swift
//  Blueprint
//
//  Created by Alex Winston on 3/9/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

// TODO? Create UITableViewableStyleController that only requires a cell style and a datasource
class PaddingExamplesController: UITableViewableController {
    
    let examples: [ExampleControllerDetails] = [
        ExampleControllerDetails(name:"UIView basic padding example", controller:UIViewPaddingController.self),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UIView padding examples"
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