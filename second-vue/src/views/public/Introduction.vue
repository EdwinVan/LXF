<template>
  <el-container>
    <el-header id="top" class="introductionTop" style="height: 100px">
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
            <el-button type="text" class="top-button" ><a @click="currents('/#/')">登录</a></el-button>
          </div>
        </el-col>
      </el-row>
    </el-header>
    <el-main id="introductionMainBox">
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
            课程简介
          </div>
          <div class="leftAsideTab">
            <el-menu
                default-active="2"
                class="el-menu-vertical-demo"
                @open="handleOpen"
                @close="handleClose">
              <el-menu-item  :class="{active : activeBtn === 0}" @click="goAnchor('#section-0',0)">
                <span slot="title">课程介绍</span>
              </el-menu-item>
              <el-menu-item  :class="{active : activeBtn === 1}" @click="goAnchor('#section-1',1)">
                <span slot="title">教学方法</span>
              </el-menu-item>
              <el-menu-item :class="{active : activeBtn === 2}" @click="goAnchor('#section-2',2)">
                <span slot="title">课程安排</span>
              </el-menu-item>
            </el-menu>
          </div>

        </div>
        <div class="mainRight">
          <div id="section-0" style="height: 300px">
            <div class="mainRightTop">
              <i class="el-icon-document-copy"></i>
              <div class="h4">课程介绍</div>
              <div class="seat">
                <el-breadcrumb separator="/">
                  <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
                  <el-breadcrumb-item :to="{ path: 'introduction' }">课程简介</el-breadcrumb-item>
                </el-breadcrumb>
              </div>
            </div>
            <div class="mainRightContent">
              <p>{{courses[0].introduction}}</p>
              <el-divider></el-divider>
            </div>
          </div>
          <div id="section-1" style="height: 300px">
            <div class="mainRightTop">
              <i class="el-icon-document-copy"></i>
              <div class="h4">教学方法</div>
            </div>
            <div class="mainRightContent">
              <p>{{courses[0].introduction}}</p>
              <el-divider></el-divider>
            </div>
          </div>

          <div id="section-2" style="height: 300px">
            <div class="mainRightTop">
              <i class="el-icon-document-copy"></i>
              <div class="h4">课程安排</div>
            </div>
            <div class="mainRightContent">
              <p>{{courses[0].introduction}}</p>
              <el-divider></el-divider>
            </div>
          </div>

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
  name: "introduction",
  data() {
    return {
      activeIndex: '1',
      activeIndex2: '1',
      current:'',
      tabPosition: 'left',
      courses:[],
      msg: '',
      search: '',
    };
  },
  created() {
    this.findAllCourses();
    this.listenerFunction()
  },

  watch:{
    courseName () {
      this.findAllCourses();
    }
  },

  methods: {
    goAnchor(selector, index) {
      this.activeBtn = index
      this.$el.querySelector(selector).scrollIntoView()
    },
    gotolink(){
      this.$router.replace('/login')
    },
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    handleSelect(index){
      this.$router.push(index);
    },
    currents(current){
      this.$router.push(current);
    },
    listenerFunction(e) {
      document.addEventListener('scroll', this.handleFixed, true)
    },
    handleFixed() {
      // 获取滚动条元素对象
      // let ele = document.getElementsByClassName('page-router-wrapper')[0]
      let ele = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
      console.log(ele);
      // 获取需要固定的元素对象
      let editorNav = document.getElementById('leftAside')
      console.log(editorNav)
      // 判断滚动条的高度（大于240，给固定元素添加 class）
      if (ele > 150) {
        console.log("1");
        editorNav.classList.add("suspension")
      } else {
        editorNav.classList.remove('suspension')
      }
    },
    beforeDestroy() {
      document.removeEventListener('scroll', this.listenerFunction)
    },
    handleScroll(e) {
      const scrollbarEl = this.$refs.scrollbar.wrap
      scrollbarEl.onscroll = (e) => {
        if (scrollbarEl.scrollTop < 300) {
          this.activeBtn = 0
        } else if (scrollbarEl.scrollTop > 300 && scrollbarEl.scrollTop < 422) {
          this.activeBtn = 1
        } else if (scrollbarEl.scrollTop > 422) {
          this.activeBtn = 2
        }
      }
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

.introductionTop{
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
#introductionMainBox{
  margin: 0 auto;
  width: 1200px;
  padding: 0px;
  height: 1200px;
}
#daohanglan .el-menu-item{
  width: 216px;
  text-align: center;

}
.mainContent {
  margin-top: 20px;
}
#leftAside {
  width: 300px;
  float: left;
}
.leftAsideTop {
  background-image: url("../../assets/list-nav.png");
  line-height:100px;
  padding-left: 60px;
  font-size: 20px;
  font-weight: 900;
  color: #eaeaea;
}
.leftAsideTab {
  margin-left: 20px;
  font-size: 18px;
}
.suspension {
  top:60px;
  position: fixed;
}


.mainRight{
  float: right;
  width: 850px;
  height: 50px;
  border-bottom: 1px solid #eaeaea;
}
.mainRightTop i {
  font-size: 30px;
  color: #1357ac;
  margin-right: 10px;
}
.seat {
  float: right;
  margin-top: 10px;
}
.mainRightContent {
  margin-top: 40px;
  margin-bottom: 20px;
  color: #505458;
  line-height: 33px;
  font-size: 17px;
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