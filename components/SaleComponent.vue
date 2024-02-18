<template>
  <div class="w-80 h-96">
    <!-- Sale box content goes here -->
    <h2 class="text-xl font-semibold">{{ shopName }}</h2>
    <img :src="url" alt="" class="w-full h-1/2 object-cover rounded-md" />
    <p>
      <span class="font-semibold text-indigo-500">Sale:</span>
      {{ saleDescriptionOrPercentage }} for
      {{ saleProducts ? saleProducts.join(", ") : "No products available" }}
    </p>
    <p>
      <span class="font-semibold">Address:</span>
      {{ address.street }},{{ address.city }}
    </p>
    <p v-if="saleTimespanDays && saleTimespanHours">
      <span class="font-semibold">Sale Days:</span>
      {{ saleTimespanDays.join(", ") }}
    </p>

    <p v-if="saleTimespanDays && saleTimespanHours">
      <span class="font-semibold">Sale Hours:</span>
      {{ saleTimespanHours }}
    </p>
    <p>
      <span class="font-semibold">Sales Where:</span>
      {{ salesWhere ? salesWhere : "Not specified" }}
    </p>
  </div>
</template>

<script setup>
defineProps([
  "shopName",
  "url",
  "saleDescriptionOrPercentage",
  "saleProducts",
  "address",
  "saleTimespanDays",
  "saleTimespanHours",
  "salesWhere",
]);
</script>
