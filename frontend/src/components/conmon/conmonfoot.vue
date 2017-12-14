<template>
    <footer id="conmonfooter">
        <ul>
            <li v-for="(item,index) in list" @click="checkList(index)" v-bind:class="{active : index == limit}" :key="index">
                <i :class="item.icon"></i>
                <span v-text="item.text"></span>
            </li>
        </ul>
    </footer>
</template>

<script>
    import '../../scss/conmonfoot.scss';
    export default {
        data:function(){
            return {
                logo:'./src/assets/image/logo.png',
                list:[
                    {
                        icon:'el-icon-mobile-phone',
                        text:'首页'
                    },
                    {
                        icon:'el-icon-menu',
                        text:'商品品类'
                    },
                    {
                        icon:'el-icon-service',
                        text:'咨询客服'
                    },
                    {
                        icon:'el-icon-edit-outline',
                        text:'购物清单'
                    },
                    {
                        icon:'el-icon-bell',
                        text:'个人中心'
                    }
                ],
                home:'<img :src="logo" @click="goHome"  />',
                router:['home','goodslist','service','cart','mycenter'],
                limit:0
            }
        },
        methods:{
            checkList:function(index){
                this.limit = index;
                this.$router.push({name:this.router[index]});
            }
        }
    }
</script>