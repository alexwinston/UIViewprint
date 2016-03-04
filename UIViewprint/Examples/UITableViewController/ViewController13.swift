//
//  ViewController12.swift
//  Blueprint
//
//  Created by Alex Winston on 1/26/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit

class StockHeader: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(
            div(UIViewableStyle(height:200, backgroundColor:.orangeColor()),
                label("Header1").backgroundColor(.yellowColor()),
                label("Header2").align(.Top(.Right)).backgroundColor(.yellowColor())
            )
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// http://stackoverflow.com/questions/28999400/swift-uitableview-custom-cell-programatically-documentation
class StockCell: UITableViewCell {
    
    let padding: CGFloat = 5
    var background: UIView!
    var typeLabel: UILabel!
//    var nameLabel:UIViewable?
    var nameLabel:UILabel!
    var priceLabel: UILabel!
    
    var stock:String? {
        didSet {
            if let stock = stock {
//                typeLabel.text = "Buy"
                nameLabel.text = stock
                priceLabel.text =  stock
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clearColor()
        selectionStyle = .None
        
        var nameViewable:UIViewable?
        var priceViewable:UIViewable?
        contentView.addSubview(
            div(UIViewableStyle(backgroundColor:.orangeColor()),
                label(&nameViewable, text:"").backgroundColor(.yellowColor()),
                label(&priceViewable, text:"").align(.Top(.Right)).backgroundColor(.yellowColor())
            )
        )
        self.nameLabel = nameViewable?.subviews[0] as! UILabel
        self.priceLabel = priceViewable?.subviews[0] as! UILabel
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        self.contentView.subviews[0].setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

class ViewController13: UITableViewController {

    var headerView:UIViewable?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Example 12"
        self.edgesForExtendedLayout = UIRectEdge.None;

//        self.tableView.registerClass(StockHeader.self, forCellReuseIdentifier: "headerCell")
//        let cellTableViewHeader = tableView.dequeueReusableCellWithIdentifier("headerCell") as! StockHeader
//        self.tableView.tableHeaderView = cellTableViewHeader
        let tableHeaderView =
        div(UIViewableStyle(backgroundColor:.orangeColor()),
            div(UIViewableStyle(backgroundColor:.grayColor()),
                label("Header1").backgroundColor(.yellowColor()),
                label("Header2").align(.Top(.Right)).backgroundColor(.yellowColor())
            )
        )
        tableHeaderView.layoutSubviews()
        self.tableView.tableHeaderView = tableHeaderView

        self.tableView.registerClass(StockCell.self, forCellReuseIdentifier: "cell")

        self.tableView.tableFooterView =
            div(UIViewableStyle(height:100, backgroundColor:.yellowColor()),
                label("Footer1").backgroundColor(.grayColor()),
                label("Footer2").align(.Top(.Right)).backgroundColor(.orangeColor())
        )
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        // http://stackoverflow.com/questions/16590099/uitableview-header-without-bouncing-when-pull-down
        let offsetY = scrollView.contentOffset.y;
        let headerContentView = self.tableView.tableHeaderView!.subviews[0]
        headerContentView.transform = CGAffineTransformMakeTranslation(0, min(offsetY, 0))
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath) as! StockCell
        cell.stock = String(indexPath.row)
        
//        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath)
//        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
}