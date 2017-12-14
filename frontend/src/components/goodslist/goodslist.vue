<template>
    <div class="datalist">
      <conmonhead></conmonhead>
     	<main> 
        <ul class='tac'>
          <li @click='Wines' :class="{'active':show===1}"><span>{{wines}}</span></li>
          <li @click='White' :class="{'active':show===2}"><span>{{white}}</span></li>
          <li @click='Beer' :class="{'active':show===3}"><span>{{beer}}</span></li>
          <li @click='Grape' :class="{'active':show===4}"><span>{{grape}}</span></li>
          <li @click='OldWine' :class="{'active':show===5}"><span>{{oldWine}}</span></li>
          <li @click='NewWine' :class="{'active':show===6}"> <span>{{newWine}}</span></li>
          <li @click='FavorableWine' :class="{'active':show===7}"><span>{{favorableWine}}</span></li>
          <li @click='HotWine' :class="{'active':show===8}"><span>{{hotWine}}</span></li>
        </ul>           
        <div class="content">
        <Goodsdatagrid api="http://10.3.135.242:555/php/datalist.php" :filterColumns="filterColumns"></Goodsdatagrid>
        </div>
     	</main>
      <conmonfoot></conmonfoot>
    </div>  
</template>
<script type="text/javascript">
	import Goodsdatagrid from '../Goodsdatagrid/Goodsdatagrid.vue'
  import conmonfoot from '../conmon/conmonfoot.vue'
  import conmonhead from '../conmon/conmonhead.vue'
  import '../../scss/goodslist.scss'
	export default {
		data:function(){
			return {
              beer:'啤酒',
              white:'白酒',
              grape:'葡萄酒',
              wines:'洋酒',
              oldWine:'老酒',
              newWine:'新品',
              favorableWine:'优惠',
              hotWine:'热销',
              filterColumns: ['洋酒'],
              isActive:'true',
              show:1
			}
		},
		components:{
			Goodsdatagrid,
            conmonfoot,
            conmonhead
		},
		methods: {

            Wines:function(){
                this.$children[1].aa();
                this.filterColumns = [this.wines];
                this.show=1;
            },
            White:function(){
                this.$children[1].aa();
                this.filterColumns = [this.white];
                this.show=2;
            },
            Beer:function(){
                this.$children[1].aa();
                this.filterColumns = [this.beer];
                this.show=3;
            },
            Grape:function(){
                this.$children[1].aa();
                this.filterColumns = [this.grape];
                this.show=4;
            },
            
            OldWine:function(){
                this.$children[1].aa();
                this.filterColumns = [this.oldWine];
                this.show=5;
            },
            NewWine:function(){
                this.$children[1].aa();
                this.filterColumns = [this.newWine];
                this.show=6;
            },
            FavorableWine:function(){
                this.$children[1].aa();
                this.filterColumns = [this.favorableWine];
                this.show=7;
            },
            HotWine:function(){
                this.$children[1].aa();
                this.filterColumns = [this.hotWine];
                this.show=8;
            },
        },
        mounted:function(){
        //console.log(this)
            this.$children[2].limit = 1;
            this.filterColumns = [this.$route.params.filterColumns];
            if(this.filterColumns=='白酒'){
                this.White();
            }
            if(this.filterColumns=='啤酒'){
                this.Beer();
            }
            if(this.filterColumns=='葡萄酒'){
                this.Grape();
            }
            if(this.filterColumns=='洋酒'){
                this.Wines();
            }
            if(this.filterColumns=='老酒'){
                this.OldWine();
            }
            if(this.filterColumns=='新品'){
                this.NewWine();
            }
            if(this.filterColumns=='优惠'){
                this.FavorableWine();
            }
            if(this.filterColumns=='热销'){
                this.hotWine();
            }
            if(this.filterColumns==''){
                this.filterColumns=['洋酒'];
            }
        
        }

    }
</script>
 

