<template>
  <div class="register-container">
    <!-- 注册内容 -->
    <div class="register">
      <h3>注册
        <span class="go">已有账号，去 <router-link class="login" to="/login">登录</router-link>
        </span>
      </h3>
      <div class="content">
        <label>姓名:</label>
        <input type="text" placeholder="请输入你的姓名" v-model="this.formData.name">
        <!-- <span class="error-msg">错误提示信息</span> -->
      </div>
      <div class="content">
        <label>登录密码:</label>
        <input type="password" placeholder="请输入你的登录密码" v-model="this.formData.password">
        <!-- <span class="error-msg">错误提示信息</span> -->
      </div>
      <div class="content">
        <label>确认密码:</label>
        <input type="password" placeholder="请输入确认密码" v-model="this.formData.password1">
        <!-- <span class="error-msg">错误提示信息</span> -->
      </div>
      <div class="controls">
        <input name="m1" type="checkbox" v-model="agree" :checked="agree">
        <span>同意协议并注册《就医协议》</span>
        <!-- <span class="error-msg">错误提示信息</span> -->
      </div>
      <div class="btn">
        <!-- <p class="error" v-if="!passwordMatch && isSubmitted">{{ errorMsg }}</p> -->
        <button @click.prevent="userRegister" :disabled="!agree">完成注册</button>
        <!--disabled将一个表单元素设置为禁用状态,!isValid如果为true,则按钮被禁止;
        click按下，会调用 userRegister 方法，并且阻止按钮默认的提交行为-->
      </div>
    </div>

    <!-- 底部 -->
    <div class="copyright">
      <ul>
        <li>就医指南</li>
        <li>预约流程</li>
        <li>支付方式</li>
        <li>医疗服务</li>
        <li>医生名单</li>
        <li>帮助中心</li>
      </ul>
      <div class="address">地址: 上海大学网络空间安全数据库小组</div>
      <div class="beian">京ICP备XXXXXX号
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
  export default {
    name: 'Register',
    data() {
      return {
        formData: {
          //收集名字
          'name':'',
          'password':'',
          'password1':'',
        },
        agree: true,
        isSubmitted: false,
        //passwordMatch: true
      }
    },
    computed: {
      isPasswordMatch() {
        return this.formData.password === this.formData.password1
      }
    },
    // watch: {
    //   password(val) {
    //     if (this.password1) {
    //       this.passwordMatch = val === this.password1
    //     }
    //   },
    //   password1(val) {
    //     if (this.password) {
    //       this.passwordMatch = val === this.password
    //     }
    //   }
    // },
    methods: {
      userRegister() {
        this.isSubmitted = true
        if (!this.isPasswordMatch) {
          alert('两次输入的密码不一致')
        }else{
          axios.post('http://127.0.0.1:8000/api/register', this.formData)
          .then(response => {
            console.log(response.data);
            alert('注册成功')
            this.$router.push('/login');
          })
          .catch(error => {
            console.log(error);
          });
        }
      },
    }
  }
</script>

<style lang="less" scoped>
  .register-container {
    .register {
      width: 1200px;
      height: 550px;
      border: 1px solid rgb(223, 223, 223);
      margin: 0 auto;
      background-color:#ececec;
      h3 {
        background: #e4e4e4;
        margin: 0;
        padding: 6px 15px;
        color: #333;
        border-bottom: 1px solid #dfdfdf;
        font-size: 20.04px;
        line-height: 30.06px;

        span {
          font-size: 14px;
          float: right;

          a {
            color: #e1251b;
          }
        }
      }

      div:nth-of-type(1) {
        margin-top: 100px;
      }

      .content {
        padding-left: 390px;
        margin-bottom: 18px;
        position: relative;

        label {
          font-size: 14px;
          width: 96px;
          text-align: right;
          display: inline-block;
        }

        input {
          width: 270px;
          height: 38px;
          padding-left: 8px;
          box-sizing: border-box;
          margin-left: 5px;
          outline: none;
          border: 1px solid #999;
        }

        img {
          vertical-align: sub;
        }

        .error-msg {
          position: absolute;
          top: 100%;
          left: 495px;
          color: red;
        }
      }

      .controls {
        text-align: center;
        position: relative;

        input {
          vertical-align: middle;
        }

        .error-msg {
          position: absolute;
          top: 100%;
          left: 495px;
          color: red;
        }
      }

      .btn {
        text-align: center;
        line-height: 36px;
        margin: 17px 0 0 55px;

        button {
          outline: none;
          width: 270px;
          height: 36px;
          background: #48576a;
          color: #fff !important;
          display: inline-block;
          font-size: 16px;
        }
      }
    }

    .copyright {
      width: 1200px;
      margin: 0 auto;
      text-align: center;
      line-height: 24px;

      ul {
        li {
          display: inline-block;
          border-right: 1px solid #e4e4e4;
          padding: 0 20px;
          margin: 15px 0;
        }
      }
    }
  }
</style>