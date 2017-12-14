<template>
	<div>
		<div class="cc">
		 	<p class="top">
		 		<span @click='sales'>销量</span>
		 		<span @click='price'>价钱</span>
		 	</p>
		 </div>
		<ul v-if='dataset.length>0' >
			<li v-for='(object,index) in dataset'  v-if='dataset[index].type == filterColumns' :id='dataset[index].id' @click='goods(dataset[index].id)'>
				<div class="Img">
					<img :src='object.imgurl'>
				</div>
				<div class="data">
					<!-- <p class="name">名称：{{object.name}}</p> -->
					<p class="type">品类：{{object.type}}</p>
					
					<p class="price">价钱：<span>￥{{object.price}}</span> <span>￥{{object.salePrice}}</span></p>
					
					<p class="type">销量：{{object.saleQty}}</p>
					<p class="details">{{object.details}}  <span>{{object.standard}}</span></p>			
				</div>
			</li>
		</ul>
	</div>
</template>

<script type="text/javascript">
	import axios from 'axios';
	import qs from 'qs';
	import http from '../../utils/reqAjax.js'
	export default{
		data:function(){
			return {
				dataset:[],
				state:true
				
			}
		},
		methods:{
			aa:function(){
				var url = this.api+'?goodId='+this.id;
				http.get({url:url}).then(res=>{
					//console.log(res.data)
					this.dataset = res.data;	
					//this.$router.push({name:'goodslist'})
				}) 
				
			},
			goods:function(id){
				this.$router.push({name:'goods',params:{goodId:id}});
				window.sessionStorage.setItem('save',id)
				
			},
			sales:function(){
				http.post({"url":"goods.php","parmas":{"type":this.filterColumns[0],"price":'saleQty',"state":this.state}}).then(res=>{
						this.state = !this.state;
						this.dataset = res.data;
					
					
					
				});

			}, 
			price:function(){
				http.post({"url":"goods.php","parmas":{"type":this.filterColumns[0],"price":'price',"state":this.state}}).then(res=>{
					this.state = !this.state;
					this.dataset = res.data;
				})

			}
		},
		props:['api','filterColumns'],
		mounted(){
			var FilterColumns = window.sessionStorage.getItem('filterColumns');
			if(FilterColumns == null){
					this.filterColumns = this.filterColumns;
			}else{
				this.filterColumns = FilterColumns
			}
			
			console.log(this.id)
			var url = this.api+'?goodId='+this.id;
			
			http.get({url:url}).then(res=>{
				//console.log(res.data)
				this.dataset = res.data;	
				//this.$router.push({name:'goodslist'})
			}) 
		}
	}
</script>