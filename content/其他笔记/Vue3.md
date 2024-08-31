# Vue3

参考：

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