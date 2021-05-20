<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="courseName" placeholder="请输入课程名称" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchCourseByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增课程</el-button>
    </div>
    <div>
      <el-table
          @selection-change="handleSelectionChange"
          :data="courses"
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
            label="课程名称"
            width="100">
        </el-table-column>

        <el-table-column
            prop="introduction"
            label="课程简介"
            width="600">
        </el-table-column>

        <el-table-column
            prop="kind"
            label="课程性质"
            width="100">
        </el-table-column>

        <el-table-column
            prop="credit"
            label="学分"
            width="100">
        </el-table-column>

        <el-table-column
            prop="unit"
            label="开设单位"
            width="100">
        </el-table-column>

        <el-table-column
            prop="teacher"
            label="任课老师"
            width="180">
        </el-table-column>

        <el-table-column
            prop="goal"
            label="教学目标"
            width="600">
        </el-table-column>

        <el-table-column
            prop="team"
            label="教学团队"
            width="600">
        </el-table-column>

        <el-table-column
            prop="textbook"
            label="著作与教材"
            width="180">
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteCourses">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" v-if="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="course">

        <el-form-item label="课程名称" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="课程简介" :label-width="formLabelWidth" prop="introduction">
          <el-input v-model="form.introduction" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="课程性质" :label-width="formLabelWidth" prop="kind">
          <el-radio v-model="form.kind" label="必修课">必修课</el-radio>
          <el-radio v-model="form.kind" label="通识选修课">通识选修课</el-radio>
        </el-form-item>

        <el-form-item label="学分" :label-width="formLabelWidth" prop="credit">
          <el-input-number v-model="form.credit" :precision="2" :step="0.1" :max="8"></el-input-number>
        </el-form-item>

        <el-form-item label="开设单位" :label-width="formLabelWidth" prop="unit">
          <el-input v-model="form.unit" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="任课老师" :label-width="formLabelWidth" prop="teacher">
          <el-input v-model="form.teacher" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="教学目标" :label-width="formLabelWidth" prop="goal">
          <el-input v-model="form.goal" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="教学团队" :label-width="formLabelWidth" prop="team">
          <el-input v-model="form.team" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="教材与著作" :label-width="formLabelWidth" prop="textbook">
          <el-input v-model="form.textbook" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitCourse">确 定</el-button>
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
      courseName: '',
      multipleSelection:[],
      dialogTitle: {
        addCourse: "新增课程",
        editCourse: "编辑课程"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入课程名称' }
        ],
        introduction: [
          { required: true, message: '请输入课程简介' }
        ],
        kind: [
          { required: true, message: '请输入课程种类' }
        ],
        credit: [
          { required: true, message: '学分不能为空' }
        ],
        unit: [
          { required: true, message: '开课单位不能为空' }
        ],
        teacher: [
          { required: true, message: '任课老师不能为空' }
        ],
        goal: [
          { required: true, message: '教学目标不能为空' }
        ],
        team: [
          { required: true, message: '教学团队不能为空' }
        ],
        textbook: [
          { required: true, message: '教材与著作不能为空' }
        ],
      },
      courses:[],
      msg: '',
      search: '',
      dialogFormVisible: false,
      form: {
        name: '',
        introduction: '',
        kind: '',
        credit: '',
        unit: '',
        teacher: '',
        goal:'',
        team:'',
        textbook:'',
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllCourses();
  },
  watch:{
    courseName () {
      this.findAllCourses();
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
    searchCourseByName() {
      if (this.courseName !== '') {
        this.$axios.get("/course/findCourseByName?name=" + this.courseName).then((resp) => {
          this.courses = resp.data;
        }).catch((error) => {
          this.$message({
            type: 'error',
            message: "查询失败，原因是" + error.data.message
          });
        })
      }
    },
    deleteCourses() {
      this.$confirm('此操作将永久删除课程, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach((item) => {
          ids += 'ids=' + item.uid + '&'
        });
        this.$axios.post("/course/deleteCoursesByIds" + ids).then((resp) => {
          if (resp) {
            this.findAllCourses();
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
    submitCourse () {
      if (this.dialogStatus === 'addCourse'){
        this.addCourse();
      } else if(this.dialogStatus === "editCourse") {
        this.editCourse();
      }
    },
    findAllCourses() {
      this.$axios.get("/course/findAllCourses")
          .then((res) => {
            this.courses = res.data
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
      this.dialogStatus = "editCourse";
      this.form.uid = row.uid;
      this.form.name = row.name;
      this.form.introduction = row.introduction;
      this.form.kind = row.kind;
      this.form.credit = row.credit;
      this.form.unit = row.unit;
      this.form.teacher = row.teacher;
      this.form.goal = row.goal;
      this.form.team = row.team;
      this.form.textbook = row.textbook;
    },
    handleDelete(row) {
      this.$confirm('此操作将永久删除该课程, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/course/deleteCourse?uid=" + row.uid).then((resp) => {
          this.$message.success("删除成功!")
          this.findAllCourses();
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
      this.form.introduction = '';
      this.form.kind = '';
      this.form.credit = '';
      this.form.unit = '';
      this.form.teacher = '';
      this.form.goal = '';
      this.form.team = '';
      this.form.textbook = '';


      this.dialogFormVisible = true;
      this.dialogStatus = "addCourse";
    },
    addCourse () {
      this.$refs.course.validate((valid) => {
        if (valid) {
          this.$axios.post("/course/addCourse",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllCourses();
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
    editCourse () {
      this.$axios.post("/course/updateCourse",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllCourses();
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
