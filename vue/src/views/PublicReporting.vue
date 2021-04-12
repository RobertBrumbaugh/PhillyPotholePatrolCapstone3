<template>
  <div>
    <h1>REPORT TITLE</h1>
    <p>
      TOTAL POTHOLES REPORTED: <span> {{ getReported() }} </span>
    </p>
    <p>
      TOTAL POTHOLES INSPECTED: <span> {{ getInspected() }} </span>
    </p>
    <p>
      TOTAL POTHOLES REPAIRED: <span> {{ getRepaired() }} </span>
    </p>
  </div>
</template>

<script>
import ReportService from "../services/ReportService";

export default {
  name: "public-reporting",
  data() {
    return {
      reports: Object,
    };
  },
  created() {
    ReportService.list().then((response) => {
      this.reports = response.data;
    });
  },
  methods: {
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
    getReported() {
      let counter = 0;
      this.reports.forEach((report) => {
        if (report.reported != null) {
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