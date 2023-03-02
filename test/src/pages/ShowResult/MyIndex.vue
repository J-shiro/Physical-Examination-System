<template>
  <div class="container">
    <div class="a4">
        <h1 class="title">体    检    报    告</h1>
        <div class="border">
          
          <div class="category">
            <h2 class="subtitle inline">就诊人姓名: {{ name }}</h2>
          </div>
        
          <div class="line"></div>
          <div class="category" v-for="(item, index) in projectlist" :key="index">
            <h2 class="subtitle">{{ item }}</h2>
              <div class="result-row">
                <h3 class="subtitle inline">诊断结果:</h3>
                  <span v-for="(result, idx) in resultlist[index]" :key="idx" class="result">
                    {{ result }}
                  </span>
              </div>
              <div class="result-row">
                <h3 class="subtitle inline">诊断医师:</h3>
                  <span v-for="(doctor, did) in doctorlist[index]" :key="did" class="doctor" >
                    {{ doctor }}
                  </span> 
              </div>
              <div class="line"></div>
          </div>
        
          
        </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
       name: '',
       resultlist: [],
       doctorlist: [],
       projectlist: [],
    };
  },
  mounted() {
    this.name = localStorage.getItem('username')
    this.showResult()
  },
  methods: {
    showResult(){
      axios.post('http://127.0.0.1:8000/api/report', {name: this.name})
        .then(response => {
          if (response.data.msg=='success'){
            this.resultlist = response.data.result
            this.projectlist = response.data.project
            this.doctorlist = response.data.doctor
          }
          else if (response.data.error_num==2){
            alert("您还没有进行体检项目预约...")
            // this.$router.push('/home').then(() => location.reload())
          }
          else if (response.data.error_num==3){
            alert("体检仍未完成，请等待...")
            // this.$router.push('/home').then(() => location.reload())
          }
          else {
            alert("出现异常")
            // this.$router.push('/home').then(() => location.reload())
          }
        })
        .catch(error => {
          console.error(error);
        });
    }
  },
};
</script>

<style lang="less" scoped>
.container {
  background-color: #c9d9f8;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  padding-top: 300px;
  padding-bottom: 400px;
}

.result-row {
  display: flex;
  align-items: center;
}

.result-row h3.inline{
  margin-right: 30px;
  font-size: 17px;
}

.a4 {
  background-color: white;
  width: 210mm;
  height: 300mm;
  padding: 20mm;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  display: flex;
  flex-direction: column;
  border: 1px solid #2c3e50;
  margin: 10mm;
  margin-top: 30mm;
  position: relative;
}

.subtitle {
  font-size: 20px;
}

.border {
  border: 1px solid #2c3e50;
  height: 100%;
  padding: 10mm;
}

.title {
  font-size: 65px;
  text-align: center;
  margin: 0 auto;
  margin-bottom: 20px;
  margin-top: -50px;
  font-family: "楷体", "KaiTi", serif;
}

.category {
  font-size: 20px;
  margin-bottom: 10px;
}

.result {
  font-size: 15px;
}

.doctor {
  font-size: 20px;
  font-family: "楷体", "KaiTi", serif;
}

.line {
  border-top: 1px solid black;
  margin-top: 10px;
  margin-bottom: 10px;
  width: 100%;
  margin-left: auto;
  margin-right: auto;
}

</style>