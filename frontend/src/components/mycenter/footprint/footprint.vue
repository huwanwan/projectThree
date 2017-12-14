<template>
    <div class='footprint'>
        <div id = 'printHeader'>
            <span @click="$router.push({name:'mycenter'})"><i class='el-icon-arrow-left'></i></span>
            <span>浏览足迹</span>
            <span @click='clear'>清空</span>
        </div>
        <div class="mhLoading" v-show="show">
            <img src="src/assets/image/mhLoading.gif">
            客官稍等...
        </div>
        <div class='printContent'>
            <div class="printGoods" v-for="(obj,index) in dataset">
                <div class='mh_pgl'>
                    <img :src="obj.imgurl">
                </div>
                 <div class='mh_pgr'>
                 <p>{{obj.details}}<br/><span>￥{{obj.price}}</span></p>
                </div>
            </div>
            <p class='fpTips'>没有啦</p>
        </div>
    </div>
</template>

<script>
    import '../../../scss/base.scss'; 
    import '../../../scss/footprint.scss'; 
    import http from '../../../utils/reqAjax.js';

    export default {
        data:function(){
            return {
                show:true,
                dataset:[]
            }
        },
        methods:{
            clear:function(){
                http.get({url:''}).then((res)=>{
                    alert('已清空所有足迹')
                })
               
            },
        },
        mounted:function(){
            http.get({url:''}).then((res)=>{
                this.show = false;
                this.dataset = res.data;
            })
        
        }
    }
</script>
