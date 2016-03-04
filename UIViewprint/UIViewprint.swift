//
//  UIViewprint.swift
//  Blueprint
//
//  Created by Alex Winston on 1/21/16.
//  Copyright © 2016 Alex Winston. All rights reserved.
//

import UIKit

extension Int {
    static var open:Int { get { return Int.max } }
    static var close:Int { get { return Int.min } }
}

// https://www.mikeash.com/pyblog/friday-qa-2015-12-25-swifty-targetaction.html
class ActionTrampoline<T>: NSObject {
    var action: T -> Void
    
    init(action: T -> Void) {
        self.action = action
    }
    
    @objc func action(sender: UIControl) {
//        print(sender)
        action(sender as! T)
    }
}

let NSControlActionFunctionProtocolAssociatedObjectKey = UnsafeMutablePointer<Int8>.alloc(1)

protocol NSControlActionFunctionProtocol {}
extension NSControlActionFunctionProtocol where Self: UIControl {
    func addAction(events: UIControlEvents, _ action: Self -> Void) {
        let trampoline = ActionTrampoline(action: action)
        self.addTarget(trampoline, action: "action:", forControlEvents: events)
        objc_setAssociatedObject(self, NSControlActionFunctionProtocolAssociatedObjectKey, trampoline, .OBJC_ASSOCIATION_RETAIN)
    }
}
extension UIControl: NSControlActionFunctionProtocol {}

// UIViewable helper functions
func div() -> UIViewable { return div(UIViewableStyle()) }
func div(subviews:UIViewable...) -> UIViewable {
    return div(UIViewableStyle(), subviews:subviews)
}
func div(style:UIViewableStyle, subviews:[UIViewable]) -> UIViewable {
    var viewable:UIViewable?
    return div(&viewable, style:style, subviews:subviews)
}
func div(inout id:UIViewable?, style:UIViewableStyle = UIViewableStyle(), subviews:[UIViewable]) -> UIViewable {
    let viewable = UIViewable(style:style)
//    print("div \(String(ObjectIdentifier(viewable).uintValue))")
    for subview in subviews {
        viewable.addSubview(subview)
    }
    
    id = viewable

    return viewable
}
func div(style:UIViewableStyle, _ subviews:UIViewable...) -> UIViewable {
    return div(style, subviews:subviews)
}
func div(inout id:UIViewable?, _ subviews:UIViewable...) -> UIViewable {
    return div(&id, style:UIViewableStyle(), subviews:subviews)
}
func div(inout id:UIViewable?, _ style:UIViewableStyle = UIViewableStyle(), _ subviews:UIViewable...) -> UIViewable {
    return div(&id, style:style, subviews:subviews)
}
func div(display:UIViewableDisplay = .Block, align:UIViewableAlign = .Top(.Left), padding:(top:CGFloat, right:CGFloat, bottom:CGFloat, left:CGFloat) = (0, 0, 0, 0), _ subviews:UIViewable...) -> UIViewable {
    let style = UIViewableStyle(display:display, align:align, padding:padding)
    return div(style, subviews:subviews)
}
func div<T>(foreach foreach:[T], _ view:(T) -> UIView) -> UIViewable {
    let viewable = UIViewable()
    for t in foreach {
        viewable.addSubview(view(t))
    }
    return viewable
}

func button(title:String, display:UIViewableDisplay = .Inline, align:UIViewableAlign = .Top(.Left), height:CGFloat? = nil, touch:(UIButton) -> Void) -> UIViewable {
    // TODO .button
    let button = UIButton()
    button.setTitle(title, forState: .Normal)
    button.backgroundColor = .blueColor()
    button.addAction([.TouchUpInside], touch)
    button.sizeToFit()
    
    if let height = height {
        button.frame.size.height = height
    }
    
    let view = UIViewable(style: UIViewableStyle(display:display))
    view.addSubview(button)
    view.align(align)
    
    return view
}


func width(width:CGFloat) -> UIViewable {
    return UIViewable(style:UIViewableStyle(width:width))
}

