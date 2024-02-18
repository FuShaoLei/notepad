# 《图解HTTP》笔记

> HTTP，全名`Hypertext Transfer Protocol`，超文本传输协议

## 第 1 章 了解web及网络基础

互联网是再TCP/IP协议族的基础上运作起来的

TCP/IP协议族分为四层：

- 应用层：决定了向用户提供应用服务时的通信活动，如FTP，DNS，HTTP等
- 传输层：提供数据传输，如TCP，UDP
- 网络层：处理数据包？
- 链路层：用来处理连接网路的硬件部分

与HTTP密切相关的几个协议：

- IP协议：作用是保证数据包传送到指定目标
- TCP协议：作用是可靠传输
- DNS服务：负责解析域名成IP地址

**URI和URL**

- URI是**统一资源标识符**，强调是唯一标识
- URL是**统一资源定位符**，强调的是位置，在什么位置上

## 第 2 章 简单的HTTP协议

请求访问资源的一端为客户端，提供资源的一端为服务器端，始终都是由客户端来建立通信的

客户端请求报文：

```java
//  方法  URI     版本协议
    GET /user/   HTTP/1.1
// Request Headers   
    Host: api.github.com
    Content-Type: text/plain
    Content-Length:21
// Request Body
    name=fushaolei&age=21
```

服务端响应报文：

```java
//  版本协议    状态码 
	HTTP/1.1  200   OK
// Response Headers        
    Content-Type: application/json
    Content-Length:21
// Response Body
    bodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybody
```

Http是不保存状态的协议

各种请求方法：

| 方法    | 说明                                                         |
| ------- | ------------------------------------------------------------ |
| GET     | 请求资源，无Request Body，有Response Body                    |
| POST    | 用于增加或修改资源，有Request Body，有Response Body          |
| PUT     | 同样用于增加或修改资源，但和POST不同的是，PUT是幂等的（调用一次与连续调用多次是等价的），有Response Body |
| HEAD    | 获得报文首部，没有Response Body                              |
| DELETE  | 删除文件                                                     |
| OPTIONS | 询问支持方法                                                 |
| TRACE   | 追踪路径，可以查询发出去的请求是被怎样加工修改的             |
| CONNECT | 要求用隧道协议连接代理                                       |

使用Cookie进行状态管理，客户端保存好服务器端发送过来的Set-Cookie字段，在每次请求的时候带上Cookie，从而验证身份

## 第 3 章 HTTP报文内的HTTP信息

Http报文本质是由多行（CR+LF换行符）数据构成的**字符串文本**

报文结构：

请求报文：

```java
请求行
各种首部字段
// 换行，就这里空一行
Request body（如果有的话）
```

响应报文：

```java
状态行
各种首部字段
// 换行，就这里空一行
Response body（如果有的话）
```

首部字段有4种，分别是，通用首部，请求首部，响应首部，实体首部

内容编码：用于压缩和解压缩内容，有这几种：gzip，compress，deflate，identity（不进行编码）

分块传输编码：将实体分割成块传给客户端

发送多种数据的集合：multipart/form-data，multipart/byteranges，都会使用到boundary字符串来划分，比如boundary=abc，那么各个实体部分的起始行都会用--abc来进行标记，然后使用--abc--来作为结束的标志，而且每个实体部分的起始行都可含有首部字符

获取部分内容：Content-Range: bytes=5001-10000

## 第 4 章 返回结果的HTTP状态码

状态码的类别：

| 状态码 | 说明         |
| ------ | ------------ |
| 1XX    | infonational |
| 2XX    | success      |
| 3XX    | redirection  |
| 4XX    | client error |
| 5XX    | server error |

常见状态码：

| 状态码 | 说明                                                         |
| ------ | ------------------------------------------------------------ |
| 200    | OK，被服务器正常处理，且对应请求的实体会返回                 |
| 204    | Not Content，被服务器正常处理，但没有实体返回                |
| 206    | Partial Content，范围请求，响应报文应该有Content-Range来指定内容 |
| 301    | Move Permanently，永久重定向                                 |
| 302    | Found，临时重定向                                            |
| 303    | See Other                                                    |
| 304    | Not Modified                                                 |
| 307    | Temporary Redirect                                           |
| 400    | Bad Request，错误的请求                                      |
| 401    | Unauthorized，为验证身份                                     |
| 403    | Forbidden，访问被拒绝                                        |
| 404    | Not Found 无法找到资源                                       |
| 500    | Internal Server Error                                        |
| 503    | Service Unavailable                                          |

## 第 5 章 与HTTP协作的Web服务器

通信数据转发程序：代理（服务器和客户端的“中间人”），网关（转发通信数据），隧道（安全通信）

在HTTP之前出现的协议：FTP，NNTP，Archie，WAIS，Gopher

## 第 6 章 HTTP首部

格式：

```
首部字段名:字段值1，字段值2
```

各种首部字段：

通用首部字段

| 字段名            | 说明                               |
| ----------------- | ---------------------------------- |
| Cache-Control     | 指定缓存的工作机制，有一堆         |
| Connnection       | 管理持久连接                       |
| Date              | 创建Http报文的日期和时间           |
| Transfer-Encoding | 传输报文主体时采用的编码           |
| Upgrade           | 检测http及其他协议是否有高可用版本 |

请求首部字段：

| 字段名          | 客户端想向服务器说明的                                       |
| --------------- | ------------------------------------------------------------ |
| Accept          | 能够处理的媒体类型                                           |
| Accept-Charset  | 支持的字符集                                                 |
| Accept-Encoding | 能支持的内容编码（gzip，compress，deflate，identity）        |
| Accept-Language | 能处理的语言                                                 |
| Authorization   | 认证信息                                                     |
| Host            | 目标主机地址（**给目标主机定位子主机的**），这是唯一一个必须包含在请求内的字段 |
| Range           | 对于只想获取部分资源，这个字段指定部分资源的范围             |
| Referer         | 请求的URI是从哪个web页面发起的                               |
| User-Agent      | 浏览器的种类                                                 |
| Cookie          | 请求需要验证Cookie时带上                                     |

响应首部字段：

| 字段名      | 服务器想向客户端说明的 |
| ----------- | ---------------------- |
| Location    | 重定向的uri            |
| Retry-After | 稍后发出请求的时间     |
| Server      | http服务器的信息       |
| Set-Cookie  | 返回给客户端Cookie     |

实体首部字段：

| 字段名           | 说明                     |
| ---------------- | ------------------------ |
| Content-Encoding | 实体的内容编码           |
| Content-Language | 实体使用的语言是什么     |
| Content-Length   | 实体的大小（单位是字节） |
| Content-Location | 实体对应的URI            |
| Content-Range    | 字节为单位的实体范围     |
| Content-Type     | 实体媒体类型             |

## 第 7 章 确保Web安全的HTTPS

http的缺点：

- 明文传输，内容可能会被窃听
- 不验证身份，有可能遭遇伪装
- 无法验证报文的完整性，可能已被篡改（像这样，请求或响应传输途中，遭攻击者拦截并篡改内容的攻击称为**中间人攻击**）

Https = Http + 加密 + 认证 + 完整性保护，简单来说 Https = Http + SSL

这一章看到傻，稍后在补回来

## 第 8 章 确认访问用户身份的认证

BASIC认证，DIGEST认证
