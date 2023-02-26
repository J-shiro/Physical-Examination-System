
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
    <h2 align="center">信息登记表</h2>    <br />    <br />
    <form @submit.prevent="submitForm">
    <p align="center" class="font">真实姓名: <input type="text" v-model="formData.name"></p><br />
    <p align="center" class="font">你的年龄: <input type="text" v-model="formData.age"></p><br />
    <p align="center" class="font">你的性别: &emsp;  &emsp;  &emsp;  
      <label>
      <input type="radio" value="男" v-model="formData.sex">
      男
    </label>
    &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  
    <label>
      <input type="radio" value="女" v-model="formData.sex">
      女
    </label>
    </p><br />
    <p align="center" class="font">是否已婚: &emsp;  &emsp;  &ensp;  
      <label>
      <input type="radio" value="已婚" v-model="formData.marriage">
      已婚
    </label>
    &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  
    <label>
      <input type="radio" value="未婚" v-model="formData.marriage">
      未婚
    </label>
    </p><br />
    <p align="center" class="font">身份证号: <input type="text" v-model="formData.id"></p><br />
    <p align="center" class="font">手机号码: <input type="text" v-model="formData.phone"></p>
    <p align="center" class="but"><button type="submit">提交预约信息</button></p>
  </form>
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
        sex: '',
        marriage: '',
        id: '',
        phone: ''
      }
    }
  },
      methods :{
         submitForm() {
      axios.post('http://127.0.0.1:8000/api/addp', this.formData)
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
   p {
      height: 80px;
   }
   .font {
      font-weight: 900;
      font-size: large;
   }
   .but {
      font-size: 30px;
   }
</style>