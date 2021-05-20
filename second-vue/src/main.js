import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import store from './store'
import {findAllMenus} from "./config/menu";

Vue.config.productionTip = false
Vue.prototype.$axios = axios
Vue.use(ElementUI)

router.beforeEach((to,from,next)=> {
  if(to.path === '/') {
    next();
  }else if(to.path==='/login' || to.path==='/main'){
    next();
  }else if(to.path==='/index'){
    next();
  } else {
    if (window.sessionStorage.getItem("user")) {
      findAllMenus(router,store)
      next();
    } else {
      next("/?redirect="+to.path)
    }
  }
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
