<template
>
  <div class="home">
    
    <h1>Welcome to Pothole Patrol</h1>
    <p id="greetings">Greetings {{username}} !!</p>
    <img src="@/assets/PotholeLogo.png">
  </div>
</template>

<script>
export default {
  name: "home",
  data() {
    return {
      username: ""
    }
  },
  mounted() {
    this.username= this.$store.state.user.username;
  }
};
</script>

<style scoped>
img {
  width: 50vw;
}
</style>