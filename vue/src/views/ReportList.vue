<template>
  <div class="pothole-list">
    <h1>Active Potholes</h1>
    
    <div v-for="report in reports" v-bind:key="report.report_id" class="report">
    <h1>{{report.report_id}} {{report.user_id}} {{report.location_id}} {{report.status_id}} {{report.reported}}</h1>
    </div>
    <router-link v-bind:to="{ name: 'new-pothole-report' }">Add a Pothole</router-link>
  </div>
</template>

<script>
import ReportService from '../services/ReportService';

export default {
  name: 'report-list',
  data() {
    return {
      reports: []
    }
  },
  created() {
   ReportService.list().then(response => {
      this.reports = response.data;
    });
  },
};
</script>

<style>
</style>