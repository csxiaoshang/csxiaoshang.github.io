---
title: Java基础
date: 2019-12-30 21:24:11
categories: Java
tags: Java
---

### 一、 数据类型

#### 基本类型

- byte 8
- short 16
- char 16
- int 32
- float 32
- long 64
- double 64
- boolean ~

boolean类型可以使用1bit来存储，但是具体大小没有明确规定。jvm会在编译时期将boolean类型转int，使用1 0 表示。

<!--more-->
#### 缓存池

基本类型对应的缓存池如下：

- boolean true false
- short -128 and 127
- int -128 and 127
- char in the range \u0000 to \u007F

以Integer为例子， new Integer()将新增一个对象，而Integer.valueOf()则会首先在缓存池里选取。

### 二、 String

#### String Pool

字符串常量池保存着所有的字符串字面量。一般来说，这些字面量编译期就确定。也可以使用String.intern()在
运行时期将字符串添加到String Pool中。


### 三、 运算

#### 参数传递

java中的参数传递是以值传递的方式，而不是引用传递。
可以认为传递的参数是针对原有引用存储值的拷贝，并不是原来的引用。

### 四、 关键字

#### final

声明数据为常量
- 对于基本类型，final使数据不变
- 对于引用类型，final是引用不变，即不可引用其他对象，但被引用的对象可以修改

声明方法不能被子类重写
private方法隐式地定义为final，如果子类中出现和基类的一个private方法名相同的方法，不是对基类方法的重写，而是新定义的一个方法

声明类不允许被继承

#### static

静态方法必须有实现，不能还是抽象方法
静态方法中不能有this super关键字，这两个关键字与具体对象关联

静态代码块在类初始化时运行一次

初始化顺序：
静态变量和静态代码块优于实例变量和普通代码块，构造函数最后初始化

存在继承的情况下，初始化顺序为：
- 父类 （静态变量、静态代码块）
- 子类 （静态变量、静态代码块）
- 父类 （实例变量、普通代码块）
- 父类 （构造函数）
- 子类 （实例变量、普通代码块）
- 子类 （构造函数）

### 五、 Object通用方法

#### equals()

实现：
- 检查是否为同一个对象的引用，如果是直接返回true
- 检查是否为同一种类型，如果不是直接返回false
- 将Object对象进行转型
- 判断每个关键字段是否相等

```java
public class Example{
    int a;
    int b;
    
    @Override
    public boolean equals(Object o){
        if(this == o ) return true;
        if(o ==null || getClass() != o.getClass()) return false;
        Example that = (Example) o;
        if(this.a == that.a && this.b == that.b)
            return true;
        else
            return false;
    }
}
```


#### hashCode()

等价的两个对象散列值一定相等
在覆盖equals()方法时应当总是覆盖hashCode()方法，保证等价的两个对象哈希值也相等。

理想的哈希函数应当具有均匀性，即不相等的对象应当均匀分布到所有可能的哈希值上。这就要求
了哈希函数要把所有域的值都考虑进来。可以将每个域都当成R进制的某一位，然后组成一个R进制
的整数。
```java
@Override
public int hashCode(){
    int result = 17;
    result = 31 * result + x;
    result = 31 * result + y;
    result = 31 * result + z;
    return result;
}
```

#### clone()

**1.cloneable**

clone()是Object的project方法，一个类没有重写Clone()方法，其他类就不能直接去调用该
类实例的Clone()方法。还需要实现Cloneable接口。

**2.浅拷贝与深拷贝**

浅拷贝：原始对象和拷贝对象引用指向同一个对象
深拷贝：原始对象和拷贝对象引用指向不同的对象

上文中的clone()方法通常是对依照原始对象new一个新的拷贝对象，然后根据原始对象的每个域
复制给拷贝对象。

**3.clone()的替代方案**
使用clone()方法比较复杂，最好不要使用clone()，可以使用拷贝构造函数或者拷贝工厂
来拷贝一个对象

也可以使用序列化的方式拷贝

### 六、继承

#### 抽象类与接口

**1.抽象类**
如果一个类中包含抽象方法，那这个类必须声明为抽象类
抽象类和普通类最大的区别是抽象类不能被实例化，只能被继承

**2.接口**

接口的成员(字段+方法)默认都是public的，并且不允许定义为private和protected
接口的字段默认都是static和final的

**3.比较**

- 从设计层面看，抽象类提供一种is-a关系，需要满足里氏代换原则，即子类对象必须
能够替换掉所有父类对象；接口更像是一种like-a关系
- 从使用上看，一个类可以实现多个接口，但是不能继承多个抽象类。
- 接口字段只能是static和final类型的，抽象类没有限制
- 接口的成员只能是public的，抽象类成员可有多种访问权限

### 七、泛型

使用泛型的好处：
1.在集合中存储对象并在使用前进行类型转换不方便，泛型提供了编译期间的类型安全，
确保能能够把正确类型的对象放入到集合中
<br>
2.在写业务封装对象时，泛型可以提供限定某种类型

[10道java泛型面试题](https://cloud.tencent.com/developer/article/1033693)
