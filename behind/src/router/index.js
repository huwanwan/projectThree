import Vue from 'vue'
import Router from 'vue-router'


import RootComponent from '../components/RootComponent/RootComponent.vue'
import GoodsComponent from '../components/GoodsComponent/GoodsComponent.vue'
import OrderComponent from '../components/OrderComponent/OrderComponent.vue'
import RepertoryComponent from '../components/RepertoryComponent/RepertoryComponent.vue'
import StaffComponent from '../components/staffComponent/StaffComponent.vue'
import ServerComponent from '../components/ServerComponent/ServerComponent.vue'
import LoginComponent from '../components/LoginComponent/LoginComponent.vue'
import UserComponent from '../components/User/User.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path:'/',
      name: 'LoginComponent',
      component: LoginComponent
    },
    {
      path: '/RootComponent',
      name: 'RootComponent',
      component: RootComponent,
      children: [
            {
                path: '/GoodsComponent',
                name: 'GoodsComponent',
                component: GoodsComponent
            },
            {
                path: '/OrderComponent',
                name: 'OrderComponent',
                component: OrderComponent
            },
            {
              path: '/RepertoryComponent',
              name: 'RepertoryComponent',
              component: RepertoryComponent
            },
            {
              path: '/StaffComponent',
              name: 'StaffComponent',
              component: StaffComponent
            },
            {
              path: '/ServerComponent',
              name: 'ServerComponent',
              component: ServerComponent
            },
            {
                path: '/UserComponent',
                name: 'UserComponent',
                component: UserComponent
            }
      ]
    }
  ]
})
