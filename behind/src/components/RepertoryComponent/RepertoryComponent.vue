<template>
    <div class="allGoods">
        <div class="brand">
            <el-breadcrumb separator-class="el-icon-arrow-right">
            <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>商品管理</el-breadcrumb-item>
            <el-breadcrumb-item>库存管理</el-breadcrumb-item>
            </el-breadcrumb>
        </div>

        <div class="search clearfix">
            <el-input
              placeholder="请输入内容"
              v-model="input10"
              clearable class="goods_input">
            </el-input>
            <el-button type="primary" icon="el-icon-search" class="goods_search">搜索</el-button>
            <el-button type="success" icon="el-icon-plus" class="goods_btn">新增</el-button>
        </div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th v-for="(value, key) in dataset[0]">{{key}}</th>
                    <th>edit</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(object, index) in dataset">
                    <td v-for="(value, key) in object">{{object[key]}}</td>
                    <td><el-button type="warning" size="medium" @click="repertory($event)">{{msg}}</el-button></td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<script>
    import http from '../../utils/reqAjax.js'
    import axios from 'axios';
    export default {
        data: function(){
            return {
                input10: '',
                dataset: [],
                status: 1,
                msg: '上架'
            }
        },
        methods: {
            repertory(e){
                var e = e || window.event;
                var target = e.target || e.srcElement;
                if(target.tagName.toLowerCase() === 'span'){
                    
                var id = e.target.parentNode.parentNode.parentNode.childNodes[0].innerHTML;
                var barCode = e.target.parentNode.parentNode.parentNode.childNodes[1].innerHTML;
                var name = e.target.parentNode.parentNode.parentNode.childNodes[2].innerHTML;
                var type = e.target.parentNode.parentNode.parentNode.childNodes[3].innerHTML;
                var brand = e.target.parentNode.parentNode.parentNode.childNodes[4].innerHTML;
                var standard = e.target.parentNode.parentNode.parentNode.childNodes[5].innerHTML;
                var imgUrl = e.target.parentNode.parentNode.parentNode.childNodes[6].innerHTML;
                var price = e.target.parentNode.parentNode.parentNode.childNodes[7].innerHTML;
                var salePrice = e.target.parentNode.parentNode.parentNode.childNodes[8].innerHTML;
                var saleQty = e.target.parentNode.parentNode.parentNode.childNodes[9].innerHTML;
                var qty= e.target.parentNode.parentNode.parentNode.childNodes[10].innerHTML;
                var obj = {
                        'name': name,
                        'barCode': barCode,
                        'type': type,
                        'brand': brand,
                        'price': price,
                        'standard': standard,
                        'imgUrl': imgUrl,
                        'salePrice': salePrice,
                        'saleQty': saleQty,
                        'qty': qty
                };
                obj=JSON.stringify(obj);
                var url = "goods1.php?data="+obj;
                http.get({"url":url}).then(res=>{
                  console.log(res);
                })
                
            }

            }
        },
        mounted(){
            // var url = "goods1.php?data="+obj;
            http.get({"url":"repertory.php"}).then(res=>{
                this.dataset = res.data;
            })
            // axios({
            //     url: 'http://10.3.135.226:99/php/repertory.php',
            //     headers: {
            //         'Content-Type': 'application/x-www-form-urlencoded'
            //     }
            // }).then(res => {
            //     this.dataset = res.data;
            // })
        }
    }
</script>
<style>
    @import '../GoodsComponent/GoodsComponent.scss' 
</style>