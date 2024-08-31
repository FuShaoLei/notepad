# HTTPS

Http over SSL

在HTTP之下增加一个安全层，用于保障HTTP的加密传输

大致流程：

1. 客户端请求建立TLS连接
2. 服务端返回证书
3. 客户端验证服务端证书
4. 客户端信任服务端后，和服务端协商对称密钥
5. 使用对称密钥开始通信

详细流程：

1. Client Hello 
2. Server Hello
3. 服务端发送证书给客户端
4. Pre-master secret
5. 客户端表示将使用加密通信
6. Finished
7. 服务端表示将使用加密通信
8. Finished