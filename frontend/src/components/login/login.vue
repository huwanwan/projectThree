<template>
    <div id="login" v-loading="loading" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.5)">
        <header id="w_header">
            <span class="el-icon-arrow-left" @click="goBack"></span>    
            <span>帮助</span>    
        </header>
        <main id="w_main">
            <h2>
                <img :src="imgUrl"/>
            </h2>
            <div class="form">
                <p>
                    <input type="text" ref="userName" placeHolder="手机/邮箱" v-model="user.userName" @input="testName" @blur="clearClose('userName')" />
                    <i class="el-icon-circle-close-outline" v-if="show.userName" @click="clearVal('userName')"></i>
                </p>
                <p>
                    <input :type="type" ref="password" placeHolder="输入密码" v-model="user.password" @input="testpsw" @blur="clearClose('password')" />
                    <i class="el-icon-circle-close-outline" v-if="show.password" @click="clearVal('password')" ></i>
                    <i class="el-icon-view" @click="viewPsw"></i>
                </p>
                <p><a href="#">忘记密码?</a></p>
            </div>
        </main>
        <footer id="w_footer">
            <el-button class="login dislogin" type="success" disabled v-if="btn">登录</el-button>
            <el-button class="login" type="success" v-else @click="clickLogin">登录</el-button>
        </footer>
        <el-alert class="error" title="您输入的帐号或密码有误,请重新输入!" type="error" show-icon v-if="loginError"></el-alert>
    </div>
</template>

<script>
    import '../../scss/login.scss';
    import http from '../../utils/reqAjax.js';
    export default{
        data:function(){
            return {
                imgUrl:require('../../assets/image/logo.png'),
                user:{
                    userName:'',
                    password:''
                },
                show:{
                    userName:false,
                    password:false
                },
                type:'password',
                num:1,
                btn:true,
                loading:false,
                loginError:false
            }
        },
        methods:{
            goBack:function(){
                this.$router.push({name:'home'})
            },
            testName:function(){
                this.show.userName = true;
                this.show.password = false;
                this.btn = this.$options.methods.testBtn(this.user.userName,this.user.password);
            },
            testpsw:function(){
                this.show.password = true;
                this.show.userName = false;
                this.btn = this.$options.methods.testBtn(this.user.userName,this.user.password);
            },
            testBtn:function(userName,password){
                if(userName!='' && password!=''){
                    return false;
                }else{
                    return true;
                }
            },
            clickLogin:function(){
                this.loading = true;
                this.show.password = false;
                this.show.userName = false;
                var url = '/login.php?userName=' + this.user.userName + '&password=' + this.user.password;
                http.get({url:url}).then((response)=>{
                    this.loading = false;
                    if(response.data){
                        // 登录成功后存下用户名,跳转到主页;
                        window.localStorage.setItem("userName",this.user.userName);
                        this.$router.push({
                            name:'home'
                        })
                    }else{
                        this.loginError = true;
                    }
                })
            },
            clearVal:function(parmas){
                this.user[parmas] = '';
                this.show[parmas] = false;
            },
            clearClose:function(parmas){
                this.show[parmas] = false;
            },
            viewPsw:function(){
                if(this.type === 'password'){
                    this.type = 'text';
                }else{
                    this.type = 'password';
                }
            }
        }
    }
</script>