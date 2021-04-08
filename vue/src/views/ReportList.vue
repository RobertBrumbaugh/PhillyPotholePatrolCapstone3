<template>
  <div class="pothole-list">
    <h1>Active Potholes</h1>
   
    <div v-for="report in reports" v-bind:key="report.report_id" class="report">
      <p>
       Report id: {{ report.report_id }}  Username: {{ report.username }} Latitude: {{ report.lat }} Longitude: {{report.lng}}
       Severity: {{report.severity}} Status: {{ report.status }} Date Reported:{{ report.reported }}
      </p>
    </div>
    <router-link v-bind:to="{ name: 'add-report'}"> Save New Pothole </router-link>
    <router-link v-bind:to="{ name: 'edit-report'}"> Edit Report </router-link>
  </div>
</template>

<script>
import reportService from "../services/ReportService.js";

export default {
  name: "report-list",
  data() {
    return {
      reports: [],
    };
  },
  created() {
    reportService.list().then((response) => {
      this.reports = response.data;
    });
  },
};
</script>

<style>
</style>