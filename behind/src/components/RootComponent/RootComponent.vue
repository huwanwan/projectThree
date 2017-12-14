<template>
  <div>
      <div class="header clearfix">
          <h1>后台管理系统</h1>
          <div class="header_right">
              <ul>
                  <el-button type="primary" @click="$router.push({path: '/'})">退出</el-button>
              </ul>
          </div>
      </div>
            <el-menu
              default-active="2"
              class="el-menu-vertical-demo menu"
              @open="handleOpen"
              @close="handleClose"
              background-color="#545c64"
              text-color="#fff"
              active-li-color="#EB9E05">
              <el-submenu index="1">
                <template slot="title">
                  <i class="el-icon-location"></i>
                  <span>用户管理</span>
                </template>
                  <el-menu-item index="1-1" @click="UserComponent">普通用户信息</el-menu-item>
                  <el-menu-item index="1-2">会员信息</el-menu-item>
              </el-submenu>
              <el-submenu index="2">
                <template slot="title">
                  <i class="el-icon-goods"></i>
                  <span>商品管理</span>
                </template>
                  <el-menu-item index="1-1" @click="$router.push({path: '/GoodsComponent'})">所有商品</el-menu-item>
                  <el-menu-item index="1-2" @click="$router.push({path: '/RepertoryComponent'})">上架管理</el-menu-item>
              </el-submenu>
              <el-submenu index="3">
                <template slot="title">
                  <i class="el-icon-message"></i>
                  <span>订单管理</span>
                </template>
                  <el-menu-item index="1-1">选项1</el-menu-item>
                  <el-menu-item index="1-2">选项2</el-menu-item>
              </el-submenu>
              <el-submenu index="4">
                <template slot="title">
                  <i class="el-icon-sort"></i>
                  <span>员工管理</span>
                </template>
                  <el-menu-item index="1-1" @click="$router.push({path: '/StaffComponent'})">普通员工</el-menu-item>
                  <el-menu-item index="1-2">选项2</el-menu-item>
              </el-submenu>
              <el-submenu index="5">
                <template slot="title">
                  <i class="el-icon-sold-out"></i>
                  <span>采购模块</span>
                </template>
                  <el-menu-item index="1-1">选项1</el-menu-item>
                  <el-menu-item index="1-2">选项2</el-menu-item>
              </el-submenu>
              <el-submenu index="6">
                <template slot="title">
                  <i class="el-icon-service"></i>
                  <span>客服管理</span>
                </template>
                  <el-menu-item index="1-1" @click="$router.push({path: '/ServerComponent'})">当前对话</el-menu-item>
                  <el-menu-item index="1-2">选项2</el-menu-item>
              </el-submenu>
            </el-menu>
          </el-col>
        </el-row>



        <div class="main">
            <router-view></router-view>
        </div>


  </div>
</template>

<script>
export default {
  name: 'RootComponent',
  data () {
    return {
      msg: ''
    }
  },
  methods: {
      handleOpen(key, keyPath) {
      },
      handleClose(key, keyPath) {
      },
      UserComponent(){
          this.$router.push("/UserComponent");
      }
  }
}
</script>
<style>
    @import './RootComponent.scss'
    
</style>