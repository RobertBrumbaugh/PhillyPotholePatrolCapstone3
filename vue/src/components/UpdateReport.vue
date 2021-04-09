<template>
<div>
  <!-- <div v-for="report in reports" v-bind:key="report.report_id" class="report">
      <p>
       Report id: {{ report.report_id }}  Date Reported:{{ report.reported }}
       <br>
       Current Status: {{ report.status }} 
       Change Status:
        <select name="status" id="status">
          <option value="1">Reported</option>
          <option value="2">Inspected</option>
          <option value="3">Repaired</option>
      </select>

      <br>
      Current Severity: {{ report.severity }} 
       Change Severity:
        <select name="severity" id="severity">
          <option value="1">Minor</option>
          <option value="2">Could bust a tire</option>
          <option value="3">Do not drive over me</option>
          <option value="4">New route advised</option>
          <option value="5">Catastrophic</option>
      </select>
       <a href="#" v-on:click="deleteReport(report.report_id)">Delete</a>

      </p>
    </div> -->
  </div>
</template>


<script>
import reportService from '../services/ReportService'

export default {
    name: 'update-report',
    props: ["report"],
  
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
    methods: {
    // updateStatus() {
    //   reportService.updateStatus(report_id, status_id).then((response) => {
    //     if (response.status === 200) {
    //           this.$router.push(`/`);
    //         }
    //       })
    // },
    // updateInspected() {
    //   reportService.updateInspected(report_id, inspected_date)
    // },
    // updateRepaired() {
    //   reportService.updateRepaired(report_id, repaired_date)
    // }, 
    // updateSeverity() {
    //   reportService.updateSeverity(report_id, severity_id)
    // },
    // deleteReport() {
    //   reportService.deleteReport(report_id)
    // }
  },
  };

</script>

<style>
</style>