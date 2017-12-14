<template>
    <div class="goods">
        <ul v-if='dataset.length>0'>
            <li v-for='(object,index) in dataset' :id='dataset[index].id'>
                <img :src='object.imgurl'>
                <div class="goods_a">
                    <p class="details">{{object.details}}<span>{{object.standard}}</span></p>
                    <p class="price">价钱：<span>￥{{object.price}}</span> <span>￥{{object.salePrice}}</span></p>
                </div>
                <div class='goods_b'>
                    <p class="qty">数量 <span @click='subtract'>-</span><span>{{num}}</span><span @click='add'>+</span></p>
                    <!-- <p class="address">收货地址：<input type="text" placeholder="请输入收货地址" v-model="address"/></p> -->
                    <p>提示：此商品不能使用优惠卷</p>
                </div>
            </li>
        </ul>
    </div>
</template>
<script>
    import axios from 'axios'
    import qs from 'qs'
    import http from '../../utils/reqAjax.js'
export default {
    name: 'goods',
    data () {
        return {
            id:this.$route.params.goodId||window.sessionStorage.getItem('save'),
            dataset:[],
            num:1,
            address:''
        }
    },
    methods:{
        subtract:function(){
        if(this.num==0){
          return;
         /* this.$emit('num',this.num);*/
        }

        this.num--;
        this.$parent.ad(this.num,this.address);
        },

        add:function(){
            this.num++;
           /* this.$emit('num',this.num);*/
           /* console.log(this.num)*/
           this.$parent.ad(this.num,this.address);
        }
    },
    mounted(){
        //console.log(this.address)
        this.$parent.ad(this.num);

        var url = 'goodslist.php?goodId='+this.id;
        http.get({url:url}).then(res=>{
            console.log(res)
            if(res.data.length>1){
                return;
            }else{
               this.dataset = res.data;
               console.log(res) 
            }
            
        })

        
    }
}
</script>