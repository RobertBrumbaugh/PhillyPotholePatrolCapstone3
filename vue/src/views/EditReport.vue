<template>
<div id ="map">

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

      Schedule for inspection:
      <input type="date" />

      Schedule for inspection:
      <input type="date" />

      <!-- Make each of these v-model on click to the different methods -->
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
       <button id="delete" v-on:click.prevent="deleteReport(report.report_id)">Delete</button>

      </p>

      <h3> Reported By: {{report.username}} Id: {{report.report_id}} Date: {{report.reported}} Severity: {{report.user_severity}} </h3>
      <div>
      <GmapMap
        :center="center"
        :zoom="18"
        map-type-id="hybrid"
        :options="mapOptions"
        style="width: 100vmin; height: 50vmin"
        ref="mapRef"
        @click="handleMapClick"
      >
        <GmapMarker
          :position="marker.position"
          :clickable="false"
          :draggable="false"
          @drag="handleMarkerDrag"
          @click="panToMarker"
        />
      </GmapMap>

    </div>
  </div>
</template>

<script>

import ReportService from "../services/ReportService"

export default {
  name: 'edit-report',
data() {
    return {
      center: {lat: 0, lng: 0},
      marker: {
          position: {lat: 0, lng: 0} },
      mapOptions: {
        disableDefaultUI: false,
      },
      reports: [],
      report: {
          report_id: 0,
          username: '',
          lat: 0,
          lng: 0,
          reported: '',
          inspected: '',
          repaired: '',
          status: 0,
          severity: 0,
          img: ''

      }
    };
  },
  created() {
      // grab all reports on load
    ReportService.list().then((response) => {
      this.reports = response.data;

      // find current report with route param id 
      this.report = this.reports.find( report => {
          return report.report_id == this.$route.params.id;
          
      })
      
      // set marker to report lat/lng
      this.marker.position.lat = this.report.lat;
      this.marker.position.lng = this.report.lng;

      // set center to marker
      this.center.lat = this.marker.position.lat;
      this.center.lng = this.marker.position.lng;
    });
  },
  methods: {
      //sets the position of marker when dragged
    handleMarkerDrag(e) {
      this.marker.position = { lat: e.latLng.lat(), lng: e.latLng.lng() };
    },

    //Moves the map view port to marker
    panToMarker() {
      this.$refs.mapRef.panTo(this.marker.position);
      this.$refs.mapRef.setZoom(18);
    },

    //Moves the marker to click position on the map
    handleMapClick(e) {
      this.marker.position = { lat: e.latLng.lat(), lng: e.latLng.lng() };
      console.log(e);
    },
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
    deleteReport() {
      ReportService.deleteReport(this.report.report_id).then((response) => {
        if (response.status === 204) {
          this.$router.push( { name: 'report-list'} )
        }
      })
    }
  }

};
</script>