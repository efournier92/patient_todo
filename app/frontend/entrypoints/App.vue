<template>
  <div class="container">
    <TasksOverview />
    <Footer />
  </div>
</template>

<script>
import TasksOverview from '../components/TasksOverview.vue'
import Footer from '../components/Footer.vue'

export default {
  name: 'App',
  components: {
    Footer,
    TasksOverview,
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

.color-primary {
  color: #F06292;
}
</style>
