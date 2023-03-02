<template>
    <div class="container">
      <h1>病人签到</h1>
      <div v-if="!checkedIn">
        <button @click="showConfirmDialog" class="btn btn-primary">签到</button>
      </div>
      <div v-else>
        <h2>已签到</h2>
      </div>
      <div v-if="showDialog" class="modal-backdrop">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">确认签到</h4>
              <button type="button" class="close" @click="hideConfirmDialog">&times;</button>
            </div>
            <div class="modal-body">
              <p>您确定要进行签到吗？</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" @click="hideConfirmDialog">取消</button>
              <button type="button" class="btn btn-primary" @click="checkIn">确定</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  export default {
    data() {
      return {
        formData: {
          name:'',
          checkin:1
        },
        showDialog: false,
        checkedIn: false,
      };
    },
    mounted() {
    this.formData.name = localStorage.getItem('username')
    console.log(this.formData.name)
    },
    methods: {
      showConfirmDialog() {
        this.showDialog = true;
      },
      hideConfirmDialog() {
        this.showDialog = false;
      },
      checkIn() {
        // 发送签到请求到后端
        axios.post('/api/sign', this.formData)
          .then((response) => {
            if (response.data.msg=='success') {
              // 签到成功
              this.checkedIn = true;
              this.showDialog = false;
            } else if(response.data.error_num==3){
              alert("签到失败,还没有选择体检项目，请先去选择!")
            } else {
              alert("签到失败，还没有预约，请先去预约体检！")
            }
          })
          .catch((error) => {
            // 处理请求错误
            console.error(error)
            alert("发生异常！")
          })
      },
    },
  };
  </script>
  
  <style scoped>
  .container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  
  .btn {
    padding: 10px 20px;
    font-size: 18px;
  }
  
  .modal-backdrop {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1040;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.5);
  }
  
  .modal-dialog {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 1050;
    width: 400px;
    background-color: #fff;
    box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.5);
  }
  
  .modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background-color: #85b9f0;
    color: #fff;
  }
  
  .modal-title {
    margin: 0;
    font-size: 24px;
  }
  
  .modal-body {
    padding: 20px;
    font-size: 20px;
    color: red;
  }
  
  .modal-footer {
    display: flex;
    justify-content: flex-end;
    padding: 10px 20px;
    background-color: #f7f7f7;
  }
  .close {
    border-radius: 20%;
  }
  </style>
  