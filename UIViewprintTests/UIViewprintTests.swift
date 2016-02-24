//
//  BlueprintTests.swift
//  BlueprintTests
//
//  Created by Alex Winston on 1/21/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import XCTest
@testable import UIViewprint

class UIViewprintTests: XCTestCase {
    
    var viewController : UIViewController!
    
    override func setUp() {
        super.setUp()
        viewController = UIViewController()
        let _ = viewController.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewable() {
        let viewable = div(style(height:10))
        self.viewController.view.addSubview(
            viewable
        )
        self.viewController.view.layoutIfNeeded()

        XCTAssertEqual(viewable.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable.frame.height, 10)
        XCTAssertEqual(viewable.frame.origin, CGPoint(x:0, y:0))
    }
    
    func testSubviewables() {
        let child1 = div(style(height:10))
        let child2 = div(style(height:10))
        
        let parent = div(
            child1,
            child2
        )
        self.viewController.view.addSubview(
            parent
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(parent.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(parent.frame.height, 20)
        XCTAssertEqual(parent.frame.origin, CGPoint(x:0, y:0))
        XCTAssertEqual(child1.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(child1.frame.origin, CGPoint(x:0, y:0))
        XCTAssertEqual(child2.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(child2.frame.origin, CGPoint(x:0, y:10))
        
    }
    
    func testInlineSubviewables() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        var viewable3:UIViewable?
        var viewable4:UIViewable?
        var viewable5:UIViewable?
        var viewable6:UIViewable?
        var viewable7:UIViewable?
        var viewable8:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1,
                div(&viewable2, style(display:.Inline, backgroundColor:.orangeColor()),
                    div(&viewable3, style(height:10, backgroundColor:.purpleColor())),
                    div(&viewable4, style(display:.Inline, width:10, height:5, backgroundColor:.grayColor())),
                    label(&viewable5, text:"Testing", style:style(backgroundColor:.yellowColor())),
                    div(&viewable6, style(display:.Inline, width:10, height:5, backgroundColor:.grayColor())),
                    div(&viewable7, style(height:10, backgroundColor:.purpleColor()))
                ),
                label(&viewable8, text:"Test")
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        // viewable1 is .Block so it is the width of the superview
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        // viewable1 has a height of the nested label + 20 because "Test" is .Inline and renders to the right of viewable2
        XCTAssertGreaterThan(viewable1!.frame.height, 20)
        XCTAssertEqual(viewable1!.frame.height, viewable5!.subviews[0].frame.height + 20)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        // viewable2 is .Inline so it is the width of all it's subviews
        XCTAssertEqual(viewable2!.frame.width, viewable5!.subviews[0].frame.width + 20)
        XCTAssertEqual(viewable2!.frame.height, viewable5!.subviews[0].frame.height + 20)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:0, y:0))
        
        // viewable3 is .Block so it is the width of the superview
        XCTAssertEqual(viewable3!.frame.width, viewable2!.frame.width)
        XCTAssertEqual(viewable3!.frame.height, 10)
        XCTAssertEqual(viewable3!.frame.origin, CGPoint(x:0, y:0))
        
        // viewable4 is .Inline so it appears below it's sibling which is .Block
        XCTAssertEqual(viewable4!.frame.width, 10)
        XCTAssertEqual(viewable4!.frame.height, 5)
        XCTAssertEqual(viewable4!.frame.origin, CGPoint(x:0, y:10))
        
        // viewable5 is .Inline so it appears to the right of it's sibling which is .Inline
        XCTAssertEqual(viewable5!.frame.width, viewable2!.frame.width - 20)
        XCTAssertEqual(viewable5!.frame.height, viewable2!.frame.height - 20)
        XCTAssertEqual(viewable5!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable6!.frame.width, 10)
        XCTAssertEqual(viewable6!.frame.height, 5)
        XCTAssertEqual(viewable6!.frame.origin, CGPoint(x:viewable5!.frame.origin.x + viewable5!.frame.width, y:10))
    
        // viewable7 is .Block so it appears below it's sibling
        XCTAssertEqual(viewable7!.frame.width, viewable2!.frame.width)
        XCTAssertEqual(viewable7!.frame.height, 10)
        XCTAssertEqual(viewable7!.frame.origin, CGPoint(x:0, y:viewable5!.frame.origin.y + viewable5!.frame.height))
        
        // viewable8 is .Inline so it appers to the right of it's sibling which is .Inline
        XCTAssertGreaterThan(viewable8!.frame.width, 0)
        XCTAssertGreaterThan(viewable8!.frame.height, 0)
        XCTAssertEqual(viewable8!.frame.origin, CGPoint(x:viewable2!.frame.width, y:0))
    }
    
    func testFlexRow() {
        let child1 = div(style(height:10))
        let child2 = div(style(height:10))
        
        let parent = div(.Flex(.Row),
            child1,
            child2
        )
        self.viewController.view.addSubview(
            parent
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(parent.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(parent.frame.origin, CGPoint(x:0, y:0))
        XCTAssertEqual(child1.frame.width, self.viewController.view.frame.width/2)
        XCTAssertEqual(child1.frame.origin, CGPoint(x:0, y:0))
        XCTAssertEqual(child2.frame.width, self.viewController.view.frame.width/2)
        XCTAssertEqual(child2.frame.origin, CGPoint(x:self.viewController.view.frame.width/2, y:0))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
