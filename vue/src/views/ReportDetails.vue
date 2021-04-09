<template>
  <div id ="map">
      <table id="user-report-table">
          <tr>
            <td>User Severity: </td>
            <td>{{ report.user_severity}} </td>
            <td>Reported By: </td>
            <td>{{ report.username }}</td>
            <td>Date Reported: </td>
            <td>{{ report.reported }} </td>

          </tr>
          <tr>
            <td>Zip Code: </td>
            <td></td>
            <td>Date Inspected: </td>
            <td>{{ report.inspected }} </td>
            <td>Date Repaired: </td>
            <td>{{ report.repaired }} </td>
       
          </tr>
          <tr>            

            <td>Offical Status Code: </td>
            <td>{{ report.status}} </td>            
            <td>Official Severity Code: </td>
            <td>{{ report.severity }}</td>
          </tr>
          <tr>
    
          </tr>

          <tr>
            <!-- <td>Geolocation:  </td>
            <td>Math.round({{ report.lat }}) Math.round({{ report.lng }})</td> -->
          </tr>

        </table>

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
    reportStatus(report) {
      if (report.status === 1) {
        return "Reported";
      }
      else if (report.status === 2) {
        return "Inspected"
      } else if (report.status === 3) {
        return "Repaired"
      }
    },
    reportSeverity(report) {
      if (report.severity === 0) {
        return "TBD"
      } 
      else if (report.severity === 1) {
        return "Minor"
      }
      else if (report.severity === 2) {
        return "Average"
      }
      else if (report.severity === 3) {
        return "Major"
      }
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