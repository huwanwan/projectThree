<template>
    <datagrid api="http://10.3.135.242:555/php/order.php" :filterCols ='filterColumns' :bar='info'></datagrid>

</template>

<script>
    import datagrid from '../datagrid/datagrid.vue';
    import '../../../../scss/base.scss'; 
    import '../../../../scss/allOrders.scss'; 

    export default {
        data:function(){
            return {
            info:['等待发货','去支付','23小时59分38秒'],
            filterColumns:['barCode','type','standard']
            }
        },
        components:{datagrid}
    }
</script>
