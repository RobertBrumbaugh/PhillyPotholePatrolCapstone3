<template>
  <div>
    <form class="new-pothole-report" v-on:submit.prevent>
      <p>
        Please drag or click on the map to mark the location of the pothole you
        are reporting:
      </p>

      <p> Nearest Address to Pin: <u>{{ this.report.location }} </u></p>
      <div> 
        <label for="severity">Please rank the pothole's severity:</label>
        <select name="severity" id="severity" v-model="report.user_severity">
          <option value="Minor">Minor</option>
          <option value="Could bust a tire">Could bust a tire</option>
          <option value="Do not drive over me">Do not drive over me</option>
          <option value="New route advised">New route advised</option>
          <option value="Catastrophic">Catastrophic</option>
        </select>
      </div>

      <br />
      <button type="submit" v-on:click="saveReport">Save</button>
      <br />
    </form>
    <div id="map">
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
          :clickable="true"
          :draggable="true"
          @drag="handleMarkerDrag"
          @click="panToMarker"
        />
      </GmapMap>

      
      <p>LAT: {{ marker.position.lat }} LNG: {{ marker.position.lng }}</p>
      
    </div>
  </div>
</template>

<script>
import ReportService from "../services/ReportService";
import Vue from 'vue';

export default {
  name: "new-pothole-report",
  components: {},
  data() {
    return {
      report: {
        username: "",
        user_severity: "",
        lat: 0,
        lng: 0,
        location: "",
        reported: "",
      },
      marker: { position: { lat: 0, lng: 0 } },
      center: { lat: 0, lng: 0 },
      mapOptions: {
        disableDefaultUI: false,
      },
    };
  },
  mounted() {
    this.geolocate();
  },
  created() {
    // fills in current user's username on the report
    this.report.username = this.$store.state.user.username;

  },
  methods: {
     saveReport() {
       
// fills in current date and time on the report
    const date = new Date().toLocaleString();
    this.report.reported = date;

        ReportService.addReport(this.report).then((response) => {
        if (response.status === 201) {
          this.report = {
            username: "",
            lat: "",
            lng: "",
            location: "",
            status: "",
            reported: "",
          };
          this.$router.push("/reports");
        }
      });
    },

    // sets report.location to current lat/lng by making API call
    getLocation() {
      Vue.$geocoder.send({lat: this.report.lat, lng: this.report.lng}, response => {
        this.report.location = String(response.results[0].formatted_address);
      })
    },

    //detects location from browser
    geolocate() {
      navigator.geolocation.getCurrentPosition((position) => {
        this.center = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };
        this.marker.position = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };

        // updates current report coordinates to marker positions
        this.report.lat = this.marker.position.lat;
        this.report.lng = this.marker.position.lng;
        this.panToMarker();

        // updates report.location
        this.getLocation()
      });
    },

    //sets the position of marker when dragged
    handleMarkerDrag(e) {
      this.marker.position = { lat: e.latLng.lat(), lng: e.latLng.lng() };

      // updates current report coordinates to marker positions
      this.report.lat = this.marker.position.lat;
      this.report.lng = this.marker.position.lng;

      // updates report.location
      this.getLocation();
    },

    // Moves the map view port to marker
    panToMarker() {
      this.$refs.mapRef.panTo(this.marker.position);
      // this.$refs.mapRef.setZoom(18);
    },

    //Moves the marker to click position on the map
    handleMapClick(e) {
      this.marker.position = { lat: e.latLng.lat(), lng: e.latLng.lng() };

      // updates current report coordinates to marker positions
      this.report.lat = this.marker.position.lat;
      this.report.lng = this.marker.position.lng;

      // updates report.location
      this.getLocation();
    },
  },
};
</script>

<style>
#map {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
</style>