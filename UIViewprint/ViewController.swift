//
//  ViewController.swift
//  Blueprint
//
//  Created by Alex Winston on 1/21/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var items: [String] = ["Example 1", "Example 2", "Example 3", "Example 4", "Example 5", "Example 6", "Example 7", "Example 8", "Example 9", "Example 10"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.view.backgroundColor = .whiteColor()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        let controller:UIViewController?
        
        switch(indexPath.row) {
        case 0:
            controller = ViewController1()
        case 1:
            controller = ViewController2()
        case 2:
            controller = ViewController3()
        case 3:
            controller = ViewController4()
        case 4:
            controller = ViewController5()
        case 5:
            controller = ViewController6()
        case 6:
            controller = ViewController7()
        case 7:
            controller = ViewController8()
        case 8:
            controller = ViewController9()
        case 9:
            controller = ViewController10()
        default:
            controller = nil
        }
        
        controller!.view.frame = view.bounds
        controller!.view.backgroundColor = .whiteColor()
        controller!.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        self.navigationController?.pushViewController(controller!, animated: true)
    }
}

