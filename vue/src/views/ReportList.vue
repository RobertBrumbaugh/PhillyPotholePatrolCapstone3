<template>
  <div class="pothole-list">
    <h1>Active Potholes</h1>

    <div class="report" v-if="role != 'ROLE_EMPLOYEE'">

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
    <div v-else>
      <router-link 
      
      v-bind:to="{ name: 'edit-report', params: { id: report.report_id } }"
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

   
  </div>
</template>

<script>
import reportService from "../services/ReportService.js";

export default {
  name: "report-list",
  data() {
    return {
      reports: [],
      role: ""
    };
  },
  created() {
    reportService.list().then((response) => {
      this.reports = response.data;
    });
  },
  mounted() {
    this.username= this.$store.state.user.username;
    this.role = this.$store.state.user.authorities[0].name
  }
};
</script>

<style>
#report-box {
  border: 3px solid Black;
  margin: 5px;
}
</style>