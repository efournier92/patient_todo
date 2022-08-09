<template>
  <div class="container">
    <Header title="Task Tracker" @show-add-task="showAddTask" />
    <!-- <router-view></router-view> -->
    <Home />
    <!-- <Footer /> -->
  </div>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import Tasks from '../components/Tasks.vue'
import Home from '../views/Home.vue'

export default {
  name: 'App',
  components: {
    Header,
    Footer,
    Tasks,
    Home
},
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
