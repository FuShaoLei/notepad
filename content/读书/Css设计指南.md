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

  

### 分组选择符：

```
标签1,标签2 { 声明 }
```

表示：标签1，和标签2 的样式

```

### 上下文选择符：

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

表示：`article`标签内（上下文）的`p`标签的样式 （只要p标签在整个dom结构中，**其中**有一个叫article的祖先元素，那么就会有这个样式）

又比如：

```css
article p em {
    color:green;
}
```

表示：em标签也一个祖先元素是p，然后p有一个祖先元素是article，这样的话em才会有这个样式

### 子选择符：

```
标签1 > 标签2 { 声明 }
```

如：

```css
article > em {
    color:green;
}
```

表示：em标签的直接父元素必须是article（也就是包裹着它的元素必须是article），此样式才会生效

### 紧邻同胞选择符：

```
标签1 + 标签2 { 声明 }
```

如：

```html
 <article>
        <h1>雷猴啊，<em>这个</em>世界</h1>
        <h1>如果云知道～</h1>
        <p>this sample are very boring</p>
        <p>boring world.</p>
        <em>I have a dream.</em>
    </article>
```



```css
h1 + p {
color: red;
}
```

这个选择符只能用于同级的元素。如上例子，表示：只有紧邻着h1标签的p标签，才会有此样式。也就`<p>this sample are very boring</p>`这个内容的字体颜色会变红



### 一般同胞选择符：

```
标签1 ~ 标签2 { 声明 }
```

这个选择符只能用于同级的元素。跟紧邻同胞选择符不同的是元素不必紧挨在一起，也能有这个样式



### 通用选择符

```
* { 声明 }
```

如：

```css
* {
    color: green;
}
```

会将所有元素都文本都变成绿色

如：

```css
p * {
    color: green;
}
```

表示：p标签下的所有元素的文本都会变成绿色

如：

```html
<article>
        <h1>雷猴啊，<em>这个</em>世界</h1>
        <h1>如果云知道～</h1>
        <p>this sample <em>are</em> very boring</p>
        <p>boring world.</p>
        <em>I have a dream.</em>
 </article>
```

```css
article * em {
    color: green;
}
```

表示：所有是article的**孙子元素**（不能是子元素）的em标签都会被赋予这个样式
