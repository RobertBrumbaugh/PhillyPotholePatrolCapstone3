<template>
  <div>
    <form class="new-pothole-report" v-on:submit.prevent>
      <div>
        <input
          class="user-input"
          type="text"
          placeholder="User"
          v-model="report.username"
        />
      </div>
      <div>
        <input
          class="reported-input"
          type="text"
          placeholder="Date"
          v-model="report.reported"
        />
      </div>
      <div>
        <input
          class="lat-input"
          type="text"
          placeholder="Latitude"
          v-model="report.lat"
        />
      </div>
      <div>
        <input
          class="lng-input"
          type="text"
          placeholder="Longitude"
          v-model="report.lng"
        />
      </div>
      <button type="submit" v-on:click="saveReport">Save</button>
      <!-- this will probably be changed? -->
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
      <br>
      <button @click="geolocate">Detect Location</button>

      <p>LAT: {{ marker.position.lat }} LNG: {{ marker.position.lng }}</p>
    </div>
  </div>
</template>

<script>
import ReportService from "../services/ReportService";

export default {
  name: "new-pothole-report",
  components: {},
  data() {
    return {
      report: {
        username: "",
        lat: "",
        lng: "",
        status: "",
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
  methods: {

//detects location from browser
    geolocate() {
      navigator.geolocation.getCurrentPosition((position) => {
        this.center = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        }
        this.marker.position = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };

        this.panToMarker();
      });
    },
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

    saveReport() {
      ReportService.addReport(this.report).then((response) => {
        if (response.status === 201) {
          this.report = {
            username: "",
            lat: "",
            lng: "",
            status: "",
            reported: "",
          };
          this.$router.push("/reports");
        }
      });
    },
  },
};
</script>

<style>

#map {
  display:flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}



</style>