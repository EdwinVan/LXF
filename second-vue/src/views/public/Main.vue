<template>
  <div>
    <div class="MainHeader">
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
            <el-button type="text" class="top-button" @click="gotolink">
              <a>登录</a>
            </el-button>
          </div>
        </el-col>
      </el-row>
    </div>
    <div class="block">
      <span class="demonstration"></span>
      <el-carousel height="500px">
        <el-carousel-item v-for="item in imgList" :key="item.url">
          <img :src="item.url" alt />
        </el-carousel-item>
      </el-carousel>
    </div>
    <div id="mainMain">
      <div class="mainCenter">
        <div class="mainHeader">
          <div class="mainHeaderTitle">
            相关课程
          </div>
          <div class="mainHeaderDetail">
            介绍
          </div>
        </div>
        <div class="mainList">
          <div class="ListItem" @click="gotolink2">
            <el-image
                :src="require('../../assets/book/1.jpg')"
                :fit="fit"></el-image>
            <p>马克思主义基本原理</p>
          </div>
          <div class="ListItem">
            <el-image
                :src="require('../../assets/book/2.jpg')"
                :fit="fit"></el-image>
            <p>Java从入门到精通</p>
          </div>
          <div class="ListItem">
            <el-image
                :src="require('../../assets/book/3.jpg')"
                :fit="fit"></el-image>
            <p>Python数据分析与处理</p>
          </div>
          <div class="ListItem">
            <el-image
                :src="require('../../assets/book/4.jpg')"
                :fit="fit"></el-image>
            <p>大数据与人工智能</p>
          </div>
          <div class="ListItem">
            <el-image
                :src="require('../../assets/book/5.jpg')"
                :fit="fit"></el-image>
            <p>心理学的魅力</p>
          </div>
          <div class="ListItem">
            <el-image
                :src="require('../../assets/book/6.jpg')"
                :fit="fit"></el-image>
            <p>7天速成HTML5</p>
          </div>
          <div class="ListItem">
            <el-image
                :src="require('../../assets/book/6.jpg')"
                :fit="fit"></el-image>
            <p>css基础教程</p>
          </div>
          <div class="ListItem">
            <el-image
                :src="require('../../assets/book/7.jpg')"
                :fit="fit"></el-image>
            <p>数据库理论</p>
          </div>
        </div>
      </div>
    </div>
  </div>

</template>

<script>
export default {
  name: "Main",
  data() {
    return {
      current:'',
      imgList: [
        {
          url: require('../../assets/img/1.jpg')
        }, {
          url: require('../../assets/img/2.jpg')
        }, {
          url: require('../../assets/img/4.jpg')
        }, {
          url: require('../../assets/img/3.jpg')
        }
      ],
    }
  },
  methods: {
    gotolink(){
      this.$router.replace('/login')
    },
    gotolink2(){
      this.$router.replace('/index')
    }
  }
}
</script>

<style >
.MainHeader {
  background-color: #1357ac;
}
#mainMain{
  background:#f4f8ff;
}
.mainCenter{
  margin: 0 auto;
  width: 1500px;
}
.mainHeader {
  text-align: center;
  padding: 64px 0 40px;
}
.mainHeaderTitle {
  font-size: 40px;
  font-weight: 500;
  color: #1f2023
}
.mainHeaderDetail {
  height: 32px;
  font-size: 20px;
  color: #74787c;
  margin-top: 16px;
}
.mainList {
  height: 1000px;
  display: flex;
  flex-flow: row wrap;
  align-content: flex-start;
  justify-content: space-between;
}
.ListItem {
  padding-top: 30px;
  width: 351px;
  height: 350px;
  text-align: center;
  background: #fff;
  margin-top: 24px;
}
.ListItem .el-image {
  width: 210px;
  height: 230px;
}
.ListItem p {
  font-size: 18px;
  font-weight: 900;
}

.ListItem:hover {
  cursor:pointer;
}

</style>