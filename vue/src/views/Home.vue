<template
>
  <div class="home">
    <router-link v-bind:to="{ name: 'report-list' }" v-if="this.$store.state.role == 'ROLE_EMPLOYEE'"> <h1>Employee Portal</h1> </router-link>
    <h1 v-else>Welcome to Pothole Patrol</h1>
    <img src="@/assets/PotholeLogo.png">
  </div>
</template>

<script>
export default {
  name: "home",
  data() {
    return {
      username: "",
    }
  },
  created() {
    if (this.$store.state.token != ''){
      this.username= this.$store.state.user.username;
    }
  }
};
</script>

<style scoped>
img {
  width: 40vw;
   box-shadow: 0 0 20px rgba(0, 0, 0, 0.50);
}
</style>