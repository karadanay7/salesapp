const colors = require("tailwindcss/colors");

/**@type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./components/**/*.{js,vue,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./plugins/**/*.{js,ts}",
    "./nuxt.config.{js,ts}",
    "./content/**/*.{md,yml,json,yaml,toml,csv}",
    "./app.vue",
  ],

  darkMode: "class",
  theme: {
    extend: {
      fontFamily: {
        index: ["Libre Franklin"],
      },
      animation: {
        ping: "ping 2s cubic-bezier(0, 0, 0.6, 0.5)  ",
        spin: "spin 1s linear ",
      },
    },
  },
};
