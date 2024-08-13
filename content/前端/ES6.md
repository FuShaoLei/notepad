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

console.log(student3.getName()) 
```

对象可以直接通过中括号去赋值：

```js
const obj = {}
obj.isShow = true
obj["xx"] = "你好"
const name = 'rbj'
obj[name+"_aaa"] = "哦豁，无敌"
obj["eee"+name] = function (){
    return "123456789"
}

console.log(obj) // {isShow: true, xx: '你好', rbj_aaa: '哦豁，无敌', eeerbj: ƒ}


// 还可以这么写在一起
const name = 'rbj'
const obj = {
    isShow:true,
    xx:"你好",
    [name+"_aaa"]:"哦豁，无敌",
    ["eee"+name]:function (){
        return "123456789"
    }
}
```

对象的一些方法：

```js
// 对象的比较 Object.is(obj1, obj2) , 其实这个is()和普通的=== 差不多，不过对于两个NaN的比较，还是is()比较准确一些
console.log(NaN === NaN) // false
console.log(Object.is(NaN, NaN)) // true


// 对象的合并 Object.assign(traget,obj1,obj2,...) 这里应该是浅拷贝
const newObj = Object.assign({s:9},{a:1},{b:2},{c:3})
console.log(newObj) // {s: 9, a: 1, b: 2, c: 3}
```

## 6.Symbol

标示独一无二的值

> 最大的用途，用来定义对象的私有属性

```js
const s1 = Symbol("s1")
const s2 = Symbol("s1")

console.log(s1)
console.log(Object.is(s1,s2)) // false
```

在for循环里找不到key



## 7. Map和Set



set

```js
let setData = new Set()
setData.add(2)
setData.add(9.9)
setData.add("4")
setData.add("4")

console.log(setData) // {2, 9.9, '4'}

setData.delete(2)

console.log(setData) // {9.9, '4'}

console.log(setData.has("4")) // true

setData.forEach((key,val)=>{
    console.log(`${key}: ${val}`)
})

// log 如下
// 9.9: 9.9
// 4: 4

// 转换成数组
const arr = [...setData]
console.log(arr) // [9.9, '4']
```



## 8 数组的扩展功能



### `Array.from()`

```js

// 将伪数组转换成真正的数组
function add() {
    console.log(arguments); // 伪数组

    const arr = Array.from(arguments) // 转换成真正的数组
    console.log(arr); 
    
  	const arrChange = Array.from(arguments, ele => ele * 2) // 还可以这样，对每个元素都乘于2
    console.log(arrChange); 
  
    const arr2 = [...arguments] // 也可以通过扩展运算符这样去做转换
    console.log(arr2);
}

add(1,2,3)
```

### `Array.of()`

```js
// 将任意的东西，组合成数组
console.log(Array.of(1, 23, '3', {id: 1}));
```



### `find()`

```js
let arr = [1, 2, -2, -5, 10, 9]

let num = arr.find(ele => ele < 0) // 找出第一个符合条件的元素
console.log(num)
```

findIndex：找出第一个符合条件的元素的索引

### `entries()`

```js
let arr = [1, 2, -2, -5, 10, 9]


for(let index of arr.keys()) {
    console.log(index);
}

console.log("-------------");

for(let ele of arr.values()) {
    console.log(ele);
}

console.log("-------------");

for(let [index, ele] of arr.entries()) {
    console.log(index, ele);
}

console.log("-------------");

let letter = ['a', 'b', 'c']
let it = letter.entries()

console.log(it.next().value);
console.log(it.next().value);
console.log(it.next().value);
console.log(it.next().value);
```



### includes()`

```js

// 返回一个布尔值，表示是否含有当前值
console.log([1, 2, 3].includes(2));
console.log([1, 2, 3].includes(6));
```



## 9 迭代器



```js
let letter = ['a', 'b', 'c']

let ite = letter[Symbol.iterator]()

console.log(ite.next());
console.log(ite.next());
console.log(ite.next());
console.log(ite.next());
```



- 迭代器上一个借口
- 迭代器上用于遍历数据结构的指针



## 10 生成器



明天看...
