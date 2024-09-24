# 《Java核心技术卷Ⅰ》笔记



## 概述

- **第 1 章 + 第 2 章** ： 这两章介绍了一些东西，比如Java的发展历史啊，Java的特性啊，以及Java的运行环境等等。特别要说的是，Java是一门**面向对象**程序设计语言，程序设计语言的成功取决于**是否可以实现需要的功能**，而不是语法的精巧性。以及JDK（Java Development Kit：Java开发工具包）与JRE（Java Runtime Environment：Java运行时环境）
- **第 3 章 Java的基本程序设计结构**：这一章讲了Java的一些基础知识，比如注释啊，8 种基本类型啊（int,short,long,byte,double,float,boolean,char），变量（如何声明，初始化变量）与常量，运算符（其中还提到了短路的概念），介绍了字符串，输入输出等（这一节其实还讲了Math的一些静态方法，不过我觉得不是很重要，需要的时候可以查嘛，所以这里就不记录了）
- **第 4 章 对象与类**：这一章介绍了面向对象思想，还有类与对象的关系，说了面向对象的一些特性，以及自定义类的一些内容，还有使用构造器时代码的执行顺序

## 第 3 章 	Java的基本程序设计结构

### 1.第一个程序
```java
public class Hello {
	public static void main(String[] args) {
		System.out.println("Hello World");
	}
}
```
说明

- `public`（访问修饰符） 用于控制对所修饰的类或对象或字段的**访问级别**
- class表示这是一个类，Hello则是这个类的类名
- main方法是所有程序的**入口**
- 大括号表示方法体的开始与结束

### 2.注释

```java
//单行注释

/*
多行注释，（不能嵌套使用）
*/

/**
 * 文档注释
 * 可用于自动的生成文档
 */
```

### 3.数据类型


基本类型 | 位数 | 字节 | 默认值 
--|--|--|--
`int` | 32 |4 | 0 
`short`|16|2|0 
`long`|64 |8 |0L 
`byte`| 8 |1 |0 
`char`|16|2|'u0000'
`float` | 32 |4 |0f 
`double`|64 |8 |0d
`boolean`|1 | |false 

### 4.变量与常量

#### 变量

##### 声明变量
```java
int a;
String name;
```

即 以`变量类型`  `变量名`这种形式来声明一个变量

##### 变量初始化

声明一个变量后，必须用赋值语句对变量进行**显式初始化**，如下

```java
int a = 0;
String name = "任我行";
```

#### 常量
> 常量就是值不会变的变量

可用`final`关键字来修饰常量，而且通常此常量名为大写
```java
public final String BAIDU_URL = "www.baidu.com";
```

#### 枚举类型

> 作用：限制变量的取值范围

如下：

```java
    enum Size {SMALL,MEDIUM,LARGE,EXTRA_LARGE};
```

 那么`Size`类型的变量只能取里边的值

### 5.运算符

#### 算术运算符

| 算术运算符 | 表示 |
| ---------- | ---- |
| `+`        | 加   |
| `-`        | 减   |
| `*`        | 乘   |
| `/`        | 除   |
| `%`        | 取模 |

#### 类型转换
- 如参与运算的两个数类型不一致，则结果为较大类型的整型
- 强制转换：(有可能损失信息)

#### 其他运算符

- 二元运算符：例如`x+=4;`，运算符放于等号左边
- 自增自减运算符
  - `++x` 前缀形式会先加1再使用
  - `x++` 后缀形式会先使用原来的值，之后才加1
- 关系运算符：如`==`,`!=`，`>=`之类的，还有`&&`和`||`
- 三元运算符：`x>0 ? true : false`如表达式为真，则为`true`，如假则为`false`



#### 短路（`&&`和`||`运算符的逻辑）

如果第一个操作数已经能够确定表达式的值，第二个操作数就不必再计算了

### 6.字符串

> 这一节其实感觉没有什么好记的。。。

```java
String hello = "Hello";
// 取子串
String s = hello.substring(0,3);// Hel
// 判断是否相等
if(hello.equals("Hello")){
    //....
}
// 构建字符串
StringBuilder builder = new StringBuilder();
builder.append("builder");
builder.append("str");
String builderString = builder.toString();
System.out.println(builderString);
```

### 7.输入与输出

#### 输入

