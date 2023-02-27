//配置路由的地方
import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

import Vue from 'vue';
import VueRouter from 'vue-router'
import Home from '@/pages/Home/MyIndex.vue'
import Search from '@/pages/Search/MyIndex.vue'
import Login from '@/pages/Login/MyIndex.vue'
import Register from '@/pages/Register/MyIndex.vue'
import WriteInfor from '@/pages/WriteInfor/MyIndex.vue'
import ShowResult from '@/pages/ShowResult/MyIndex.vue'
//import { search } from 'core-js/fn/symbol';

const routes = [
  {
    path: '/home',
    name: 'home',
    component: Home,
    meta:{show:true} //路由元信息
  },
  {
    path: '/writeinfor',
    name: 'writeinfor',
    component: WriteInfor,
    meta:{show:true} //路由元信息
  },
  {
    path: '/showresult',
    name: 'showresult',
    component: ShowResult,
    meta:{show:true} //路由元信息
  },
  // {
  //   path: '/about',
  //   name: 'about',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  // }
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta:{show:false}
  },
  {
    path: '/register',
    name: 'register',
    component: Register,
    meta:{show:false}
  },
  {
    path: '/search/:keyword',
    name: 'search',
    component: Search,
    meta:{show:true}
  },
  //重定向：项目跑起来的时候，访问/的时候立马重定向到首页
  {
    path: '/',
    redirect: '/home',
    component: Home
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
