<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }"> Home </router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'report-list' }"> Current Potholes </router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"> Logout </router-link>
    </div>
    <div id = "main">
    <router-view />
    </div>
  </div>
</template>

<script>



export default {
  name: 'App',
  components: {
    
  }
}

</script>

<style>

body{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background: #222;
    font-family: 'Open Sans', sans-serif;
    background-image: url('https://images.unsplash.com/photo-1569761316261-9a8696fa2ca3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
    background-repeat: no-repeat;
    background-size: 120%;
}

/* body {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin: 60px;
  background: rgb(218, 218, 218);
  display: flex;
  justify-content: center;
} */

#app {
    background: #4b4b4bd8;
    color: white;
    padding: 2em;
    border-radius: 30px;
    width: 100%;
    width: 70vw;
    height: 80vh;
    /* display: flex;
    justify-content: center;
    align-items: center; */

}

#nav {
  font-size: 18px;
  margin-bottom: 50px;
  color: white;
  display: flex;
  justify-content: flex-end;
}


#main {
  display: flex;
  justify-content: center;

}
</style>
