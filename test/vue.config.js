const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave:false,
  //代理跨域
  // devServer: {
  //   proxy: {
  //     '/api': {
  //       target: 'http://xxx.xxx.xxx:xxx',
  //       //pathRewrite: {'^/api':''},
  //     }
  //   }
  // }
})
