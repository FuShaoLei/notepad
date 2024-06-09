## ES6

有关链接：

- [课程链接](https://www.bilibili.com/video/BV1ay4y1r78B/)
- [MDN JavaScript教程](https://developer.mozilla.org/zh-CN/docs/web/JavaScript)

## 1. let 和 const

var会造成变量提升：

```js
console.log(a) // undefined
var a = 2
```

它不会报错，原理是在实际编译的时候会是按以下进行的：

```js
var a
console.log(a) // undefined
a = 2
```



let也是声明变量，但是没有变量提升

```js
console.log(a) // 报错
let a = 2
```



let：

1. 没有变量提升
2. 是一个块作用域
3. 在一个块中不能重复声明

const

1. 也没有变量提升
2. 是一个块作用域
3. 在同一个块中不能重复声明
4. 一般用于生成常量，一旦被声明，无法修改这个常量，如果是一个对象的话，可以修改对象里的属性

在默认情况下使用const，而在变量值需要被修改的情况使用let 

## 2. 模板字符串 

 ```js
let name = "小明"
let html = `<ul><li>${name}</li></ul>`
 ```



## 3. 强大的函数



函数的参数带默认值：

```js
function add(a = 10, b = 20) {
  return a + b
}
```

甚至可以是一个函数：

```js
function add(a = 10, b = getVal(5)) {
    return a + b
}

function getVal(val) {
    return val + 5
}
```



剩余参数：

```js
// ES5 写法
function pick(obj) {
    let result = Object.create(null)
    console.log(arguments)
    for (let i = 1; i < arguments.length; i++) {
        result[arguments[i]] = obj[arguments[i]]
    }
    return result
}
```



```js
// ES6 写法
function pick(obj, ...keys) {
    let result = Object.create(null)
    for (let i = 0; i < keys.length; i++) {
        result[keys[i]] = obj[keys[i]]
    }
    return result
}

let book = {title: 'life', author: 'myself', begin: 'born'}
let bookData = pick(book, 'author', 'begin')
console.log(bookData)
```

