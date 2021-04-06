<template>
  <div>
    <!-- In here, v-bind each of the potholes, allow them to click on each pothole
  Then take them to each report, allow them to update the status (dropdown) update Severity (dropdown), schedule for repair (add string?) -->

    <table>
      <thead>
        <tr>
          <th>Report</th>
          <th>Update</th>
          <th>Delete</th>
        </tr>
      </thead>
    <tbody>
        <tr v-for="report in reports" v-bind:key="report.report_id" class="report">
          <td width="80%">
            <router-link v-bind:to="{ name: 'report-list', params: { id: report.report_id } }"
            >{{ report.report_id }} {{report.location_id}}</router-link>
          </td>
          <td>
            <router-link :to="{ name: 'EditTopic', params: {id: report.report_id} }">Edit</router-link>
          </td>
          <td>
            <a href="#" v-on:click="deleteReport(report.report_id)">Delete</a>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- <div v-for="report in reports" v-bind:key="report.report_id" class="report">
      <p>
        Report id: {{ report.report_id }} User Id:
        {{ report.user_id }} Location: {{ report.location_id }} Status:
        {{ report.status }} Date Reported:{{ report.reported }}
      </p> 
    </div> -->
  </div>
</template>

<script>
export default {
//     name: "employee",
//     methods: {
//       getTopics() {
//       topicService.list().then(response => {
//         this.$store.commit("SET_TOPICS", response.data);
//       });
//     },
//     deleteTopic(id) {
//       topicService.deleteTopic(id).then(response => {
//         if (response.status === 200) {
//           this.getTopics();
//         }
//       })
//     }
//   },
//   created() {
//     this.getTopics();
//   }
// };
}

</script>

<style>
</style>