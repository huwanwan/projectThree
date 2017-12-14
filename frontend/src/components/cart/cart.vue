<template>
    <div id="cart">
        <header id="w_header">
            <h1>购物车</h1>
        </header>
        <main id="w_main">
            <p v-if="tips"><i class="el-icon-warning"></i>实付满100元免运费,偏远地区满500免运费<i @click="closeTips">&times;</i></p>
            <h2 v-if="cartList.length > 0">
                <img :src="logo" alt="" />
                <span>淘酿网</span>
                <i class="el-icon-delete" @click="del"></i>
            </h2>
            <div class="goodsList" v-for="(item,index) in cartList">
                <i class="radio noNone" @click="check($event,item.id,index)"></i>
                <i class="el-icon-circle-check radio show disNone" :ref="item.id" @click="check($event,item.id,index)"></i>
                <img :src="item.imgurl" />
                <div>
                    <p v-text="item.details"></p>
                    <div class="price_qty">
                        <s>￥{{item.salePrice}}</s>
                        <span>
                            <em @click="subQty(index,item.id)">-</em>
                            <i v-text="item.qty">1</i>
                            <em @click="addQty(index,item.id)">+</em>
                        </span>
                    </div>
                </div>
            </div>
            <p class="noList" v-if="cartList.length == 0">您还未有商品添加到购物车!</p>
        </main>
        <div id="cartFoot">
            <div class="total">
                <p>
                    <i class="radio hasBorder" v-if="allCheck"></i>
                    <i class="el-icon-circle-check radio" v-else></i> 
                    <span @click="checkAll">全选</span>
                </p>
                <p>
                    <span>合计:<s>￥{{totle.price}}</s></span>
                    <span>总额:￥{{totle.price}}</span>
                </p>
                <p>
                    <span @click="goPay">去结算</span>
                    <s>({{totle.qty}})</s>
                </p>
            </div>
            <conmonfoot></conmonfoot>
        </div>
    </div>
</template>
<script>
    import '../../scss/cart.scss';
    import http from '../../utils/reqAjax.js';
    import conmonfoot from '../conmon/conmonfoot.vue';

    export default{
        data:function(){
            return {
                logo:'./src/assets/image/logo.png',
                tips:true,
                checkList:0,
                allCheck:true,
                totle:{
                    qty:0,
                    price:0
                },
                url:'cart.php?userName=',
                userName:'',
                cartList:[],
                checked:[]
            }
        },
        components:{
            conmonfoot
        },
        methods:{
            closeTips(){
                this.tips = false;
            },
            check(ev,id,idx){
                if(this.$refs[id][0] == ev.target){
                    ev.path[0].previousElementSibling.classList.remove('disNone')
                    this.checkList--;
                    this.totle.qty -= this.cartList[idx].qty;
                    this.count(idx,'sub');
                    let num = this.checked.indexOf(idx);
                    if(num >= 0){
                        this.checked.splice(num,1);
                    }
                }else{
                    this.$refs[id][0].classList.remove('disNone');
                    this.checkList++;
                    this.totle.qty += this.cartList[idx].qty;
                    this.count(idx,'add');
                    this.checked.push(idx);
                }
                ev.target.classList.add('disNone');
                if(this.checkList === this.cartList.length){
                    this.allCheck = false;
                }else{
                    this.allCheck = true;
                }
            },
            del(){
                if(this.cartList.length === this.checked.length){
                    this.cartList = [];
                }else{
                    this.checked.forEach((item,index)=>{
                        this.cartList.splice(item,1);
                    })
                }
                this.keepCart();
                this.totle.qty = 0;
                this.totle.price = 0;
                this.allCheck = true;
                this.checked = [];
                let noNone = document.querySelectorAll('.noNone');
                let disNone = document.querySelectorAll('.show');
                noNone.forEach((item,idx)=>{
                    if(item.classList.contains('disNone')){
                        item.classList.remove('disNone');
                    }
                    disNone[idx].classList.add('disNone');
                })
               
            },
            subQty(idx,id){
                let goodsId = this.cartList[idx].id;
                if(this.cartList[idx].qty > 1){
                    this.cartList[idx].qty--;
                    this.keepCart();
                }else{
                    this.cartList[idx].qty = 1;
                    return;
                }
                if(!this.$refs[id][0].classList.contains('disNone')){
                    this.totle.qty--;
                    this.totle.price -= this.cartList[idx].salePrice;
                }

            },
            addQty(idx,id){
                this.cartList[idx].qty++;
                this.keepCart();
                if(!this.$refs[id][0].classList.contains('disNone')){
                    this.totle.qty++;
                    this.totle.price += parseFloat(this.cartList[idx].salePrice);
                }
            },
            keepCart(){
                let goodsId = "";
                this.cartList.forEach((item)=>{
                    for(var i = 0 ;i < item.qty;i++){
                        goodsId += item.id + ',';
                    }
                })
                goodsId = goodsId.slice(0,-1);
                let url = this.url + '&type=change&&goodsId=' + goodsId;
                http.get({'url':url}).then((res)=>{
                   if(res.data === "ok"){
                        
                   }
                })
            },
            count(idx,type){
                var price = parseFloat((this.cartList[idx].salePrice * this.cartList[idx].qty).toFixed(2));
                if(type == 'add'){
                    this.totle.price += price;
                }else{
                    this.totle.price -= price;
                }
            },
            checkAll(){
                this.allCheck = !this.allCheck;
                let noNone = document.querySelectorAll('.noNone');
                let disNone = document.querySelectorAll('.show');
                this.totle.qty = 0;
                this.checkList = this.cartList.length;
                this.cartList.forEach((item,idx)=>{
                    if(this.allCheck){
                        this.checked = [];
                        this.checkList = 0;
                        noNone[idx].classList.remove('disNone');
                        disNone[idx].classList.add('disNone');
                        this.count(idx,'sub');
                    }else{
                        this.checked.push(idx);
                        noNone[idx].classList.add('disNone');
                        disNone[idx].classList.remove('disNone');
                        this.count(idx,'add');
                        this.totle.qty += this.cartList[idx].qty;
                    }
                })
            },
            goPay(){
                let arr = [];
                this.checked.forEach((item)=>{
                    let parmas = {};
                    parmas.id = this.cartList[item].id;
                    parmas.qty = this.cartList[item].qty;
                    arr.push(parmas);
                })
                this.$router.push({'name':'payment',params:{'goodsId':arr}});
                this.del();
            }
        },
        mounted:function(){
            this.$children[0].limit = 3;
            this.userName = window.localStorage.getItem("userName");
            if(this.userName != ""){
                this.url = this.url + this.userName;
                http.get({'url':this.url}).then((res)=>{
                    if(res.data == "none"){
                        return;
                    }
                    res.data.forEach((item)=>{
                        item.qty = 1;
                    })
                    this.cartList = getQty(res.data);
                    function getQty(arr){
                        for(var i = 0;i < arr.length;i++){
                            for(var j = i+1;j < arr.length;j++){
                                if(arr[i].id == arr[j].id){
                                    arr[i].qty++;
                                    arr.splice(j,1);
                                    getQty(arr);
                                }
                            }
                        }
                        return arr;
                    }  
                })
            }
        }
    }
</script>