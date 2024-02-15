// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: [
    "@nuxt/image",
    "@nuxt/ui",
    "@nuxtjs/supabase",
    "@nuxtjs/color-mode",
    "@pinia/nuxt",
    "@pinia-plugin-persistedstate/nuxt",
  ],

  ui: {
    global: true,
  },
  supabase: {
    redirect: false,
  },
  css: ["~/assets/style.css"],
});
