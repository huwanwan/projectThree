<template>
    <div class='mh_goodscan'>
        <div class='mh_top'>
            <header id='mh_goodsheader'>
                <span @click="$router.push({name:'mycenter'})"><i class='el-icon-arrow-left'></i></span>
                <span>商品订单</span>
                <span>
                    <i class='el-icon-search'></i>
                    <i class='el-icon-more'></i>
                </span>
            </header>
            <nav id='mh_goodsnav'>
                <ul class='mh_goodstab1'>
                    <li  @click="allOrders">全部</li>
                    <li  @click="pending">待付款</li>
                    <li  @click="paid">已付款</li>
                    <li  @click="readySend">待发货</li>
                    <li  @click="sent">待收货</li>
                </ul>
            </nav>
            <div class='goodsTips' v-if='!status'>
                <i class='el-icon-info'></i>&nbsp;
                <span>安全提醒：淘酿网不会以任何理由,要求你点击链接进行退款或重新付款,谨防诈骗！</span>
                <i class="el-icon-close" @click='none'></i>
            </div>
        </div>
        <div class='menuBox'><router-view></router-view></div>
        <div class='mh_noOrder'>
            <img src='../../../assets/image/mh_goods.jpg'>
            <p>你还没有相关订单，</p>
            <p>可以去看看有哪些想买的</p>
        </div>
    </div>
</template>

<script>
    import '../../../scss/base.scss'; 
    import '../../../scss/mygoods.scss'; 

    export default{
        data:function(){
            return {
            status:false,
            }
        },
        methods:{
            pattern:function(sty){
                var liArr = document.getElementsByTagName('li');
                for(var i=0;i<5;i++){
                    liArr[i].className = '';
                }
                 liArr[sty].className = 'active';
            },
            allOrders:function(){
                this.pattern(0);
                this.$router.push('/mygoods/allOrders/0');
            },
            pending:function(){
                this.pattern(1);
                this.$router.push('/mygoods/pending/1');
            },
            paid:function(){
                this.pattern(2);
                this.$router.push('/mygoods/paidOrders/2');
            },
             readySend:function(){
                this.pattern(3);
                this.$router.push('/mygoods/readySend/3');
            },
             sent:function(){
                this.pattern(4);
                this.$router.push('/mygoods/sent/4');
            },
            none:function(){
                this.status = true;
            }
        },
        mounted:function(){
            var sty = this.$route.params.res;
                this.pattern(sty);
        }
    }
</script>