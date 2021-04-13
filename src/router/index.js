import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Home from '@/views/home/home'
import Info from '@/views/info/info'
import Create from '@/views/collection/create'
import Community from '@/views/about/community'

Vue.use(Router)

export default new Router({
  routes: [
  {
      path:'/',
      name:'hello-world',
      component: HelloWorld
  },
  {
      path: '/home',
      name: 'home',
      component: Home
  },
  {
      path: '/info',
      name: 'info',
      component: Info
  },
  {
      path: '/create',
      name: 'create',
      component: Create
  },
  {
      path: '/community',
      name: 'community',
      component: Community
  }

  ]
})
