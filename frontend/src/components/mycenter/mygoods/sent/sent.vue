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
            info:['等待收货','查看物流','预计三天后送达'],
            filterColumns:['barCode','type','standard']
            }
        },
        components:{datagrid}
    }
</script>
