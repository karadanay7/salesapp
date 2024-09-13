<template>

      <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 pt-28">
          <div>
            <img
              :src="product.image"
              :alt="product.title"
              class="w-full h-80 object-contain rounded-lg shadow-md"
            />
          </div>
          <div>
            <h1 class="text-3xl font-semibold">{{ product.title }}</h1>
            <p class="text-gray-600 mt-2">{{ product.category }}</p>
            <p class="text-lg font-semibold mt-4">
              {{ `$${product.price.toFixed(2)}` }}
            </p>
            <p class="text-gray-700 mt-2">{{ product.description }}</p>
            <button
              type="submit"
              @click="addToCart()"
              :disabled="isInCart"
              class="px-6 py-2 rounded-lg mt-6 text-white text-lg font-semibold bg-gradient-to-r from-[#FF851A] to-[#FFAC2C]"
              id="addtocart"
              aria-label="addtocart"
            >
              <div v-if="isInCart">Is Added</div>
              <div v-else>Add to Cart</div>
            </button>
            <!-- Add more product details here if available -->
          </div>
        </div>
      </div>

  </template>
  <script setup>




  const storeId = route.params.id;
  
  const response = await useFetch(`/api/prisma/get-product-by-id/${storeIdId}`);
  const product = response?.data?.value;

 
  </script>
  