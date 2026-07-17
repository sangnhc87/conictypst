import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import wasm from 'vite-plugin-wasm';
import topLevelAwait from 'vite-plugin-top-level-await';

export default defineConfig({
  plugins: [react(), wasm(), topLevelAwait()],
  optimizeDeps: {
    exclude: [
      '@myriaddreamin/typst.ts',
      '@myriaddreamin/typst-ts-web-compiler',
      '@myriaddreamin/typst-ts-renderer',
    ],
  },
  server: {
    fs: { allow: ['..'] },
    headers: {
      'Cross-Origin-Opener-Policy': 'same-origin',
      'Cross-Origin-Embedder-Policy': 'credentialless',
    },
  },
  worker: { format: 'es' },
  build: {
    target: 'esnext',
    sourcemap: false,
  },
});
