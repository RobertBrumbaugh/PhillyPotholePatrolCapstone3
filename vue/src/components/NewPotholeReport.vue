<template>
  <form class="new-pothole-report" @submit.prevent="saveReport">
    <div>
    <input class="user-input" type="text" placeholder="User" v-model="report.username" />
    </div>
    <div>
    <input class="reported-input" type="text" placeholder="Date" v-model="report.reported" />
    </div>
  <div>
    <input class="lat-input" type="text" placeholder="Latitude" v-model="report.lat" />
    </div>  <div>
    <input class="lng-input" type="text" placeholder="Longitude" v-model="report.lng" />
    </div>
    <button type="submit">Save</button>
    <!-- this will probably be changed? -->
   <GoogleMap />
    
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
                username: '',
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
                    username: '',
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