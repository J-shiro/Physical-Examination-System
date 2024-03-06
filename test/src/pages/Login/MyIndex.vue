<template>
  <div class="login-container">
    <!-- 登录 -->
    <div class="login-wrap">
      <div class="login">
        <div class="loginform">
          <ul class="tab clearFix">
            <li>
              <a href="##" style="border-right: 0;">扫描登录</a>
            </li>
            <li>
              <a href="##" class="current">账户登录</a>
            </li>
          </ul>

          <div class="content">
            <form action="##">
              <div class="input-text clearFix">
                <span></span>
                <input type="text" placeholder="姓名" v-model="formData.name">
              </div>
              <div class="input-text clearFix">
                <span class="pwd"></span>
                <input type="password" placeholder="请输入密码" v-model="formData.password">
              </div>
              <div class="setting clearFix">
                <label class="checkbox inline">
                  <input name="m1" type="checkbox" value="2" checked="">自动登录
                  
                </label>
                <span class="forget">忘记密码？</span>
              </div>
              <button class="btn" @click.prevent="userLogin">登&nbsp;&nbsp;录</button>
            </form>

            <div class="call clearFix">
              <router-link class="register" to="/register"><a class="xiaozi">立即注册</a></router-link>
            </div>
          </div>
        </div>
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
    name: 'Login',
    data() {
      return {
        formData: {
          'name' : '',
          'password' : '',
        }
      }
    },
    // 定义请求配置
    config : {
      headers: {
        'Content-Type': 'application/json'
      }
    },
    methods: {
      userLogin() {
        // 发送POST请求到后端API
        axios.post('/api/login', this.formData)
          .then((response) => {
            if (response.data.msg=='success') {
              // 登录成功，进行后续操作
              localStorage.setItem('isAuthenticated', true)
              localStorage.setItem('username', response.data.username);//res.data.username可能需要修改
              // 登录成功，跳转到首页
              this.$router.push('/home').then(() => location.reload());
            } else {
              // 登录失败，提示用户
              alert("你没有注册过该名字或密码错误")
            }
          })
          .catch((error) => {
            // 处理请求错误
            console.error(error)
          })
      }
    }
  }
</script>

<style lang = "less" scoped>
  a {
    .xiaozi {
      color: #fff
    }
  }
  .checkbox.inline {
    color: #fff
  }
  .forget {
    color : #fff
  }
  .login-container {
    .login-wrap {
      height: 580px;
      background-color: #48576a;

      .login {
        position: relative;
        width: 1200px;
        height: 500px;
        margin: 0 auto;
        //background-color: #28c4ef52;
      }

      .loginform {
        width: 680px;
        height: 406px;
        box-sizing: border-box;
        background: #48576a;
        float: center;
        top: 10%;
        position:absolute;
        padding: 20px;
        bottom: 0;
        left: 0;
        right: 0;
        margin: auto;

        .tab {

          li {
            width: 50%;
            float: left;
            text-align: center;
            background-color: #aaacad;

            a {
              width: 100%;
              display: block;
              height: 50px;
              line-height: 50px;
              font-size: 20px;
              font-weight: 700;
              color: #ffffff;
              border: 1px solid #222;
              box-sizing: border-box;
              text-decoration: none;

            }

            .current {
              color: #9be8f7;
            }
          }
        }

        .content {
          width: 640px;
          height: 316px;
          box-sizing: border-box;
          border: 1px solid #222;
          border-top: none;
          padding: 18px;
          background-color: #c7caca;

          form {
            margin: 15px 0 18px 0;
            font-size: 12px;
            line-height: 18px;

            .input-text {
              margin-bottom: 16px;

              span {
                margin-left: 120px;
                float: left;
                width: 37px;
                height: 50px;
                border: 1px solid #222;
                box-sizing: border-box;
                border-radius: 2px 0 0 2px;
                color: #fff
              }

              .pwd {
                background-position: -72px -201px;
              }

              input {
                width: 330px;
                height: 50px;
                box-sizing: border-box;
                border: 1px solid #222;
                border-left: none;
                float: left;
                padding-top: 6px;
                padding-bottom: 6px;
                font-size: 14px;
                line-height: 22px;
                padding-right: 8px;
                padding-left: 8px;

                border-radius: 0 2px 2px 0;
                outline: none;
              }
            }

            .setting {
              label {
                float: left;
              }

              .forget {
                float: right;
              }
            }

            .btn {
              background-color: #607dc1;
              padding: 6px;
              border-radius: 0;
              font-size: 16px;
              font-family: 微软雅黑;
              word-spacing: 4px;
              border: 1px solid #607dc1;
              color: #fff;
              width: 100%;
              height: 36px;
              margin-top: 25px;
              outline: none;
            }
          }

          .call {
            margin-top: 30px;

            ul {
              float: left;

              li {
                float: left;
                margin-right: 5px;
              }
            }

            .register {
              float: right;
              font-size: 15px;
              line-height: 38px;
            }

            .register:hover {
              color: #4cb9fc;
              text-decoration: underline;
            }
          }

        }
      }
    }

    .copyright {
      width: 100%;
      margin: 0 auto;
      text-align: center;
      line-height: 24px;
      background-color: #48576a;  
      ul {
        li {
          display: inline-block;
          border-right: 1px solid #fff;
          padding: 0 20px;
          margin: 15px 0;
          color: #fff;
        }
      }
    }

  }
  div {
    .address {
    color: #fff;
  }
    .beian {
      color: #fff;
    }
  }
  
</style>