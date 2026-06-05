// vite.mixer.config.js
// Build riêng cho trang Trộn Đề — KHÔNG kéo Typst WASM vào
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [tailwindcss(), react()],

  // Entry point riêng
  build: {
    outDir: 'dist-mixer',
    emptyOutDir: true,
    target: 'esnext',
    rollupOptions: {
      input: {
        main: 'mixer.html',
      },
      output: {
        manualChunks(id) {
          if (id.includes('react')) return 'vendor-react'
          if (id.includes('file-saver')) return 'vendor-filesaver'
        },
      },
    },
  },

  // Không cần COEP/COOP headers (chỉ cần cho WASM)
  server: {
    port: 5174,
  },
})
