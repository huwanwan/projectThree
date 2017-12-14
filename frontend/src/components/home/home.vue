<template>
    <div id="home"> 
        <conmonhead @login="alertBox"></conmonhead>
        <main id="w_main" @scroll="scroll($event)">
            <div class="carousel">
                <el-carousel :interval="3000" class="carouselSon" arrow="never">
                    <el-carousel-item class="carouselSon" v-for="(item,index) in carouList.carousel" :key="item">
                      <img :src="item" @click="viewList(carouList.carouselWord[index])" />
                    </el-carousel-item>
              </el-carousel>
            </div>
            <div class="activty">
                <img :src="adverList.adver" @click="viewList(adverList.adverWord)" />
            </div>
            <ul class="categroy">
                <li v-for="item in categroy" v-text="item" @click="goList(item)">
                </li>
            </ul>
            <h3 ref="title">新品上架 <span>更多</span></h3>
            <div class="newList">
                <div v-for="item in newlist" :key="item.id" @click="goDetails(item.id)">
                    <img :src="item.imgurl" />
                    <p v-text="item.name"></p> 
                    <p>淘酿价:<span>￥{{item.price}}</span></p> 
                </div>
            </div>
            <h3>优惠区 <span>更多</span></h3>
            <ul class="salelist">
                <li v-for="item in otherList.hotlist" :key="item.id" @click="goDetails(item.id)">
                    <img :src="item.imgurl" />
                    <p v-text="item.name"></p>
                    <p>原价:<span class="oldPrice">￥{{item.price}}</span></p>
                    <p>特惠价:<span class="salePrice">￥{{item.salePrice}}</span></p>
                </li>
            </ul>  
            <h3>为您推荐</h3>
            <div class="recomend">
                <div class="sale">
                    <el-carousel :interval="3000" arrow="never">
                        <el-carousel-item class="carouselSon" v-for="(item,index) in saleList.saleCarou" :key="item">
                          <img :src="item" @click="viewList(saleList.saleCarouWord[index])" />
                        </el-carousel-item>
                    </el-carousel>
                </div>
                <div class="moreGoods" v-for="item in otherList.morelist" :key="item.id" @click="goDetails(item.id)">
                    <img :src="item.imgurl" />
                    <p v-text="item.details"></p>
                    <p>销量:<span>{{item.saleQty}}件</span></p>
                </div>
            </div>
        </main>
        <conmonfoot></conmonfoot>
        <welcome v-if="gologin" @close="alertBox"></welcome>
    </div>
</template>
<script>
    import '../../scss/home.scss';
    import http from '../../utils/reqAjax.js';
    import conmonhead from '../conmon/conmonhead.vue';
    import conmonfoot from '../conmon/conmonfoot.vue';
    import welcome from '../welcome/welcome.vue';

    export default {
        components:{
            conmonhead,
            conmonfoot,
            welcome
        },
        data:function(){
            return {
                carouList:{
                    carousel:[],
                    carouselWord:[]
                },
                adverList:{
                    adver:'',
                    adverWord:''
                },
                saleList:{
                    saleCarou:[],
                    saleCarouWord:[]
                },
                categroy:['新品','优惠','热销','洋酒','白酒','啤酒','葡萄酒','老酒'],
                newlist:[],
                otherList:{
                    hotlist:[],
                    morelist:[]
                },
                // 判断用户是否已登录;
                gologin:false
            }
        },
        methods:{
            scroll:function(ev){
                // 计算main部分滚动距离,当区块划入页面可视区域进行ajax请求数据;
                let newList = document.querySelector('.newList');
                let salelist = document.querySelector('.salelist');
                let startTop = (newList.offsetHeight + newList.offsetTop) - (ev.target.offsetHeight + ev.target.offsetTop) + this.$refs.title.offsetHeight;
                let url = 'http://10.3.135.254/1993/';
                if(ev.target.scrollTop >= (startTop + salelist.offsetHeight + this.$refs.title.offsetHeight)){
                    // 当页面已经加载过数据后,不再请求;
                    if(this.otherList.morelist.length !== 0){
                        return;
                    }
                    http.get({'url' : url}).then((res)=>{
                        res.data.forEach((item,idx)=>{
                            this.$set(this.otherList.morelist,idx,item);
                        })
                    })
                }
                if(ev.target.scrollTop >= startTop){
                    if(this.otherList.hotlist.length !== 0){
                        return;
                    }
                    http.get({'url' : url + '?hot=true&&num=8'}).then((res)=>{
                        res.data.forEach((item,idx)=>{
                            this.$set(this.otherList.hotlist,idx,item);
                        })
                    })
                }
            },
            goList:function(item){
                //window.sessionStorage.setItem('filterColumns',item);
                this.$router.push({name:'goodslist',params:{filterColumns:item}});
               // var FilterColumns = window.sessionStorage.getItem('filterColumns');
            },
            goDetails:function(id){
                // 点击跳转到列表页;
                this.$router.push({name:'goods',params:{goodId:id}});
                window.sessionStorage.setItem('save',id);
            },
            alertBox:function(){
                // 点击头像判断用户是否已登录;
                if(window.localStorage.getItem("userName")){
                    this.$router.push({name:'mycenter'});
                    return;
                }
                this.gologin = !this.gologin;
            },
            viewList:function(keyWord){
                // 点击宣传类的图片跳转到搜索页面,根据图片绑定的关键字进行搜索;
                this.$router.push({name:'searchlist',query:{'keyWord':keyWord}});
            }
        },
        mounted:function(){
            // 页面加载请求可视区页面数据;
            var url = 'http://10.3.135.254/1993/';
            http.get({'url' : url + '?new=true&&num=8'}).then((res)=>{
                this.newlist = res.data;
            });
            // 宣传类数据根据type分类;
            http.get({'url':url+'indexAdver.php'}).then((response)=>{
                response.data.forEach((item)=>{
                    if(item.type === 'index'){
                        this.carouList.carousel = item.imgUrl.split(',');
                        this.carouList.carouselWord = (item.keyWord.split(','));
                    }else if(item.type === 'sale'){
                        this.saleList.saleCarou = (item.imgUrl.split(','));
                        this.saleList.saleCarouWord = (item.keyWord.split(','));
                    }else if(item.type === 'adver'){
                        this.adverList.adver = item.imgUrl;
                        this.adverList.adverWord = item.keyWord;
                    }
                })
            })
        }
    }
</script>