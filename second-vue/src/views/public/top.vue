<template>
  <div>
    <el-table
        :data="abouts">
      <el-table-column
          prop="uid"
          label="序号"
          width="50">
      </el-table-column>
      <el-table-column
          prop="name"
          label="姓名"
          width="100">
      </el-table-column>
      <el-table-column
          prop="number"
          label="学号"
          width="180">
      </el-table-column>
      <el-table-column
          prop="school"
          label="学校"
          width="180">
      </el-table-column>
      <el-table-column
          prop="phone"
          label="联系电话"
          width="180">
      </el-table-column>
      <el-table-column
          prop="email"
          label="邮箱"
          width="180">
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  name: "top",
  data(){
    return{
      abouts:[],
      form: {
        uid:'',
        name: '',
        number: '',
        school: '',
        phone: '',
        email:'',
      },
    }
  },
  created() {
    this.findAllAbouts();
  },
  watch:{
    aboutName () {
      this.findAllAbouts();
    }
  },
  methods:{
    findAllAbouts() {
      this.$axios.get("/about/findAllAbouts")
          .then((res) => {
            this.abouts = res.data
          })
          .catch(error => {
            this.$message({
              type: 'error',
              message: "查询失败，原因是" + error.data.message
            });
          });
    },
  }
}
</script>

<style>
.el-table{
  background: #f0f9eb;
}
</style>