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



#### 函数的参数带默认值：

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



####  剩余运算符`...key`：

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



#### 扩展运算符：将一个数组分割，并将各个项作为分离的参数传给函数

```js
const arr = [10,20,1,50]
console.log(Math.max(...arr))
```



#### 箭头函数： 使用 `=>` 来定义 `function() {}`  等于 `() => {}`

```js
let add = (a, b) => {
    return a + b
}

let add5 = a => (a + 5) // 一个参数的时候可以这么简写

let return5 = () => 5 // 无参数

console.log(add(5, 1)) // 6
console.log(add5(6)) // 11
console.log(return5()) // 5
```

返回对象要这么写：

```js
let getObj = id => ({id: id, author: 'myself'})

console.log(getObj(123)) // {id: 123, author: 'myself'} 
```

箭头函数注意点：

1. 没有this指向，this只能通过查找作用域链来确定
2. 没有arguments
3. 不能使用new关键字来实例化对象。（function函数也是一个对象，但是箭头函数不是一个对象，是一个语法糖）



```js
let Person = () => {
    return 5
}
let p = new Person()
console.log(p)  // TypeError: Person is not a constructor


let Student = function () {
    return 5
}
let s = new Student()
console.log(s) // Student{}
```



## 4. 解构赋值

对赋值预算符的一种扩展

#### 对对象解构

```js

let student = {
    name: '小明',
    age: '18'
}

let {name, age} = student

console.log(name) // 小明
console.log(age) // 18


let student2 = {
    parent: {
        father: '小明他爸',
        mother: '小明他妈'
    },
    name: '小明',
    age: '18'
}
// 还可以使用剩余运算符，和默认值
let {parent, money = 0, ...rest} = student2
console.log(parent) //{father: '小明他爸', mother: '小明他妈'}
console.log(money) // 0
console.log(rest) // {name: '小明', age: '18'}
```

#### 对数组解构

```js
let arr = [1, 2, 3]

let [a, b, c] = arr
console.log(a) // 1
console.log(b) // 2
console.log(c) // 31
```



## 5. 扩展的对象功能

```js
let student3 = {
    name, // 等价于 name: name
    age, // 等价于  age: age
    getName() {
        return this.name
    }
}

console.log(student3.getName()) // 清风
```

