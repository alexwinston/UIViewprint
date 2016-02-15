# &lt;UIViewprint/&gt;

iOS view layout completely reimagined

> **Blueprint** /ˈbluːˌprɪnt/ : a detailed outline or plan of action:
a blueprint for success.

```swift
var emailTextField:UITextField?
var passwordTextField:UITextField?
    
self.view
    < .view+>
	    < "Please enter your login credentials"==.align(.Top(.Center))>>
	    < .view(.style(height:10))>>
	    < .flexRow()+>
	        < .view(.style(width:100))+>
	            < "Email:"==.align(.Top(.Right))>>
	        < .view/>
	        < .input(&emailTextField, placeholder:"john@doe.com", style:roundedCorners)>>
	    < .view/>
	    < .flexRow()+>
	        < .view(.style(width:100))+>
	            < "Password:"==.align(.Top(.Right))>>
	        < .view/>
	        < .input(&passwordTextField, placeholder:"", style:roundedCorners)>>
	    < .view/>
	    < .view(.style(height:20))>>
	    < .button("Login", display:.Flex(.Row), touch:login)>>
	< .view/>
    
func roundedCorners(textField:UITextField) {
    textField.borderStyle = .RoundedRect
}
    
func login(button:UIButton) {
    print(emailTextField!.text)
}
```

![UIViewprint Example 1](images/example1.png)

## Disclaimer

**UIViewprint** is an experiment that pushes Swift operator overloading and various language features to the absolute limit.  It also regularly crashes the Xcode editor but I haven't had time to submit any bug reports.  That being said I have been pleasently surprised with what is possible in Swift. I am very interested in getting feedback about the progress of the project so far and whether it is worth developing further.

I would also note that the layout logic is only about 95% complete and it is not optimized for performance.  Pull requests are welcome.

**This is primarily a thought experiment to demonstrate how layout can be simplified with Swift operator overloading.  The operators chosen are ment to mimic HTML but other operators might actually be better. Constructive feedback is welcomed.**

## The Basics
UIViewprint grew out of various shortcomings and frustrations with Interface Builder, Auto Layout, Stack Views and the myriad of Swift frameworks that attempt to make Auto Layout easier. In an effort to reimagine how layout could be improved a structure similar to HTML and CSS was adopted given it's ubiquity and surprising ability to model heirarchical views quite well.

### Example 1
UIViewprint can be utilized from a controller or any code that initializes a view. In the examples below a basic UIViewController is assumed.

```
override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view
    	// Could use UIView.view if Xcode complains about ambiguities
        < .view>>
}
```

In this particular example a blank "block" style view is added as a subview to the controllers view.  Because it does not contain any children or have a specified height nothing is displayed. Of interest however is the two overloaded operators "<" and ">>".

The overloaded infix operator "<" is used to trigger the addition of a subview.  In this case to the controllers view.  The UIView.view is an extension that provides a simple way to initialize a new view (UIViewable).
The overloaded postfix operator ">>" is used to trigger the close of the view.  This is somewhat analogous to &lt;div&gt;&lt;/div&gt;


### Example 2

In this example a view is added to the top of the controllers view with a height of 10 and width of the controllers view.  By default UIViewables are displayed as "block" elements and as such expand to fill the width of the parent view.

```
override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view
        < .view(.style(height:10, backgroundColor:.orangeColor()))>>
        // This is shorthand for UIViewable().style(height:10)
}
```
![UIViewprint Example 2](images/example2.png)

### Example 3

In this example UILabels are introduced as well as several more overloaded operators

```
override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view
        < .view+>
            < "Label 1">>
            < "Label 2">>
            < "Label 3"==.display(.Block)>>
        < .view/>
}
```

![UIViewprint Example 3](images/example3.png)

Of interest is the fact that by default UILabels are analogous to "inline" elements.  Label 1 and label 2 align inline.  Label 3 is pushed below the previous labels because it's display property has been set to "block".

Additionally the "+>" and "/>" operators have been introduced.

The "+>" operator is used to "open" a new view so subviews can be added. 
The "/>" operator is used to close the view that was previously opened.

This is similar to the following HTML

```
	<div>
		Label 1
		Label 2
		<div>Label3</div>
	</div>
```

## Flex rows

