<template>
    <div class="allGoods">
        <div class="brand">
            <el-breadcrumb separator-class="el-icon-arrow-right">
            <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>商品管理</el-breadcrumb-item>
            <el-breadcrumb-item>所有商品</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        
            <datagrid1 api="http://10.3.135.242:555/php/goods1.php" :filterCols="filterColumns"></datagrid1>
            
    </div>
</template>
<script>
    import datagrid1 from '../datagrid1/datagrid1.vue'
    export default {
        data() {
            return {
                dataset: [],
                filterColumns: ['details', 'keepDate', 'date', 'qty', 'area', 'saleQty'],
                input10: '',
                input: '',
                dialogVisible: false,
                dialogImageUrl: '',
                dialogVisible: false
            }
          },
        methods: {
            handleClose(done) {
                this.$confirm('确认关闭？').then(_ => {done();}).catch(_ => {});
            },
            handleRemove(file, fileList) {
                console.log(file, fileList);
            },
            handlePictureCardPreview(file) {
                this.dialogImageUrl = file.url;
                this.dialogVisible = true;
            }
            
        },
        components: {
            datagrid1
        }
    }
</script>
<style>

    @import './GoodsComponent.scss';
    
</style>