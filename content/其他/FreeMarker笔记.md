# FreeMarker笔记



## 使用对象：

对象需要继承Serializable接口并实现getter setter方法

```java
public class User implements Serializable {
    private String name;
    private String baseUrl;

    public User(String name, String baseUrl) {
        this.name = name;
        this.baseUrl = baseUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBaseUrl() {
        return baseUrl;
    }

    public void setBaseUrl(String baseUrl) {
        this.baseUrl = baseUrl;
    }
}
```
然后直接使用

```
<html>
<head>
  <title>Welcome ${user.name}</title>
</head>
<body>
  <h1>${user.baseUrl}</h1>
</body>
</html>
```



## 循环

```
<#list user.dataLists as item>
<p>${item!''}</p>
</#list>
```



## 判断

```
<#if nodeItem.type == 1>
<#elseif nodeItem.type == 2>
</#if>
```

## 包含

共享变量

```
<#include "./footer.ftl"/>
```

