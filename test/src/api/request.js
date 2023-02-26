//对于axios进行二次封装
import axios from "axios";
//引入进度条
import nprogress from "nprogress";//start:进度条开始，done:进度条结束
//引入进度条样式
import "nprogress/nprogress.css";

//利用axios对象的方法create去创建一个axios实例
const requests = axios.create({
    //配置对象（request就是axios），可以稍微配置一下
    //基础路径，发请求的时候，会自动出现api
    baseURL:"/api",
    //代表请求超时时间5s
    timeout:5000
});

//请求拦截器：发请求前，可以检测到，可以在请求发出前进行操作
requests.interceptors.request.use((config)=>{
    //config:配置对象，对象里有一个属性很重要，header请求头

    //进度条开始动
    nprogress.start();
    return config
});
//响应拦截器
requests.interceptors.response.use((res)=>{
    //成功的回调函数：服务器响应数据回来后，响应拦截器检测到后可以操作
    //进度条结束
    nprogress.done();
    return res.data;
},(error)=>{
    //服务器响应失败的回调函数
    return Promise.reject(new Error('fail'));
});

//对外暴露
//export default axios;
export default requests;