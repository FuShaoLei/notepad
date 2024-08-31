## 基本的东西

TypeScript是JavaScript的一个超集

## 基础类型

| 关键字    | 说明         |
| --------- | ------------ |
| any       | 任意类型     |
| number    | 字符类型     |
| string    | 字符串类型   |
| boolean   | false/true   |
| void      | 没有返回值   |
| undefined | 未定义的值   |
| never     | 从未出现的值 |

数组：

```typescript
// 在元素类型后面加上[]
let arr: number[] = [1, 2];

// 或者使用数组泛型
let arr: Array<number> = [1, 2];
```



元组：

```typescript
let x:[string, number];
x = ["hello",333];
console.log(x[0]); //hello
```

枚举：

```typescript
enum Color {Red, Green, Blue};
let c: Color = Color.Blue;
console.log(c);    // 2
```

## 声明变量

```typescript
var name1 = "小明"; // 自动检测
var name2:string = "小红";
var name3:string; // undefined
var name4; // undefined
```

