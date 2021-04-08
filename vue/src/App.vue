<template>
  <div id="app">
    <div class="header-img"></div>
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }"> Home &nbsp; | &nbsp;</router-link> 
      <router-link v-bind:to="{ name: 'report-list' }"> Current Potholes &nbsp; | &nbsp;</router-link> 
      <router-link v-bind:to="{ name: 'add-report'}"  v-if="$store.state.token != ''"> Save New Pothole &nbsp; | &nbsp;</router-link> 
      <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''"> Login | &nbsp;</router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"> Logout | &nbsp;</router-link>
      <router-link v-bind:to="{ name: 'edit-report' }" v-if="role == 'ROLE_EMPLOYEE'"> Employee Portal </router-link>
      <!-- Employee Portal needs a v-if and will take them to the edit report page -->
    </div>
    <router-view />
  </div>

</template>

<script>

export default {
  name: 'App',
  components: {
    
  },
  // data() {
  //   return {
  //     username: "",
  //     role: ""
  //   }
  // },
  // mounted() {
  //   this.role = this.$store.state.user.authorities[0].name
  // }
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
