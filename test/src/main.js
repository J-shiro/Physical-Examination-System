import { createApp } from 'vue'
import App from './App.vue' //  引入根组件(注释需要一个tab)
import router from './router'
import store from './store' //引入仓库



import TypeNav from '@/pages/Home/TypeNav/MyIndex.vue';
//测试
//import {reqCategoryList} from '@/api';
//reqCategoryList()

// 在 main.js 中定义路由守卫
router.beforeEach((to, from, next) => {
    const isAuthenticated = localStorage.getItem('isAuthenticated')
    if (to.matched.some(record => record.meta.requiresAuth) && !isAuthenticated) {
        alert("请先登录")
        next('/login')
    } else {
      next()
    }
  })

createApp(App).use(store).use(router).component('TypeNav',TypeNav).mount('#app')
//注册store仓库：组件实例的身上会多一个属性$store属性