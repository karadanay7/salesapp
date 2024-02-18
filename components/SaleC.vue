<template>
  <UCard class="w-56 sm:w-72 h-full dark:bg-gray-800">
    <template #header class="bg-violet-300">
      <h2 class="text-base sm:text-lg font-semibold">{{ shopName }}</h2>
    </template>
    <div class="h-32 sm:h-44">
      <img :src="url" alt="" class="w-full h-full object-cover rounded-md" />
    </div>

    <template #footer>
      <div class="text-xs sm:text-sm">
        <p>
          <span class="font-semibold text-primary-500 dark:text-primary-400"
            >Sale:</span
          >
          {{ saleDescriptionOrPercentage }} for
          {{ saleProducts ? saleProducts.join(", ") : "No products available" }}
        </p>
        <p>
          <span class="font-semibold">Address:</span>
          {{ address.street }},{{ address.city }}
        </p>
        <p v-if="saleTimespanDays && saleTimespanHours">
          <span class="font-semibold">Sale Days:</span>
          {{ getSaleRange(saleTimespanDays) }}
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
  </UCard>
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

const getSaleRange = (arr) => {
  if (arr.length < 3) return arr.join(", ");
  return `${arr?.[0]} - ${arr?.[arr.length - 1]}`;
};
</script>
