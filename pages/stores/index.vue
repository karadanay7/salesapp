<template>
  <div class="h-full w-full font-index">
    <div class="SalesList container mx-auto flex flex-col gap-1 md:gap-5">
      <!-- Restaurants section -->
      <!-- Scrollable container for restaurant sales boxes -->
      <div v-for="(category, i) in storesList">
        <UBadge size="xl" :ui="{ rounded: 'rounded-lg' }" class="ml-2">{{
          category
        }}</UBadge>

        <ul class="flex items-stretch gap-4 overflow-x-auto max-w-full py-3">
         
          <li
            v-for="sale in restaurantSales"
            :key="sale.id"
            class="SaleBox p-2 rounded-lg"
          >
          <ULink :to="`/stores/${sale.storeId}`">
            <SaleC
              :shopName="sale.shopName"
              :saleDescriptionOrPercentage="sale.saleDescriptionOrPercentage"
              :saleProducts="sale.saleProducts"
              :addressLine="sale.addressLine"
              :district="sale.district"
              :saleTimespanDays="sale.saleTimespanDays"
              :saleTimespanHours="sale.saleTimespanHours"
              :salesWhere="sale.available"
              :url="sale.url"
            />
            </ULink>
          </li>
       
        </ul>
      </div>

    </div>
  </div>
</template>

<script setup>
const storesList = [
  "Featured Stores",
  "Shop Categories",
  "Location Based Stores",

  "Discount Percentage",
  "Deal of the Day!",
];
const restaurantSales = useFetch("/api/prisma/get-restaurant-sales");

</script>

