<template>
    <div id="user">
        <h3>用户信息</h3>
        <!-- <el-button type="text" @click="dialogVisible = true">添加</el-button> -->
        <el-input placeholder="请输入内容" v-model="num" clearable></el-input>
        <el-button type="success" plain @click="search">搜索</el-button>
        <el-button type="success" plain @click="search1" v-show="seach_b">返回</el-button>
        <el-button type="success" plain @click="dialogVisible = true">添加</el-button>
        <el-dialog
        title="用户信息"
        :visible.sync="dialogVisible"
        width="40%"
        :before-close="handleClose">
            <label for="username">用户名 :</label><el-input placeholder="请输入用户名" v-model="username" clearable id="username" v-on:blur="changeCount(username)"></el-input>
            <p v-show="show">该用户已被注册，换一个呗！</p>
            <p v-show="hide">输入的用户名格式错误！</p>
            <label for="password">密码 :</label><el-input placeholder="请输入密码" v-model="password" clearable id="password"></el-input>
            <label for="nickName">昵称 :</label><el-input placeholder="请输入昵称" v-model="nickName" clearable id="nickName"></el-input>
            <label for="userImg">图片 :</label>
            <el-upload
            action="http://10.3.135.242:555/php/user.php"
            list-type="picture-card"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove">
            <i class="el-icon-plus"></i>
            </el-upload>
            <label for="history">历史足迹 :</label><el-input placeholder="请输入历史足迹" v-model="history" clearable id="history"></el-input>
            <label for="dAddress">默认收货地址 :</label><el-input placeholder="请输入默认收货地址" v-model="dAddress" clearable id="dAddress"></el-input>
            <label for="address1">收货地址1 :</label><el-input placeholder="请输入收货地址1" v-model="address1" clearable id="address1"></el-input>
            <label for="address2">收货地址2 :</label><el-input placeholder="请输入收货地址2" v-model="address2" clearable id="address2"></el-input>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="save($event)">确 定</el-button>
                <el-button @click="dialogVisible = false">取 消</el-button>
            </span>
        </el-dialog>
        <datagrid api="http://10.3.135.242:555/php/user.php" :filterCols="filterColumns"></datagrid>
    </div>
</template>

<script>
    import axios from 'axios'
    import qs from 'qs'
    import datagrid from '../datagrid/datagrid.vue';
    import http from '../../utils/reqAjax.js'
    import "./User.scss"
    export default {
        data() {
            return {
                dialogImageUrl: '',
                password: '',
                username: '',
                nickName:"",
                userImg:"",
                history:"",
                dAddress:"",
                address1:"",
                address2:"",
                update:"",
                num:"",
                show:false,
                hide:false,
                seach_b:false,
                url:"user.php",
                filterColumns: ['password','id','address3','address4'],
                dialogVisible: false
            };
        },
        methods:{
            handleRemove(file, fileList) {
                console.log(file, fileList);
            },
            handlePictureCardPreview(file) {
                this.dialogImageUrl = file.url;
                this.dialogVisible = true;
                console.log(this.dialogImageUrl)
            },
            handleClose(done) {
                this.$confirm('确认关闭？')
                .then(_ => {
                    done();
                    this.show = false;
                    this.hide = false;
                    this.username = "";
                    this.password = "";
                })
                .catch(_ => {
                    
                });
            },
            // 添加事件
            save($event){
                this.dialogVisible = false;
                
                this.$children[5].save1();
            },
            search(){
                this.$children[5].search();
                if(this.num != ""){
                    this.seach_b = true;
                }
                this.num = "";
            },
            search1(){
                this.$children[5].search1();
                this.seach_b = false;
            },
            changeCount(value){
                this.hide = false;
                var reg = /^\d{11}$/g;
                if(reg.test(value)){
                    // 发ajax请求
                    http.post({"url":'user.php', params: {userName:value}}).then(res=>{
                        if(res.data == false){
                            this.show = true;
                            this.hide = false;
                        }else if(res.data == true){
                            this.show = false;
                            this.hide = false;
                        }
                    })
                    // axios({
                    //     url: this.url,
                    //     method: 'post',
                    //     data: qs.stringify({userName:value}),
                    //     headers: {
                    //         'Content-Type': 'application/x-www-form-urlencoded'
                    //     }
                    // }).then(res => {
                    //     console.log(res.data)
                    //     if(res.data == false){
                    //         this.show = true;
                    //         this.hide = false;
                    //     }else if(res.data == true){
                    //         this.show = false;
                    //         this.hide = false;
                    //     }
                    // })
                }else{
                    this.hide = true;
                    this.show = false;
                }
                
            }
        },
        components: {
            datagrid
        }
        // mounted:function(){
        //     var data = {
        //         state:'查询',
        //         userName:123
        //     };
        //     axios({
        //         url: this.url,
        //         method: 'post',
        //         data: qs.stringify(data),
        //         headers: {
        //             'Content-Type': 'application/x-www-form-urlencoded'
        //         }
        //     }).then(res => {

        //         console.log(res.data)
        //     })
        // }
    }
</script>

<style lang="scss" scoped>
    div.upload{
        input.el-upload__input{
            margin-bottom: 20px;
        }
    }
</style>