```java
Scanner input=new Scanner(System.in);
System.out.printf("请输入一个数字: ");
int num=input.nextInt();//输入
System.out.println("你输入的数字是："+num);//输出
```

#### 输出

```java
System.out.print("普通输出");
System.out.println("输出后换行");
System.out.printf("格式化输出 %.2f", 10000.0 / 3.0);
```

### 8.控制流程

##### 条件分支流程
普通分支语句
```java
int a = 1;
int b = 2;
if (a > b) {
    System.out.println("a大于b");//如果a大于b则执行这个语句
} else if (a == b) {
    System.out.println("a等于b");//如果a等于b则执行这个语句
} else {
    System.out.println("a小于b");//否则就a小于b，当以上两种情况都不是的时候执行
}
```
条件多分支语句
```java
int g=2;
switch(g) {
    case 1:{
        System.out.println("是1");//当g是1时执行
        break;
    }
    case 2:{
        System.out.println("是2");//当g是2时执行
        break;
    }
    default:{
        System.out.println("都不是");//当以上情况都不是的时候执行
        break;
    }
}
```


##### 循环流程
根据条件，反复执行某些操作

###### `for`
```java
	for(int i=0;i<5;i++) {//int i=0是初始值，i<5是循环条件。i++是循环后更新i的值，然后进入下一轮循环
		System.out.println("循环第"+i+"次");
	}
```


###### `while`
```java
		int u=5;
		while(u>0) {//当为true时执行
			System.out.println("u="+u);
			--u;
		}
```


###### `do`..`while`
```java
		int p=0;
		do {//无条件进入循环
			++p;
			System.out.println("p="+p);
		}while(p<5);//首先执行一次循环体后进行判断，若为true则继续进行下去
```

###### `for each`（增强型`for`循环）
```java
for ( 类型 变量名: 数组或集合 ) {
循环体
}
```
 与普通for循环的区别：**for each循环语句的循环变量将会遍历数组中的每个元素，而不是下标值**

#### 中断控制流程的语句

**break**：跳出一个switch case 或者一个循环

**带标签的break**：

```java
int a = 1;
read_data: // 标签名（放在希望跳出的最外层的循环之前），后面跟着冒号
while (true) {
    if (a == 1) break read_data;// break后要带着标签
    System.out.println("in");
}
// 当里边发生了break read_data就会跳到下面这个语句
System.out.println("out");
```

主要用在一些嵌套很深的循环语句中，希望发生失误后完全跳出循环体

**continue**：将控制转移到最内层循环的首部

### 9.大数

- `BigInteger`实现任意精度的整数运算
- `BigDecimal`实现任意精度的浮点数运算

### 10.数组

- 存储一组具有**相同数据类型**的数据元素的有序集合
- 用`new`操作符创建数组，整数类型的所有元素初始化为0，boolean类型的初始化为false，对象类型的则初始化为null
- 数组一旦被创建，长度就不能修改了

```java
// 声明
int num[];
int[] sum;
// 静态初始化
int num[]={1,2,3,4,5}
//动态初始化
int num[]=new int[5];//预先分配内存空间
for(int i=0;i<5;i++){
	num[i]=i*3;
}
```

## 第 4 章	对象与类

### 1.面向对象

- **面向对象编程**，是一种通过**对象**的方式，把**现实世界映射到计算机模型**的一种编程方法。
- 面向对象程序设计：程序由对象来组成
- 类：构造对象的模板或蓝图
- 对象：类的实例化

> 类和对象的关系好比 模具 和 具体的用模具实际做出来的东西

这一节里其实还提到了封装和继承的概念

封装，以前的我理解为封装就是将类里的字段对外隐藏，而其他类想要改变这些字段只能调用我的公共方法，而不可以直接修改。在读第二遍的时候，我发现封装的思想主要是为了**隐藏自己内部的实现**（内部实现不重要，重要的是对外提供的方法），保证了独立性。

继承就是通过扩展一些已有的类来构建新的类，而且新的类将会具有被扩展类的全部属性和方法，提高了**重用性**。

### 2.使用预定义类

#### 构造器

- 用来构造并初始化对象的一种特殊的方法
- 构造器的名字应该与类名相同

这里要明确一个东西，比方说，我定义了一个类叫做`Animal`，然后做了如下的操作

