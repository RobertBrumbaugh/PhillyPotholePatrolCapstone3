<template>
  <form class="new-pothole-report" v-on:submit.prevent="saveReport">
    <div>
    <input class="user-input" type="text" placeholder="User" v-model="report.user" />
    </div>
    <div>
    <input class="location-input" type="text" placeholder="Location" v-model="report.location" />
    </div>
    <div>
    <input class="severity-input" type="text" placeholder="Severity" v-model="report.severity" /> 
    </div>
    
    <!-- this will probably be changed? -->
   <GoogleMap />
    <button>Save</button>
  </form>
</template>

<script>
import ReportService from '../services/ReportService';
import GoogleMap from '../components/GoogleMap.vue';
export default {
    name: "new-pothole-report", 
    components: {
        GoogleMap
    },
    data(){
        return {
            report: { 
                user_id: '',
                lat: '', 
                lng: '',
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
                    lng: '',
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