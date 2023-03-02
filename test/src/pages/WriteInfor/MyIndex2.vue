
<template>
    <html>
     <head>
      <meta charset="utf-8">
      <title>选择体检项目</title>
     </head>
     <body>
      <div class="bg">
       <form method="post" autocomplete="off">
        <p align="center" class="title"><h2>选择体检项目</h2></p><br/>
        <div class="wenben">
          <form class="inner" @submit.prevent="submitForm"><br /><br /><br />
            <div class="wrap">
                <aside id="left">
                    <p align="center" class="font">身份证号: <input type="text" v-model="formData.id"></p><br /><br /><br /><br />
                    <p class="font">一般项目:
                      <label>
                        <input type="radio" value="1" v-model="formData.normal">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.normal">
                        否
                      </label>
                    </p><br />
                    <p class="font">内科:
                      <label>
                        <input type="radio" value="1" v-model="formData.internal">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.internal">
                        否
                      </label>
                    </p><br />
                    <p class="font">外科:
                      <label>
                        <input type="radio" value="1" v-model="formData.external">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.external">
                        否
                      </label>
                    </p><br />
                    <p class="font">耳鼻喉:
                      <label>
                        <input type="radio" value="1" v-model="formData.ent">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.ent">
                        否
                      </label>
                    </p><br />
                    <p class="font">口腔:
                      <label>
                        <input type="radio" value="1" v-model="formData.mouth">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.mouth">
                        否
                      </label>
                    </p><br />
                    <p class="font">视力:
                      <label>
                        <input type="radio" value="1" v-model="formData.eye">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.eye">
                        否
                      </label>
                    </p><br />
                    <p class="font">心电图:
                      <label>
                        <input type="radio" value="1" v-model="formData.ECG">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.ECG">
                        否
                      </label>
                    </p><br />
                    <p class="font">妇科:
                      <label>
                        <input type="radio" value="1" v-model="formData.gynecologial">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.gynecologial">
                        否
                      </label>
                    </p><br />
                    <p class="font">尿常规:
                      <label>
                        <input type="radio" value="1" v-model="formData.urine">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.urine">
                        否
                      </label>
                    </p><br />
                </aside>
                <section id="right">
                  <p align="center" class="font">就诊日期: <input type="date" v-model="formData.date"></p><br /><br /><br /><br />
                  <p class="font">血常规:
                    <label>
                      <input type="radio" value="1" v-model="formData.blood">
                        是
                        </label>
                        <label>
                        <input type="radio" value="0" v-model="formData.blood">
                        否
                        </label>
                        </p><br />
                        <p class="font">肝功能:
                        <label>
                        <input type="radio" value="1" v-model="formData.liver">
                        是
                        </label>
                        <label>
                        <input type="radio" value="0" v-model="formData.liver">
                        否
                        </label>
                        </p><br />
                        <p class="font">血脂:
                      <label>
                        <input type="radio" value="1" v-model="formData.bloodfat">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.bloodfat">
                        否
                      </label>
                    </p><br />
                    <p class="font">肾功能:
                      <label>
                        <input type="radio" value="1" v-model="formData.kidney">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.kidney">
                        否
                      </label>
                    </p><br />
                    <p class="font">血糖:
                      <label>
                        <input type="radio" value="1" v-model="formData.bloodsugar">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.bloodsugar">
                        否
                      </label>
                    </p><br />
                    <p class="font">肿瘤:
                      <label>
                        <input type="radio" value="1" v-model="formData.C12">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.C12">
                        否
                      </label>
                    </p><br />
                    <p class="font">幽门杆菌:
                      <label>
                        <input type="radio" value="1" v-model="formData.germ">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.germ">
                        否
                      </label>
                    </p><br />
                    <p class="font">B超:
                      <label>
                        <input type="radio" value="1" v-model="formData.Bmode">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.Bmode">
                        否
                      </label>
                    </p><br />
                    <p class="font">CT:
                      <label>
                        <input type="radio" value="1" v-model="formData.CT">
                        是
                      </label>
                      <label>
                        <input type="radio" value="0" v-model="formData.CT">
                        否
                      </label>
                    </p><br />
                </section>
            </div>
            <p align="center"><button type="submit" class="but">提交体检选择</button></p>
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
            'id':'', 'date':'', 'normal':'', 'internal':'', 'external':'','ent':'', 'eye':'',
            'mouth':'', 'ECG':'', 'gynecologial':'','urine':'','blood':'','liver':'','bloodfat':'',
            'kidney':'','bloodsugar':'','C12':'','germ':'','Bmode':'','CT':''
          }
        }
      },
          methods :{
             submitForm() {
          axios.post('http://127.0.0.1:8000/api/exam', this.formData)
            .then(response => {
              console.log(response.data);
              this.$router.push('/home');
              alert("项目选择成功！")
            })
            .catch(error => {
              console.log(error);
            });
            }
        }
    }
    </script>
      
    <style scoped lang="less">
                .wrap{
                    margin:10px auto;
                    width:100%;
                }
                #left{
                    width:45%;
                    height:450px;
                    //background: #ccffff;
                    float: left;
                }
                #right{
                    height: 450px;
                    //background: #ffcccc;
                    margin-left:40%;
                    margin-right: 8%;
                }

       div.wenben {
        width: 600px;
        margin: auto;
        height: 370px;
        background-color: #b5bfc2c7;
       }
       form {
        height: 900px;
        border-style:solid;
        border-width:4px;
        border-color: aliceblue;
        background-color: #48576a;
        .inner{
          background-color: #e3eaf1;
          height: 700px;
        }
       }
       input[type="radio"] {
          width:20px;
          height:15px; 
       }
       input:hover{
				color: aliceblue;
				background-color: #48576a;
			}
       h2 {
          font-size: 50px;
          color: #e3eaf1; 
          display : inline;
       }
       .font {
          font-weight: 620;
          font-size: 17px;
          text-align: right;
       }
       .title{
        background-color: #48576a;
       }
    
       .but {
        position: relative;
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
    input {
    width:180px;
    height:20px;                                 
    border:1px solid #d4cdba;
    padding:2px; 
    font-size: 17px;
   }

    </style>