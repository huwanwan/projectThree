<template>
    <div class="details">
        <h2>商品详情</h2>
        <ul v-if='dataset.length>0'>
            <li v-for='(object,index) in dataset' :id='dataset[index].id'>
                <p class="name">名称：{{object.name}}</p>
                <p class="area">产地：{{object.area}}</p>
                <p class="details">{{object.details}}<span>{{object.standard}}</span></p>
                <p class="price">价钱：<span>￥{{object.price}}</span>     <span>  优惠价：￥{{object.salePrice}}</span></p>

                <p class="saleQty">销售量：{{object.saleQty}}</p>
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
            dataset:[]
        }
    },
    methods:{

        subtract:function(){
        if(this.num==0){
          return;
         /* this.$emit('num',this.num);*/
        }

        this.num--;
        this.$parent.ad(this.num);
        },

        add:function(){
            this.num++;
         
           this.$parent.ad(this.num);
        },     
    },
    mounted(){
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

