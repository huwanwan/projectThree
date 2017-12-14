<template>
    <div>
        <table v-if="dataset.length > 0" class="table table-bordered table-condensed table-hover table-striped">
            <thead>
                <tr>
                    <th v-for="(value, key) in dataset[0]" v-if="filterCols.indexOf(key) < 0">{{key}}</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(object, index) in dataset">
                    <td v-for="(value, key) in object" v-if="filterCols.indexOf(key) < 0">{{object[key]}}</td>
                    <td>
                        <el-button type="success" plain @click="edit($event,index)">编辑</el-button>
                        <el-button type="success" plain @click="btn($event,index)">删除</el-button>
                    </td>
                </tr>
            </tbody>
        </table>
        <el-dialog
        title="用户信息"
        :visible.sync="dialogVisible"
        width="40%"
        :before-close="handleClose">
            <label for="userName">用户名 :</label><el-input placeholder="请输入用户名" v-model="userName" clearable id="userName" disabled>{{userName}}</el-input>
            <label for="nickName">昵称 :</label><el-input placeholder="请输入昵称" v-model="nickName" clearable id="nickName">{{nickName}}</el-input>
            <label for="userImg">图片 :</label><el-input placeholder="请输入图片路径" v-model="userImg" clearable id="userImg">{{userImg}}</el-input>
            <label for="history">历史足迹 :</label><el-input placeholder="请输入历史足迹" v-model="history" clearable id="history" disabled></el-input>
            <label for="dAddress">默认收货地址 :</label><el-input placeholder="请输入默认收货地址" v-model="dAddress" clearable id="dAddress">{{dAddress}}</el-input>
            <label for="address1">收货地址1 :</label><el-input placeholder="请输入收货地址1" v-model="address1" clearable id="address1">{{address1}}</el-input>
            <label for="address2">收货地址2 :</label><el-input placeholder="请输入收货地址2" v-model="address2" clearable id="address2">{{address2}}</el-input>
            <label for="update">更新时间 :</label><el-input placeholder="请输入更新时间" v-model="update" clearable id="update">{{update}}</el-input>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="save($event)">保 存</el-button>
                <el-button @click="dialogVisible = false">取 消</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
    import http from '../../utils/reqAjax.js'

    export default {
        data: function(){
            return {
                userName:"",
                nickName:"",
                userImg:"",
                history:"",
                dAddress:"",
                address1:"",
                address2:"",
                update:"",
                dialogVisible: false,
                val:"",
                state:"",
                dataset: []
            }
        },
        props: ['api', 'filterCols'],
        methods:{
            // 删除事件
            btn($event,index){
                // console.log(this.dataset)
                // console.log($event.path[3].children[0].innerHTML)
                var userName = this.dataset[index].userName;
                http.post({"url":this.api, params: {userName: userName,state:"删除"}}).then(res=>{
                    console.log(res)
                    if(res.date != "false"){
                        this.dataset = res.data;
                    }
                })
                // axios({
                //     url: this.api,
                //     data: qs.stringify({userName:userName,state:"删除"}),
                    
                //     method: 'post',
                //     headers: {
                //         'Content-Type': 'application/x-www-form-urlencoded'
                //     }
                // }).then(res => {
                //     console.log(res)
                //     if(res.date != "false"){
                //         this.dataset = res.data;
                //     }
                // })
            },
            // 保存事件
            save($event){
                this.dialogVisible = false;
                var data = {
                    state:"修改",
                    userName:this.userName,
                    nickName:this.nickName,
                    userImg:this.userImg,
                    dAddress:this.dAddress,
                    address1:this.address1,
                    address2:this.address2,
                    update:this.update
                };
                http.post({"url":this.api, params: data}).then(res=>{
                    console.log(res)
                    if(res.date != "false"){
                        this.dataset = res.data;
                    }
                })
                // axios({
                //     url: this.api,
                //     data: qs.stringify(data),
                //     method: 'post',
                //     headers: {
                //         'Content-Type': 'application/x-www-form-urlencoded'
                //     }
                // }).then(res => {
                //     console.log(res)
                //     if(res.date != "false"){
                //         this.dataset = res.data;
                //     }
                // })
            },
            save1(){
                var data = {
                    state:"增加",
                    userName:this.$parent.username,
                    password:this.$parent.password,
                    nickName:this.$parent.nickName,
                    userImg:this.$parent.dialogImageUrl,
                    dAddress:this.$parent.dAddress,
                    address1:this.$parent.address1,
                    address2:this.$parent.address2,
                };
                http.post({"url":this.api, params: data}).then(res=>{
                    console.log(res)
                    if(res.date != "false"){
                        this.dataset = res.data;
                    }
                })
                // axios({
                //     url: this.api,
                //     data: qs.stringify(data),
                //     method: 'post',
                //     headers: {
                //         'Content-Type': 'application/x-www-form-urlencoded'
                //     }
                // }).then(res => {
                //     console.log(res)
                //     if(res.date != "false"){
                //         this.dataset = res.data;
                //     }
                // })
            },
            // 搜索事件
            search(){
                if(this.$parent.num != ""){
                    var userName = this.$parent.num;
                    http.post({"url":this.api, params: {userName:userName,state:"查询"}}).then(res=>{
                        console.log(res)
                        this.dataset = res.data;
                    })
                    // axios({
                    //     url: this.api,
                    //     method: 'post',
                    //     data: qs.stringify({userName:userName,state:"查询"}),
                    //     headers: {
                    //         'Content-Type': 'application/x-www-form-urlencoded'
                    //     }
                    // }).then(res => {
                    //     this.dataset = res.data;
                    // })
                }
            },
            search1(){
                http.post({"url":this.api, params: {userName:this.val,state:this.state}}).then(res=>{
                    console.log(res)
                    this.dataset = res.data;
                })
                // axios({
                //     url: this.api,
                //     method: 'post',
                //     // data:qs.stringify({userName:this.val,state:this.state}),
                //     headers: {
                //         'Content-Type': 'application/x-www-form-urlencoded'
                //     }
                // }).then(res => {
                //     console.log(res)
                //     this.dataset = res.data;
                // })
            },
            // 编辑事件
            edit($event,index){
                this.dialogVisible = true;
                var date = new Date();
                date = date.toLocaleString();
                date = date.replace(/[\u4E00-\u9FA5]{2}/g,"");
                this.userName = this.dataset[index].userName;
                this.nickName = this.dataset[index].nickName;
                this.userImg = this.dataset[index].userImg;
                this.history = this.dataset[index].history;
                this.dAddress = this.dataset[index].dAddress;
                this.address1 = this.dataset[index].address1;
                this.address2 = this.dataset[index].address2;
                this.update = date;
            },
            handleClose(done) {
                this.$confirm('确认关闭？')
                .then(_ => {
                    done();
                    this.show = false;
                    this.hide = false;
                    
                })
                .catch(_ => {
                    
                });
            }
        },
        mounted(){
            http.post({"url":this.api, params: {userName:this.val,state:this.state}}).then(res=>{
                console.log(res)
                this.dataset = res.data;
            })
            // axios({
            //     url: this.api,
            //     method: 'post',
            //     // data:qs.stringify({userName:this.val,state:this.state}),
            //     headers: {
            //         'Content-Type': 'application/x-www-form-urlencoded'
            //     }
            // }).then(res => {
            //     console.log(res)
            //     this.dataset = res.data;
            // })
        }
    }
</script>

<style lang="scss" scoped>
    tabel{
        width:80%;
        tr{
            td{

            }
        }
    }
</style>

