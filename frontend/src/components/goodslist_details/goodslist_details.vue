<template>
    <div class="goodslist">
        <conmonhead></conmonhead>
         <header>
           <ul>
                <li @click="show=3"  :class="{'active':show===3}">
                   <span><router-link to="/goodslist"><</router-link></span></li> 
                </li>
                <li @click="show=1"  :class="{'active':show===1}">
                   <span><router-link to="/goods">商品</router-link></span>
                </li>
                <li @click="show=2"  :class="{'active':show===2}">
                   <span><router-link to="/details">详情</router-link></span>
                </li> 
                <li @click="show=3"  :class="{'active':show===3}">
                   <span class="comment">评论</span>
                </li>           
           </ul>
       </header>
        <main>
            <router-view></router-view>
        </main>
        <div class="shade" v-if="showCar">
            <div class="carss">
                加入购物车成功！
            </div>
        </div>
        <footer>
            <ul>
                <li>
                   <span>客服</span>
                </li>
                <li>
                   <span @click='addCar'>加入购物车</span>
                </li>
        
                <li> 
                   <span @click='buyNow'>立即购买</span>
                </li>
            </ul>   
        </footer>
    </div>
</template>
<script>
    import '../../scss/goodslist_details.scss'
    import conmonhead from '../conmon/conmonhead.vue'
    import http from '../../utils/reqAjax.js'
    import axios from 'axios'
    import qs from 'qs'
    export default{
        data:function(){
            return {
                id:this.$route.params.goodId||window.sessionStorage.getItem('save'),
                dataset:[],
                idAll:[],
                num:'',
                show:1,
                showCar:0,
                userName:''
            }
        },
        components:{
            conmonhead
        },
        methods:{
            ad:function(num){
                this.num = num;
        
                this.idAll=[];
                for(var i=0;i<num;i++){
                    this.idAll.push(this.id);
                }   
            },
            addCar:function(){
                this.userName = window.localStorage.getItem("userName");
                this.showCar = 1;
                setTimeout(function(){
                    this.showCar = false;
                   
                }.bind(this),1500)
                //var username = window.sessionStorage.getItem('username');
                if(this.userName==null){
                     this.$router.push({name:'login'});
                }else{
                    let url = "cart.php?userName=" + this.userName + '&goodsId=' + this.idAll;
                    http.get({'url':url}).then((res)=>{
                        console.log(res.data)
                    })
                }
               

            },
            buyNow:function(){
                this.userName = window.localStorage.getItem("userName");
                //console.log(this.userName)
                if(this.userName==null){
                    this.$router.push({name:'login'});
                }else{
                    
                    http.post({url:"user.php","parmas":{"userName":this.userName}}).then(res=>{
                       
                        var address = res.data[0].dAddress;
                        if(address ==null){
                             this.$router.push({name:'payment',params:{goodId:this.id,num:this.num,userName:this.userName}});
                        }else{
                             this.$router.push({name:'payment',params:{goodId:this.id,num:this.num,address:address,userName:this.userName}});
                        }
				    })
                   
                }
                
               

              
            }
        },
        mounted(){ 
           // console.log(this.$children)
            let url = "goodslist.php?goodId=" + this.id;
            http.get({'url':url}).then(res=>{
                if(res.data.length>1){
                    return;
                }else{
                    this.dataset = res.data; 
                }
            })

        }
    }

</script>

