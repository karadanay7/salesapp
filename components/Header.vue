<template>
  <UContainer
    class="w-full flex items-center justify-between border-b border-gray-200 dark:border-gray-600"
  >
    <div>
      <ULink to="/">
        <NuxtImg
          src="/Logo.png"
          alt="Logo"
          format="webp"
          class="h-8"
          sizes="sm:100vw md:100vw lg:400px"
        />
      </ULink>
    </div>
    <div class="py-2">
      <UButton @click="toggleMenu()" class="md:hidden">
        <Icon
          :name="isMenuOpen ? 'pajamas:close' : 'pajamas:hamburger'"
          class="w-4 h-4 text-gray-300 dark:text-gray-900"
        />
      </UButton>
    </div>

    <div class="hidden md:flex">
      <UHorizontalNavigation :links="horizontalLinks" />
    </div>
    <div
      v-if="isMenuOpen"
      class="flex md:hidden top-8 absolute z-10 mx-auto left-0 right-0 border rounded-lg text-start bg-white dark:bg-gray-900 border-gray-300 dark:border-gray-600 justify-center py-2 items-center"
    >
      <UVerticalNavigation :links="verticalLinks" />
    </div>

    <div class="flex items-center">
      <UToggle
        :model-value="isDarkModeEnabled"
        @update:model-value="setColorTheme"
        on-icon="i-heroicons-moon"
        off-icon="i-heroicons-sun"
        size="lg"
      />
    </div>
  </UContainer>
  <div class="w-full flex items-center justify-center p-2 gap-4">
    <div class="max-w-[700px] w-full">
      <UInput
        color="primary"
        placeholder="Search for product, category or shop "
        v-model="searchItem"
        icon="i-heroicons-magnifying-glass-20-solid"
      />
    </div>
  </div>
</template>
<script setup lang="ts">
const isMenuOpen = ref(false);
const toggleMenu = () => (isMenuOpen.value = !isMenuOpen.value);

const isDarkModeEnabled = ref<boolean>(false);

const setColorTheme = () => {
  isDarkModeEnabled.value = !isDarkModeEnabled.value;
  useColorMode().preference = isDarkModeEnabled.value ? "dark" : "light";
};
const horizontalLinks = [
  [
    {
      label: "Home",
      icon: "i-heroicons-home",
      to: "/",
    },
    {
      label: "Sales",
      icon: "i-heroicons-arrow-trending-down",
      to: "/sales",
    },
    {
      label: "Stores",
      icon: "i-heroicons-building-storefront",
      to: "/shops",
    },
    {
      label: "Ending Soon!",
      icon: "i-heroicons-bolt",
      to: "/ending-soon",
    },
    {
      label: "Register Your Store",
      to: "/register",
    },
  ],
];
const verticalLinks = [
  [
    {
      label: "Home",
      icon: "i-heroicons-home",
      to: "/",
    },
    {
      label: "Sales",
      icon: "i-heroicons-arrow-trending-down",
      to: "/sales",
    },
    {
      label: "Stores",
      icon: "i-heroicons-building-storefront",
      to: "/shops",
    },
    {
      label: "Ending Soon!",
      icon: "i-heroicons-bolt",
      to: "/ending-soon",
    },
    {
      label: "Register Your Store",
      to: "/register",
    },
  ],
];
</script>
