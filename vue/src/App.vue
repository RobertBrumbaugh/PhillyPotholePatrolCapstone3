<template>
  <div id="app">
    <div class="header-img"></div>
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }"> Home </router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'report-list' }"> Current Potholes </router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"> Logout </router-link>
    </div>
    <router-view />
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

.header-img {
    width: 100%;
    height: 100px;
    background: url('http://www.mccworldinternational.com/wp-content/themes/mcc-world/images/contact_us.jpg');
    background-size:cover;
    border-radius: 10px;
    position: relative;
 
  }

#nav {
  font-size: 18px;
  margin-bottom: 50px;
  color: white;
  display: flex;
  justify-content: flex-end;
  
}

</style>