func height(height:CGFloat) -> UIViewable {
    return UIViewable(style:UIViewableStyle(height:height))
}

func hr(padding:UIViewablePadding, color:UIColor) -> UIView {
    return UIViewable()
        < UIViewable().height(padding.top)>>
        < UIViewable().height(0.5).backgroundColor(color)>>
        < UIViewable().height(padding.bottom)>>
}

func label(text:String, lineBreakMode:NSLineBreakMode = .ByWordWrapping, numberOfLines:Int = 0, font:UIFont? = nil, style:UIViewableStyle = UIViewableStyle(), appearance:((UILabel) -> Void)? = nil) -> UIViewable {
    var viewable:UIViewable?
    return label(&viewable, text:text, lineBreakMode:lineBreakMode, numberOfLines:numberOfLines, font:font, style:style, appearance:appearance)
}
func label(inout id:UIViewable?, text:String, lineBreakMode:NSLineBreakMode = .ByWordWrapping, numberOfLines:Int = 0, font:UIFont? = nil, var style:UIViewableStyle = UIViewableStyle(), appearance:((UILabel) -> Void)? = nil) -> UIViewable {
    let label = UILabel()
    label.lineBreakMode = lineBreakMode
    label.numberOfLines = numberOfLines
    label.text = text
    if let font = font {
        label.font = font
    }
    
    if style.display == nil {
        style.display = .Inline
    }
    
    let viewable = UIViewable(style:style)
    viewable.addSubview(label)
    
    if let appearance = appearance {
        appearance(label)
    }
    label.sizeToFit()
    
    id = viewable
    
    return viewable
}

func image(name:String, contentMode:UIViewContentMode? = .ScaleAspectFit) -> UIViewable {
    var viewable:UIViewable?
    return image(&viewable, name:name, contentMode:contentMode)
}

func image(inout id:UIViewable?, name:String, contentMode:UIViewContentMode? = .ScaleAspectFit, width:CGFloat? = nil, height:CGFloat? = nil) -> UIViewable {
    let imageView = UIImageView()
    imageView.contentMode = contentMode!
    imageView.clipsToBounds = true
    
    if let width = width {
        imageView.frame.size.width = width
    }
    if let height = height {
        imageView.frame.size.height = height
    }
    imageView.image = UIImage(named: name)
    
    let viewable = UIViewable(style: UIViewableStyle(display:.Inline, width:imageView.frame.width, height:imageView.frame.height))
    viewable.addSubview(imageView)
    
    id = viewable
    
    return viewable
}

func input(placeholder placeholder:String) -> UIViewable {
    return input(placeholder:placeholder, style:UIViewableStyle())
}
func input(placeholder placeholder:String, style:((UITextField) -> Void)? = nil) -> UIViewable {
    var textField:UITextField?
    return input(&textField, placeholder:placeholder, style:style)
}
func input(inout id:UITextField?, placeholder:String, style:((UITextField) -> Void)?) -> UIViewable {
    let textField = UITextField()
    textField.placeholder = placeholder
    textField.sizeToFit()
    
    if let style = style {
        style(textField)
    }
    
    let viewable = UIViewable(style:UIViewableStyle(display:.Flex(.Row), height:textField.frame.height))
    viewable.addSubview(textField)
    
    id = textField
    
    return viewable
}

func segment(display:UIViewableDisplay? = .Inline, items:[String], color:UIColor?) -> UIViewable {
    let segmentedControl = UISegmentedControl(items: items)
    segmentedControl.selectedSegmentIndex = 0
    if let color = color {
        segmentedControl.tintColor = color
    }
    
    let viewable = UIViewable(style:UIViewableStyle(display:display))
    viewable.addSubview(segmentedControl)
    
    return viewable
}

// UIviewablePadding helper functions
func padding(top top:CGFloat = 0, right:CGFloat = 0, bottom:CGFloat = 0, left:CGFloat = 0) -> UIViewablePadding {
    return UIViewablePadding(top:top, right:right, bottom:bottom, left:left)
}

