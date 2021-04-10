<template>
  <div class="pothole-list">
    <h1>Active Potholes</h1>

    <h3> Sort by User Severity: 
      <select id="reportFilter" v-model="filter.user_severity">
              <option value>Show All</option>
              <option value="Catastrophic">Catastrophic</option>
              <option value="New route advised">New Route Advised</option>
              <option value="Do not drive over me">Do Not Drive Over Me</option>
              <option value="Could bust a tire">Could bust a tire</option>
              <option value="Minor">Minor</option>
 
      </select>
    </h3>
    <h3> Sort by Username: 
      <input type="text" id="usernameFilter" v-model="filter.username" /> </h3>

    <div class="report" v-if="role != 'ROLE_EMPLOYEE'">
      
      <router-link 
      
      v-bind:to="{ name: 'report-details', params: { id: report.report_id } }"
      v-for="report in filteredReports" 
      v-bind:key="report.report_id">
      
      <div id="report-box">
        <table id="user-report-table"  class="styled-table">
          <th> Date Reported:</th> 
          <th> Address:</th>
          <th> User Severity:</th>
          <th> Reported By:</th>
          <tr>
            <td>{{ report.reported }}</td>
            <td>{{ report.location}} </td>
            <td>{{ report.user_severity}}</td>
            <td>{{ report.username }}</td>
          </tr>
        </table>
      </div>
      </router-link>
    </div>

    <div v-else>
          <h3> Sort by Internal Severity: 
      <select id="reportFilter" v-model="filter.severity">
              <option value>Show All</option>
              <option value="0">0</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
      </select>
    </h3>
      <router-link 
      
      v-bind:to="{ name: 'edit-report', params: { id: report.report_id } }"
      v-for="report in filteredReports" 
      v-bind:key="report.report_id">
      
      <div id="report-box">
          <table id="user-report-table" class="styled-table">
          <tr>
            <td>Report ID: </td>
            <td>{{ report.report_id }}</td>
            <td>Date Inspected: </td>
            <td>{{ report.inspected }} </td>
          </tr>

          <tr>
            <td>Date Reported: </td>
            <td> {{ report.reported }} </td>
            <td>Date Repaired: </td>
            <td> {{ report.repaired }} </td>
          </tr>
          <tr>
            <td>Username: </td>
            <td> {{ report.username }}</td>
            <td>Offical Status Code: </td>
            <td> {{ report.status}} </td>

          </tr>
          <tr>
            <td>Address: </td>
            <td> {{ report.location}} </td>
            <td>Official Severity Code: </td>
            <td> {{ report.severity }}</td>
       
          </tr>
          <tr>
            <td>User Severity:</td>
            <td> {{ report.user_severity}} </td>
            <!-- <td>Geolocation:  </td>
            <td>Math.round({{ report.lat }}) Math.round({{ report.lng }})</td> -->
          </tr>

        </table>
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
      role: "",
      filter: {
          severity: 0,
          user_severity: "",
          username: "",
      }
    };
  },
  computed: {
    filteredReports() {
     let filteredSeverity = this.reports;
     if (this.filter.severity != "") {
       filteredSeverity = filteredSeverity.filter((report) => 
       report.severity == this.filter.severity
       )
     }
     if (this.filter.username != "") {
       filteredSeverity = filteredSeverity.filter((report) => 
       report.username.toLowerCase().includes(this.filter.username.toLowerCase())
       )
     }
     if (this.filter.user_severity != "") {
       filteredSeverity = filteredSeverity.filter((report) =>
       report.user_severity == this.filter.user_severity
       )
     }
     return filteredSeverity;
    },


  },
  created() {
    reportService.list().then((response) => {
      this.reports = response.data;
    });
  },
  mounted() {
    this.username= this.$store.state.user.username;
    this.role = this.$store.state.user.authorities[0].name
  },
  methods: {
    reportStatus(report) {
      if (report.status === 1) {
        return "Reported";
      }
      else if (report.status === 2) {
        return "Inspected"
      } 
      else if (report.status === 3) {
        return "Repaired"
      }
    },
    reportSeverity(report) {
      if (report.severity === 0) {
        return "TBD"
      } 
      else if (report.severity === 1) {
        return "Minor"
      }
      else if (report.severity === 2) {
        return "Average"
      }
      else if (report.severity === 3) {
        return "Major"
      }
    },
  }
};
</script>

<style>

h3 {
  display: inline-flex;
  padding: 10px;
  vertical-align: middle;

} 

</style>