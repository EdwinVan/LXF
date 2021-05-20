<template>
    <div>
        <el-form :model="loginForm"  :rules="rules" ref="userForm" class="login">
            <h3 class="header-title">系统登录</h3>
            <el-form-item prop="username">
                <el-input type="text" v-model="loginForm.username" placeholder="请输入用户名" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item prop="password">
                <el-input type="password" v-model="loginForm.password" autocomplete="off" placeholder="请输入密码" @keydown.enter.native="submit"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" style="width: 100%" @click="submit">登录</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    import {postKeyValueRequest} from "../config/interceptor";

    export default {
        name: "Login",
        data () {
            return {
                rules: {
                    username: [{ required: true, message: '请输入用户名', trigger: 'blur' },],
                    password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
                },
                loginForm: {
                    username: "admin",
                    password: "123456"
                }
            }
        },
        methods: {
            submit() {
                this.$refs.userForm.validate((valid) => {
                    if (valid) {
                        postKeyValueRequest("/doLogin",this.loginForm).then( (res)=> {
                            if(res.data.obj !=null) {
                                window.sessionStorage.setItem("user",JSON.stringify(res.data.obj))
                                let path = this.$route.query.redirect;
                                this.$router.replace((path === '/'||path === undefined)?"/home":path)
                            }
                        })
                    } else {
                            this.$message({
                                message: '请输入所有字段',
                                type: 'error'
                            });
                            return false
                    }
                });
            },
        }
    }
</script>

<style scoped>
    .header-title{
        text-align: center;
        color: #505458
    }
    .login {
        width: 350px;
        border-radius: 15px;
        background-clip: padding-box;
        background-color: #fff;
        margin: 150px auto;
        padding: 35px 35px 15px 35px;
        border: 1px solid #eaeaea;
        /*水平位置 垂直位置 阴影大小 阴影颜色*/
        box-shadow: 0 0 25px #cac6c6;
    }
</style>
