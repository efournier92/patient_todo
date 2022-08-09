import { createApp } from 'vue/dist/vue.esm-bundler'
import App from './App.vue'

// const app = createApp({  
//   data() {  
//     return {  
//       course: 'Intro to Vue 3 and Rails'  
//     }  
//   }  
// })

// app.component('App', App)
  
// app.mount('#app');

createApp(App)
    .mount('#app')

// (optional) for debug purpose  
// console.log("app", app)

