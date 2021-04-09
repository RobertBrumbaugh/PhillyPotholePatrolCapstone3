<template>
  <div class="pothole-list">
    <h1>Active Potholes</h1>

    <div class="report" v-if="role != 'ROLE_EMPLOYEE'">

      <router-link 
      
      v-bind:to="{ name: 'report-details', params: { id: report.report_id } }"
      v-for="report in reports" 
      v-bind:key="report.report_id">
      
      <div id="report-box">
        <table id="user-report-table">
          <tr>
            <td>Date Reported: </td>
            <td>{{ report.reported }} </td>
            <td>Zip Code: </td>
            <td></td>
            <!-- <td> {{returnLocation(report)}} </td> -->
              <td>User Severity:</td>
            <td>{{ report.user_severity}} </td>
            <td>Reported By: </td>
            <td>{{ report.username }}</td>

            <!-- <td>Report ID: </td>
            <td>{{ report.report_id }}</td>
            <td>Date Inspected: </td>
            <td>{{ report.inspected }} </td> -->
          </tr>

          <!-- <tr>
            <td>Date Reported: </td>
            <td>{{ report.reported }} </td>
            <td>Date Repaired: </td>
            <td>{{ report.repaired }} </td>
          </tr>
          <tr>
            <td>Username: </td>
            <td>{{ report.username }}</td>
            <td>Offical Status Code: </td>
            <td>{{ report.status}} </td>

          </tr>
          <tr>
            <td>Zip Code: </td>
            <td></td>
            <td>Official Severity Code: </td>
            <td>{{ report.severity }}</td>
       
          </tr>
          <tr>
            <td>User Severity:</td>
            <td>{{ report.user_severity}} </td>
            <td>Geolocation:  </td>
            <td>Math.round({{ report.lat }}) Math.round({{ report.lng }})</td>
       
          </tr> -->

        </table>

        <!-- <p>
       <strong>Date Reported:</strong> {{ report.reported }} <strong>Username:</strong> {{ report.username }}
       <br>
       <strong>Report ID:</strong> {{ report.report_id }} <strong>Status:</strong> {{ reportStatus(report) }} 
       <br>
       <strong>Latitude:</strong> {{ report.lat }} <strong>Longitude:</strong> {{report.lng}}
       <br>
       <strong>Reported Severity:</strong> "{{report.user_severity}}" <strong>Official Severity Code:</strong> {{ reportSeverity(report) }} 
      </p> -->
      </div>
      </router-link>
    </div>
    <div v-else>
      <router-link 
      
      v-bind:to="{ name: 'edit-report', params: { id: report.report_id } }"
      v-for="report in reports" 
      v-bind:key="report.report_id">
      
      <div id="report-box">
                <table id="user-report-table">
          <tr>
            <td>Report ID: </td>
            <td>{{ report.report_id }}</td>
            <td>Date Inspected: </td>
            <td>{{ report.inspected }} </td>
          </tr>

          <tr>
            <td>Date Reported: </td>
            <td>{{ report.reported }} </td>
            <td>Date Repaired: </td>
            <td>{{ report.repaired }} </td>
          </tr>
          <tr>
            <td>Username: </td>
            <td>{{ report.username }}</td>
            <td>Offical Status Code: </td>
            <td>{{ report.status}} </td>

          </tr>
          <tr>
            <td>Zip Code: </td>
            <!-- ZIP CODE API CALL -->
            <!-- <td> {{ returnLocation(report) }} </td> -->
            <td> </td>
            <td>Official Severity Code: </td>
            <td>{{ report.severity }}</td>
       
          </tr>
          <tr>
            <td>User Severity:</td>
            <td>{{ report.user_severity}} </td>
            <!-- <td>Geolocation:  </td>
            <td>Math.round({{ report.lat }}) Math.round({{ report.lng }})</td> -->
          </tr>

        </table>

        <!-- <p>
       <strong>Date Reported:</strong> {{ report.reported }} <strong>Username:</strong> {{ report.username }}
       <br>
       <strong>Report ID:</strong> {{ report.report_id }} <strong>Status:</strong> {{ reportStatus(report) }} 
       <br>
       <strong>Latitude:</strong> {{ report.lat }} <strong>Longitude:</strong> {{report.lng}}
       <br>
       <strong>Reported Severity:</strong> "{{report.user_severity}}" <strong>Official Severity Code:</strong> {{ reportSeverity(report) }} 
      </p> -->
      </div>
    
      </router-link>
    </div>

   
  </div>
</template>

<script>
import reportService from "../services/ReportService.js";
// import Vue from 'vue';

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
  },
  methods: {
//     returnLocation(report) {
//     var latLngObj = {
//     lat: report.lat,
//     lng: report.lng
// }
// Vue.$geocoder.send(latLngObj).then( response => {
//       return response });
//     },

    reportStatus(report) {
      if (report.status === 1) {
        return "Reported";
      }
      else if (report.status === 2) {
        return "Inspected"
      } else if (report.status === 3) {
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
#report-box {
  border: 3px solid Black;
  margin: 5px;
}
</style>