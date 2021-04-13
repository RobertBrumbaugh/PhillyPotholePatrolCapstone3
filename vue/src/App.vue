<template>
  <div id="app">
    
    <!-- <div class="header-img"></div> -->
    
    <div id="container">

      <div id="top-left" v-if="this.$store.state.token != ''">
        Hello, {{this.$store.state.user.username}}!
      </div>
      
      <div id="nav">
        <ul>
          <li> <router-link v-bind:to="{ name: 'home' }" v-if="this.$store.state.role != 'ROLE_EMPLOYEE'"> Home </router-link>  </li>
          <li class="employee-li"> <router-link v-bind:to="{ name: 'home' }" v-if="this.$store.state.role == 'ROLE_EMPLOYEE'"> <span class="span-style">Home</span> </router-link>  </li>
          <li> <router-link v-bind:to="{ name: 'report-list' }" v-if="this.$store.state.role != 'ROLE_EMPLOYEE'"> Current Potholes </router-link>  </li>
          <li class="employee-li"> <router-link v-bind:to="{ name: 'report-list' }" v-if="this.$store.state.role == 'ROLE_EMPLOYEE'"> <span class="span-style">Employee Portal </span></router-link> </li>
          <li> <router-link v-bind:to="{ name: 'add-report'}" v-if="$store.state.token != '' && this.$store.state.role != 'ROLE_EMPLOYEE'"> Save New Pothole </router-link>  </li>
          <li class="employee-li"> <router-link v-bind:to="{ name: 'add-report'}" v-if="$store.state.token != '' && this.$store.state.role == 'ROLE_EMPLOYEE'"> <span class="span-style">Save New Pothole</span> </router-link>  </li>
          <li> <router-link v-bind:to="{ name: 'public-reporting'}" v-if="this.$store.state.role != 'ROLE_EMPLOYEE'"> Public Reporting </router-link></li>
          <li> <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''"> Login </router-link> </li>
          <li> <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != '' && this.$store.state.role != 'ROLE_EMPLOYEE'"> Logout </router-link> </li>
          <li class="employee-li"> <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != '' && this.$store.state.role == 'ROLE_EMPLOYEE'"> <span class="span-style">Logout </span> </router-link> </li>
          
       </ul>  <!-- Employee Portal needs a v-if and will take them to the edit report page -->
      </div>

    </div>
    <router-view />
    
  </div>

</template>

<script>

export default {
  name: 'App',
  data() {
    return {
      username: "",
    }
  }
}

</script>

<style>

#nav {
  font-size: 18px;
  margin-bottom: 10px;
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
  text-transform: capitalize;
  margin: 10px;
}

</style>
