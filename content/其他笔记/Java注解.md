注解：元数据，一种代码级别的说明？

元注解：可以注解到注解上的注解。

@Retention：定义了该注解的生命周期

| 注解                        | 说明                                                         |
| --------------------------- | ------------------------------------------------------------ |
| **RetentionPolicy.SOURCE**  | 注解只在源码阶段保留，在编译器完整编译之后，它将被丢弃忽视   |
| **RetentionPolicy.CLASS**   | 注解只被保留到编译进行的时候，它并不会被加载到 JVM 中        |
| **RetentionPolicy.RUNTIME** | 注解可以保留到程序运行的时候，它会被加载进入到 JVM 中，所以在程序运行时可以获取到它们 |

@Target：表示该注解用于什么地方

| 注解                            | 说明                                                 |
| ------------------------------- | ---------------------------------------------------- |
| **ElementType.CONSTRUCTOR**     | 对构造方法进行注解                                   |
| **ElementType.ANNOTATION_TYPE** | 对注解进行注解                                       |
| **ElementType.FIELD**           | 对属性、成员变量、成员对象（包括 enum 实例）进行注解 |
| **ElementType.LOCAL_VARIABLE**  | 对局部变量进行注解                                   |
| **ElementType.METHOD**          | 对方法进行注解                                       |
| **ElementType.PACKAGE**         | 对包进行注解                                         |
| **ElementType.PARAMETER**       | 对描述参数进行注解                                   |
| **ElementType.TYPE**            | 对类、接口、枚举进行注解                             |

@Documented：表示是否将注解信息添加在Java文档中

@Inherited: 表示继承，如果一个超类带有 @Inherited 注解，那么对于该超类，它的子类如果没有被任何注解应用的话，那么这个子类就继承了超类的注解。

@Repeatable：  Java 8 中加入的，是指可重复的意思。通常使用 @Repeatable 的时候指**注解的值可以同时取多个**