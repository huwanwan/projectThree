<template>
    <div class="mh_box" >
    <header id="mh_header">
        <span></span>
        <span>
            <i class='el-icon-setting' @click="$router.push('/setup/'+show)"></i>
            <i class='el-icon-question'></i>
        </span>
    </header>
    <main id='mh_main'>
        <div class = 'mh_hp'>
            <div class="mh_pic" @click="edit(path.person)">
                <img src="../../assets/image/defultHead.jpg">
            </div>
            <div class='mh_nicname'><p><span @click='edit1'>{{showLogin}}</span></p></div>
        </div>
        <div class="mhClub" v-show='show'>
            <div class='mhClubCan'>
                <p>
                    <span class="clubMan">&nbsp;<i class='el-icon-star-off'></i>&nbsp;CLUB会员</span>
                    <span class='mhOpen'>-&nbsp;开通即享6大特权&nbsp;-</span>
                </p>
                <p>点击获取<i class='el-icon-caret-right'></i></p>
            </div>
        </div>
        <div class='mh_common mh_order'>
            <div @click="edit(path.allOrders)" class = 'mh_orderTop'>
                <span>我的订单</span>
                <span>查看更多订单<i class='el-icon-arrow-right'></i></span>
            </div>
            <ul class='mh_tab1'>
                <li @click="edit(path.pending)">
                    <i class='el-icon-goods'></i>
                    <span>待付款<i class='smallNum dfk' v-show='show'>{{showqty}}</i></span>
                </li>
                 <li  @click="edit(path.paid)">
                    <i class='el-icon-sold-out'></i>
                    <span>已付款<i class='smallNum yfk' v-show='show'>1</i></span>
                </li>
                 <li  @click="edit(path.readySend)">
                    <i class='el-icon-printer'></i>
                    <span>待发货<i class='smallNum dfh' v-show='show'>8</i></span>
                </li>
                 <li  @click="edit(path.sent)">
                    <i class='el-icon-bell'></i>
                    <span>待收货<i class='smallNum dsh' v-show='show'>12</i></span>
                </li>
            </ul>
        </div>
        <div class='mh_common'>
             <div class = "mh_orderTop"  @click="edit(path.myWallet)">
                <span>我的钱包</span>
                <span>查看明细<i class='el-icon-arrow-right'></i></span>
            </div>
            <ul class='mh_tab1'>
                <li>
                    <span>1888.98</span>
                    <span>账户余额</span>
                </li>
                 <li>
                    <span>38</span>
                    <span>返现</span>
                </li>
                 <li>
                    <span>68</span>
                    <span>优惠券</span>
                </li>
                 <li>
                    <span>60</span>
                    <span>金币</span>
                </li>
            </ul>
        </div>
         <div class='mh_card mh_common'>
            <ul class='mh_tab1 mh_vip'>
                <li  @click="edit(path.collect)">
                    <span style="color:#f00;">23</span>
                    <span>商品收藏</span>
                </li>
                 <li  @click="edit(path.footprint)">
                    <span style="color:#f00;">258</span>
                    <span>浏览足迹</span>
                </li>
                 <li>
                    <i class="el-icon-success" style='color:#FFB503;'></i>
                    <span>会员频道</span>
                </li>
                 <li>
                    <i class='el-icon-sort'style='color:#FF4548;'></i>
                    <span>商品兑换</span>
                </li>
            </ul>
             <ul class='mh_tab1 mh_vip mh_vip2'>
                <li>
                    <i class="el-icon-edit-outline" style='color:#238EFF;'></i>
                    <span>意见反馈</span>
                </li>
                 <li @click='service'>
                    <i class="el-icon-service" style='color:#FF4548;'></i>
                    <span>客服热线</span>
                </li>
                 <li @click='attact'>
                    <i class="el-icon-phone" style='color:#FFB503;'></i>
                    <span>招商入驻</span>
                </li>
                 <li>
                    <i class="el-icon-menu" style='color:#DB0900;'></i>
                    <span>小酒馆</span>
                </li>
                
            </ul>
        </div>
        <div class="clubPart">
            <span><i class='el-icon-star-off'></i>&nbsp;-&nbsp;CLUB会员专享&nbsp;-</span>
            <span>成为会员<i class='el-icon-arrow-right'></i></span>
        </div>
        <div class="clubGoods">
            <div class="clubBall">
                <div class="clubPics" v-for="(obj,index) in dataset">
                    <img :src="obj.imgurl" @click="goDetails(obj.id)">
                    <p>{{obj.price}}</p>
                </div>
            </div>
        </div>
    </main>
    <div class="shade" v-if='showService'>
        <div class="editZoom">
            <div class='mhService'>
                <span>{{serviceTitle}}</span>  
                <span>拨打&nbsp;&nbsp;{{serviceNum}}</span>  
            </div>
            <p class="dele" @click='dele'>取消</p>
        </div>
    </div>
    <conmonfoot></conmonfoot>
   
    </div>
   
</template>

<script>
    import axios from 'axios'
    import qs from 'qs'
    import '../../scss/base.scss'; 
    import '../../scss/mycenter.scss';
    import http from '../../utils/reqAjax'; 
    import conmonfoot from '../conmon/conmonfoot.vue';
    export default{
        components:{
            conmonfoot
        },
        data:function(){
            return {
                show:0,
                showService:0,
                showLogin:'登录/注册 >',
                serviceTitle:'',
                serviceNum:'',
                showqty:null,
                username:'',
                dataset:[],
                path:{
                    person:'/person',
                    allOrders:'/mygoods/allOrders/0',
                    pending:'/mygoods/pending/1',
                    paid:'/mygoods/paidOrders/2',
                    readySend:'/mygoods/readySend/3',
                    sent:'/mygoods/sent/4',
                    myWallet:'/myWallet',
                    collect:'/collect',
                    footprint:'/footprint'
                }
            }
        },
        methods:{
            goDetails:function(id){
                // 点击跳转到列表页;
                this.$router.push({name:'goods',params:{goodId:id}});
                window.sessionStorage.setItem('save',id);
            },
            edit:function(params){
                if(this.show){
                    this.$router.push(params);
                }else{
                    this.$router.push({name:'login'});
                }
            },
             edit1:function(){
                if(this.show){
                    return;
                }else{
                    this.$router.push({name:'login'});
                }
            },
            service:function(){
                this.showService = 1 ;
                this.serviceTitle = '淘酿网客服竭诚为您服务';
                this.serviceNum = '400-666-8888';
            },
            attact:function(){
                this.showService = 1 ;
                this.serviceTitle = '淘酿网招商热线';
                this.serviceNum = '010-369-9921';
            },
            dele:function(){
                this.showService = 0 ;
            }
        },
        mounted:function(){
               this.$children[0].limit = 4;
               this.userName = window.localStorage.getItem("userName");
               if(this.userName === null){
                  this.show = 0;
               }else{
                  this.show = 1;
                  this.showLogin = this.userName;
               }
                axios({
                    url:"http://10.3.135.233:9898/projectThree/php/goodslist.php",
                    headers:{
                        'Content-Type':'application/x-www-form-urlencoded'
                    }
                }).then(res=>{
                     this.dataset = res.data;   
                })

                let url = 'http://10.3.135.242:555/php/order.php?userName=123&state=1'; 
                http.get({'url':url}).then((res)=>{
                    if(res.data.length>0){
                         this.showqty = res.data.length;
                    }
                })

            }
    }
</script>  

