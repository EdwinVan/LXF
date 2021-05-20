<template>
  <el-container>
    <el-header id="top" style="height: 100px">
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
            <el-button type="text" class="top-button"><a>关于作者</a></el-button>
            <el-divider direction="vertical"></el-divider>
            <el-button type="text" class="top-button" ><a @click="gotolink">登录</a></el-button>
          </div>
        </el-col>
      </el-row>
    </el-header>
    <el-main id="mainBox">

      <div id="daohanglan">
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
          <el-menu-item index="1">首页</el-menu-item>
          <el-submenu index="2" >
            <template slot="title"><a @click="currents('/jianjie/')">课程简介</a></template>
            <el-menu-item index="2-1">课程大纲</el-menu-item>
            <el-menu-item index="2-2">教学方法</el-menu-item>
            <el-menu-item index="2-3">课程安排</el-menu-item>
          </el-submenu>
          <el-menu-item index="3">教学目标</el-menu-item>
          <el-menu-item index="4">教学团队</el-menu-item>
          <el-menu-item index="5">教材与著作</el-menu-item>
          <el-menu-item index="6">通知公告</el-menu-item>
        </el-menu>
      </div>
      <div class="block" id="index_lunbo">
        <span class="demonstration"></span>
        <el-carousel height="150px">
          <el-carousel-item v-for="item in imgList" :key="item.url">
            <img :src="item.url" alt />
          </el-carousel-item>
        </el-carousel>
      </div>

      <div id="box1">
        <div class="first-box" id="Course-content">
          <p class="h4">课程简介</p>
          <div>

            <div class="IndexContent">
              {{courses[0].introduction}}
            </div>
          </div>

        </div>
        <div class="first-box" id="notice">
          <p class="h4">教学目标</p>
          <div class="IndexContent">
            {{courses[0].goal}}
          </div>
        </div>
      </div>

      <div id="box2">
        <div class="second-box" id="second-box-1">
          <p class="h4">教学团队</p>
          <div class="IndexContent">
            <p>{{courses[0].team}}</p>
          </div>

        </div>
        <div class="second-box" id="second-box-2">
          <p class="h4">教材与著作</p>
          <div class="IndexContent">
            {{courses[0].textbook}}
          </div>
        </div>
        <div class="second-box" id="second-box-3">
          <p class="h4">通知公告</p>
        </div>
      </div>
    </el-main>

    <el-footer class="footer" style="height: 120px">
      <p>项目参与人：梁爽 范玉杰 谢钲钲</p>
      <p>联系方式：123456</p>
    </el-footer>
  </el-container>
</template>

<script>
export default {
  name: "index",
  data() {
    return {
      current:'',

      imgList: [
        {
          url: require('../../assets/images/pic1.png')
        }, {
          url: require('../../assets/images/pic2.jpg')
        }, {
          url: require('../../assets/images/pic3.jpg')
        }, {
          url: require('../../assets/images/pic4.png')
        }
      ],

      courses:[],
      msg: '',
      search: '',
      // form: {
      //   name: '',
      //   introduction: '',
      //   kind: '',
      //   credit: '',
      //   unit: '',
      //   teacher: '',
      // },
    };
  },
  // created() {
  //   this.findAllCourses();
  // },
  // methods: {
  //   handleSelect(key, keyPath) {
  //     console.log(key, keyPath);
  //   },
  //   findAllCourses() {
  //     this.$axios.get("/public/index/findAllCourses")
  //         .then((res) => {
  //           this.courses = res.data
  //         })
  //         .catch(error => {
  //           this.$message({
  //             type: 'error',
  //             message: "查询失败，原因是" + error.data.message
  //           });
  //         });
  //   },
  // }

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

.el-header{
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
#mainBox{
  margin: 0 auto;
  width: 1200px;
  padding: 0px;
}
#daohanglan .el-menu-item{
  width: 216px;
  text-align: center;
}
#index_lunbo {
  width: 1200px;
}
#box1 {
  height: 400px;
  margin-bottom: 30px;
  margin-top: 30px;
}
#box2 {
  height: 400px;
  margin-bottom: 30px;
  margin-top: 30px;
}
.first-box {
  padding-left: 30px;
  padding-right: 30px;
}
.IndexContent {
  color: #505458;
  line-height:30px;
}

#Course-content {
  width: 710px;
  height: 400px;
  background-color: #cac6c6;
  float: left;
  margin-right: 20px;
}
#notice {
  width: 350px;
  height: 400px;
  background-color: #eaeaea;
  float: left;
}
.second-box {
  width: 323px;
  height: 400px;
  background-color: #eaeaea;
  float: left;
  margin-right: 25px;
  padding-left: 30px;
  padding-right: 30px;
}
#second-box-3{
  margin-right: 0px;
}
.h4{
  font-size: 18px;
  font-weight: 900;
  display: inline-block;
  border-bottom:2px solid #409eff;
}

.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}
.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}
.el-carousel__item:nth-child(2n+1) {
  background-color: #d3dce6;
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