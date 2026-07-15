import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import Editor from '@monaco-editor/react'
import { Group as PanelGroup, Panel, Separator as PanelResizeHandle } from 'react-resizable-panels'
import {
  AUTHORING_SNIPPETS,
  PROJECT_TEMPLATES,
  createProjectFromTemplate,
} from './templates.js'
import {
  SANG_MATH_CATALOG,
  SANG_MATH_CATEGORIES,
  searchSangMathCatalog,
} from './sangMathCatalog.js'
import {
  bootstrapProject,
  createSnapshot,
  deleteProject,
  downloadBlob,
  exportProjectZip,
  getProject,
  importProjectZip,
  listProjects,
  restoreSnapshot,
  saveProject,
} from './projectStore.js'

const TYPST_TS_VERSION = '0.7.0-rc2'
const RENDERER_WASM_URL = `https://cdn.jsdelivr.net/npm/@myriaddreamin/typst-ts-renderer@${TYPST_TS_VERSION}/pkg/typst_ts_renderer_bg.wasm`
const COMPILE_DELAY = 220
const SAVE_DELAY = 700
const MAX_BRIDGE_SOURCE_LENGTH = 500_000

function isTrustedConicOrigin(origin) {
  try {
    const url = new URL(origin)
    const host = url.hostname.toLowerCase()
    return url.protocol === 'https:' && (
      host === 'hdsd-conictypst.pages.dev'
      || host.endsWith('.hdsd-conictypst.pages.dev')
      || host === 'conictypst.com'
      || host.endsWith('.conictypst.com')
    )
  } catch {
    return false
  }
}

function decodeStudioBridge(encoded) {
  const normalized = String(encoded || '').replaceAll('-', '+').replaceAll('_', '/')
  const padding = '='.repeat((4 - (normalized.length % 4)) % 4)
  const binary = atob(normalized + padding)
  const bytes = Uint8Array.from(binary, char => char.charCodeAt(0))
  const payload = JSON.parse(new TextDecoder().decode(bytes))
  const content = String(payload?.content || '')
  if (!content.trim() || content.length > MAX_BRIDGE_SOURCE_LENGTH) throw new Error('Mã Typst trống hoặc vượt giới hạn an toàn.')
  return {
    requestId: String(payload.requestId || `bridge-${Date.now()}`),
    name: String(payload.name || 'Hình CeTZ từ Bảng vẽ').slice(0, 80),
    content,
  }
}

async function saveBridgeProject(payload) {
  const filePath = '/project/cetz-board.typ'
  const next = createProjectFromTemplate('quickstart', payload.name)
  next.files = { [filePath]: { kind: 'text', content: payload.content } }
  next.entryPath = filePath
  next.templateId = 'cetz-bridge'
  return saveProject(next)
}

const EXAM_THEMES = [
  { id: 'teal-pro', name: 'Teal Pro', tone: 'Hiện đại · nhận diện Conic', primary: '#0f9f6d', secondary: '#f28a2e' },
  { id: 'emerald', name: 'Emerald', tone: 'Sang trọng · dịu mắt', primary: '#087f5b', secondary: '#63d6aa' },
  { id: 'jade', name: 'Jade', tone: 'Cẩm thạch · tinh tế', primary: '#2f855a', secondary: '#9fd8b9' },
  { id: 'navy-gold', name: 'Navy Gold', tone: 'Cao cấp · tương phản', primary: '#17345f', secondary: '#d7a43b' },
  { id: 'classic', name: 'Classic', tone: 'Chuẩn đề thi truyền thống', primary: '#166534', secondary: '#93c5a5' },
  { id: 'graphite', name: 'Graphite', tone: 'Tối giản · hợp in trắng đen', primary: '#374151', secondary: '#9ca3af' },
  { id: 'ocean', name: 'Ocean', tone: 'Nhẹ nhàng · học thuật', primary: '#0369a1', secondary: '#38bdf8' },
  { id: 'violet', name: 'Violet', tone: 'Nổi bật · phân hóa tốt', primary: '#6d4cc7', secondary: '#b7a0f4' },
  { id: 'crimson', name: 'Crimson', tone: 'Mạnh mẽ · dứt khoát', primary: '#9f1239', secondary: '#fb7185' },
  { id: 'amber', name: 'Amber', tone: 'Ấm áp · giàu năng lượng', primary: '#b45309', secondary: '#fbbf24' },
  { id: 'aurora', name: 'Aurora', tone: 'Rực rỡ · giàu sắc độ', primary: '#0f766e', secondary: '#a855f7' },
  { id: 'lotus', name: 'Lotus', tone: 'Thanh nhã · mềm mại', primary: '#be185d', secondary: '#f9a8d4' },
]

let rendererPromise = null
const initialTemplateLoads = new Map()

async function getRenderer() {
  if (rendererPromise) return rendererPromise
  rendererPromise = (async () => {
    const { createTypstRenderer } = await import('@myriaddreamin/typst.ts/dist/esm/main.mjs')
    const renderer = createTypstRenderer()
    await renderer.init({ getModule: () => RENDERER_WASM_URL })
    return renderer
  })()
  return rendererPromise
}

