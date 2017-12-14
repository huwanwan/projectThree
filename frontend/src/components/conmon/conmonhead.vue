<template>
    <header id="conmonheader">
        <h1 @click="goHome">淘酿网</h1>
        <div>
            <i class="el-icon-search"></i>
            <input type="text" v-model="hotSearch" @click="goSearch" />
        </div>
        <p><img :src="userHead" @click="login" /></p>
    </header>
</template>

<script>
    import '../../scss/conmonhead.scss';
    export default {
        data:function(){
            return {
                userHead:'./src/assets/image/defultHead.jpg',
                hotSearch:'淘你最喜欢的佳酿',
               
            }
        },
        methods:{
            goHome:function(){
                this.$router.push({name:'home'});
            },
            login:function(){
               this.$emit('login');         
            },
            goSearch:function(){
                this.$router.push({name:'history'});
            }

        }
    }

</script>