const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,

  lintOnSave:false, //禁止lint检查错误

  // 代理跨域，开发服务器的配置项
  devServer: {
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:8000', //所有以/api开头的请求都会被代理到http://127.0.0.1:8000地址
        changeOrigin: true,
      }
    },
    port: 5173,
    host: "127.0.0.1"
  }
})
