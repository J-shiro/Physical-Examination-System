<template>
    <!-- 头部 -->
    <header class="header">
            <!-- 头部的第一行 -->
            <div class="top">
                <div class="container">
                    <div class="loginList"> <!--声明式导航-->
                        <p><router-link to="/home" style="text-decoration: none;">基于vue,Django,mysql的医疗检测平台</router-link></p>
                        <p>
                            <!-- <span>{{ username }}</span> -->
                            <p v-if="isAuthenticated"><a>欢迎, {{ this.username }} <button @click="logout">退出登录</button></a></p>
                            <p v-else>
                                <span><a>请</a></span>
                                <router-link to="/login">登录</router-link>
                                <router-link class="register" to="/register">免费注册</router-link>
                            </p>
                        </p>
                    </div>
                    <div class="typeList">
                        <router-link to="/writeinfor" class="lj">预约填写</router-link>
                        <router-link to="/choose" class="lj">体检项目</router-link>
                        <router-link to="/sign" class="lj">签到</router-link>
                        <a href="###" class="lj">支付费用</a>
                        <router-link to="/report" class="lj">查看体检结果</router-link>
                        <a href="###" class="lj">我的信息</a>
                    </div>
                </div>
            </div>
            <!--头部第二行 搜索区域-->
            <!-- <div class="bottom"> -->
                <!-- <div class="searchArea"> -->
                    <!-- <form action="###" class="searchForm"> -->
                        <!-- <input type="text" id="autocomplete" class="input-error input-xxlarge" v-model="keyword" /> -->
                        <!-- <button class="sui-btn btn-xlarge btn-danger" type="button" @click="goSearch">搜索</button>编程式导航 -->
                    <!-- </form> -->
                <!-- </div> -->
            <!-- </div> -->
        </header>
</template>

<script>
    export default {
        name: "",
        data(){
            return{
                // keyword:''
                'username': '',
                'isAuthenticated':'',
            }
        },
        mounted() {
            // 页面加载后从本地存储中获取用户名并赋值给username
            this.username = localStorage.getItem('username')
            //console.log(this.username)
            this.isAuthenticated = localStorage.getItem('isAuthenticated')
            //console.log(this.isAuthenticated)
        },
        methods: {
            logout() {
                localStorage.removeItem('isAuthenticated');
                localStorage.removeItem('username');
                //location.reload();
                this.$router.push('/login').then(()=>location.reload());
                
            },
        }
    }
</script>

<style scoped lang="less">
    .header {
        &>.top {
            //background-color: #eaeaea;
            background-color: #48576a;
            height: 40px;
            line-height: 30px;

            .container {
                //width: 1200px;
                margin: 0 auto;
                margin-left: 1%;
                overflow: hidden;

                .loginList {
                    float: left;
                    p {
                        float: left;
                        margin-right: 15px;
                        font-size: 20px;
                        font-weight: bold;
                        a{
                            color: #bfcbd9;
                        };
                        .register {
                            border-left: 1px solid #b3aeae;
                            padding: 0 5px;
                            margin-left: 5px;
                        }
                    }
                }

                .typeList {
                    float: right;
                    position: relative;
                    font-size: 15px;
                    a {
                        padding: 0 10px;
                        color: #bfcbd9;

                        &+a {
                            border-left: 1px solid #b3aeae;
                        }
                    }
                }

            }
        }

        &>.bottom {
            width: 1200px;
            margin: 0 auto;
            overflow: hidden;

            .searchArea {
                float: right;
                margin-top: 15px;

                .searchForm {
                    overflow: hidden;

                    input {
                        box-sizing: border-box;
                        width: 490px;
                        height: 32px;
                        padding: 0px 4px;
                        border: 2px solid #48576a;
                        float: left;

                        &:focus {
                            outline: none;
                        }
                    }

                    button {
                        height: 32px;
                        width: 68px;
                        background-color: #48576a;
                        border: none;
                        color: #fff;
                        float: left;
                        cursor: pointer;
                        &:focus {
                            outline: none;
                        }
                    }
                }
            }
        }
    }
</style>
