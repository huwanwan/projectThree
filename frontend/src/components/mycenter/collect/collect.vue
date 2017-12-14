<template>
    <div class='mhCollect'>
        <div class='collectTop'>
             <header id='collectHeader'>
                <span @click="$router.push({name:'mycenter'})">
                    <i class='el-icon-arrow-left'></i>
                </span>
                <span>收藏的商品</span>
                <span>编辑</span>
            </header>
        </div>
         <div class="mhLoading" v-show="show">
            <img src="src/assets/image/mhLoading.gif">
            客官稍等...
        </div>
        <div class='collectCan'>
            <div class="collectNum" v-for="(obj,index) in dataset">
                <div class='collectImg'>
                    <img :src="obj.imgurl">
                </div>
                <p>
                    <span>{{obj.details}}</span>
                    <span>￥{{obj.price}}</span>
                </p>
                 <i class='el-icon-circle-plus' @click='addCar'></i>
            </div>
             <p class='fpTips'>没有啦</p>
        </div>
    </div>
</template>

<script>
    import '../../../scss/base.scss'; 
    import '../../../scss/collect.scss'; 
    import http from '../../../utils/reqAjax.js';

    export default{
        data:function(){
            return {
                show:true,
                dataset:[]
            }
        },
        methods:{
            addCar:function(){
                http.get({url:''}).then((res)=>{
                    this.show = false;
                    this.dataset = res.data;
                })
            }
        },
        mounted:function(){
            http.get({url:''}).then((res)=>{
                this.show = false;
                this.dataset = res.data;
            })
        }
    }
</script>