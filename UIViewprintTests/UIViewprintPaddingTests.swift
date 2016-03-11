//
//  UIViewprintPaddingTests.swift
//  UIViewprint
//
//  Created by Alex Winston on 3/11/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import XCTest
@testable import UIViewprint

class UIViewprintPaddingTests: XCTestCase {
    
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
    
    func testPaddingNoSubviews() {
        var viewable1:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(10,10,10,10)))
        )
        viewable1?.layoutSubviews()
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 20)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
    }
    
    func testPaddingSubviewFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(10,10,10,10)),
                div(&viewable2, style(height:10))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 30)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
    }
    
    func testTopPaddingSubviewFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(top:10,0,0,0)),
                div(&viewable2, style(height:10))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 20)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:0, y:10))
    }
    
    func testRightPaddingSubviewFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(0,right:10,0,0)),
                div(&viewable2, style(height:10))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 10)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 10)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:0, y:0))
    }
    
    func testBottomPaddingSubviewFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(0,0,bottom:10,0)),
                div(&viewable2, style(height:10))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 20)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:0, y:0))
    }
    
    func testLeftPaddingSubviewFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(0,0,0,left:10)),
                div(&viewable2, style(height:10))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 10)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 10)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:0))
    }
    
    func testTopAndBottomPaddingSubviewFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(top:10,0,bottom:10,0)),
                div(&viewable2, style(height:10))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 30)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:0, y:10))
    }
    
    func testLeftAndRightPaddingSubviewFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(0,right:10,0,left:10)),
                div(&viewable2, style(height:10))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 10)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:0))
    }
    
    func testPaddingSubviewsFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        var viewable3:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(10,10,10,10)),
                div(&viewable2, style(height:10)),
                div(&viewable3, style(height:20))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 50)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable3!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable3!.frame.height, 20)
        XCTAssertEqual(viewable3!.frame.origin, CGPoint(x:10, y:20))
    }
    
    func testFlexRowPaddingSubviewFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(display:.Flex(.Row), padding:(10,10,10,10)),
                div(&viewable2, style(height:10))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 30)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
    }
    
    func testFlexRowPaddingSubviewsFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        var viewable3:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(display:.Flex(.Row), padding:(10,10,10,10)),
                div(&viewable2, style(height:10)),
                div(&viewable3, style(height:10))
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 30)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width / 2 - 10)
        XCTAssertEqual(viewable2!.frame.height, 10)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable3!.frame.width, self.viewController.view.frame.width / 2 - 10)
        XCTAssertEqual(viewable3!.frame.height, 10)
        XCTAssertEqual(viewable3!.frame.origin, CGPoint(x:self.viewController.view.frame.width / 2, y:10))
    }
    
    func testPaddingNestedSubviewsFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        var viewable3:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(10,10,10,10)),
                div(&viewable2, style(padding:(10,10,10,10)),
                    div(&viewable3, style(height:10))
                )
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 50)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable2!.frame.height, 30)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable3!.frame.width, self.viewController.view.frame.width - 40)
        XCTAssertEqual(viewable3!.frame.height, 10)
        XCTAssertEqual(viewable3!.frame.origin, CGPoint(x:10, y:10))
    }
    
    func testPaddingNestedSubviewsVariableHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        var viewable3:UIViewable?
        var viewable4:UIViewable?
        var viewable5:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(10,10,10,10)),
                div(&viewable2, style(padding:(10,10,10,10)),
                    div(&viewable3,
                        div(&viewable4, style(height:10)),
                        div(&viewable5, style(height:20))
                    )
                )
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 70)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable2!.frame.height, 50)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable3!.frame.width, self.viewController.view.frame.width - 40)
        XCTAssertEqual(viewable3!.frame.height, 30)
        XCTAssertEqual(viewable3!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable4!.frame.width, self.viewController.view.frame.width - 40)
        XCTAssertEqual(viewable4!.frame.height, 10)
        XCTAssertEqual(viewable4!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable5!.frame.width, self.viewController.view.frame.width - 40)
        XCTAssertEqual(viewable5!.frame.height, 20)
        XCTAssertEqual(viewable5!.frame.origin, CGPoint(x:0, y:10))
    }
    
    func testPaddingNestedFlexRowSubviewFixedHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        var viewable3:UIViewable?
        var viewable4:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(10,10,10,10)),
                div(&viewable2, style(padding:(10,10,10,10)),
                    div(&viewable3, style(display:.Flex(.Row)),
                        div(&viewable4, style(height:10))
                    )
                )
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 50)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable2!.frame.height, 30)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable3!.frame.width, self.viewController.view.frame.width - 40)
        XCTAssertEqual(viewable3!.frame.height, 10)
        XCTAssertEqual(viewable3!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable4!.frame.width, self.viewController.view.frame.width - 40)
        XCTAssertEqual(viewable4!.frame.height, 10)
        XCTAssertEqual(viewable4!.frame.origin, CGPoint(x:0, y:0))
    }
    
    func testPaddingNestedFlexRowSubviewsVariableHeight() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        var viewable3:UIViewable?
        var viewable4:UIViewable?
        var viewable5:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(10,10,10,10)),
                div(&viewable2, style(padding:(10,10,10,10)),
                    div(&viewable3, style(display:.Flex(.Row)),
                        div(&viewable4, style(height:10)),
                        div(&viewable5, style(height:20))
                    )
                )
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 60)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable2!.frame.height, 40)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable3!.frame.width, self.viewController.view.frame.width - 40)
        XCTAssertEqual(viewable3!.frame.height, 20)
        XCTAssertEqual(viewable3!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable4!.frame.width, self.viewController.view.frame.width / 2 - 20)
        XCTAssertEqual(viewable4!.frame.height, 10)
        XCTAssertEqual(viewable4!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable5!.frame.width, self.viewController.view.frame.width / 2 - 20)
        XCTAssertEqual(viewable5!.frame.height, 20)
        XCTAssertEqual(viewable5!.frame.origin, CGPoint(x:viewable3!.frame.width / 2, y:0))
    }
    
    func testPaddingInlineSubviewables() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        var viewable3:UIViewable?
        var viewable4:UIViewable?
        var viewable5:UIViewable?
        var viewable6:UIViewable?
        var viewable7:UIViewable?
        var viewable8:UIViewable?
        var viewable9:UIViewable?
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(top:10, right:10, bottom:10, left:10)),
                div(&viewable2, style(display:.Inline, backgroundColor:.yellowColor()),
                    div(&viewable3, style(width:20, height:10, backgroundColor:.purpleColor())),
                    div(&viewable4, style(display:.Inline, width:10, height:5, backgroundColor:.redColor())),
                    div(&viewable5, style(display:.Inline, padding:(10,10,10,10), backgroundColor:.orangeColor()),
                        label(&viewable6, text:"Testing", style:style(backgroundColor:.grayColor()))
                    ),
                    div(&viewable7, style(display:.Inline, width:10, height:5, backgroundColor:.redColor())),
                    div(&viewable8, style(display:.Block, height:10, backgroundColor:.purpleColor()))
                ),
                label(&viewable9, text:"Test")
            )
        )
        self.viewController.view.layoutIfNeeded()
        
        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, 80.5)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable2!.frame.width, 96)
        XCTAssertEqual(viewable2!.frame.height, 60.5)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable3!.frame.width, 20)
        XCTAssertEqual(viewable3!.frame.height, 10)
        XCTAssertEqual(viewable3!.frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable4!.frame.width, 10)
        XCTAssertEqual(viewable4!.frame.height, 5)
        XCTAssertEqual(viewable4!.frame.origin, CGPoint(x:0, y:10))
        
        XCTAssertEqual(viewable5!.frame.width, 76)
        XCTAssertEqual(viewable5!.frame.height, 40.5)
        XCTAssertEqual(viewable5!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable6!.frame.width, viewable5!.frame.width - 20)
        XCTAssertEqual(viewable6!.frame.height, viewable5!.frame.height - 20)
        XCTAssertEqual(viewable6!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable7!.frame.width, 10)
        XCTAssertEqual(viewable7!.frame.height, 5)
        XCTAssertEqual(viewable7!.frame.origin, CGPoint(x:86, y:10))
        
        XCTAssertEqual(viewable8!.frame.width, 96)
        XCTAssertEqual(viewable8!.frame.height, 10)
        XCTAssertEqual(viewable8!.frame.origin, CGPoint(x:0, y:50.5))
        
        XCTAssertGreaterThan(viewable9!.frame.width, 0)
        XCTAssertGreaterThan(viewable9!.frame.height, 0)
        XCTAssertEqual(viewable9!.frame.origin, CGPoint(x:viewable2!.frame.width + 10, y:10))
    }
    
    func testPaddingButtons() {
        var viewable1:UIViewable?
        var viewable2:UIViewable?
        var viewable3:UIViewable?
        var viewable4:UIViewable?
        var viewable5:UIViewable?
        var viewable6:UIViewable?
        var viewable7:UIViewable?
        var viewable8:UIViewable?
        var viewable9:UIViewable?
        var viewable10:UIViewable?
        
        let testButton = UIButton()
        testButton.setTitle("Button", forState: .Normal)
        testButton.sizeToFit()
        
        let void = { (button:UIButton) in }
        
        self.viewController.view.addSubview(
            div(&viewable1, style(padding:(10,10,10,10)),
                div(&viewable2, style(display:.Flex(.Row)),
                    button(&viewable3, title:"Redeem", touch:void).display(.Flex(.Row)).padding((10,10,10,10)),
                    button(&viewable4, title:"Send Gift", touch:void).display(.Flex(.Row)).padding((10,10,10,10))
                ),
                div(&viewable5, style(display:.Flex(.Row), padding:(top:10, right:10, bottom:10, left:10)),
                    button(&viewable6, title:"Redeem", touch:void).display(.Flex(.Row)),
                    button(&viewable7, title:"Send Gift", touch:void).display(.Flex(.Row))
                ),
                div(&viewable8, style(display:.Flex(.Row), padding:(top:5, right:5, bottom:5, left:5)),
                    button(&viewable9, title:"Redeem", touch:void).display(.Flex(.Row)).style(
                        style(padding:(10,10,10,10))),
                    button(&viewable10, title:"Send Gift", touch:void).display(.Flex(.Row)).style(
                        style(padding:(10,10,10,10)))
                )
            )
        )
        self.viewController.view.layoutIfNeeded()

        XCTAssertEqual(viewable1!.frame.width, self.viewController.view.frame.width)
        XCTAssertEqual(viewable1!.frame.height, testButton.frame.height * 3 + 90)
        XCTAssertEqual(viewable1!.frame.origin, CGPoint(x:0, y:0))

        XCTAssertEqual(viewable2!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable2!.frame.height, testButton.frame.height + 20)
        XCTAssertEqual(viewable2!.frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable3!.frame.width, self.viewController.view.frame.width / 2 - 10)
        XCTAssertEqual(viewable3!.frame.height, testButton.frame.height + 20)
        XCTAssertEqual(viewable3!.frame.origin, CGPoint(x:0, y:0))
        XCTAssertEqual(viewable3!.subviews[0].frame.width, viewable3!.frame.width - 20)
        XCTAssertEqual(viewable3!.subviews[0].frame.height, testButton.frame.height)
        XCTAssertEqual(viewable3!.subviews[0].frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable4!.frame.width, self.viewController.view.frame.width / 2 - 10)
        XCTAssertEqual(viewable4!.frame.height, testButton.frame.height + 20)
        XCTAssertEqual(viewable4!.frame.origin, CGPoint(x:viewable3!.frame.width, y:0))
        XCTAssertEqual(viewable4!.subviews[0].frame.width, viewable4!.frame.width - 20)
        XCTAssertEqual(viewable4!.subviews[0].frame.height, testButton.frame.height)
        XCTAssertEqual(viewable4!.subviews[0].frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable5!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable5!.frame.height, testButton.frame.height + 20)
        XCTAssertEqual(viewable5!.frame.origin, CGPoint(x:10, y:viewable2!.frame.height + 10))

        XCTAssertEqual(viewable6!.frame.width, self.viewController.view.frame.width / 2 - 20)
        XCTAssertEqual(viewable6!.frame.height, testButton.frame.height)
        XCTAssertEqual(viewable6!.frame.origin, CGPoint(x:10, y:10))
        XCTAssertEqual(viewable6!.subviews[0].frame.width, viewable5!.frame.width / 2 - 10)
        XCTAssertEqual(viewable6!.subviews[0].frame.height, testButton.frame.height)
        XCTAssertEqual(viewable6!.subviews[0].frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable7!.frame.width, self.viewController.view.frame.width / 2 - 20)
        XCTAssertEqual(viewable7!.frame.height, testButton.frame.height)
        XCTAssertEqual(viewable7!.frame.origin, CGPoint(x:viewable6!.frame.width + 10, y:10))
        XCTAssertEqual(viewable7!.subviews[0].frame.width, viewable5!.frame.width / 2 - 10)
        XCTAssertEqual(viewable7!.subviews[0].frame.height, testButton.frame.height)
        XCTAssertEqual(viewable7!.subviews[0].frame.origin, CGPoint(x:0, y:0))
        
        XCTAssertEqual(viewable8!.frame.width, self.viewController.view.frame.width - 20)
        XCTAssertEqual(viewable8!.frame.height, testButton.frame.height + 30)
        XCTAssertEqual(viewable8!.frame.origin, CGPoint(x:10, y:viewable2!.frame.height + viewable5!.frame.height + 10))
        
        XCTAssertEqual(viewable9!.frame.width, self.viewController.view.frame.width / 2 - 15)
        XCTAssertEqual(viewable9!.frame.height, testButton.frame.height + 20)
        XCTAssertEqual(viewable9!.frame.origin, CGPoint(x:5, y:5))
        XCTAssertEqual(viewable9!.subviews[0].frame.width, viewable8!.frame.width / 2 - 25)
        XCTAssertEqual(viewable9!.subviews[0].frame.height, testButton.frame.height)
        XCTAssertEqual(viewable9!.subviews[0].frame.origin, CGPoint(x:10, y:10))
        
        XCTAssertEqual(viewable10!.frame.width, self.viewController.view.frame.width / 2 - 15)
        XCTAssertEqual(viewable10!.frame.height, testButton.frame.height + 20)
        XCTAssertEqual(viewable10!.frame.origin, CGPoint(x:viewable9!.frame.width + 5, y:5))
        XCTAssertEqual(viewable10!.subviews[0].frame.width, viewable9!.frame.width - 20)
        XCTAssertEqual(viewable10!.subviews[0].frame.height, testButton.frame.height)
        XCTAssertEqual(viewable10!.subviews[0].frame.origin, CGPoint(x:10, y:10))
    }
}
