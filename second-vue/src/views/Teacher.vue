<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="teacherName" placeholder="请输入教师姓名" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchTeacherByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增教师</el-button>
    </div>
    <div>
      <el-table
          @selection-change="handleSelectionChange"
          :data="teachers"
          border>
        <el-table-column
            type="selection"
            width="55">
        </el-table-column>
        <el-table-column
            prop="uid"
            label="工号"
            width="50">
        </el-table-column>
        <el-table-column
            prop="name"
            label="姓名"
            width="100">
        </el-table-column>
        <el-table-column
            prop="sex"
            label="性别"
            width="100">
        </el-table-column>
        <el-table-column
            prop="nation"
            label="民族"
            width="100">
        </el-table-column>
        <el-table-column
            prop="age"
            label="年龄"
            width="100">
        </el-table-column>
        <el-table-column
            prop="party"
            label="党员"
            width="100">
          <template slot-scope="scope">
            <template v-if="scope.row.party">是</template>
            <template v-else>否</template>
          </template>
        </el-table-column>

        <el-table-column
            prop="area"
            label="地区"
            width="180">
        </el-table-column>

        <el-table-column
            prop="address"
            label="住址"
            width="180">
        </el-table-column>
        <el-table-column
            prop="phone"
            label="手机号"
            width="100">
        </el-table-column>
        <el-table-column
            prop="email"
            label="邮箱"
            width="150">
        </el-table-column>

        <el-table-column
            prop="school"
            label="毕业学校"
            width="130 ">
        </el-table-column>
        <el-table-column
            prop="speciality"
            label="专业"
            width="100">
        </el-table-column>
        <el-table-column
            prop="qualification"
            label="学历"
            width="100">
        </el-table-column>
        <el-table-column
            prop="workDate"
            label="入职时间"
            width="100">
        </el-table-column>
        <el-table-column
            prop="college"
            label="所属学院"
            width="100">
        </el-table-column>
        <el-table-column
            prop="course"
            label="授课"
            width="100">
        </el-table-column>
        <el-table-column
            prop="title"
            label="职称"
            width="100">
        </el-table-column>
        <el-table-column
            prop="hobby"
            label="爱好"
            width="100">
        </el-table-column>

        <el-table-column
            prop="rate"
            label="年度评分"
            width="100">
        </el-table-column>
        <el-table-column
            prop="ability"
            label="能力"
            width="100">
        </el-table-column>
        <el-table-column
            prop="evaluate"
            label="个人评价"
            width="150">
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteTeachers">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" v-if="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="teacher">
        <el-form-item label="姓名" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="性别" :label-width="formLabelWidth" prop="sex">
          <template>
            <el-radio v-model="form.sex" label="男">男</el-radio>
            <el-radio v-model="form.sex" label="女">女</el-radio>
          </template>
        </el-form-item>
        <el-form-item label="民族" :label-width="formLabelWidth" prop="nation">
          <el-input v-model="form.nation" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="年龄" :label-width="formLabelWidth" prop="age">
          <el-input-number v-model="form.age" size="small" :min="1" :max="70" label="年龄"></el-input-number>
        </el-form-item>
        <el-form-item label="党员" :label-width="formLabelWidth" prop="party">
          <el-switch
              v-model="form.party"
              active-color="#409eff"
              inactive-color="#dcdfe6"
              active-text="是"
              inactive-text="否">
          </el-switch>
        </el-form-item>

        <el-form-item label="地区" :label-width="formLabelWidth" prop="area">
          <el-cascader
              v-model="form.area"
              placeholder="请选择地区"
              :props="{ expandTrigger: 'hover',
              value: 'name',
              label:'name'}"
              :options="areaData"
          ></el-cascader>
        </el-form-item>

        <el-form-item label="住址" :label-width="formLabelWidth" prop="address">
          <el-input v-model="form.address" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号" :label-width="formLabelWidth" prop="phone">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" :label-width="formLabelWidth" prop="email">
          <el-input v-model="form.email" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="毕业学校" :label-width="formLabelWidth" prop="school">
          <el-input v-model="form.school" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="专业" :label-width="formLabelWidth" prop="speciality">
          <el-input v-model="form.speciality" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="学历" :label-width="formLabelWidth" prop="qualification">
          <el-select v-model="form.qualification" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in qualifications"
                :key="item.value"
                :value="item.label">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="入职时间" :label-width="formLabelWidth" prop="workDate">
          <el-date-picker
              v-model="form.workDate"
              type="date"
              placeholder="选择日期"
              format="yyyy 年 MM 月 dd 日"
              value-format="yyyy-MM-dd">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="所属学院" :label-width="formLabelWidth" prop="course">
          <el-select v-model="form.college" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in colleges"
                :key="item.value"
                :value="item.label">
            </el-option>
          </el-select>
        </el-form-item>


        <el-form-item label="授课" :label-width="formLabelWidth" prop="course">
          <el-input v-model="form.course" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="职称" :label-width="formLabelWidth" prop="title">
          <el-select v-model="form.title" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in titles"
                :key="item.value"
                :value="item.label">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="爱好" :label-width="formLabelWidth" prop="hobby">
          <el-checkbox-group v-model="form.hobby">
            <el-checkbox label="运动"></el-checkbox>
            <el-checkbox label="音乐"></el-checkbox>
            <el-checkbox label="舞蹈"></el-checkbox>
            <el-checkbox label="游戏"></el-checkbox>
            <el-checkbox label="看书"></el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="年度评分" :label-width="formLabelWidth" prop="rate">
          <el-rate
              v-model="form.rate"
              :colors="rateColors">
          </el-rate>
        </el-form-item>
        <el-form-item label="能力" :label-width="formLabelWidth" prop="ability">
          <el-slider
              v-model="form.ability"
              >
          </el-slider>
        </el-form-item>
        <el-form-item label="个人评价" :label-width="formLabelWidth" prop="evaluate">
          <el-input type="textarea" v-model="form.evaluate"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitTeacher">确 定</el-button>
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
      teacherName: '',
      multipleSelection:[],
      dialogTitle: {
        addTeacher: "新增教师",
        editTeacher: "编辑教师"
      },
      dialogStatus: "",
      rules: {
        name: [
          // { required: true, message: '请输入姓名', trigger: 'blur' },
          // { min: 6, max: 16, message: "长度在 6 到 16 个字符", trigger: ['blur', 'change'] },
          // { pattern: /^[\u4E00-\u9FA5A-Za-z]+$/, message: '请输入正确的名字', trigger: ['blur', 'change']}
        ],
        sex: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        nation: [
          { required: true, message: '请输入民族', trigger: 'blur' }
        ],
        age: [
          { required: true, message: '年龄不能为空'}
        ],
        party: [
          { required: true, message: '选择不能为空'}
        ],
        area: [
          { required: true, message: '选择不能为空'}
        ],
        address: [
          { required: true, message: '请输入住址', trigger: 'blur'}
        ],
        phone: [
          { required: true, message: '请输入手机号', trigger: 'blur'},
          // {pattern: /^1[0-9]{10}$/, message: '请输入正确的手机号码', trigger: ['blur', 'change']}
        ],
        email: [
          { required: true, message: '请输入邮箱', trigger: 'blur'},
          // {type: "email", required: true, message: "邮箱格式不正确", trigger: ['blur', 'change']}
        ],
        school: [
          { required: true, message: '请输入毕业学校', trigger: 'blur'}
        ],
        speciality: [
          { required: true, message: '请输入专业', trigger: 'blur'}
        ],
        qualification: [
          { required: true, message: '请选择学历', trigger: 'blur'}
        ],
        workDate: [
          { required: true, message: '请选择入职时间', trigger: 'blur'}
        ],
        college: [
          { required: true, message: '请输入所属学院', trigger: 'blur'}
        ],
        course: [
          { required: true, message: '请输入任课', trigger: 'blur'}
        ],
        title: [
          { required: true, message: '职称不能为空'}
        ],
        hobby: [
          { required: true, message: '请选择爱好'}
        ],
        rate: [
          { required: true, message: '请选择评分'}
        ],
        ability: [
          { required: true, message: '请选择能力范围'}
        ],
        evaluate: [
          { required: true, message: '个人评价不能为空'}
        ]

      },

      areaData: [],

      colleges: [{
        value: '1',
        label: '数学科学学院'
      }, {
        value: '2',
        label: '音乐学院'
      }, {
        value: '3',
        label: '计算机与信息科学学院'
      },{
        value: '4',
        label: '化学学院'
      },{
        value: '5',
        label: '美术学院'
      },{
        value: '6',
        label: '经济与管理学院'
      },{
        value: '7',
        label: '马克思主义学院'
      }
      ],

      titles: [{
        value: '1',
        label: '助教'
      }, {
        value: '2',
        label: '讲师'
      }, {
        value: '3',
        label: '副教授'
      }, {
        value: '4',
        label: '教授'
      }],

      qualifications: [{
        value: '1',
        label: '本科'
      }, {
        value: '2',
        label: '硕士'
      }, {
        value: '3',
        label: '博士'
      }],

      rateColors: ['#99A9BF', '#F7BA2A', '#FF9900'],

      msg: '',
      teachers:[],
      search: '',
      dialogFormVisible: false,
      form: {
        name: '',
        age: '',
        sex: '',
        nation: '',
        party: '',
        address: '',
        area: [],
        phone: '',
        email: '',
        school: '',
        speciality: '',
        qualification: '',
        workDate: '',
        college: '',
        course: '',
        title: '',
        hobby: [],
        rate: '',
        ability: '',
        evaluate:'',
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllTeachers();
    this.areaData = AreaJson;
    for (var i = 0; i < this.areaData.length; i++) {
      if (this.areaData[i].children.length == 0) {
        delete this.areaData[i].children //解决因为省级区域没有下级市的BUG
      }
    }
  },
  watch:{
    teacherName () {
      this.findAllTeachers();
    }
  },
  methods: {
    // deleteFile (file) {
    //   console.log(file)
    // },

    handleSuccess(file) {
      const filename = file.name;
      this.$message({
        message: '文件上传成功！',
        type: 'success'
      });
    },
    searchTeacherByName() {
      if (this.teacherName !== '') {
        this.$axios.get("/teacher/findTeacherByName?name=" + this.teacherName).then((resp) => {
          this.teachers = resp.data;
        }).catch((error) => {
          this.$message({
            type: 'error',
            message: "查询失败，原因是" + error.data.message
          });
        })
      }
    },
    deleteTeachers() {
      this.$confirm('此操作将永久删除教师, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach((item) => {
          ids += 'ids=' + item.uid + '&'
        });
        this.$axios.post("/teacher/deleteTeachersByIds" + ids).then((resp) => {
          if (resp) {
            this.findAllTeachers();
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
    submitTeacher() {
      this.$refs.teacher.validate((valid) => {
        if (valid) {
          if (this.dialogStatus === 'addTeacher') {
            this.addTeacher();
          } else if (this.dialogStatus === "editTeacher") {
            this.editTeacher();
          }
        } else {
          this.$message({
            message: '请输入所有字段',
            type: 'error'
          })
          return false;
        }
      })
    },
    findAllTeachers() {
      this.$axios.get("/teacher/findAllTeachers")
          .then((res) => {
            this.teachers = res.data
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
      this.dialogStatus = "editTeacher";
      this.form.uid = row.uid;
      this.form.name = row.name;
      this.form.age = row.age;
      this.form.sex = row.sex;
      this.form.nation = row.nation;
      this.form.party = row.party;
      this.form.area = row.area.split(" ");
      this.form.address = row.address;
      this.form.phone = row.phone;
      this.form.email = row.email;
      this.form.school = row.school;
      this.form.speciality = row.speciality;
      this.form.qualification = row.qualification;
      this.form.workDate = row.workDate;
      this.form.college = row.college;
      this.form.course = row.course;
      this.form.title = row.title;
      this.form.hobby = row.hobby.split(",");
      this.form.rate = row.rate;
      this.form.ability = row.ability;
      this.form.evaluate = row.evaluate;
    },
    handleDelete(row) {
      this.$confirm('此操作将永久删除该教师, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/teacher/deleteTeacher?uid=" + row.uid).then((resp) => {
          this.$message.success("删除成功!")
          this.findAllTeachers();
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
      this.form.age = '';
      this.form.sex = '';
      this.form.nation = '';
      this.form.party = '';
      this.form.address = '';
      this.form.phone = '';
      this.form.email = '';
      this.form.school = '';
      this.form.speciality = '';
      this.form.qualification = '';
      this.form.workDate = '';
      this.form.college = '';
      this.form.course = '';
      this.form.title = '';
      this.form.hobby = [];
      this.form.rate = '';
      this.form.ability = '';
      this.form.evaluate = '';

      this.dialogFormVisible = true;
      this.dialogStatus = "addTeacher";
    },
    addTeacher() {
      this.form.area = this.form.area.join(" ");
      this.form.hobby = this.form.hobby.join(",");
      this.$axios.post("/teacher/addTeacher", this.form).then((resp) => {
        if (resp.data === "") {
          this.dialogFormVisible = false;
          this.$message.success("添加成功！");
          this.findAllTeachers();
        }else {
          let data = "";
          for (let i = 0; i < resp.data.length; i++) {
            data += i + 1 + "、 :" + resp.data[i].defaultMessage + "<br>"
          }
          //console.log(data);
          this.$message({
            dangerouslyUseHTMLString: true,
            message: '数据更新失败，原因是' + "<br>" + data,
            type: 'error'
          })
        }
      }).catch((error) => {
        this.form.area = this.form.area.split(" ");
        this.form.hobby = this.form.hobby.split(",");
        this.$message({
          message: '添加数据失败，原因是' + error.data.message,
          type: 'error'
        })
      })
    },
    editTeacher() {
      this.form.area = this.form.area.join(" ");
      this.form.hobby = this.form.hobby.join(",");
      this.$axios.post("/teacher/updateTeacher", this.form).then((resp) => {
        //console.log(resp.data);
        if(resp.data === ""){
          this.dialogFormVisible = false;
          this.$message.success("修改成功!");
          this.findAllTeachers();
        } else {
          let data = "";
          for (let i = 0; i <resp.data.length; i++) {
            data += i+1+"、 :"+resp.data[i].defaultMessage+"<br>"
          }
          //console.log(data);
          this.$message({
            dangerouslyUseHTMLString:true,
            message: '数据更新失败，原因是'+ "<br>"+ data,
            type: 'error'
          })
        }
      }).catch((error) => {
        this.form.area = this.form.area.split(" ");
        this.form.hobby = this.form.hobby.split(",");
        this.$message({
          message: '数据更新失败，原因是' + error.data.message,
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
