import { createApp } from 'vue'
import App from './App.vue' //  引入根组件(注释需要一个tab)
import router from './router'
import store from './store' //引入仓库
import TypeNav from '@/pages/Home/TypeNav/MyIndex.vue';

//入口文件

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
//创建Vue应用实例, 并将根组件传递给它, 注册Vuex和Vue Router到Vue应用, Vue应用挂载到具有 id 为 'app' 的 HTML 元素