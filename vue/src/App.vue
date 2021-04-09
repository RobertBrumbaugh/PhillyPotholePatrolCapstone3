<template>
  <div id="app">
    
    <div class="header-img"></div>
    
    <div id="container">

      <div id="top-left" v-if="this.$store.state.token != ''">Hello {{this.$store.state.user.username}}
      </div>
      
      <div id="nav">
        <router-link v-bind:to="{ name: 'home' }"> Home &nbsp; | &nbsp;</router-link> 
        <router-link v-bind:to="{ name: 'report-list' }"> Current Potholes &nbsp; | &nbsp;</router-link> 
        <router-link v-bind:to="{ name: 'add-report'}"  v-if="$store.state.token != ''"> Save New Pothole &nbsp; | &nbsp;</router-link> 
        <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''"> Login | &nbsp;</router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"> Logout | &nbsp;</router-link>
        <router-link v-bind:to="{ name: 'edit-report' }" v-if="role == 'ROLE_EMPLOYEE'"> Employee Portal </router-link>
        <!-- Employee Portal needs a v-if and will take them to the edit report page -->
      </div>

    </div>
    <router-view />
  </div>

</template>

<script>

export default {
  name: 'App',
  components: {
    
  },
  data() {
    return {
      username: "",
      role: ""
    }
  },
  mounted() {
    this.username = this.$store.state.user.username;
    let role = this.$store.state.user.authorities[0].name;
    this.role = role.substring(5,6).toUpperCase() + role.substring(6).toLowerCase();
  }
}

</script>

<style>

/* #container {
display: flex;
justify-content: space-between;
}

#top-left {
  display: flex;
  justify-content: flex-start;
  
} */

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
