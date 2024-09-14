<template>
  <div class="h-full w-full font-index">
    {{ restaurantSales }}
    <div class="SalesList container mx-auto flex flex-col gap-1 md:gap-5">
    
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
              :shopName="sale.companyName"
              :saleDescriptionOrPercentage="sale.description || sale.discountPercentage"
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
const restaurantSalesResponse = await useFetch("/api/prisma/get-restaurant-sales");
const restaurantSales = restaurantSalesResponse.data?.value?.sales;

</script>

