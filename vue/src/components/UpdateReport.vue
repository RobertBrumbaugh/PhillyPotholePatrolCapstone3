<template>
 <form v-on:submit.prevent>
    <!-- <div class="field">
      <label for="title">Title</label>
      <input type="text" v-model="title" />
    </div>
    <div class="actions">
      <button type="submit" v-on:click="updateTopic()">Save Document</button>
    </div> -->
  </form>
</template>


<script>
import ReportService from '../services/ReportService'
export default {
    name: '',
    props: ["report_id"],
    data() {
        return {

        }
    },
    methods: {
        updateStatus() {
            const report = { id: this.report_id, status: this.status_id}
            ReportService.updateStatus(report_id, status_id).then((response => {
                if (response.status === 200) {
              this.$router.push(`/`);
                }
            }))
            }
        },
        updateInspected() {

        },
        updateRepaired() {

        },
        updateSeverity() {

        }
    }



</script>

<style>

</style>