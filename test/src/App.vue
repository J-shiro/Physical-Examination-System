<template>
  <!-- <nav>
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
  </nav>
  <router-view/> -->
  <div>
    <Header></Header>
    <!--路由组件出口的地方-->
    <router-view></router-view>
    <!--在Home、search显示的，在登录、注册隐藏<Footer v-show="$route.path=='/home'||$route.path=='/search'"></Footer>-->
    <Footer v-show="$route.meta.show"></Footer>
  </div>
</template>

<script>
//  引入
import Header from './components/Header/MyIndex.vue'
import Footer from './components/Footer/MyIndex.vue'
export default {
  name: 'App',
  components: { //  注册
    Header,
    Footer
  }
}
</script>

<style lang="less">
// #app {
//   font-family: Avenir, Helvetica, Arial, sans-serif;
//   -webkit-font-smoothing: antialiased;
//   -moz-osx-font-smoothing: grayscale;
//   text-align: center;
//   color: #2c3e50;
// }

// nav {
//   padding: 30px;

//   a {
//     font-weight: bold;
//     color: #2c3e50;

//     &.router-link-exact-active {
//       color: #42b983;
//     }
//   }
// }
</style>
