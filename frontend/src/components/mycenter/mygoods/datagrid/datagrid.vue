<template>
    <div class='orderContent'>
        <div class="mhLoading" v-show="show">
            <img src="src/assets/image/mhLoading.gif">
            客官稍等...
        </div>
        <div class='goodList'  v-for="(obj,index) in dataset">
            <p class='mhP1 mhP'>
                <span><i class='el-icon-date'></i>&nbsp;淘酿网</span>
                <span>{{bar[0]}}</span>
            </p>
            <div class='orderInfo'>
                <img  :src="obj.imgurl">
                <p>{{obj.details}}</p>
                <p>
                    <span>￥{{obj.price}}.00</span>
                    <span>&times;{{obj.qty}}</span>
                </p>
            </div>
            <p class="mhP2 mhP">
                <span>共&nbsp;&nbsp;<i>{{obj.qty}}</i>&nbsp;&nbsp;件商品&nbsp;&nbsp;实付金额：</span>
                <span>￥{{(obj.price)*(obj.qty)}}.00</span>
            </p>
            <p class='timePay'>
                <span><i class='el-icon-time'></i>&nbsp;{{bar[2]}}</span>
                <span>{{bar[1]}}</span>
            </p>
        </div>
        <p class='fpTips'>没有啦</p>
    </div>
</template>

<script>
    //订单模板格式
    import '../../../../scss/mhDatagrid.scss';
    import http from '../../../../utils/reqAjax';
    export default ({
        data:function(){
            return {
                dataset:[],
                show:true
            }
        },
        props:['api','filterCols','bar'],
        mounted:function(){
            var userName = window.localStorage.getItem('userName');
            let url = this.api + '?userName=' + userName + '&state=1';       
            http.get({'url':url}).then((res)=>{
                if(res.data.length>0){
                    res.data.forEach((item)=>{
                        item.qty = 1;
                    })
                    this.dataset = getQty(res.data);
                     function getQty(arr){
                        for(var i = 0;i < arr.length;i++){
                            for(var j = i+1;j < arr.length;j++){
                                if(arr[i].id == arr[j].id){
                                    arr[i].qty++;
                                    arr.splice(j,1);
                                    getQty(arr);
                                }
                            }
                        }
                        return arr;
                    }  
                    this.show = false;
                }
            })
            
        }
    })

</script>
