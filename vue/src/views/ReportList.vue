<template>
  <div class="pothole-list">
    <h1>Active Potholes</h1>

    <div v-for="report in reports" v-bind:key="report.report_id" class="report">
      <h1>
        {{ report.report_id }} {{ report.user_id }} {{ report.location_id }}
        {{ report.status }} {{ report.reported }}
      </h1>
    </div>
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