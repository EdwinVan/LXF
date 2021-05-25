<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="announcementName" placeholder="请输入公告名称" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchAnnouncementByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增公告</el-button>
    </div>
    <div>
      <el-table
          @selection-change="handleSelectionChange"
          :data="announcements"
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
            prop="content"
            label="公告内容"
            width="600">
        </el-table-column>
        <el-table-column
            prop="time"
            label="发布时间"
            width="100">
        </el-table-column>
        <el-table-column
            prop="publisher"
            label="发布人"
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteAnnouncements">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" v-if="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="announcement">
        <el-form-item label="公告内容" :label-width="formLabelWidth" prop="content">
          <el-input v-model="form.content" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="发布时间" :label-width="formLabelWidth" prop="time">
          <el-input v-model="form.time" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="发布人" :label-width="formLabelWidth" prop="publisher">
          <el-input v-model="form.publisher" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitAnnouncement">确 定</el-button>
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
      announcementName: '',
      multipleSelection:[],
      dialogTitle: {
        addAnnouncement: "新增公告",
        editAnnouncement: "编辑公告"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入公告名称' }
        ],
        introduction: [
          { required: true, message: '请输入公告简介' }
        ],
        kind: [
          { required: true, message: '请输入公告种类' }
        ],
        credit: [
          { required: true, message: '学分不能为空' }
        ],
      },
      announcements:[],
      msg: '',
      search: '',
      dialogFormVisible: false,
      form: {
        content: '',
        time: '',
        publisher: '',
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllAnnouncements();
  },
  watch:{
    announcementName () {
      this.findAllAnnouncements();
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
    searchAnnouncementByName() {
      if (this.announcementName !== '') {
        this.$axios.get("/announcement/findAnnouncementByName?name=" + this.announcementName).then((resp) => {
          this.announcements = resp.data;
        }).catch((error) => {
          this.$message({
            type: 'error',
            message: "查询失败，原因是" + error.data.message
          });
        })
      }
    },
    deleteAnnouncements() {
      this.$confirm('此操作将永久删除公告, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach((item) => {
          ids += 'ids=' + item.uid + '&'
        });
        this.$axios.post("/announcement/deleteAnnouncementsByIds" + ids).then((resp) => {
          if (resp) {
            this.findAllAnnouncements();
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
    submitAnnouncement () {
      if (this.dialogStatus === 'addAnnouncement'){
        this.addAnnouncement();
      } else if(this.dialogStatus === "editAnnouncement") {
        this.editAnnouncement();
      }
    },
    findAllAnnouncements() {
      this.$axios.get("/announcement/findAllAnnouncements")
          .then((res) => {
            this.announcements = res.data
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
      this.dialogStatus = "editAnnouncement";
      this.form.uid = row.uid;
      this.form.content = row.content
      this.form.time = row.time;
      this.form.publisher = row.publisher;
    },
    handleDelete(row) {
      this.$confirm('此操作将永久删除该公告, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/announcement/deleteAnnouncement?uid=" + row.uid).then((resp) => {
          this.$message.success("删除成功!")
          this.findAllAnnouncements();
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
      this.form.content = '';
      this.form.time = '';
      this.form.publisher = '';


      this.dialogFormVisible = true;
      this.dialogStatus = "addAnnouncement";
    },
    addAnnouncement () {
      this.$refs.announcement.validate((valid) => {
        if (valid) {
          this.$axios.post("/announcement/addAnnouncement",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllAnnouncements();
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
    editAnnouncement () {
      this.$axios.post("/announcement/updateAnnouncement",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllAnnouncements();
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
