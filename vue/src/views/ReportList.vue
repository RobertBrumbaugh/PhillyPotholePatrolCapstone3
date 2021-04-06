<template>
  <div class="pothole-list">
    <h1>Active Potholes</h1>
    this is where our fun potholes will be
    <div v-for="report in reports" v-bind:key="report.id" class="report">

    </div>
    <router-link v-bind:to="{ name: 'new-pothole-report' }">Add a Pothole</router-link>
  </div>
</template>

<script>
import ReportService from "@/services/ReportService.js";

export default {
  name: "reports",
  data() {
    return {
      reports: [],
    };
  },
  created() {
    ReportService.list().then((response) => {
      this.reports = response.data;
    });
  },
};
</script>

<style>
</style>