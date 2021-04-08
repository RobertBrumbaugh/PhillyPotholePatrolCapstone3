<template>
  <div class="pothole-list">
    <h1>Active Potholes</h1>

    <div class="report">

      <router-link 
      v-bind:to="{ name: 'report-details', params: { id: report.report_id } }"
      v-for="report in reports" 
      v-bind:key="report.report_id">
      
      <div id="report-box">
        <p>
       <strong>Date Reported:</strong> {{ report.reported }} <strong>Username:</strong> {{ report.username }}
       <br>
       <strong>Report ID:</strong> {{ report.report_id }} <strong>Status:</strong> {{ report.status }} 
       <br>
       <strong>Latitude:</strong> {{ report.lat }} <strong>Longitude:</strong> {{report.lng}}
       <br>
       <strong>Reported Severity:</strong> "{{report.user_severity}}" <strong>Official Severity Code:</strong> {{report.severity}} 
      </p>
      </div>
      

      </router-link>


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
#report-box {
  border: 3px solid Black;
  margin: 5px;
}
</style>