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
            info:['等待发货','退单','金刀驸马酒一杯，美酒真情两相随'],
            filterColumns:['barCode','type','standard']
            }
        },
        components:{datagrid}
    }
</script>

