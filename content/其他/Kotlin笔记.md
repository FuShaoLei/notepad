# Kotlin

kotlin中没有分号

kotlin中在后边进行类型的声明

## 函数

```kotlin
/**
 * main函数，同java一样，程序的入口
 * Unit表示返回值为空
 */
fun main():Unit{
    println("Hello Kotlin!")
}
// 带参数的函数
fun test(x:Int):Int{
    return x*2
}
// 函数参数默认值
@JvmOverloads // 表示重载，在java代码中可以使用
fun msg(name: String, age: Int = 19) { // 这里的age默认为19
    println("name = $name , age = $age")
}
```

## 变量

- var声明为可变的
- val声明为只读的（相当于Java中加上final的变量）

```kotlin
// 可写成 var age = 18，系统会自动识别
var age: Int = 18
val NAME = "JulyPost"
// 创建对象直接如此，不需要new关键字了
var person = Person()
```

## 可空类型和不可空类型

在kotlin里，所有的变量都默认是**不允许为空**的

```kotlin
var a: String = "abc" // 非空类型
var b: String? = "cba" // 可空类型
a = null // 赋空报错
b = null // 可赋为空
```

## 调用符

```kotlin
var b: String? = "cba" // 可空类型
println(b?.length) // 安全调用
println(b!!.length) // 强制调用
```

安全调用符号`?.`会检查是否非空，非空则返回`b.length`，而强制调用`!!.`则会强制调用`b.length`

## `lateinit`

延迟初始化

```kotlin
lateinit var username:TextView
```

## `constructor`

构造器关键字

```kotlin
// 空构造
constructor()
// 带参数的构造
constructor(context:Context)
// 调用其他构造器
constructor(context:Context):this(context,null)
// 调用父类构造器
constructor(context:Context):super(context,1)
```

## `Any`和`Unit`

`Any`可以对应java中的`Object`

`Unit`可以对应java中的`void`

## 数组

```kotlin
var dataList = arrayOf("xx", "aa") // 定义一个数组
```

## 静态函数和属性

- 顶层函数（直接在kt文件里定义函数）
- object声明一个单例对象，可直接使用
- companion object 也是生成一个单例对象
- `@JvmStatic`：通过这个注解，让object和companion object 的内部函数和属性，真正的生成为**静态**

另外，匿名内部类是用的object关键字进行创建的

```kotlin
object : OnClickListener {
    // ....
}
```

## 字符串

```kotlin
val name = "任我行"
val text = "我是${name}" // 拼接字符串,还可以是函数的返回值
val text = """
        我的第一行
        我是第二行
        我是第三行
    """.trimIndent() // 多行字符串
```

## when

switch的高级版，分支条件支持表达式

```kotlin
var num = 21
when (num) {
    in 1..10 -> println("小于10")
    in 11..20 -> println("小于20")
    in 21..30 -> println("小于30")
    else -> println("未知")
}
```

## 各种声明

```kotlin
// 抽象类
abstract class className{...}
// 接口
interface className{...}
// 注解
annotation class className{...}
// 枚举
enmu class className{...}
// 数据类
data class className{...}
```

## 编译期常量

在静态变量上加上`const`关键字

```kotlin
companion object {
    const val GOOGLE_URL = "https://www.google.com/";
}
```

## 内部类

```kotlin
class outer{
    // 默认静态内部类
    class inner1{
        
    }
    // 嵌套内部类
    inner class inner2{
        
    }
}
```

## `internal`

当前模块可见

## `open`和`final`

在kotiln中，类和函数默认是被`final`修饰的（除了`abstract`和`override`外）

而使用open来修饰，就表示可以继承

## 主构造器和`init`

```kotlin
class Activity constructor(name: String?) {
    private var name: String? = null

    init { // init是初始化代码块
        this.name = name
    }
}
```

更简洁的写法：

```kotlin
class Activity constructor(var name: String?) {
    // 在构造的时候就定义变量
}
```

## `==`和`===`

- `==`调用`equals()`进行比较
- `===`比较引用地址

## `?:`

在kotiln中，这是一个用于简化`if null`的操作符

```kotlin
name?:"令狐冲" // 如果name是null的话，则赋值为"令狐冲"
```

## 扩展函数

可以如此使用：

```kotlin
fun main() {
    var text = "乌拉"
    println(text.msg())
}

fun String.msg(): String {
    return "====> $this"
}

```

## 委托

 ```kotlin
 val name: String by lazy {"萧峰"} // 延迟，语句只在第一次访问时执行
 ```

## `internal`

相同模块可见

## 协程

是一套由Kotlin官方提供的线程API，优势在于可以把不同线程的代码写在同一代码块 
