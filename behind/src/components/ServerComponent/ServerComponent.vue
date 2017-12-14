<template>
    <div class="server">
        <div class="server_header"></div>
        <div class="server_footer">
            <el-input
              type="textarea"
              :rows="2"
              placeholder="请输入内容"
              v-model="textarea" style="width: 60%">
            </el-input>
            <el-button type="success" class="send_msg" @click="send">发送</el-button>
        </div>
    </div>
</template>
<script>
    export default{
        data() {
            return {
              textarea: ''
            }
        },
        methods: {
            send(){
                var socket = io.connect('ws://localhost:90');
                
            }
        },
        mounted(){
            
        }
    }
</script>
<style>
    @import './ServerComponent.scss'
</style>