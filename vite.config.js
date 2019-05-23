import elm from "vite-plugin-elm";
import { defineConfig } from "vite";

export default defineConfig({
  root: "src",
  plugins: [elm()],
  build: {
    outDir: "../dist",
  },
});
