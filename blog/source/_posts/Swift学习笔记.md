---
title: Swift学习笔记
date: 2022-04-17 18:31:31
tags:
---
1. 类型判断type(of:)
2. 拼接字符串\()要放在字符串里面，里面也可加各种数据类型
3. 类型别名typealias S = String后面即可用S来代替String
只有字符串类型才可以通过+拼接,类型转换 Sting() 将其他类型转换为字符串型,将值打印出来，可以通过拼接字符串或者类型转换
4. ??(空合运算符)语法，如果optional类型的值能解包出来，就返回解包出来的的值，为nil，则返回??后面的值 
- value =  a! ?? 0
- value = a != nil a! : 0
5. ！在optional类型的值明确存在时候可使用，即解析一个可选类型的值
元组也属于值类型，赋值时会拷贝一份新的，也可在声明元组类型时给其中每一个参数起一个名称，就可以通过.名称来获取元组的值，而不需要索引
元组可以通过解构赋值eg:let (name1,name2) = (1,2),swift可以通过类型推断判断
各个元组参数的类型，函数可以返回元组类型的值
6. 用_可以匿名参数
7. **可选项绑定**：a为optional类型的
if let value  = a{
}else{
}
8. 隐式解析：
var a:Int! = 100(明确a有值，后续还可以给a赋值为nil，而普通类型不行)
var b:Int = a
9. Swift中switch-case默认没有穿透效果，所以在每个case语句的句末不需要加break语句，可以在前一个语句末尾加上fallthrough使其具有穿透效果，即可以在匹配成功后继续执行下一个case语句
10. Switch可以在一个case中匹配多个值，case 1，2，3 
case 1..<9
case let(10,name)	进行解构赋值(拆分匹配)，如果value中第一个参数值为10，则把第二个参数的值赋给参数名称name
case let(name1,name2)where name1 < name2 用where加上额外的条件
11. 要跳过一定数目的值时使用：
for index in stride（from: to : by:){}
By为步长，包括开头，不包括结尾
for index in stride（from: through : by:){}
By为步长，包括开头，包括结尾
12. .reversed()可以使其反向，如stride().reversed()
13. repeat-while先运行一次，在进行判断
14. .count获得字符串的长度
15. .endIndex获取的为string最后一个字符的后一位的Index
16. 若要获取最后一位的Index，则string.index(before:string.endIndex)
17. 知道相对于startIndex偏移位置，获取Index，则
string.index(string.startIndex，ofsetBy：3）ofsetBy后面加的为偏移量
获取所要打印的字符串首位Index和末尾Index后，可以通过string[a…b]来获取a到bIndex范围的字符串
18. .firstIndex(of:””)可以获取某个字符的Index，但其为optional类型的，需要通过??来确保其为Index类型
19. .prefix(Int)可以直接获取字符串的前几个字符
20. ..<string.endIndex，可以到字符串的最后一位
21. .contains(“Character”)用于判断字符串内是否包含某个字符，为Bool类型的值
22. .contains(where:String.contains(“String”)用于判断字符串内是否包含某个字符串，为Bool类型的值
23. .hasPrefix(“String”)(判断字符串是否有前缀
24. .hasSuffix(“String”)(判断字符串是否有后缀
25. 追加字符串.append(“String”)
26. 插入字符串.insert(contentsOf:”String”,at:Index)
27. 替换字符串.replaceSubrange(Range(Index),with”String”)(通过Index范围)
28. 删除字符串.remove(Range(Index)) 
29. “””
“””三个引号括起来后可以打印里面的内容，注意引号要对齐
#“ ”#里面的东西都当成字符串
30. 可以通过初始化器创建一个数组
var a = [Int]()
var b = Array<Int>()
var c = Array(repeating:-1,count:3)
构造一个含三个-1的数组
31.  插入数组元素.insert(元素,at:数组下标)
32. 很多类似字符串，将Range（Index）化成下标
33. .sort({})通过一个匿名函数（闭包）来将数组进行排序
34. .filter({})通过一个匿名函数（闭包）来将数组进行过滤，返回一个新的
35. array[0…]表示从数组的第一位到最后一位
36. remove(元素)可以直接删除数组里的元素
37. dictionary.update(value,forKey:key)若有key则更新值，若没有则在原字典添加上一个键值对
38. dictionary[key ?? “Unknown”] = value修改键对应的值
39. dictionary.remove(forKey:key)删除key对应的value
40. 断言assert一般用于类型判断
41. guard拦截语句(守护语句)，可用于处理optional类型的值
guard let value = a(optional类型的） {}
42. Inout关键字param:inout Int 在值传递时变成引用传递，可改变参数的值，在使用时要在参数名称前加&，如&a（和指针有点像）
43. 匿名函数，没有参数，没有返回值
var b:()->Void = {()->Void in return…},可以放在参数类型为()->Void的函数里
44. 若一个函数没有参数，没有返回值，用闭包实现函数赋值时可以省略in和前面的函数体部分
var
Var c = {函数实现部分}
func test(param:(Int,Int)->Int){
    print(param(10,20))
}
test(param: {$0 + $1})
test(param: {return $0 + $1})
test(param: {(a:Int,b:Int)->Int in
    return  a + b
})
45. 类型大驼峰，变量名小驼峰
46. 枚举可以定义枚举类型值，也可以给每个枚举设定类型
如enum TestEnum:Int{ case a = 1
case b = 2
}
case a（String）
用TestEnum.a.rawValue可以获取枚举的原始值
47. 若要遍历枚举，则设定枚举类型为CaseIterable
48. 通过.allcase获取枚举的全部case
49. 在结构体中只有在方法前面加关键字mutating才能调用这个方法对这个结构体的属性进行修改
50. Static let静态属性，只能通过结构体来调用
51. 结构体实例调用为值传递，实例为常量，改变不了结构体属性
52. 结构体内部给变量加上private说明此变量只有在结构体内部才能使用
类中构造器要调用其它构造器的值永convenience init
53. Static func静态方法只能在类中调用，不能在实例中调用
54. 类实例设置为let，仍然可以改变实例中的var属性
55. AnyObject可以赋一个类的类型
Any可以赋任何一个类型
56. 子类对象对父类的一个引用，生成对象叫做实例化，对象=实例
57. 在类中方法前面加上private说明此方法只能在类中使用，而加上public说明既可以在类中使用，也可以在类外面使用
58. 父类类型的一个引用指向子类类型
var stu:Person = Student(name:”student”,age:18)
59. 向下类型转换
var stu:Any = Student(name:”student”,age:18)
var s = stu as? Student
print(s?.getName())
print(s!.getAge())
If let s = stu as? Student{}
60. 每当你定义一个新的结构体或者类时，你都是定义了一个新的 Swift 类型。请使用 UpperCamelCase 这种方式来命名类型（如这里的 SomeClass 和 SomeStructure），以便符合标准 Swift 类型的大写命名风格（如 String，Int和 Bool）。请使用 lowerCamelCase 这种方式来命名属性和方法（如 frameRate 和 incrementCount），以便和类型名区分。

