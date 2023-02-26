const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  // devServer: {
  //   port: 5173,
  // },
  lintOnSave:false,
  // 代理跨域
  devServer: {
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:8000',
        changeOrigin: true,
        //pathRewrite: {'^/api':''},
      }
    },
    port: 5173,
    host: "127.0.0.1"
  }
})
