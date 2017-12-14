<template>
   <div class='addressManage'>
            <div id = 'addressHeader'>
                <span @click="$router.push({name:'person'})"><i class='el-icon-arrow-left'></i></span>
                <span>地址管理</span>
            </div>
            <div class='addressCan'>
                <div class="addressNum" v-for="(obj,index) in info">
                    <div class='addressCon'>
                        <p>
                            <span>{{obj.nickName}}</span>
                            <span>{{obj.userName}}</span>
                        </p>
                        <p>{{obj.area}}</p>
                        <p>{{obj.dAddress}}</p>
                    </div>
                    <i class="el-icon-edit-outline" @click='addressInfo(index)'></i>
                </div>
            </div>
            <div class='addressBottom'>
                <div class="addC" @click='$router.push({name:"addAddress"})'>添加新地址</div>
            </div>
        </div>
    </div>
</template>

<script>
    
    import http from '../../../../utils/reqAjax.js'
    import '../../../../scss/base.scss'; 
    import '../../../../scss/address.scss'; 

    export default {
        data:function(){
            return {
            info:[],
            dataset:[],
            index:null
            }
        },
        methods:{
            addressInfo:function(index){
                //console.log(arguments)
                this.index = index;
                this.dataset.push(this.index);
                this.$router.push({name:"editAddress",params:this.dataset})
            }
        },
        mounted:function(){
            http.post({url:'user.php'}).then((res)=>{
                this.info =res.data;
                this.dataset.push(res.data);
            })
        }
    }

</script>