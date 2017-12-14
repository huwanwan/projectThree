<template>
    <main id="w_main">
        <h3>历史搜索<span @click="clear" v-show="history.length>0">[清空历史]</span></h3>
        <p v-if="history.length>0">
            <span v-for="item in history" v-text="item" :key="item" @click="searchWord($event)"></span>
        </p>
    </main>
</template>
<script>
    import '../../scss/history.scss';
    import http from '../../utils/reqAjax.js';
    export default {
        data:function(){
            return{
                history:[],
                user:''
            }
        },
        methods:{
            searchWord:function(ev){
                // 点击历史搜索的内容,跳到详情页面;
                this.$parent.keyWord = ev.target.innerText;
                this.$parent.backSearch = true;
                this.$router.push({name:'searchlist'});
            },
            clear:function(){
                // 点击清空搜索历史,调用父级路由的清空函数;
                this.$parent.clearWord();
            }
        },
        mounted:function(){
            // 获取当前的登录用户,并根据用户名查询搜索历史,渲染到页面;
            this.user = localStorage.getItem("userName");
            http.post({'url':this.$parent.url,'parmas':{user:this.user}}).then((res)=>{
                if(res.data.length>0){
                    var arr = res.data.split(',');
                    arr.forEach((item)=>{
                        if(item != ""){
                            this.history.push(item);
                        }
                    })
                }
            })
        }

    }

</script>