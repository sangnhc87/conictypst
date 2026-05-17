import { useEffect, useRef } from 'react'

const SAVE_KEY = 'conictypst.editor.workspace.state'
const DEBOUNCE_MS = 2000
const MAX_SAVE_SIZE = 512 * 1024

export function useAutoSave(activeFilePath, entryPath) {
  const debounceRef = useRef(null)

  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current)
    debounceRef.current = setTimeout(() => {
      try {
        const data = { activeFilePath, entryPath, savedAt: Date.now() }
        const serialized = JSON.stringify(data)
        if (serialized.length < MAX_SAVE_SIZE) {
          window.localStorage.setItem(SAVE_KEY, serialized)
        }
      } catch {
        // localStorage full — silently ignore
      }
    }, DEBOUNCE_MS)
    return () => { if (debounceRef.current) clearTimeout(debounceRef.current) }
  }, [activeFilePath, entryPath])
}