// UIViewableStyle helper functions
typealias style = UIViewableStyle
//func style(display:UIViewableDisplay? = nil, align:UIViewableAlign? = nil, width:CGFloat? = -1, height:CGFloat? = -1, backgroundColor:UIColor? = nil) -> UIViewableStyle {
//    return UIViewableStyle(display:display, align:align, width:width!, height:height!, backgroundColor:backgroundColor)
//}

extension UIView {
    static var view:UIView {
        get {
            return UIViewable(tag:.close, style:UIViewableStyle())
        }
    }
    static func view(style:UIViewableStyle) -> UIViewable {
        return UIViewable(style:style)
    }
    static func view(view:UIView, height:CGFloat? = nil) -> UIViewable {
        let viewable = UIViewable(style:UIViewableStyle())
        if let height = height {
            // Set the view and viewable to a fixed height
            view.frame.size.height = height
            viewable.height(height)
        }
        viewable.addSubview(view)
        return viewable
    }
    
    static func flexColumn() -> UIViewable {
        return view(UIViewableStyle(display:.Flex(.Column)))
    }
    static func flexRow() -> UIViewable {
        return view(UIViewableStyle(display:.Flex(.Row)))
    }
    
    // http://stackoverflow.com/questions/25426780/swift-extension-stored-properties-alternative
    private struct AssociatedKeys {
        static var maxWidth = "maxWidth"
        static var maxHeight = "maxHeight"
        static var flexWidth = "flexWidth"
    }
    var maxWidth:CGFloat {
        get {
            if let maxWidth = objc_getAssociatedObject(self, &AssociatedKeys.maxWidth) as? CGFloat {
                return maxWidth
            }
            return 0
        }
        
        set(value) {
            objc_setAssociatedObject(self,&AssociatedKeys.maxWidth,value,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var maxHeight:CGFloat {
        get {
            if let maxHeight = objc_getAssociatedObject(self, &AssociatedKeys.maxHeight) as? CGFloat {
                return maxHeight
            }
            return 0
        }
        
        set(value) {
            objc_setAssociatedObject(self,&AssociatedKeys.maxHeight,value,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var flexWidth:Bool {
        get {
            if let flexWidth = objc_getAssociatedObject(self, &AssociatedKeys.flexWidth) as? Bool {
                return flexWidth
            }
            return false
        }
        
        set(value) {
            objc_setAssociatedObject(self,&AssociatedKeys.flexWidth,value,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

// http://nshipster.com/swift-operators/
// https://medium.com/swift-programming/facets-of-swift-part-5-custom-operators-1080bc78ccc#.q037jcul8
infix operator < { associativity left }
func <(parent: UIView, child: UIViewableOpen) -> UIView {
    parent.addSubview(child.view)
    return child.view
}
func <(parent: UIView, child: UIViewableClose) -> UIView {
    parent.addSubview(child.view)
    return parent
}
func <(parent: UIView, child: UIViewableParent) -> UIView {
    if (child.view.tag != .close) { parent.addSubview(child.view) }
    if let superview = parent.superview {
        return superview
    } else {
        return parent
    }
}

postfix operator +> {}
postfix func +>(view: UIView) -> UIViewableOpen {
    if (view.tag == .close) { view.tag = .open }
    return UIViewableOpen(view:view)
}

postfix operator >> {}
postfix func >>(view: UIView) -> UIViewableClose {
    if (Mirror(reflecting: view).subjectType != UIViewable.self) {
        let viewable = UIViewable(style:UIViewableStyle())
        viewable.addSubview(view)
        return UIViewableClose(view:viewable)
    }
    return UIViewableClose(view:view)
}
postfix func >>(text: String) -> UIViewableClose {
    return UIViewableClose(view:text==)
}

postfix operator /> {}
postfix func />(view: UIView) -> UIViewableParent {
    return UIViewableParent(view:view)
}

postfix operator == {}
postfix func ==(text:String) -> UIViewable {
    return label(text, appearance:nil)
}

// TODO Subclass Open,Close,Parent
class UIViewableOpen {
    private private(set) var view:UIView
    
    init(view:UIView) {
        self.view = view
    }
    
    private func close() -> UIView {
        return self.view
    }
}

class UIViewableClose {
    private private(set) var view:UIView
    
    init(view:UIView) {
        self.view = view
    }
    
    private func close() -> UIView {
        return self.view
    }
}

class UIViewableParent {
    private private(set) var view:UIView
    
    init(view:UIView) {
        self.view = view
    }
    
    private func close() -> UIView {
        return self.view
    }
}

enum UIViewableDisplayFlex {
    case Row
    case Column
}
enum UIViewableDisplay:Equatable {
    case Block
    case Inline
    case Flex(UIViewableDisplayFlex)
}

func ==(a: UIViewableDisplay, b: UIViewableDisplay) -> Bool {
    switch (a, b) {
    case (.Block, .Block): return true
    case (.Inline, .Inline): return true
    case (.Flex(.Row), .Flex(.Row)): return true
    case (.Flex(.Column), .Flex(.Column)): return true
    default: return false
    }
}
func !=(a: UIViewableDisplay, b: UIViewableDisplay) -> Bool {
    return !(a == b)
}

enum UIViewableAlignHorizontal {
    case Left
    case Center
    case Right
}
enum UIViewableAlign:Equatable {
    case Top(UIViewableAlignHorizontal)
    case Middle(UIViewableAlignHorizontal)
    case Bottom(UIViewableAlignHorizontal)
}

func ==(a: UIViewableAlign, b: UIViewableAlign) -> Bool {
    switch (a, b) {
    case (.Top(.Left), .Top(.Left)): return true
    case (.Top(.Center), .Top(.Center)): return true
    case (.Top(.Right), .Top(.Right)): return true
    case (.Middle(.Left), .Middle(.Left)): return true
    case (.Middle(.Center), .Middle(.Center)): return true
    case (.Middle(.Right), .Middle(.Right)): return true
    case (.Bottom(.Left), .Bottom(.Left)): return true
    case (.Bottom(.Center), .Bottom(.Center)): return true
    case (.Bottom(.Right), .Bottom(.Right)): return true
    default: return false
    }
}
func !=(a: UIViewableAlign, b: UIViewableAlign) -> Bool {
    return !(a == b)
}

typealias UIPadding = (top:CGFloat, right:CGFloat, bottom:CGFloat, left:CGFloat)

// https://teamtreehouse.com/community/can-swift-structs-have-optional-stored-properties
struct UIViewableStyle {
    var display:UIViewableDisplay?
    var align:UIViewableAlign?
    var padding:(top:CGFloat, right:CGFloat, bottom:CGFloat, left:CGFloat)
    var width:CGFloat
    var height:CGFloat
    var backgroundColor:UIColor?
    
    init(display:UIViewableDisplay? = nil, align:UIViewableAlign? = nil, padding:(top:CGFloat, right:CGFloat, bottom:CGFloat, left:CGFloat) = (0, 0, 0, 0), width:CGFloat = -1, height:CGFloat = -1, backgroundColor:UIColor? = nil) {
        self.display = display
        self.align = align
        self.padding = padding
        self.height = height
        self.width = width
        self.backgroundColor = backgroundColor
    }
}

struct UIViewablePadding {
    var top:CGFloat
    var right:CGFloat
    var bottom:CGFloat
    var left:CGFloat
    
    init(top:CGFloat = 0, right:CGFloat = 0, bottom:CGFloat = 0, left:CGFloat = 0) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
    }
}

class UIViewable: UIView {
    var display:UIViewableDisplay = .Block
    var align:UIViewableAlign = .Top(.Left)
    var padding:UIPadding = (0,0,0,0)
    var needsLayout = true
    
    // http://www.edwardhuynh.com/blog/2015/02/16/swift-initializer-confusion/
    init(tag:Int = 0, style:UIViewableStyle = UIViewableStyle()) {
        super.init(frame:CGRect.zero)
        self.tag = tag
        
        self.style(style)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setNeedsLayout() {
        super.setNeedsLayout()
        for subview in self.subviews {
            subview.setNeedsLayout()
        }
        self.needsLayout = true
    }
    
    override func layoutSubviews() {
        if (!self.needsLayout) {
            return
        }
        self.needsLayout = false
        
        if !self.flexWidth && self.subviews.count == 1 && (self.subviews[0] as? UILabel != nil) {
            self.frame.size = CGSizeZero
            self.subviews[0].frame.size = CGSizeZero
        }

//        print("layoutSubviews \(String(ObjectIdentifier(self).uintValue)) \(self.display)")
        if ((self.display == .Block || self.display == .Flex(.Column)) && !self.flexWidth && self.maxWidth == 0 && self.superview != nil) {
            self.frame.size.width = self.superview!.frame.width
            // .Block viewables with a .Inline superview require subsequent layout to determine width
            if let superview = self.superview as? UIViewable {
                if superview.display == .Inline {
                    self.needsLayout = true
                }
            }
        }

        // TODO Flex columns and rows need to layout subviews to determine the appropriate height and width.
        // If subviews are larger than the alloted flex height and width the views are clipped
        if (self.display == .Flex(.Row) && self.superview != nil) {
            if (!self.flexWidth && self.maxWidth == 0) {
                self.frame.size.width = self.superview!.frame.width
            }

            var subviewsWidth:CGFloat = 0
            var flexibleSubviews = [UIView]()

            for subview in self.subviews {
                if (subview.maxWidth == 0) {
                    flexibleSubviews.append(subview)
                } else {
                    subviewsWidth += subview.frame.width
                }
            }

            let flexibleSubviewsWidth = (self.frame.size.width - subviewsWidth) / CGFloat(flexibleSubviews.count)
            for subview in flexibleSubviews {
                subview.frame.size.width = flexibleSubviewsWidth
            }
        } else if (self.display == .Flex(.Column) && self.superview != nil) {
            if (self.maxHeight == 0) {
                self.frame.size.height = self.superview!.frame.height
            }

            var subviewsHeight:CGFloat = 0
            var flexibleSubviews = [UIView]()

            for subview in self.subviews {
                if (subview.maxHeight == 0) {
                    flexibleSubviews.append(subview)
                } else {
                    subviewsHeight += subview.frame.height
                }
            }

            let flexibleSubviewsHeight = (self.frame.size.height - subviewsHeight) / CGFloat(flexibleSubviews.count)
            for subview in flexibleSubviews {
                subview.frame.size.height = flexibleSubviewsHeight
            }
        }

        var width:CGFloat = 0
        var height:CGFloat = 0

        for i in 0..<self.subviews.count {
            let subview = self.subviews[i] as UIView

            if let viewable = subview as? UIViewable {
                // .Flew.Row sets the flexWidth of the subview to true
                if self.display == .Flex(.Row) {
                    viewable.flexWidth = true
                }
            }

            subview.layoutSubviews()
            subview.frame.origin.y = height

            if subview as? UILabel != nil || subview as? UIImageView != nil {
                subview.frame.size.width = self.frame.width
                subview.sizeToFit()
//                if let label = subview as? UILabel {
//                    print(subview.frame.size.width)
//                    print(label.text)
//                }

                if (self.frame.width > 0 && subview.frame.width > self.frame.width) {
                    subview.frame.size.width = self.frame.width
                }

                if self.maxHeight == 0 {
                    self.frame.size.height = subview.frame.height
                } else {
                    if (subview.frame.height > self.maxHeight) {
                        subview.frame.size.height = self.maxHeight
                    }
                }
            }

            height += subview.frame.height
            
            // TODO? Move display property to UIView
            if let viewable = subview as? UIViewable {
                if i > 0 {
                    if let sibling = self.subviews[i - 1] as? UIViewable {
                        if (viewable.flexWidth || (sibling.display == .Inline && viewable.display == .Inline)) {
                            subview.frame.origin.x = sibling.frame.origin.x + sibling.frame.width
                            subview.frame.origin.y = sibling.frame.origin.y
                            
                            height -= subview.frame.height
                            if ((self.frame.origin.y + height) < (self.frame.origin.y + subview.frame.origin.y + subview.frame.height)) {
                                height = (subview.frame.origin.y + subview.frame.height)
                            }
                        }
                    }
                }
            }
            
            width = max(width, subview.frame.origin.x + subview.frame.width)
        }
        
        if (self.display == .Inline && self.frame.width == 0) {
            self.frame.size.width = width
        }
        
        // TODO Refactor so orientation change can decrease the height
        if (self.frame.height < height) {
            self.frame.size.height = height
        }
        
        // Align the subviews after they have all been layed out
        // Alignment with more than one subview might not be 100% correct
        for subview in self.subviews {
            if let viewable = subview as? UIViewable {
                if viewable.align == .Top(.Left) {
                } else if viewable.align == .Top(.Center) {
                    viewable.frame.origin.x = self.frame.width - viewable.frame.width - (self.frame.width - viewable.frame.width) / 2
                } else if viewable.align == .Top(.Right) {
                    viewable.frame.origin.x = self.frame.width - viewable.frame.width
                } else if viewable.align == .Middle(.Left) {
                    viewable.frame.origin.y = self.frame.height - viewable.frame.height - (self.frame.height - viewable.frame.height) / 2
                } else if viewable.align == .Middle(.Center) {
                    viewable.frame.origin.x = self.frame.width - viewable.frame.width - (self.frame.width - viewable.frame.width) / 2
                    viewable.frame.origin.y = self.frame.height - viewable.frame.height - (self.frame.height - viewable.frame.height) / 2
                } else if viewable.align == .Middle(.Right) {
                    viewable.frame.origin.x = self.frame.width - viewable.frame.width
                    viewable.frame.origin.y = self.frame.height - viewable.frame.height - (self.frame.height - viewable.frame.height) / 2
                } else if viewable.align == .Bottom(.Left) {
                    viewable.frame.origin.y = self.frame.height - viewable.frame.height
                } else if viewable.align == .Bottom(.Center) {
                    viewable.frame.origin.x = self.frame.width - viewable.frame.width - (self.frame.width - viewable.frame.width) / 2
                    viewable.frame.origin.y = self.frame.height - viewable.frame.height
                } else if viewable.align == .Bottom(.Right) {
                    viewable.frame.origin.x = self.frame.width - viewable.frame.width
                    viewable.frame.origin.y = self.frame.height - viewable.frame.height
                }
            }
        }
    }
    
    override func addSubview(view: UIView) {
        super.addSubview(view)
    }
    
    func tag(tag:Int) -> UIViewable {
        self.tag = tag
        return self
    }
    
    func style(style:UIViewableStyle) -> UIViewable {
        if (style.display != nil) { self.display(style.display!) }
        if (style.align != nil) { self.align(style.align!) }
        self.padding(style.padding)
        if (style.width != -1) { self.width(style.width)  }
        if (style.height != -1) { self.height(style.height) }
        if (style.backgroundColor != nil) { self.backgroundColor(style.backgroundColor!) }
        return self
    }
    
    func style(f:(view:UIView) -> Void) -> UIViewable {
        f(view:self)
        return self
    }
    
    func display(display:UIViewableDisplay) -> UIViewable {
        self.display = display
        return self
    }
    
    func align(align:UIViewableAlign) -> UIViewable {
        self.align = align
        return self
    }
    
    func padding(padding:UIPadding) -> UIViewable {
        self.padding = padding
        return self
    }

    func width(width:CGFloat) -> UIViewable {
        self.maxWidth = width
        self.frame.size.width = width
        return self
    }

    func height(height:CGFloat) -> UIViewable {
        self.maxHeight = height
        self.frame.size.height = height
        return self
    }

    func backgroundColor(backgroundColor:UIColor) -> UIViewable {
        self.backgroundColor = backgroundColor
        return self
    }
}