```java
Animal mAnimal;
```

此时，`mAnimal`叫做**对象变量**，它是一个**变量**，**不是一个对象**

然后做如下操作

```java
mAnimal = new Animal();
```

此时`mAnimal`**引用了一个对象**

**变量只能是引用对象**

#### 更改器方法和访问器方法

-  更改器方法描述的是使用了方法之后，对象的状态会改变
- 访问器方法描述的是使用了方法之后，对象的状态没有改变

### 3.用户自定义类

#### 隐式参数与显示参数

一句话，隐式参数是调用方法的对象本身（在方法中可用`this`来表示），显示参数是方法名后面的数值

####  Java中4种访问修饰符

- `private`：仅对本类可见
- `public`：对外部完全可见
- `protected`：对本包及所有子类可见
- `默认（无需修饰符）`：对本包可见

### 4.静态字段和静态方法

#### 静态字段

静态字段即用`static`修饰的字段，静态字段是属于**类**，不属于单个任何对象的

#### 静态方法

用`static`修饰的方法，属于类，不属于对象，即在静态方法中不能使用`this`关键字（即，**没有隐式参数**），静态方法不能访问实例字段，但是可以访问静态字段

### 5.方法参数

跳过

### 6.对象构造

#### 重载

- 方法签名：通过指定**方法名**和**参数类型**来描述一个方法
- 重载即是出现了多个方法，**有相同的名字，但是不同的参数**，程序会在调用方法时根据参数类型来选择使用哪一个方法

#### 调用构造器后的处理的优先级顺序

1. 如果第一行调用了另一个构造器（使用`this(...)`，另外，在构造器中调用另一个构造器这个语句也只能写在**第一行**），则执行另一个构造器
2. 否则则先后执行：
   1. 静态字段
   2. 静态的初始化块
   3. 所有实例字段初始化为默认值（0，false，null）
   4. 初始化块
3. 最后才是执行构造器主体代码

> 以前总弄不清静态字段还有静态代码块的执行顺序，今天读到这里，可谓天清地明

### 7.包

使用包来确保类名的**唯一性**

静态导入

## 第 5 章	继承

### 1.类，子类，超类

####  `this`和`super`的含义

- `this`
  - 一是指隐式参数的调用
  - 二是指调用**该类的其他构造器**
- `super`
  - 一是调用超类的方法
  - 二 是调用超类的构造器

#### 多态

一个对象变量可以指示多种实际类型的现象称为多态

替换原则：程序中出现超类对象的任何地方都可以使用子类对象替换。例如：可将子类对象赋给超类变量

重载解析：。。。

动态绑定与静态绑定：

- 动态绑定：在运行时能够自动地选择恰当的方法（调用的方法依赖隐式参数的实际类型）
- 静态绑定：用`private`，`static`，`final`修饰的方法，编译器将准确的知道该调用哪个方法

#### 强制类型转换

唯一原因：要在暂时忽视对象的实际类型之后使用对象的全部功能。

可用`instanceof`操作符来判断所属类型

#### 抽象类

更具有一般性的，只用作派生其他类的基类，而不是用来构造实例的类

可以包含字段和具体方法

不能被实例化



### 2.`Object`：所有类的超类

`Object`类是Java中所有类的氏族，每个类都自动的继承自`Object`类

**在Java中，只有基本类型不是对象**。



### 4.对象包装器和自动装箱拆箱

#### 对象包装器

因为基本类型不是对象，但有时候又需要把基本类型转换成对象来使用，所以就出现了对象包装器这个概念。

| 基本类型  | 对应的包装器类 |
| --------- | -------------- |
| `int`     | `Integer`      |
| `long`    | `Long`         |
| `float`   | `Float`        |
| `double`  | `Double`       |
| `short`   | `Short`        |
| `byte`    | `Byte`         |
| `char`    | `Character`    |
| `boolean` | `Boolean`      |

包装器类是`final`的

#### 自动装箱与自动拆箱

```java
        List<Integer> list = new ArrayList<>();
        list.add(2);
```

如上面给出的例子，`list`添加一个元素的时候，元素类型本该是`Integer`类型，可是`2`只是个`int`类型，不过没关系，`list.add(2)`将自动的变成`list.add(Integer.valueOf(2))`，这种变换称为**自动装箱**

