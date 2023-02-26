
<template>
<html>
 <head>
  <meta charset="utf-8">
  <title>信息登记表</title>
 </head>
 <body>
  <div class="bg">
   <form method="post" autocomplete="off">
    <br />
    <h2>信息登记表</h2>
    <!--<p><span>用户登录：</span>
      在下面的横线中填写`禁用属性`和`只读属性` 
     <input type="text" name="user_name" value="myemail@163.com" disabled readonly/>
    </p>-->
    <br /><br /><br />
    <p><span>真实姓名：</span>
    <!-- 在下面的横线中填写`必填属性`和`自动聚焦` -->
     <input type="text" name="real_name" placeholder="请务必填写真实姓名" required autofocus/>
    </p>
    <br />
    <p><span>真实年龄：</span>
     <!-- 在下面的横线中填写`最大值属性`和`最小值属性` -->
     <input type="number" name="real_age" value=""   max="120"   min="0" required/>
    </p>
    <br />
    <!-- <p><span>出生日期：</span>
      在下面的横线中填写`type的日期类型`
     <input type="date" name="birthday"  value="2000-07-22" required/>（必须填写）
    </p>
    <br /> -->
    <p><span>是否已婚：</span>
   <input type="radio" name="marry" value="married"> 已婚&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
   <input type="radio" name="marry" value="nomarried"> 未婚<br>
    <br />
    </p>
    <p><span>身份证号：</span>
     <input type="text" name="idnumber" value=""  required/>
    </p>
    <br />
    <p><span>手机号码：</span>
      <input type="text" name="phonenumb" value=""  required/>
    </p>
    <br />

    <form @submit.prevent="submitForm">
    <input type="text" v-model="formData.name">
    <input type="text" v-model="formData.age">
    <input type="text" v-model="formData.married">
    <input type="text" v-model="formData.id">
    <input type="text" v-model="formData.phone">
    <button type="submit">Submit</button>
  </form>

    <!-- <form action="">
   输入：<input type="text" name="idcard" id="idcard" placeholder="请输入邮箱">
   <input type="button" value="验证" @click="check();">
   </form> -->
    <!-- <p><span>个人主页：</span>
     在下面的横线中填写input标签的`引用数据列表属性`
     <input type="url" name="myurl"  list="urllist" placeholder="http://www.sdlfc.com"/>
     <datalist id="urllist">
      <option>http://www.baidu.cn</option>
      <option>http://www.sina.com</option>
      <option>http://www.w3school.com.cn</option>
     </datalist>
    </p> -->
    <br /><br />
    <p class="btn">
     <input type="submit" value="提交"  />
     <input type="reset" value="重置" />
    </p>
   </form>
  </div>
 </body>
</html>

</template>
  
<script>
import axios from "axios";
   export default {
      data() {
    return {
      formData: {
        name: '',
        age: '',
        married: '',
        id: '',
        phone: ''
      }
    }
  },
      methods :{
         submitForm() {
      axios.post('/api/addp', this.formData)
        .then(response => {
          console.log(response.data);
        })
        .catch(error => {
          console.log(error);
        });
    }

         // check(){
         //    //检查身份证
         //    var id = document.getElementById('idnumber');
         //    if(!id){
         //          alert("请输入有效合法的身份证号码！");
         //          return false;
         //    }
         //    if(id.length<18){
         //       alert("请输入有效合法的身份证号码！");
         //       return false;
         //    }
         //    let len = 17;
         //    let sum = 0;
         //    let yzArray = [7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2];
         //    let codeArray = ['1','0','X','9','8','7','6','5','4','3','2'];
         //    for(let i=0;i<len;i++){
         //       sum+=id[i]*yzArray[i];
         //    }
         //    let mod = sum%11;
         //    if( codeArray[mod]==id[17] ){
         //       alert("有效合法的身份证号码！");
         //       return true;
         //    }
         //    else return false;
         //    //检查姓名

         //    //检查手机号
         // },
         // submit: function(event) {
         //    event.preventDefault();//validate fail
         //    return true;//validate success return true or false
         // }
      //    postinfor(){
      //       this.list=[{value:''}, {value:''}];//按需修改
      //       axios.post('http://127.0.0.1:8000/api/getnewoption/', this.list).then(res=>{
      //          console.log(res);
      //          this.options=res.data;
      //       }).catch((mes)=>{
      //          this.$message.warning("请求失败")
      //       });},
      }
}
</script>
  
<style scoped lang="less">
   input {
    width:360px;
    height:50px;                                 
    border:1px solid #d4cdba;
    padding:2px; 
    font-size: 17px;
   }
   input[type="radio"] {
      width:30px;
      height:30px; 
   }
   h2 {
      font-size: 50px;
      color: #000000; 
      display : inline;
      margin-left: 38%;
      text-align: center;
      padding-bottom: 20px;
   }
   span {
      margin-left: 29%;
      font-size: 20px
   }
   p {
      height: 80px,
   }
   .btn {
      input {
         margin-left: 27%;
      }
   }
   .btn input{
    width:100px; 
    height:30px;
    border-radius:3px;
   }
</style>