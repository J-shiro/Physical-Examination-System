
<template>
<html>
 <head>
  <meta charset="utf-8">
  <title>信息登记表</title>
 </head>
 <body>
  <div class="bg">
   <form action="#" method="get" autocomplete="off">
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
     <input type="number" name="real_lage" value=""   max="100"   min="0" required/>
    </p>
    <br />
    <p><span>出生日期：</span>
     <!-- 在下面的横线中填写`type的日期类型` -->
     <input type="date" name="birthday"  value="2000-07-22" required/><!-- （必须填写） -->
    </p>
    <br />
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
     <input type="submit" value="提交" />
     <input type="reset" value="重置" />
    </p>
   </form>
  </div>
 </body>
</html>

</template>
  
<script>

</script>
  
<style scoped lang="less">
   input {
    width:360px;
    height:50px;                                 
    border:1px solid #d4cdba;
    padding:2px; 
    font-size: 17px;
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