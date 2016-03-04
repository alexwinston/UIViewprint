//
//  VariableRowHeight.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class VariableRowHeight: UITableViewableController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Row Height"
        self.edgesForExtendedLayout = UIRectEdge.None;

        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.table(
            sections: [
                section(touchRow, foreach:[Int](1...1000)) { _ in
                    return div(
                        label("\(Lorem.sentence)").display(.Block)
                    )
                }
            ]
        )
    }
    
    func refresh(sender:AnyObject) {
        print("refresh")
        self.refreshControl!.endRefreshing()
    }

    func touchRow(indexPath:NSIndexPath) {
        print("touch \(indexPath.section) \(indexPath.row)")
    }
}