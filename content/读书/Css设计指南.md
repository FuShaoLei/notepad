## 第 1 章

强调标签： `em`

-  块级元素：无论大小，都占一行。（和浏览器一样宽
- 行内元素：会互相并列

DOM：从浏览器视角来观察页面中的元素以及每个元素的属性，由此得出这些元素的一个家族树





## 第 2 章

为文档添加样式的三种方式：

- 行内样式：直接在标签内写`style`属性，如`<p style="color: red;">Hello World !</p>`

- 嵌入样式：直接在HTML文档的head标签中

  ```html
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
      <style type="text/css">
          p {
              font-size: 30px;
          }
      </style>
  </head>
  ```

- 链接样式：放在单独的一个`.css`文件里，用以下代码去链接：

  ```html
  <link href="styles.css" rel="stylesheet" type="text/css"/>
  ```

  还可以在这个css文件里去链接其他的样式表（通常放在第一行的位置）

  ```html
  @import url(other.css);
  ```

  



上下文选择符：

```
标签1 标签2 { 声明 }
```

如：

```css
article p {
    color: red;
    font-size: 30px;
    font-weight: 900;
}
```

表示的是`article`标签内的`p`标签的样式