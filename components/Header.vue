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
      <UButton
        v-if="user"
        @click="signOut()"
        class="text-[13px] py-2 px-4 w-full hover:bg-gray-100 hover:text-orange-500"
      >
        <Icon name="uil:signout" size="17" class="mb-1" />
        Sign out
      </UButton>
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
const supabase = useSupabaseClient();
const user = useSupabaseUser();
const isMenuOpen = ref(false);
const toggleMenu = () => (isMenuOpen.value = !isMenuOpen.value);

const isDarkModeEnabled = ref<boolean>(false);
const signOut = () => {
  supabase.auth.signOut();
  user.value = null;

  return navigateTo("/");
};

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
      to: "/auth",
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
      to: "/auth",
    },
  ],
];
</script>
