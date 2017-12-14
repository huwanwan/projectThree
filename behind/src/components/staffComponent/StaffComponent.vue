<template>
    <div>
        <div class="location">
            <el-breadcrumb separator-class="el-icon-arrow-right">
            <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>员工管理</el-breadcrumb-item>
            <el-breadcrumb-item>普通员工</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th v-for="(value, key) in dataset[0]">{{key}}</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(object, index) in dataset">
                    <td v-for="(value, key) in object">{{object[key]}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<script>
    import axios from 'axios';
    import http from '../../utils/reqAjax.js'

    export default{
        data(){
            return {
                dataset: []
            }
        },
        mounted(){
            http.get({"url":"staff.php"}).then(res=>{
                this.dataset = res.data;
            })
            // axios({
            //     url: 'http://10.3.135.226:99/php/staff.php',
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
    @import './StaffComponent.scss'
</style>