<template>
<div>
  <div v-for="report in reports" v-bind:key="report.report_id" class="report">
      <p>
       Report id: {{ report.report_id }}  
       
       Current Status: {{ report.status }} 
       Change Status:
        <select name="status" id="status">
          <option value="1">Reported</option>
          <option value="2">Inspected</option>
          <option value="3">Repaired</option>
      </select>

      <!-- Make each of these v-model on click to the different methods -->

      Current Severity: {{ report.severity }} 
       Change Severity:
        <select name="severity" id="severity">
          <option value="1">Minor</option>
          <option value="2">Could bust a tire</option>
          <option value="3">Do not drive over me</option>
          <option value="4">New route advised</option>
          <option value="5">Catastrophic</option>
      </select>
       Date Reported:{{ report.reported }}
      </p>
     
    </div>

  <!-- <form v-on:submit.prevent>
    <div class="field">
      <label for="title">Title</label>
      <input type="text" v-model="report_id" />
    </div>
    <div class="actions">
      <button type="submit" v-on:click="updateTopic()">Save Document</button>
    </div>
  </form> -->
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
  };

</script>

<style>
</style>