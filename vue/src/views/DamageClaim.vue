<template>
    <div id="damage-report" class="damage-report">
        <h3>Please Submit Details for Damage Claim</h3>
        <p>The City of Philadelphia will review damage claims within 2-3 business days. </p>
        <form id="damage-form">
            <div>
            <label for="name">Full Name: </label>
            <input id="name" type="text" name="name" />
            <label for="phone-number">Phone Number: </label>
            <input id="phone-number" type="tel" />
            </div>
            <div>
            <label for="email">Email Address: </label>
            <input id="email" type="email" name="email" />

            <label for="address">Home Address: </label>
            <input id="address" type="text" name="address" />
            </div>
            <div>
            <label for="incident-date">Incident Date: </label>
            <input type="datetime-local"/>
            </div>
            <div>
            <label for="car">Car Make and Model: </label>
            <input id="car"  type="text" name="car" />
            </div>
            <div>
            <label for="description">Damage Description: </label>
            <textarea rows="5" cols="50" id="description" name="description" maxlength="400"/>
            </div>
            <button type="submit">Save</button>
        </form>
    </div>
  
</template>

<script>
export default {
  name: "damage-claim",
};
</script>

<style>
</style>