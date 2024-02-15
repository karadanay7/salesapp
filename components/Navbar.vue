<template>
  <div class="Main flex flex-col">
    <!-- navbar  -->
    <div
      class="Navbar flex-1 w-full border-b flex items-center justify-center font-index font-semibold"
    >
      <div class="flex items-center justify-between px-4 md:px-8 py-2">
        <div class="flex items-center">
          <nuxt-link to="/">
            <NuxtImg
              src="/Logo.png"
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
          <li>
            <UToggle
              :model-value="isDarkModeEnabled"
              @update:model-value="setColorTheme"
              on-icon="i-twemoji-sun"
              off-icon="i-ion-moon"
              size="lg"
            />
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
    <div class="SearchBar flex-2 w-full justify-center items-center">
      <div class="max-w-[700px] w-full">
        <UInput
          color="primary"
          placeholder="Search for product, category or shop "
          v-model="searchItem"
          icon="i-heroicons-magnifying-glass-20-solid"
        />
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
const isMenuOpen = ref(false);

type Theme = "light" | "dark";

const isDarkModeEnabled = ref<boolean>(false);

const setColorTheme = () => {
  isDarkModeEnabled.value = !isDarkModeEnabled.value;
  useColorMode().preference = isDarkModeEnabled.value ? "dark" : "light";
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
