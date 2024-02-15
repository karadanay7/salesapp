<template>
  <UContainer
    class="w-full flex items-center justify-between border-b border-gray-200 dark:border-gray-800"
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
    <div>
      <UHorizontalNavigation :links="links" />
    </div>

    <div class="flex items-center">
      <UToggle
        :model-value="isDarkModeEnabled"
        @update:model-value="setColorTheme"
        on-icon="i-twemoji-sun"
        off-icon="i-ion-moon"
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

type Theme = "light" | "dark";

const isDarkModeEnabled = ref<boolean>(false);

const setColorTheme = () => {
  isDarkModeEnabled.value = !isDarkModeEnabled.value;
  useColorMode().preference = isDarkModeEnabled.value ? "dark" : "light";
};
const links = [
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
