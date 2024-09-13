<template>

      <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 pt-28">
          <div>
           
            <p>{{ store.companyName }}</p>
          </div>
          <div>
           
           
           
          </div>
        </div>
      </div>

  </template>
  <script setup>


const route = useRoute();

  const storeId = route.params.id;
  
  const response = await useFetch(`/api/prisma/get-store-by-id/${storeId}`);
  const store = response?.data?.value;

 
  </script>
  