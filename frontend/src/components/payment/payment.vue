<template>
    <div class="payment">
        <conmonhead></conmonhead>
        <header>
           <ul>
                <li @click="goBack">返回</li>
                <li @click="Order">提交订单</li>
           </ul>
        </header>
        <main>
            <p>收货人：<span>{{userName}}</span> <span></span></p>
            <p class="address">收货地址：<input type="text" placeholder="请输入收货地址" v-model="address"/></p>
           <!--  <p class="address">地址：<span>{{address}}</span></p> -->
            <ul v-if='dataset.length>0' class="Contpay">
                <li v-for='(object,index) in dataset' :id='dataset[index].id'>
                    <div class="Img">
                        <img :src='object.imgurl'>
                    </div>
                    <div class="paymentCent">
                        <p class="name">名称：{{object.name}}</p>
                       
                        <p class="price">价钱：<span>￥{{object.price}}</span> <span>￥{{object.salePrice}}</span></p>
                        <p class="type">品类:{{object.type}}</p>
                        <p class="details">{{object.details}}  <span>{{object.standard}}</span></p>
                        
                    </div>
                </li>
            </ul>
            <ul class="payCent">
                <li><span class="payCentone">购买数量</span> <p class="payCenttwo"><span @click='subtract'>-</span><span>{{num}}</span><span @click='add'>+</span></p></li>
                <li><span class="payCentone">配送方式</span><p class="payCenttwo"><span>快递,免邮</span></p></li>
                <li><span class="payCentone">买家留言：</span><input type="text" placeholder="选填：填写内容已和卖家协商确定" /></li>
                <li><p>共{{num}}件商品 小计：<span class="total">￥{{total}}</span>元</p></li>
            </ul>
        </main>
        <footer id="paymentFooter">
            <ul>
                <li>
                   <span >合计：￥{{total}}</span>
                </li>
                <li> 
                   <span @click="subOrder">立即支付</span>
                </li>
            </ul>   
        </footer>
    </div>
</template>
<script>
    import axios from 'axios'
    import qs from 'qs'
    import conmonhead from '../conmon/conmonhead.vue'
    import '../../scss/payment.scss'
    import http from '../../utils/reqAjax.js'
    export default{
        data(){
            return {
                userName:'',
                num:'',
                Price:'',
                dataset:[],
                cartList:[],
                total:'',
                id:this.$route.params.goodId||window.sessionStorage.getItem('save'),
                idAll:[],
                address:''
            }
        },
        components:{
            conmonhead
        },
        methods:{
            Order:function(){
                this.idAll = [];
                var num = this.num;
                for(var i=0;i<num;i++){
                    this.idAll.push(this.id);
                }
                var date =String(Date.now());
                date=date.slice(1,9);
                /*alert("成功提交订单，待支付");*/
                let url = "order.php?userName=" + this.userName + '&goodsId=' + this.idAll.join(',') + '&orderid=' + date + '&state = 1';
                    http.get({'url':url}).then((res)=>{
                        console.log(res.data)
                })
            },
            goBack:function(){
               
                this.$router.push({name:'goods'});

            },
            subOrder:function(){
                this.idAll = [];
                var date =String(Date.now());
                date=date.slice(1,9);
                var num = this.num;
                for(var i=0;i<num;i++){
                    this.idAll.push(this.id);
                }
                let url = "order.php?userName=" + this.userName + '&goodsId=' + this.idAll.join(',') + '&orderid=' + date + '&state = 2';
                    http.get({'url':url}).then((res)=>{
                        console.log(res.data)
                })
           
                this.$router.push({name:'paySuccess',params:{total:this.total,address:this.address}});

            },
            subtract:function(){
                if(this.num==0){
                    return;
                }
                this.num--;
                this.total = this.Price*this.num;
                
            },
            add:function(){
                this.num++;
                this.total = this.Price*this.num;
               
            }
        },
        mounted(){
            this.cartList = this.$route.params.goodsId;
            
            this.num = this.$route.params.num;
            this.address = this.$route.params.address;
            this.userName= this.$route.params.userName;
          
            let url = "goodslist.php?goodId=" + this.id;
            console.log(url)
            http.get({'url':url}).then(res=>{
                if(res.data.length>1){
                    return;
                }else{
                    this.dataset = res.data; 
                    this.Price = res.data[0].price;
                    this.total= this.Price*this.num;
                }       
             })

        }
    }
</script>