<template>
  <el-container>
    <el-header class="targetTop" id="top" style="height: 100px">
      <el-row>
        <el-col :span="10">
          <h3 id="top-left">
            <el-image
                style="width: 300px; height: 70px"
                :src="require('../../assets/cqnu.png')"
                :fit="fit"></el-image>
          </h3>
        </el-col>
        <el-col :span="14">
          <div id="top-right">
            <el-button type="text" class="top-button"><a>关于我们</a></el-button>
            <el-divider direction="vertical"></el-divider>
            <el-button type="text" class="top-button" ><a @click="currents('/login')">登录</a></el-button>          </div>
        </el-col>
      </el-row>
    </el-header>
    <el-main id="targetMainBox">
      <div id="daohanglan">
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
          <el-menu-item index="index">首页</el-menu-item>
          <el-submenu index="introduction" >
            <template slot="title">课程简介</template>
            <el-menu-item index="introduction">课程介绍</el-menu-item>
            <el-menu-item index="introduction">教学方法</el-menu-item>
            <el-menu-item index="introduction">课程安排</el-menu-item>
          </el-submenu>
          <el-menu-item index="target">教学目标</el-menu-item>
          <el-menu-item index="team">教学团队</el-menu-item>
          <el-menu-item index="textbook">教材与著作</el-menu-item>
          <el-menu-item index="news">通知公告</el-menu-item>
        </el-menu>
      </div>
      <div class="mainContent">
        <div id="leftAside">
          <div class="leftAsideTop">
            通知公告
          </div>
        </div>
        <div class="mainRight">
          <div id="section-0" style="height: 300px">
            <div class="mainRightTop">
              <i class="el-icon-chat-dot-square"></i>
              <div class="h4">通知公告</div>
              <div class="seat">
                <el-breadcrumb separator="/">
                  <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
                  <el-breadcrumb-item :to="{ path: 'news' }">通知公告</el-breadcrumb-item>
                </el-breadcrumb>
              </div>
            </div>
            <div class="mainRightContent">
            </div>
          </div>
        </div>
      </div>
    </el-main>
    <el-footer class="footer" style="height: 120px">
      <p>项目参与人：梁爽 范玉杰 谢钲钲</p>
      <p>联系方式：kechengsheji@cqnu.edu.stu.com</p>
    </el-footer>
  </el-container>
</template>

<script>
export default {
  name: "news",
  data() {
    return {
      activeIndex: '1',
      current:'',
      courses:[],
      msg: '',
      search: '',
    };
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
    gotolink(){
      this.$router.replace('/login')
    },
    handleSelect(index){
      this.$router.push(index);
    },
    currents(current){
      this.$router.push(current);
    },
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

<style>

.targetTop{
  background-color: #1357ac;
}
#top ul.el-menu-demo.el-menu--horizontal.el-menu {
  background-color: #1357ac;
  border: 0px;
}
#top {
  padding-top: 10px;
  padding-bottom: 50px;
}
#top-left {
  margin: 0px;
  padding-left: 250px;
}
#top-right {
  padding-top: 20px;
  padding-left: 400px;
}
.top-button a{
  margin-right: 10px;
  margin-left: 10px;
  color: white;
  font-size: 16px;

}
.top-button a:hover{
  color: #f5e79e;
}
#targetMainBox{
  margin: 0 auto;
  width: 1200px;
  padding: 0px;
  height: 800px;
}
#daohanglan .el-menu-item{
  width: 216px;
  text-align: center;
}


.footer{
  background-color: #1357ac;
  text-align:center;
}
.footer p {
  margin-top: 10px;
  color: white;
}
</style>