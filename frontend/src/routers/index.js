import Vue from 'vue';
import VueRouter from 'vue-router';
import ElementUI from 'element-ui';
import mycenterComponent from '../components/mycenter/mycenter.vue';
import setupComponent from '../components/mycenter/setup/setup.vue';
import mygoodsComponent from '../components/mycenter/mygoods/mygoods.vue';
import myWalletComponent from '../components/mycenter/myWallet/myWallet.vue';
import collectComponent from '../components/mycenter/collect/collect.vue';
import allOrdersComponent from '../components/mycenter/mygoods/allOrders/allOrders.vue';
import pendingComponent from '../components/mycenter/mygoods/pending/pending.vue';
import paidOrdersComponent from '../components/mycenter/mygoods/paidOrders/paidOrders.vue';
import readySendComponent from '../components/mycenter/mygoods/readySend/readySend.vue';
import sentComponent from '../components/mycenter/mygoods/sent/sent.vue';
import footprintComponent from '../components/mycenter/footprint/footprint.vue';
import personComponent from '../components/mycenter/person/person.vue';
import addressComponent from '../components/mycenter/person/address/address.vue';
import addAddressComponent from '../components/mycenter/person/address/addAddress/addAddress.vue';
import editAddressComponent from '../components/mycenter/person/address/editAddress/editAddress.vue';


// 引入路由文件;
import register from '../components/register/register.vue' ;
import login from '../components/login/login.vue';
import home from '../components/home/home.vue';
import cart from '../components/cart/cart.vue';
import search from '../components/search/search.vue' ;
import history from '../components/search/history.vue';
import searchlist from '../components/search/searchlist.vue';
// 志伟部分；
import goodslist from  '../components/goodslist/goodslist.vue'
import goodslistDetails from  '../components/goodslist_details/goodslist_details.vue'
import goods from  '../components/goods/goods.vue'
import details from  '../components/details/details.vue'
import payment from  '../components/payment/payment.vue'
import paySuccess from  '../components/paySuccess/paySuccess.vue'
import '../../node_modules/element-ui/lib/theme-chalk/index.css';
Vue.use(VueRouter);
Vue.use(ElementUI);

var router = new VueRouter({
    routes:[
        {
            path:'/mycenter',
            name:'mycenter',
            component:mycenterComponent,
        },
        {
            path:'/setup/:res',
            name:'setup',
            component:setupComponent
        },
        {
            path:'/footprint',
            name:'footprint',
            component:footprintComponent
        },
        {
            path:'/person',
            name:'person',
            component:personComponent
        },
         {
            path:'/address',
            name:'address',
            component:addressComponent
        },
        {
            path:'/collect',
            name:'collect',
            component:collectComponent
        },
        {
            path:'/addAddress',
            name:'addAddress',
            component:addAddressComponent
        },
        {
            path:'/editAddress',
            name:'editAddress',
            component:editAddressComponent
        },
        {
            path:'/mygoods',
            name:'mygoods',
            component:mygoodsComponent,
            children:[{
                    path:'allOrders/:res',
                    name:'allOrders',
                    component:allOrdersComponent
                },
                {
                    path:'pending/:res',
                    component:pendingComponent
                },
                {
                    path:'paidOrders/:res',
                    component:paidOrdersComponent
                },
                 {
                    path:'readySend/:res',
                    component:readySendComponent
                },
                 {
                    path:'sent/:res',
                    component:sentComponent
                }
            ]
        },
        {
            path:'/myWallet',
            name:'myWallet',
            component:myWalletComponent,
        },
        {
            path:'/register',
            name:'register',
            component:register
        },
        {
            path:'/login',
            name:'login',
            component:login
        },{
            path:'/',
            name:'home',
            component:home
        },{
            path:'/cart',
            name:'cart',
            component:cart
        },{
            path:'/search',
            name:'search',
            component:search,
            children:[
                {path:'history',
                 name:'history',
                 component:history
                },{
                    path:'searchlist',
                    name:'searchlist',
                    component:searchlist
                }
            ]   
        },{

            path:'/goodslist',
            name:'goodslist',
            component:goodslist
        },
        {   path:'/goodslistDetails',
            name:'goodslistDetails',
            component:goodslistDetails,
            children:[
                {path: '/goods', name:'goods',component:goods},
                {path: '/details', name:'details',component:details}
            ]
        },
        {
            path:'/payment',
            name:'payment',
            component:payment
        },
        {
            path:'/paySuccess',
            name:'paySuccess',
            component:paySuccess
        },
        {
            path: '/cart',
            name: 'cart',
            component: cart
        }
    ]
})

export default router;