Flex rows are similar to an HTML flex container with flex row items. Unlike  CSS flexbox layout, views within a flex row are automatically divided equally among the parent views width unless a view specifically defines a width.

### Example 4

```
override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view
        < .flexRow()+>
            < "Label 1">>
            < "Label 2">>
            < "Label 3">>
        < .view/>
}
```

![UIViewprint Example 4](images/example4.png)

As expected three evenly spaced views have been created that each contain the specified label.  The views within a flex row are by default aligned top left.

If however the first label specifies a width of 100 then the remaining views divide the space evenly after accounting for the fixed width view.

```
override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view
        < .flexRow()+>
            < "Label 1"==.width(100)>>
            < "Label 2">>
            < "Label 3">>
        < .view/>
}
```

## Flex columns

Flex columns are similar to to flex rows but stretch along the Y axis. Views within a flex column are automatically divided equally among the parent views height unless a view specifically defines a height.

### Example 5

```
override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view
        < .flexColumn()+>
            < .view+>
                < "Label 1">>
            < .view/>
            < .view+>
                < "Label 2">>
            < .view/>
            < .view+>
                < "Label 3">>
            < .view/>
        < .view/>
}
```

![UIViewprint Example 5](images/example5.png)

## Advanced features

### Example 6

This example demonstrates how layout compares to the popular [Stevia](https://github.com/s4cha/Stevia) framework.  UIViewprint currently doesn't support the concept of padding.  If this were to be added this example could be further simplified.

```swift
var emailTextField:UITextField?
var passwordTextField:UITextField?
    
self.view
    < .flexColumn()+>
        < .view>>
        < .flexRow()+>
            < .view(.style(width:10))>>
            < .view+>
                < .input(&emailTextField, "Email", style:largeRoundedStyle)>>
                < .view(.style(height:10))>>
                < .input(&passwordTextField, "Password", style:largeRoundedStyle)>>
            < .view/>
            < .view(.style(width:10))>>
        < .view/>
        < .view>>
        < .view+>
            < .button("Login", display:.Flex(.Row), height:80, touch:login).align(.Bottom(.Left))>>
        < .view/>
    < .view/>
 
func login(button:UIButton) {
    print(emailTextField!.text)
}
    
func largeRoundedStyle(view:UIView) {
    if let textField = view as? UITextField {
        textField.borderStyle = .RoundedRect
        textField.frame.size.height = 60
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 26)
    }
}
```

Of particular interest is the ability to associate wrapped components to variables via inout parameters. It is also easy to bind touch events to targets within the markup directly via "touch:login" as a parameter to the .button function. Additionally function callbacks allow styles to be reused across components and views.

![UIViewprint Example 6](images/example6.png)

### Example 6a

This example demonstrates a UIViewprint implementation of the Facebook profile page developed to highlight the features of the [Neon](https://github.com/mamaral/Neon) framework
 
```
class ActionView: UIViewable {
    init(_ actionText:String) {
        super.init()
        
        self
            < UIViewable().align(.Top(.Center)).height(60).backgroundColor(.orangeColor())>>
            < actionText==.align(.Top(.Center)).backgroundColor(.yellowColor())>>
    }
}

class ViewController: UIViewableController {
    var bannerView:UIViewable = .view(.style(backgroundColor:.lightGrayColor()))
    var avatarView:UIViewable = UIViewable(style:UIViewableStyle(backgroundColor:.grayColor()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example 6"
        self.edgesForExtendedLayout = UIRectEdge.None;
        
        self.view = UIViewable()
        self.view
            < bannerView+>
                < .view(.style(.Flex(.Row), align:.Bottom(.Left)))+>
                    < .view(.style(.Flex(.Row)))+>
                        < avatarView>>
                        < .view(.style(align:.Middle(.Left)))+>
                            < "Alex"==.display(.Block)>>
                            < "Winston"==.display(.Block)>>
                        < .view/>
                    < .view/>
                    < UIViewable(style:UIViewableStyle(align:.Bottom(.Left), width:30, height:30, backgroundColor:.blueColor()))>>
                < .view/>
            < .view/>
            < UIViewable().display(.Flex(.Row))+>
                < UIViewable()+>
                    < .view(.style(align:.Top(.Center), width:30, height:30, backgroundColor:.greenColor()))>>
                    < "Test"==.align(.Top(.Center))>>
                < .view/>
                < UIViewable()+>
                    < UIViewable().align(.Top(.Center)).width(30).height(30).backgroundColor(.greenColor())>>
                    < "Test"==.align(.Top(.Center))>>
                < .view/>
                < UIViewable()+>
                    < UIViewable().align(.Top(.Center)).width(30).height(30).backgroundColor(.greenColor())>>
                    < "Test"==.align(.Top(.Center))>>
                < .view/>
                < UIViewable()+>
                    < UIViewable().align(.Top(.Center)).width(30).height(30).backgroundColor(.greenColor())>>
                    < "Test"==.align(.Top(.Center))>>
                < .view/>
            < .view/>
            < UIViewable().display(.Flex(.Row))+>
                < UIViewable().width(10)>>
                < ActionView("About").backgroundColor(.yellowColor())>>
                < UIViewable().width(10)>>
                < ActionView("Photos").backgroundColor(.yellowColor())>>
                < .width(10)>>
                < UIViewable()+>
                    < UIViewable().align(.Top(.Center)).height(60).backgroundColor(.orangeColor())>>
                    < "Test"==.align(.Top(.Center)).backgroundColor(.yellowColor())>>
                < .view/>
                < UIViewable().width(10)>>
            < .view/>
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let isLandscape:Bool = UIDevice.currentDevice().orientation.isLandscape.boolValue
        let bannerHeight:CGFloat = self.view.frame.height * 0.43
        let avatarHeightMultipler:CGFloat = isLandscape ? 0.75 : 0.43
        let avatarSize = bannerHeight * avatarHeightMultipler
        
        self.bannerView.height(bannerHeight)
        self.avatarView.width(avatarSize).height(avatarSize)
    }
}
```

![UIViewprint Example 6a](images/example6a.png)

## View alignment

UIViewprint makes view alignment within a parent relatively painless. Views can be aligned vertically (Top, Middle, Bottom) and horizontally (Left, Center, Right). The example below illustrates how labels can be aligned but because they are inline views by default the layout is slightly more complex than other views.

### Example 7

```
self.view
    < .flexColumn()+>
        < .flexRow()+>
            < .view+>
                < "Top Left"==.align(.Top(.Left)).backgroundColor(.yellowColor())>>
            < .view/>
            < .view+>
                < "Top Center"==.align(.Top(.Center)).backgroundColor(.orangeColor())>>
            < .view/>
            < .view+>
                < "Top Right"==.align(.Top(.Right)).backgroundColor(.redColor())>>
            < .view/>
        < .view/>
        < UIViewable().style(UIViewableStyle(display:.Flex(.Row), backgroundColor:.lightGrayColor()))+>
            < UIViewable().align(.Middle(.Left))+>
                < "Mid Left"==.backgroundColor(.yellowColor())>>
            < .view/>
            < UIViewable().align(.Middle(.Center))+>
                < "Mid Center"==.align(.Middle(.Center)).backgroundColor(.orangeColor())>>
            < .view/>
            < UIViewable().align(.Middle(.Right))+>
                < "Mid Right"==.align(.Middle(.Right)).backgroundColor(.redColor())>>
            < .view/>
        < .view/>
        < .flexRow()+>
            < UIViewable().align(.Bottom(.Left))+>
                < "Bottom Left Test"==.align(.Bottom(.Left)).backgroundColor(.yellowColor())>>
            < .view/>
            < UIViewable().align(.Bottom(.Center))+>
                < "Bottom Ctr"==.align(.Bottom(.Center)).backgroundColor(.orangeColor())>>
            < .view/>
            < UIViewable().align(.Bottom(.Right))+>
                < "Bottom Right"==.align(.Bottom(.Right)).backgroundColor(.redColor())>>
            < .view/>
        < .view/>
    < .view/>
```

![UIViewprint Example 7](images/example7.png)

## TODO
* Polish up the various examples included in the project
* Add the ability to easily pad views
* Include examples of using UIViewprint within a table view
* Consider using SwiftBox for better layout and performance
* Decide whether this abomination should be put out to pasture

## Contact
Twitter: [@alex_winston](https://twitter.com/alex_winston)