import { useEffect, useMemo, useRef, useState } from 'react'

const DEFAULT_COMMANDS = [
  { id: 'export-pdf', label: 'Export PDF', shortcut: '⇧⌘P', icon: '📄', category: 'export' },
  { id: 'export-svg', label: 'Export SVG', shortcut: '', icon: '🎨', category: 'export' },
  { id: 'export-png', label: 'Export PNG', shortcut: '', icon: '🖼️', category: 'export' },
  { id: 'toggle-theme', label: 'Toggle Dark/Light Theme', shortcut: '⌘B', icon: '🌓', category: 'view' },
  { id: 'toggle-minimap', label: 'Toggle Minimap', shortcut: '', icon: '🗺️', category: 'view' },
  { id: 'toggle-wrap', label: 'Toggle Word Wrap', shortcut: '', icon: '↩', category: 'view' },
  { id: 'zoom-in', label: 'Zoom In', shortcut: '⌘=', icon: '🔍+', category: 'view' },
  { id: 'zoom-out', label: 'Zoom Out', shortcut: '⌘-', icon: '🔍−', category: 'view' },
  { id: 'reset-zoom', label: 'Reset Zoom', shortcut: '', icon: '1:1', category: 'view' },
  { id: 'reset-workspace', label: 'Reset Workspace', shortcut: '', icon: '🔄', category: 'project' },
]

export default function CommandPalette({ open, onClose, onCommand, recentProjects }) {
  const [query, setQuery] = useState('')
  const inputRef = useRef(null)

  useEffect(() => {
    if (open) {
      setQuery('')
      setTimeout(() => inputRef.current?.focus(), 50)
    }
  }, [open])

  const commands = useMemo(() => {
    if (!query.trim()) return DEFAULT_COMMANDS
    const q = query.toLowerCase()
    return DEFAULT_COMMANDS.filter(c =>
      c.label.toLowerCase().includes(q) || c.category.toLowerCase().includes(q)
    )
  }, [query])

  useEffect(() => {
    if (!open) return
    function handler(e) {
      if (e.key === 'Escape') { e.preventDefault(); onClose() }
    }
    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [open, onClose])

  if (!open) return null

  return (
    <div
      className="fixed inset-0 z-50 flex items-start justify-center pt-[12vh]"
      onClick={onClose}
    >
      <div className="fixed inset-0 bg-black/40 backdrop-blur-sm" />
      <div
        className="relative w-full max-w-2xl rounded-2xl border border-slate-700/50 bg-slate-900 shadow-2xl shadow-black/50 overflow-hidden"
        onClick={e => e.stopPropagation()}
      >
        <div className="flex items-center gap-3 border-b border-slate-700/50 px-4 py-3">
          <span className="text-slate-500 text-sm">⌘</span>
          <input
            ref={inputRef}
            value={query}
            onChange={e => setQuery(e.target.value)}
            placeholder="Type a command..."
            className="flex-1 bg-transparent text-white text-sm outline-none placeholder:text-slate-500"
          />
          <span className="text-[11px] text-slate-600 font-mono">ESC</span>
        </div>

        <div className="max-h-80 overflow-y-auto p-2">
          {commands.map(cmd => (
            <button
              key={cmd.id}
              onClick={() => { onCommand(cmd.id); onClose() }}
              className="flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-left text-sm text-slate-300 hover:bg-slate-800 hover:text-white transition-colors"
            >
              <span className="text-base w-6 text-center">{cmd.icon}</span>
              <span className="flex-1">{cmd.label}</span>
              {cmd.shortcut && (
                <span className="text-[11px] font-mono text-slate-600">{cmd.shortcut}</span>
              )}
              <span className="text-[11px] text-slate-600 uppercase tracking-wide">{cmd.category}</span>
            </button>
          ))}

          {recentProjects?.length > 0 && (
            <>
              <div className="mt-2 mb-1 px-3 py-1 text-[11px] text-slate-600 uppercase tracking-wider font-semibold">
                Recent Projects
              </div>
              {recentProjects.slice(0, 3).map((p, i) => (
                <button
                  key={i}
                  onClick={() => { onCommand('open-recent', p); onClose() }}
                  className="flex w-full items-center gap-3 rounded-xl px-3 py-2 text-left text-sm text-slate-400 hover:bg-slate-800 hover:text-slate-200 transition-colors"
                >
                  <span className="text-base w-6 text-center">📁</span>
                  <span className="flex-1 truncate">{p.name}</span>
                  <span className="text-[11px] text-slate-600">
                    {new Date(p.openedAt).toLocaleDateString()}
                  </span>
                </button>
              ))}
            </>
          )}
        </div>
      </div>
    </div>
  )
}
