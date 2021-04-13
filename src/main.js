import Vue from 'vue'
import App from './App.vue'
import Web3 from 'web3'
import router from './router'
import { store } from './store/'
import vuetify from './plugins/vuetify';

Vue.config.productionTip = false

Vue.prototype.Web3 = Web3




new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
