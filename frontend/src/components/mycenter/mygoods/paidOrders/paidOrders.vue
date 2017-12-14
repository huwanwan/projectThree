<template>
    <datagrid api="http://10.3.135.254/1993/" :filterCols ='filterColumns' :bar='info'></datagrid>

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
<template>
    <datagrid api="http://10.3.135.254/1993/" :filterCols ='filterColumns' :bar='info'></datagrid>

</template>

<script>
    import datagrid from '../datagrid/datagrid.vue';
    import '../../../../scss/base.scss'; 
    import '../../../../scss/allOrders.scss'; 

    export default {
        data:function(){
            return {
            info:['已付款','再次购买','真情品味尽在淘酿'],
            filterColumns:['barCode','type','standard']
            }
        },
        components:{datagrid}
    }
</script>
