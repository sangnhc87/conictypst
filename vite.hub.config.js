import { fileURLToPath } from 'node:url'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import wasm from 'vite-plugin-wasm'
import topLevelAwait from 'vite-plugin-top-level-await'

const hubRoot = fileURLToPath(new URL('./typst-conic-hub', import.meta.url))

export default defineConfig({
  root: hubRoot,
  publicDir: fileURLToPath(new URL('./typst-conic-hub/public', import.meta.url)),
  plugins: [react(), wasm(), topLevelAwait()],
  optimizeDeps: {
    exclude: [
      '@myriaddreamin/typst.ts',
      '@myriaddreamin/typst-ts-web-compiler',
      '@myriaddreamin/typst-ts-renderer',
    ],
  },
  server: {
    fs: { allow: [fileURLToPath(new URL('.', import.meta.url))] },
    headers: {
      'Cross-Origin-Opener-Policy': 'same-origin',
      'Cross-Origin-Embedder-Policy': 'require-corp',
    },
  },
  worker: { format: 'es' },
  build: {
    target: 'esnext',
    sourcemap: false,
    minify: 'esbuild',
    legalComments: 'none',
    outDir: fileURLToPath(new URL('./dist-hub', import.meta.url)),
    emptyOutDir: true,
    rollupOptions: {
      output: {
        banner: '/* ConicTypst © 2026 · Website code may not be copied, redeployed, or resold without permission. */',
        manualChunks(id) {
          if (id.includes('monaco-editor')) return 'hub-monaco'
          if (id.includes('@myriaddreamin')) return 'hub-typst'
          if (id.includes('react')) return 'hub-react'
          if (id.includes('jszip')) return 'hub-zip'
        },
      },
    },
  },
})
