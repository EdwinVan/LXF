<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="aboutName" placeholder="请输入开发人员名称" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchAboutByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增开发人员</el-button>
    </div>
    <div>
      <el-table
          @selection-change="handleSelectionChange"
          :data="abouts"
          border>
        <el-table-column
            type="selection"
            width="55">
        </el-table-column>
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
            width="100">
        </el-table-column>
        <el-table-column
            prop="school"
            label="学校"
            width="100">
        </el-table-column>
        <el-table-column
            prop="phone"
            label="联系电话"
            width="100">
        </el-table-column>
        <el-table-column
            prop="email"
            label="邮箱"
            width="100">
        </el-table-column>
        <el-table-column
            label="操作"
            width="150">
          <template slot-scope="scope">
            <el-button
                size="mini"
                @click="handleEdit(scope.row)">编辑</el-button>
            <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteAbouts">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" v-if="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="about">
        <el-form-item label="姓名" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="学号" :label-width="formLabelWidth" prop="number">
          <el-input v-model="form.number" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="学校" :label-width="formLabelWidth" prop="school">
          <el-input v-model="form.school" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" :label-width="formLabelWidth" prop="phone">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" :label-width="formLabelWidth" prop="email">
          <el-input v-model="form.email" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitAbout">确 定</el-button>
      </div>
    </el-dialog>
    <el-upload
        style="margin-top:20px;"
        action="/upload"
        multiple
        :on-success="handleSuccess"
        :limit="3"
        :file-list="fileList">
    </el-upload>
  </div>
</template>

<script>
// @ is an alias to /src
import AreaJson from "../assets/area-full.json";

export default {
  name: 'Home',
  components: {
  },
  data () {
    return {
      fileList: [],
      aboutName: '',
      multipleSelection:[],
      dialogTitle: {
        addAbout: "新增开发人员",
        editAbout: "编辑开发人员"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入开发人员名称' }
        ],
      },
      abouts:[],
      msg: '',
      search: '',
      dialogFormVisible: false,
      form: {
        name: '',
        number: '',
        school: '',
        phone: '',
        email:'',
      },
      formLabelWidth: '120px',
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
  methods: {
    handleSuccess(file) {
      const filename = file.name;
      this.$message({
        message: '文件上传成功！',
        type: 'success'
      });
    },
    searchAboutByName() {
      if (this.aboutName !== '') {
        this.$axios.get("/about/findAboutByName?name=" + this.aboutName).then((resp) => {
          this.abouts = resp.data;
        }).catch((error) => {
          this.$message({
            type: 'error',
            message: "查询失败，原因是" + error.data.message
          });
        })
      }
    },
    deleteAbouts() {
      this.$confirm('此操作将永久删除开发人员, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach((item) => {
          ids += 'ids=' + item.uid + '&'
        });
        this.$axios.post("/about/deleteAboutsByIds" + ids).then((resp) => {
          if (resp) {
            this.findAllAbouts();
            this.$message.success("删除成功！");
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
      console.log(val)
    },
    submitAbout () {
      if (this.dialogStatus === 'addAbout'){
        this.addAbout();
      } else if(this.dialogStatus === "editAbout") {
        this.editAbout();
      }
    },
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
    handleEdit(row) {
      this.dialogFormVisible = true;
      this.dialogStatus = "editAbout";
      this.form.uid = row.uid;
      this.form.name = row.name;
      this.form.number = row.number;
      this.form.school = row.school;
      this.form.phone = row.phone;
      this.form.email = row.email;
    },
    handleDelete(row) {
      this.$confirm('此操作将永久删除该开发人员, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/about/deleteAbout?uid=" + row.uid).then((resp) => {
          this.$message.success("删除成功!")
          this.findAllAbouts();
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    showDialog() {
      this.form.uid = '';
      this.form.name = '';
      this.form.number = '';
      this.form.school = '';
      this.form.phone = '';
      this.form.email = '';


      this.dialogFormVisible = true;
      this.dialogStatus = "addAbout";
    },
    addAbout () {
      this.$refs.about.validate((valid) => {
        if (valid) {
          this.$axios.post("/about/addAbout",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllAbouts();
            }
          }).catch((error)=>{
            this.$message({
              message: '添加数据失败，原因是'+error.data.message,
              type: 'error'
            })
          })
        } else {
          this.$message({
            message: '请输入所有字段',
            type: 'error'
          })
          return false;
        }
      });
    },
    editAbout () {
      this.$axios.post("/about/updateAbout",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllAbouts();
      }).catch( (error)=> {
        this.$message({
          message: '数据更新失败，原因是'+error.data.message,
          type: 'error'
        })
      })
    }
  }
}
</script>
<style scoped>
.table {
  margin: 0 auto;
  clear: both;
}
</style>
