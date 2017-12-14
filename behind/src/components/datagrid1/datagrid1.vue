<template>
    <div>
        <div class="search clearfix">
            <el-input
              placeholder="请输入内容"
              v-model="input10"
              clearable class="goods_input">
            </el-input>
            <el-button type="primary" icon="el-icon-search" class="goods_search">搜索</el-button>
            <el-button type="success" icon="el-icon-plus" class="goods_btn" @click="dialogVisible = true">新增</el-button>
        </div>
        <table v-if="dataset.length > 0" class="table table-hover">
            <thead>
                <tr>
                    <th v-for="(value, key) in dataset[0]" v-if="filterCols.indexOf(key) < 0">{{key}}</th>
                    <th>edit</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(object, index) in dataset">
                    <td v-for="(value, key) in object" v-if="filterCols.indexOf(key) < 0">{{object[key]}}</td>
                    <td><el-button type="primary" size="small" data-toggle="modal" data-target=".bs-example-modal-lg" @click="edit($event, index)">编辑</el-button></td>
                    <td><el-button type="danger" size="small" @click="del($event)">删除</el-button></td>
                </tr>
            </tbody>
        </table>
        <el-dialog
          title="新增"
          :visible.sync="dialogVisible"
          width="65%"
          :before-close="handleClose">
          <label for="barCode">编码</label><el-input placeholder="请输入商品编码" id="barCode" class="input"></el-input>
          <label for="name">名称</label><el-input placeholder="请输入商品名字" id="name" class="input"></el-input>
          <label for="type">类型</label><el-input placeholder="请输入商品类型" id="type" class="input"></el-input>
          <label for="brand">品牌</label><el-input placeholder="请输入商品品牌" id="brand" class="input"></el-input>
          <label for="standard">规格</label><el-input placeholder="请输入商品规格" id="standard" class="input"></el-input>
          <label for="price">价格</label><el-input placeholder="请输入商品价格" id="price" class="input"></el-input><br />
          <label for="salePrice">优惠</label><el-input placeholder="请输入商品优惠价" id="salePrice" class="input"></el-input>
          <label for="qty">库存</label><el-input placeholder="请输入商品优惠价" id="qty" class="input"></el-input>

          <el-upload
            action=""
            list-type="picture-card"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove" class="upload">
            <i class="el-icon-plus"></i>
          </el-upload>
          

          <span slot="footer" class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="add">确 定</el-button>
          </span>
        </el-dialog>
          <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="width:50% ; margin: 0 auto;">
            <div class="modal-dialog modal-lg" role="document" style="width: 100%">
              <div class="modal-content" style=" padding:10px 15px; width:80%">
                  <h4 class="edit">编辑</h4>
                  <label>ID</label><el-input placeholder="ID" clss="ids" style="width: 35%; margin: 5px 10px" :disabled="true" v-model="ids"></el-input>
                  <label>编码</label><el-input placeholder="编码" clss="barCode" style="width: 35%; margin: 5px 10px" :disabled="true" v-model="barCode"></el-input>
                  <label>名字</label><el-input placeholder="名字" style="width: 35%; margin: 5px 10px" v-model="name"></el-input>
                  <label>类型</label><el-input placeholder="类型" style="width: 35%; margin: 5px 10px" v-model="type"></el-input>
                  <label>品牌</label><el-input placeholder="品牌" style="width: 35%; margin: 5px 10px" v-model="brand"></el-input>
                  <label>规格</label><el-input placeholder="规格" style="width: 35%; margin: 5px 10px" v-model="standard"></el-input>
                  <label>价格</label><el-input placeholder="价格" style="width: 35%; margin: 5px 10px" v-model="price"></el-input>
                  <label>优惠</label><el-input placeholder="优惠价" style="width: 35%; margin: 5px 10px" v-model="salePrice"></el-input>
                  <label>库存</label><el-input placeholder="库存" style="width: 35%; margin: 5px 10px" v-model="qty"></el-input>
                  <div>
                      <el-button type="info" plain data-dismiss="modal" style="margin-top: 20px">取消</el-button>
                      <el-button type="primary" @click="update">保存</el-button>
                  </div>
                  
              </div>

            </div>
          </div>
    </div>
</template>

<script>
    import axios from 'axios';
    import http from '../../utils/reqAjax.js';

    export default {
        data: function(){
            return {
                dataset: [],
                centerDialogVisible: false,
                input10: '',
                input: '',
                dialogVisible: false,
                dialogImageUrl: '',
                dialogVisible: false,
                barCode: '',
                name: '',
                ids:"",
                type: '',
                brand: '',
                standard: '',
                price: '',
                salePrice: '',
                qty: ''
            }
        },
        props: ['api', 'filterCols'],
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
            },
            add(){
                var barCode = $('#barCode').val();
                var name = $('#name').val();
                var type = $('#type').val();
                var brand = $('#brand').val();
                var standard = $('#standard').val();
                var price = $('#price').val();
                var salePrice = $('#salePrice').val();
                var qty = $('#qty').val();
                var obj = {
                        'barCode': barCode,
                        'name': name,
                        'type': type,
                        'brand': brand,
                        'standard': standard,
                        'price': price,
                        'salePrice': salePrice,
                        'qty': qty
                };
                obj=JSON.stringify(obj);
                var url = "goods1.php?data="+obj;
                http.get({"url":url}).then(res=>{
                  console.log(res);
                })
                
            },
            del(e){
              var e = e || window.event;
              var target = e.target || e.srcElement;
              if(target.tagName.toLowerCase() === 'span'){

              
                e.target.parentNode.parentNode.parentNode.remove(e.target.parentNode.parentNode.parentNode);
                var id = e.target.parentNode.parentNode.parentNode.childNodes[0].innerHTML;
                var url = "goods1.php?id="+id;
                http.get({"url":url}).then(res=>{
                  console.log(res);
                })
                
              }
            },
            edit($event, index){
                this.ids = this.dataset[index].id;
                this.barCode = this.dataset[index].barCode;
                this.name = this.dataset[index].name;
                this.type = this.dataset[index].type;
                this.brand = this.dataset[index].brand;
                this.standard = this.dataset[index].standard;
                this.price = this.dataset[index].price;
                this.salePrice = this.dataset[index].salePrice;
                this.qty = this.dataset[index].qty;
            },
            update(){
              console.log(this.id);
              
              var obj = {
                      'barCode': this.barCode,
                      'name': this.name,
                      'type': this.type,
                      'brand': this.brand,
                      'standard': this.standard,
                      'price': this.price,
                      'salePrice': this.salePrice,
                      'id': this.ids
              };
              obj=JSON.stringify(obj);
              var url = "goods1.php?dataUpdate="+obj;
              http.get({"url":url}).then(res=>{
                console.log(res);
              })
             
            }
        },
        mounted(){
            var url = "goods1.php?data=" + '';
            http.get({"url":url}).then(res=>{
              this.dataset = res.data;
              console.log(res);
            })
            
        }
    }
</script>
<style>
    @import './datagrid.scss'
</style>