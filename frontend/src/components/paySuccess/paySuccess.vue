<template>
    <div class="payment">
        <conmonhead></conmonhead>
        <header>
           <ul>
               <li @click="goBack">返回列表页</li>
           </ul>
        </header>
        <main>   
            <div class="paySuccess">
               <p>您已成功付款<span>{{total}}</span>元</p> 
               <p>配送地址：<span>{{address}}</span></p>
               <h3>支付成功</h3>
            </div>    
        </main>
        <payFoot></payFoot>
    </div>
</template>
<script>
    import axios from 'axios'
    import '../../scss/paySuccess.scss'
    import conmonhead from '../conmon/conmonhead.vue'
    import payFoot from '../conmon/conmonfoot.vue'
    import http from '../../utils/reqAjax.js'
    import qs from 'qs'
    export default{
        data(){
            return {
                name:'欢迎',
                address:'',
                total:'',
                dataset:[], 
                id:this.$route.params.goodId||window.sessionStorage.getItem('save'),
            }
        },
        components:{
            payFoot,
            conmonhead
        },
        methods:{
            goBack:function(){
                this.$router.push({name:'goodslist'});
            }
        },
        mounted(){
            this.total = this.$route.params.total;
            this.address = this.$route.params.address;
           // console.log(this.total)
            let url = "goodslist.php?goodId=" + this.id;
             http.get({'url':url}).then(res=>{
                    if(res.data.length>1){
                        return;
                    }else{
                    this.dataset = res.data; 
                    this.Price = res.data[0].price;
                    }
            })
        }
    }
</script>