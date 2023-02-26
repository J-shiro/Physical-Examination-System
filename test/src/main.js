import { createApp } from 'vue'
import App from './App.vue' //  引入根组件(注释需要一个tab)
import router from './router'
import store from './store' //引入仓库



import TypeNav from '@/pages/Home/TypeNav/MyIndex.vue';
//测试
//import {reqCategoryList} from '@/api';
//reqCategoryList()

createApp(App).use(store).use(router).component('TypeNav',TypeNav).mount('#app')
//注册store仓库：组件实例的身上会多一个属性$store属性