<template>
  <form class="new-pothole-report" v-on:submit.prevent="saveReport">
    <!-- 
    <input class="user-input" type="text" placeholder="User" v-model="report.user" />
    <input class="location-input" type="text" placeholder="Location" v-model="report.location" />
    <input class="status-input" type="text" placeholder="Status" v-model="report.status" /> 
    <input class="severity-input" type="text" placeholder="Severity" v-model="report.severity" /> 
    
    this will probably be changed?
    -->
    <button>Save</button>
  </form>
</template>

<script>
export default {
    name: "new-pothole-report", 
    data(){
        return {
            report: {
                user: '',
                status: '',
                location: '',
                severity: '',
            }
        }
    },
    methods: {
        saveReport() {
            this.report = {
                user: '',
                status: '',
                location: '',
                severity: ''
            };
        }
    }

}
</script>

<style>

</style>