<template>
    <div class='myWallet'>
        <header id='walletHeader'>
                <span @click="$router.push({name:'mycenter'})"><i class='el-icon-arrow-left'></i></span>
                <span>我的钱包</span>
        </header>
        <div class='walletBox'>
            <div class='walletCan'>
                <span>
                    <i class='el-icon-circle-check-outline'></i>
                    账户余额
                </span>
                <span>
                    ￥1888.88
                    <i class='el-icon-arrow-right'></i>
                </span>
                </div>
            <div class='walletCan'>
                <span>
                    <i class='el-icon-circle-check-outline'></i>
                    返现
                </span>
                <span>
                    ￥38.00
                    <i class='el-icon-arrow-right'></i>
                </span>
            </div>
            <div class='walletCan'>
                <span>
                    <i class='el-icon-circle-check-outline'></i>
                    优惠券
                </span>
                <span>
                    68张
                    <i class='el-icon-arrow-right'></i>
                </span>
            </div>
            <div class='walletCan'>
                <span>
                    <i class='el-icon-circle-check-outline'></i>
                    金币
                </span>
                <span>
                    88
                    <i class='el-icon-arrow-right'></i>
                </span>
            </div>
        </div>
    </div>
</template>

<script>
    import '../../../scss/base.scss'; 
    import '../../../scss/myWallet.scss'; 

    export default{
        data:function(){
            return {
            }
        }
    }
</script>