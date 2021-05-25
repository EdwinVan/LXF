<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="bookName" placeholder="请输入书籍名称" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchBookByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增书籍</el-button>
    </div>
    <div>
      <el-table
          @selection-change="handleSelectionChange"
          :data="books"
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
            prop="bookname"
            label="书籍名称"
            width="100">
        </el-table-column>
        <el-table-column
            prop="bookinc"
            label="书籍简介"
            width="600">
        </el-table-column>
        <el-table-column
            prop="publisher"
            label="出版单位"
            width="100">
        </el-table-column>
        <el-table-column
            prop="author"
            label="作者"
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteBooks">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" v-if="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="book">
        <el-form-item label="书籍名称" :label-width="formLabelWidth" prop="bookname">
          <el-input v-model="form.bookname" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="书籍简介" :label-width="formLabelWidth" prop="bookinc">
          <el-input v-model="form.bookinc" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="出版单位" :label-width="formLabelWidth" prop="publisher">
          <el-input v-model="form.publisher" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="作者" :label-width="formLabelWidth" prop="author">
          <el-input v-model="form.author" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitBook">确 定</el-button>
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
      bookName: '',
      multipleSelection:[],
      dialogTitle: {
        addBook: "新增书籍",
        editBook: "编辑书籍"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入书籍名称' }
        ],
        introduction: [
          { required: true, message: '请输入书籍简介' }
        ],
        kind: [
          { required: true, message: '请输入书籍种类' }
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
      books:[],
      msg: '',
      search: '',
      dialogFormVisible: false,
      form: {
        bookname: '',
        bookinc: '',
        publisher: '',
        author: '',
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllBooks();
  },
  watch:{
    bookName () {
      this.findAllBooks();
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
    searchBookByName() {
      if (this.bookName !== '') {
        this.$axios.get("/book/findBookByName?name=" + this.bookName).then((resp) => {
          this.books = resp.data;
        }).catch((error) => {
          this.$message({
            type: 'error',
            message: "查询失败，原因是" + error.data.message
          });
        })
      }
    },
    deleteBooks() {
      this.$confirm('此操作将永久删除书籍, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach((item) => {
          ids += 'ids=' + item.uid + '&'
        });
        this.$axios.post("/book/deleteBooksByIds" + ids).then((resp) => {
          if (resp) {
            this.findAllBooks();
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
    submitBook () {
      if (this.dialogStatus === 'addBook'){
        this.addBook();
      } else if(this.dialogStatus === "editBook") {
        this.editBook();
      }
    },
    findAllBooks() {
      this.$axios.get("/book/findAllBooks")
          .then((res) => {
            this.books = res.data
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
      this.dialogStatus = "editBook";
      this.form.uid = row.uid;
      this.form.bookname = row.bookname;
      this.form.bookinc = row.bookinc;
      this.form.publisher = row.publisher;
      this.form.author = row.author;
    },
    handleDelete(row) {
      this.$confirm('此操作将永久删除该书籍, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/book/deleteBook?uid=" + row.uid).then((resp) => {
          this.$message.success("删除成功!")
          this.findAllBooks();
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
      this.form.bookname = '';
      this.form.bookinc = '';
      this.form.publisher = '';
      this.form.author = '';


      this.dialogFormVisible = true;
      this.dialogStatus = "addBook";
    },
    addBook () {
      this.$refs.book.validate((valid) => {
        if (valid) {
          this.$axios.post("/book/addBook",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllBooks();
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
    editBook () {
      this.$axios.post("/book/updateBook",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllBooks();
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
