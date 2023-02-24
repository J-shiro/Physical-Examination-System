<template>
            <div class="footer">
            <div class="footer-container">
                <div class="footerList">
                    <div class="footerItem">
                        <h4>就医指南</h4>
                    </div>
                    <div class="footerItem">
                        <h4>预约流程</h4>
                    </div>
                    <div class="footerItem">
                        <h4>支付方式</h4>
                    </div>
                    <div class="footerItem">
                        <h4>医疗服务</h4>
                    </div>
                    <div class="footerItem">
                        <h4>医生名单</h4>
                    </div>
                    <div class="footerItem">
                        <h4>帮助中心</h4>
                    </div>
                </div>
                <div class="copyright">
                    <ul class="helpLink">
                        <li>友情链接
                            <span class="space"></span>
                        </li>
                        <li>关于我们
                            <span class="space"></span>
                        </li>
                        <li>联系我们</li>
                    </ul>
                    <p>地址: 上海大学网络空间安全数据库小组</p>
                    <p>京ICP备XXXXXX号</p>
                </div>
            </div>
        </div>
</template>

<script>
    export default {
        name: '',

    }
</script>

<style scoped lang="less">
    .footer {
        background-color: #eaeaea;

        .footer-container {
            width: 1200px;
            margin: 0 auto;
            padding: 0 15px;

            .footerList {
                padding: 20px;
                border-bottom: 1px solid #e4e1e1;
                border-top: 1px solid #e4e1e1;
                overflow: hidden;
                padding-left: 40px;

                .footerItem {
                    width: 16.6666667%;
                    float: left;

                    h4 {
                        font-size: 14px;
                    }

                    .footerItemCon {
                        li {
                            line-height: 18px;
                        }
                    }

                    &:last-child img {
                        width: 121px;
                    }
                }
            }

            .copyright {
                padding: 20px;

                .helpLink {
                    text-align: center;

                    li {
                        display: inline;

                        .space {
                            border-left: 1px solid #666;
                            width: 1px;
                            height: 13px;
                            background: #666;
                            margin: 8px 10px;
                        }
                    }
                }

                p {
                    margin: 10px 0;
                    text-align: center;
                }
            }
        }
    }
</style>