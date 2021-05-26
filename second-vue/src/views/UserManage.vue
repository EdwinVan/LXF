<template>
    <div>
        <el-button type="primary" @click="addUser" style="margin-top:50px;margin-bottom:5px;float:right;">新增用户</el-button>
        <el-table
                :data="userData"
                border
                style="width: 100%">
            <el-table-column
                    prop="name"
                    label="中文名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="username"
                    label="登录名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="address"
                    label="地址">
            </el-table-column>
            <el-table-column
                    prop="enabled"
                    label="是否启用">
                <template slot-scope="scope">
                    <el-tag size="small" type="success" v-if="scope.row.enabled">已启用</el-tag>
                    <el-tag size="small" type="danger" v-else>未启用</el-tag>
                </template>
            </el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button
                            size="mini"
                            @click="showEditView(scope.$index, scope.row)">编辑</el-button>
                    <el-button
                            size="mini"
                            type="danger"
                            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
            <el-form :model="user" :rules="rules" ref="user">
                <el-form-item label="中文名" :label-width="formLabelWidth" prop="name">
                    <el-input v-model="user.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="英文名" :label-width="formLabelWidth" prop="username">
                    <el-input v-model="user.username"></el-input>
                </el-form-item>
                <el-form-item label="密码" :label-width="formLabelWidth" prop="password">
                    <el-input v-model.number="user.password" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="手机" :label-width="formLabelWidth" prop="phone">
                    <el-input v-model.number="user.phone" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="地址" :label-width="formLabelWidth" prop="address">
                    <el-input v-model.number="user.address" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="座机" :label-width="formLabelWidth" prop="telephone">
                    <el-input v-model.number="user.telephone" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="是否可用" :label-width="formLabelWidth" prop="enabled">
                    <el-switch
                            v-model="user.enabled"
                            active-text="启用"
                            inactive-text="禁用">
                    </el-switch>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="submit">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
    export default {
        name: "UserManage",
        data () {
            return {
                userData:[],
                dialogTitle: {
                    addUser: "新增用户",
                    editUser: "编辑用户"
                },
                dialogStatus: "",
                dialogFormVisible: false,
                user:{
                    enabled:false
                },
                formLabelWidth: "120px",
                rules: {
                    name: [
                        { required: true, message: '请输入姓名', trigger: 'blur' }
                    ],
                    username: [
                        { required: true, message: '请输入登录名', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, message: '密码不能为空'},
                        { type: 'number', message: '年龄必须为数字值'}
                    ]
                },
            }
        },
        created() {
            this.findAllUsers();
        },
        methods: {
            showEditView (row) {
                this.user = row;
                this.dialogFormVisible = true;
                this.dialogStatus = "editUser";
            },
            submit () {
                if (this.dialogStatus === 'addUser'){
                    this.submitUser();
                } else if(this.dialogStatus === "editStudent") {
                    this.editUser();
                }
            },
            editUser () {

            },
            submitUser () {
                this.$refs.user.validate((valid) => {
                    if (valid) {
                        this.$axios.post("/user/addUser",this.user).then( (resp)=>{
                            if (resp) {
                                this.dialogFormVisible = false;
                                this.user = {}
                                this.$message.success("添加成功！");
                                this.findAllUsers();
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
            addUser () {
                this.dialogFormVisible = true;
                this.dialogStatus = "addUser";
            },
            findAllUsers () {
                this.$axios.get("user/findAllUsers").then ( (resp)=>{
                    this.userData = resp.data
                }).catch( (error)=>{
                    this.$message({
                        type: 'error',
                        message: "查询失败，原因是"+error.data.message
                    });
                })
            },
            handleDelete (index ,data) {
                this.$confirm('此操作将删除此用户, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.$axios.post("/user/deleteUser?id="+data.id).then(resp=>{
                        this.findAllUsers();
                        this.$message({
                            type: 'success',
                            message: '删除成功'
                        })
                    })
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });
            },
        }
    }
</script>

<style scoped>

</style>