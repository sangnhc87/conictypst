import { fileURLToPath } from 'node:url'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import wasm from 'vite-plugin-wasm'
import topLevelAwait from 'vite-plugin-top-level-await'

const appMode = process.env.VITE_APP_MODE === 'public' ? 'public' : 'private'
const workspaceDataAlias = fileURLToPath(
  new URL(`./src/typstWorkspace.${appMode}.data.js`, import.meta.url),
)

// GitHub Pages: base = /repo-name/   Cloudflare Pages: base = /
// VITE_BASE_PATH được set bởi deploy script hoặc GitHub Actions
const basePath = process.env.VITE_BASE_PATH || '/'

export default defineConfig({
  base: basePath,
  plugins: [react(), wasm(), topLevelAwait()],
  resolve: {
    alias: {
      '@typst-workspace-data': workspaceDataAlias,
    },
  },
  optimizeDeps: {
    exclude: [
      '@myriaddreamin/typst.ts',
      '@myriaddreamin/typst-ts-web-compiler',
      '@myriaddreamin/typst-ts-renderer',
    ],
  },
  server: {
    headers: {
      'Cross-Origin-Opener-Policy': 'same-origin',
      'Cross-Origin-Embedder-Policy': 'require-corp',
    },
  },
  build: {
    target: 'esnext',
    rollupOptions: {
      output: {
        manualChunks(id) {
          if (id.endsWith('.wasm')) return
          if (id.includes('react')) return 'vendor-react'
          if (id.includes('@monaco-editor')) return 'vendor-monaco'
          if (id.includes('@myriaddreamin')) return 'vendor-typst'
        },
      },
    },
  },
})
