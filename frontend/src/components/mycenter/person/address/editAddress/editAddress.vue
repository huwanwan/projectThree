<template>
    <div class='addAddressBox'>
            <div id = 'addAddressHeader'>
                <span @click="$router.push({name:'address'})"><i class='el-icon-arrow-left'></i></span>
                <span>新增收货地址</span>
            </div>
            <div class='mhAdd'>
                <span>&nbsp;收&nbsp;货&nbsp;人</span>
                <input type="text" class="formInof" :value = "dataset.nickName" id="consignee">
            </div>
            <div class='mhAdd'>
                <span>联系方式</span>
                <input  type="text" class="formInof" :value = "dataset.userName">
            </div>
            <div class='mhAdd'>
                <span>固定电话</span>
                <input type="text" class="formInof" :value = "dataset.userName">
            </div>
            <div class='mhAdd'>
                <span>所在区域</span>
                <input  type="text" class="formInof" :value = "dataset.area">
            </div>
            <div class='mhAdd'>
                <span>详细地址</span>
                <input type="text" class="formInof" :value = "dataset.dAddress">
            </div>
            <div class='mhAdd defaultAddress'>
                <p>
                    <span>设置为默认地址</span><br/>
                    <span>注:每次下单时将默认使用当前地址信息</span>
                </p>
                <el-switch v-model="value2" active-color="#13ce66" inactive-color="#ff4949"></el-switch>
            </div>
            <div class="addressSave"><p>保存</p></div>
    </div>
</template>

<script>

    import '../../../../../scss/base.scss'; 
    import axios from 'axios';
    import '../../../../../scss/addAddress.scss'; 

    export default {
       data() {
          return {
            value1: true,
            value2: true,
            index:null,
            dataset:{}
          }
        },
        mounted:function(){
            var consignee = document.querySelector('#consignee');
            consignee.focus();
            this.index = this.$route.params[1];
            this.dataset = this.$route.params[0][this.index];
        }
    }

</script>