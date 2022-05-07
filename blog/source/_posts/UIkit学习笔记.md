---
title: UIkit学习笔记
date: 2022-04-17 18:32:25
tags:
---
1. Dismiss让当前模态跳转的页面消失,返回到旧页面
2. 一个对象可以同时拥有数据和功能
3. 一般把变量放在方法的上面
4. lround()把slider.value四舍五入
5. Int(acr4_random(100))获取0～99内的一个随机整数
6. 按住ctrl从View Controller（黄色图标的那个）往标签上拖（；注意：直接在标签上按住ctrl拖拽到view controller是没有用的，不要弄反了。动作是从view controller往下拖
7. 仅仅是声明你有一个变量是不能自动创建一个相应的对象的。这个变量仅仅是对象的容器。你还需要实例化这个对象并且将它放入容器中。变量只是一个盒子，而对象是盒子中的内容。
8. 如何定义一个委托
在iOS系统的SDK里，委托无处不在，所以我们最好记住它总是由三个步骤完成。
 1、你申明自己有能力成为一个委托——成为UITextField的委托你需要将UITextFieldDelegate写到视图控制器的类的声明中去。这样就告诉了编译器这个视图控制器可以处理来自文本框的消息。
 2、你让那个有问题的对象知道视图控制器愿意成为它的委托——在我们这个例子里，这个对象是UITextField。如果你忘记了告诉文本框它有一个委托，则这个文本框永远不会发送任何消息。
 3、执行委托方法——如果你没有对你发出的消息进行响应，那么委托根本不会成立。
 通常，委托方法是可选的，所以你不需要执行全部的委托方法。例如：UITextFieldDelegate实际上声明了七个方法但是你仅仅关心textField(shouldChangeCharactersIn, replacementString)这一个。
五步定义委托
 在两个对象之间创建委托可以用以下固定的步骤，比如对象A是对象B的委托，对象B发送消息返回给对象A，步骤如下：
 1、为对象B定义一个委托协议
 2、给对象B一个可选型的委托变量，这个变量必须是weak的。
 3、当某些事件触发时，让对象B发送消息到它的委托，比如用户点击Cancel或者Done按钮时，或者它需要一点信息时。你可以用语句delegate?.methodName(self,...)来完成这个功能。
 4、让对象A遵守委托协议。将协议的名称放入类声明，class的哪一行，并且执行协议中的方法列表。
 5、告诉对象B，对象A现在是你的委托了。
9. indexPath是一个指向表中具体某一行的一个简单的对象。当table view为cell请求数据源时，你可以通过这一行的indexPath.row属性的内部行号，就可以找到是哪个cell需要数据了。
    delegate?.addItemController(**self**, didFinishAdding: item)
    复习一下整个过程：
    1、创建一个新的ChecklistItem对象
    2、将这个新创建的对象添加到数据模型中
    3、为它在table view插入一个新的cell

10. **let** VC = ViewControllerTwo()

    ​    VC.modalPresentationStyle = .fullScreen

    可以设置present的形式

11. import UIKit


    class ViewController: UIViewController {


        override func viewDidLoad() {
         
            super.viewDidLoad()


​     

            let btn1 = createButton("左上")
         
            self.view.addSubview(btn1)


​             
​    
​            let btn2 = createButton("右上")
​         
            btn2.frame.origin.x = self.view.bounds.width - btn2.frame.width
         
            self.view.addSubview(btn2)


​             
​    
​            let btn3 = createButton("左下")
​         
            btn3.frame.origin.y = self.view.bounds.height - btn3.frame.height
         
            self.view.addSubview(btn3)


​             
​    
​            let btn4 = createButton("右下")
​         
            btn4.frame.origin = CGPoint(x: self.view.bounds.width - btn4.frame.width,
         
                y: self.view.bounds.height - btn4.frame.height)
         
            self.view.addSubview(btn4)


​             
​    
​            let btn5 = createButton("居中")
​         
            btn5.center = CGPoint(x: self.view.bounds.width / 2,
         
                y: self.view.bounds.height / 2)
         
            self.view.addSubview(btn5)


​             
​    
​            let btn6 = createButton("上中")
​         
            btn6.center.x = self.view.bounds.width / 2
         
            self.view.addSubview(btn6)


​             
​    
​            let btn7 = createButton("左中")
​         
            btn7.center.y = self.view.bounds.height / 2
         
            self.view.addSubview(btn7)


​             
​    
​            let btn8 = createButton("右中")
​         
            btn8.frame.origin.x = self.view.bounds.width - btn8.frame.width
         
            btn8.center.y = self.view.bounds.height / 2
         
            self.view.addSubview(btn8)


​             
​    
​            let btn9 = createButton("下中")
​         
            btn9.center.x = self.view.bounds.width / 2
         
            btn9.frame.origin.y = self.view.bounds.height - btn9.frame.height
         
            self.view.addSubview(btn9)
         
        }


​         
​    
​        func createButton(title: String) -> UIButton {
​         
            //创建一个ContactAdd类型的按钮
         
            let button:UIButton = UIButton(type:.Custom)
         
            //设置按钮大小
         
            //button.frame=CGRectMake(0, 0, 80, 50)
         
            button.frame.size = CGSize(width: 80, height: 50)
         
            //设置按钮文字
         
            button.setTitle(title, forState:UIControlState.Normal)
         
            button.backgroundColor=UIColor.orangeColor()
         
            return button
         
        }


​     

        override func didReceiveMemoryWarning() {
         
            super.didReceiveMemoryWarning()
         
        }
    
    }

12. func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    self.window = UIWindow(windowScene: scene as! UIWindowScene);
    self.window?.backgroundColor = UIColor.white;
    let rootViewController = ViewController();
    self.window?.rootViewController = rootViewController;
    self.window?.makeKeyAndVisible();
    
    guard let _ = (scene as? UIWindowScene) else { return }
    }

13. 如果要添加手势 UILabel().isUserInteractionEnable = true
14. command + shift + L 控件库
15. 添加手势时候要实力化具体的手势	
```swift
let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapLabel.addGestureRecognizer(tap)
```
如果只写UIGestureRecognizer则不行

16. **let** onedegree = CGFloat.pi / 180

    ​     

    ​    imageView.transform = CGAffineTransform(rotationAngle: CGFloat( 90 * onedegree))

    iOS坐标系和数学上是相反的,正数为顺时针，负数为逆时针

17. ```swift
    UIView.animate(withDuration: 3, delay: 0, options: .curveEaseIn){
            self.imageView.transform = CGAffineTransform(translationX: 100, y: 100).scaledBy(x: 2, y: 2).rotated(by: 90 * onedegree)
        }
```添加动画
```

18.在使用Autolayout时，发现leftAnchor和LeadingAnchor，让我很困惑
经过一番查阅后，理解如下:

在大部分情况下，leftAnchor(左)和LeadingAnchor(前导)相等，因为大部分情况下，文字阅读是从左至右的（英语，法语，西班牙语等）。左（和trailingAnchor(尾随)和右）可以互换使用。
在部分情况，如读取方向从右到左（例如希伯来语）的区域中，LeadingAnchor(前导)将是rightAnchor(右)

这就和文字阅读习惯，和语言有关。一般情况下我们是不用区分，除非考虑这些case

19. cornerradius设置为高度的一半就为圆形
20. 给stackView添加子视图，要用arragnedSubviews
21. Command + f全部替换
