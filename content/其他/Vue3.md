# Vue3

参考：[vue官方文档](https://cn.vuejs.org/guide/introduction.html)

## 声明为响应式

声明为响应式才能实时的响应

```js
import {ref} from "vue";
const count = ref(0)
```

```vue
<button @click="()=>{count++}">Click Number is {{ count }}</button>
```

这么做之后，在script中要访问count的值，要在其后加上`.value`：

```js
console.log("count = "+count.value)
```



## 侦听器

### watch()

```js
// 侦听单个来源
function watch<T>(
  source: WatchSource<T>,
  callback: WatchCallback<T>,
  options?: WatchOptions
): StopHandle

// 侦听多个来源
function watch<T>(
  sources: WatchSource<T>[],
  callback: WatchCallback<T[]>,
  options?: WatchOptions
): StopHandle
```

watch默认是懒执行

- 第一个参数：
  - 可以是一个月返回值的函数
  - 一个ref
  - 一个响应式对象
  - 由以上组合成的数组
- 回调函数，（新值，旧值）
- 一个对象，有以下字段
  - `deep: true`  表示深层侦听，如果源是对象，会对其强制深度便利，以便在深层级变更时触发回调
  - `immediate: true` 创建侦听器时，立即执行一遍，且当源变化的时候会再次执行
  - `once: true` 源变化的时候触发一次，就结束了，此后不再触发
  - `flush: 'post'`  在侦听器回调中能访问被`Vue`更新之后的所属组件的 Dom，需要这么指明（不太明白啥意思
  - `flush: 'sync'` 会在 Vue 进行任何更新之前触发

### watchEffect()

立即运行一个函数，同时响应式地追踪其以来，并在依赖更改时重新执行

```js
watchEffect(async () => {
  const response = await fetch(
    `https://jsonplaceholder.typicode.com/todos/${todoId.value}`
  )
  data.value = await response.json()
})
```





## 自定义组件

子Vue

```html
<script setup>
// 定义props
const props = defineProps({
  blog: {
    type: Object,
    required: true // 是否是必要的
  }
})

// 定义emit
const emit = defineEmits(['confirm'])
function confirmReadMore() {
  emit('confirm', "you click blog title = " + props.blog.title)
}

// 操作slot
import { useSlots } from 'vue'

const slots = useSlots()

</script>

<template>
  <div class="blog-wrapper">
    <h3> {{ blog.title }}</h3>
    <div>作者：{{ blog.author }}</div>
    <p>{{ blog.content }}</p>

    <!--默认插槽-->
    <div v-if="$slots.default()" style="background: #f3f4f5">
      <slot></slot>  <!--默认name就是default-->
    </div>

    <!--具名插槽-->
    <div v-if="$slots.input" style="background: #333; color: #fff">
      <slot name="input"></slot>
    </div>

    <button @click="confirmReadMore()">查看更多</button>
    <hr>
  </div>
</template>
```



父Vue

```html
<script setup>
import {ref} from "vue";
import BlogItem from "@/components/BlogItem.vue";

const BlogData = ref([
  {
    id: 1,
    author: "John Doe 1",
    title: "title 1",
    content: "Lorem Ipsum 1",
  },
  {
    id: 2,
    author: "John Doe 2",
    title: "title 2",
    content: "Lorem Ipsum 2",
  }
])

function handleConfirm(data) {
  console.log(data)
  alert(data)
}

</script>

<template>
  <main>

    <div v-for="blog in BlogData" :key="blog.id">
      <blog-item :blog="blog" @confirm="handleConfirm">
        <template #default>
          crazy {{ blog.id }}
        </template>
        <template #input>
          special {{ blog.id }}
        </template>
      </blog-item>
    </div>

  </main>
</template>

```



## 组合式函数

将一些通用的方法封装在js文件里

```js
import {ref, onMounted, onUnmounted} from 'vue'
export function useMouse() {
    const x = ref(0)
    const y = ref(0)


    function update(event) {
        x.value = event.pageX
        y.value = event.pageY
    }


    onMounted(() => window.addEventListener('mousemove', update))
    onUnmounted(() => window.removeEventListener('mousemove', update))

    return {x, y}
}
```

然后可以在各个地方去复用

```html
<script setup>
import {useMouse} from "@/mouse.js";

const {x, y} = useMouse()

</script>

<template>Mouse position is at: {{ x }}, {{ y }}</template>
```



## 依赖注入（解决深层嵌套的子view的数据传输问题）



App.vue

```html
<script setup>
import {provide, ref} from "vue";
import Child from "@/components/Child.vue";

const inputMsg = ref("世界")
provide('msg', inputMsg)
</script>

<template>
  <input v-model="inputMsg"/>
  <Child/>
</template>
```



Child.vue

```html
<script setup>
import GrandChild from "@/components/GrandChild.vue";
</script>

<template>
  <GrandChild/>
</template>
```

GrandChild.vue

```html
<script setup>
import {inject} from "vue";

const msg = inject("msg", "World") // 可以设定默认值
</script>

<template>

  <div>
    Hello {{ msg }}
  </div>
</template>
```



就这样，主view就可以把数据和孙子view组件（深层嵌套的view组件）同步起来了



---

一些库的使用

## Piana

[官方文档](https://pinia.vuejs.org/zh/)

一个存储库

简单示例

```js
import { defineStore } from 'pinia'


export const useBlogsStore = defineStore('blogs', {
    state:()=>{
        return{
            monkey: "-----",
            blogs:[
                {
                    id: 1,
                    author: "John Doe 1 ~",
                    title: "title 1",
                    content: "Lorem Ipsum 1",
                },
                {
                    id: 2,
                    author: "John Doe 2 *",
                    title: "title 2",
                    content: "Lorem Ipsum 2",
                }
            ]
        }
    },
    actions:{
        setMonkeys(mMonkey){
            this.monkey = mMonkey
        }
    }
})
```

使用：

```js
import {useBlogsStore} from "@/stores/blogs.js";

const mUseBlogsStore = useBlogsStore()
const jump = ()=>{
  mUseBlogsStore.setMonkeys("12344567")
}
```



## Axios 的简单使用

```js
axios({
    url:'/api',
    method:'get'
  }).then(response=>{
    console.log(response)
  })
```

就这么简答

不过axios不允许跨域请求，按照下面这么做才能运行跨域请求：

在vue.config.js里：

```js
import {fileURLToPath, URL} from 'node:url'

import {defineConfig} from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [
        vue(),
    ],
    resolve: {
        alias: {
            '@': fileURLToPath(new URL('./src', import.meta.url))
        }
    },
    server: {
        proxy: {
            '/api': {
                target: 'https://www.runoob.com/try/ajax',  //你要跨域访问的网址
                changeOrigin: true,   // 允许跨域
                rewrite: (path) => path.replace(/^\/api/, '') // 重写路径把路径变成空字符
            }
        }
    }
})

```

主要代码是proxy那一段

这么做就可以跨域请求啦！