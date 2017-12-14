<template>
    <div class="background">

        <img src="../../assets/backgound.jpg" style="width: 100%; hight: 100%;"/>
        <div class="login">
            <h3>用户登录</h3>
            <form class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label" id="username">用户名</label>
                <div class="col-sm-10">
                  <input type="email" class="form-control " id="inputEmail3" placeholder="用户名" style="width: 80%; height:45px;" v-model="username">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label" >密码</label>
                <div class="col-sm-10">
                  <input type="password" class="form-control password" id="inputPassword3" placeholder="密码" style="width: 80%; height:45px;" v-model="password">
                </div>
                <el-button type="success" id="login" @click="openFullScreen2" >登录</el-button>
              </div>
            </form>
        </div>
    </div>
</template>
<script>
    import { Loading } from 'element-ui';
    import http from '../../utils/reqAjax.js'


    export default{
        data() {
            return {
              input: '',
              username: '',
              password: ''
            }
        },
        methods: {
            openFullScreen2() {
                if(!/^\d{6,20}$/.test(this.username)){
                    alert('用户名不合法');
                    return false;
                }
                if(!/^\S{6,20}$/.test(this.password)){
                    alert('密码不合法');
                    return false;
                }
                
                http.post({"url":"user.php", 'params': {'userName': this.username,'password': this.password}}).then(res=>{
                    console.log(res.data)
                    if(res.data == true){
                        const loading = this.$loading({
                            lock: true,
                            text: '登陆中',
                            spinner: 'el-icon-loading',
                            background: 'rgba(0, 0, 0, 0.7)'
                        });

                        setTimeout(() => {
                            loading.close();
                            this.$router.push('/RootComponent')
                        }, 1000);
                    }else{
                        alert('用户名或密码不存在');
                    }
                });
               
            }
        }
    }
</script>
<style>
    @import './LoginComponent.scss'
</style>