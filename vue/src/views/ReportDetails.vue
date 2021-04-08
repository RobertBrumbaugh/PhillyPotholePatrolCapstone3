<template>
  <div id ="map">
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

import ReportService from '../services/ReportService'

export default {
    name: 'report-details',
    
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
  }

}
</script>

<style>

#map {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}


</style>