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
      <UButton @click="toggleMenu" class="md:hidden">
        <Icon
          :name="isMenuOpen ? 'pajamas:close' : 'pajamas:hamburger'"
          class="w-4 h-4 text-gray-300 dark:text-gray-900"
        />
      </UButton>
    </div>

    <div class="hidden md:flex">
      <UHorizontalNavigation :links="store ? storeHorizontalLinks : horizontalLinks" />
    </div>

    <div
      v-if="isMenuOpen"
      class="flex flex-col md:hidden top-11 absolute z-10 mx-auto left-0 right-0 border rounded-lg text-start bg-white dark:bg-gray-900 border-gray-300 dark:border-gray-600 justify-center py-2 items-center"
    >
      <div class="absolute top-0 w-full flex justify-end items-center">
        <NuxtLink
          v-if="user"
          @click="signOut"
          size="xs"
          class="flex items-center w-full justify-end gap-1.5 text-sm text-primary p-2"
        >
          <Icon
            name="i-heroicons-arrow-right-start-on-rectangle-20-solid"
            class="text-primary"
          />
          Sign out
        </NuxtLink>
        <NuxtLink
          v-if="!user"
          @click="navigateAuth"
          size="xs"
          class="flex w-full items-center justify-end gap-1.5 text-sm text-primary p-2"
        >
          <Icon
            name="i-heroicons-arrow-right-start-on-rectangle-20-solid"
            class="text-primary"
          />
          Log in
        </NuxtLink>
      </div>

      <UVerticalNavigation :links="store ? storeVerticalLinks : verticalLinks" />
    </div>

    <div class="flex items-center justify-center gap-2">
      <ULink
        v-if="!user"
        @click="navigateAuth"
        class="w-24 hidden md:flex items-center justify-center gap-1 text-sm hover:text-primary"
        size="xs"
      >
        <UIcon
          name="i-heroicons-arrow-right-end-on-rectangle-20-solid"
        />Login</ULink
      >

      <ULink
        v-else
        @click="signOut"
        class="hidden md:flex w-24 items-center justify-center gap-1 text-sm hover:text-primary"
        size="xs"
      >
        <Icon name="i-heroicons-arrow-right-start-on-rectangle-20-solid" />
        Sign out
      </ULink>
      <UToggle
        v-model="isDark"
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
const userId = user.value?.id;

const store = await useFetch(`/api/prisma/get-store-by-user-id/${userId}`);


const signOut = () => {
  supabase.auth.signOut();
  user.value = null;

  return navigateTo("/");
};
const navigateAuth = () => {
  return navigateTo("/auth");
};

const colorMode = useColorMode();
const isDark = computed({
  get() {
    return colorMode.value === "dark";
  },
  set() {
    colorMode.preference = colorMode.value === "dark" ? "light" : "dark";
  },
});
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
      label: "Register your Store",
      to: "/register",
    },
  ],
];
const verticalLinks = [...horizontalLinks];
const storeHorizontalLinks = [
  {
    label: 'Home',
    icon: 'i-heroicons-home',
    to: '/',
  },
  {
    label: 'Sales',
    icon: 'i-heroicons-arrow-trending-down',
    to: '/sales',
  },
  {
    label: 'Stores',
    icon: 'i-heroicons-building-storefront',
    to: '/shops',
  },
  {
    label: 'Ending Soon!',
    icon: 'i-heroicons-bolt',
    to: '/ending-soon',
  },
  {
    label: 'My Store',
    icon: "i-heroicons-building-storefront",
    to: '/store',
  },
];

const storeVerticalLinks = [...storeHorizontalLinks];

</script>
