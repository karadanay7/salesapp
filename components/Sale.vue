<template>
  <UCard class="w-56 sm:w-72 h-full dark:bg-gray-800">
    <template #header class="bg-violet-300">
      <h2 class="text-base sm:text-lg font-semibold">{{ name }}</h2>
    </template>
    <div class="h-32 sm:h-44">
      <img :src="url" alt="" class="w-full h-full object-contain rounded-md" />
    </div>

    <template #footer>
      <div class="text-xs sm:text-sm">
        <p v-if="description">
          <span class="font-semibold text-primary-500 dark:text-primary-400"
            >Sale:</span
          >
          {{ description }} for {{ products.join(",") }}
        </p>
        <p v-else>
          <span class="font-semibold text-primary-500 dark:text-primary-400"
            >Sale:</span
          >
          %{{ percentage }} for {{ products.join(",") }}
        </p>
        <p>
          <span class="font-semibold">Address:</span>
          {{ addressLine }}
        </p>
        <p>
          <span class="font-semibold">Sale Days:</span>
          {{ timespanDays }}
        </p>

        <p>
          <span class="font-semibold">Sale Hours:</span>
          {{ timespanHours }}
        </p>
        <p>
          <span class="font-semibold">Sales Where:</span>
          {{ available.join(",") }}
        </p>
      </div>
    </template>
  </UCard>
</template>
<script setup>
defineProps([
  "name",
  "url",
  "description",
  "percentage",
  "products",
  "addressLine",
  "timespanDays",
  "timespanHours",
  "available",
]);
</script>
