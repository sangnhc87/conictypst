import { useCallback, useEffect, useState } from 'react'

const STORAGE_KEY = 'conictypst.editor.theme'

export function useTheme() {
  const [theme, setThemeState] = useState(() => {
    if (typeof window === 'undefined') return 'dark'
    return window.localStorage.getItem(STORAGE_KEY) || 'light'
  })

  useEffect(() => {
    window.localStorage.setItem(STORAGE_KEY, theme)
    document.documentElement.setAttribute('data-editor-theme', theme)
  }, [theme])

  const toggleTheme = useCallback(() => {
    setThemeState(t => (t === 'dark' ? 'light' : 'dark'))
  }, [])

  const setTheme = useCallback(t => {
    setThemeState(t)
  }, [])

  return { theme, toggleTheme, setTheme, isDark: theme === 'dark' }
}
