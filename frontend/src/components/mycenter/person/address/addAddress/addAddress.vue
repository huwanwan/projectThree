<template>
    <div class='addAddressBox'>
            <div id = 'addAddressHeader'>
                <span @click="$router.push({name:'address'})"><i class='el-icon-arrow-left'></i></span>
                <span>新增收货地址</span>
            </div>
            <div class='mhAdd'>
                <span>&nbsp;收&nbsp;货&nbsp;人</span>
                <input type="text" class="formInof" id="consignee" v-model="mes1">
            </div>
            <div class='mhAdd'>
                <span>联系方式</span>
                <input  type="text" class="formInof" v-model="mes2">
            </div>
            <div class='mhAdd'>
                <span>固定电话</span>
                <input type="text" class="formInof" v-model="mes3">
            </div>
            <div class='mhAdd'>
                <span>所在区域</span>
                <input  type="text" class="formInof" v-model="mes4">
            </div>
            <div class='mhAdd'>
                <span>详细地址</span>
                <input type="text" class="formInof" v-model="mes5">
            </div>
            <div class='mhAdd defaultAddress'>
                <p>
                    <span>设置为默认地址</span><br/>
                    <span>注:每次下单时将默认使用当前地址信息</span>
                </p>
                <el-switch v-model="value2" active-color="#13ce66" inactive-color="#ff4949"></el-switch>
            </div>
            <div class="addressSave" @click='save'><p>保存</p></div>
    </div>
</template>

<script>

    import '../../../../../scss/base.scss'; 
    import axios from 'axios';
    import '../../../../../scss/addAddress.scss'; 

    export default {
       data () {
          return {
            value1: true,
            value2: true,
            mes1:'',
            mes2:'',
            mes3:'',
            mes4:'',
            mes5:'',
            dataset:{}
          }
        },
        methods:{
            save:function(){
                this.dataset.name = this.mes1;
                this.dataset.phone = this.mes2;
                this.dataset.tel = this.mes3;
                this.dataset.area = this.mes4;
                this.dataset.detailsAddress = this.mes5;
                //console.log(this.dataset)
                axios({
                    url:'#',
                    params:this.dataset,
                    headers:{
                        'Content-Type':'application/xx-form-urlencoded'
                    }
                }).then(res=>{
                    //console.log(res)
                })
            }
        },
        mounted:function(){
            var consignee = document.querySelector('#consignee');
            consignee.focus();
        }
    }

</script>