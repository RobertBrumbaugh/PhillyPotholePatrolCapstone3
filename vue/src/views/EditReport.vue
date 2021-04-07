<template>
  <div>
    <h1>Edit Report:</h1>
    <update-report />
    <!-- <update-report v-bind:report_id="parseInt($route.params.id)" /> -->
  </div>
</template>

<script>
import UpdateReport from "../components/UpdateReport.vue";

export default {
  components: {
    UpdateReport,
  },
};
</script>