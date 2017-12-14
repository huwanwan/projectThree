<template>
        <main id="searchlist" v-loading="loading" element-loading-spinner="el-icon-loading" element-loading-background="rgba(255, 255, 255, 0.5)">
            <div class="sortTip" v-show="getlist.length>0">
                <span @click="sortList($event,'price')" :class="{active : sort.limit === 'price'}">价格排序<i :class="sort.price == 'asc' ?'el-icon-caret-bottom' : 'el-icon-caret-top'"></i></span>
                <span @click="sortList($event,'sale')" :class="{active : sort.limit === 'sale'}">销量排序<i :class="sort.sale == 'asc' ?'el-icon-caret-bottom' : 'el-icon-caret-top'"></i></span>
                <span>筛选<i class="el-icon-date"></i></span>
            </div>
            <div v-if="getlist.length > 0">
                <div class="goodsList" v-for="(item,idx) in getlist" :key="item.id" ref="item.id" @click="goDetails(item.id)">
                    <img :src="item.imgurl" />
                    <div>
                        <p v-text="item.details"></p>
                        <p>
                            <span>破损包退</span>
                            <span>满100包邮</span>
                        </p> 
                        <p>
                            <span>￥<s v-text="item.price"></s></span>
                            <span>{{item.saleQty}}人累计付款</span>
                        </p>   
                    </div>
                </div>
            </div>
            <div class="noneGoods" v-show="!loading" v-else>
                <i class="el-icon-search"></i>
                <p>很抱歉,没有找到相关的宝贝</p>
            </div>
        </main>    
</template>

<script>
    import '../../scss/searchlist.scss';
    import http from '../../utils/reqAjax.js';
    export default {
        data:function(){
            return {
                loading:true,
                keyWord:'',
                // 排序的判断操作;
                sort:{
                    price:'asc',
                    sale:'asc',
                    limit:true
                },
                url:'search.php?keyWord=',
                getlist:[]
            }
        },
        methods:{
            sortList:function(ev,type){
                // 点击排序的按钮时,loading显示,改变sort数据的状态,控制元素的icon的class;
                this.loading = true;
                this.sort[type] = this.sort[type] == 'asc' ? 'desc' : 'asc';
                this.sort.limit = type;
                // 根据点击传过来的排序类型,发起ajax,更新getlist;
                let url = this.url + this.keyWord + '&' + type + '=' + this.sort[type];
                http.get({'url':url}).then((res)=>{
                    this.loading = false;
                    if(res.data.length > 0){
                        this.getlist = res.data;
                    }
                })
            },
            goDetails:function(id){
                // 点击生成的数据类型,跳转到详情页;
                this.$router.push({name:'goods',params:{goodId:id}});
                window.sessionStorage.setItem('save',id);
            }
        },
        mounted:function(){
            // 页面加载,判断当前跳转是否为首页或搜索页,拿到搜索关键字请求数据;
            if(this.$route.query.keyWord){
                this.keyWord = this.$route.query.keyWord;
                this.$parent.keyWord = this.keyWord;
            }else{
                this.keyWord = this.$parent.keyWord;
            }
            let url = this.url + this.keyWord; 
            http.get({'url':url}).then((res)=>{
                this.loading = false;
                if(res.data.length > 0){
                    this.getlist = res.data;
                }
            })
        }
    }
</script>