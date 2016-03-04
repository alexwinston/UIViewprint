//
//  UITableViewableController.swift
//  UIViewprint
//
//  Created by Alex Winston on 2/29/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import Foundation
import UIKit


// http://stackoverflow.com/questions/28999400/swift-uitableview-custom-cell-programatically-documentation
class UITableViewableCell: UITableViewCell {
    var viewable:UIViewable = UIViewable() {
        willSet(newViewable) {
            for view in self.contentView.subviews {
                view.removeFromSuperview()
            }
            self.contentView.addSubview(newViewable)
//            self.contentView.layoutIfNeeded()
//            newViewable.setNeedsLayout()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        //        self.selectionStyle = .None
        
        self.contentView.addSubview(self.viewable)
        
        self.separatorInset = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        //        self.contentView.subviews[0].setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        if self.contentView.subviews.count == 1 {
//            self.contentView.subviews[0].layoutSubviews()
//        }
        self.contentView.layoutIfNeeded()
    }
}

class UITableViewableSection {
    var title:String!
    var selector:(indexPath:NSIndexPath) -> Void = { _ in }
    var rows:[UIViewable?] = []
    var datasource:[AnyObject] = []
    var viewable:((AnyObject) -> UIViewable)?

    init(title:String? = nil, selector:(indexPath:NSIndexPath) -> Void, rows:[UIViewable?], datasource:[AnyObject]? = nil, _ viewable:((AnyObject) -> UIViewable)? = nil) {
        self.title = title
        self.selector = selector
        self.rows.appendContentsOf(rows)
        
        // TODO? append datasource viewable in heightForRowAtIndexPath instead all during init
        if let datasource = datasource {
            self.datasource.appendContentsOf(datasource)
//            for data in datasource {
//                self.rows.append(viewable!(data))
//            }
//            self.datasource = datasource
            self.rows = [UIViewable?](count:self.datasource.count, repeatedValue:nil)
        }
        self.viewable = viewable
    }
}

class UITableViewableController: UITableViewController {

    var hasTableHeaderView:Bool = false

    var sections:[UITableViewableSection] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerClass(UITableViewableCell.self, forCellReuseIdentifier: "cell")
    }

    func table(header header:UIViewable? = nil, sections:[UITableViewableSection], footer:UIViewable? = nil) -> UIViewable {
        if let header = header {
            let viewable = div(header)
            viewable.layoutSubviews()

            self.tableView.tableHeaderView = viewable
            self.hasTableHeaderView = true
        }

        for section in sections {
            self.sections.append(section)
        }

        if let footer = footer {
            footer.layoutSubviews()
            self.tableView.tableFooterView = footer
        }

        return div()
    }

    func section(selector:(indexPath:NSIndexPath) -> Void, header:String? = nil,rows:UIViewable...) -> UITableViewableSection {
        return section(selector, header:header, rows:rows)
    }

    typealias UIForeachViewable = (AnyObject) -> UIViewable
    
    func section(selector:(indexPath:NSIndexPath) -> Void, header:String? = nil, foreach:[AnyObject], _ viewable:UIForeachViewable) -> UITableViewableSection {
        return section(selector, header:header, datasource:foreach, viewable)
    }

    func section(selector:(indexPath:NSIndexPath) -> Void, header:String? = nil, rows:[UIViewable?] = [], datasource:[AnyObject]? = nil, _ viewable:((AnyObject) -> UIViewable)? = nil) -> UITableViewableSection {
        return UITableViewableSection(title:header, selector:selector, rows:rows, datasource:datasource, viewable)
    }

    func row(viewable:UIViewable) -> UIViewable {
        //        self.rows.append(viewable)
        return viewable
    }
    
    func defaultTableViewCell(text:String) -> UIViewable {
        return div(
            div(style(height:10)),
            div(.Flex(.Row),
                div(style(width:10)),
                label("\(text)")
            ),
            div(style(height:10))
        )
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        // http://stackoverflow.com/questions/16590099/uitableview-header-without-bouncing-when-pull-down
        if self.hasTableHeaderView {
            let offsetY = scrollView.contentOffset.y;
            let headerContentView = self.tableView.tableHeaderView!.subviews[0]
            headerContentView.transform = CGAffineTransformMakeTranslation(0, min(offsetY, 0))
        }
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.tableView.reloadData()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].title
    }
    
    // http://stackoverflow.com/questions/5324205/heightforrowatindexpath-being-called-for-all-rows-how-many-rows-in-a-uitablevi
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // TODO? Cache estimated row height after cell layout
        return 60 //UITableViewAutomaticDimension causes a number of performance problems
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let section = self.sections[indexPath.section]
        if section.rows[indexPath.row] == nil {
            section.rows[indexPath.row] = section.viewable!(section.datasource[indexPath.row])
        }
        let viewable = section.rows[indexPath.row]!
        viewable.setNeedsLayout()
        
        return viewable.frame.height
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = self.sections[indexPath.section]
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath) as! UITableViewableCell
        cell.viewable = section.rows[indexPath.row]!
        cell.layoutIfNeeded()
        
        //        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath)
        //        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.sections[indexPath.section].selector(indexPath:indexPath)
    }
    
    // TODO? https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UITableViewRowAction_class/index.html
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            self.sections[indexPath.section].rows.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:.Fade)
        }
    }

}
