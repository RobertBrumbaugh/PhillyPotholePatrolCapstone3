<template>
  <div id="app">
    
    <!-- <div class="header-img"></div> -->
    
    <div id="container">

      <div id="top-left" v-if="this.$store.state.token != ''">Hello, {{this.$store.state.user.username}}!
      </div>
      
      <div id="nav">
        <ul>
          <li> <router-link v-bind:to="{ name: 'home' }"> Home</router-link>  </li>
          <li> <router-link v-bind:to="{ name: 'report-list' }" v-if="this.$store.state.role != 'ROLE_EMPLOYEE'"> Current Potholes </router-link>  </li>
          <li> <router-link v-bind:to="{ name: 'add-report'}" v-if="$store.state.token != ''"> Save New Pothole </router-link>  </li>
          <li> <router-link v-bind:to="{ name: 'report-list' }" v-if="this.$store.state.role == 'ROLE_EMPLOYEE'"> Employee Portal </router-link> </li>
          <li> <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''"> Login </router-link> </li>
          <li> <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"> Logout </router-link> </li>
          
       </ul>  <!-- Employee Portal needs a v-if and will take them to the edit report page -->
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
  // mounted() {
  //   if (this.$store.state.token != '') {
  //     this.username = this.$store.state.user.username;
  //     let role = this.$store.state.user.authorities[0].name;
  //     this.role = role.substring(5,6).toUpperCase() + role.substring(6).toLowerCase();
  //   }
  // },
  // methods: {
  //   clearRole() {
  //     this.$store.state.role = '';
  //   }
  // }
}

</script>

<style>

#nav {
  font-size: 18px;
  margin-bottom: 10px;
  color: white;
  display: flex;
  justify-content: flex-end;
  grid-area: nav;
}

#container {
  display: grid;
  grid-template-areas: "top-left nav" ;
}

#top-left {
 font-size: 24px;
 text-align: left;
 grid-area: top-left;
}

</style>
