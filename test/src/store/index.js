import { createStore } from 'vuex';
import Vue from 'vue';
export default createStore({//对外暴露store类的一个实例
  state: {
    //仓库存储数据的地方
  },
  getters: {
    //理解为计算属性，用于简化仓库数据，让组件获取仓库的数据更加方便
  },
  mutations: {
    //修改state的唯一手段
  },
  actions: {
    //处理action，可以书写自己的业务逻辑，以及处理异步
  },
  modules: {
    
  }
})
