/**
 * TypstEditor — Monaco + Typst WASM live preview
 * Standalone, không phụ thuộc Tailwind hay framework nào thêm.
 */
import React, { useCallback, useEffect, useRef, useState } from 'react'
import Editor from '@monaco-editor/react'
import { Panel, Group as PanelGroup, Separator as PanelResizeHandle } from 'react-resizable-panels'
import './TypstEditor.css'

// ── Typst WASM singleton ────────────────────────────────────────────────────
let _compilerPromise = null

async function getCompiler() {
  if (_compilerPromise) return _compilerPromise
  _compilerPromise = (async () => {
    const { createTypstCompiler, loadFonts } = await import(
      '@myriaddreamin/typst.ts/dist/esm/main.mjs'
    )
    const compiler = createTypstCompiler()
    await compiler.init({
      beforeBuild: [loadFonts([], { assets: ['text'] })],
    })
    return compiler
  })()
  return _compilerPromise
}

let _renderer = null
async function getRenderer() {
  if (_renderer) return _renderer
  const { createTypstRenderer } = await import(
    '@myriaddreamin/typst.ts/dist/esm/main.mjs'
  )
  _renderer = createTypstRenderer()
  await _renderer.init()
  return _renderer
}

// ── Typst syntax highlight (Monaco) ────────────────────────────────────────
function registerTypst(monaco) {
  if (monaco.languages.getLanguages().some(l => l.id === 'typst')) return
  monaco.languages.register({ id: 'typst', extensions: ['.typ'], aliases: ['Typst'] })
  monaco.languages.setMonarchTokensProvider('typst', {
    defaultToken: '',
    keywords: ['let','set','show','import','include','if','else','for','while',
      'break','continue','return','in','not','and','or','none','auto','true','false','as','from'],
    builtins: ['align','block','box','circle','cite','columns','emph','figure',
      'footnote','grid','heading','image','line','link','list','lorem','outline',
      'page','pagebreak','par','place','raw','rect','ref','rotate','scale',
      'smallcaps','square','stack','strike','strong','sub','super','table',
      'text','underline','upper','v','h','linebreak','parbreak','math'],
    tokenizer: {
      root: [
        [/^=+\s.*$/, 'keyword.heading'],
        [/\/\/.*$/, 'comment'],
        [/\/\*/, 'comment', '@comment'],
        [/```[\s\S]*?```/, 'string'],
        [/`[^`]*`/, 'string'],
        [/\$[^$]+\$/, 'number'],
        [/"[^"]*"/, 'string'],
        [/#[a-zA-Z_][a-zA-Z0-9_-]*/, { cases: { '@builtins': 'type', '@keywords': 'keyword', '@default': 'variable' }}],
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
    brackets: [['{','}'],['[',']'],['(',')']],
    autoClosingPairs: [
      {open:'{',close:'}'},{open:'[',close:']'},{open:'(',close:')'},
      {open:'"',close:'"'},{open:'$',close:'$'},
    ],
    surroundingPairs: [
      {open:'{',close:'}'},{open:'[',close:']'},{open:'(',close:')'},
      {open:'"',close:'"'},{open:'$',close:'$'},{open:'*',close:'*'},{open:'_',close:'_'},
    ],
  })
}

// ── Default source ──────────────────────────────────────────────────────────
const DEFAULT = `#set page(width: 160mm, height: auto, margin: 1.5cm)
#set text(font: "Linux Libertine", size: 11pt)
#set heading(numbering: "1.")

= Xin chào Typst!

Đây là trình soạn thảo *Typst* chạy hoàn toàn trên trình duyệt
nhờ *WebAssembly*. Sửa code bên trái, preview cập nhật ngay bên phải.

== Công thức toán

Phương trình bậc hai: $ x = frac(-b plus.minus sqrt(b^2 - 4 a c), 2 a) $

Tích phân Gauss: $ integral_(-oo)^(+oo) e^(-x^2) d x = sqrt(pi) $

== Bảng

#table(
  columns: 3,
  [*STT*], [*Họ tên*], [*Điểm*],
  [1], [Nguyễn Văn A], [9.5],
  [2], [Trần Thị B],   [8.0],
  [3], [Lê Văn C],     [9.0],
)

== Danh sách

#list(
  [Hỗ trợ toán học, bảng, hình vẽ TikZ],
  [Xuất PDF chỉ với một nút bấm],
  [Hoạt động offline sau lần tải đầu],
)
`

// ── Component ───────────────────────────────────────────────────────────────
export default function TypstEditor() {
  const [source, setSource]           = useState(DEFAULT)
  const [svgPages, setSvgPages]       = useState([])
  const [status, setStatus]           = useState('loading') // loading|idle|compiling|error
  const [errorMsg, setErrorMsg]       = useState('')
  const [zoom, setZoom]               = useState(1.0)
  const compilerRef                   = useRef(null)
  const debounceRef                   = useRef(null)

  // Init WASM compiler
  useEffect(() => {
    getCompiler()
      .then(c => { compilerRef.current = c; setStatus('idle') })
      .catch(e => { setStatus('error'); setErrorMsg('Lỗi tải WASM: ' + e.message) })
  }, [])

  // Compile → SVG pages
  const compile = useCallback(async (src) => {
    if (!compilerRef.current) return
    setStatus('compiling')
    setErrorMsg('')
    try {
      const compiler = compilerRef.current
      await compiler.reset()
      compiler.addSource('/main.typ', src)

      const result = await compiler.compile({ mainFilePath: '/main.typ' })

      if (!result?.result) {
        const diags = result?.diagnostics ?? []
        setErrorMsg(diags.length
          ? diags.map(d => `[${d.severity}] ${d.message}`).join('\n')
          : 'Lỗi biên dịch không xác định')
        setStatus('error')
        return
      }

      const renderer = await getRenderer()
      const artifact = result.result
      const pages = []

      await renderer.runWithSession(async (session) => {
        renderer.manipulateData({ renderSession: session, action: 'reset', data: artifact })
        const count = renderer.getPageCount(session)
        for (let i = 0; i < count; i++) {
          pages.push(renderer.renderSvg({ renderSession: session, pageOffset: i }))
        }
      })

      setSvgPages(pages)
      setStatus('idle')
    } catch (e) {
      setErrorMsg(e.message || String(e))
      setStatus('error')
    }
  }, [])

  // Debounced auto-compile
  useEffect(() => {
    if (status === 'loading') return
    if (debounceRef.current) clearTimeout(debounceRef.current)
    debounceRef.current = setTimeout(() => compile(source), 700)
    return () => clearTimeout(debounceRef.current)
  }, [source, status === 'loading' ? null : 'ready', compile])

  // Export PDF
  const exportPdf = useCallback(async () => {
    if (!compilerRef.current) return
    try {
      setStatus('compiling')
      const compiler = compilerRef.current
      await compiler.reset()
      compiler.addSource('/main.typ', source)
      const result = await compiler.compile({ mainFilePath: '/main.typ', format: 1 })
      if (!result?.result) throw new Error('Biên dịch PDF thất bại')
      const blob = new Blob([result.result], { type: 'application/pdf' })
      const a = document.createElement('a')
      a.href = URL.createObjectURL(blob)
      a.download = 'typst-output.pdf'
      a.click()
      URL.revokeObjectURL(a.href)
      setStatus('idle')
    } catch (e) {
      setErrorMsg(e.message)
      setStatus('error')
    }
  }, [source])

  const statusLabel = {
    loading:   '⏳ Đang tải WASM…',
    idle:      '● Sẵn sàng',
    compiling: '◌ Đang biên dịch…',
    error:     '✕ Lỗi',
  }[status]

  return (
    <div className="te-root">
      {/* Toolbar */}
      <div className="te-toolbar">
        <span className="te-logo">✦ Typst Editor</span>
        <span className={`te-status te-status--${status}`}>{statusLabel}</span>
        <div className="te-spacer" />
        <div className="te-zoom">
          <button onClick={() => setZoom(z => Math.max(0.3, +(z - 0.1).toFixed(1)))}>−</button>
          <span>{Math.round(zoom * 100)}%</span>
          <button onClick={() => setZoom(z => Math.min(3.0, +(z + 0.1).toFixed(1)))}>+</button>
          <button onClick={() => setZoom(1.0)}>Vừa</button>
        </div>
        <button
          className="te-btn-pdf"
          onClick={exportPdf}
          disabled={status === 'loading' || status === 'compiling'}
        >
          ↓ Xuất PDF
        </button>
      </div>

      {/* Split pane */}
      <PanelGroup direction="horizontal" className="te-panels">
        <Panel defaultSize={50} minSize={20}>
          <Editor
            height="100%"
            defaultLanguage="typst"
            value={source}
            onChange={v => setSource(v ?? '')}
            onMount={(_, monaco) => registerTypst(monaco)}
            theme="vs-dark"
            options={{
              fontSize: 13,
              lineHeight: 1.65,
              minimap: { enabled: false },
              scrollBeyondLastLine: false,
              wordWrap: 'on',
              tabSize: 2,
              fontFamily: '"JetBrains Mono","Fira Code","Cascadia Code",monospace',
              fontLigatures: true,
              padding: { top: 12, bottom: 12 },
            }}
          />
        </Panel>

        <PanelResizeHandle className="te-handle" />

        <Panel defaultSize={50} minSize={20}>
          <div className="te-preview">
            {/* Loading spinner */}
            {status === 'loading' && (
              <div className="te-center">
                <div className="te-spinner" />
                <p>Đang tải Typst WASM…</p>
                <small>Lần đầu tải font ~5–10 MB từ CDN</small>
              </div>
            )}

            {/* Error */}
            {status === 'error' && (
              <div className="te-error">
                <strong>Lỗi biên dịch</strong>
                <pre>{errorMsg}</pre>
              </div>
            )}

            {/* SVG pages */}
            {svgPages.map((svg, i) => (
              <div
                key={i}
                className="te-page"
                style={{ transform: `scale(${zoom})`, transformOrigin: 'top center' }}
                dangerouslySetInnerHTML={{ __html: svg }}
              />
            ))}

            {svgPages.length === 0 && status === 'idle' && (
              <div className="te-center" style={{ color: '#555' }}>
                <p>Chưa có nội dung</p>
              </div>
            )}
          </div>
        </Panel>
      </PanelGroup>
    </div>
  )
}
