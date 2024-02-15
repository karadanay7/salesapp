<template>
  <div class="h-full w-full font-index">
    <div class="SalesList container mx-auto flex flex-col gap-10">
      <!-- Restaurants section -->
      <div class="Category1">
        <h1 class="text-2xl font-semibold pb-10">Featured Sales</h1>
        <!-- Scrollable container for restaurant sales boxes -->
        <div class="flex overflow-x-auto flex-shrink-0 h-96 w-full">
          <div class="flex gap-4">
            <div
              v-for="sale in restaurantSales"
              :key="sale.id"
              class="SaleBox rounded-lg w-80"
            >
              <!-- Sale box content goes here -->
              <h2 class="text-xl font-semibold">{{ sale.shopName }}</h2>
              <img
                :src="sale.url"
                alt=""
                class="w-full h-1/2 object-cover rounded-md"
              />
              <p>
                <span class="font-semibold">Sale:</span>
                {{ sale.saleDescriptionOrPercentage }} for
                {{
                  sale.saleProducts
                    ? sale.saleProducts.join(", ")
                    : "No products available"
                }}
              </p>
              <p>
                <span class="font-semibold">Address:</span>
                {{ sale.address.street }},{{ sale.address.city }}
              </p>
              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Days:</span>
                {{ sale.saleTimespanDays.join(", ") }}
              </p>

              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Hours:</span>
                {{ sale.saleTimespanHours }}
              </p>
              <p>
                <span class="font-semibold">Sales Where:</span>
                {{ sale.salesWhere ? sale.salesWhere : "Not specified" }}
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="Category2">
        <h1 class="text-2xl font-semibold pb-10">Sale Categories</h1>
        <!-- Scrollable container for restaurant sales boxes -->
        <div class="flex overflow-x-auto flex-shrink-0 h-96 w-full">
          <div class="flex gap-4">
            <div
              v-for="sale in restaurantSales"
              :key="sale.id"
              class="SaleBox rounded-lg w-80"
            >
              <!-- Sale box content goes here -->
              <h2 class="text-xl font-semibold">{{ sale.shopName }}</h2>
              <img
                :src="sale.url"
                alt=""
                class="w-full h-1/2 object-cover rounded-md"
              />
              <p>
                <span class="font-semibold">Sale:</span>
                {{ sale.saleDescriptionOrPercentage }} for
                {{
                  sale.saleProducts
                    ? sale.saleProducts.join(", ")
                    : "No products available"
                }}
              </p>
              <p>
                <span class="font-semibold">Address:</span>
                {{ sale.address.street }},{{ sale.address.city }}
              </p>
              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Days:</span>
                {{ sale.saleTimespanDays.join(", ") }}
              </p>

              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Hours:</span>
                {{ sale.saleTimespanHours }}
              </p>
              <p>
                <span class="font-semibold">Sales Where:</span>
                {{ sale.salesWhere ? sale.salesWhere : "Not specified" }}
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="Category3">
        <h1 class="text-2xl font-semibold pb-10">Location-Based Sales</h1>
        <!-- Scrollable container for restaurant sales boxes -->
        <div class="flex overflow-x-auto flex-shrink-0 h-96 w-full">
          <div class="flex gap-4">
            <div
              v-for="sale in restaurantSales"
              :key="sale.id"
              class="SaleBox rounded-lg w-80"
            >
              <!-- Sale box content goes here -->
              <h2 class="text-xl font-semibold">{{ sale.shopName }}</h2>
              <img
                :src="sale.url"
                alt=""
                class="w-full h-1/2 object-cover rounded-md"
              />
              <p>
                <span class="font-semibold">Sale:</span>
                {{ sale.saleDescriptionOrPercentage }} for
                {{
                  sale.saleProducts
                    ? sale.saleProducts.join(", ")
                    : "No products available"
                }}
              </p>
              <p>
                <span class="font-semibold">Address:</span>
                {{ sale.address.street }},{{ sale.address.city }}
              </p>
              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Days:</span>
                {{ sale.saleTimespanDays.join(", ") }}
              </p>

              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Hours:</span>
                {{ sale.saleTimespanHours }}
              </p>
              <p>
                <span class="font-semibold">Sales Where:</span>
                {{ sale.salesWhere ? sale.salesWhere : "Not specified" }}
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="Category4">
        <h1 class="text-2xl font-semibold pb-10">Ends Soon!</h1>
        <!-- Scrollable container for restaurant sales boxes -->
        <div class="flex overflow-x-auto flex-shrink-0 h-96 w-full">
          <div class="flex gap-4">
            <div
              v-for="sale in restaurantSales"
              :key="sale.id"
              class="SaleBox rounded-lg w-80"
            >
              <!-- Sale box content goes here -->
              <h2 class="text-xl font-semibold">{{ sale.shopName }}</h2>
              <img
                :src="sale.url"
                alt=""
                class="w-full h-1/2 object-cover rounded-md"
              />
              <p>
                <span class="font-semibold">Sale:</span>
                {{ sale.saleDescriptionOrPercentage }} for
                {{
                  sale.saleProducts
                    ? sale.saleProducts.join(", ")
                    : "No products available"
                }}
              </p>
              <p>
                <span class="font-semibold">Address:</span>
                {{ sale.address.street }},{{ sale.address.city }}
              </p>
              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Days:</span>
                {{ sale.saleTimespanDays.join(", ") }}
              </p>

              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Hours:</span>
                {{ sale.saleTimespanHours }}
              </p>
              <p>
                <span class="font-semibold">Sales Where:</span>
                {{ sale.salesWhere ? sale.salesWhere : "Not specified" }}
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="Category5">
        <h1 class="text-2xl font-semibold pb-10">Discount Percentages</h1>
        <!-- Scrollable container for restaurant sales boxes -->
        <div class="flex overflow-x-auto flex-shrink-0 h-96 w-full">
          <div class="flex gap-4">
            <div
              v-for="sale in restaurantSales"
              :key="sale.id"
              class="SaleBox rounded-lg w-80"
            >
              <!-- Sale box content goes here -->
              <h2 class="text-xl font-semibold">{{ sale.shopName }}</h2>
              <img
                :src="sale.url"
                alt=""
                class="w-full h-1/2 object-cover rounded-md"
              />
              <p>
                <span class="font-semibold">Sale:</span>
                {{ sale.saleDescriptionOrPercentage }} for
                {{
                  sale.saleProducts
                    ? sale.saleProducts.join(", ")
                    : "No products available"
                }}
              </p>
              <p>
                <span class="font-semibold">Address:</span>
                {{ sale.address.street }},{{ sale.address.city }}
              </p>
              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Days:</span>
                {{ sale.saleTimespanDays.join(", ") }}
              </p>

              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Hours:</span>
                {{ sale.saleTimespanHours }}
              </p>
              <p>
                <span class="font-semibold">Sales Where:</span>
                {{ sale.salesWhere ? sale.salesWhere : "Not specified" }}
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="Category6">
        <h1 class="text-2xl font-semibold pb-10">Deal of the Day</h1>
        <!-- Scrollable container for restaurant sales boxes -->
        <div class="flex overflow-x-auto flex-shrink-0 h-96 w-full">
          <div class="flex gap-4">
            <div
              v-for="sale in restaurantSales"
              :key="sale.id"
              class="SaleBox rounded-lg w-80"
            >
              <!-- Sale box content goes here -->
              <h2 class="text-xl font-semibold">{{ sale.shopName }}</h2>
              <img
                :src="sale.url"
                alt=""
                class="w-full h-1/2 object-cover rounded-md"
              />
              <p>
                <span class="font-semibold">Sale:</span>
                {{ sale.saleDescriptionOrPercentage }} for
                {{
                  sale.saleProducts
                    ? sale.saleProducts.join(", ")
                    : "No products available"
                }}
              </p>
              <p>
                <span class="font-semibold">Address:</span>
                {{ sale.address.street }},{{ sale.address.city }}
              </p>
              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Days:</span>
                {{ sale.saleTimespanDays.join(", ") }}
              </p>

              <p v-if="sale.saleTimespanDays && sale.saleTimespanHours">
                <span class="font-semibold">Sale Hours:</span>
                {{ sale.saleTimespanHours }}
              </p>
              <p>
                <span class="font-semibold">Sales Where:</span>
                {{ sale.salesWhere ? sale.salesWhere : "Not specified" }}
              </p>
            </div>
          </div>
        </div>
      </div>

      <!-- Add more sections as needed -->
    </div>
  </div>
</template>

<script setup>
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
