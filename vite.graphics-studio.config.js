import { fileURLToPath } from 'node:url'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import wasm from 'vite-plugin-wasm'
import topLevelAwait from 'vite-plugin-top-level-await'

const studioRoot = fileURLToPath(new URL('./sang-math-graphics-studio', import.meta.url))
const workspaceRoot = fileURLToPath(new URL('.', import.meta.url))

export default defineConfig({
  root: studioRoot,
  plugins: [react(), wasm(), topLevelAwait()],
  resolve: { dedupe: ['react', 'react-dom'] },
  optimizeDeps: {
    exclude: ['@myriaddreamin/typst.ts', '@myriaddreamin/typst-ts-web-compiler', '@myriaddreamin/typst-ts-renderer'],
  },
  server: {
    fs: { allow: [workspaceRoot] },
    headers: { 'Cross-Origin-Opener-Policy': 'same-origin-allow-popups' },
  },
  worker: {
    format: 'es',
    plugins: () => [wasm(), topLevelAwait()],
    rollupOptions: { external: ['wasi_snapshot_preview1'] },
  },
  build: {
    target: 'esnext',
    sourcemap: false,
    outDir: fileURLToPath(new URL('./dist-graphics-studio', import.meta.url)),
    emptyOutDir: true,
    rollupOptions: {
      output: {
        manualChunks(id) {
          if (id.includes('@myriaddreamin')) return 'typst-wasm-runtime'
          if (id.includes('react')) return 'studio-react'
        },
      },
    },
  },
})