function registerTypstLanguage(monaco) {
  const alreadyRegistered = monaco.languages.getLanguages().some(language => language.id === 'typst')
  if (!alreadyRegistered) {
    monaco.languages.register({ id: 'typst', extensions: ['.typ'], aliases: ['Typst'] })
    monaco.languages.setMonarchTokensProvider('typst', {
      keywords: ['let', 'set', 'show', 'import', 'include', 'if', 'else', 'for', 'while', 'break', 'continue', 'return', 'in', 'not', 'and', 'or', 'none', 'auto', 'true', 'false', 'as'],
      builtins: ['align', 'block', 'box', 'circle', 'columns', 'emph', 'figure', 'grid', 'heading', 'image', 'link', 'list', 'outline', 'page', 'pagebreak', 'par', 'place', 'raw', 'rect', 'rotate', 'scale', 'stack', 'strong', 'table', 'text'],
      tokenizer: {
        root: [
          [/^=+\s.*$/, 'keyword.heading'],
          [/\/\/.*$/, 'comment'],
          [/\/\*/, 'comment', '@comment'],
          [/"[^"\\]*(?:\\.[^"\\]*)*"/, 'string'],
          [/#[a-zA-Z_][\w-]*/, { cases: { '@builtins': 'type', '@default': 'variable' } }],
          [/\b(?:let|set|show|import|include|if|else|for|while|break|continue|return|in|not|and|or|none|auto|true|false|as)\b/, 'keyword'],
          [/[0-9]+(?:\.[0-9]+)?(?:pt|mm|cm|em|%)?/, 'number'],
          [/\$[^$]+\$/, 'number'],
          [/\*[^*\n]+\*/, 'strong'],
        ],
        comment: [[/[^/*]+/, 'comment'], [/\*\//, 'comment', '@pop'], [/[/*]/, 'comment']],
      },
    })
    monaco.languages.setLanguageConfiguration('typst', {
      comments: { lineComment: '//', blockComment: ['/*', '*/'] },
      brackets: [['{', '}'], ['[', ']'], ['(', ')']],
      autoClosingPairs: [
        { open: '{', close: '}' }, { open: '[', close: ']' }, { open: '(', close: ')' },
        { open: '"', close: '"' }, { open: '$', close: '$' },
      ],
    })
  }

  if (!monaco.__conicTypstCompletionRegistered) {
    monaco.__conicTypstCompletionRegistered = true
    monaco.languages.registerCompletionItemProvider('typst', {
      triggerCharacters: ['#'],
      provideCompletionItems(model, position) {
        const word = model.getWordUntilPosition(position)
        let startColumn = word.startColumn
        if (startColumn > 1) {
          const prefix = model.getValueInRange({
            startLineNumber: position.lineNumber,
            startColumn: startColumn - 1,
            endLineNumber: position.lineNumber,
            endColumn: startColumn,
          })
          if (prefix === '#') startColumn -= 1
        }
        const range = {
          startLineNumber: position.lineNumber,
          startColumn,
          endLineNumber: position.lineNumber,
          endColumn: word.endColumn,
        }

        return {
          suggestions: SANG_MATH_CATALOG.map((item, index) => ({
            label: item.name,
            filterText: `${item.id} ${item.name} ${item.signature}`,
            kind: monaco.languages.CompletionItemKind.Snippet,
            detail: `Sang Math · ${item.signature}`,
            documentation: { value: `**${item.description}**\n\nChèn snippet từ Sang Math Center.` },
            insertText: item.snippet,
            insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            range,
            sortText: `0-${String(index).padStart(3, '0')}`,
          })),
        }
      },
    })
  }
}

function cloneFilesForWorker(files) {
  return Object.fromEntries(Object.entries(files).map(([path, file]) => [path, file.kind === 'binary'
    ? { ...file, content: new Uint8Array(file.content) }
    : { kind: 'text', content: file.content }]))
}

function getFileName(path) {
  return path.split('/').pop() || path
}

function safeFileName(value) {
  return String(value || 'typst-project').normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/[^a-zA-Z0-9_-]+/g, '-').replace(/^-+|-+$/g, '').toLowerCase() || 'typst-project'
}

function formatTime(timestamp) {
  return new Intl.DateTimeFormat('vi-VN', { hour: '2-digit', minute: '2-digit', day: '2-digit', month: '2-digit' }).format(timestamp)
}

function formatDiagnostic(item) {
  const hints = item.hints?.length ? ` — ${item.hints.join(' · ')}` : ''
  return `${item.message || 'Lỗi Typst'}${hints}`
}

function previewTextNeedles(element) {
  const page = element?.closest('.typst-page')
  if (!page) return []
  const textNodes = [...page.querySelectorAll('.typst-content-text')]
  const targetIndex = textNodes.indexOf(element)
  if (targetIndex < 0) return []

  const candidates = []
  const push = (node, distance) => {
    const text = String(node?.textContent || '').replace(/\s+/g, ' ').trim()
    if (!text || !/[\p{L}\p{N}]/u.test(text)) return
    candidates.push({ text, distance })
    const words = text.match(/[\p{L}\p{N}][\p{L}\p{N}'’.-]*/gu) || []
    if (words.length > 7) candidates.push({ text: words.slice(0, 7).join(' '), distance: distance + 0.25 })
  }

  push(textNodes[targetIndex], 0)
  for (let distance = 1; distance <= 10; distance += 1) {
    push(textNodes[targetIndex - distance], distance)
    push(textNodes[targetIndex + distance], distance)
  }
  return candidates
}

function closestPreviewText(page, clientX, clientY) {
  if (!page) return null
  let closest = null
  let closestDistance = Number.POSITIVE_INFINITY
  for (const node of page.querySelectorAll('.typst-content-text')) {
    const rect = node.getBoundingClientRect()
    if (!rect.width || !rect.height) continue
    const dx = Math.max(rect.left - clientX, 0, clientX - rect.right)
    const dy = Math.max(rect.top - clientY, 0, clientY - rect.bottom)
    const distance = dx * dx + dy * dy
    if (distance < closestDistance) {
      closest = node
      closestDistance = distance
    }
  }
  return closestDistance <= 28 * 28 ? closest : null
}

function findPreviewSource(project, element) {
  const needles = previewTextNeedles(element)
  if (!project || !needles.length) return null
  const paths = Object.keys(project.files || {}).filter(path => project.files[path]?.kind === 'text')
  paths.sort((left, right) => left === project.entryPath ? -1 : right === project.entryPath ? 1 : left.localeCompare(right, 'vi'))
  let best = null

  needles.forEach((needle, needleIndex) => {
    if (needle.text.length < 2) return
    const lowerNeedle = needle.text.toLocaleLowerCase('vi')
    paths.forEach((path, pathIndex) => {
      const source = project.files[path].content
      const lowerSource = source.toLocaleLowerCase('vi')
      let offset = lowerSource.indexOf(lowerNeedle)
      let occurrenceCount = 0
      while (offset >= 0 && occurrenceCount < 80) {
        const windowStart = Math.max(0, offset - 700)
        const windowEnd = Math.min(source.length, offset + lowerNeedle.length + 700)
        const sourceWindow = lowerSource.slice(windowStart, windowEnd)
        let contextScore = 0
        for (const nearby of needles.slice(0, 14)) {
          if (nearby.text.length < 3) continue
          if (sourceWindow.includes(nearby.text.toLocaleLowerCase('vi'))) {
            contextScore += Math.min(nearby.text.length, 42) / (1 + nearby.distance)
          }
        }
        const score = Math.min(needle.text.length, 90) * 2
          + contextScore
          + (needle.distance === 0 ? 120 : 42 / needle.distance)
          - needleIndex * 0.2
          - pathIndex * 0.01
        if (!best || score > best.score) best = { path, offset, score, matchedText: needle.text }
        occurrenceCount += 1
        offset = lowerSource.indexOf(lowerNeedle, offset + Math.max(1, lowerNeedle.length))
      }
    })
  })

  // Math is split into several semantic spans by the renderer (for example a
  // fraction can arrive as separate numerator/denominator text nodes). When a
  // literal match is unavailable, compare normalized source lines with the
  // surrounding rendered text instead of jumping to the first short symbol.
  if (!best) {
    needles.forEach((needle, needleIndex) => {
      const normalizedNeedle = normalizeSearchText(needle.text)
      if (normalizedNeedle.length < 2) return
      paths.forEach((path, pathIndex) => {
        const source = project.files[path].content
        const lines = source.split('\n')
        lines.forEach((lineText, lineIndex) => {
          const normalizedLine = normalizeSearchText(lineText)
          if (!normalizedLine.includes(normalizedNeedle)) return
          const context = normalizeSearchText(lines.slice(Math.max(0, lineIndex - 4), lineIndex + 5).join(' '))
          let contextScore = 0
          for (const nearby of needles.slice(0, 14)) {
            const normalizedNearby = normalizeSearchText(nearby.text)
            if (normalizedNearby.length >= 2 && context.includes(normalizedNearby)) {
              contextScore += Math.min(normalizedNearby.length, 42) / (1 + nearby.distance)
            }
          }
          const score = 70 + Math.min(normalizedNeedle.length, 80) * 1.5
            + contextScore + (needle.distance === 0 ? 50 : 18 / needle.distance)
            - needleIndex * 0.2 - pathIndex * 0.01
          if (!best || score > best.score) {
            const firstToken = needle.text.match(/[\p{L}\p{N}]+/u)?.[0] || ''
            const tokenColumn = firstToken ? lineText.toLocaleLowerCase('vi').indexOf(firstToken.toLocaleLowerCase('vi')) : -1
            best = { path, line: lineIndex + 1, column: tokenColumn + 1 || 1, score, matchedText: needle.text }
          }
        })
      })
    })
  }

  if (!best) return null
  if (best.line) return best
  const source = project.files[best.path].content
  const before = source.slice(0, best.offset)
  const line = before.split('\n').length
  const lastBreak = before.lastIndexOf('\n')
  return { ...best, line, column: best.offset - lastBreak }
}

function normalizeSearchText(value) {
  return String(value || '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLocaleLowerCase('vi')
    .replace(/[^a-z0-9#]+/g, ' ')
    .trim()
}

function compactTypstText(value) {
  return String(value || '')
    .replace(/\$([^$]+)\$/g, '$1')
    .replace(/[#*_`]/g, '')
    .replace(/\\/g, '')
    .replace(/\s+/g, ' ')
    .trim()
}

function buildProjectOutline(project) {
  if (!project) return []
  const counters = { tn: 0, ds: 0, tln: 0, tl: 0 }
  const typeLabels = { tn: 'TN', ds: 'Đ/S', tln: 'TLN', tl: 'TL' }
  const paths = Object.keys(project.files || {}).sort((left, right) => {
    if (left === project.entryPath) return -1
    if (right === project.entryPath) return 1
    return left.localeCompare(right, 'vi')
  })
  const entries = []

  paths.forEach(path => {
    const file = project.files[path]
    if (file?.kind !== 'text') return
    const lines = file.content.split('\n')
    lines.forEach((line, index) => {
      const heading = line.match(/^\s*(=+)\s+(.+)/)
      if (heading) {
        entries.push({ path, line: index + 1, type: 'heading', level: heading[1].length, label: compactTypstText(heading[2]).slice(0, 86) })
        return
      }

      const part = line.match(/^\s*#?exam-part\s*\(\s*\[([^\]]+)/)
      if (part) {
        entries.push({ path, line: index + 1, type: 'part', label: compactTypstText(part[1]).slice(0, 86) })
        return
      }

      const question = line.match(/^\s*#?(tn|ds|tln|tl)\s*\(/)
      if (question) {
        const type = question[1]
        counters[type] += 1
        const nearby = lines.slice(index, index + 4).join(' ')
        const body = nearby.match(/\[([^\]]+)/)?.[1] || 'Nội dung câu hỏi'
        entries.push({
          path,
          line: index + 1,
          type,
          number: counters[type],
          label: compactTypstText(body).slice(0, 82),
          shortType: typeLabels[type],
        })
        return
      }

      const bookSection = line.match(/^\s*#(book-chapter|book-lesson)\s*\(\s*\[([^\]]+)/)
      if (bookSection) entries.push({ path, line: index + 1, type: bookSection[1] === 'book-chapter' ? 'part' : 'heading', level: 2, label: compactTypstText(bookSection[2]).slice(0, 86) })
    })
  })

  return entries
}

function getExamThemeState(project) {
  if (!project) return { path: '', id: '', mode: '' }
  const paths = Object.keys(project.files || {}).sort(path => path === project.entryPath ? -1 : 1)
  for (const path of paths) {
    const file = project.files[path]
    if (file?.kind !== 'text' || !/(exam-preset|exam-theme)/.test(file.content)) continue
    const variable = file.content.match(/^\s*#let\s+theme\s*=\s*"([^"]+)"[^\n]*$/m)
    if (variable) return { path, id: variable[1], mode: 'variable' }
    const preset = file.content.match(/exam-preset\s*\([\s\S]*?\btheme:\s*"([^"]+)"/)
    if (preset) return { path, id: preset[1], mode: 'preset' }
  }
  return { path: '', id: '', mode: '' }
}

function BrandMark() {
  return <span className="studio-brand"><span className="studio-brand__mark">C<span>•</span></span><span><b>TypstConicHub</b><small>Studio</small></span></span>
}

function ProjectDialog({ open, onClose, onCreate }) {
  const [selectedId, setSelectedId] = useState('full-exam')
  const [name, setName] = useState('')
  if (!open) return null
  return (
    <div className="dialog-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="dialog project-dialog" role="dialog" aria-modal="true" aria-labelledby="new-project-title">
        <header><div><span className="dialog-kicker">STUDIO ĐA NĂNG</span><h2 id="new-project-title">Bạn muốn soạn gì hôm nay?</h2></div><button type="button" className="icon-button" onClick={onClose} aria-label="Đóng">×</button></header>
        <div className="project-dialog__hero"><span>05</span><p><b>Bộ 05_full_de_thi_mau là dự án chính</b><small>Giữ nguyên file đề và file dữ liệu; từ cùng nội dung có thể phát triển bản in A4 hoặc trình chiếu.</small></p></div>
        <div className="project-dialog__templates">
          {PROJECT_TEMPLATES.map(template => (
            <button type="button" key={template.id} className={`dialog-template ${template.color} ${selectedId === template.id ? 'is-selected' : ''}`} onClick={() => setSelectedId(template.id)}>
              <span>{template.icon} · {template.kind}</span><b>{template.name}</b><small>{template.description}</small><i>{selectedId === template.id ? '✓' : ''}</i>
            </button>
          ))}
        </div>
        <label className="dialog-field"><span>Tên dự án</span><input value={name} onChange={event => setName(event.target.value)} placeholder={PROJECT_TEMPLATES.find(item => item.id === selectedId)?.name} autoFocus /></label>
        <footer><button type="button" className="studio-button studio-button--quiet" onClick={onClose}>Hủy</button><button type="button" className="studio-button studio-button--primary" onClick={() => onCreate(selectedId, name)}>Tạo và mở dự án</button></footer>
      </section>
    </div>
  )
}

function SnapshotDialog({ project, onClose, onCreate, onRestore }) {
  if (!project) return null
  return (
    <div className="dialog-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="dialog snapshot-dialog" role="dialog" aria-modal="true">
        <header><div><span className="dialog-kicker">LỊCH SỬ CỤC BỘ</span><h2>Các mốc an toàn</h2></div><button type="button" className="icon-button" onClick={onClose} aria-label="Đóng">×</button></header>
        <button className="snapshot-create" type="button" onClick={onCreate}><span>＋</span><b>Tạo snapshot ngay</b><small>Lưu toàn bộ nội dung dự án tại thời điểm này</small></button>
        <div className="snapshot-list">
          {project.snapshots?.length ? project.snapshots.map(snapshot => (
            <button type="button" key={snapshot.id} onClick={() => onRestore(snapshot.id)}><span className="snapshot-dot" /><span><b>{snapshot.label}</b><small>{formatTime(snapshot.createdAt)}</small></span><i>Khôi phục</i></button>
          )) : <div className="empty-list"><b>Chưa có snapshot</b><span>Dự án vẫn đang được tự lưu. Tạo snapshot trước một thay đổi lớn để có thể quay lại.</span></div>}
        </div>
      </section>
    </div>
  )
}

function CatalogDialog({ open, onClose, onInsert }) {
  const [query, setQuery] = useState('')
  const [category, setCategory] = useState('all')
  const results = useMemo(() => searchSangMathCatalog(query, category), [category, query])

  useEffect(() => {
    if (!open) return undefined
    const closeOnEscape = event => { if (event.key === 'Escape') onClose() }
    window.addEventListener('keydown', closeOnEscape)
    return () => window.removeEventListener('keydown', closeOnEscape)
  }, [onClose, open])

  if (!open) return null
  return (
    <div className="dialog-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="dialog catalog-dialog" role="dialog" aria-modal="true" aria-labelledby="catalog-title">
        <header>
          <div><span className="dialog-kicker">SANG MATH CENTER</span><h2 id="catalog-title">Tìm lệnh, hiểu nhanh, chèn ngay</h2></div>
          <button type="button" className="icon-button" onClick={onClose} aria-label="Đóng">×</button>
        </header>
        <div className="catalog-search"><span>⌕</span><input value={query} onChange={event => setQuery(event.target.value)} placeholder="Tìm TN, đúng sai, định lý, bảng biến thiên…" autoFocus /><kbd>{results.length} lệnh</kbd></div>
        <div className="catalog-categories">
          {SANG_MATH_CATEGORIES.map(item => <button type="button" key={item.id} className={category === item.id ? 'is-active' : ''} onClick={() => setCategory(item.id)}>{item.label}</button>)}
        </div>
        <div className="catalog-results">
          {results.map(item => (
            <button type="button" className="catalog-item" key={item.id} onClick={() => { onInsert(item); onClose() }}>
              <span className={`catalog-item__icon ${item.category}`}>{item.name.slice(0, 1)}</span>
              <span><b>{item.name}</b><code>{item.signature}</code><small>{item.description}</small></span>
              <i>Chèn <strong>＋</strong></i>
            </button>
          ))}
          {!results.length && <div className="empty-list"><b>Chưa tìm thấy lệnh phù hợp</b><span>Thử từ khóa ngắn hơn như “TN”, “định lý”, “sách” hoặc “BBT”.</span></div>}
        </div>
        <footer><span className="catalog-tip"><i>i</i> Lệnh được chèn đúng vị trí con trỏ trong tệp đang mở.</span><a className="studio-button studio-button--quiet" href="https://hdsd-conictypst.pages.dev/" target="_blank" rel="noreferrer">Mở HDSD ↗</a></footer>
      </section>
    </div>
  )
}

function ThemeDialog({ open, currentTheme, available, onClose, onApply }) {
  const [selected, setSelected] = useState(currentTheme || 'teal-pro')

  useEffect(() => {
    if (open) setSelected(currentTheme || 'teal-pro')
  }, [currentTheme, open])

  if (!open) return null
  const selectedTheme = EXAM_THEMES.find(item => item.id === selected) || EXAM_THEMES[0]
  return (
    <div className="dialog-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="dialog theme-dialog" role="dialog" aria-modal="true" aria-labelledby="theme-dialog-title">
        <header><div><span className="dialog-kicker">EXAM DESIGNER</span><h2 id="theme-dialog-title">Chọn phong cách cho đề thi</h2></div><button type="button" className="icon-button" onClick={onClose} aria-label="Đóng">×</button></header>
        {available ? <>
          <div className="theme-dialog__intro"><span className="theme-dialog__spark">✦</span><p><b>Đang dùng {currentTheme || 'theme mặc định'}</b><small>Studio chỉ thay cấu hình theme trong mã Typst; nội dung và đáp án được giữ nguyên.</small></p></div>
          <div className="theme-grid">
            {EXAM_THEMES.map(item => <button type="button" key={item.id} className={selected === item.id ? 'is-selected' : ''} style={{ '--theme-primary': item.primary, '--theme-secondary': item.secondary }} onClick={() => setSelected(item.id)}><span className="theme-swatch"><i /><i /><i /></span><span><b>{item.name}</b><small>{item.tone}</small><code>{item.id}</code></span><em>{selected === item.id ? '✓' : ''}</em></button>)}
          </div>
          <footer><span className="catalog-tip"><i>i</i> Preview sẽ tự biên dịch lại sau khi áp dụng.</span><button type="button" className="studio-button studio-button--quiet" onClick={onClose}>Hủy</button><button type="button" className="studio-button studio-button--primary" onClick={() => onApply(selectedTheme)}>Áp dụng {selectedTheme.name}</button></footer>
        </> : <div className="theme-dialog__empty"><span>◇</span><b>Dự án này không dùng Exam Theme</b><p>Exam Designer dành cho mẫu “Đề thi đầy đủ 05” và “Đề thi Sang Math”. Tài liệu Typst thường hoặc mẫu sách vẫn có thể chỉnh màu trực tiếp trong mã.</p><button type="button" className="studio-button studio-button--primary" onClick={onClose}>Đã hiểu</button></div>}
      </section>
    </div>
  )
}

function CommandPalette({ open, onClose, actions }) {
  const [query, setQuery] = useState('')
  const [selectedIndex, setSelectedIndex] = useState(0)
  const filtered = useMemo(() => {
    const needles = normalizeSearchText(query).split(' ').filter(Boolean)
    return actions.filter(action => {
      if (!needles.length) return true
      const haystack = normalizeSearchText(`${action.label} ${action.description || ''} ${action.keywords || ''}`)
      return needles.every(needle => haystack.includes(needle))
    }).slice(0, 18)
  }, [actions, query])

  useEffect(() => {
    if (open) {
      setQuery('')
      setSelectedIndex(0)
    }
  }, [open])

  useEffect(() => setSelectedIndex(0), [query])

  useEffect(() => {
    if (!open) return undefined
    const handleKey = event => {
      if (event.key === 'Escape') onClose()
      if (event.key === 'ArrowDown') {
        event.preventDefault()
        setSelectedIndex(index => Math.min(filtered.length - 1, index + 1))
      }
      if (event.key === 'ArrowUp') {
        event.preventDefault()
        setSelectedIndex(index => Math.max(0, index - 1))
      }
      if (event.key === 'Enter' && filtered[selectedIndex]) {
        event.preventDefault()
        filtered[selectedIndex].run()
        onClose()
      }
    }
    window.addEventListener('keydown', handleKey)
    return () => window.removeEventListener('keydown', handleKey)
  }, [filtered, onClose, open, selectedIndex])

  if (!open) return null
  return (
    <div className="dialog-backdrop command-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="command-palette" role="dialog" aria-modal="true" aria-label="Bảng lệnh">
        <div className="command-search"><span>⌘</span><input value={query} onChange={event => setQuery(event.target.value)} placeholder="Gõ một thao tác hoặc tên lệnh Sang Math…" autoFocus /><kbd>ESC</kbd></div>
        <div className="command-results">
          {filtered.map((action, index) => <button type="button" key={action.id} className={index === selectedIndex ? 'is-first' : ''} onMouseEnter={() => setSelectedIndex(index)} onClick={() => { action.run(); onClose() }}><span>{action.icon || '›'}</span><span><b>{action.label}</b><small>{action.description}</small></span>{action.shortcut && <kbd>{action.shortcut}</kbd>}</button>)}
          {!filtered.length && <div className="empty-list"><b>Không có thao tác phù hợp</b><span>Thử “PDF”, “dự án”, “trắc nghiệm” hoặc “giao diện”.</span></div>}
        </div>
        <footer><span>↑↓ di chuyển</span><span>↵ thực hiện</span><span>ESC đóng</span></footer>
      </section>
    </div>
  )
}

function ProblemsDialog({ open, diagnostics, onClose, onSelect }) {
  if (!open) return null
  return (
    <div className="dialog-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="dialog problems-dialog" role="dialog" aria-modal="true" aria-label="Danh sách vấn đề">
        <header><div><span className="dialog-kicker">KIỂM TRA TÀI LIỆU</span><h2>{diagnostics.length ? `${diagnostics.length} vấn đề cần xử lý` : 'Tài liệu đang sạch lỗi'}</h2></div><button type="button" className="icon-button" onClick={onClose}>×</button></header>
        <div className="problems-list">
          {diagnostics.length ? diagnostics.map((item, index) => <button type="button" key={`${item.message}-${index}`} onClick={() => onSelect(item)}><span className={item.severity === 'warning' ? 'warning' : 'error'}>{item.severity === 'warning' ? '!' : '×'}</span><span><b>{item.message || 'Lỗi Typst'}</b><small>{item.file || 'main.typ'} · dòng {item.start?.line || item.startLine || 1}</small>{item.hints?.map((hint, hintIndex) => <i key={hintIndex}>{hint}</i>)}</span><em>Đi tới →</em></button>) : <div className="problems-success"><span>✓</span><b>Không phát hiện lỗi</b><small>Tài liệu đã biên dịch thành công và sẵn sàng xuất bản.</small></div>}
        </div>
      </section>
    </div>
  )
}

export default function HubStudio({ initialTemplateId, initialBridge, onExit }) {
  const [project, setProject] = useState(null)
  const [projects, setProjects] = useState([])
  const [activeFilePath, setActiveFilePath] = useState('/project/main.typ')
  const [openTabs, setOpenTabs] = useState(['/project/main.typ'])
  const [runtimeStatus, setRuntimeStatus] = useState('loading')
  const [compileStatus, setCompileStatus] = useState('waiting')
  const [diagnostics, setDiagnostics] = useState([])
  const [lastCompileMs, setLastCompileMs] = useState(0)
  const [lastSavedAt, setLastSavedAt] = useState(0)
  const [isDirty, setIsDirty] = useState(false)
  const [zoom, setZoom] = useState(1)
  const [theme, setTheme] = useState(() => window.localStorage.getItem('typst-conic-hub.theme') || 'dark')
  const [sidebarMode, setSidebarMode] = useState('files')
  const [mobilePane, setMobilePane] = useState('editor')
  const [newProjectOpen, setNewProjectOpen] = useState(false)
  const [snapshotOpen, setSnapshotOpen] = useState(false)
  const [catalogOpen, setCatalogOpen] = useState(false)
  const [themeDesignerOpen, setThemeDesignerOpen] = useState(false)
  const [commandOpen, setCommandOpen] = useState(false)
  const [problemsOpen, setProblemsOpen] = useState(false)
  const [projectSearch, setProjectSearch] = useState('')
  const [macroSearch, setMacroSearch] = useState('')
  const [toast, setToast] = useState(null)
  const [editorPosition, setEditorPosition] = useState({ line: 1, column: 1 })

  const workerRef = useRef(null)
  const previewMountRef = useRef(null)
  const editorRef = useRef(null)
  const monacoRef = useRef(null)
  const sourceDecorationRef = useRef(null)
  const compileTimerRef = useRef(null)
  const saveTimerRef = useRef(null)
  const requestIdRef = useRef(0)
  const latestPreviewRequestRef = useRef(0)
  const requestActionsRef = useRef(new Map())
  const workerProjectIdRef = useRef('')
  const lastArtifactRef = useRef(null)
  const renderQueueRef = useRef(Promise.resolve())
  const importInputRef = useRef(null)
  const bridgeImportRef = useRef('')

  const notify = useCallback((message, tone = 'success') => {
    setToast({ message, tone })
    window.setTimeout(() => setToast(current => current?.message === message ? null : current), 3200)
  }, [])

  const refreshProjects = useCallback(async () => setProjects(await listProjects()), [])

  useEffect(() => {
    const acknowledge = (event, requestId, ok, message = '') => {
      event.source?.postMessage({ type: 'conictypst:studio-import-result', requestId, ok, message }, event.origin)
    }

    const handleBridgeImport = async event => {
      const payload = event.data
      if (!isTrustedConicOrigin(event.origin) || payload?.type !== 'conictypst:import-typst') return

      const requestId = String(payload.requestId || '')
      const content = String(payload.content || '')
      if (!requestId || bridgeImportRef.current === requestId) return
      if (!content.trim() || content.length > MAX_BRIDGE_SOURCE_LENGTH) {
        acknowledge(event, requestId, false, 'Mã Typst trống hoặc vượt giới hạn an toàn.')
        return
      }

      bridgeImportRef.current = requestId
      try {
        const filePath = '/project/cetz-board.typ'
        const next = createProjectFromTemplate('quickstart', String(payload.name || 'Hình CeTZ từ Bảng vẽ').slice(0, 80))
        next.files = { [filePath]: { kind: 'text', content } }
        next.entryPath = filePath
        next.templateId = 'cetz-bridge'
        const saved = await saveProject(next)

        setProject(saved)
        setActiveFilePath(filePath)
        setOpenTabs([filePath])
        setIsDirty(false)
        setLastSavedAt(saved.updatedAt)
        setCompileStatus('waiting')
        setDiagnostics([])
        setSidebarMode('files')
        setMobilePane('editor')
        workerProjectIdRef.current = ''
        previewMountRef.current?.replaceChildren()
        lastArtifactRef.current = null
        await refreshProjects()
        acknowledge(event, requestId, true, 'Đã tạo dự án CeTZ trong Studio.')
        notify('Đã nhận hình CeTZ và tạo dự án mới trong Studio')
      } catch (error) {
        bridgeImportRef.current = ''
        acknowledge(event, requestId, false, error.message || 'Không nhập được mã Typst.')
        notify(`Không nhập được mã CeTZ: ${error.message}`, 'error')
      }
    }

    window.addEventListener('message', handleBridgeImport)
    window.opener?.postMessage({ type: 'conictypst:studio-ready' }, '*')
    return () => window.removeEventListener('message', handleBridgeImport)
  }, [notify, refreshProjects])

  useEffect(() => {
    let cancelled = false
    ;(async () => {
      let nextProject
      const bridgeKey = initialBridge ? `bridge-consumed:${initialBridge.slice(0, 96)}` : ''
      const consumeKey = `template-consumed:${window.location.hash}`
      if (initialBridge && !window.sessionStorage.getItem(bridgeKey)) {
        nextProject = await saveBridgeProject(decodeStudioBridge(initialBridge))
        window.sessionStorage.setItem(bridgeKey, '1')
        window.history.replaceState(null, '', '#studio')
      } else if (initialTemplateId && !window.sessionStorage.getItem(consumeKey)) {
        let pending = initialTemplateLoads.get(consumeKey)
        if (!pending) {
          pending = saveProject(createProjectFromTemplate(initialTemplateId))
          initialTemplateLoads.set(consumeKey, pending)
        }
        nextProject = await pending
        window.sessionStorage.setItem(consumeKey, '1')
      } else {
        nextProject = await bootstrapProject()
      }
      if (cancelled) return
      setProject(nextProject)
      setActiveFilePath(nextProject.entryPath)
      setOpenTabs([nextProject.entryPath])
      setLastSavedAt(nextProject.updatedAt)
      setCompileStatus('waiting')
      setDiagnostics([])
      previewMountRef.current?.replaceChildren()
      lastArtifactRef.current = null
      await refreshProjects()
      if (initialBridge) notify('Đã nhận hình CeTZ và tạo dự án mới trong Studio')
    })().catch(error => notify(error.message, 'error'))
    return () => { cancelled = true }
  }, [initialBridge, initialTemplateId, notify, refreshProjects])

  const renderArtifact = useCallback(async artifact => {
    if (!previewMountRef.current) return
    const renderer = await getRenderer()
    const mount = previewMountRef.current
    mount.replaceChildren()
    const session = await renderer.createModule(artifact.slice(0))
    await renderer.renderToCanvas({
      renderSession: session,
      container: mount,
      pixelPerPt: Math.min(3, Math.max(1.8, window.devicePixelRatio * 1.35)),
      backgroundColor: '#ffffff',
      dataSelection: { body: true, semantics: true },
    })
  }, [])

  useEffect(() => {
    const worker = new Worker(new URL('./compiler.worker.js', import.meta.url), { type: 'module' })
    workerRef.current = worker
    worker.onmessage = async event => {
      const message = event.data || {}
      if (message.type === 'ready') {
        setRuntimeStatus('ready')
        return
      }
      if (message.type === 'worker-error') {
        const action = requestActionsRef.current.get(message.requestId)
        requestActionsRef.current.delete(message.requestId)
        if (action?.kind === 'preview' && message.requestId !== latestPreviewRequestRef.current) return
        setCompileStatus('error')
        setDiagnostics([{ severity: 'error', message: message.error?.message || 'Worker Typst gặp lỗi', hints: [] }])
        return
      }
      if (message.type !== 'compile-result') return

      const action = requestActionsRef.current.get(message.requestId)
      requestActionsRef.current.delete(message.requestId)
      if (!action) return

      if (!message.artifact) {
        if (action.kind === 'preview' && message.requestId !== latestPreviewRequestRef.current) return
        setCompileStatus('error')
        setDiagnostics(message.diagnostics?.length ? message.diagnostics : [{ severity: 'error', message: 'Không tạo được tài liệu', hints: [] }])
        return
      }

      if (action.kind === 'pdf') {
        downloadBlob(new Blob([message.artifact], { type: 'application/pdf' }), `${safeFileName(action.projectName)}.pdf`)
        setCompileStatus('ready')
        notify('Đã xuất PDF thành công')
        return
      }

      if (message.requestId !== latestPreviewRequestRef.current) return
      try {
        const renderTask = renderQueueRef.current
          .catch(() => undefined)
          .then(async () => {
            if (message.requestId !== latestPreviewRequestRef.current) return false
            lastArtifactRef.current = message.artifact.slice(0)
            await renderArtifact(message.artifact)
            return message.requestId === latestPreviewRequestRef.current
          })
        renderQueueRef.current = renderTask
        const renderedCurrentRequest = await renderTask
        if (!renderedCurrentRequest) return
        setDiagnostics(message.diagnostics || [])
        setLastCompileMs(message.elapsedMs || 0)
        setCompileStatus('ready')
      } catch (error) {
        setCompileStatus('error')
        setDiagnostics([{ severity: 'error', message: `Không hiển thị được preview: ${error.message}`, hints: [] }])
      }
    }
    worker.onerror = event => {
      setRuntimeStatus('error')
      setCompileStatus('error')
      setDiagnostics([{ severity: 'error', message: event.message || 'Không tải được Typst Worker', hints: [] }])
    }
    worker.postMessage({ type: 'init' })
    return () => {
      worker.terminate()
      workerRef.current = null
    }
  }, [notify, renderArtifact])

  const requestCompile = useCallback((format = 'vector', actionKind = 'preview') => {
    if (!project || !workerRef.current || runtimeStatus !== 'ready') return
    const requestId = ++requestIdRef.current
    const forceReset = workerProjectIdRef.current !== project.id
    workerProjectIdRef.current = project.id
    if (actionKind === 'preview') latestPreviewRequestRef.current = requestId
    requestActionsRef.current.set(requestId, { kind: actionKind, projectName: project.name })
    setCompileStatus('compiling')
    if (actionKind === 'preview') setDiagnostics([])
    workerRef.current.postMessage({
      type: 'compile',
      requestId,
      format,
      files: cloneFilesForWorker(project.files),
      entryPath: project.entryPath,
      forceReset,
    })
  }, [project, runtimeStatus])

  useEffect(() => {
    if (!project || runtimeStatus !== 'ready') return undefined
    if (compileTimerRef.current) window.clearTimeout(compileTimerRef.current)
    compileTimerRef.current = window.setTimeout(() => requestCompile('vector', 'preview'), COMPILE_DELAY)
    return () => window.clearTimeout(compileTimerRef.current)
  }, [project, requestCompile, runtimeStatus])

  useEffect(() => {
    if (!project || !isDirty) return undefined
    if (saveTimerRef.current) window.clearTimeout(saveTimerRef.current)
    saveTimerRef.current = window.setTimeout(async () => {
      try {
        const saved = await saveProject(project)
        setLastSavedAt(saved.updatedAt)
        setIsDirty(false)
        refreshProjects()
      } catch (error) {
        notify(`Không thể tự lưu: ${error.message}`, 'error')
      }
    }, SAVE_DELAY)
    return () => window.clearTimeout(saveTimerRef.current)
  }, [isDirty, notify, project, refreshProjects])

  useEffect(() => {
    const flushBeforeUpdate = event => {
      if (!project) return
      const task = saveProject(project).then(saved => {
        setLastSavedAt(saved.updatedAt)
        setIsDirty(false)
      })
      event.detail?.tasks?.push(task)
    }
    window.addEventListener('conic-flush-save', flushBeforeUpdate)
    return () => window.removeEventListener('conic-flush-save', flushBeforeUpdate)
  }, [project])

  useEffect(() => {
    window.localStorage.setItem('typst-conic-hub.theme', theme)
  }, [theme])

  useEffect(() => {
    const handleKeyDown = event => {
      const modifier = event.metaKey || event.ctrlKey
      if (modifier && event.key.toLowerCase() === 's') {
        event.preventDefault()
        if (project) saveProject(project).then(saved => { setLastSavedAt(saved.updatedAt); setIsDirty(false); notify('Đã lưu dự án') })
      }
      if (modifier && event.key === 'Enter') {
        event.preventDefault()
        requestCompile('vector', 'preview')
      }
      if (modifier && (event.key.toLowerCase() === 'k' || (event.shiftKey && event.key.toLowerCase() === 'p'))) {
        event.preventDefault()
        setCommandOpen(true)
      }
    }
    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
  }, [notify, project, requestCompile])

  useEffect(() => {
    const monaco = monacoRef.current
    if (!monaco || !activeFilePath) return
    const model = monaco.editor.getModel(monaco.Uri.parse(`file://${activeFilePath}`))
    if (!model) return
    const markers = diagnostics
      .filter(item => !item.file || item.file.endsWith(activeFilePath) || activeFilePath.endsWith(item.file))
      .map(item => ({
        severity: item.severity === 'warning' ? monaco.MarkerSeverity.Warning : monaco.MarkerSeverity.Error,
        message: formatDiagnostic(item),
        startLineNumber: Number(item.start?.line || item.startLine || 1),
        startColumn: Number(item.start?.column || item.startColumn || 1),
        endLineNumber: Number(item.end?.line || item.endLine || item.start?.line || 1),
        endColumn: Number(item.end?.column || item.endColumn || 200),
      }))
    monaco.editor.setModelMarkers(model, 'typst-conic-hub', markers)
  }, [activeFilePath, diagnostics])

  const activeFile = project?.files?.[activeFilePath]
  const textFilePaths = useMemo(() => project ? Object.keys(project.files).filter(path => project.files[path].kind === 'text').sort() : [], [project])
  const allFilePaths = useMemo(() => project ? Object.keys(project.files).sort() : [], [project])
  const projectOutline = useMemo(() => buildProjectOutline(project), [project])
  const examThemeState = useMemo(() => getExamThemeState(project), [project])

  const mutateProject = useCallback(updater => {
    setProject(current => {
      if (!current) return current
      const next = typeof updater === 'function' ? updater(current) : updater
      return { ...next, updatedAt: Date.now() }
    })
    setIsDirty(true)
  }, [])

  const updateActiveFile = useCallback(value => {
    if (!activeFilePath) return
    mutateProject(current => ({ ...current, files: { ...current.files, [activeFilePath]: { kind: 'text', content: value ?? '' } } }))
  }, [activeFilePath, mutateProject])

  const openFile = useCallback(path => {
    setActiveFilePath(path)
    setOpenTabs(current => current.includes(path) ? current : [...current, path])
    setMobilePane('editor')
  }, [])

  const closeTab = useCallback((event, path) => {
    event.stopPropagation()
    setOpenTabs(current => {
      if (current.length <= 1) return current
      const next = current.filter(item => item !== path)
      if (activeFilePath === path) setActiveFilePath(next[next.length - 1])
      return next
    })
  }, [activeFilePath])

  const createNewFile = useCallback(() => {
    const requested = window.prompt('Tên tệp mới (ví dụ: cau-hoi.typ)')
    if (!requested) return
    const clean = requested.replace(/^\/+/, '').replace(/\.\.+/g, '.')
    const path = `/project/${clean}`
    if (project.files[path]) { notify('Tên tệp đã tồn tại', 'error'); return }
    mutateProject(current => ({ ...current, files: { ...current.files, [path]: { kind: 'text', content: '// Tệp Typst mới\n' } } }))
    openFile(path)
  }, [mutateProject, notify, openFile, project])

  const renameActiveFile = useCallback(() => {
    if (!project || !activeFilePath) return
    const requested = window.prompt('Tên hoặc đường dẫn mới', activeFilePath.replace(/^\/project\//, ''))
    if (!requested) return
    const nextPath = `/project/${requested.replace(/^\/+/, '')}`
    if (project.files[nextPath] && nextPath !== activeFilePath) { notify('Tên tệp đã tồn tại', 'error'); return }
    mutateProject(current => {
      const files = { ...current.files }
      files[nextPath] = files[activeFilePath]
      delete files[activeFilePath]
      return { ...current, files, entryPath: current.entryPath === activeFilePath ? nextPath : current.entryPath }
    })
    setOpenTabs(current => current.map(path => path === activeFilePath ? nextPath : path))
    setActiveFilePath(nextPath)
  }, [activeFilePath, mutateProject, notify, project])

  const removeActiveFile = useCallback(() => {
    if (!project || !activeFilePath || allFilePaths.length <= 1) return
    if (!window.confirm(`Xóa ${getFileName(activeFilePath)} khỏi dự án?`)) return
    const fallback = textFilePaths.find(path => path !== activeFilePath) || allFilePaths.find(path => path !== activeFilePath)
    mutateProject(current => {
      const files = { ...current.files }
      delete files[activeFilePath]
      return { ...current, files, entryPath: current.entryPath === activeFilePath ? fallback : current.entryPath }
    })
    setOpenTabs(current => [...new Set(current.filter(path => path !== activeFilePath).concat(fallback))])
    setActiveFilePath(fallback)
  }, [activeFilePath, allFilePaths, mutateProject, project, textFilePaths])

  const insertSnippet = useCallback(snippet => {
    const editor = editorRef.current
    if (!editor || activeFile?.kind !== 'text') return
    const selection = editor.getSelection()
    const text = snippet.text ?? snippet.snippet
    if (!text) return
    editor.executeEdits('sang-math-snippet', [{ range: selection, text, forceMoveMarkers: true }])
    editor.focus()
  }, [activeFile])

  const triggerSuggestions = useCallback(() => {
    const editor = editorRef.current
    if (!editor || activeFile?.kind !== 'text') return
    editor.focus()
    editor.trigger('conic-hub', 'editor.action.triggerSuggest', {})
  }, [activeFile])

  const applyExamTheme = useCallback(selectedTheme => {
    if (!examThemeState.path || !selectedTheme) return
    mutateProject(current => {
      const source = current.files[examThemeState.path]?.content || ''
      let content = source
      if (examThemeState.mode === 'variable') {
        content = source.replace(
          /^\s*#let\s+theme\s*=\s*"[^"]+"[^\n]*$/m,
          `#let theme = "${selectedTheme.id}"       // ${selectedTheme.tone}`,
        )
      } else if (examThemeState.mode === 'preset') {
        content = source.replace(
          /(exam-preset\s*\([\s\S]*?\btheme:\s*)"[^"]+"/,
          `$1"${selectedTheme.id}"`,
        )
      }
      return { ...current, files: { ...current.files, [examThemeState.path]: { ...current.files[examThemeState.path], content } } }
    })
    openFile(examThemeState.path)
    setThemeDesignerOpen(false)
    notify(`Đã áp dụng giao diện ${selectedTheme.name}`)
  }, [examThemeState, mutateProject, notify, openFile])

  const projectSearchResults = useMemo(() => {
    const needle = projectSearch.trim().toLocaleLowerCase('vi')
    if (!needle || !project) return []
    const results = []
    for (const [path, file] of Object.entries(project.files)) {
      if (file.kind !== 'text') continue
      file.content.split('\n').forEach((line, index) => {
        if (results.length < 100 && line.toLocaleLowerCase('vi').includes(needle)) {
          results.push({ path, line: index + 1, text: line.trim() || 'Dòng trống' })
        }
      })
    }
    return results
  }, [project, projectSearch])

  const goToLocation = useCallback((path, line = 1, column = 1) => {
    const normalized = path && project?.files[path]
      ? path
      : Object.keys(project?.files || {}).find(item => item.endsWith(String(path || '').replace(/^file:\/\//, ''))) || activeFilePath
    if (normalized) openFile(normalized)
    window.setTimeout(() => {
      const editor = editorRef.current
      if (!editor) return
      editor.setPosition({ lineNumber: Math.max(1, Number(line) || 1), column: Math.max(1, Number(column) || 1) })
      editor.revealPositionInCenter({ lineNumber: Math.max(1, Number(line) || 1), column: Math.max(1, Number(column) || 1) })
      sourceDecorationRef.current?.clear()
      sourceDecorationRef.current = editor.createDecorationsCollection([{
        range: new monacoRef.current.Range(Math.max(1, Number(line) || 1), 1, Math.max(1, Number(line) || 1), 1),
        options: { isWholeLine: true, className: 'source-hit-line', glyphMarginClassName: 'source-hit-glyph' },
      }])
      window.setTimeout(() => sourceDecorationRef.current?.clear(), 1400)
      editor.focus()
    }, 80)
  }, [activeFilePath, openFile, project])

  const handlePreviewSourceClick = useCallback(event => {
    if (event.target.closest('a')) return
    const page = event.target.closest('.typst-page')
    const textElement = event.target.closest('.typst-content-text')
      || closestPreviewText(page, event.clientX, event.clientY)
    if (!textElement) return
    const location = findPreviewSource(project, textElement)
    if (!location) {
      notify('Nội dung này được package sinh tự động nên chưa có vị trí nguồn trực tiếp', 'error')
      return
    }
    event.preventDefault()
    textElement.classList.add('is-source-hit')
    window.setTimeout(() => textElement.classList.remove('is-source-hit'), 900)
    goToLocation(location.path, location.line, location.column)
    notify(`Đã mở ${getFileName(location.path)} · dòng ${location.line}`)
  }, [goToLocation, notify, project])

  const createAndOpenProject = useCallback(async (templateId, name) => {
    const next = await saveProject(createProjectFromTemplate(templateId, name))
    setProject(next)
    setActiveFilePath(next.entryPath)
    setOpenTabs([next.entryPath])
    setIsDirty(false)
    setNewProjectOpen(false)
    setDiagnostics([])
    setCompileStatus('waiting')
    previewMountRef.current?.replaceChildren()
    lastArtifactRef.current = null
    await refreshProjects()
    notify('Đã tạo dự án mới')
  }, [notify, refreshProjects])

  const switchProject = useCallback(async projectId => {
    if (!projectId || projectId === project?.id) return
    if (project && isDirty) await saveProject(project)
    const next = await getProject(projectId)
    if (!next) return
    await saveProject(next)
    setProject(next)
    setActiveFilePath(next.entryPath)
    setOpenTabs([next.entryPath])
    setIsDirty(false)
    setDiagnostics([])
    setCompileStatus('waiting')
    previewMountRef.current?.replaceChildren()
    lastArtifactRef.current = null
  }, [isDirty, project])

  const removeCurrentProject = useCallback(async () => {
    if (!project || projects.length <= 1) { notify('Cần giữ lại ít nhất một dự án', 'error'); return }
    if (!window.confirm(`Xóa dự án “${project.name}”? Thao tác này không thể hoàn tác.`)) return
    await deleteProject(project.id)
    const remaining = (await listProjects()).filter(item => item.id !== project.id)
    setProjects(remaining)
    await switchProject(remaining[0]?.id)
  }, [notify, project, projects.length, switchProject])

  const renameProject = useCallback(() => {
    if (!project) return
    const name = window.prompt('Tên dự án', project.name)
    if (name?.trim()) mutateProject(current => ({ ...current, name: name.trim() }))
  }, [mutateProject, project])

  const handleImport = useCallback(async event => {
    const selectedFiles = [...event.target.files]
    event.target.value = ''
    if (!selectedFiles.length) return
    try {
      if (selectedFiles.length === 1 && selectedFiles[0].name.toLowerCase().endsWith('.zip')) {
        const imported = await saveProject(await importProjectZip(selectedFiles[0]))
        setProject(imported)
        setActiveFilePath(imported.entryPath)
        setOpenTabs([imported.entryPath])
        setIsDirty(false)
        setCompileStatus('waiting')
        setDiagnostics([])
        previewMountRef.current?.replaceChildren()
        lastArtifactRef.current = null
        await refreshProjects()
        notify('Đã nhập dự án ZIP')
        return
      }
      const additions = {}
      for (const file of selectedFiles) {
        const path = `/project/${file.webkitRelativePath || file.name}`
        const isText = /\.(typ|txt|csv|json|toml|md|svg)$/i.test(file.name)
        additions[path] = isText
          ? { kind: 'text', content: await file.text() }
          : { kind: 'binary', content: new Uint8Array(await file.arrayBuffer()), mime: file.type || 'application/octet-stream' }
      }
      mutateProject(current => ({ ...current, files: { ...current.files, ...additions } }))
      const firstText = Object.keys(additions).find(path => additions[path].kind === 'text')
      if (firstText) openFile(firstText)
      notify(`Đã thêm ${selectedFiles.length} tệp`)
    } catch (error) {
      notify(`Không thể nhập: ${error.message}`, 'error')
    }
  }, [mutateProject, notify, openFile, refreshProjects])

  const handleExportZip = useCallback(async () => {
    if (!project) return
    downloadBlob(await exportProjectZip(project), `${safeFileName(project.name)}.zip`)
    notify('Đã đóng gói toàn bộ dự án')
  }, [notify, project])

  const exportSvg = useCallback(async () => {
    if (!lastArtifactRef.current) { notify('Hãy biên dịch thành công trước khi xuất SVG', 'error'); return }
    try {
      const renderer = await getRenderer()
      const svg = await renderer.renderSvg({ artifactContent: lastArtifactRef.current.slice(0), format: 'vector' })
      downloadBlob(new Blob([svg], { type: 'image/svg+xml' }), `${safeFileName(project?.name)}.svg`)
      notify('Đã xuất SVG')
    } catch (error) { notify(error.message, 'error') }
  }, [notify, project])

  const exportPng = useCallback(async () => {
    const canvases = [...(previewMountRef.current?.querySelectorAll('canvas') || [])]
    if (!canvases.length) { notify('Preview chưa có trang để xuất PNG', 'error'); return }
    try {
      if (canvases.length === 1) {
        const blob = await new Promise(resolve => canvases[0].toBlob(resolve, 'image/png'))
        downloadBlob(blob, `${safeFileName(project?.name)}.png`)
      } else {
        const { default: JSZip } = await import('jszip')
        const zip = new JSZip()
        for (let index = 0; index < canvases.length; index += 1) {
          const blob = await new Promise(resolve => canvases[index].toBlob(resolve, 'image/png'))
          zip.file(`page-${index + 1}.png`, blob)
        }
        downloadBlob(await zip.generateAsync({ type: 'blob' }), `${safeFileName(project?.name)}-png.zip`)
      }
      notify(`Đã xuất ${canvases.length} trang PNG`)
    } catch (error) { notify(error.message, 'error') }
  }, [notify, project])

  const makeSnapshot = useCallback(async () => {
    if (!project) return
    const next = createSnapshot(project, `Snapshot ${formatTime(Date.now())}`)
    const saved = await saveProject(next)
    setProject(saved)
    setLastSavedAt(saved.updatedAt)
    setIsDirty(false)
    notify('Đã tạo snapshot an toàn')
  }, [notify, project])

  const restoreProjectSnapshot = useCallback(async snapshotId => {
    if (!project || !window.confirm('Khôi phục snapshot này? Nội dung hiện tại sẽ được thay thế.')) return
    const next = await saveProject(restoreSnapshot(project, snapshotId))
    setProject(next)
    setActiveFilePath(next.entryPath)
    setOpenTabs([next.entryPath])
    setSnapshotOpen(false)
    setIsDirty(false)
    notify('Đã khôi phục snapshot')
  }, [notify, project])

  const commandActions = useMemo(() => [
    { id: 'new-project', icon: '＋', label: 'Tạo dự án mới', description: 'Chọn mẫu đầy đủ, đề thi, sách hoặc BBT.', keywords: 'mẫu template', run: () => setNewProjectOpen(true) },
    { id: 'catalog', icon: 'S', label: 'Mở Trung tâm Sang Math', description: 'Tìm và chèn macro mà không cần nhớ cú pháp.', keywords: 'kho lệnh macro', run: () => setCatalogOpen(true) },
    { id: 'exam-theme', icon: '✦', label: 'Đổi giao diện đề thi', description: 'Chọn theme Sang Math và biên dịch lại ngay.', keywords: 'màu phong cách designer cam xanh', run: () => setThemeDesignerOpen(true) },
    { id: 'outline', icon: '☷', label: 'Mở mục lục tài liệu', description: 'Đi tới phần thi, câu hỏi hoặc tiêu đề.', keywords: 'outline cấu trúc', run: () => setSidebarMode('outline') },
    { id: 'compile', icon: '▶', label: 'Biên dịch lại preview', description: 'Chạy compiler Typst ngay lập tức.', shortcut: '⌘ ↵', run: () => requestCompile('vector', 'preview') },
    { id: 'pdf', icon: '↓', label: 'Xuất tài liệu PDF', description: 'Biên dịch và tải bản PDF chất lượng in.', keywords: 'download tải', run: () => requestCompile('pdf', 'pdf') },
    { id: 'png', icon: '▧', label: 'Xuất các trang PNG', description: 'Xuất một ảnh hoặc ZIP nhiều trang.', run: exportPng },
    { id: 'zip', icon: 'ZIP', label: 'Đóng gói dự án ZIP', description: 'Tải mã nguồn và toàn bộ asset.', run: handleExportZip },
    { id: 'snapshot', icon: '◷', label: 'Tạo snapshot an toàn', description: 'Lưu mốc để có thể quay lại sau.', run: makeSnapshot },
    { id: 'import', icon: '⇧', label: 'Nhập tệp hoặc dự án ZIP', description: 'Thêm mã Typst, dữ liệu và hình ảnh.', run: () => importInputRef.current?.click() },
    { id: 'problems', icon: '✓', label: 'Mở bảng kiểm tra lỗi', description: 'Xem mọi lỗi, gợi ý và đi tới dòng.', run: () => setProblemsOpen(true) },
    { id: 'theme', icon: theme === 'dark' ? '☀' : '☾', label: 'Đổi giao diện sáng / tối', description: 'Chuyển theme của không gian soạn thảo.', run: () => setTheme(value => value === 'dark' ? 'light' : 'dark') },
    { id: 'docs', icon: '?', label: 'Mở Hướng dẫn ConicTypst', description: 'Tra cứu tài liệu đầy đủ trong tab mới.', run: () => window.open('https://hdsd-conictypst.pages.dev/', '_blank', 'noopener') },
    { id: 'drawing', icon: '✎', label: 'Mở Bảng vẽ CeTZ', description: 'Vẽ trực quan rồi chuyển mã trở lại Studio.', run: () => window.open('https://hdsd-conictypst.pages.dev/cetz-ve.html', '_blank', 'noopener') },
    { id: 'account', icon: '👤', label: 'Mở tài khoản ConicTypst', description: 'Xem quyền sử dụng và thời hạn các sản phẩm.', run: () => window.open('https://admin-conictypst.pages.dev/account.html', '_blank', 'noopener') },
    { id: 'mixer', icon: '↝', label: 'Mở Trộn đề', description: 'Đi tới module trộn nhiều mã đề độc lập.', run: () => window.open('https://hdsd-conictypst.pages.dev/tron-de', '_blank', 'noopener') },
    { id: 'omr', icon: '◎', label: 'Mở Chấm bài OMR', description: 'Đi tới module tạo phiếu và chấm bài.', run: () => window.open('https://chamthi-conictypst.pages.dev/', '_blank', 'noopener') },
    ...SANG_MATH_CATALOG.map(item => ({
      id: `macro-${item.id}`,
      icon: '#',
      label: `Chèn: ${item.name}`,
      description: item.description,
      keywords: `${item.category} ${item.signature}`,
      run: () => insertSnippet(item),
    })),
  ], [exportPng, handleExportZip, insertSnippet, makeSnapshot, requestCompile, theme])

  if (!project) {
    return <div className="studio-bootstrap"><BrandMark /><span className="spinner" /><p>Đang mở dự án gần nhất…</p></div>
  }

  const runtimeLabel = runtimeStatus === 'ready' ? 'WASM sẵn sàng' : runtimeStatus === 'error' ? 'WASM lỗi' : 'Đang tải WASM'
  const compileLabel = compileStatus === 'compiling' ? 'Đang biên dịch…' : compileStatus === 'error' ? `${diagnostics.length || 1} vấn đề` : compileStatus === 'ready' ? `${lastCompileMs} ms` : 'Chờ biên dịch'

  return (
    <div className={`hub-studio theme-${theme}`}>
      <input ref={importInputRef} hidden type="file" multiple accept=".zip,.typ,.txt,.csv,.json,.toml,.md,.svg,.png,.jpg,.jpeg,.webp,.gif,.pdf" onChange={handleImport} />
      <header className="studio-header">
        <button type="button" className="studio-header__brand" onClick={onExit} title="Về trang chủ"><BrandMark /></button>
        <div className="studio-header__project">
          <select value={project.id} onChange={event => switchProject(event.target.value)} aria-label="Dự án đang mở">
            {projects.map(item => <option key={item.id} value={item.id}>{item.name}</option>)}
          </select>
          <button type="button" className="icon-button" onClick={renameProject} title="Đổi tên dự án">✎</button>
          <span className={`save-state ${isDirty ? 'is-dirty' : ''}`}><i />{isDirty ? 'Đang tự lưu' : `Đã lưu ${lastSavedAt ? new Intl.DateTimeFormat('vi-VN', { hour: '2-digit', minute: '2-digit' }).format(lastSavedAt) : ''}`}</span>
        </div>
        <nav className="studio-header__nav">
          <a href="https://admin-conictypst.pages.dev/account.html" target="_blank" rel="noreferrer">Tài khoản</a>
          <a href="https://hdsd-conictypst.pages.dev/" target="_blank" rel="noreferrer">Hướng dẫn</a>
          <a href="https://hdsd-conictypst.pages.dev/cetz-ve.html" target="_blank" rel="noreferrer">Vẽ hình ↗</a>
          <a href="https://hdsd-conictypst.pages.dev/tron-de" target="_blank" rel="noreferrer">Trộn đề ↗</a>
          <a href="https://chamthi-conictypst.pages.dev/" target="_blank" rel="noreferrer">OMR ↗</a>
        </nav>
        <div className="studio-header__actions">
          <button type="button" className="studio-button studio-button--templates" onClick={() => setNewProjectOpen(true)}><span>＋</span> Mẫu soạn</button>
          <button type="button" className="studio-button studio-button--accent" onClick={() => setCatalogOpen(true)}><span>S</span> Kho lệnh</button>
          <button type="button" className="studio-button studio-button--theme" onClick={() => setThemeDesignerOpen(true)}><span>✦</span> {examThemeState.id || 'Giao diện'}</button>
          <button type="button" className="studio-button studio-button--quiet" onClick={() => setSnapshotOpen(true)}>Lịch sử</button>
          <button type="button" className="studio-button studio-button--quiet" onClick={handleExportZip}>ZIP</button>
          <div className="export-menu">
            <button type="button" className="studio-button studio-button--primary" onClick={() => requestCompile('pdf', 'pdf')} disabled={compileStatus === 'compiling'}>Xuất PDF <span>↓</span></button>
            <div><button type="button" onClick={exportSvg}>Xuất SVG</button><button type="button" onClick={exportPng}>Xuất PNG</button></div>
          </div>
          <button type="button" className="icon-button theme-toggle" onClick={() => setTheme(value => value === 'dark' ? 'light' : 'dark')} title="Đổi giao diện">{theme === 'dark' ? '☀' : '☾'}</button>
        </div>
      </header>

      <div className="mobile-pane-tabs">
        <button className={mobilePane === 'files' ? 'is-active' : ''} onClick={() => setMobilePane('files')}>Tệp</button>
        <button className={mobilePane === 'editor' ? 'is-active' : ''} onClick={() => setMobilePane('editor')}>Soạn thảo</button>
        <button className={mobilePane === 'preview' ? 'is-active' : ''} onClick={() => setMobilePane('preview')}>Preview</button>
      </div>

      <main className={`studio-workspace mobile-${mobilePane}`}>
        <PanelGroup orientation="horizontal">
          <Panel id="studio-files" defaultSize="17%" minSize="12%" maxSize="28%" className="studio-panel studio-panel--sidebar">
            <aside className="studio-sidebar">
              <div className="activity-rail">
                <button type="button" className={sidebarMode === 'files' ? 'is-active' : ''} onClick={() => setSidebarMode('files')} title="Tệp">▱</button>
                <button type="button" className={sidebarMode === 'search' ? 'is-active' : ''} onClick={() => setSidebarMode('search')} title="Tìm kiếm">⌕</button>
                <button type="button" className={sidebarMode === 'outline' ? 'is-active' : ''} onClick={() => setSidebarMode('outline')} title="Mục lục tài liệu">☷</button>
                <button type="button" className={sidebarMode === 'packages' ? 'is-active' : ''} onClick={() => setSidebarMode('packages')} title="Package">◇</button>
                <span />
                <button type="button" onClick={() => setNewProjectOpen(true)} title="Dự án mới">＋</button>
              </div>
              <div className="sidebar-content">
                {sidebarMode === 'files' && <>
                  <div className="sidebar-heading"><span>DỰ ÁN</span><div><button type="button" onClick={createNewFile} title="Tệp mới">＋</button><button type="button" onClick={() => importInputRef.current?.click()} title="Nhập tệp">⇧</button><button type="button" onClick={renameActiveFile} title="Đổi tên">✎</button><button type="button" onClick={removeActiveFile} title="Xóa">⌫</button></div></div>
                  <div className="file-tree">
                    <div className="folder-row"><span>▾</span><b>{safeFileName(project.name)}</b></div>
                    {allFilePaths.map(path => {
                      const file = project.files[path]
                      const name = path.replace(/^\/project\//, '')
                      const depth = name.split('/').length - 1
                      return <button type="button" key={path} className={`file-row ${activeFilePath === path ? 'is-active' : ''}`} style={{ paddingLeft: `${18 + depth * 12}px` }} onClick={() => openFile(path)}><span className={`file-type ${file.kind === 'binary' ? 'binary' : ''}`}>{file.kind === 'binary' ? 'IMG' : 'T'}</span><span>{name}</span>{project.entryPath === path && <i>entry</i>}</button>
                    })}
                  </div>
                  <button type="button" className="entry-card" onClick={() => openFile(project.entryPath)}><span>ENTRY FILE</span><b>{getFileName(project.entryPath)}</b><small>Được dùng khi biên dịch</small></button>
                </>}
                {sidebarMode === 'search' && <div className="sidebar-tool"><span className="sidebar-heading-simple">TÌM TOÀN DỰ ÁN</span><div className="sidebar-search-input"><span>⌕</span><input value={projectSearch} onChange={event => setProjectSearch(event.target.value)} placeholder="Nhập nội dung cần tìm…" autoFocus /></div>{projectSearch ? <div className="project-search-results"><span>{projectSearchResults.length}{projectSearchResults.length === 100 ? '+' : ''} kết quả</span>{projectSearchResults.map((result, index) => <button type="button" key={`${result.path}-${result.line}-${index}`} onClick={() => goToLocation(result.path, result.line)}><b>{getFileName(result.path)} <i>:{result.line}</i></b><small>{result.text}</small></button>)}{!projectSearchResults.length && <div className="empty-list"><b>Không tìm thấy</b><span>Kiểm tra chính tả hoặc thử một từ khóa ngắn hơn.</span></div>}</div> : <div className="empty-list"><b>Tìm xuyên nhiều tệp</b><span>Kết quả hiển thị theo tệp và dòng; bấm để đi thẳng tới vị trí.</span></div>}</div>}
                {sidebarMode === 'outline' && <div className="sidebar-tool outline-tool"><span className="sidebar-heading-simple">MỤC LỤC TÀI LIỆU</span><div className="outline-summary"><span><b>{projectOutline.filter(item => ['tn', 'ds', 'tln', 'tl'].includes(item.type)).length}</b> câu hỏi</span><span><b>{projectOutline.filter(item => item.type === 'part').length}</b> phần</span></div><div className="outline-list">{projectOutline.map((item, index) => <button type="button" key={`${item.path}-${item.line}-${index}`} className={`outline-item outline-item--${item.type}`} style={item.type === 'heading' ? { paddingLeft: `${6 + (Math.min(3, item.level || 1) - 1) * 7}px` } : undefined} onClick={() => goToLocation(item.path, item.line)}><span>{item.type === 'part' ? '§' : item.type === 'heading' ? 'H' : item.shortType}</span><span><b>{item.shortType ? `${item.shortType} ${String(item.number).padStart(2, '0')}` : item.label}</b>{item.shortType && <small>{item.label}</small>}<i>{getFileName(item.path)}:{item.line}</i></span></button>)}{!projectOutline.length && <div className="empty-list"><b>Chưa có cấu trúc</b><span>Thêm tiêu đề Typst hoặc câu hỏi Sang Math để mục lục tự xuất hiện.</span></div>}</div></div>}
                {sidebarMode === 'packages' && <div className="sidebar-tool"><span className="sidebar-heading-simple">SANG MATH CENTER</span><div className="installed-package"><span>✓</span><div><b>sang-math</b><small>1.0.1 · local built-in</small></div></div><div className="sidebar-search-input macro-search"><span>S</span><input value={macroSearch} onChange={event => setMacroSearch(event.target.value)} placeholder="Tìm macro để chèn…" /></div><div className="sidebar-macro-list">{searchSangMathCatalog(macroSearch).slice(0, 9).map(item => <button type="button" key={item.id} onClick={() => insertSnippet(item)}><span><b>{item.name}</b><small>{item.signature}</small></span><i>＋</i></button>)}</div><button type="button" className="sidebar-catalog-button" onClick={() => setCatalogOpen(true)}>Xem toàn bộ {SANG_MATH_CATALOG.length} lệnh <span>→</span></button><p className="sidebar-note">Package được gắn trực tiếp trong Studio. Import qua <code>/packages/sang-math/lib.typ</code>.</p></div>}
              </div>
            </aside>
          </Panel>

          <PanelResizeHandle className="panel-handle" />

          <Panel id="studio-editor" defaultSize="42%" minSize="25%" className="studio-panel studio-panel--editor">
            <section className="editor-pane">
              <div className="editor-tabs">
                <div className="editor-tabs__scroll">{openTabs.map(path => <button type="button" key={path} className={activeFilePath === path ? 'is-active' : ''} onClick={() => openFile(path)}><span>{project.files[path]?.kind === 'binary' ? '▧' : 'T'}</span>{getFileName(path)}{isDirty && activeFilePath === path && <i>•</i>}<b onClick={event => closeTab(event, path)}>×</b></button>)}</div>
                <button type="button" className="run-button" onClick={() => requestCompile('vector', 'preview')} title="Biên dịch (⌘ Enter)">▶</button>
              </div>
              <div className="breadcrumbs"><span>project</span><i>›</i><b>{activeFilePath.replace(/^\/project\//, '').replaceAll('/', ' › ')}</b></div>
              {activeFile?.kind === 'text' ? <>
                <div className="snippet-bar"><span>SANG MATH</span>{AUTHORING_SNIPPETS.map(snippet => <button type="button" key={snippet.id} onClick={() => insertSnippet(snippet)}>{snippet.label}</button>)}<button type="button" className="snippet-suggest" onClick={triggerSuggestions}>✦ Gợi ý</button><button type="button" className="snippet-more" onClick={() => setCatalogOpen(true)}>＋ Kho lệnh</button></div>
                <div className="monaco-shell">
                  <Editor
                    path={`file://${activeFilePath}`}
                    language="typst"
                    value={activeFile.content}
                    onChange={updateActiveFile}
                    beforeMount={registerTypstLanguage}
                    onMount={(editor, monaco) => {
                      editorRef.current = editor
                      monacoRef.current = monaco
                      editor.onDidChangeCursorPosition(event => setEditorPosition({ line: event.position.lineNumber, column: event.position.column }))
                    }}
                    theme={theme === 'dark' ? 'vs-dark' : 'vs'}
                    options={{
                      automaticLayout: true,
                      fontFamily: '"SFMono-Regular", "Cascadia Code", "Fira Code", Consolas, monospace',
                      fontSize: 13.5,
                      lineHeight: 22,
                      fontLigatures: true,
                      minimap: { enabled: false },
                      glyphMargin: true,
                      scrollBeyondLastLine: false,
                      smoothScrolling: true,
                      cursorSmoothCaretAnimation: 'on',
                      cursorBlinking: 'smooth',
                      wordWrap: 'on',
                      bracketPairColorization: { enabled: true },
                      guides: { bracketPairs: true, indentation: true },
                      padding: { top: 14, bottom: 24 },
                      stickyScroll: { enabled: true },
                      renderWhitespace: 'selection',
                    }}
                  />
                </div>
              </> : <div className="binary-preview">{activeFile?.mime?.startsWith('image/') && <img src={URL.createObjectURL(new Blob([activeFile.content], { type: activeFile.mime }))} alt={getFileName(activeFilePath)} />}<span>ASSET NHỊ PHÂN</span><h3>{getFileName(activeFilePath)}</h3><p>Tệp này được giữ nguyên trong dự án và có thể dùng bằng <code>image("{activeFilePath.replace('/project/', '')}")</code>.</p></div>}
            </section>
          </Panel>

          <PanelResizeHandle className="panel-handle" />

          <Panel id="studio-preview" defaultSize="41%" minSize="25%" className="studio-panel studio-panel--preview">
            <section className="preview-pane">
              <header className="preview-header"><div><b>Live Preview</b><span className={`compile-state state-${compileStatus}`}><i />{compileLabel}</span><span className="preview-source-hint">↗ Bấm nội dung để mở source</span></div><div><button type="button" onClick={() => setZoom(value => Math.max(.45, +(value - .1).toFixed(2)))}>−</button><span>{Math.round(zoom * 100)}%</span><button type="button" onClick={() => setZoom(value => Math.min(2, +(value + .1).toFixed(2)))}>＋</button></div></header>
              <div className="preview-scroll">
                {runtimeStatus !== 'ready' && <div className="preview-loading"><span className="spinner" /><b>{runtimeLabel}</b><small>Lần mở đầu cần tải compiler WASM. Các lần sau sẽ dùng bộ nhớ đệm.</small></div>}
                {compileStatus === 'error' && <div className="preview-error"><span>!</span><div><b>Typst cần bạn kiểm tra</b><p>{diagnostics[0] ? formatDiagnostic(diagnostics[0]) : 'Có lỗi khi biên dịch tài liệu.'}</p><div><button type="button" onClick={() => setProblemsOpen(true)}>Xem tất cả vấn đề</button><button type="button" onClick={() => requestCompile('vector', 'preview')}>Biên dịch lại</button></div></div></div>}
                <div className="preview-scale" style={{ transform: `scale(${zoom})` }}><div ref={previewMountRef} className="preview-mount" onClick={handlePreviewSourceClick} /></div>
              </div>
            </section>
          </Panel>
        </PanelGroup>
      </main>

      <footer className="studio-statusbar">
        <div><span className={`runtime-pill ${runtimeStatus}`}><i />{runtimeLabel}</span><button type="button" onClick={() => setProblemsOpen(true)} className={diagnostics.length ? 'has-problems' : ''}>{diagnostics.length ? `⚠ ${diagnostics.length} vấn đề` : '✓ Không có lỗi'}</button><button type="button" className="command-hint" onClick={() => setCommandOpen(true)}>⌘K Bảng lệnh</button></div>
        <div><span>sang-math 1.0.1 local</span><span>UTF-8</span><span>Typst</span><span>Ln {editorPosition.line}, Col {editorPosition.column}</span></div>
      </footer>

      <ProjectDialog open={newProjectOpen} onClose={() => setNewProjectOpen(false)} onCreate={createAndOpenProject} />
      {snapshotOpen && <SnapshotDialog project={project} onClose={() => setSnapshotOpen(false)} onCreate={makeSnapshot} onRestore={restoreProjectSnapshot} />}
      <CatalogDialog open={catalogOpen} onClose={() => setCatalogOpen(false)} onInsert={insertSnippet} />
      <ThemeDialog open={themeDesignerOpen} currentTheme={examThemeState.id} available={Boolean(examThemeState.path)} onClose={() => setThemeDesignerOpen(false)} onApply={applyExamTheme} />
      <CommandPalette open={commandOpen} onClose={() => setCommandOpen(false)} actions={commandActions} />
      <ProblemsDialog open={problemsOpen} diagnostics={diagnostics} onClose={() => setProblemsOpen(false)} onSelect={item => { setProblemsOpen(false); goToLocation(item.file, item.start?.line || item.startLine, item.start?.column || item.startColumn) }} />
      {toast && <div className={`studio-toast ${toast.tone}`}><span>{toast.tone === 'error' ? '!' : '✓'}</span>{toast.message}</div>}
      <button type="button" className="danger-project-delete" onClick={removeCurrentProject} title="Xóa dự án hiện tại">Xóa dự án</button>
    </div>
  )
}
