<template>
 <div>
    <h2>Patients</h2>
    <ul>
      <li v-for="patient in patients.list" :key="patient.id">
        <span>{{ patient.fields.name }}</span>
        <span>{{ patient.fields.age }}</span>
        <span>{{ patient.fields.sex }}</span>
        <span>{{ patient.fields.marriage }}</span>
        <span>{{ patient.pk }}</span>
        <span>{{ patient.fields.phone }}</span>
      </li>
    </ul>
  </div>

  <div class="report">
    <h1 class="title">{{ title }}</h1>
    <p class="info">{{ info }}</p>
    <div class="items">
      <div class="item" v-for="(item, index) in items" :key="index">
        <div class="item-title">{{ item.title }}</div>
        <div class="item-value">{{ item.value }}</div>
        <div class="item-desc">{{ item.desc }}</div>
      </div>
    </div>
    <div class="footer">
      <p class="remark">{{ remark }}</p>
      <p class="signature">{{ signature }}</p>
    </div>
  </div>

</template>

<script>
import axios from 'axios';
    export default {
        data() {
    return {
      patients: []
    }
  },
  props: {
    title: String,
    info: String,
    items: Array,
    remark: String,
    signature: String
  },
  mounted() {
    axios.get('http://127.0.0.1:8000/api/showp').then(response => {
      //this.patients = response.data;
      this.patients = response.data
      console.log(this.patients)
    }).catch(error => {
      console.log(error);
    });
  }
    }
</script>

<style lang="less" scoped>
    .report {
  margin: 0 auto;
  padding: 50px;
  font-size: 14px;
  line-height: 1.5;
  text-align: center;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.title {
  margin: 0;
  font-size: 24px;
  font-weight: bold;
}

.info {
  margin: 20px 0;
  color: #666;
}

.items {
  display: flex;
  justify-content: space-around;
  margin: 40px 0;
}

.item {
  width: 300px;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.item-title {
  margin: 0;
  font-size: 18px;
  font-weight: bold;
}

.item-value {
  margin: 10px 0;
  font-size: 24px;
  font-weight: bold;
}

.item-desc {
  margin: 10px 0;
  color: #666;
}

.footer {
  margin-top: 50px;
  text-align: left;
}

.remark {
  margin: 0;
  font-size: 16px;
}

.signature {
  margin-top: 20px;
  font-size: 16px;
  font-weight: bold;
}

</style>