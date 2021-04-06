<template>
  <form class="new-pothole-report" v-on:submit.prevent="saveReport">
    
    <input class="user-input" type="text" placeholder="User" v-model="report.user" />
    <input class="location-input" type="text" placeholder="Location" v-model="report.location" />
    <input class="severity-input" type="text" placeholder="Severity" v-model="report.severity" /> 
    
    <!-- this will probably be changed? -->
   
    <button>Save</button>
  </form>
</template>

<script>
import ReportService from '../services/ReportService';
export default {
    name: "new-pothole-report", 
    data(){
        return {
            report: { 
                user_id: '',
                lat: '', 
                long: '',
                status: '', 
                reported: '',
            }
        }
    },
    methods: {
        saveReport() {
            ReportService.addReport(this.report).then(response => {
                if (response.status === 201) {
                this.report = {
                    user_id: '',
                    lat: '', 
                    long: '',
                    status: '', 
                    reported: ''
                }
                }
            })
        }
    }

}
</script>

<style>

</style>