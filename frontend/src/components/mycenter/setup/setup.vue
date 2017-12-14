<template>
    <div class='setUp'>
        <header id='setHeader'>
                <span @click="$router.push({name:'mycenter'})"><i class='el-icon-arrow-left'></i></span>
                <span>设置</span>
        </header>
        <div class='setBox'>
            <div class='setCan'>
                <span>清除缓存</span>
                <span>5.70M</span>
            </div>
            <div class="setCan" style='background:none;font-size:0.32rem'>
                <span>接收通知</span>
            </div>
            <div class='setCan'>
                <span>消息推送设置</span>
                <span><i class='el-icon-arrow-right'></i></span>
            </div>
            <div class='setCan'>
                <span>评分鼓励一下</span>
                <span><i class='el-icon-arrow-right'></i></span>
            </div>
            <div class='setCan'>
                <span>关于我们</span>
                <span>V 1.0.0<i class='el-icon-arrow-right'></i></span>
            </div>
        </div>
        <div class="logOut" v-show="show" @click='loginOff'><p>退出登录</p></div>
    </div>
</template>

<script>
    import '../../../scss/base.scss'; 
    import '../../../scss/setup.scss'; 

    export default{
        data:function(){
            return {
                show:0
            }
        },
        methods:{
            loginOff:function(){
                 window.localStorage.removeItem("userName");
                 this.$router.push({name:'login'});
                 this.show = 0 ;
            }
        },
        mounted:function(){
            this.show = Number(this.$route.params.res);
            //onsole.log(typeof this.show)
        }
    }
</script>