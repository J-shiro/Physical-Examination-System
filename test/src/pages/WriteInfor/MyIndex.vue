
<template>
<html>
 <head>
  <meta charset="utf-8">
  <title>信息登记表</title>
 </head>
 <body>
  <div class="bg">
   <form method="post" autocomplete="off">
    <div align="center" class="title"><h2>信息登记表</h2></div>
    <div class="wenben">
      <form class="inner" @submit.prevent="submitForm"><br />
        <p align="center" class="font">真实姓名: <input type="text" v-model="formData.name" required></p>
        <p align="center" class="font">你的年龄: <input type="number" v-model="formData.age" min="0" max="120" required></p>
        <p align="center" class="font">你的性别: &emsp;  &emsp;  &emsp;  
          <label>
          <input type="radio" value="男" v-model="formData.sex">
          男
        </label>
        &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  
        <label>
          <input type="radio" value="女" v-model="formData.sex">
          女
        </label>
        </p>
        <p align="center" class="font">是否已婚: &emsp;  &emsp;  &ensp;  
          <label>
          <input type="radio" value="已婚" v-model="formData.marriage">
          已婚
        </label>
        &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  
        <label>
          <input type="radio" value="未婚" v-model="formData.marriage">
          未婚
        </label>
        </p>
        <p align="center" class="font">身份证号: <input type="text" v-model="formData.id" @blur="validateIdNumber" required></p>
        <p align="center" class="font">手机号码: <input type="text" v-model="formData.phone" @blur="validatePhNumber" required></p>
        <p align="center"><button type="submit" class="but">提交预约信息</button></p>
      </form>
    </div>
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
          },
          idvalid: true,
          phonevalid: true,
        }
      },
      methods :{
         submitForm() {
          if(this.formData.sex==''){
            alert("请选择性别！")
          }
          else if(this.formData.marriage==''){
            alert("请选择是否已婚！")
          }
          else if(!this.idvalid){
            alert("请输入正确的身份证号码")
          }
          else if(!this.phonevalid){
            alert("请输入正确的电话号码")
          }
          else{
            axios.post('http://127.0.0.1:8000/api/addp', this.formData)
            .then((response) => {
              if(response.data.msg=='success'){
                console.log(response.data);
                this.$router.push('/choose');
                alert("预约成功！")
              }
              else if(response.data.error_num==1){
                alert("不存在这样一个人，请填写你的真实姓名")
              }
            })
            .catch(error => {
              console.log(error);
            });
          }
        },

        validatePhoneNumber(phoneNumber){
          if(phoneNumber.length !== 11){
            return false;
          }
          const phoneRegExp = /^1[3456789]\d{9}$/;
          if (!phoneRegExp.test(phoneNumber)) {
            return false;
          }
          else return true;
        },

        validateIDNumber(idNumber) {
          if (idNumber.length !== 18) {//长度是否为18位
            return false;
          }
          if (!/^\d{17}[\dX]$/.test(idNumber)) {//前17位是否都是数字
            //^表示字符串的开头 \d表示一个数字字符 {17}表示前面的\d重复出现17次
            //[\dX]表示一个数字字符或字母X $表示结尾
            return false;
          }
          //计算校验位是否正确
          const weights = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];//前17位依次乘以固定的权值
          //将乘积的结果相加，并对11取模得到一个余数。余数与一个固定的映射表
          const factors = idNumber.slice(0, 17).split('').map(Number);
          const checkSum = factors.reduce((sum, factor, index) => sum + factor * weights[index], 0) % 11;
          //对一个数组进行累加计算。
          //参数1：回调函数，上一次累加的结果sum，当前遍历到的元素factor，以及当前元素的索引index，累加
          //参数2：初始值，此处为0
          const checkDigit = { 0: 1, 1: 0, 2: 'X', 3: 9, 4: 8, 5: 7, 6: 6, 7: 5, 8: 4, 9: 3, 10: 2 }[checkSum];
          return idNumber[17] === checkDigit.toString();
          //将映射表中对应的字符与身份证号的最后一位进行比较。如果相同，那么该身份证号就是合法的
        },

        validateIdNumber() {
          this.idvalid = this.validateIDNumber(this.formData.id);
        },

        validatePhNumber() {
          this.phonevalid = this.validatePhoneNumber(this.formData.phone);
        },

      }
}
</script>
  
<style scoped lang="less">
   div.wenben {
    width: 600px;
    margin: auto;
    height: 576px;
    background-color: #b5bfc2c7;
   }
   form {
    height: 750px;
    border-style:solid;
    border-width:4px;
    border-color: aliceblue;
    background-color: #48576a;
    .inner{
      background-color: #e3eaf1;
      height: 570px;
    }
   }
   input {
    width:320px;
    height:35px;                                 
    border:1px solid #d4cdba;
    padding:2px; 
    font-size: 17px;
   }
   input[type="radio"] {
      width:30px;
      height:25px; 
   }
   input:hover{
				color: aliceblue;
				background-color: #48576a;
			}
   h2 {
      font-size: 50px;
      color: #e3eaf1; 
      display : inline;
      
      padding-bottom: 20px;
   }
   p {
      height: 80px;
   }
   .font {
      font-weight: 900;
      font-size: large;
   }
   .title{
    background-color: #48576a;
   }

   .but {
    background-color: #48576a; 
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    font-size: 25px;
    border-radius: 10%;
    cursor: pointer;//悬浮时变手指
}

</style>