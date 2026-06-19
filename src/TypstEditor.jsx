/**
 * TypstEditor — Monaco + Typst WASM live preview
 * Standalone, không phụ thuộc Tailwind hay framework nào thêm.
 */
import React, { startTransition, useCallback, useEffect, useMemo, useRef, useState } from 'react'
import Editor from '@monaco-editor/react'
import { Panel, Group as PanelGroup, Separator as PanelResizeHandle } from 'react-resizable-panels'
import {
  createFileTree,
  defaultEntryPath,
  defaultExpandedFolderPaths,
  defaultOpenTabs,
  getFileName,
  initialWorkspaceFiles,
  starterFilePaths,
  stripWorkspaceRoot,
  workspaceMode,
} from './typstWorkspace.js'
import { useTheme } from './editor/hooks/useTheme.js'
import { useAutoSave } from './editor/hooks/useAutoSave.js'
import { useKeyboardShortcuts } from './editor/hooks/useKeyboardShortcuts.js'
import { rendererWasmUrl } from './typstBundle.js'
import CommandPalette from './editor/CommandPalette.jsx'
import './TypstEditor.css'
import patrickHandRegularUrl from './assets/fonts/patrick-hand/PatrickHand-Regular.ttf?url'
import hp0015HangNormalUrl from '../fonts/HP001_5_hang_normal.otf?url'

const COMPILE_DEBOUNCE_MS = 180
const MIN_SOURCE_NAV_TEXT_LENGTH = 4
const MAX_SOURCE_NAV_TEXT_LENGTH = 180
const MENU_ITEMS = ['File', 'Edit', 'Selection', 'View', 'Go', 'Run', 'Terminal', 'Help']
const ACTIVITY_ITEMS = [
  { id: 'explorer', glyph: 'EX', label: 'Explorer' },
  { id: 'search', glyph: 'SR', label: 'Search' },
  { id: 'source-control', glyph: 'SC', label: 'Changes' },
  { id: 'preview', glyph: 'PR', label: 'Preview' },
]
const AUTHORING_ACTIONS = [
  {
    id: 'heading',
    label: 'H1',
    title: 'Chen section',
    buildText: selectedText => `= ${selectedText || 'Section title'}\n\n`,
  },
  {
    id: 'subheading',
    label: 'H2',
    title: 'Chen subsection',
    buildText: selectedText => `== ${selectedText || 'Subsection'}\n\n`,
  },
  {
    id: 'math',
    label: 'Math',
    title: 'Chen cong thuc',
    buildText: selectedText => `$\n  ${selectedText || 'f(x) = x^2 + 1'}\n$\n`,
  },
  {
    id: 'figure',
    label: 'Fig',
    title: 'Chen figure',
    buildText: selectedText => `#figure(\n  image("${selectedText || 'image.png'}"),\n  caption: [Caption],\n)\n`,
  },
  {
    id: 'table',
    label: 'Tbl',
    title: 'Chen bang',
    buildText: () => '#table(\n  columns: 3,\n  [A], [B], [C],\n  [1], [2], [3],\n)\n',
  },
  {
    id: 'note',
    label: 'Note',
    title: 'Chen callout',
    buildText: selectedText => `#block(\n  fill: rgb("#112235"),\n  inset: 14pt,\n  radius: 10pt,\n)[\n  ${selectedText || 'Highlight this idea'}\n]\n`,
  },
]

const CUSTOM_TYPST_FONT_URLS = [patrickHandRegularUrl, hp0015HangNormalUrl]

// ── Typst WASM singleton ────────────────────────────────────────────────────
let _compilerPromise = null

async function getCompiler() {
  if (_compilerPromise) return _compilerPromise
  _compilerPromise = (async () => {
    const {
      createTypstCompiler,
      FetchPackageRegistry,
      loadFonts,
      MemoryAccessModel,
      withAccessModel,
      withPackageRegistry,
      compilerWasmUrl,
    } = await import('./typstBundle.js')

    const packageAccessModel = new MemoryAccessModel()
    const compiler = createTypstCompiler()
    await compiler.init({
      getModule: () => compilerWasmUrl,
      beforeBuild: [
        withAccessModel(packageAccessModel),
        withPackageRegistry(new FetchPackageRegistry(packageAccessModel)),
        loadFonts(CUSTOM_TYPST_FONT_URLS, { assets: ['text'] }),
      ],
    })
    return compiler
  })()
  return _compilerPromise
}

let _renderer = null
async function getRenderer() {
  if (_renderer) return _renderer
  const { createTypstRenderer, rendererWasmUrl } = await import('./typstBundle.js')
  _renderer = createTypstRenderer()
  await _renderer.init({ getModule: () => rendererWasmUrl })
  return _renderer
}

