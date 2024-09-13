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
    "nuxt-lodash",
  ],

  ui: {
    global: true,
  },
  supabase: {
    redirect: false,
  },
  nitro: {
    compressPublicAssets: true,
  },
  css: ["~/assets/style.css"],
});
