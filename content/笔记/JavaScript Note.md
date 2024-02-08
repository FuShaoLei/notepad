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

## 数组

声明数组：

```javascript
// 法1
var a = new Array();
a[0] = "dog";
a[1] = "cat";
a[2] = "hen";

// 法2
var a = ["dog", "cat", "hen"];
```

数组的长度是比数组最大索引值多一的数。

数组循环：

- `for...of`：遍历元素
- `for...in`：便利数组索引

数组的一些方法：

| 方法名称                                             | 描述                                                         |
| :--------------------------------------------------- | :----------------------------------------------------------- |
| `a.toString()`                                       | 返回一个包含数组中所有元素的字符串，每个元素通过逗号分隔。   |
| `a.toLocaleString()`                                 | 根据宿主环境的区域设置，返回一个包含数组中所有元素的字符串，每个元素通过逗号分隔。 |
| `a.concat(item1[, item2[, ...[, itemN]]])`           | 返回一个数组，这个数组包含原先 `a` 和 `item1、item2、……、itemN` 中的所有元素。 |
| `a.join(sep)`                                        | 返回一个包含数组中所有元素的字符串，每个元素通过指定的 `sep` 分隔。 |
| `a.pop()`                                            | 删除并返回数组中的最后一个元素。                             |
| `a.push(item1, ..., itemN)`                          | 将 `item1、item2、……、itemN` 追加至数组 `a`。                |
| `a.reverse()`                                        | 数组逆序（会更改原数组 `a`）。                               |
| `a.shift()`                                          | 删除并返回数组中第一个元素。                                 |
| `a.slice(start, end)`                                | 返回子数组，以 `a[start]` 开头，以 `a[end]` 前一个元素结尾。 |
| `a.sort([cmpfn])`                                    | 依据可选的比较函数 `cmpfn` 进行排序，如果未指定比较函数，则按字符顺序比较（即使被比较元素是数字）。 |
| `a.splice(start, delcount[, item1[, ...[, itemN]]])` | 从 `start` 开始，删除 `delcount` 个元素，然后插入所有的 `item`。 |
| `a.unshift(item1[, item2[, ...[, itemN]]])`          | 将 `item` 插入数组头部，返回数组新长度（考虑 `undefined`）。 |

## 函数

数实际上是访问了函数体中一个名为 [`arguments`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Functions/arguments) 的内部对象，这个对象就如同一个类似于数组的对象一样，包括了所有被传入的参数。

```javascript
function add() {
  var sum = 0;
  for (var i = 0, j = arguments.length; i < j; i++) {
    sum += arguments[i];
  }
  return sum;
}

add(2, 3, 4, 5); // 你可以传入任意个参数
```

## 自定义对象

待补充