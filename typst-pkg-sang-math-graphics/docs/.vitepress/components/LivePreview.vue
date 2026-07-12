<template>
  <div class="live-preview">
    <div class="editor-pane">
      <div class="header">Typst Code</div>
      <textarea v-model="code" spellcheck="false"></textarea>
      <button @click="render" :disabled="loading" class="btn-render">
        {{ loading ? 'Rendering...' : '▶ Render' }}
      </button>
    </div>
    
    <div class="preview-pane">
      <div class="header">Live Preview</div>
      <iframe ref="iframeRef" :src="iframeSrc" width="100%" height="100%" frameborder="0"></iframe>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const props = defineProps({
  code: { type: String, default: '' }
})

const code = ref(props.code)
const loading = ref(false)
const iframeRef = ref(null)

// Use absolute path from root for dev and prod
const iframeSrc = ref('/playground.html')

let isReady = false

onMounted(() => {
  window.addEventListener('message', (event) => {
    if (event.data && event.data.type === 'ready') {
      isReady = true
      render()
    }
  })
})

function render() {
  if (!isReady || !iframeRef.value || !iframeRef.value.contentWindow) return
  loading.value = true
  iframeRef.value.contentWindow.postMessage({ type: 'render', code: code.value }, '*')
  setTimeout(() => { loading.value = false }, 500) // fake loading state, iframe handles real state
}
</script>

<style scoped>
.live-preview {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 0;
  border: 1px solid var(--vp-c-divider);
  border-radius: 10px;
  overflow: hidden;
  margin: 1.2rem 0;
  box-shadow: 0 2px 12px rgba(0,0,0,0.07);
  min-height: 400px;
}

.editor-pane, .preview-pane {
  display: flex;
  flex-direction: column;
  background: var(--vp-c-bg-soft);
}

.editor-pane {
  border-right: 1px solid var(--vp-c-divider);
  background: #1e1e2e;
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.5rem 1rem;
  background: var(--vp-c-bg-mute);
  font-size: 0.9rem;
  font-weight: 600;
  border-bottom: 1px solid var(--vp-c-divider);
}

.editor-pane .header {
  background: #181825;
  border-bottom: 1px solid #313244;
  color: #cdd6f4;
}

textarea {
  flex: 1;
  width: 100%;
  padding: 1rem;
  border: none;
  background: transparent;
  color: #cdd6f4;
  font-family: var(--vp-font-family-mono);
  font-size: 14px;
  resize: vertical;
  outline: none;
  line-height: 1.6;
}

.btn-render {
  margin: 0.5rem;
  padding: 0.5rem 1rem;
  background: var(--vp-c-brand-1);
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
}

.btn-render:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

iframe {
  flex: 1;
  background: white;
}

@media (max-width: 768px) {
  .live-preview {
    grid-template-columns: 1fr;
  }
  .editor-pane {
    border-right: none;
    border-bottom: 1px solid var(--vp-c-divider);
  }
}
</style>
