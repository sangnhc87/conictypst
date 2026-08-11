import { defineConfig, globalIgnores } from "eslint/config";

export default defineConfig([
  globalIgnores(["dist/**", ".next/**", ".wrangler/**", ".download-packages/**", ".download-zips/**", "node_modules/**"]),
  {
    files: ["functions/**/*.js", "scripts/**/*.mjs", "vite.config.ts"],
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
      globals: {
        btoa: "readonly",
        console: "readonly",
        crypto: "readonly",
        File: "readonly",
        FormData: "readonly",
        Response: "readonly",
        TextEncoder: "readonly",
        URL: "readonly",
        URLSearchParams: "readonly",
      },
    },
    rules: {
      "no-undef": "error",
      "no-unreachable": "error",
      "no-unused-vars": ["warn", { argsIgnorePattern: "^_", varsIgnorePattern: "^_" }],
    },
  },
]);
