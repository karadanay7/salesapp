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
          <ULink :to="`/stores/${store.id}`">
            <SaleC
              :shopName="sale.shopName"
              :saleDescriptionOrPercentage="sale.saleDescriptionOrPercentage"
              :saleProducts="sale.saleProducts"
              :address="sale.address"
              :saleTimespanDays="sale.saleTimespanDays"
              :saleTimespanHours="sale.saleTimespanHours"
              :salesWhere="sale.salesWhere"
              :url="sale.url"
            />
            </ULink>
          </li>
       
        </ul>
      </div>
      <!-- Add more sections as needed -->
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
const restaurantSales = [
  {
    id: 1,
    shopName: "Coffee Shop Maria",
    url: "https://www.no3.com.tr/wp-content/uploads/2020/01/co-3-scaled.jpg",
    saleDescriptionOrPercentage: "50%",
    saleProducts: ["all products"],
    saleTimespanDays: ["11.01.2024", "13.01.2024", "15.01.2024"],
    saleTimespanHours: "10:00 AM - 12:00 PM",
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
    salesWhere: "On Getir",
  },
  {
    id: 2,
    shopName: "Rosie Coffee",
    url: "https://res.cloudinary.com/traveltripperweb/image/upload/c_fit,h_1200,w_1200/v1568926602/s8kjihkxpus2buax6zn0.jpg",
    saleDescriptionOrPercentage: "40%",
    saleProducts: ["for small size coffees"],
    saleTimespanDays: ["11.01.2024", "13.01.2024", "15.01.2024"],
    saleTimespanHours: "10:00 AM - 12:00 PM",
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
    salesWhere: "On Getir, Yemeksepeti",
  },
  {
    id: 3,
    shopName: "Benny Coffee Shop",
    url: "https://i.pinimg.com/originals/71/0c/44/710c44c13b02d1a0778fc15805547473.jpg",
    saleDescriptionOrPercentage: "20%",
    saleProducts: ["Deserts"],
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
    salesWhere: "In place",
  },
  {
    id: 4,
    shopName: "Brandon's Coffee",
    url: "https://media-cdn.tripadvisor.com/media/photo-s/29/cf/78/38/visit-our-hashtag-coffeeshop.jpg",
    saleDescriptionOrPercentage: "40%",
    saleProducts: ["Hot drinks"],
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
  },
  {
    id: 5,
    shopName: "Linda's ",
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTirAady5yBDPr3Az2Jb1hAYve2LPvf6BsItg&usqp=CAU",
    saleDescriptionOrPercentage: "Buy one coffee, get the second one free ",
    saleProducts: ["Tall boy coffees"],
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
  },
  {
    id: 6,
    shopName: "Coffee Merlin",
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP4b9CvBee357oukUOUkz6Avv9tmkAeSO5AA&usqp=CAU",
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
  },
  {
    id: 7,
    shopName: "John Coffee & Book Shop",
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiZP7bGXB1PDRmuprDROr4vmuOQX-TtolKhw&usqp=CAU",
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
  },
  {
    id: 8,
    shopName: "Rosie Coffee",
    url: "https://minneapolis-2021.s3.amazonaws.com/images/coffee-shops-cafe-ceres-john-yuccas-hero.gif?v=1677691662",
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
  },
  {
    id: 9,
    shopName: "Bear & Beans Coffee",
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjYWCrMbBn9-gAgOgy9QGk7z_CMXjEQZnrqA7P7XDRBK4_TvqAsXbAAhpTKLXhO9wxYZ0&usqp=CAU",
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
  },
  {
    id: 10,
    shopName: "Simbat Coffee",
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjYWCrMbBn9-gAgOgy9QGk7z_CMXjEQZnrqA7P7XDRBK4_TvqAsXbAAhpTKLXhO9wxYZ0&usqp=CAU",
    address: {
      street: "123 Espresso Blvd",
      city: "Cafetown",
      state: "CA",
      zip: "98765",
      country: "USA",
    },
  },
  // Add more sales data as needed
];
</script>

<style scoped>
/* Add styles for the SaleBox */
</style>
