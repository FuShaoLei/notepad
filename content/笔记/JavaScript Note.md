## 类型

- [`Number`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Number)（数字）

- [`String`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)（字符串）

- [`Boolean`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Boolean)（布尔）

- [`Symbol`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Symbol)（符号）（ES2015 新增）

- `Object`

  （对象）

  - [`Function`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function)（函数）
  - [`Array`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array)（数组）
  - [`Date`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Date)（日期）
  - [`RegExp`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/RegExp)（正则表达式）

- [`null`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/null)（空）

- [`undefined`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/undefined)（未定义）

### 数字

可以使用`isNaN()`去判断一个变量是否为NaN，NaN与任何数字进行数学运算，结果都会是NaN

```javascript
var a = 55;
isNaN(a); // false
```

两个特殊值

- `Infinity`正无穷
- `-Infinity` 负无穷

可以用`isFinite()`来判断一个变量是否是一个有穷数

### 字符串

```javascript
"hello".length; // 5
"hello".charAt(0); // "h"
"hello, world".replace("world", "mars"); // "hello, mars"
"hello".toUpperCase(); // "HELLO"
```

## 布尔值

1. `false`、`0`、空字符串（`""`）、`NaN`、`null` 和 `undefined` 被转换为 `false`
2. 所有其他值被转换为 `true`

也可以使用 `Boolean()` 函数进行显式转换：

```javascript
Boolean(""); // false
Boolean(234); // true
```

## 变量

声明变量的关键字：

- `let`：声明一个块级作用域的变了
- `const`：声明一个不可变的变量，在定义域内总是可见的（待验证）
- `var`：在整个函数都是可见的（无论是在声明语句前还是声明语句后），而且是可变的

## 相等预算符

- `==`：自动转换类型的比较，比如`123 == "123"`是`true`
- `===`：不自动转换类型的比较，比如`123 == "123"`是`false`



## 两个重要循环

待研究

- `for...of`
- `for...in`



## 对象

```javascript
function Person(name, age) {
  this.name = name;
  this.age = age;
}

// 定义一个对象
var You = new Person("You", 24);
// 我们创建了一个新的 Person，名称是 "You"
// ("You" 是第一个参数，24 是第二个参数..)
// 进行访问的方法：
// 1.点表示法 (dot notation)
obj.name = "Simon";
var name = obj.name;
// 2.括号表示法 (bracket notation)
obj["name"] = "Simon";
var name = obj["name"];
// can use a variable to define a key
var user = prompt("what is your key?");
obj[user] = prompt("what is its value?");

```

