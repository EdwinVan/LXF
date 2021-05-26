import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import store from './store'
import {findAllMenus} from "./config/menu";
import de from "element-ui/src/locale/lang/de";

Vue.config.productionTip = false
Vue.prototype.$axios = axios
Vue.use(ElementUI)

router.beforeEach((to,from,next)=> {
  if(to.path === '/'|| to.path==='/login' || to.path==='/main' || to.path==='/index'|| to.path==='/introduction'|| to.path==='/target'|| to.path==='/team'|| to.path==='/textbook'|| to.path==='/news'|| to.path==='/top') {
    next();
  }else {
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
