## 引入第三方库

首先在miniprogram目录里边进行

```
npm init -y
```

或者？

```
npm install
```

然后引入你想引入的包：

```
npm i tdesign-miniprogram -S --production
```

然后在微信开发者ide里边点击`工具`->`构建npm`

## 底部导航栏

待补充

## 列表渲染

- `wx:for`：在组件上使用 `wx:for` 控制属性绑定一个数组，即可使用数组中各项的数据重复渲染该组件。默认数组的当前项的下标变量名默认为 `index`，数组当前项的变量名默认为 `item`
  - 可以使用`wx:for-item` 指定数组**当前元素**的变量名
  - 可以使用`wx:for-index` 可以指定数组**当前下标**的变量名
  - 当 `wx:for` 的值为字符串时，会将字符串解析成字符串数组
- `block wx:for`：渲染一个包含多节点的结构块
- `wx:key`：来列表中项目的唯一标识符（很蠢的设计