<template>
    <div id="welcome"> 
        <div id="w_main">
            <h1>
                <img :src="imgUrl" />
            </h1>
            <span class="close" @click="close">&times;</span>
            <p>
                <el-button type="primary" @click="goRegister">注册新用户</el-button>
                <el-button type="success" @click="goLogin">已有帐号,点击登录</el-button>
            </p>
        </div>
        <div class="shade"></div>
    </div>    
</template>

<script>
    import '../../scss/welcome.scss';
    export default {
        data:function(){
            return {
                imgUrl:require('../../assets/image/logo.png')
            } 
        },
        methods:{
            goLogin:function(){
                this.$router.push({name:'login'});
            },
            goRegister:function(){
                this.$router.push({name:'register'});
            },
            close:function(){
                this.$emit('close');
            }
        }
    }
</script>