import { useEffect } from 'react'

function isMonacoFocused() {
  const active = document.activeElement
  if (!active) return false
  return active.closest('.monaco-editor') !== null
}

export function useKeyboardShortcuts({ onSave, onExportPdf, onToggleTheme, onToggleCommandPalette, onZoomIn, onZoomOut }) {
  useEffect(() => {
    function handler(e) {
      const meta = e.metaKey || e.ctrlKey

      if (meta && e.key === 'k') {
        if (isMonacoFocused()) return
        e.preventDefault()
        onToggleCommandPalette?.()
        return
      }

      if (meta && e.key === 's') {
        e.preventDefault()
        onSave?.()
        return
      }

      if (meta && e.key === 'b') {
        if (isMonacoFocused()) return
        e.preventDefault()
        onToggleTheme?.()
        return
      }

      if (meta && e.shiftKey && e.key === 'P') {
        e.preventDefault()
        onExportPdf?.()
        return
      }

      if (meta && (e.key === '=' || e.key === '+')) {
        if (isMonacoFocused()) return
        e.preventDefault()
        onZoomIn?.()
        return
      }

      if (meta && e.key === '-') {
        if (isMonacoFocused()) return
        e.preventDefault()
        onZoomOut?.()
        return
      }
    }

    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [onSave, onExportPdf, onToggleTheme, onToggleCommandPalette, onZoomIn, onZoomOut])
}
