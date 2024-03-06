<template>
  <div>
    <Header></Header>
    <!--路由组件出口的地方-->
    <router-view></router-view>
    <Footer v-show="$route.meta.show"></Footer>  <!-- 根据路由元信息动态显示或隐藏 -->
  </div>
</template>

<script>
import Header from './components/Header/MyIndex.vue'
import Footer from './components/Footer/MyIndex.vue'
export default {
  name: 'App',  //  组件名称
  components: { //  注册引入组件
    Header,
    Footer
  }
}
</script>

<style lang="less">
</style>
