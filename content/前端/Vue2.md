文档参考：https://v2.cn.vuejs.org/v2/guide/

DOM：文档对象。javascript可以通过`document.querySelectorAll("p")`这样的语句去访问

## 生命周期钩子函数

| 函数            | 说明 |
| --------------- | ---- |
| `beforeCreated` |      |
| `created`       |      |
| `beforeMount`   |      |
| `mounted`       |      |
| `beforeUpdate`  |      |
| `update`        |      |
| `beforeDestroy` |      |
| `destroy`       |      |

## 常用实例方法

全部方法参考：https://v2.cn.vuejs.org/v2/api/#%E5%AE%9E%E4%BE%8B%E6%96%B9%E6%B3%95-%E4%BA%8B%E4%BB%B6

| 方法                             | 说明                                                         |
| -------------------------------- | ------------------------------------------------------------ |
| `vm.$emit( eventName, […args] )` | 触发当前实例上的事件。附加参数都会传给监听器回调。           |
| `vm.$forceUpdate()`              | 迫使 Vue 实例重新渲染。注意它仅仅影响实例本身和插入插槽内容的子组件，而不是所有子组件。 |
| `vm.$nextTick( [callback] )`     | 将回调延迟到下次 DOM 更新循环之后执行。                      |

## 其他知识点



#### Event：preventDefault() 方法

[`Event`](https://developer.mozilla.org/zh-CN/docs/Web/API/Event) 接口的 **`preventDefault()`** 方法，告诉用户代理：如果此事件没有被显式处理，它默认的动作也不应该照常执行。比如：你有一个链接，点击该链接时，不希望它导航到其他页面，而是执行某些 JavaScript 代码。

在vue中可以这样使用：例如，`.prevent` 修饰符告诉 `v-on` 指令对于触发的事件调用 `event.preventDefault()`：

```
<form v-on:submit.prevent="onSubmit">...</form>
```



#### v-html

插入原始的HTML：

```
<span v-html="rawHtml"></span>
```

#### v-on

v-on可以添加一个事件的监听器：

```
<button v-on:click="reverseMessage">反转消息</button>
```

可以缩写为：

```vue
<button @click="reverseMessage">反转消息</button>

动态参数
<button @[event]="reverseMessage">反转消息</button>
```

#### v-bind

```vue
<!-- 完整语法 -->
<a v-bind:href="url">...</a>

<!-- 缩写 -->
<a :href="url">...</a>

<!-- 动态参数的缩写 (2.6.0+) -->
<a :[key]="url"> ... </a>
```

##  计算属性

例子：

```vue
<p>原始：{{ testTitle }}</p>
<p>反转后的：{{ reverseTitle }}</p>
```

```js
data() {
    return {
        testTitle: 'Hello'
    }
},
computed:{
        reverseTitle:function (){
            return this.testTitle.split('').reverse().join('')
        }
},
```

这里我们声明了一个计算属性 `reversedMessage`。我们提供的函数将用作 property `vm.reversedMessage` 的 getter 函数：

与方法相比：计算属性是基于它们的响应式以来进行缓存的，只在相关响应式以来发生改变的时候才会重新求值。

计算属性也可以拥有setter：

```javascript
computed:{
    reverseTitle:{
      get:function (){
        console.log("reverseTitle")
        return this.testTitle.split('').reverse().join('')
      },
      set:function (newTitle){
        this.testTitle = newTitle
      }
    }
  },
  methods:{
    changeSomething() {
      this.reverseTitle = "World"
    }
  }
```

## 侦听器

当需要在数据变化时执行**异步**或开销较大的操作时，可以考虑使用侦听器。

例子：

```js
 watch:{
    testTitle:function (newVal,oldVal) {
      console.log("newVal = "+newVal)
      console.log("oldVal = "+oldVal)

      this.watchTitle = 'Hello I Watch !'

    }
  },
```

## v-for

打印对象：

```js
 students:{
        name:'张三',
        sex:'男',
        score: 100
      }
```



```html
<ul id="v-for-object" class="demo">
      <li v-for="(value,name) in students" :key="value">
        {{name}}: {{ value }}
      </li>
</ul>
```



## `v-if` 和 `v-show` 的区别

- `v-if`是当判断为true的时候会渲染
- `v-show`无论有没有判断为true都会渲染



## 回车按键方法

对于原生的组件

```html
<input @keyup.enter="submit" />
```

对于element-ui

```html
<el-input @keyup.native.enter="submit" v-model="inputTxt"/>
```



## vue 自定义组件

父给子传参数，子给父传参数，例子：

父vue：

```vue
<template>
  <div id="app">

    <div :style="{ fontSize: postFontSize + 'em' }">
      <ButtonCounter title-name="You Are The Best." @increase="mainIncrease"/>
    </div>

  </div>
</template>

<script>

import router from "@/router";
import ButtonCounter from "@/components/ButtonCounter.vue";

export default {
  name: 'App',
  components: {
    ButtonCounter
  },
  data() {
    return {
      postFontSize: 1
    }
  },
  methods: {
   	mainIncrease(...data) {
      console.log(data)
      console.log("Hello I'm mainIncrease")
      this.postFontSize = data[0]
    }
  }
}
</script>

```

子Vue：

```vue
<template>
  <div>

    {{ titleName}} 请输入字号大小：
    <el-input-number v-model="mFontSize" :min="1"></el-input-number>
    <div>
      <button @click="$emit('increase', mFontSize, data)">改变字号</button>
    </div>
  </div>
</template>
<script>
export default {
  name: "ButtonCounter",
  props:{
    titleName: String,
  },
  data() {
    return {
      count: 0,
      mFontSize:1,
      data:{
        name:"xiaoming",
        age: 15
      }
    }
  },
}
</script>
```



父向子传参数，使用到 子Vue里的props

子向父传参数，用到了 $emit('increase', mFontSize) ，然后在父Vue里往@increase设置一个方法，然后在方法中拿到参数去做改变字号的动作