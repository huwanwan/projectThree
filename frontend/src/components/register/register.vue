<template>
    <div id="register" v-loading="loading" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.5)">
        <header id="w_header">
            <span :class="icon" @click="goBack"></span>    
            <h1>注册</h1>
            <span>帮助</span>    
        </header>
        <main id="w_main">
            <div class="form">
                <p>
                    <label>帐号</label>
                    <input type="text" placeHolder="手机/邮箱" v-model="registMation.username" @blur="testName" />
                    <span v-if="test.name">
                        <i v-if="show.name" class="el-icon-success"></i>
                        <i v-else class="el-icon-error"></i>      
                    </span>
                </p>
                <p>
                    <label>密码</label>
                    <input type="password" placeHolder="输入密码" v-model="registMation.password" @input="testPsw" />
                    <span v-if="test.psw">
                        <i v-if="show.psw" class="el-icon-success"></i>
                        <i v-else class="el-icon-error"></i>      
                    </span>
                </p>
            </div>
            <p class="disUser" v-if="disName">该帐号已注册,请直接登录!</p>
            <p>
                <span>* 帐号注册请输入手机/邮箱注册</span>    
                <span>* 密码长度7-12个字符,支持下数字、字母、下划线</span>    
            </p>
        </main>
        <footer id="w_footer">
            <p>
            用户在使用帐号期间，须遵守与互联网信息发布相关的法律、法规及通常适用的互联网一般道德和礼仪的规范，用户将自行承担用户所发布的信息内容所产生的所有法律责任,<b>用户在注册之前，应当仔细阅读本协议，并同意遵守本协议后方可成为注册用户</b>
            </p>
            <el-button class="regist disregist" type="success" disabled v-if="btn">同意协议并注册</el-button>
            <el-button class="regist" type="success" v-else @click="clickLogin">同意协议并注册</el-button>
        </footer>
    </div> 
</template>

<script>
    import '../../scss/register.scss';
    import http from '../../utils/reqAjax';
    export default{
        data:function(){
            return {
                icon:'el-icon-arrow-left',
                test:{
                    name:false,
                    psw:false
                },
                show:{
                    name:false,
                    psw:false
                },
                disName:false,
                btn:true,
                loading:false,
                registMation:{
                    username:'',
                    password:''
                }
            }
        },
        methods:{
            testName:function(ev){
                //console.log(this.registMation.username)
                var reg = /(^1[34578]{1}\d{9}$)|(^[a-z\d][\w\-\.]{2,}@[\d\w]+(\.[a-z]{2,})+$)/;
                if(reg.test(this.registMation.username)){
                    var url = '/register.php?userName=' + this.registMation.username;
                    http.get({url:url}).then((response)=>{
                        if(response.data){
                            this.test.name = true;
                            this.show.name = true;
                            this.disName = false; 
                        }else{
                            this.test.name = true;
                            this.show.name = false;
                            this.disName = true;
                            
                        }
                        if(this.test.name && this.test.psw){
                            this.btn = false; 
                        }else{
                            this.btn = true;
                        }
                    })
                }else{
                    ev.target.focus();
                    this.test.name = true;
                    this.show.name = false;
                    this.btn = true;
                }

            },
            goBack:function(){
                this.$router.go(-1);
            },
            testPsw:function(){
                var reg = /^[\d\w\/]{7,12}$/;
                if(reg.test(this.registMation.password)){
                    this.test.psw = true;
                    this.show.psw = true;
                    if(this.test.name && this.test.psw){
                        this.btn = false; 
                    }else{
                        this.btn = true;
                    }
                }else{
                    this.test.psw = true;
                    this.show.psw = false;
                    this.btn = true;
                }
            },
            clickLogin:function(){
                this.loading = true;
                var url = '/register.php?userName=' + this.registMation.username + '&password=' + this.registMation.password;
                http.get({url:url}).then((response)=>{
                    this.loading = false;
                    if(response.data === 'ok'){
                        this.$router.push({name:'login'});
                    }
                })
            }
        }
    }
</script>