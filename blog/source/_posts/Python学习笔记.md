---
title: Python学习笔记
date: 2022-04-18 13:36:47
tags:
---
1. python ()表示元祖，元祖是一种不可变序列
- 创建如：tuple = (1,2,3) 取数据 tuple[0]......  tuple[0,2].....tuple[1,2]......
- 修改元祖：**元祖是不可修改的**
- 删除元祖 del tuple
- 内置函数：

 	1. cmp（tuple1，tuple2）：比较两个元祖
 	2. len(tuple):计算元祖的长度
 	3. max（tuple）：最大值
 	4.  min（tuple）：最小值
 	5.   tuple（seq）：将列表转为元祖
2. python []表示列表，列表是可变的序列
- 创建列表l = [1,2,3,4]取数据l[0]........
- 列表可修改
- 内置函数
	1. cmp（list1，list2）：比较两个元祖
	2. len(list):计算元祖的长度
	3. max（list）：最大值
	4. min（list）：最小值
	5. list（seq）：将元祖转为列表
	6. list.append(obj):在列表末尾新增对象
	7. list.pop():移除某个数据
	8. list.remove:移除某个列表中匹配的第一个值
	9. list.sort():排序
	10. list.reverse():反转列表
	11. list.count(bj):计算对象在列表中出现的次数
	12. list.insert(index,obj) :在某个位置插入对象
3. python {} 字典；字典是可变的容器，使用比较灵活
	1. 创建字典：dict = {"a":1,"b":2}. 字典是一对：key， value的键值对 取数据dict['a'],
	2. 可修改
	3. 删除：del dict["a"] 删除某对数据  del dict 删除字典 dict.clear()清除字典所有条目
	4. 内置函数
		1. cmp（dict1，dict2）：比较两个元祖
		2. len(dict):计算元祖的长度
		3. dict.clear():删除字典数据
		4. dict.get(key, default=None):返回指定值，如果没有返回指定默认值
		5. dict.has_key(key):判断值是否存在，返回true，false
		6. dict.items（）以列表值返回返回可遍历的（键，值）的元祖
		7. dict.keys（）返回字典所有的键值
		8. dic.valyes（）返回字典所有的值

4. 名称错误包括两种情况：使用变量前忘记给他赋值，输入变量名时拼写不正确。

5. title()

   .upper()

   .lower()

   .rstrip()末尾没有空白

   .lstrip()开头没有空白

   .strip()两端没有空白 

6. python用两个**表示乘方运算

7. python的变量使用前不需要声明，但是变量在使用前都要赋值

8. import os
	 os.rename("毕业论文.txt","毕业论文-最终版.txt")
	
9. Python函数在定义的时候，默认参数`L`的值就被计算出来了，即`[]`，因为默认参数`L`也是一个变量，它指向对象`[]`，每次调用该函数，如果改变了`L`的内容，则下次调用时，默认参数的内容就变了，不再是函数定义时的`[]`了。

     定义默认参数要牢记一点：默认参数必须指向不变对象！

10. Python允许你在list或tuple前面加一个`*`号，把list或tuple的元素变成可变参数传进去：

     ```python
     >>> nums = [1, 2, 3]
     >>> calc(*nums)
     14
     ```
11. 可变参数允许你传入0个或任意个参数，这些可变参数在函数调用时自动组装为一个tuple。而关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict。请看示例：
```python
def person(name, age, **kw):
    print('name:', name, 'age:', age, 'other:', kw)
```
12. 如果要限制关键字参数的名字，就可以用命名关键字参数，例如，只接收city和job作为关键字参数。这种方式定义的函数如下：
```python
def person(name, age, *, city, job):
    print(name, age, city, job)
```
和关键字参数**kw不同，命名关键字参数需要一个特殊分隔符*，*后面的参数被视为命名关键字参数。
命名关键字参数必须传入参数名，这和位置参数不同。
13. 要创建一个class对象，type()函数依次传入3个参数：

class的名称；
继承的父类集合，注意Python支持多重继承，如果只有一个父类，别忘了tuple的单元素写法；
class的方法名称与函数绑定，这里我们把函数fn绑定到方法名hello上。
通过type()函数创建的类和直接写class是完全一样的，因为Python解释器遇到class定义时，仅仅是扫描一下class定义的语法，然后调用type()函数创建出class。
14. python计算数组元素个数可以用len(<name>)
15. random.randint取到值为闭区间
