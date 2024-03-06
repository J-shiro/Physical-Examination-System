import axios from "axios";  // 对于axios进行二次封装
import nprogress from "nprogress";  // 引入进度条
import "nprogress/nprogress.css";  // 引入进度条样式


//利用axios对象的方法create创建一个axios实例
const requests = axios.create({
    
    baseURL:"/api",  // 基础路径，发请求的时候，会自动出现api
    timeout:5000   // 请求超时时间5s
});


//请求拦截器：发请求前，可以检测到，可以在请求发出前进行操作
requests.interceptors.request.use((config)=>{

    nprogress.start();//进度条开始动
    return config
});


//响应拦截器，服务器响应数据回来后，响应拦截器检测到后可以操作
requests.interceptors.response.use((res)=>{

    nprogress.done();//进度条结束
    return res.data;
},(error)=>{
    return Promise.reject(new Error('fail'));  // 服务器响应失败的回调函数
});

//对外暴露
export default requests;