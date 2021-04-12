<template>
  <div id="damage-report" class="damage-report">
    <h3>Please Submit Details for Damage Claim</h3>
    <p>
      The City of Philadelphia will review damage claims within 2-3 business
      days.
    </p>
    <form id="damage-form" v-on:submit.prevent>
      <div>
        <label for="name">Full Name: </label>
        <input id="name" type="text" name="name" v-model="damageClaim.full_name"/>
        <label for="phone-number">Phone Number: </label>
        <input id="phone-number" type="tel" v-model="damageClaim.phone_number"/>
      </div>
      <div>
        <label for="email">Email Address: </label>
        <input id="email" type="email" name="email" v-model="damageClaim.email"/>

        <label for="address">Home Address: </label>
        <input id="address" type="text" name="address" v-model="damageClaim.address"/>
      </div>
      <div>
        <label for="incident-date">Incident Date: </label>
        <input type="datetime-local" v-model="damageClaim.incident_date"/>
      </div>
      <div>
        <label for="car">Car Make and Model: </label>
        <input id="car" type="text" name="car" v-model="damageClaim.car" />
      </div>
      <div>
        <label for="description">Damage Description: </label>
        <textarea
          rows="5"
          cols="50"
          id="description"
          name="description"
          maxlength="400"
          v-model="damageClaim.damage_description"
        />
      </div>
      <button type="submit" v-on:click="saveDamageClaim">Save</button>
    </form>
  </div>
</template>

<script>
import ReportService from "../services/ReportService";

export default {
  name: "damage-claim",
  data() {
    return {
      damageClaim: {
        report_id: Number,
        full_name: "",
        phone_number: "",
        email: "",
        address: "",
        incident_date: "",
        car: "",
        damage_description: "",
      },
    };
  },
  methods: {
    saveDamageClaim() {
      this.damageClaim.report_id = this.$route.params.id;

      ReportService.addDamageClaim(this.damageClaim).then((response) => {
        if (response.status === 201) {
          this.damageClaim = {
            report_id: 0,
            full_name: "",
            phone_number: "",
            email: "",
            address: "",
            incident_date: "",
            car: "",
            damage_description: "",
          };
          this.$router.push("/reports");
        }
      });
    },
  },
};
</script>

<style>
</style>