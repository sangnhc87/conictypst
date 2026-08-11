import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import Editor from '@monaco-editor/react'
import { Group as PanelGroup, Panel, Separator as PanelResizeHandle } from 'react-resizable-panels'
import '../monacoSetup.js'
import 'monaco-editor/esm/vs/editor/contrib/comment/browser/comment.js'
import {
  AUTHORING_SNIPPETS,
  PROJECT_TEMPLATES,
  createBeamerSourceFromExam,
  createProjectFromTemplate,
} from './templates.js'
import {
  QUESTIONS_START,
  contextualSnippetText,
  reduceForDocxExport,
} from './questionSource.js'
import {
  SANG_MATH_CATALOG,
  SANG_MATH_CATEGORIES,
  searchSangMathCatalog,
} from './sangMathCatalog.js'
import { MATH_SYMBOL_CATEGORIES } from './mathSymbols.js'
import { EMOJI_CATEGORIES } from './typstEmojis.js'
import {
  SANG_MATH_IMPORT,
  SANG_MATH_UNIVERSE_URL,
  SANG_MATH_VERSION,
  inspectSangMathProject,
  migrateProjectToUniverse,
} from './packagePolicy.js'
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
import {
  signInWithGoogle,
  signOut as firebaseSignOut,
  listenAuthState,
  fetchCloudProjects,
  syncCloudProject,
  downloadCloudProject,
  deleteCloudProject,
  fetchStudioStats,
  identityAuth
} from './firebaseSync.js'

