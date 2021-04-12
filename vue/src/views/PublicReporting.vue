<template>
  <div>
    <h1>Public Report</h1>
    <p>
      TOTAL POTHOLES REPORTED:
      <span> {{ reported }} </span>
    </p>
    <p>
      TOTAL POTHOLES INSPECTED:
      <span> {{ inspected }} </span>
    </p>
    <p>
      TOTAL POTHOLES REPAIRED:
      <span> {{ repaired }} </span>
    </p>
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