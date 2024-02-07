<template>
  <div class="Main flex flex-col">
    <!-- navbar  -->
    <div
      class="Navbar flex-1 w-full border-b flex items-center justify-center bg-white font-index font-semibold"
    >
      <div class="flex items-center justify-between px-4 md:px-8 py-2">
        <div class="flex items-center">
          <nuxt-link to="/">
            <NuxtImg
              src="/Sale.png"
              alt="Logo"
              format="webp"
              class="h-10 md:h-12 pr-4"
              sizes="sm:100vw md:100vw lg:400px"
            />
          </nuxt-link>
        </div>
        <button
          @click="toggleMenu()"
          class="md:hidden p-2 rounded focus:outline-none focus:ring-2 focus:ring-red-500"
        >
          <Icon
            :name="isMenuOpen ? 'pajamas:close' : 'pajamas:hamburger'"
            class="w-6 h-6 text-gray-900"
          />
        </button>
        <!-- Desktop menu -->
        <ul
          class="hidden md:flex text-sm md:text-lg lg:text-2xl flex-row text-gray-900 text-shadow"
        >
          <li class="hover:scale-110 hover:text-red-500">
            <nuxt-link to="/" class="pl-4 sm:pl-8 md:pl-12 lg:pl-16"
              >Home</nuxt-link
            >
          </li>
          <li class="hover:scale-110 hover:text-red-500">
            <nuxt-link to="/sales" class="pl-4 sm:pl-8 md:pl-12 lg:pl-16"
              >Sales</nuxt-link
            >
          </li>
          <li class="hover:scale-110 hover:text-red-500">
            <nuxt-link to="/shops" class="pl-4 sm:pl-8 md:pl-12 lg:pl-16"
              >Shops</nuxt-link
            >
          </li>

          <li class="hover:scale-110 hover:text-red-500">
            <nuxt-link to="/about" class="pl-4 sm:pl-8 md:pl-12 lg:pl-16"
              >About</nuxt-link
            >
          </li>
          <li class="hover:scale-110 hover:text-red-500">
            <nuxt-link to="/contact" class="pl-4 sm:pl-8 md:pl-12 lg:pl-16"
              >Contact</nuxt-link
            >
          </li>
          <li class="hover:scale-110 hover:text-red-500">
            <nuxt-link to="/contact" class="pl-4 sm:pl-8 md:pl-12 lg:pl-16">
              <span class="hidden xl:inline-block">Account</span>
              <Icon name="ic:baseline-person" size="25" class="mb-1 ml-2" />
              <Icon name="mdi:chevron-down" size="25"
            /></nuxt-link>
          </li>
        </ul>
      </div>
      <ul
        v-if="isMenuOpen"
        class="block md:hidden top-14 absolute z-10 m-auto left-0 w-2/5 right-0 bg-white border rounded-lg text-center text-red-500"
      >
        <li>
          <nuxt-link
            to="/"
            class="block py-2 px-4 hover:text-gray-900 hover:scale-110"
            aria-current="page"
            >Home</nuxt-link
          >
        </li>
        <li>
          <nuxt-link
            to="/sales"
            class="block py-2 px-4 hover:text-gray-900 hover:scale-110"
            >Sales</nuxt-link
          >
        </li>
        <li>
          <nuxt-link
            to="/shops"
            class="block py-2 px-4 hover:text-gray-900 hover:scale-110"
            aria-current="page"
            >Shops</nuxt-link
          >
        </li>
        <li>
          <nuxt-link
            to="/about"
            class="block py-2 px-4 hover:text-gray-900 hover:scale-110"
            >About</nuxt-link
          >
        </li>
        <li>
          <nuxt-link
            to="/contact"
            class="block py-2 px-4 hover:text-gray-900 hover:scale-110"
            >Contact</nuxt-link
          >
        </li>
      </ul>
    </div>
    <!-- Search bar -->
    <div class="SearchBar flex-2 w-full bg-white justify-center">
      <div class="flex justify-center max-w-[1150px] p-4 w-full mx-auto">
        <div class="max-w-[700px] w-full">
          <div
            class="flex items-center border-2 border-red-500 rounded-sm w-full h-10"
          >
            <input
              class="w-full placeholder-gray-400 text-md pl-2 focus:outline-none"
              placeholder=" Search for product, category or shop "
              type="text"
              v-model="searchItem"
            />
            <Icon
              v-if="isSearching"
              name="eos-icons:loading"
              size="25"
              class="mr-2"
            />
            <button
              type="button"
              class="flex items-center h-[100%] p-1.5 px-2 bg-red-500"
              id="serach"
              aria-label="search"
            >
              <Icon name="iconamoon:search-bold" size="20" color="#ffffff" />
            </button>
          </div>

          <div class="bg-white max-w-[700px] h-auto w-full">
            <div
              v-if="items && items.data"
              v-for="item in items.data"
              class="p-1"
            >
              <NuxtLink
                :to="`/item/${item.id}`"
                class="flex items-center justify-center w-full cursor-pointer hover:bg-gray-100"
              >
                <div class="flex items-center">
                  <nuxt-img
                    class="rounded-md"
                    width="40"
                    :src="item.url"
                    alt="itemlogo"
                    title="item"
                  />
                  <div class="truncate ml-2">{{ item.title }}</div>
                </div>
                <div class="truncate">${{ item.price / 100 }}</div>
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
const isMenuOpen = ref(false);

const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value;
};

// import { useUserStore } from "~/stores/user";
// const userStore = useUserStore();

// const supabase = useSupabaseClient();
// const user = useSupabaseUser();

// let isAccountMenu = ref(false);
// let isCartHover = ref(false);
// let isSearching = ref(false);
// let searchItem = ref("");
// let items = ref(null);

// const signOut = () => {
//   supabase.auth.signOut();
//   user.value = null;

//   return navigateTo("/");
// };

// const searchByName = useDebounce(async () => {
//   isSearching.value = true;
//   items.value = await useFetch(
//     `/api/prisma/search-by-name/${searchItem.value}`
//   );
//   isSearching.value = false;
// }, 100);

// watch(
//   () => searchItem.value,
//   async () => {
//     if (!searchItem.value) {
//       setTimeout(() => {
//         items.value = "";
//         isSearching.value = false;
//         return;
//       }, 500);
//     }
//     searchByName();
//   }
// );
</script>
