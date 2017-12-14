
<template>
    <div class='person'>
       <div id = 'personHeader'>
            <span @click="$router.push({name:'mycenter'})"><i class='el-icon-arrow-left'></i></span>
            <span>我的信息</span>
        </div>
        <div class='personModule'>
            <div class='personHead'>
                 <span>头像</span>
                 <div class='phBox'>
                    <div class='phRight'>
                        <div class='headCan'>
                            <img src='../../../assets/image/defultHead.jpg'>
                        </div>
                        <el-upload
                             class="upload-demo"
                             action="https://jsonplaceholder.typicode.com/posts/"
                             :on-preview="handlePreview"
                             :on-remove="handleRemove"
                             multiple
                             :limit="1"
                             :on-exceed="handleExceed"
                             :file-list="fileList">
                             <el-button size="small" type="primary"></el-button>
                             <div slot="tip" class="el-upload__tip"></div>
                        </el-upload>
                    </div>
                    <i class='el-icon-arrow-right'></i>
                 </div>
            </div>
            <div class='commonModule'>
                <span>用户名</span>
                <span>{{username}}<i class='el-icon-arrow-right'></i></span>
            </div>
            <div class='commonModule' @click='clickName'>
                <span>昵称</span>
                <span>{{nickName}}<i class='el-icon-arrow-right'></i></span>
            </div>
             <div class="commonModule" @click='sex'>
                <span>性别</span>
                <span>{{gender}}<i class='el-icon-arrow-right'></i></span>
            </div>
             <div class="commonModule" @click='birthDay'>
                <span>生日</span>
                <span>{{birthday}}<i class='el-icon-arrow-right'></i></span>
            </div>
        </div>
        <div class="commonModule address"  @click="$router.push({name:'address'})">
            <span>地址管理</span>
            <span><i class='el-icon-arrow-right'></i></span>
        </div>
        <div class='decoration'>
            <div class='dec'></div>
        </div>
        <div class='commonModule account'>
            <span>账号与安全</span>
            <span>完善信息有礼<i class='el-icon-arrow-right'></i></span>
        </div>
        <div class="shade" v-if='showName'>
            <div class='editName'>
                <div class='mh1'>
                    <span>昵称：</span>
                    <input type='text' placeholder = '昵称:' v-model='nickName'>
                </div>
                <p>
                    <span @click="cancel">取消</span>
                    <span @click="yes">确定</span>
                </p>
            </div>
        </div>
        <div class="shade" v-if='showGender'>
            <div class='editName'>
                <div class='mh1'>
                    <span>性别：</span>
                    <input type='text' placeholder = '性别:' v-model='gender'>
                </div>
                <p>
                    <span @click="cancel">取消</span>
                    <span @click="yes">确定</span>
                </p>
            </div>
        </div>
        <div class="shade" v-if='showDate'>
            <div class="editDate editName">
                <div class='mh1'>
                    <span>生日：</span>
                    <input type='date' v-model='birthday'>
                </div>
                <p>
                    <span @click="cancel">取消</span>
                    <span @click="yes">确定</span>
                </p>
            </div>
        </div>
    </div>
</template>

<script>
    import '../../../scss/base.scss'; 
    import '../../../scss/person.scss'; 

    export default {
        data:function(){
            return {
                username:'',
                nickName:'大雄',
                gender:'男',
                birthday:'1994-1-10',
                showName:0,
                showGender:0,
                showDate:0,
                fileList: [],
                value1: '',
                value2: '',
            }
        },
        methods: {
          handleRemove(file, fileList) {
            //console.log(file, fileList);
          },
          handlePreview(file) {
            //console.log(file);
          },
          handleExceed(files, fileList) {
            this.$message.warning(`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
          },
          clickName:function(){
                this.showName = 1;
          },
          sex:function(){
                this.showGender = 1;
          },
          birthDay:function(){
                this.showDate= 1;
          },
          yes:function(){
                this.showName = 0;
                this.showGender = 0;
                this.showDate= 0;
          },
          cancel:function(){
                this.showName = 0;
                this.showGender = 0;
                this.showDate= 0;
          }
    },
    mounted:function(){
       var userName = window.localStorage.getItem('userName');
       this.username = userName;
    }
    }

</script>
