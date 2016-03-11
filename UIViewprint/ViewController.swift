//
//  ViewController.swift
//  Blueprint
//
//  Created by Alex Winston on 1/21/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import UIKit

class ExampleControllerDetails {
    var name:String
    var controller:UIViewController.Type
    
    init(name:String, controller:UIViewController.Type) {
        self.name = name
        self.controller = controller
    }
}

class ViewController: UITableViewController {

    var examples: [ExampleControllerDetails] = [
        ExampleControllerDetails(name:"App Store example", controller:ViewController1.self),
        ExampleControllerDetails(name:"UIView padding examples", controller:PaddingExamplesController.self),
        ExampleControllerDetails(name:"UILabel examples", controller:UILabelExamples.self),
        ExampleControllerDetails(name:"UITableViewController examples", controller:UITableViewControllerExamples.self),
        ExampleControllerDetails(name:"Neon comparison example", controller:ViewController7.self),
        ExampleControllerDetails(name:"Stavia comparison example", controller:ViewController10.self),
        ExampleControllerDetails(name:"Advanced layout examples", controller:AdvancedLayoutExamples.self),
        ExampleControllerDetails(name:"Scrolling static foreach example", controller:ViewController12.self),
        ExampleControllerDetails(name:"Example 9", controller:ViewController9.self)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.view.backgroundColor = .whiteColor()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.examples.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.examples[indexPath.row].name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        let controller:UIViewController = self.examples[indexPath.row].controller.init()
        controller.view.frame = view.bounds
        controller.view.backgroundColor = .whiteColor()
        controller.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

