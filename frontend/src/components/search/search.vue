<template>
    <div id="searchGoods">
        <header id="w_header">
            <i class="el-icon-arrow-left" v-if="backSearch" @click="goback"></i>
            <p><input type="text" placeHolder="好酒不怕巷子深" @input="clear=true" @blur="hideClear" @click="upload" v-model="keyWord" /><i class="el-icon-circle-close-outline" v-if="clear" @click="clearWord"></i></p>
            <span @click="goback">取消</span>
        </header>
        <router-view></router-view>
    </div> 
</template>
<script>
    import '../../scss/search.scss';
    import http from '../../utils/reqAjax.js';
    export default {
        data:function(){
            return{
                clear:false,
                keyWord:'',
                user:'',
                backSearch:false,
                url:'keyWord.php'
            }
        },
        methods:{
            hideClear:function(){
                // 当输入框失去焦点时候,清除icon隐藏;
                this.clear = false;
                if(this.keyWord === ""){
                    return;
                }
                // 根据keyWord请求数据库,加入搜索历史,并跳转到搜索列表页面;
                let parmas = {'user':this.user,'keyWord':this.keyWord};
                this.historyWord({'url':this.url,'parmas':parmas});
                // 返回页面icon显示;
                this.backSearch = true;
                this.$router.push({name:'searchlist'});
            },
            upload:function(){
                // 点击输入框跳转到历史信息页面;
                this.$router.push({name:'history'});
            },
            historyWord:function(opt){
                http.post(opt).then((res)=>{
                    if(res.data !== "ok"){}
                })
            },
            clearWord:function(){
                // 根据用户名请求数据库,清除搜索的历史记录;
                let parmas = {'user':this.user,'clear':'true'};
                this.historyWord({'url':this.url,'parmas':parmas})
                // 更新data数据;
                this.keyWord = '';
                this.$children[0].history = [];
            },
            goback:function(ev){
                // 点击的源对象是span的时候,跳回主页;
                if(ev.target.tagName.toLowerCase() == 'span'){
                    this.$router.push({name:'home'});
                }else{
                    this.$router.go(-1);
                }
                this.backSearch = false;
            }
        },
        mounted(){
            // 获取当前登录用户;
            this.user = this.$children[0].user;
        }
    }

</script>