// ── Typst syntax highlight (Monaco) ────────────────────────────────────────
function registerTypst(monaco) {
  if (monaco.languages.getLanguages().some(l => l.id === 'typst')) return
  monaco.languages.register({ id: 'typst', extensions: ['.typ'], aliases: ['Typst'] })
  monaco.languages.setMonarchTokensProvider('typst', {
    defaultToken: '',
    keywords: ['let', 'set', 'show', 'import', 'include', 'if', 'else', 'for', 'while',
      'break', 'continue', 'return', 'in', 'not', 'and', 'or', 'none', 'auto', 'true', 'false', 'as', 'from'],
    builtins: ['align', 'block', 'box', 'circle', 'cite', 'columns', 'emph', 'figure',
      'footnote', 'grid', 'heading', 'image', 'line', 'link', 'list', 'lorem', 'outline',
      'page', 'pagebreak', 'par', 'place', 'raw', 'rect', 'ref', 'rotate', 'scale',
      'smallcaps', 'square', 'stack', 'strike', 'strong', 'sub', 'super', 'table',
      'text', 'underline', 'upper', 'v', 'h', 'linebreak', 'parbreak', 'math'],
    tokenizer: {
      root: [
        [/^=+\s.*$/, 'keyword.heading'],
        [/\/\/.*$/, 'comment'],
        [/\/\*/, 'comment', '@comment'],
        [/```[\s\S]*?```/, 'string'],
        [/`[^`]*`/, 'string'],
        [/\$[^$]+\$/, 'number'],
        [/"[^"]*"/, 'string'],
        [/#[a-zA-Z_][a-zA-Z0-9_-]*/, { cases: { '@builtins': 'type', '@keywords': 'keyword', '@default': 'variable' } }],
        [/\b(?:let|set|show|import|include|if|else|for|while|break|continue|return|in|not|and|or|none|auto|true|false|as|from)\b/, 'keyword'],
        [/[0-9]+(\.[0-9]+)?(pt|mm|cm|em|%)?/, 'number'],
        [/\*[^*\n]+\*/, 'strong'],
        [/_[^_\n]+_/, 'emphasis'],
      ],
      comment: [
        [/[^/*]+/, 'comment'],
        [/\*\//, 'comment', '@pop'],
        [/[/*]/, 'comment'],
      ],
    },
  })
  monaco.languages.setLanguageConfiguration('typst', {
    comments: { lineComment: '//', blockComment: ['/*', '*/'] },
    brackets: [['{', '}'], ['[', ']'], ['(', ')']],
    autoClosingPairs: [
      { open: '{', close: '}' }, { open: '[', close: ']' }, { open: '(', close: ')' },
      { open: '"', close: '"' }, { open: '$', close: '$' },
    ],
    surroundingPairs: [
      { open: '{', close: '}' }, { open: '[', close: ']' }, { open: '(', close: ')' },
      { open: '"', close: '"' }, { open: '$', close: '$' }, { open: '*', close: '*' }, { open: '_', close: '_' },
    ],
  })
}

function formatCompileDiagnostics(result) {
  const diagnostics = result?.diagnostics ?? []

  if (diagnostics.length === 0) {
    return 'Lỗi biên dịch không xác định'
  }

  return diagnostics
    .map(diagnostic => {
      const severity = diagnostic?.severity ?? 'error'
      const message = diagnostic?.message ?? 'Lỗi Typst không xác định'
      return `[${severity}] ${message}`
    })
    .join('\n')
}

function formatRuntimeError(error) {
  return error?.message || String(error)
}

function normalizePreviewText(value) {
  return value.replace(/\s+/g, ' ').trim()
}

function isSearchablePreviewText(value) {
  if (value.length < MIN_SOURCE_NAV_TEXT_LENGTH || value.length > MAX_SOURCE_NAV_TEXT_LENGTH) {
    return false
  }

  const meaningfulChars = value.match(/[\p{L}\p{N}]/gu) ?? []
  if (meaningfulChars.length < MIN_SOURCE_NAV_TEXT_LENGTH) {
    return false
  }

  if (/^[A-Z0-9]+$/u.test(value) && meaningfulChars.length <= 4) {
    return false
  }

  return true
}

function buildSourceSearchIndex(source) {
  let normalized = ''
  const offsets = []
  let inWhitespace = false

  for (let index = 0; index < source.length; index += 1) {
    const char = source[index]

    if (/\s/u.test(char)) {
      if (!inWhitespace) {
        normalized += ' '
        offsets.push(index)
      }
      inWhitespace = true
      continue
    }

    inWhitespace = false
    normalized += char
    offsets.push(index)
  }

  return { normalized, offsets }
}

function findCandidateOffsets(searchIndex, candidate, limit = 2) {
  const matches = []
  let cursor = 0

  while (matches.length < limit) {
    const foundAt = searchIndex.normalized.indexOf(candidate, cursor)
    if (foundAt === -1) break

    matches.push(searchIndex.offsets[foundAt] ?? 0)
    cursor = foundAt + Math.max(candidate.length, 1)
  }

  return matches
}

function getLineAndColumn(source, offset) {
  let lineNumber = 1
  let column = 1

  for (let index = 0; index < offset; index += 1) {
    if (source[index] === '\n') {
      lineNumber += 1
      column = 1
    } else {
      column += 1
    }
  }

  return { lineNumber, column }
}

function collectPreviewTextCandidates(target, root) {
  const candidates = []
  const seen = new Set()
  let current = target instanceof Element ? target : target?.parentElement ?? null

  while (current && current !== root) {
    const text = normalizePreviewText(current.textContent ?? '')
    if (isSearchablePreviewText(text) && !seen.has(text)) {
      seen.add(text)
      candidates.push(text)
    }
    current = current.parentElement
  }

  return candidates
}

function getPreviewPointText(event) {
  const fromTextNode = textNode => normalizePreviewText(textNode?.textContent ?? '')

  if (typeof document.caretPositionFromPoint === 'function') {
    const caretPosition = document.caretPositionFromPoint(event.clientX, event.clientY)
    if (caretPosition?.offsetNode?.nodeType === Node.TEXT_NODE) {
      return fromTextNode(caretPosition.offsetNode)
    }
  }

  if (typeof document.caretRangeFromPoint === 'function') {
    const caretRange = document.caretRangeFromPoint(event.clientX, event.clientY)
    if (caretRange?.startContainer?.nodeType === Node.TEXT_NODE) {
      return fromTextNode(caretRange.startContainer)
    }
  }

  return ''
}

function findPreviewSourceLocation(searchIndexByFile, workspaceFiles, candidateTexts, preferredFilePaths) {
  const preferredSet = new Set(preferredFilePaths)
  const orderedFilePaths = [...new Set([...preferredFilePaths, ...Object.keys(workspaceFiles)])]

  for (const candidateText of candidateTexts) {
    const normalizedCandidate = normalizePreviewText(candidateText)
    if (!isSearchablePreviewText(normalizedCandidate)) continue

    const matches = []

    for (const filePath of orderedFilePaths) {
      const searchIndex = searchIndexByFile[filePath]
      if (!searchIndex) continue

      const offsets = findCandidateOffsets(searchIndex, normalizedCandidate)
      for (const offset of offsets) {
        matches.push({ filePath, offset })
      }

      if (matches.length > 2) break
    }

    if (matches.length === 1) {
      return matches[0]
    }

    const preferredMatches = matches.filter(match => preferredSet.has(match.filePath))
    if (preferredMatches.length === 1) {
      return preferredMatches[0]
    }
  }

  return null
}

function getSourceMetrics(source) {
  return {
    lineCount: source.length === 0 ? 1 : source.split('\n').length,
    wordCount: (source.match(/\S+/g) ?? []).length,
    charCount: source.length,
  }
}

function WorkspaceNode({
  node,
  depth,
  activeFilePath,
  entryPath,
  expandedFolderPaths,
  dirtyFileSet,
  onToggleFolder,
  onOpenFile,
}) {
  if (node.type === 'folder') {
    const isRoot = node.path === '/typst'
    const isExpanded = isRoot || expandedFolderPaths.has(node.path)

    return (
      <div className="te-tree-group">
        <button
          type="button"
          className={`te-tree-row te-tree-row--folder ${isExpanded ? 'is-open' : ''}`}
          style={{ paddingLeft: `${12 + depth * 14}px` }}
          onClick={() => {
            if (!isRoot) onToggleFolder(node.path)
          }}
        >
          <span className="te-tree-caret">{isRoot ? '•' : isExpanded ? '▾' : '▸'}</span>
          <span className="te-tree-icon">{isRoot ? 'WS' : 'DIR'}</span>
          <span className="te-tree-label">{node.name}</span>
        </button>

        {isExpanded && node.children.map(child => (
          <WorkspaceNode
            key={child.path}
            node={child}
            depth={depth + 1}
            activeFilePath={activeFilePath}
            entryPath={entryPath}
            expandedFolderPaths={expandedFolderPaths}
            dirtyFileSet={dirtyFileSet}
            onToggleFolder={onToggleFolder}
            onOpenFile={onOpenFile}
          />
        ))}
      </div>
    )
  }

  const isActive = node.path === activeFilePath
  const isEntry = node.path === entryPath
  const isDirty = dirtyFileSet.has(node.path)

  return (
    <button
      type="button"
      className={`te-tree-row te-tree-row--file ${isActive ? 'is-active' : ''}`}
      style={{ paddingLeft: `${12 + depth * 14}px` }}
      onClick={() => onOpenFile(node.path)}
    >
      <span className="te-tree-caret">·</span>
      <span className="te-tree-icon">TYP</span>
      <span className="te-tree-label">{node.name}</span>
      {isDirty && <span className="te-tree-dirty">M</span>}
      {isEntry && <span className="te-tree-pill">entry</span>}
    </button>
  )
}

// ── Component ───────────────────────────────────────────────────────────────
export default function TypstEditor() {
  const [workspaceFiles, setWorkspaceFiles] = useState(() => ({ ...initialWorkspaceFiles }))
  const [activeFilePath, setActiveFilePath] = useState(defaultEntryPath)
  const [entryPath, setEntryPath] = useState(defaultEntryPath)
  const [openTabs, setOpenTabs] = useState(defaultOpenTabs)
  const [expandedFolderPaths, setExpandedFolderPaths] = useState(() => new Set(defaultExpandedFolderPaths))
  const [activeActivity, setActiveActivity] = useState('explorer')
  const [workspaceFilter, setWorkspaceFilter] = useState('')
  const [hasPreview, setHasPreview] = useState(false)
  const [status, setStatus] = useState('loading') // loading|idle|compiling|error
  const [errorMsg, setErrorMsg] = useState('')
  const [zoom, setZoom] = useState(1.0)
  const [wordWrap, setWordWrap] = useState('on')
  const [showMinimap, setShowMinimap] = useState(true)
  const [fontSize, setFontSize] = useState(13)
  const [isRuntimeReady, setIsRuntimeReady] = useState(false)
  const [lastRenderMs, setLastRenderMs] = useState(0)
  const [previewJumpLabel, setPreviewJumpLabel] = useState('')
  const compilerRef = useRef(null)
  const debounceRef = useRef(null)
  const compileRequestRef = useRef(0)
  const hasQueuedInitialCompileRef = useRef(false)
  const previewMountRef = useRef(null)
  const previewSessionRef = useRef(null)
  const editorRef = useRef(null)
  const pendingSelectionRef = useRef(null)

  const { theme, toggleTheme } = useTheme()
  const [commandPaletteOpen, setCommandPaletteOpen] = useState(false)

  const workspaceFilePaths = useMemo(
    () => Object.keys(workspaceFiles).sort((left, right) => left.localeCompare(right)),
    [workspaceFiles],
  )

  const dirtyFilePaths = useMemo(
    () => workspaceFilePaths.filter(filePath => (workspaceFiles[filePath] ?? '') !== (initialWorkspaceFiles[filePath] ?? '')),
    [workspaceFilePaths, workspaceFiles],
  )

  const dirtyFileSet = useMemo(() => new Set(dirtyFilePaths), [dirtyFilePaths])

  const filteredWorkspaceFilePaths = useMemo(() => {
    const query = workspaceFilter.trim().toLowerCase()
    const basePaths = activeActivity === 'source-control' ? dirtyFilePaths : workspaceFilePaths

    if (!query) return basePaths

    return basePaths.filter(filePath => stripWorkspaceRoot(filePath).toLowerCase().includes(query))
  }, [activeActivity, dirtyFilePaths, workspaceFilePaths, workspaceFilter])

  const searchIndexByFile = useMemo(
    () => Object.fromEntries(
      workspaceFilePaths.map(filePath => [filePath, buildSourceSearchIndex(workspaceFiles[filePath] ?? '')]),
    ),
    [workspaceFilePaths, workspaceFiles],
  )

  const workspaceTree = useMemo(
    () => createFileTree(filteredWorkspaceFilePaths),
    [filteredWorkspaceFilePaths],
  )

  const activeSource = workspaceFiles[activeFilePath] ?? ''
  const activeMetrics = useMemo(() => getSourceMetrics(activeSource), [activeSource])
  const activeBreadcrumbs = useMemo(
    () => ['typst', ...stripWorkspaceRoot(activeFilePath).split('/').filter(Boolean)],
    [activeFilePath],
  )
  const sidebarMeta = {
    explorer: {
      title: 'Explorer',
      detail: `${filteredWorkspaceFilePaths.length} file .typ`,
      inputPlaceholder: 'Lọc file Typst...',
    },
    search: {
      title: 'Search',
      detail: 'Tìm nhanh theo tên file hoặc thư mục',
      inputPlaceholder: 'Gõ để tìm trong workspace...',
    },
    'source-control': {
      title: 'Changes',
      detail: dirtyFilePaths.length > 0 ? `${dirtyFilePaths.length} file đã sửa` : 'Workspace đang sạch',
      inputPlaceholder: 'Lọc file đã thay đổi...',
    },
    preview: {
      title: 'Preview',
      detail: 'Luồng preview, export và jump-to-code',
      inputPlaceholder: '',
    },
  }[activeActivity]

  const revealEditorLocation = useCallback((lineNumber, column) => {
    if (!editorRef.current) return false

    editorRef.current.focus()
    editorRef.current.setPosition({ lineNumber, column })
    editorRef.current.setSelection({
      startLineNumber: lineNumber,
      startColumn: column,
      endLineNumber: lineNumber,
      endColumn: column + 1,
    })
    editorRef.current.revealPositionInCenter({ lineNumber, column })
    return true
  }, [])

  // Init WASM compiler + renderer in parallel so the first preview appears sooner.
  useEffect(() => {
    document.documentElement.setAttribute('data-editor-theme', theme)
  }, [theme])

  useEffect(() => {
    let cancelled = false

    Promise.all([getCompiler(), getRenderer()])
      .then(([compiler]) => {
        if (cancelled) return
        compilerRef.current = compiler
        setIsRuntimeReady(true)
        setStatus('idle')
      })
      .catch(error => {
        if (cancelled) return
        setStatus('error')
        setErrorMsg('Lỗi tải WASM: ' + formatRuntimeError(error))
      })

    return () => {
      cancelled = true
    }
  }, [])

  const compileArtifact = useCallback(async (files, mainFilePath, format = 0) => {
    const compiler = compilerRef.current
    if (!compiler) throw new Error('Typst compiler chưa sẵn sàng')

    await compiler.reset()
    for (const [filePath, content] of Object.entries(files)) {
      compiler.addSource(filePath, content)
    }

    return compiler.compile({ mainFilePath, format })
  }, [])

  const compilePreview = useCallback(async (files, mainFilePath) => {
    if (!compilerRef.current || !previewMountRef.current) return

    const requestId = ++compileRequestRef.current
    const startedAt = performance.now()
    setStatus('compiling')
    setErrorMsg('')

    try {
      const result = await compileArtifact(files, mainFilePath)

      if (!result?.result) {
        if (requestId !== compileRequestRef.current) return
        setErrorMsg(formatCompileDiagnostics(result))
        setStatus('error')
        return
      }

      if (requestId !== compileRequestRef.current) return

      const renderer = await getRenderer()
      const data = result.result.slice(0)
      const previewSession = await renderer.createModule(data)
      previewSessionRef.current = previewSession

      await renderer.renderToCanvas({
        renderSession: previewSession,
        container: previewMountRef.current,
        pixelPerPt: 2.5,
        dataSelection: {
          body: true,
          semantics: true,
        },
      })

      if (requestId !== compileRequestRef.current) return

      const elapsedMs = Math.round(performance.now() - startedAt)
      startTransition(() => {
        setHasPreview(true)
        setLastRenderMs(elapsedMs)
        setStatus('idle')
      })
    } catch (error) {
      if (requestId !== compileRequestRef.current) return
      setErrorMsg(formatRuntimeError(error))
      setStatus('error')
    }
  }, [compileArtifact])

  useEffect(() => {
    const pendingSelection = pendingSelectionRef.current
    const editor = editorRef.current

    if (!pendingSelection || !editor || pendingSelection.filePath !== activeFilePath) {
      return undefined
    }

    const frameId = window.requestAnimationFrame(() => {
      const nextSelection = pendingSelectionRef.current
      if (!nextSelection || !editorRef.current || nextSelection.filePath !== activeFilePath) {
        return
      }

      revealEditorLocation(nextSelection.lineNumber, nextSelection.column)
      pendingSelectionRef.current = null
    })

    return () => window.cancelAnimationFrame(frameId)
  }, [activeFilePath, activeSource, revealEditorLocation])

  useEffect(() => {
    if (!isRuntimeReady) return undefined

    if (debounceRef.current) clearTimeout(debounceRef.current)

    const delay = hasQueuedInitialCompileRef.current ? COMPILE_DEBOUNCE_MS : 0
    hasQueuedInitialCompileRef.current = true

    debounceRef.current = window.setTimeout(() => {
      compilePreview(workspaceFiles, entryPath)
    }, delay)

    return () => clearTimeout(debounceRef.current)
  }, [compilePreview, entryPath, isRuntimeReady, workspaceFiles])

  // Export PDF
  const exportPdf = useCallback(async () => {
    if (!compilerRef.current) return

    try {
      if (debounceRef.current) clearTimeout(debounceRef.current)
      setStatus('compiling')

      const result = await compileArtifact(workspaceFiles, entryPath, 1)
      if (!result?.result) throw new Error('Biên dịch PDF thất bại')

      const blob = new Blob([result.result], { type: 'application/pdf' })
      const a = document.createElement('a')
      a.href = URL.createObjectURL(blob)
      a.download = `${getFileName(entryPath).replace(/\.typ$/, '') || 'typst-output'}.pdf`
      a.click()
      URL.revokeObjectURL(a.href)
      setStatus('idle')
    } catch (error) {
      setErrorMsg(formatRuntimeError(error))
      setStatus('error')
    }
  }, [compileArtifact, entryPath, workspaceFiles])

  const exportSvg = useCallback(async () => {
    if (!compilerRef.current) return
    setStatus('compiling')
    setErrorMsg('')
    try {
      const result = await compileArtifact(workspaceFiles, entryPath, 2)
      if (!result?.result) throw new Error('SVG compilation failed')
      const svgStr = new TextDecoder().decode(result.result)
      const blob = new Blob([svgStr], { type: 'image/svg+xml' })
      const a = document.createElement('a')
      a.href = URL.createObjectURL(blob)
      a.download = `${getFileName(entryPath).replace(/\.typ$/, '') || 'output'}.svg`
      a.click()
      URL.revokeObjectURL(a.href)
      setStatus('idle')
    } catch (error) {
      setErrorMsg(error.message)
      setStatus('error')
    }
  }, [compileArtifact, entryPath, workspaceFiles])

  const exportPng = useCallback(async () => {
    if (!compilerRef.current) return
    setStatus('compiling')
    setErrorMsg('')
    try {
      const result = await compileArtifact(workspaceFiles, entryPath, 0)
      if (!result?.result) throw new Error('PNG compilation failed')

      const { createTypstRenderer } = await import('./typstBundle.js')
      const renderer = createTypstRenderer()
      await renderer.init({
        getModule: () => rendererWasmUrl,
      })

      const session = await renderer.createModule(result.result)
      const container = document.createElement('div')
      container.style.width = '2480px'
      container.style.height = '3508px'
      container.style.position = 'absolute'
      container.style.left = '-9999px'
      document.body.appendChild(container)

      await renderer.renderToCanvas({
        renderSession: session,
        container,
        pixelPerPt: 4,
        dataSelection: { body: true, semantics: true },
      })

      const canvas = container.querySelector('canvas')
      if (!canvas) throw new Error('No canvas rendered')

      const blob = await new Promise(resolve => canvas.toBlob(resolve, 'image/png'))
      document.body.removeChild(container)
      if (!blob) throw new Error('PNG export failed')

      const a = document.createElement('a')
      a.href = URL.createObjectURL(blob)
      a.download = `${getFileName(entryPath).replace(/\.typ$/, '') || 'output'}.png`
      a.click()
      URL.revokeObjectURL(a.href)
      setStatus('idle')
    } catch (error) {
      setErrorMsg(error.message)
      setStatus('error')
    }
  }, [compileArtifact, entryPath, workspaceFiles])

  const openFile = useCallback((filePath) => {
    setActiveActivity('explorer')
    setActiveFilePath(filePath)
    setOpenTabs(currentTabs => currentTabs.includes(filePath) ? currentTabs : [...currentTabs, filePath])
  }, [])

  const insertAuthoringTemplate = useCallback((buildText) => {
    const editor = editorRef.current
    const model = editor?.getModel()
    const selection = editor?.getSelection()

    if (!editor || !model || !selection) return

    const selectedText = model.getValueInRange(selection)
    const nextText = buildText(selectedText)
    const startOffset = model.getOffsetAt(selection.getStartPosition())

    editor.executeEdits('typst-authoring', [{
      range: selection,
      text: nextText,
      forceMoveMarkers: true,
    }])

    const nextPosition = model.getPositionAt(startOffset + nextText.length)
    editor.setPosition(nextPosition)
    editor.revealPositionInCenter(nextPosition)
    editor.focus()
  }, [])

  const jumpToPreviewSource = useCallback((event) => {
    const previewRoot = previewMountRef.current
    if (!previewRoot) return

    const target = event.target
    const candidateTexts = [
      getPreviewPointText(event),
      ...collectPreviewTextCandidates(target, previewRoot),
    ].filter((value, index, values) => value && values.indexOf(value) === index)

    if (candidateTexts.length === 0) {
      setPreviewJumpLabel('Preview khong tim duoc text de doi chieu voi source.')
      return
    }

    const match = findPreviewSourceLocation(
      searchIndexByFile,
      workspaceFiles,
      candidateTexts,
      [activeFilePath, entryPath],
    )

    if (!match) {
      setPreviewJumpLabel('Preview khong xac dinh duoc vi tri source cho vung vua click.')
      return
    }

    const source = workspaceFiles[match.filePath] ?? ''
    const { lineNumber, column } = getLineAndColumn(source, match.offset)

    if (match.filePath === activeFilePath) {
      pendingSelectionRef.current = null
      window.requestAnimationFrame(() => {
        revealEditorLocation(lineNumber, column)
      })
    } else {
      pendingSelectionRef.current = { filePath: match.filePath, lineNumber, column }
      openFile(match.filePath)
    }

    setPreviewJumpLabel(`Preview -> ${stripWorkspaceRoot(match.filePath)}:${lineNumber}`)
  }, [activeFilePath, entryPath, openFile, revealEditorLocation, searchIndexByFile, workspaceFiles])

  const closeTab = useCallback((filePath) => {
    setOpenTabs(currentTabs => {
      if (currentTabs.length === 1) return currentTabs

      const nextTabs = currentTabs.filter(path => path !== filePath)
      if (filePath === activeFilePath) {
        setActiveFilePath(nextTabs[nextTabs.length - 1] ?? defaultEntryPath)
      }
      return nextTabs
    })
  }, [activeFilePath])

  const toggleFolder = useCallback((folderPath) => {
    setExpandedFolderPaths(currentFolders => {
      const nextFolders = new Set(currentFolders)

      if (nextFolders.has(folderPath)) {
        nextFolders.delete(folderPath)
      } else {
        nextFolders.add(folderPath)
      }

      return nextFolders
    })
  }, [])

  const updateActiveFile = useCallback((nextValue) => {
    setWorkspaceFiles(currentFiles => {
      const nextSource = nextValue ?? ''
      if (currentFiles[activeFilePath] === nextSource) return currentFiles

      return {
        ...currentFiles,
        [activeFilePath]: nextSource,
      }
    })
  }, [activeFilePath])

  const resetWorkspace = useCallback(() => {
    setWorkspaceFiles({ ...initialWorkspaceFiles })
    setActiveFilePath(defaultEntryPath)
    setEntryPath(defaultEntryPath)
    setOpenTabs(defaultOpenTabs)
    setExpandedFolderPaths(new Set(defaultExpandedFolderPaths))
    setActiveActivity('explorer')
    setWorkspaceFilter('')
    setErrorMsg('')
    setPreviewJumpLabel('')
    setLastRenderMs(0)
  }, [])

  const addProject = useCallback((name, entryPath) => {
    try {
      const raw = window.localStorage.getItem('conictypst.editor.recent.projects')
      const projects = raw ? JSON.parse(raw) : []
      const filtered = projects.filter(p => p.entryPath !== entryPath)
      filtered.unshift({ name, entryPath, openedAt: Date.now() })
      window.localStorage.setItem('conictypst.editor.recent.projects', JSON.stringify(filtered.slice(0, 10)))
    } catch {}
  }, [])

  const getRecentProjects = useCallback(() => {
    try {
      return JSON.parse(window.localStorage.getItem('conictypst.editor.recent.projects') || '[]')
    } catch { return [] }
  }, [])

  useAutoSave(activeFilePath, entryPath)
  useKeyboardShortcuts({
    onSave: () => {},
    onExportPdf: exportPdf,
    onToggleTheme: toggleTheme,
    onToggleCommandPalette: () => setCommandPaletteOpen(o => !o),
    onZoomIn: () => setZoom(z => Math.min(3.0, +(z + 0.1).toFixed(1))),
    onZoomOut: () => setZoom(z => Math.max(0.3, +(z - 0.1).toFixed(1))),
  })

  const handleCommandPalette = useCallback((commandId, payload) => {
    switch (commandId) {
      case 'export-pdf': exportPdf(); break
      case 'export-svg': exportSvg().catch(e => setErrorMsg(e.message)); break
      case 'export-png': exportPng().catch(e => setErrorMsg(e.message)); break
      case 'toggle-theme': toggleTheme(); break
      case 'toggle-minimap': setShowMinimap(v => !v); break
      case 'toggle-wrap': setWordWrap(v => v === 'on' ? 'off' : 'on'); break
      case 'zoom-in': setZoom(z => Math.min(3.0, +(z + 0.1).toFixed(1))); break
      case 'zoom-out': setZoom(z => Math.max(0.3, +(z - 0.1).toFixed(1))); break
      case 'reset-zoom': setZoom(1.0); break
      case 'reset-workspace': resetWorkspace(); break
      case 'open-recent': if (payload?.entryPath) { setEntryPath(payload.entryPath); setActiveFilePath(payload.entryPath) }; break
    }
  }, [exportPdf, exportSvg, exportPng, toggleTheme, resetWorkspace])

  useEffect(() => {
    if (entryPath) {
      addProject(getFileName(entryPath).replace(/\.typ$/, ''), entryPath)
    }
  }, [entryPath, addProject])

  const statusLabel = {
    loading: '⏳ Đang tải WASM…',
    idle: '● Sẵn sàng',
    compiling: '◌ Đang render…',
    error: '✕ Lỗi',
  }[status]

  const recentProjects = useMemo(() => getRecentProjects(), [])

  return (
    <div className="te-root">
      {/* App Header (Logo, Controls) */}
      <header className="te-app-header">
        <div className="te-header-left">
          <span className="te-logo">ConicTypst</span>
          <span className={`te-status te-status--${status}`}>{statusLabel}</span>
        </div>
        
        <div className="te-header-center">
           <span style={{color: 'var(--text-muted)', fontSize: '12px'}}>Entry:</span>
           <select 
             style={{
               background: 'transparent', color: 'var(--text-main)', border: '1px solid var(--border-light)', 
               borderRadius: '4px', padding: '2px 6px', fontSize: '12px', outline: 'none'
             }}
             value={entryPath} 
             onChange={event => setEntryPath(event.target.value)}
           >
             {workspaceFilePaths.map(filePath => (
               <option key={filePath} value={filePath} style={{background: 'var(--app-bg)'}}>
                 {stripWorkspaceRoot(filePath)}
               </option>
             ))}
           </select>
        </div>

        <div className="te-header-right">
          <button type="button" className="te-btn te-btn--ghost" onClick={exportSvg} disabled={status === 'loading' || status === 'compiling'} title="Export SVG">SVG</button>
          <button type="button" className="te-btn te-btn--ghost" onClick={exportPng} disabled={status === 'loading' || status === 'compiling'} title="Export PNG">PNG</button>
          <button type="button" className="te-btn te-btn--primary" onClick={exportPdf} disabled={status === 'loading' || status === 'compiling'} title="Download PDF">↓ PDF</button>
          <button type="button" className="te-btn te-btn--ghost" onClick={toggleTheme} title="Toggle theme (⌘B)">
            {theme === 'dark' ? '☀' : '☾'}
          </button>
          <button type="button" className="te-btn te-btn--ghost" onClick={() => setCommandPaletteOpen(true)} title="Command palette (⌘K)">⌘K</button>
        </div>
      </header>

      {/* Main Panels */}
      <PanelGroup direction="horizontal" className="te-panels">
        {/* Sidebar (File Explorer) */}
        <Panel defaultSize={16} minSize={12} maxSize={25}>
          <aside className="te-pane te-sidebar">
            <div className="te-tree">
              {filteredWorkspaceFilePaths.length > 0 ? (
                <WorkspaceNode
                  node={workspaceTree}
                  depth={0}
                  activeFilePath={activeFilePath}
                  entryPath={entryPath}
                  expandedFolderPaths={expandedFolderPaths}
                  dirtyFileSet={dirtyFileSet}
                  onToggleFolder={toggleFolder}
                  onOpenFile={openFile}
                />
              ) : (
                <div style={{padding: '12px', color: 'var(--text-muted)', fontSize: '12px'}}>Không có file nào.</div>
              )}
            </div>
          </aside>
        </Panel>

        <PanelResizeHandle className="te-handle" />

        {/* Editor Pane */}
        <Panel defaultSize={42} minSize={20}>
          <section className="te-pane te-editor-wrapper">
            <div className="te-editor-header">
               <span className="te-editor-filepath">
                 {stripWorkspaceRoot(activeFilePath).split('/').map((seg, i, arr) => (
                    <React.Fragment key={i}>
                      {i === arr.length - 1 ? <span className="te-editor-filename">{seg}</span> : <>{seg} / </>}
                    </React.Fragment>
                 ))}
               </span>
               {dirtyFileSet.has(activeFilePath) && <span style={{width: 6, height: 6, borderRadius: '50%', background: '#f48771'}} title="Unsaved changes"></span>}
            </div>

            <div className="te-authoring-bar">
              {AUTHORING_ACTIONS.map(action => (
                <button
                  key={action.id}
                  type="button"
                  className="te-authoring-btn"
                  onClick={() => insertAuthoringTemplate(action.buildText)}
                  title={action.title}
                >
                  {action.label}
                </button>
              ))}
            </div>

            <div className="te-editor-shell">
              <Editor
                path={activeFilePath}
                height="100%"
                defaultLanguage="typst"
                value={activeSource}
                onChange={updateActiveFile}
                onMount={(editor, monaco) => {
                  editorRef.current = editor
                  registerTypst(monaco)
                }}
                theme={theme === 'dark' ? 'vs-dark' : 'vs'}
                options={{
                  fontSize,
                  lineHeight: 1.6,
                  minimap: { enabled: false },
                  scrollBeyondLastLine: false,
                  wordWrap,
                  tabSize: 2,
                  fontFamily: '"JetBrains Mono","Cascadia Code","Fira Code",monospace',
                  fontLigatures: true,
                  automaticLayout: true,
                  smoothScrolling: true,
                  cursorBlinking: 'smooth',
                  cursorSmoothCaretAnimation: 'on',
                  renderLineHighlight: 'all',
                  renderWhitespace: 'selection',
                  bracketPairColorization: { enabled: true },
                  guides: { indentation: true, bracketPairs: true },
                  folding: true,
                  stickyScroll: { enabled: true },
                  overviewRulerBorder: false,
                  padding: { top: 16, bottom: 16 },
                }}
              />
            </div>
          </section>
        </Panel>

        <PanelResizeHandle className="te-handle" />

        {/* Preview Pane */}
        <Panel defaultSize={42} minSize={20}>
          <section className="te-pane te-preview-wrapper">
            <div className="te-preview">
              <div
                className="te-preview-stage"
                style={{ transform: `scale(${zoom})` }}
              >
                <div
                  ref={previewMountRef}
                  className="te-preview-mount"
                  onClick={jumpToPreviewSource}
                />
              </div>
            </div>
            
            <div className="te-zoom-controls">
              <button type="button" onClick={() => setZoom(z => Math.max(0.3, +(z - 0.1).toFixed(1)))}>−</button>
              <span>{Math.round(zoom * 100)}%</span>
              <button type="button" onClick={() => setZoom(z => Math.min(3.0, +(z + 0.1).toFixed(1)))}>+</button>
            </div>
          </section>
        </Panel>
      </PanelGroup>

      <CommandPalette
        open={commandPaletteOpen}
        onClose={() => setCommandPaletteOpen(false)}
        onCommand={handleCommandPalette}
        recentProjects={recentProjects}
      />
    </div>
  )
}
