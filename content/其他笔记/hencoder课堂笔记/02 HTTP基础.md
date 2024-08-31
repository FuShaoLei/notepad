
# HTTP基础
## HTTP定义

全名`Hypertext Transfer Protocol`，超文本传输协议


## 请求报文

请求报文由三部分组成，分别是

- **请求行**，包括请求方法（get，post..之类的），URL，Http协议版本
- Request Headers
- Request Body

例如：

```
GET / HTTP/1.1             
Host: api.github.com
Content-Type: text/plain
Content-Length:243

bodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybody
```

## 响应报文

由三部分组成，分别是

- **状态行**，包含Http协议版本，状态码，状态信息
- Response Headers
- Response Body

例如：

```
HTTP/1.1 200 OK
content-type: application/json....

bodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybodybody
```

## 常用请求方法

| 请求方法 | 说明                                                      |
| -------- | --------------------------------------------------------- |
| `GET`    | 用于获取资源，没有请求body，有响应body                    |
| `POST`   | 增加或修改资源，有请求body，有响应body                    |
| `PUT`    | 修改资源，有请求body，有响应body                          |
| `DELETE` | 删除资源，没有请求body，有响应body                        |
| `HEAD`   | 用于获取资源，信息（类似`GET`方法，但是没有**响应body**） |



## 状态码

| 状态码 | 说明       | 例子                                                         |
| ------ | ---------- | ------------------------------------------------------------ |
| `1XX`  | 临时性消息 |                                                              |
| `2XX`  | 请求成功   | 200-请求成功                                                 |
| `3XX`  | 重定向     | 301-资源被永久转移、302-临时跳转                             |
| `4XX`  | 客户端错误 | 400-bad request、401-unauthorized、403-禁止访问、404-资源不存在 |
| `5XX`  | 服务器错误 | 500-服务器错误，503-服务器不能处理请求                       |


## Header 首部 

HTTP消息的**元数据**（`metadata`）

| Headers                   | 说明                                                         |
| ------------------------- | ------------------------------------------------------------ |
| Host                      | **目标主机地址（给目标主机定位子主机的）**                   |
| Content-Length            | Body 的长度                                                  |
| Content-Type              | Body的类型<br />**text/html**：html文本<br />**application/x-www-form-urlencoded**：普通表单（纯文字表单），encoded URL 格式<br />**multipart/form-data**：多部份形式，一般用于传输包含二进制内容的多项内容<br />**application/json**：json形式，用于 Web Api 的响应或 POST/PUT 请求<br />**image/jpeg**， application/zip... ：单文件，用于Web Api 响应或 POST/PUT 请求 |
| Chunked Transfer Encoding | 分块传输编码，不知道 Body 有长的时候，用于分块传输（需要在header 指定`Transfer-Encoding:chunked`），减少用户等待 |
| Location                  | 重定向的目标URL                                              |
| User-Agent                | 用户代理                                                     |
| Range/Accept-Range        | 指定 Body 的内容范围，分段加载（用于断点续传，多线程下载）   |
| Accept                    | 客户端能接受的数据类型，如text/html                          |
| Accept-Charset            | 客户端接受的字符集，如utf-8                                  |

