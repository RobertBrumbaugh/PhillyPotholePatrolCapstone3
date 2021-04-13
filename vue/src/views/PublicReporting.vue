<template>
  <div id="public-reporting">
    <h1>Public Reporting</h1>
    <h3>The City of Philadelphia has been hard at work repairing potholes.</h3> 
    <p>With the help of the Pothole Patrol Reporting App, we have been able to complete the following work: </p>

    <table id="public-details-table" class="styled-table">
          <th>Potholes Reported: </th>
          <th>Potholes Scheduled <br>For Inspection:</th>
          <th>Potholes Scheduled <br>For Repair:</th>

          <tr>
            <td>{{ reported  }}</td>
            <td>{{ inspected }} </td>
            <td>{{ repaired }}</td>
          </tr>

      </table>
  </div>
</template>

<script>
import ReportService from "../services/ReportService";

export default {
  name: "public-reporting",
  data() {
    return {
      reports: {},
      reported: 0,
      inspected: 0,
      repaired: 0,
    };
  },
  created() {
    ReportService.list().then((response) => {
      this.reports = response.data;
      this.reported = this.getReported();
      this.inspected = this.getInspected();
      this.repaired = this.getRepaired();
    });
  },
  methods: {
    getReported() {
      let counter = 0;
      this.reports.forEach((report) => {
        if (report.reported != null) {
          counter++;
        }
      });
      return counter;
    },
    getInspected() {
      let counter = 0;
      this.reports.forEach((report) => {
        if (report.inspected != null) {
          counter++;
        }
      });
      return counter;
    },
    getRepaired() {
      let counter = 0;
      this.reports.forEach((report) => {
        if (report.repaired != null) {
          counter++;
        }
      });
      return counter;
    },
  },
};
</script>

<style>
</style>