同样的，如果想将一个`Integer`对象赋给一个`int`值时，将会**自动拆箱**





## 第 6 章	接口，lambda表达式与内部类

### 1.接口

在Java程序设计语言中，接口不是类，而是对希望符合这个接口类的一组**需求**

接口中的所有方法都自动是`public`方法（但是实现接口时，必须把方法声明为`public`）

接口中的字段总是`public static final`的

接口绝不会有实例字段

接口同样不能被实例化，但是接口变量可以引用**实现了这个接口**的类对象

一个类只能有一个超类，但可以实现`多个接口`

### 2.`lambda`表达式

先跳过，看的云里雾里的@_@

### 3.内部类

定义在另一个类中的类

原因：

- 内部类可以对同一包中的其他类隐藏
- 内部类方法可以访问外部类的私有属性

**常规内部类中可以有`static`字段（但也都必须是`final`），但是不能有`static`方法**

#### 局部内部类

在一个方法中局部地定义这个类

声明局部类时不能有访问说明符（`public`等）

对外界完全隐藏

#### 静态内部类

内部类不需要访问外围类对象，就应该使用静态内部类

**静态内部类可以有静态字段和静态方法**

在接口中声明的内部类自动是`static`和`public`



## 第 7 章	异常，断言和日志

派生于`Error`类或`RuntimeException`类的所有异常称为**非检查型异常**

所有其他异常称为**检查型异常**

这一章的剩余部分先略过，先不看



## 第 8 章	泛型程序设计

**泛型方法**：可以在普通类型中定义，也可在泛型类中定义

```java
public class ArrayAlg {
    public static <T> T getMiddle(T... a) {
        return a[a.length / 2];
    }
}
```

**限定类型**： 限定`T`只能是限定类型的子类型

```java
<T extends Comparable>
<T extends Comparable & Serializable> //甚至是多个限定
```

**类型擦除**：指的是定义了一个泛型类型，都会自动提供一个相应的原始类型。（原始类型用第一个限定来替换类型变量，如无限定，则替换为`Object`类型）

**通配符（`?`）**：

```java
<? extends Employee> //表示参数类型是Employee的子类
<? super Employee> //表示参数类型是Employee的超类
```

## 第 9 章 集合



| 集合类型     | 说明                                             |
| ------------ | ------------------------------------------------ |
| `ArrayList`  | 可以**动态**增长和缩减空间的一个索引序列         |
| `LinkedList` | 链表，可在任何位置高效的插入和删除的一个有序序列 |
|              |                                                  |



### `Iterator`与`Iterable`

`Iterator`和`Iterable`都是接口

- `Iterator`：迭代器，Java 1.2引入，用来代替` Enumeration`的，通过`hasNext`和`next`方法可以逐个访问集合中的每个元素
- `Iterable`：Java 1.5 引入，为的是**Implementing this interface allows an object to be the target of the "for-each loop" statement.**，也就是`for each`循环可以处理任何实现了`Iterable`接口的对象

## 第 12 章	并发

多线程：一个程序可以同时运行多个线程

多进程和多线程的区别：每个进程都拥有自己的一整套变量，而线程则**共享数据**

**新建线程的两种方式**

一：新建类实现`Runnable`接口（完成`run`方法），然后赋给一个`Thread`对象

```java
    public static class MyRun implements Runnable {

        @Override
        public void run() {
            System.out.println("MyRun");
        }
    }
// 使用
        Runnable r = new MyRun();
        Thread thread1 = new Thread(r);
        thread1.start();
```

二：建立一个`Thread`的子类

```java
    public static class MyThread extends Thread {

        @Override
        public void run() {
            super.run();
            System.out.println("MyThread");
        }
    }
// 使用
        Thread thread2 = new MyThread();
        thread2.start();
```

### 线程的状态

- `New`：新建
- `Runnable`：可运行（可能正在运行也可能没有运行）
- `Blocked`：阻塞
- `Waiting`：等待
- `Timed waiting`：计时等待
- `Terminated`：终止

`synchronized`关键字

从Java1.0版开始，Java中的每个对象都有一个内部锁。如果一个方法声明时有 synchronized 关键字，那么，要调用这个方法，线程必须获得内部对象锁

`volatile`修饰符：用来修饰字段，可以让多线程安全地读取一个字段