const TYPST_TS_VERSION = '0.8.0-rc3'
const RENDERER_WASM_URL = `https://cdn.jsdelivr.net/npm/@myriaddreamin/typst-ts-renderer@${TYPST_TS_VERSION}/pkg/typst_ts_renderer_bg.wasm`
const COMPILE_DELAY = 220
const SAVE_DELAY = 700
const MAX_BRIDGE_SOURCE_LENGTH = 500_000
const DEFAULT_CLOUD_LIMIT_BYTES = 50 * 1024 * 1024

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
const typstCompletionRegistrations = new WeakSet()

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
  }

  // Luôn gắn lại cấu hình: HMR hoặc một module khác có thể đã đăng ký `typst`
  // trước Studio, khiến nhánh khởi tạo ở trên bị bỏ qua và Monaco mất lệnh comment.
  monaco.languages.setLanguageConfiguration('typst', {
    comments: { lineComment: '//', blockComment: ['/*', '*/'] },
    brackets: [['{', '}'], ['[', ']'], ['(', ')']],
    autoClosingPairs: [
      { open: '{', close: '}' }, { open: '[', close: ']' }, { open: '(', close: ')' },
      { open: '"', close: '"' }, { open: '$', close: '$' },
    ],
  })

  if (!typstCompletionRegistrations.has(monaco)) {
    typstCompletionRegistrations.add(monaco)
    monaco.languages.registerCompletionItemProvider('typst', {
      triggerCharacters: ['#'],
      provideCompletionItems(model, position) {
        const word = model.getWordUntilPosition(position)
        const lineBeforeCursor = model.getLineContent(position.lineNumber).slice(0, position.column - 1)
        const commandMatch = lineBeforeCursor.match(/#([a-zA-Z][\w-]*)$/)
        const typedCommand = String(commandMatch?.[1] || word.word || '').toLowerCase()
        const source = model.getValue()
        const offset = model.getOffsetAt(position)
        let startColumn = commandMatch ? position.column - commandMatch[0].length : word.startColumn
        if (!commandMatch && startColumn > 1) {
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
          suggestions: SANG_MATH_CATALOG.map((item, index) => {
            const directQuestion = ['tn', 'ds', 'tln', 'tl'].includes(item.id)
            const commonPriority = { tn: '00', ds: '01', tln: '02', tl: '03', 'exam-part': '04' }[item.id]
            return {
              label: directQuestion ? { label: `#${item.id}`, description: item.name } : item.name,
              filterText: `${item.signature} ${item.id} ${item.name}`,
              kind: monaco.languages.CompletionItemKind.Snippet,
              detail: `Sang Math · ${item.signature}`,
              documentation: { value: `**${item.description}**\n\nCú pháp được chèn theo đúng ngữ cảnh của tệp hiện tại.` },
              insertText: contextualSnippetText(item, source, offset),
              insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
              range,
              preselect: item.id === typedCommand,
              sortText: item.id === typedCommand ? '0-exact' : commonPriority ? `1-${commonPriority}` : `2-${String(index).padStart(3, '0')}`,
            }
          }),
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

function withTimeout(promise, timeoutMs, message) {
  let timeoutId
  const timeout = new Promise((_, reject) => {
    timeoutId = window.setTimeout(() => reject(new Error(message)), timeoutMs)
  })
  return Promise.race([promise, timeout]).finally(() => window.clearTimeout(timeoutId))
}

function formatTime(timestamp) {
  return new Intl.DateTimeFormat('vi-VN', { hour: '2-digit', minute: '2-digit', day: '2-digit', month: '2-digit' }).format(timestamp)
}

function formatBytes(value = 0) {
  if (!Number.isFinite(value) || value <= 0) return '0 MB'
  if (value < 1024 ** 2) return `${Math.max(1, Math.round(value / 1024))} KB`
  return `${(value / 1024 ** 2).toFixed(value < 10 * 1024 ** 2 ? 1 : 0)} MB`
}

function formatDiagnostic(item) {
  const hints = item.hints?.length ? ` — ${item.hints.join(' · ')}` : ''
  const message = item.message || 'Lỗi Typst'
  const delimiterHelp = /unclosed delimiter|expected closing delimiter/i.test(message)
    ? ' — Gợi ý: không viết [$]. Hãy dùng [$A$] hoặc [] và kiểm tra đủ cặp (), [] và $...$.'
    : ''
  return `${message}${hints}${delimiterHelp}`
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
        <div className="project-dialog__hero"><span>05</span><p><b>Soạn trực tiếp #tn · #ds · #tln · #tl</b><small>Mẫu chính không còn make-questions. Từ cùng vùng câu hỏi, Studio có thể tạo ngay bản in A4 hoặc Beamer 16:9.</small></p></div>
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

function ProblemsDialog({ open, diagnostics, onClose, onSelect, onAiFix }) {
  if (!open) return null
  return (
    <div className="dialog-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="dialog problems-dialog" role="dialog" aria-modal="true" aria-label="Danh sách vấn đề">
        <header><div><span className="dialog-kicker">KIỂM TRA TÀI LIỆU</span><h2>{diagnostics.length ? `${diagnostics.length} vấn đề cần xử lý` : 'Tài liệu đang sạch lỗi'}</h2></div><button type="button" className="icon-button" onClick={onClose}>×</button></header>
        <div className="problems-list">
          {diagnostics.length ? diagnostics.map((item, index) => (
            <button type="button" key={`${item.message}-${index}`} onClick={() => onSelect(item)}>
              <span className={item.severity === 'warning' ? 'warning' : 'error'}>{item.severity === 'warning' ? '!' : '×'}</span>
              <span>
                <b>{item.message || 'Lỗi Typst'}</b>
                <small>{item.file || 'main.typ'} · dòng {item.start?.line || item.startLine || 1}</small>
                {item.hints?.map((hint, hintIndex) => <i key={hintIndex}>{hint}</i>)}
                <span style={{ display: 'block', marginTop: '6px' }} onClick={(e) => { e.stopPropagation(); onAiFix(item); }}>
                  <span style={{ background: '#3b82f6', color: '#fff', padding: '3px 8px', borderRadius: '4px', fontSize: '9.5px', fontWeight: 'bold', display: 'inline-block' }}>
                    ✦ Sửa bằng AI
                  </span>
                </span>
              </span>
              <em>Đi tới →</em>
            </button>
          )) : <div className="problems-success"><span>✓</span><b>Không phát hiện lỗi</b><small>Tài liệu đã biên dịch thành công và sẵn sàng xuất bản.</small></div>}
        </div>
      </section>
    </div>
  )
}

function AiQuickFixDialog({ open, diagnostic, project, activeFilePath, onClose, onApply }) {
  const [apiKey, setApiKey] = useState(() => window.localStorage.getItem('gemini_api_key') || '')
  const [status, setStatus] = useState('idle')
  const [explanation, setExplanation] = useState('')
  const [fixedLine, setFixedLine] = useState('')
  const [originalLine, setOriginalLine] = useState('')
  const [errorMsg, setErrorMsg] = useState('')
  const [lineNum, setLineNum] = useState(1)
  const [fixedLineNum, setFixedLineNum] = useState(1)

  const runFix = useCallback(async (keyToUse) => {
    if (!keyToUse || !keyToUse.trim()) return
    setStatus('loading')
    setErrorMsg('')

    try {
      const path = diagnostic.file || activeFilePath
      const file = project.files[path]
      const line = Number(diagnostic.start?.line || diagnostic.startLine || 1)

      let fullFileContent = ''
      if (file && file.kind === 'text') {
        const lines = file.content.split('\n')
        fullFileContent = lines.map((text, i) => `${i + 1}: ${text}`).join('\n')
      }

      const prompt = `Bạn là chuyên gia về cú pháp Typst và package 'sang-math' (phục vụ soạn đề thi Toán). Bạn có nhiệm vụ phân tích và sửa lỗi biên dịch Typst cho giáo viên.
Dưới đây là thông tin lỗi:
- Tệp tin: ${path}
- Dòng báo lỗi của trình biên dịch: Dòng ${line}
- Lỗi từ Typst: ${diagnostic.message}
- Gợi ý của Typst: ${diagnostic.hints?.join(', ') || 'Không có'}

Mã nguồn đầy đủ của tệp tin (có kèm số dòng):
\`\`\`typst
${fullFileContent}
\`\`\`

LƯU Ý QUAN TRỌNG VỀ TYPST VÀ SANG-MATH:
1. Môi trường toán: Công thức toán luôn nằm trong cặp '$ ... $'. Việc quên đóng '$' hoặc dư thừa '$' sẽ làm Typst hiểu nhầm phần văn bản phía sau là toán học. Nếu thấy lỗi "expected ...", khả năng cao là thiếu dấu '$' ở đoạn trước đó.
2. Hàm của sang-math: Các hàm cấu trúc như '#tn[...]', '#ds[...]', '#tln[...]', '#bai[...]', '#loigiai[...]' bắt buộc phải đóng mở ngoặc vuông '[' và ']' hợp lệ. Tuyệt đối không xóa dấu ngoặc vuông chứa nội dung câu hỏi.
3. Nguyên tắc sửa lỗi: KHÔNG TỰ Ý viết lại nội dung, không đổi cấu trúc hàm gốc. Chỉ tập trung thêm/bớt dấu '$', '[', ']', '{', '}' bị thiếu hoặc dư thừa để cú pháp không bị lỗi biên dịch.
4. Vị trí lỗi: Dòng mà Typst báo lỗi (dòng ${line}) có thể CHỈ LÀ HỆ QUẢ của việc thiếu đóng ngoặc hoặc đóng '$' ở các dòng bên trên. Hãy đếm thật kỹ số lượng mở/đóng ngoặc/dấu '$' và trả về ĐÚNG dòng gốc gây ra lỗi.

Yêu cầu: Trả về câu trả lời duy nhất dưới dạng JSON hợp lệ (không có khối \`\`\`json) với cấu trúc sau:
{
  "fixedLineNumber": <Số dòng gốc chứa lỗi, ví dụ: 10>,
  "explanation": "Giải thích lỗi (1 câu)",
  "fixedLineContent": "Nội dung của dòng trên sau khi sửa đúng dấu/cú pháp"
}`

      const res = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash:generateContent?key=${keyToUse.trim()}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ contents: [{ parts: [{ text: prompt }] }] })
      })

      if (!res.ok) {
        throw new Error(`Google API trả về lỗi HTTP ${res.status}`)
      }

      const data = await res.json()
      if (data.error) throw new Error(data.error.message)

      const textOutput = data.candidates?.[0]?.content?.parts?.[0]?.text || ''
      const cleaned = textOutput.replace(/^```json\s*/i, '').replace(/```\s*$/i, '').trim()
      
      const parsed = JSON.parse(cleaned)
      const targetLineNum = Number(parsed.fixedLineNumber || line)
      if (parsed.fixedLineContent === undefined) throw new Error('Không nhận được mã sửa lỗi từ AI')

      setFixedLineNum(targetLineNum)
      setExplanation(parsed.explanation || 'Đã sửa lỗi cú pháp Typst.')
      setFixedLine(parsed.fixedLineContent)
      
      if (file && file.kind === 'text') {
        const lines = file.content.split('\n')
        setOriginalLine(lines[targetLineNum - 1] || '')
      }
      
      setStatus('success')
    } catch (e) {
      console.error(e)
      setStatus('error')
      setErrorMsg(`Lỗi sửa bài: ${e.message}. Hãy kiểm tra lại API Key hoặc cấu trúc code.`)
    }
  }, [diagnostic, project, activeFilePath])

  useEffect(() => {
    if (!open || !diagnostic || !project) {
      setStatus('idle')
      setErrorMsg('')
      setExplanation('')
      setFixedLine('')
      return
    }

    const path = diagnostic.file || activeFilePath
    const file = project.files[path]
    const line = Number(diagnostic.start?.line || diagnostic.startLine || 1)
    setLineNum(line)
    setFixedLineNum(line)

    if (file && file.kind === 'text') {
      const lines = file.content.split('\n')
      setOriginalLine(lines[line - 1] || '')
    } else {
      setOriginalLine('')
    }
    setStatus('idle')
    setErrorMsg('')

    const savedKey = window.localStorage.getItem('gemini_api_key') || ''
    if (savedKey.trim()) {
      runFix(savedKey)
    }
  }, [open, diagnostic, project, activeFilePath, runFix])

  const handleStartFix = () => {
    if (!apiKey.trim()) return setErrorMsg('Vui lòng nhập Gemini API Key')
    window.localStorage.setItem('gemini_api_key', apiKey.trim())
    runFix(apiKey)
  }

  if (!open) return null
  return (
    <div className="dialog-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="dialog ai-quickfix-dialog" role="dialog" aria-modal="true" style={{ maxWidth: '560px' }}>
        <header>
          <div>
            <span className="dialog-kicker">✦ TRỢ LÝ AI SỬA LỖI (LITE)</span>
            <h2>Sửa lỗi nhanh {fixedLineNum !== lineNum ? `dòng ${fixedLineNum} (phát hiện lỗi gốc)` : `dòng ${lineNum}`}</h2>
          </div>
          <button type="button" className="icon-button" onClick={onClose}>×</button>
        </header>
        
        <div className="ai-dialog-body" style={{ padding: '0 24px 20px', fontSize: '13.5px' }}>
          <div className="diagnostic-summary" style={{ background: '#fff5f5', color: '#c53030', padding: '10px 14px', borderRadius: '6px', marginBottom: '14px', borderLeft: '4px solid #f56565' }}>
            <strong>Thông báo lỗi:</strong> {diagnostic?.message || 'Có lỗi khi biên dịch tài liệu.'}
          </div>

          <label className="dialog-field" style={{ marginBottom: '16px' }}>
            <span style={{ fontWeight: 'bold' }}>Gemini API Key</span>
            <input type="password" value={apiKey} onChange={e => setApiKey(e.target.value)} placeholder="AIzaSy..." disabled={status === 'loading'} />
          </label>

          {status === 'idle' && (
            <p style={{ color: '#666' }}>Trợ lý AI sẽ đọc và phân tích toàn bộ mã nguồn tệp tin để đề xuất bản vá tối ưu nhất cho bạn.</p>
          )}

          {status === 'loading' && (
            <div style={{ textAlign: 'center', padding: '20px 0' }}>
              <div className="spinner" style={{ margin: '0 auto 10px' }} />
              <p style={{ marginTop: '8px', color: '#666' }}>AI đang rà soát toàn bộ tệp tin và phân tích cấu trúc để tìm lỗi...</p>
            </div>
          )}

          {status === 'error' && (
            <div className="preview-error" style={{ padding: '12px', marginBottom: '0' }}>{errorMsg}</div>
          )}

          {status === 'success' && (
            <div className="quickfix-comparison" style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
              <div style={{ background: '#f0fdf4', color: '#15803d', padding: '10px 12px', borderRadius: '6px', borderLeft: '4px solid #22c55e' }}>
                <strong>Giải thích từ AI:</strong> {explanation}
              </div>
              
              <div className="diff-view" style={{ fontFamily: 'monospace', fontSize: '12.5px', background: '#1e1e1e', color: '#fff', borderRadius: '6px', overflow: 'hidden' }}>
                <div style={{ padding: '4px 10px', background: '#333', fontSize: '11px', color: '#aaa', textTransform: 'uppercase' }}>So sánh thay đổi dòng {fixedLineNum}</div>
                <div style={{ padding: '10px', display: 'flex', flexDirection: 'column', gap: '4px' }}>
                  <div style={{ color: '#ef4444', textDecoration: 'line-through', whiteSpace: 'pre-wrap' }}>
                    - {originalLine || '(dòng trống)'}
                  </div>
                  <div style={{ color: '#22c55e', whiteSpace: 'pre-wrap' }}>
                    + {fixedLine}
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>

        <footer>
          <button type="button" className="studio-button studio-button--quiet" onClick={onClose} disabled={status === 'loading'}>Hủy</button>
          
          {status !== 'success' ? (
            <button type="button" className="studio-button studio-button--primary" onClick={handleStartFix} disabled={status === 'loading'}>
              Bắt đầu phân tích lỗi
            </button>
          ) : (
            <button type="button" className="studio-button studio-button--primary" onClick={() => { onApply(fixedLineNum, fixedLine); onClose() }}>
              Áp dụng sửa lỗi
            </button>
          )}
        </footer>
      </section>
    </div>
  )
}

function UpgradeDialog({ open, onClose, onUpgrade, onLogin, currentUser, authLoading, isPro }) {
  const [stats, setStats] = useState(null);
  useEffect(() => {
    // Chỉ lấy số liệu THẬT khi hộp mở; lỗi thì ẩn (fetchStudioStats trả null).
    if (!open) return;
    let alive = true;
    fetchStudioStats().then(s => { if (alive) setStats(s); });
    return () => { alive = false; };
  }, [open]);
  if (!open) return null;
  const needsLogin = !currentUser;
  return (
    <div className="dialog-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="dialog upgrade-dialog" role="dialog" aria-modal="true" style={{ maxWidth: '460px' }}>
        <header>
          <div>
            <span className="dialog-kicker">{needsLogin ? 'G · TÀI KHOẢN TYPSTCONICHUB' : '✦ NÂNG CẤP TYPSTCONICHUB PRO'}</span>
            <h2>{needsLogin ? 'Đăng nhập để kiểm tra quyền' : isPro ? 'Tài khoản đã có quyền Pro' : 'Mở khóa TypstConicHub Pro'}</h2>
          </div>
          <button type="button" className="icon-button" onClick={onClose}>×</button>
        </header>
        
        <div style={{ padding: '20px 24px', fontSize: '13px', lineHeight: '1.6', color: 'var(--studio-text)' }}>
          {needsLogin ? <>
            <p style={{ margin: '0 0 14px 0', opacity: 0.9 }}>Đăng nhập Google một lần để hệ thống nhận đúng quyền đã mua và mở tính năng Xuất Word. Việc đăng nhập không tự đưa tài liệu local của bạn lên Cloud.</p>
            <div style={{ background: 'rgba(16,185,129,0.08)', border: '1px solid rgba(16,185,129,0.22)', borderRadius: '8px', padding: '12px 16px', marginBottom: '12px' }}>
              <b style={{ color: 'var(--studio-green)' }}>Tài khoản quản trị được mở toàn bộ miễn phí.</b>
              <p style={{ margin: '7px 0 0', fontSize: '12px', opacity: 0.8 }}>Hệ thống tự nhận diện quyền quản trị sau khi bạn đăng nhập đúng tài khoản Google.</p>
            </div>
          </> : <>
          <p style={{ margin: '0 0 14px 0', opacity: 0.9 }}>{isPro ? `Đã xác nhận quyền Pro cho ${currentUser.email || 'tài khoản này'}. Bạn có thể đóng hộp và xuất Word ngay.` : 'Studio Free vẫn soạn, biên dịch và lưu dự án ngay trên thiết bị. Pro dành cho giáo viên muốn bớt thao tác kỹ thuật: xuất Word thật ngay trên web và tiếp tục công việc trên nhiều máy.'}</p>
          
          <div style={{ background: 'rgba(249,115,22,0.06)', border: '1px solid rgba(249,115,22,0.15)', borderRadius: '8px', padding: '12px 16px', marginBottom: '20px' }}>
            <h4 style={{ margin: '0 0 8px 0', color: 'var(--studio-orange)', fontSize: '13.5px' }}>Quyền lợi gói TypstConicHub PRO:</h4>
            <ul style={{ margin: 0, paddingLeft: '20px', display: 'flex', flexDirection: 'column', gap: '6px', fontSize: '12px', opacity: 0.95 }}>
              <li><b>Word thật, không phải ảnh chụp trang:</b> Văn bản sửa được, công thức thành Word Equation; chỉ riêng CeTZ/BBT được kết xuất thành ảnh sắc nét.</li>
              <li><b>Soạn thảo đa thiết bị:</b> Soạn bài ở trường trên máy tính, về nhà mở laptop tiếp tục soạn dở tức thì.</li>
              <li><b>Gắn theo Gmail:</b> Đúng tài khoản, đúng thời hạn; tài khoản quản trị được miễn phí toàn bộ.</li>
            </ul>
          </div>
          
          {!isPro && stats && stats.teachers >= 5 && (
            <div style={{ display: 'flex', gap: '18px', flexWrap: 'wrap', margin: '0 0 16px 0', padding: '12px 16px', background: 'rgba(16,185,129,0.06)', border: '1px solid rgba(16,185,129,0.18)', borderRadius: '8px' }}>
              <div><b style={{ color: 'var(--studio-green)', fontSize: '17px' }}>{stats.teachers.toLocaleString('vi-VN')}</b><span style={{ fontSize: '11.5px', opacity: 0.8, marginLeft: '5px' }}>giáo viên đang dùng</span></div>
              {stats.projects >= 10 && <div><b style={{ color: 'var(--studio-green)', fontSize: '17px' }}>{stats.projects.toLocaleString('vi-VN')}</b><span style={{ fontSize: '11.5px', opacity: 0.8, marginLeft: '5px' }}>tài liệu đã soạn</span></div>}
            </div>
          )}
          {!isPro && <p style={{ margin: 0, fontSize: '12.5px', opacity: 0.85 }}>Chọn gói 1, 2 hoặc 5 năm; SePay xác nhận chuyển khoản và cấp quyền tự động theo đúng Gmail. Bạn vẫn có thể dùng bản local miễn phí trước khi quyết định.</p>}
          </>}
        </div>

        <footer>
          <button type="button" className="studio-button studio-button--quiet" onClick={onClose}>Đóng</button>
          {needsLogin ? <button
            type="button"
            className="studio-button studio-button--primary studio-google-login"
            onClick={onLogin}
            disabled={authLoading}
          >
            <span>G</span> {authLoading ? 'Đang kiểm tra tài khoản…' : 'Đăng nhập bằng Google'}
          </button> : isPro ? <button type="button" className="studio-button studio-button--primary" onClick={onClose}>Xuất Word ngay</button> : <button
            type="button"
            className="studio-button studio-button--primary"
            style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', textDecoration: 'none', height: '32px', boxSizing: 'border-box' }}
            onClick={() => { onClose(); onUpgrade?.() }}
          >
            Chọn gói & thanh toán tự động ➔
          </button>}
        </footer>
      </section>
    </div>
  );
}

function ProHonorDialog({ open, onClose, onCloud }) {
  if (!open) return null
  return (
    <div className="dialog-backdrop pro-honor-backdrop" role="presentation" onMouseDown={event => { if (event.target === event.currentTarget) onClose() }}>
      <section className="pro-honor-dialog" role="dialog" aria-modal="true" aria-labelledby="pro-honor-title">
        <button type="button" className="pro-honor-close" onClick={onClose} aria-label="Đóng">×</button>
        <div className="pro-honor-ribbon">♛ STUDIO PRO</div>
        <div className="pro-honor-medallion" aria-hidden="true">✦</div>
        <p className="pro-honor-kicker">KHÔNG GIAN ĐÃ ĐƯỢC MỞ KHÓA</p>
        <h2 id="pro-honor-title">Cảm ơn bạn đã đồng hành cùng TypstConicHub</h2>
        <p className="pro-honor-lead">Bạn đang dùng bộ công cụ dành cho giáo viên muốn làm nhanh hơn, đẹp hơn và giữ trọn quyền kiểm soát tài liệu.</p>
        <div className="pro-honor-benefits">
          <div><span>W</span><b>Word thật</b><small>Văn bản sửa được, công thức thành Equation.</small></div>
          <div><span>☁</span><b>Kho Cloud riêng</b><small>Lưu dự án chọn lọc; Cloud chỉ ghi khi bạn chủ động bấm lưu.</small></div>
          <div><span>⌘</span><b>Làm việc nhẹ nhàng</b><small>IndexedDB trên máy, đồng bộ Cloud khi bạn chủ động.</small></div>
        </div>
        <div className="pro-honor-footer"><span>Quyền Pro đã sẵn sàng trên tài khoản này.</span><button type="button" className="studio-button studio-button--primary" onClick={() => { onCloud(); onClose() }}>Mở khu Cloud</button></div>
      </section>
    </div>
  )
}

function ProjectSwitcher({ project, projects, onSwitch, onCreate }) {
  const [open, setOpen] = useState(false)
  const [query, setQuery] = useState('')
  const rootRef = useRef(null)

  useEffect(() => {
    if (!open) return undefined
    const closeOnOutsideClick = event => {
      if (!rootRef.current?.contains(event.target)) setOpen(false)
    }
    const closeOnEscape = event => {
      if (event.key === 'Escape') setOpen(false)
    }
    document.addEventListener('pointerdown', closeOnOutsideClick)
    document.addEventListener('keydown', closeOnEscape)
    return () => {
      document.removeEventListener('pointerdown', closeOnOutsideClick)
      document.removeEventListener('keydown', closeOnEscape)
    }
  }, [open])

  const filteredProjects = useMemo(() => {
    const normalizedQuery = query.trim().toLocaleLowerCase('vi')
    return [...projects]
      .sort((left, right) => {
        if (left.id === project.id) return -1
        if (right.id === project.id) return 1
        return (right.updatedAt || 0) - (left.updatedAt || 0)
      })
      .filter(item => !normalizedQuery || `${item.name} ${item.entryPath} ${item.templateId}`.toLocaleLowerCase('vi').includes(normalizedQuery))
  }, [project.id, projects, query])

  const openProject = projectId => {
    setOpen(false)
    setQuery('')
    onSwitch(projectId)
  }

  return (
    <div className={`project-switcher ${open ? 'is-open' : ''}`} ref={rootRef}>
      <button
        type="button"
        className="project-switcher__trigger"
        aria-haspopup="dialog"
        aria-expanded={open}
        onClick={() => setOpen(value => !value)}
        title="Chuyển dự án"
      >
        <span className="project-switcher__mark">{String(project.name || 'T').trim().charAt(0).toLocaleUpperCase('vi')}</span>
        <span className="project-switcher__current"><small>DỰ ÁN ĐANG MỞ</small><b>{project.name}</b></span>
        <span className="project-switcher__chevron">⌄</span>
      </button>

      {open && <div className="project-switcher__popover" role="dialog" aria-label="Chuyển dự án">
        <header>
          <div><span>KHÔNG GIAN LÀM VIỆC</span><b>Chuyển dự án</b></div>
          <em>{projects.length} dự án</em>
        </header>
        <label className="project-switcher__search">
          <span>⌕</span>
          <input autoFocus value={query} onChange={event => setQuery(event.target.value)} placeholder="Tìm theo tên hoặc tệp chính…" />
          <kbd>ESC</kbd>
        </label>
        <div className="project-switcher__list">
          {filteredProjects.map(item => {
            const template = PROJECT_TEMPLATES.find(candidate => candidate.id === item.templateId)
            const textFiles = Object.values(item.files || {}).filter(file => file.kind === 'text').length
            const active = item.id === project.id
            return <button type="button" key={item.id} className={active ? 'is-active' : ''} onClick={() => openProject(item.id)}>
              <span className="project-switcher__item-mark">{String(item.name || 'T').trim().charAt(0).toLocaleUpperCase('vi')}</span>
              <span className="project-switcher__item-copy">
                <b>{item.name}</b>
                <small>{template?.name || 'Dự án Typst'} · {textFiles} tệp · {getFileName(item.entryPath)}</small>
              </span>
              <span className="project-switcher__item-time">{active ? <strong>ĐANG MỞ</strong> : formatTime(item.updatedAt || Date.now())}<i>{active ? '✓' : '›'}</i></span>
            </button>
          })}
          {!filteredProjects.length && <div className="project-switcher__empty"><span>⌕</span><b>Không tìm thấy dự án</b><small>Thử một tên hoặc tệp khác.</small></div>}
        </div>
        <footer>
          <span>Dự án gần nhất được đưa lên đầu</span>
          <button type="button" onClick={() => { setOpen(false); onCreate() }}>＋ Dự án mới</button>
        </footer>
      </div>}
    </div>
  )
}

export default function HubStudio({ initialTemplateId, initialBridge, onExit, onUpgrade }) {
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
  const [currentUser, setCurrentUser] = useState(null)
  const [authLoading, setAuthLoading] = useState(true)
  const [authError, setAuthError] = useState('')
  const [authStatusText, setAuthStatusText] = useState('')
  const [cloudProjects, setCloudProjects] = useState([])
  const [isCloudPro, setIsCloudPro] = useState(false)
  const [cloudLimitBytes, setCloudLimitBytes] = useState(0)
  const [syncingProjectId, setSyncingProjectId] = useState(null)
  const [aiQuickFixOpen, setAiQuickFixOpen] = useState(false)
  const [aiQuickFixDiagnostic, setAiQuickFixDiagnostic] = useState(null)
  const [upgradeDialogOpen, setUpgradeDialogOpen] = useState(false)
  const [proHonorOpen, setProHonorOpen] = useState(false)
  const [docxExporting, setDocxExporting] = useState(false)
  const [readyDocx, setReadyDocx] = useState(null)
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
  const [storageInfo, setStorageInfo] = useState({ usage: 0, quota: 0, persisted: false })
  const [mathToolbarTab, setMathToolbarTab] = useState('math-operators')

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
  const previewResizeTimerRef = useRef(null)
  const previewWidthRef = useRef(0)
  const importInputRef = useRef(null)
  const bridgeImportRef = useRef('')
  const pandocWorkerRef = useRef(null)
  const pandocPendingRef = useRef(new Map())
  const pandocSequenceRef = useRef(0)

  const notify = useCallback((message, tone = 'success') => {
    setToast({ message, tone })
    window.setTimeout(() => setToast(current => current?.message === message ? null : current), 3200)
  }, [])

  const getPandocWorker = useCallback(() => {
    if (pandocWorkerRef.current) return pandocWorkerRef.current
    const worker = new Worker(new URL('./pandocWorker.js', import.meta.url), { type: 'module' })
    worker.onmessage = event => {
      const requestId = event.data?.requestId
      const pending = requestId ? pandocPendingRef.current.get(requestId) : null
      if (!pending) return
      pandocPendingRef.current.delete(requestId)
      if (event.data.success) pending.resolve(event.data)
      else pending.reject(new Error(event.data.error || 'Pandoc WASM không phản hồi'))
    }
    worker.onerror = error => {
      for (const pending of pandocPendingRef.current.values()) pending.reject(error)
      pandocPendingRef.current.clear()
    }
    pandocWorkerRef.current = worker
    return worker
  }, [])

  const runPandocRequest = useCallback((payload, timeoutMs = 120000) => {
    const worker = getPandocWorker()
    const requestId = `pandoc-${Date.now()}-${pandocSequenceRef.current++}`
    return withTimeout(new Promise((resolve, reject) => {
      pandocPendingRef.current.set(requestId, { resolve, reject })
      worker.postMessage({ ...payload, requestId })
    }), timeoutMs, 'Quá thời gian chuyển đổi Word; hãy thử với tài liệu nhỏ hơn')
  }, [getPandocWorker])

  useEffect(() => {
    if (!currentUser || !isCloudPro) return undefined
    // Tải nền bộ Pandoc 56 MB khi giáo viên vừa mở Studio. Không hiện toast,
    // không tải cho tài khoản Free; đến lúc bấm DOCX chỉ còn bước dựng file.
    const warm = () => { void runPandocRequest({ type: 'prewarm' }, 180000).catch(error => console.debug('Pandoc prewarm:', error?.message || error)) }
    if ('requestIdleCallback' in window) {
      const idleId = window.requestIdleCallback(warm, { timeout: 4500 })
      return () => window.cancelIdleCallback(idleId)
    }
    const timer = window.setTimeout(warm, 1800)
    return () => window.clearTimeout(timer)
  }, [currentUser, isCloudPro, runPandocRequest])

  useEffect(() => () => {
    for (const pending of pandocPendingRef.current.values()) pending.reject(new Error('Đã đóng Studio'))
    pandocPendingRef.current.clear()
    pandocWorkerRef.current?.terminate()
    pandocWorkerRef.current = null
  }, [])

  const handleGoogleSignIn = useCallback(async () => {
    try {
      notify('Đang mở cửa sổ đăng nhập Google…')
      await signInWithGoogle()
    } catch (error) {
      notify(`Không đăng nhập được: ${error?.message || 'Vui lòng thử lại.'}`, 'error')
    }
  }, [notify])

  const refreshProjects = useCallback(async () => setProjects(await listProjects()), [])

  const loadCloudData = useCallback(async () => {
    try {
      const data = await fetchCloudProjects()
      if (data && data.ok) {
        setCloudProjects(data.projects || [])
        const cloudEnabled = data.cloudEnabled === true && data.isPro === true
        setIsCloudPro(cloudEnabled)
        setCloudLimitBytes(cloudEnabled ? Number(data.storageBytesLimit) || DEFAULT_CLOUD_LIMIT_BYTES : 0)
      }
    } catch (error) {
      console.error('Không tải được dữ liệu cloud:', error)
    }
  }, [])

  useEffect(() => {
    const refreshProAccess = () => { void loadCloudData() }
    window.addEventListener('conic-pro-activated', refreshProAccess)
    return () => window.removeEventListener('conic-pro-activated', refreshProAccess)
  }, [loadCloudData])

  useEffect(() => {
    if (isCloudPro) setUpgradeDialogOpen(false)
  }, [isCloudPro])

  const saveCurrentProjectToCloud = useCallback(async () => {
    if (!isCloudPro || !identityAuth.currentUser || !project) return
    setSyncingProjectId(project.id)
    try {
      const saved = await saveProject(project)
      setProject(saved)
      setLastSavedAt(saved.updatedAt)
      setIsDirty(false)
      await refreshProjects()
      await syncCloudProject(saved)
      await loadCloudData()
      notify('Đã lưu dự án hiện tại lên Cloud')
    } catch (error) {
      notify(error.message, 'error')
    } finally {
      setSyncingProjectId(null)
    }
  }, [isCloudPro, loadCloudData, notify, project, refreshProjects])

  const handleCloudDelete = useCallback(async (projectId) => {
    if (!window.confirm('Bạn có chắc chắn muốn xóa dự án này khỏi đám mây?')) return
    try {
      await deleteCloudProject(projectId)
      notify('Đã xóa dự án trên đám mây.')
      await loadCloudData()
    } catch (error) {
      notify(error.message, 'error')
    }
  }, [loadCloudData, notify])

  const calculateTotalUsedBytes = useCallback(() => {
    return cloudProjects.reduce((sum, cp) => sum + (cp.estimatedSizeBytes || 0), 0)
  }, [cloudProjects])

  const formatBytes = useCallback(bytes => {
    if (bytes === 0) return '0 Bytes'
    const k = 1024
    const sizes = ['Bytes', 'KB', 'MB', 'GB']
    const i = Math.floor(Math.log(bytes) / Math.log(k))
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i]
  }, [])

  const loadCloudProjectToLocal = useCallback(async (cloudProj) => {
    if (project?.id === cloudProj.id) {
      notify('Dự án này đã được mở sẵn')
      return
    }
    if (!window.confirm(`Bạn có muốn tải dự án "${cloudProj.name}" về trình duyệt này không? Lịch sử cục bộ (nếu có) sẽ bị ghi đè bằng bản đám mây mới nhất.`)) return
    try {
      const downloaded = await downloadCloudProject(cloudProj.id)
      const saved = await saveProject(downloaded)
      setProject(saved)
      setActiveFilePath(saved.entryPath)
      setOpenTabs([saved.entryPath])
      setLastSavedAt(saved.updatedAt)
      setCompileStatus('waiting')
      setDiagnostics([])
      previewMountRef.current?.replaceChildren()
      lastArtifactRef.current = null
      await refreshProjects()
      notify(`Đã tải xuống và mở dự án "${cloudProj.name}"`)
    } catch (error) {
      notify(`Không thể tải dự án: ${error.message}`, 'error')
    }
  }, [notify, project, refreshProjects])

  const requestAiQuickFix = useCallback(diagnostic => {
    setAiQuickFixDiagnostic(diagnostic)
    setAiQuickFixOpen(true)
  }, [])

  const applyQuickFix = useCallback((lineNum, fixedLine) => {
    const editor = editorRef.current
    if (!editor) return
    const model = editor.getModel()
    if (!model) return
    const lineMaxColumn = model.getLineMaxColumn(lineNum)
    editor.executeEdits('ai-quick-fix', [{
      range: new monacoRef.current.Range(lineNum, 1, lineNum, lineMaxColumn),
      text: fixedLine,
      forceMoveMarkers: true
    }])
    notify('Đã áp dụng bản sửa lỗi của AI')
  }, [notify])

  useEffect(() => {
    const unsubscribe = listenAuthState(({ user, loading, error, statusText }) => {
      setCurrentUser(user)
      setAuthLoading(loading)
      setAuthStatusText(statusText || '')
      if (error) {
        setAuthError(error)
        notify(error, 'error')
      } else {
        setAuthError('')
      }

      if (user) {
        fetchCloudProjects().then(data => {
          if (data && data.ok) {
            setCloudProjects(data.projects || [])
            const cloudEnabled = data.cloudEnabled === true && data.isPro === true
            setIsCloudPro(cloudEnabled)
            setCloudLimitBytes(cloudEnabled ? Number(data.storageBytesLimit) || DEFAULT_CLOUD_LIMIT_BYTES : 0)
          }
        }).catch(err => console.error(err))
      } else {
        setCloudProjects([])
        setIsCloudPro(false)
        setCloudLimitBytes(0)
      }
    })
    return unsubscribe
  }, [notify])

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
      const requestedTemplate = PROJECT_TEMPLATES.find(template => template.id === initialTemplateId)
      const requestedTemplateVersion = requestedTemplate?.version || 1
      const consumeKey = `template-consumed:${initialTemplateId}:v${requestedTemplateVersion}:${window.location.hash}`
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
    const scroll = mount.closest('.preview-scroll')
    const scrollStyle = scroll ? window.getComputedStyle(scroll) : null
    const horizontalPadding = scrollStyle
      ? Number.parseFloat(scrollStyle.paddingLeft) + Number.parseFloat(scrollStyle.paddingRight)
      : 0
    const measuredWidth = (scroll?.clientWidth || 0) - horizontalPadding
    const mobileFallback = window.innerWidth - 36
    const renderWidth = Math.round(measuredWidth > 240
      ? measuredWidth
      : Math.max(280, Math.min(720, mobileFallback)))

    // Vẽ hoàn chỉnh ngoài màn hình trước, sau đó thay DOM trong một lần.
    // Preview cũ luôn còn nguyên trong lúc gõ và biên dịch nên không nhấp nháy.
    // Renderer lấy offsetWidth của container làm khổ hiển thị. Vì staging nằm
    // ngoài body, cần một host có đúng bề rộng panel Preview; nếu không nó sẽ
    // lấy toàn bộ bề rộng cửa sổ, kéo canvas 1.8x lên 1440px và gây to/mờ/lệch.
    const stagingHost = document.createElement('div')
    stagingHost.className = 'preview-render-staging-host'
    stagingHost.style.width = `${renderWidth}px`
    const staging = document.createElement('div')
    staging.className = 'preview-mount'
    staging.setAttribute('aria-hidden', 'true')
    stagingHost.appendChild(staging)
    document.body.appendChild(stagingHost)
    const session = await renderer.createModule(artifact.slice(0))
    try {
      await renderer.renderToCanvas({
        renderSession: session,
        container: staging,
        pixelPerPt: Math.min(3, Math.max(1.8, window.devicePixelRatio * 1.35)),
        backgroundColor: '#ffffff',
        dataSelection: { body: true, semantics: true },
      })
      mount.replaceChildren(...staging.childNodes)
      previewWidthRef.current = renderWidth
    } finally {
      stagingHost.remove()
    }
  }, [])

  useEffect(() => {
    if (!project?.id || !previewMountRef.current || typeof ResizeObserver === 'undefined') return undefined
    const scroll = previewMountRef.current.closest('.preview-scroll')
    if (!scroll) return undefined

    const observer = new ResizeObserver(entries => {
      const width = entries[0]?.contentRect?.width || 0
      if (width <= 240 || Math.abs(width - previewWidthRef.current) < 2) return
      if (previewResizeTimerRef.current) window.clearTimeout(previewResizeTimerRef.current)
      previewResizeTimerRef.current = window.setTimeout(() => {
        const artifact = lastArtifactRef.current
        if (!artifact) return
        const task = renderQueueRef.current
          .catch(() => undefined)
          .then(() => renderArtifact(artifact.slice(0)))
        renderQueueRef.current = task
      }, 180)
    })

    observer.observe(scroll)
    return () => {
      observer.disconnect()
      if (previewResizeTimerRef.current) window.clearTimeout(previewResizeTimerRef.current)
    }
  }, [project?.id, renderArtifact])

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
        if (action?.kind === 'temp_compile') {
          action.reject?.(new Error(message.error?.message || 'Không biên dịch được hình cho Word'))
          return
        }
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
        if (action.kind === 'temp_compile') {
          const diagnostic = message.diagnostics?.[0]
          action.reject?.(new Error(diagnostic?.message || 'Không tạo được hình cho tài liệu Word'))
          return
        }
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

      if (action.kind === 'temp_compile') {
        if (action.resolve) action.resolve(message.artifact)
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
      templateId: project.templateId,
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
    let cancelled = false
    const refreshStorage = async () => {
      if (!navigator.storage) return
      try {
        const persisted = await navigator.storage.persist?.() || await navigator.storage.persisted?.() || false
        const estimate = await navigator.storage.estimate?.() || {}
        if (!cancelled) setStorageInfo({ usage: estimate.usage || 0, quota: estimate.quota || 0, persisted })
      } catch {
        // IndexedDB vẫn hoạt động nếu trình duyệt không cấp StorageManager.
      }
    }
    refreshStorage()
    const timer = window.setInterval(refreshStorage, 60_000)
    return () => { cancelled = true; window.clearInterval(timer) }
  }, [])

  useEffect(() => {
    const handleKeyDown = event => {
      const modifier = event.metaKey || event.ctrlKey
      if (modifier && event.key.toLowerCase() === 's') {
        event.preventDefault()
        if (project) saveProject(project).then(saved => { setLastSavedAt(saved.updatedAt); setIsDirty(false); notify('Đã lưu trên máy') })
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

  // Đồng bộ nội dung từ React state vào Monaco Editor khi thay đổi từ bên ngoài (AI, template...)
  // Không đồng bộ khi người dùng đang trực tiếp gõ (editor có focus) để tránh lỗi nhảy con trỏ
  useEffect(() => {
    const editor = editorRef.current
    if (!editor || !activeFile || activeFile.kind !== 'text') return
    const model = editor.getModel()
    if (!model) return

    const currentValue = model.getValue()
    if (activeFile.content !== currentValue) {
      if (!editor.hasTextFocus()) {
        const position = editor.getPosition()
        model.setValue(activeFile.content)
        if (position) editor.setPosition(position)
      }
    }
  }, [activeFile?.content, activeFilePath])

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
    const model = editor.getModel()
    const offset = model && selection ? model.getOffsetAt(selection.getStartPosition()) : activeFile.content.length
    const text = contextualSnippetText(snippet, activeFile.content, offset)
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

  const directExamPath = useMemo(() => Object.entries(project?.files || {}).find(([, file]) => (
    file?.kind === 'text'
    && file.content.includes(QUESTIONS_START)
    && /(exam-preset|exam-theme)/.test(file.content)
  ))?.[0] || '', [project])

  const isBeamerEntry = useMemo(() => {
    const entry = project?.files?.[project?.entryPath]
    return entry?.kind === 'text' && entry.content.includes('/extensions/sang-beamer/sang-beamer.typ')
  }, [project])

  const setActiveAsEntry = useCallback(() => {
    if (!project || activeFile?.kind !== 'text' || activeFilePath === project.entryPath) return
    mutateProject(current => ({ ...current, entryPath: activeFilePath }))
    workerProjectIdRef.current = ''
    notify(`Đã chọn ${getFileName(activeFilePath)} làm bản xuất`)
  }, [activeFile, activeFilePath, mutateProject, notify, project])

  const switchToDirectExam = useCallback(() => {
    if (!project || !directExamPath) return
    mutateProject(current => ({ ...current, entryPath: directExamPath }))
    setActiveFilePath(directExamPath)
    setOpenTabs(current => [...new Set([...current, directExamPath])])
    setMobilePane('editor')
    workerProjectIdRef.current = ''
    notify('Đã trở về bản đề A4 để tiếp tục soạn trực tiếp')
  }, [directExamPath, mutateProject, notify, project])

  const createOrUpdateBeamer = useCallback(async () => {
    if (!project || !directExamPath) {
      notify('Hãy mở mẫu “Đề 05 · Soạn trực tiếp” để tạo Beamer tự động.', 'error')
      return
    }
    try {
      const source = project.files[directExamPath].content
      const outputPath = '/project/05_beamer_chua_de.typ'
      const currentBeamer = project.files[outputPath]?.content || ''
      const currentThemeId = Number(currentBeamer.match(/^#let theme-id\s*=\s*(\d+)/m)?.[1]) || 16
      const withSnapshot = createSnapshot(project, 'Trước khi tạo Beamer từ đề 05')
      const next = {
        ...withSnapshot,
        entryPath: outputPath,
        files: {
          ...withSnapshot.files,
          [outputPath]: { kind: 'text', content: createBeamerSourceFromExam(source, currentThemeId) },
        },
      }
      const saved = await saveProject(next)
      setProject(saved)
      setActiveFilePath(outputPath)
      setOpenTabs(current => [...new Set([...current, outputPath])])
      setIsDirty(false)
      setLastSavedAt(saved.updatedAt)
      setMobilePane('editor')
      workerProjectIdRef.current = ''
      await refreshProjects()
      let revealAttempts = 0
      const revealThemeGuide = () => {
        const editor = editorRef.current
        const model = editor?.getModel()
        if (model?.getValue()?.includes('10 MẪU BEAMER ĐỀ XUẤT')) {
          editor.setPosition({ lineNumber: 1, column: 1 })
          editor.revealLineNearTop(1)
          return
        }
        revealAttempts += 1
        if (revealAttempts < 12) window.setTimeout(revealThemeGuide, 100)
      }
      window.setTimeout(revealThemeGuide, 0)
      notify('Đã tạo Beamer 16:9 · xem 10 mẫu màu gợi ý ở đầu tệp')
    } catch (error) {
      notify(`Không tạo được Beamer: ${error.message}`, 'error')
    }
  }, [directExamPath, notify, project, refreshProjects])

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
      const firstTyp = Object.keys(additions).find(path => /\.typ$/i.test(path))
      mutateProject(current => ({
        ...current,
        files: { ...current.files, ...additions },
        // Nhập một tệp .typ từ máy thì đặt luôn làm bản xuất (entry) để preview
        // và Xuất Word bám đúng tệp vừa nhập, không dính tệp mẫu cũ.
        ...(firstTyp ? { entryPath: firstTyp } : {}),
      }))
      const firstText = firstTyp || Object.keys(additions).find(path => additions[path].kind === 'text')
      if (firstText) openFile(firstText)
      notify(firstTyp ? `Đã nhập ${getFileName(firstTyp)} và đặt làm bản xuất` : `Đã thêm ${selectedFiles.length} tệp`)
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

  const exportWord = useCallback(async () => {
    if (!project) return
    if (docxExporting) return
    if (!currentUser || !isCloudPro) {
      setUpgradeDialogOpen(true)
      notify(currentUser
        ? 'Xuất Word thật là quyền lợi Pro. Studio Free vẫn dùng đầy đủ chức năng soạn và xuất PDF.'
        : 'Đăng nhập Google để kiểm tra quyền xuất Word hoặc chọn gói TypstConicHub Pro.', 'error')
      return
    }
    // Xuất ĐÚNG tệp đang mở, không phải tệp entry cố định. Nếu tệp đang mở là
    // ảnh/binary thì lùi về tệp entry. Nhờ vậy "chọn file khác" → xuất file đó.
    const exportPath = (activeFile?.kind === 'text' ? activeFilePath : null) || project.entryPath
    const exportFile = project.files[exportPath]
    if (!exportFile || exportFile.kind !== 'text') {
      notify('Tệp đang mở phải là mã Typst để xuất Word', 'error')
      return
    }
    const exportBaseName = safeFileName(getFileName(exportPath).replace(/\.typ$/i, '') || project?.name || 'Tai-lieu')

    // ConicTypst Desktop can use the native Pandoc + Python pipeline already
    // installed on the machine. A normal website cannot execute local programs,
    // so browser users continue with the private Pandoc WASM path below.
    if (window.desktopApi?.exportTypstDocxBundle) {
      try {
        notify('Đang xuất Word bằng Pandoc và Python trên máy…')
        const nativeResult = await window.desktopApi.exportTypstDocxBundle({
          content: exportFile.content,
          sourceName: exportPath.split('/').pop() || 'Tai-lieu.typ',
          examTitle: project.name || 'Tài liệu Typst',
          schoolName: '',
          examCode: '',
          examSubject: 'TOÁN',
          addFooter: true,
        })
        if (nativeResult?.cancelled) {
          notify('Đã hủy lưu Word trên máy')
          return
        }
        notify(`Đã xuất Word bằng bộ xử lý trên máy${nativeResult?.filePath ? `: ${nativeResult.filePath}` : ''}`)
        return
      } catch (error) {
        console.warn('Native DOCX export failed; falling back to browser WASM:', error)
        notify('Bộ xử lý trên máy chưa sẵn sàng; đang chuyển sang Pandoc WASM…')
      }
    }
    const { extractBlocksForDocx, buildFigurePrelude, injectLayouts, getMockMacros, buildHeaderBlock, prepareEditableTypstForDocx, stripResidualGraphics, extractExamMeta } = await import('./docxBundle.js')
    const { postprocessDocxBlob } = await import('./docxPostprocess.js')
    setDocxExporting(true)
    setReadyDocx(null)
    
    notify('Đang tạo tài liệu Word (vui lòng không đóng trang)...')

    try {
      const content = exportFile.content

      // Rút gọn về vùng câu hỏi mà Pandoc hiểu được: ưu tiên marker
      // CONICTYPST:QUESTIONS, kế đến gỡ factory make-questions ([ ] hoặc { }),
      // còn lại giữ nguyên tài liệu tự do. Hàm này không ném lỗi.
      let strippedContent = reduceForDocxExport(content)
      // Tiêu đề thật nằm trong #show: thpt-school-exam.with(...) — trích ra vì
      // show rule bị bỏ khi sang Pandoc. Không có thì lùi về tên dự án.
      const examMeta = extractExamMeta(content)
      const headerBlock = buildHeaderBlock({
        examTitle: examMeta.examTitle || project?.name || 'ĐỀ KIỂM TRA',
        schoolName: examMeta.schoolName || '',
        examCode: examMeta.examCode || '',
        examSubject: examMeta.examSubject || ''
      })
      if (headerBlock) strippedContent = headerBlock + strippedContent

      // QUAN TRỌNG: trích khối hình TỪ strippedContent (bản sắp đưa vào Pandoc),
      // không phải từ content gốc — để mỗi khối tìm được chắc chắn tồn tại
      // verbatim trong chuỗi cần thay, xóa hẳn lớp lỗi "thay ảnh không khớp".
      // Bắt cả `canvas(` trần (không tiền tố cetz.) ngang bằng công cụ Desktop.
      const cetzBlocks = extractBlocksForDocx(strippedContent, 'cetz.canvas')
      const canvasBlocks = extractBlocksForDocx(strippedContent, 'canvas', { skipDotPrefix: true })
      const bbtBlocks = extractBlocksForDocx(strippedContent, 'bbt')
      const allBlocks = [...cetzBlocks, ...canvasBlocks, ...bbtBlocks]

      const images = {}
      for (const [path, file] of Object.entries(project.files)) {
        if (file?.kind !== 'binary') continue
        const bytes = file.content instanceof Uint8Array
          ? file.content
          : new Uint8Array(file.content || [])
        const blob = new Blob([bytes], { type: file.mime || 'application/octet-stream' })
        const normalizedPath = path.replace(/^\/+/, '')
        const fileName = normalizedPath.split('/').pop()
        images[normalizedPath] = blob
        if (fileName && !images[fileName]) images[fileName] = blob
      }

      if (allBlocks.length > 0) {
        notify(`Đang biên dịch ${allBlocks.length} hình vẽ...`)
        
        const tempContent = `${buildFigurePrelude(content)}
#set page(width: auto, height: auto, margin: 10pt)
#show math.equation: set text(fill: black)

${allBlocks.map(block => (block.hasHash ? block.text : `#${block.text}`)).join('\n#pagebreak()\n')}`

        const reqId = `export-docx-${Date.now()}`
        const tempCompilePromise = new Promise((resolve, reject) => {
          requestActionsRef.current.set(reqId, { kind: 'temp_compile', resolve, reject })
          workerRef.current.postMessage({
            type: 'compile',
            requestId: reqId,
            entryPath: '/export.typ',
            files: { ...project.files, '/export.typ': { kind: 'text', content: tempContent } },
            format: 'vector'
          })
        })
        let vectorArtifact
        try {
          vectorArtifact = await withTimeout(tempCompilePromise, 60000, 'Quá thời gian biên dịch hình cho Word')
        } catch (error) {
          requestActionsRef.current.delete(reqId)
          throw error
        }

        const renderer = await getRenderer()
        const session = await renderer.createModule(vectorArtifact.slice(0))
        const pagesCount = session.pages

        // QUAN TRỌNG: renderToCanvas lấy offsetWidth của container làm khổ vẽ.
        // Nếu host bị visibility:hidden / không có bề rộng thì canvas có thể rỗng
        // hoặc không được tạo → mọi hình bị mất. Dùng host CÓ bề rộng thật và đẩy
        // ra ngoài màn hình bằng tọa độ (vẫn có layout box) thay vì ẩn hẳn.
        const stagingHost = document.createElement('div')
        stagingHost.style.position = 'fixed'
        stagingHost.style.left = '-10000px'
        stagingHost.style.top = '0'
        stagingHost.style.width = '760px'
        stagingHost.style.pointerEvents = 'none'
        stagingHost.style.opacity = '0'
        document.body.appendChild(stagingHost)

        await renderer.renderToCanvas({
          renderSession: session,
          container: stagingHost,
          pixelPerPt: 3,
          backgroundColor: '#ffffff',
        })

        const canvases = Array.from(stagingHost.querySelectorAll('canvas'))
        let renderedFigures = 0

        for (let i = 0; i < canvases.length && i < allBlocks.length; i++) {
          const canvas = canvases[i]
          if (canvas && canvas.width > 0 && canvas.height > 0) {
            const blob = await new Promise(resolve => canvas.toBlob(resolve, 'image/png'))
            if (blob && blob.size > 0) {
              // Tên PHẲNG, không thư mục con: pandoc-wasm chỉ nhúng ảnh có tên đơn
              images[`fig-${i + 1}.png`] = blob
              renderedFigures += 1
            }
          }
        }
        stagingHost.remove()
        console.debug(`DOCX figures: ${renderedFigures}/${allBlocks.length} rendered (pages=${pagesCount})`)
        if (renderedFigures === 0 && allBlocks.length > 0) {
          notify('Cảnh báo: không kết xuất được hình nào cho Word. Kiểm tra Console.', 'error')
        }

        allBlocks.forEach((block, index) => {
          const figName = `fig-${index + 1}.png`
          const replacement = block.hasHash
            ? `#image("${figName}", width: 42%)`
            : `image("${figName}", width: 42%)`
          strippedContent = strippedContent.replace(block.text, replacement)
        })
      }

      // Lớp an toàn: Pandoc TUYỆT ĐỐI không được thấy cetz/canvas/bbt. Nếu còn
      // sót khối vẽ nào (cú pháp lạ, lệch chuỗi), thay bằng ghi chú trung tính
      // thay vì để nguyên và làm hỏng cả lần xuất.
      strippedContent = stripResidualGraphics(strippedContent)

      // Phần thân đã rút gọn + bỏ #show/#import/#let preset và ảnh cetz đã thay.
      // Giữ lại bản này để retry: nó đã sạch factory/preset, khác hẳn việc
      // re-dump nguyên tài liệu (vốn lại vấp đúng lỗi cũ).
      const preLayout = prepareEditableTypstForDocx(strippedContent)
      // Tài liệu tự do có thể chứa macro chưa đóng mà trình parser bố cục
      // không biết. Khi đó vẫn xuất phần văn bản/toán chỉnh sửa được, không
      // biến toàn bộ lần xuất thành lỗi “unclosed delimiter”.
      let withLayout = preLayout
      try {
        withLayout = injectLayouts(preLayout)
      } catch (layoutError) {
        console.debug('Bỏ qua tối ưu layout DOCX:', layoutError?.message || layoutError)
      }

      // Dựng 1 bản DOCX cho một chế độ. Hình đã biên dịch dùng chung cho cả 3
      // chế độ nên chỉ phần macro + Pandoc + trang trí lặp lại.
      const buildDocxForMode = async mode => {
        const finalTypst = getMockMacros(mode) + withLayout
        let rawDocxBlob
        try {
          rawDocxBlob = (await runPandocRequest({ type: 'convert', typstCode: finalTypst, images })).blob
        } catch (firstError) {
          // Pandoc's Typst reader is intentionally conservative. Retry once with
          // the reduced body WITHOUT layout injection if it upset the delimiter scan.
          if (!/delimiter|parse|unexpected/i.test(firstError?.message || '')) throw firstError
          const conservative = getMockMacros(mode) + preLayout
          rawDocxBlob = (await runPandocRequest({ type: 'convert', typstCode: conservative, images })).blob
        }
        // Postprocess chỉ trang trí. Nếu nó làm file teo bất thường (dấu hiệu
        // hỏng cây XML), giữ file RAW từ Pandoc để không mất nội dung.
        let finalDocx = await postprocessDocxBlob(rawDocxBlob)
        if (!finalDocx || finalDocx.size < rawDocxBlob.size * 0.6) {
          console.warn(`DOCX (${mode}) sau trang trí nhỏ bất thường (${finalDocx?.size}/${rawDocxBlob.size}) — dùng bản gốc từ Pandoc.`)
          finalDocx = rawDocxBlob
        }
        return finalDocx
      }

      // Xuất đủ 3 bản như bản Desktop: đề học sinh, đề + lời giải, đề + đáp án.
      const modes = [
        { mode: 'hocsinh', suffix: 'de-hoc-sinh', label: 'đề học sinh' },
        { mode: 'loigiai', suffix: 'de-loi-giai', label: 'đề + lời giải' },
        { mode: 'dapan', suffix: 'de-dap-an', label: 'đề + đáp án' },
      ]
      const built = []
      for (const { mode, suffix, label } of modes) {
        notify(`Đang dựng Word: ${label}…`)
        built.push({ suffix, blob: await buildDocxForMode(mode) })
      }

      const { default: JSZip } = await import('jszip')
      const zip = new JSZip()
      for (const { suffix, blob } of built) {
        zip.file(`${exportBaseName}-${suffix}.docx`, blob)
      }
      const zipBlob = await zip.generateAsync({ type: 'blob', mimeType: 'application/zip' })
      const fileName = `${exportBaseName}-word.zip`
      setReadyDocx({
        blob: zipBlob,
        fileName,
        url: URL.createObjectURL(zipBlob),
      })
      // Thử tải ngay; nút “Tải Word” vẫn được giữ lại để trình duyệt nhúng
      // không chặn download sau khi WASM vừa xử lý xong.
      downloadBlob(zipBlob, fileName)
      notify('Đã dựng ZIP 3 bản Word (đề · lời giải · đáp án). Nếu trình duyệt chưa tải, bấm “Tải Word”.')

    } catch (error) {
      console.error(error)
      const isParseError = /delimiter|parse|unexpected|not found|not a string/i.test(error?.message || '')
      const hint = isParseError
        ? ' Tài liệu dùng hàm tùy biến, #show hoặc hình cetz vượt khả năng đọc Typst của Pandoc. Hãy đánh dấu vùng câu hỏi (nút chèn vùng CONICTYPST:QUESTIONS) hoặc dùng bản Desktop để xuất đầy đủ.'
        : ''
      notify(`Chưa thể tạo Word chỉnh sửa được: ${error.message}.${hint}`, 'error')
    } finally {
      setDocxExporting(false)
    }
  }, [currentUser, docxExporting, isCloudPro, notify, project, runPandocRequest])

  useEffect(() => () => {
    if (readyDocx?.url) URL.revokeObjectURL(readyDocx.url)
  }, [readyDocx])

  const makeSnapshot = useCallback(async () => {
    if (!project) return
    const next = createSnapshot(project, `Snapshot ${formatTime(Date.now())}`)
    const saved = await saveProject(next)
    setProject(saved)
    setLastSavedAt(saved.updatedAt)
    setIsDirty(false)
    notify('Đã tạo snapshot an toàn')
  }, [notify, project])

  const packageHealth = useMemo(() => inspectSangMathProject(project?.files), [project?.files])
  const packageNeedsUpgrade = packageHealth.legacyImports > 0 || packageHealth.outdatedImports > 0

  const copyOfficialImport = useCallback(async () => {
    try {
      await navigator.clipboard.writeText(SANG_MATH_IMPORT)
      notify('Đã sao chép import sang-math chính thức')
    } catch {
      notify('Trình duyệt không cho phép sao chép tự động', 'error')
    }
  }, [notify])

  const upgradePackageImports = useCallback(async () => {
    if (!project) return
    const protectedProject = createSnapshot(project, 'Trước khi nâng cấp import sang Universe')
    const migrated = migrateProjectToUniverse(protectedProject)
    if (!migrated.changedFiles) {
      notify('Dự án đã dùng import chính thức hoặc không cần nâng cấp')
      return
    }

    const saved = await saveProject(migrated.project)
    setProject(saved)
    setLastSavedAt(saved.updatedAt)
    setIsDirty(false)
    workerProjectIdRef.current = ''
    await refreshProjects()
    notify(`Đã nâng cấp ${migrated.changedFiles} tệp sang Typst Universe`)
  }, [notify, project, refreshProjects])

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
    { id: 'package-upgrade', icon: 'U', label: 'Chuẩn hóa import sang Typst Universe', description: `Thay đường dẫn Sang Math cũ, tạo snapshot và dùng @preview/sang-math:${SANG_MATH_VERSION}.`, keywords: 'package migrate nâng cấp import official', run: upgradePackageImports },
    { id: 'exam-theme', icon: '✦', label: 'Đổi giao diện đề thi', description: 'Chọn theme Sang Math và biên dịch lại ngay.', keywords: 'màu phong cách designer cam xanh', run: () => setThemeDesignerOpen(true) },
    { id: 'exam-to-beamer', icon: '▶', label: 'Tạo/Cập nhật Beamer từ đề 05', description: 'Đồng bộ vùng #tn/#ds/#tln/#tl sang bản trình chiếu 16:9.', keywords: 'slide trình chiếu chữa đề', run: createOrUpdateBeamer },
    ...(directExamPath && isBeamerEntry ? [{ id: 'back-to-a4', icon: '←', label: 'Trở về đề A4 để soạn', description: 'Đặt lại bản đề trực tiếp làm preview và bản xuất.', keywords: 'tắt beamer quay lại ban đầu', run: switchToDirectExam }] : []),
    { id: 'set-entry', icon: 'E', label: 'Đặt tệp đang mở làm bản xuất', description: 'Dùng tệp hiện tại để preview và xuất PDF.', keywords: 'entry main biên dịch', run: setActiveAsEntry },
    { id: 'outline', icon: '☷', label: 'Mở mục lục tài liệu', description: 'Đi tới phần thi, câu hỏi hoặc tiêu đề.', keywords: 'outline cấu trúc', run: () => setSidebarMode('outline') },
    { id: 'compile', icon: '▶', label: 'Biên dịch lại preview', description: 'Chạy compiler Typst ngay lập tức.', shortcut: '⌘ ↵', run: () => requestCompile('vector', 'preview') },
    { id: 'pdf', icon: '↓', label: 'Xuất tài liệu PDF', description: 'Biên dịch và tải bản PDF chất lượng in.', keywords: 'download tải', run: () => requestCompile('pdf', 'pdf') },
    { id: 'docx', icon: 'W', label: 'Xuất tài liệu Word (DOCX)', description: 'Tải bộ đề Word định dạng chuẩn.', keywords: 'download tải word docx', run: exportWord },
    { id: 'png', icon: '▧', label: 'Xuất các trang PNG', description: 'Xuất một ảnh hoặc ZIP nhiều trang.', run: exportPng },
    { id: 'zip', icon: 'ZIP', label: 'Đóng gói dự án ZIP', description: 'Tải mã nguồn và toàn bộ asset.', run: handleExportZip },
    { id: 'snapshot', icon: '◷', label: 'Tạo snapshot an toàn', description: 'Lưu mốc để có thể quay lại sau.', run: makeSnapshot },
    { id: 'import', icon: '⇧', label: 'Nhập tệp hoặc dự án ZIP', description: 'Thêm mã Typst, dữ liệu và hình ảnh.', run: () => importInputRef.current?.click() },
    { id: 'problems', icon: '✓', label: 'Mở bảng kiểm tra lỗi', description: 'Xem mọi lỗi, gợi ý và đi tới dòng.', run: () => setProblemsOpen(true) },
    { id: 'theme', icon: theme === 'dark' ? '☀' : '☾', label: 'Đổi giao diện sáng / tối', description: 'Chuyển theme của không gian soạn thảo.', run: () => setTheme(value => value === 'dark' ? 'light' : 'dark') },
    { id: 'docs', icon: '?', label: 'Mở Hướng dẫn ConicTypst', description: 'Tra cứu tài liệu đầy đủ trong tab mới.', run: () => window.open('https://hdsd-conictypst.pages.dev/', '_blank', 'noopener') },
    { id: 'account', icon: '👤', label: 'Mở tài khoản ConicTypst', description: 'Xem quyền sử dụng và thời hạn các sản phẩm.', run: () => window.open('https://admin-conictypst.pages.dev/account.html', '_blank', 'noopener') },
    ...SANG_MATH_CATALOG.map(item => ({
      id: `macro-${item.id}`,
      icon: '#',
      label: `Chèn: ${item.name}`,
      description: item.description,
      keywords: `${item.category} ${item.signature}`,
      run: () => insertSnippet(item),
    })),
  ], [createOrUpdateBeamer, directExamPath, exportPng, exportWord, handleExportZip, insertSnippet, isBeamerEntry, makeSnapshot, requestCompile, setActiveAsEntry, switchToDirectExam, theme, upgradePackageImports])

  if (!project) {
    return <div className="studio-bootstrap"><BrandMark /><span className="spinner" /><p>Đang mở dự án gần nhất…</p></div>
  }

  const runtimeLabel = runtimeStatus === 'ready' ? 'Trình biên dịch sẵn sàng' : runtimeStatus === 'error' ? 'Trình biên dịch gặp lỗi' : 'Đang mở trình biên dịch'
  const compileLabel = compileStatus === 'compiling' ? 'Đang biên dịch…' : compileStatus === 'error' ? `${diagnostics.length || 1} vấn đề` : compileStatus === 'ready' ? `${lastCompileMs} ms` : 'Chờ biên dịch'

  return (
    <div className={`hub-studio theme-${theme}`}>
      <input ref={importInputRef} hidden type="file" multiple accept=".zip,.typ,.txt,.csv,.json,.toml,.md,.svg,.png,.jpg,.jpeg,.webp,.gif,.pdf" onChange={handleImport} />
      <header className="studio-header">
        <button type="button" className="studio-header__brand" onClick={onExit} title="Về trang chủ"><BrandMark /></button>
        <div className="studio-header__project">
          <ProjectSwitcher project={project} projects={projects} onSwitch={switchProject} onCreate={() => setNewProjectOpen(true)} />
          <button type="button" className="icon-button" onClick={renameProject} title="Đổi tên dự án">✎</button>
          <span className={`save-state ${isDirty ? 'is-dirty' : ''}`}><i />{isDirty ? 'Đang tự lưu' : `Đã lưu ${lastSavedAt ? new Intl.DateTimeFormat('vi-VN', { hour: '2-digit', minute: '2-digit' }).format(lastSavedAt) : ''}`}</span>
          
          {/* Cloud Indicator always visible here */}
          {currentUser ? (
            isCloudPro ? (
              <button 
                type="button" 
                onClick={() => { setSidebarMode('cloud'); setProHonorOpen(true) }} 
                style={{ background: 'rgba(16,185,129,0.1)', color: '#10b981', border: 'none', padding: '3px 8px', borderRadius: '4px', fontSize: '10px', fontWeight: 'bold', cursor: 'pointer', display: 'flex', alignItems: 'center', gap: '3px', whiteSpace: 'nowrap', marginLeft: '6px' }}
                title="Gói PRO - Nhấn để quản lý Cloud"
              >
                <span aria-hidden="true">♛</span> Pro
              </button>
            ) : (
              <button 
                type="button" 
                onClick={() => setUpgradeDialogOpen(true)} 
                style={{ background: 'rgba(249,115,22,0.1)', color: 'var(--studio-orange)', border: 'none', padding: '3px 8px', borderRadius: '4px', fontSize: '10px', fontWeight: 'bold', cursor: 'pointer', display: 'flex', alignItems: 'center', gap: '3px', whiteSpace: 'nowrap', marginLeft: '6px' }}
                title="Studio Free lưu trên máy · Nhấn để xem Studio Cloud"
              >
                ◉ Free
              </button>
            )
          ) : (
            <button 
              type="button" 
              onClick={handleGoogleSignIn} 
              className="studio-auth-button"
              title="Đăng nhập Google để kiểm tra quyền Pro và xuất Word"
            >
              <span>G</span> Đăng nhập Google
            </button>
          )}
        </div>
        <nav className="studio-header__nav">
          {currentUser && (
            <a href="https://admin-conictypst.pages.dev/account.html" target="_blank" rel="noreferrer">Quyền Typst</a>
          )}
          <a href="https://hdsd-conictypst.pages.dev/" target="_blank" rel="noreferrer">Hướng dẫn</a>
        </nav>
        <div className="studio-header__actions">
          <button type="button" className="studio-button studio-button--templates" onClick={() => setNewProjectOpen(true)}><span>＋</span> Mẫu soạn</button>
          {readyDocx ? (
            <a className="studio-button studio-button--word" href={readyDocx.url} download={readyDocx.fileName} onClick={() => notify('Đang tải ZIP 3 bản Word về máy')} title="Tải ZIP 3 bản Word (đề · lời giải · đáp án)"><span>W</span> Tải Word</a>
          ) : (
            <button type="button" className="studio-button studio-button--word" onClick={exportWord} disabled={docxExporting} title="Pro · Xuất 3 bản Word (đề học sinh · đề+lời giải · đề+đáp án) trong 1 ZIP. Văn bản sửa được, toán là Equation, CeTZ là ảnh"><span>W</span> {docxExporting ? 'Đang tạo Word…' : 'Xuất Word (3 bản)'}</button>
          )}
          <div className="export-menu">
            <button type="button" className="studio-button studio-button--primary" onClick={() => requestCompile('pdf', 'pdf')} disabled={compileStatus === 'compiling'}>Xuất PDF <span>↓</span></button>
            <div><button type="button" onClick={exportSvg}>Xuất SVG</button><button type="button" onClick={exportPng}>Xuất PNG</button></div>
          </div>
          <details className="studio-more-menu">
            <summary className="studio-button" title="Mở các công cụ ít dùng hơn">Thêm <span>⌄</span></summary>
            <div>
              <button type="button" onClick={() => setCatalogOpen(true)}><span>S</span><b>Kho lệnh</b><small>Chèn nhanh công thức và thành phần</small></button>
              <button type="button" onClick={() => setThemeDesignerOpen(true)}><span>✦</span><b>Giao diện đề</b><small>{examThemeState.id || 'Chọn màu và phong cách'}</small></button>
              <button type="button" onClick={() => setSnapshotOpen(true)}><span>↶</span><b>Lịch sử</b><small>Mở các bản lưu trước đó</small></button>
              <button type="button" onClick={handleExportZip}><span>ZIP</span><b>Sao lưu dự án</b><small>Tải toàn bộ tệp về máy</small></button>
              <button type="button" onClick={() => setTheme(value => value === 'dark' ? 'light' : 'dark')}><span>{theme === 'dark' ? '☀' : '☾'}</span><b>Giao diện Studio</b><small>Đổi sang nền {theme === 'dark' ? 'sáng' : 'tối'}</small></button>
            </div>
          </details>
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
                <button type="button" className={sidebarMode === 'math' ? 'is-active' : ''} onClick={() => setSidebarMode('math')} title="Ký hiệu & Emoji">🧮</button>
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
                {sidebarMode === 'packages' && <div className="sidebar-tool package-center">
                  <span className="sidebar-heading-simple">SANG MATH CENTER</span>
                  <div className={`installed-package package-${packageNeedsUpgrade ? 'legacy' : packageHealth.mode}`}><span>{packageNeedsUpgrade ? '!' : '✓'}</span><div><b>sang-math <em>OFFICIAL</em></b><small>{SANG_MATH_VERSION} · Typst Universe</small></div><a href={SANG_MATH_UNIVERSE_URL} target="_blank" rel="noreferrer" title="Mở Typst Universe">↗</a></div>
                  <div className={`package-health package-health--${packageNeedsUpgrade ? 'legacy' : packageHealth.mode}`}>
                    <span>{packageNeedsUpgrade ? 'CẦN NÂNG CẤP' : packageHealth.mode === 'official' ? 'DỰ ÁN CHUẨN PUBLIC' : packageHealth.mode === 'extension' ? 'STUDIO EXTENSION' : 'CHƯA IMPORT'}</span>
                    <p>{packageHealth.legacyImports ? `Còn ${packageHealth.legacyImports} đường dẫn nội bộ cũ.` : packageHealth.outdatedImports ? `Còn ${packageHealth.outdatedImports} import sang-math phiên bản cũ.` : packageHealth.mode === 'official' ? `Đã nhận ${packageHealth.officialImports} import chính thức.` : packageHealth.mode === 'extension' ? 'Beamer dùng extension riêng; API Toán vẫn từ Universe.' : 'Chèn import chính thức khi bắt đầu dùng Sang Math.'}</p>
                    {packageNeedsUpgrade && <button type="button" onClick={upgradePackageImports}>Nâng cấp an toàn →</button>}
                  </div>
                  <div className="package-actions"><button type="button" onClick={copyOfficialImport}>Sao chép import</button><a href={SANG_MATH_UNIVERSE_URL} target="_blank" rel="noreferrer">Trang package ↗</a></div>
                  <div className="sidebar-search-input macro-search"><span>S</span><input value={macroSearch} onChange={event => setMacroSearch(event.target.value)} placeholder="Tìm macro để chèn…" /></div>
                  <div className="sidebar-macro-list">{searchSangMathCatalog(macroSearch).slice(0, 9).map(item => <button type="button" key={item.id} onClick={() => insertSnippet(item)}><span><b>{item.name}</b><small>{item.signature}</small></span><i>＋</i></button>)}</div>
                  <button type="button" className="sidebar-catalog-button" onClick={() => setCatalogOpen(true)}>Xem toàn bộ {SANG_MATH_CATALOG.length} lệnh <span>→</span></button>
                  <p className="sidebar-note">Dự án public dùng <code>{SANG_MATH_IMPORT}</code>. Package được cache sau lần tải đầu tiên.</p>
                </div>}
                {sidebarMode === 'math' && <div className="sidebar-tool math-tool">
                  <span className="sidebar-heading-simple">KÝ HIỆU & EMOJI</span>
                  <div className="math-sidebar-select-wrapper">
                    <select className="math-sidebar-select" value={mathToolbarTab} onChange={e => setMathToolbarTab(e.target.value)}>
                      <optgroup label="Ký hiệu Toán">
                        {MATH_SYMBOL_CATEGORIES.map(cat => <option key={cat.id} value={cat.id}>{cat.label}</option>)}
                      </optgroup>
                      <optgroup label="Emoji">
                        {EMOJI_CATEGORIES.map(cat => <option key={cat.id} value={cat.id}>{cat.label}</option>)}
                      </optgroup>
                    </select>
                  </div>
                  <div className="math-sidebar-content">
                    {MATH_SYMBOL_CATEGORIES.concat(EMOJI_CATEGORIES).find(c => c.id === mathToolbarTab)?.symbols.map((sym, idx) => (
                      <button type="button" key={idx} onClick={() => insertSnippet({ ...sym, isMathSymbol: true })} title={sym.label}>
                        {sym.icon}
                      </button>
                    ))}
                  </div>
                </div>}
                {sidebarMode === 'cloud' && <div className="sidebar-tool cloud-sync-tool">
                  <span className="sidebar-heading-simple">ĐỒNG BỘ ĐÁM MÂY</span>
                  {authLoading ? (
                    <div className="cloud-loading" style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', height: '180px', gap: '12px', color: 'var(--text-secondary)' }}>
                      <span className="spinner" style={{ border: '2px solid rgba(255,255,255,0.1)', borderTop: '2px solid var(--studio-orange)', borderRadius: '50%', width: '24px', height: '24px', animation: 'spin 0.8s linear infinite' }} />
                      <b style={{ fontSize: '12.5px' }}>{authStatusText || 'Đang kết nối...'}</b>
                    </div>
                  ) : currentUser ? (
                    <div className="cloud-panel">
                      <div className="cloud-user">
                        <div className="cloud-user__avatar">
                          <img src={currentUser.photoURL || 'https://www.gravatar.com/avatar/?d=mp'} alt="avatar" />
                        </div>
                        <div className="cloud-user__info">
                          <span className="cloud-user__name">{currentUser.displayName || 'Giáo viên'}</span>
                          <span className="cloud-user__email">{currentUser.email}</span>
                          <span className={`cloud-chip ${isCloudPro ? 'cloud-chip--pro' : 'cloud-chip--free'}`}>{isCloudPro ? '♛ STUDIO PRO · CLOUD' : 'FREE · LƯU TRÊN MÁY'}</span>
                        </div>
                      </div>

                      {!isCloudPro && (
                        <div className="cloud-store" style={{ background: 'var(--bg-card)', borderColor: 'var(--studio-line)' }}>
                          <div className="cloud-store__body">
                            <b>Studio Free vẫn dùng đầy đủ trên máy này</b>
                            <small>Dự án tự lưu bằng IndexedDB, nhập tệp và xuất ZIP/PDF về máy. Không nội dung nào gửi lên Cloud.</small>
                            <button type="button" className="cloud-save__btn" style={{ marginTop: '8px' }} onClick={() => setUpgradeDialogOpen(true)}>Nâng cấp Studio Pro</button>
                          </div>
                        </div>
                      )}

                      {isCloudPro && (
                        <>
                          <div className="cloud-store">
                            <div className="cloud-store__num">{cloudProjects.length}</div>
                            <div className="cloud-store__body">
                              <b>{cloudProjects.length ? 'dự án trong kho Cloud riêng' : 'Kho Cloud riêng đang trống'}</b>
                              <small>Lưu dự án để mở lại trên thiết bị khác. Studio vẫn tự lưu cục bộ; Cloud chỉ ghi khi bạn bấm nút.</small>
                            </div>
                          </div>

                          <div className="cloud-save">
                            <button
                              type="button"
                              className="cloud-save__btn"
                              disabled={!project || syncingProjectId === project.id}
                              onClick={saveCurrentProjectToCloud}
                            >
                              {syncingProjectId === project?.id ? 'Đang lưu lên Cloud…' : '☁ Lưu dự án hiện tại lên Cloud'}
                            </button>
                            <span className="cloud-save__note">Cloud không tự ghi. Chỉ nút này mới tạo hoặc cập nhật bản Cloud.</span>
                          </div>

                          <div className="cloud-projects">
                            <div className="cloud-projects__head">
                              <span>DỰ ÁN TRÊN ĐÁM MÂY</span>
                              <span className="cloud-projects__count">{cloudProjects.length}</span>
                            </div>
                            <div className="cloud-projects__list">
                              {cloudProjects.map(cp => {
                                const isSyncing = syncingProjectId === cp.id
                                const isLocalSame = project?.id === cp.id
                                return (
                                  <div key={cp.id} className="cloud-proj">
                                    <div className="cloud-proj__info">
                                      <span className="cloud-proj__name">{cp.name}</span>
                                      <span className="cloud-proj__meta">{new Date(cp.updatedAt).toLocaleDateString('vi-VN')} {new Date(cp.updatedAt).toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' })} · {formatBytes(cp.estimatedSizeBytes || 0)}</span>
                                    </div>
                                    <div className="cloud-proj__actions">
                                      <button type="button" className={`cloud-proj__btn ${isLocalSame ? 'cloud-proj__btn--open' : 'cloud-proj__btn--load'}`} disabled={isSyncing || isLocalSame} onClick={() => loadCloudProjectToLocal(cp)}>
                                        {isLocalSame ? 'Đang mở' : 'Tải về'}
                                      </button>
                                      <button type="button" className="cloud-proj__btn cloud-proj__btn--del" onClick={() => handleCloudDelete(cp.id)}>
                                        Xóa
                                      </button>
                                    </div>
                                  </div>
                                )
                              })}
                              {!cloudProjects.length && (
                                <div className="cloud-empty">
                                  <b>Chưa có dự án nào</b>
                                  <span>Bấm “Lưu dự án hiện tại lên Cloud” để tạo bản đầu tiên.</span>
                                </div>
                              )}
                            </div>
                          </div>
                        </>
                      )}

                      <button type="button" className="cloud-signout" onClick={firebaseSignOut}>Đăng xuất tài khoản</button>
                    </div>
                  ) : (
                    <div className="cloud-login-prompt" style={{ display: 'flex', flexDirection: 'column', gap: '14px', padding: '10px 4px', textAlign: 'center' }}>
                      <p style={{ fontSize: '12px', lineHeight: '1.5', color: 'var(--text-secondary)', textAlign: 'left', margin: 0 }}>Đăng nhập để kiểm tra quyền Studio Pro. Tài khoản chưa nâng cấp vẫn sử dụng Studio Free và lưu dự án cục bộ bằng IndexedDB.</p>
                      {authError && <div className="auth-error-msg" style={{ background: 'rgba(239,68,68,0.1)', color: '#ef4444', padding: '8px', borderRadius: '5px', fontSize: '11px', textAlign: 'left' }}>{authError}</div>}
                      <button type="button" className="cloud-signin-btn" onClick={handleGoogleSignIn} style={{ width: '100%', background: 'var(--studio-orange)', color: '#fff', border: 'none', padding: '10px', borderRadius: '6px', fontSize: '12.5px', cursor: 'pointer', fontWeight: 'bold', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '6px', boxShadow: '0 2px 8px rgba(249,115,22,0.25)' }}>
                        ✦ Đăng nhập bằng Google
                      </button>
                      <small className="cloud-hint-free" style={{ fontSize: '10px', lineHeight: '1.4', color: 'var(--text-secondary)', textAlign: 'left', display: 'block', marginTop: '4px' }}>
                        Sau khi SePay xác nhận, quyền Pro được kích hoạt tự động theo đúng Gmail thanh toán. Cloud chỉ ghi khi bạn bấm nút lưu.
                      </small>
                    </div>
                  )}
                </div>}
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
              <div className="breadcrumbs"><span>project</span><i>›</i><b>{activeFilePath.replace(/^\/project\//, '').replaceAll('/', ' › ')}</b>{activeFilePath === project.entryPath ? <em>ENTRY · ĐANG XUẤT</em> : activeFile?.kind === 'text' && <button type="button" onClick={setActiveAsEntry}>▶ Đặt làm bản xuất</button>}</div>
              {activeFile?.kind === 'text' ? <>
                <div className="snippet-bar"><span>SANG MATH · SOẠN TRỰC TIẾP</span>{AUTHORING_SNIPPETS.map(snippet => <button type="button" key={snippet.id} onClick={() => insertSnippet(snippet)}>{snippet.label}</button>)}{directExamPath && (isBeamerEntry ? <button type="button" className="snippet-beamer snippet-beamer--back" onClick={switchToDirectExam}>← Về đề A4</button> : <button type="button" className="snippet-beamer" onClick={createOrUpdateBeamer}>▶ Tạo/Cập nhật Beamer</button>)}<button type="button" className="snippet-suggest" onClick={triggerSuggestions}>✦ Gợi ý</button><button type="button" className="snippet-more" onClick={() => setCatalogOpen(true)}>＋ Kho lệnh</button></div>
                <div className="monaco-shell">
                  <Editor
                    path={`file://${activeFilePath}`}
                    language="typst"
                    defaultValue={activeFile.content}
                    onChange={updateActiveFile}
                    beforeMount={registerTypstLanguage}
                    onMount={(editor, monaco) => {
                      editorRef.current = editor
                      monacoRef.current = monaco
                      editor.onDidChangeCursorPosition(event => setEditorPosition({ line: event.position.lineNumber, column: event.position.column }))
                      editor.onKeyDown(event => {
                        const keyboardEvent = event.browserEvent
                        const commandOrControl = keyboardEvent.metaKey || keyboardEvent.ctrlKey
                        const slashKey = keyboardEvent.code === 'Slash' || keyboardEvent.key === '/'
                        if (!commandOrControl || keyboardEvent.shiftKey || !slashKey) return
                        event.preventDefault()
                        event.stopPropagation()
                        editor.trigger('conictypst.keyboard', 'editor.action.commentLine', null)
                      })
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
                {runtimeStatus !== 'ready' && <div className="preview-loading"><span className="spinner" /><b>{runtimeLabel}</b><small>Lần mở đầu, trình duyệt cần tải bộ biên dịch Typst. Các lần sau sẽ mở nhanh hơn.</small></div>}
                {compileStatus === 'error' && <div className="preview-error"><span>!</span><div><b>Typst cần bạn kiểm tra</b><p>{diagnostics[0] ? formatDiagnostic(diagnostics[0]) : 'Có lỗi khi biên dịch tài liệu.'}</p><div><button type="button" onClick={() => setProblemsOpen(true)}>Xem tất cả vấn đề</button>{diagnostics[0] && <button type="button" className="preview-error-ai-btn" onClick={() => requestAiQuickFix(diagnostics[0])}>✦ Sửa bằng AI (Lite)</button>}<button type="button" onClick={() => requestCompile('vector', 'preview')}>Biên dịch lại</button></div></div></div>}
                <div className="preview-scale" style={{ transform: `scale(${zoom})` }}><div ref={previewMountRef} className="preview-mount" onClick={handlePreviewSourceClick} /></div>
              </div>
            </section>
          </Panel>
        </PanelGroup>
      </main>

      <footer className="studio-statusbar">
        <div><span className={`runtime-pill ${runtimeStatus}`}><i />{runtimeLabel}</span><button type="button" onClick={() => setProblemsOpen(true)} className={diagnostics.length ? 'has-problems' : ''}>{diagnostics.length ? `⚠ ${diagnostics.length} vấn đề` : '✓ Không có lỗi'}</button><button type="button" className="command-hint" onClick={() => setCommandOpen(true)}>⌘K Bảng lệnh</button></div>
        <div><span className="local-storage-pill" title={`Bài đang được lưu ngay trong trình duyệt trên máy này, không gửi lên máy chủ${storageInfo.quota ? ` · hạn mức ${formatBytes(storageInfo.quota)}` : ''}`}>◉ LƯU TRÊN MÁY · {formatBytes(storageInfo.usage)}{storageInfo.persisted ? ' · an toàn' : ''}</span><a className="status-package" href={SANG_MATH_UNIVERSE_URL} target="_blank" rel="noreferrer">sang-math {SANG_MATH_VERSION} · Universe ↗</a><span>UTF-8</span><span>Typst</span><span>Ln {editorPosition.line}, Col {editorPosition.column}</span></div>
      </footer>

      <ProjectDialog open={newProjectOpen} onClose={() => setNewProjectOpen(false)} onCreate={createAndOpenProject} />
      {snapshotOpen && <SnapshotDialog project={project} onClose={() => setSnapshotOpen(false)} onCreate={makeSnapshot} onRestore={restoreProjectSnapshot} />}
      <CatalogDialog open={catalogOpen} onClose={() => setCatalogOpen(false)} onInsert={insertSnippet} />
      <ThemeDialog open={themeDesignerOpen} currentTheme={examThemeState.id} available={Boolean(examThemeState.path)} onClose={() => setThemeDesignerOpen(false)} onApply={applyExamTheme} />
      <CommandPalette open={commandOpen} onClose={() => setCommandOpen(false)} actions={commandActions} />
      <ProblemsDialog open={problemsOpen} diagnostics={diagnostics} onClose={() => setProblemsOpen(false)} onSelect={item => { setProblemsOpen(false); goToLocation(item.file, item.start?.line || item.startLine, item.start?.column || item.startColumn) }} onAiFix={item => { setProblemsOpen(false); requestAiQuickFix(item); }} />
      <AiQuickFixDialog open={aiQuickFixOpen} diagnostic={aiQuickFixDiagnostic} project={project} activeFilePath={activeFilePath} onClose={() => setAiQuickFixOpen(false)} onApply={applyQuickFix} />
      <UpgradeDialog open={upgradeDialogOpen} onClose={() => setUpgradeDialogOpen(false)} onUpgrade={onUpgrade} onLogin={handleGoogleSignIn} currentUser={currentUser} authLoading={authLoading} isPro={isCloudPro} />
      <ProHonorDialog open={proHonorOpen} onClose={() => setProHonorOpen(false)} onCloud={() => setSidebarMode('cloud')} />
      {toast && <div className={`studio-toast ${toast.tone}`}><span>{toast.tone === 'error' ? '!' : '✓'}</span>{toast.message}</div>}
      <button type="button" className="danger-project-delete" onClick={removeCurrentProject} title="Xóa dự án hiện tại">Xóa dự án</button>
    </div>
  )
}
