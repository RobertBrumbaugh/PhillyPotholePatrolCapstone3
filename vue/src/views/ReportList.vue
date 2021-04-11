<template>
  <div class="pothole-list">
    <h1>Active Potholes</h1>

    <div class="report" v-if="this.$store.state.role != 'ROLE_EMPLOYEE'">
      <h3>Sort by User Severity:</h3>
      <select id="reportFilter" v-model="filter.user_severity">
        <option value>Show All</option>
        <option value="Catastrophic">Catastrophic</option>
        <option value="New route advised">New Route Advised</option>
        <option value="Do not drive over me">Do Not Drive Over Me</option>
        <option value="Could bust a tire">Could bust a tire</option>
        <option value="Minor">Minor</option>
      </select>

      <h3>Sort by username:</h3>
      <input type="text" id="usernameFilter" v-model="filter.username" />
      
      <h3>Find by Location:</h3>
      <input type="text" id="locationFilter" v-model="filter.location" />

      <router-link
        v-bind:to="{ name: 'report-details', params: { id: report.report_id } }"
        v-for="report in filteredReports"
        v-bind:key="report.report_id"
      > 
        <report-user v-bind:report="report"/>
      </router-link>
    </div>

    <div v-else>
      <h3>Sort by Internal Severity:</h3>
      <select id="reportFilter" v-model="filter.severity">
        <option value>Show All</option>
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
      </select>

      <h3>Sort By Status:</h3>
      <select id="statusFilter" v-model="filter.status">
        <option value>Show All</option>
        <option value="1">Reported</option>
        <option value="2">Inspected</option>
        <option value="3">Repaired</option>
      </select>
      <br>
      <h3>Find by Id:</h3>
      <input type="text" id="reportIdFilter" v-model="filter.report_id" />

      <h3>Find by Location:</h3>
      <input type="text" id="locationFilter" v-model="filter.location" />

      <router-link
        v-bind:to="{ name: 'edit-report', params: { id: report.report_id } }"
        v-for="report in filteredReports"
        v-bind:key="report.report_id"
      >
        <report-employee v-bind:report="report"/>
      </router-link>
    </div>
  </div>
</template>

<script>
import reportService from "../services/ReportService.js";
import reportUser from "../components/ReportUser"
import reportEmployee from "../components/ReportEmployee"

export default {
  name: "report-list",
  components: {
    reportUser,
    reportEmployee
  },
  data() {
    return {
      reports: [],
      // role: "",
      filter: {
          severity: "",
          user_severity: "",
          username: "",
          status: "",
          report_id: "",
          location: ""
      },
    };
  },
  computed: {
    filteredReports() {
      let filteredSeverity = this.reports;
      if (this.filter.severity != "") {
        filteredSeverity = filteredSeverity.filter(
          (report) => report.severity == this.filter.severity
        );
      }
      if (this.filter.username != "") {
        filteredSeverity = filteredSeverity.filter((report) =>
          report.username
            .toLowerCase()
            .includes(this.filter.username.toLowerCase())
        );
      }
      if (this.filter.user_severity != "") {
        filteredSeverity = filteredSeverity.filter(
          (report) => report.user_severity == this.filter.user_severity
        );
      }
      if (this.filter.status != "") {
       filteredSeverity = filteredSeverity.filter((report) =>
       report.status == this.filter.status
       )
     }
      if (this.filter.report_id != "") {
       filteredSeverity = filteredSeverity.filter((report) =>
       report.report_id == this.filter.report_id
       )
     }
     if (this.filter.location != "") {
       filteredSeverity = filteredSeverity.filter((report) =>
       report.location.toLowerCase().includes(this.filter.location.toLowerCase())
       )
     }
      return filteredSeverity.sort((a, b) => {
        return b.report_id - a.report_id;
      });
    },
  },
  created() {
    reportService.list().then((response) => {
      this.reports = response.data;
    });
  },
  // mounted() {
  //   this.username = this.$store.state.user.username;
  // },
  methods: {
    reportStatus(report) {
      if (report.status === 1) {
        return "Reported";
      } else if (report.status === 2) {
        return "Inspected";
      } else if (report.status === 3) {
        return "Repaired";
      }
    },
    reportSeverity(report) {
      if (report.severity === 0) {
        return "TBD";
      } else if (report.severity === 1) {
        return "Minor";
      } else if (report.severity === 2) {
        return "Average";
      } else if (report.severity === 3) {
        return "Major";
      }
    },
  },
};
</script>

<style>

</style>