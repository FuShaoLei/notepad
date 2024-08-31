# Android多线程

## Android多线程

由4个部分组成

- Message：消息，线程之间传递的消息
- Handler：处理者，用于发送和处理消息，消息最终都会传递到handleMessage()方法中处理
- MessageQueue：消息队列，用于存放所有通过Handler发送的消息
- Looper：将MessageQueue里的消息传递给Handler的handleMessage()方法中

大概流程：Handler通过发送Message到MessageQueue里，Looper又将Message传递给Handler的handleMessage()方法

更多细节：HandlerThread的run方法里的Looper.loop后，进入循环，不断的拿message，然后触发Handler的dispatchMessage，dispatchMessage调用handleMessage

## ThreadLocal

每一个线程里的变量不共享



内存泄漏：当一个对象没用的时候，没有被回收