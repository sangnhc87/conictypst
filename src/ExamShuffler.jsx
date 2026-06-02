import { useCallback, useMemo, useRef, useState } from 'react'
import { saveAs } from 'file-saver'
import {
  QUESTION_TYPE_ORDER,
  SHUFFLE_MODE_OPTIONS,
  countQuestionTypes,
  createDefaultFormState,
  createDefaultSectionModes,
  generateTypstVersions,
  normalizeCodeList,
  parseTypstMixerSource,
  stripExtension,
} from './typstMixerLogic.js'

// ─────────────────────────────────────────────────────────────────────────────
// Constants
// ─────────────────────────────────────────────────────────────────────────────

const TYPE_COLOR = {
  tn:  'border-blue-500  bg-blue-50/60  text-blue-700',
  ds:  'border-green-500 bg-green-50/60 text-green-700',
  tln: 'border-amber-500 bg-amber-50/60 text-amber-700',
  tl:  'border-violet-500 bg-violet-50/60 text-violet-700',
}
const TYPE_LABEL = { tn: 'Trắc nghiệm', ds: 'Đúng / Sai', tln: 'Trả lời ngắn', tl: 'Tự luận' }
const TYPE_SHORT = { tn: 'TN', ds: 'Đ/S', tln: 'TLN', tl: 'TL' }

const PRESETS = [
  { id: 'balanced', label: 'Cân bằng',   modes: { tn: 'structure-and-options', ds: 'structure-and-options', tln: 'questions', tl: 'keep' } },
  { id: 'strict',   label: 'Giữ form',   modes: { tn: 'questions', ds: 'questions', tln: 'questions', tl: 'keep' } },
  { id: 'keep',     label: 'Giữ nguyên', modes: { tn: 'keep', ds: 'keep', tln: 'keep', tl: 'keep' } },
]

// ─────────────────────────────────────────────────────────────────────────────
// Helpers
// ─────────────────────────────────────────────────────────────────────────────

function sameModes(a, b) {
  return QUESTION_TYPE_ORDER.every(t => (a || {})[t] === (b || {})[t])
}
function preview(block) {
  return String(block || '').replace(/^#\s*(tn|ds|tln|tl)\s*\(/, '').replace(/\s+/g, ' ').trim().slice(0, 200)
}

// ─────────────────────────────────────────────────────────────────────────────
// Small shared components
// ─────────────────────────────────────────────────────────────────────────────

/** Blue underline tab bar — same style as latex-mixer */
function TabBar({ tabs, active, onChange }) {
  return (
    <nav className="flex border-b border-gray-200 mb-6">
      {tabs.map(t => (
        <button
          key={t.id}
          type="button"
          onClick={() => onChange(t.id)}
          className={`px-6 py-3 text-sm font-medium focus:outline-none transition-colors ${
            active === t.id
              ? 'border-b-2 border-blue-500 text-blue-600 -mb-px'
              : 'text-gray-500 hover:text-gray-700 hover:border-gray-300'
          }`}
        >
          {t.label}
        </button>
      ))}
    </nav>
  )
}

function Label({ children }) {
  return <label className="block text-sm font-medium text-gray-700 mb-1">{children}</label>
}

function FInput({ label, value, onChange, type = 'text', min, max }) {
  return (
    <div>
      <Label>{label}</Label>
      <input
        type={type} value={value} onChange={onChange} min={min} max={max}
        className="w-full rounded-md border border-gray-300 px-3 py-2 text-sm shadow-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-400 outline-none"
      />
    </div>
  )
}

function FSelect({ label, value, onChange, options }) {
  return (
    <div>
      <Label>{label}</Label>
      <select
        value={value} onChange={onChange}
        className="w-full rounded-md border border-gray-300 bg-white px-3 py-2 text-sm shadow-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-400 outline-none"
      >
        {options.map(o => <option key={o.value} value={o.value}>{o.label}</option>)}
      </select>
    </div>
  )
}

function Btn({ children, onClick, disabled, variant = 'secondary', size = 'md' }) {
  const sz = size === 'lg' ? 'px-5 py-2.5 text-sm' : size === 'sm' ? 'px-3 py-1.5 text-xs' : 'px-4 py-2 text-sm'
  const va = {
    primary:   'bg-blue-600   text-white hover:bg-blue-700   focus:ring-blue-500',
    secondary: 'bg-gray-100   text-gray-700 border border-gray-300 hover:bg-gray-200 focus:ring-gray-400',
    success:   'bg-green-600  text-white hover:bg-green-700  focus:ring-green-500',
    danger:    'border border-red-300 text-red-600 hover:bg-red-50 focus:ring-red-400',
  }
  return (
    <button
      type="button" onClick={onClick} disabled={disabled}
      className={`inline-flex items-center gap-2 rounded-md font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-offset-1 disabled:opacity-40 disabled:pointer-events-none ${sz} ${va[variant]}`}
    >
      {children}
    </button>
  )
}

function Notification({ msg, tone, onClose }) {
  if (!msg) return null
  return (
    <div className={`fixed top-4 right-4 z-50 flex items-center gap-3 rounded-lg px-4 py-3 shadow-lg text-sm font-medium ${tone === 'error' ? 'bg-red-600 text-white' : 'bg-gray-900 text-white'}`}>
      <span>{msg}</span>
      <button onClick={onClose} className="opacity-70 hover:opacity-100 text-lg leading-none">&times;</button>
    </div>
  )
}

// SVG icons
const IcoUpload   = () => <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"/></svg>
const IcoAnalyze  = () => <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/></svg>
const IcoShuffle  = () => <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/></svg>
const IcoDownload = () => <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/></svg>
const IcoCopy     = () => <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"/></svg>

// ─────────────────────────────────────────────────────────────────────────────
// Main
// ─────────────────────────────────────────────────────────────────────────────

export default function ExamShuffler() {
  const [tab, setTab]           = useState('upload')
  const [fileName, setFileName] = useState('')
  const [uploadText, setUploadText] = useState('')
  const [pasteText, setPasteText]   = useState('')
  const [parsed, setParsed]   = useState(null)
  const [groups, setGroups]   = useState([])
  const [generated, setGenerated] = useState([])
  const [activeResult, setActiveResult] = useState(0)
  const [copied, setCopied]   = useState('')
  const [notice, setNotice]   = useState(null)
  const [form, setForm]       = useState(() => createDefaultFormState())
  const fileRef   = useRef(null)
  const noticeRef = useRef(null)

  const source = tab === 'upload' ? uploadText : pasteText
  const stats  = useMemo(() => countQuestionTypes(groups), [groups])
  const modes  = useMemo(() => ({ ...createDefaultSectionModes(), ...(form.sectionModes || {}) }), [form.sectionModes])
  const hasParsed = !!parsed && groups.length > 0

  function flash(msg, tone = 'success') {
    setNotice({ msg, tone })
    clearTimeout(noticeRef.current)
    noticeRef.current = setTimeout(() => setNotice(null), 3500)
  }

  const handleFile = useCallback(file => {
    if (!file) return
    setFileName(file.name)
    setParsed(null); setGroups([]); setGenerated([])
    const r = new FileReader()
    r.onload = e => { setUploadText(String(e.target?.result || '')); setTab('upload') }
    r.readAsText(file)
  }, [])

  const handleParse = useCallback(() => {
    if (!source.trim()) { flash('Cần có nội dung Typst.', 'error'); return }
    const p = parseTypstMixerSource(source)
    if (!p.groups.length) { flash('Không nhận diện được câu hỏi hợp lệ.', 'error'); return }
    setParsed(p); setGroups(p.groups); setGenerated([]); setActiveResult(0)
    setForm(cur => ({ ...createDefaultFormState(p.headerMeta), sectionModes: { ...createDefaultSectionModes(), ...(cur.sectionModes || {}) } }))
    flash(`Đã phân tích ${countQuestionTypes(p.groups).total} câu hỏi.`)
  }, [source])

  const handleGenerate = useCallback(() => {
    if (!parsed || !groups.length) { flash('Cần phân tích đề trước.', 'error'); return }
    const codes = normalizeCodeList(form.codesInput, form.numVersions)
    const next  = { ...form, codesInput: codes.join(', '), sectionModes: modes }
    setForm(next)
    const variants = generateTypstVersions(parsed, groups, next, stripExtension(fileName || 'de-thi'))
    setGenerated(variants); setActiveResult(0)
    flash(`Đã tạo ${variants.length} mã đề.`)
  }, [fileName, form, groups, parsed, modes])

  const setF = (k, v) => setForm(f => ({ ...f, [k]: v }))
  const setN  = v => { const n = Math.max(1, Number(v) || 1); setForm(f => ({ ...f, numVersions: n, codesInput: normalizeCodeList(f.codesInput, n).join(', ') })) }
  const setM  = (t, v) => setForm(f => ({ ...f, sectionModes: { ...createDefaultSectionModes(), ...(f.sectionModes || {}), [t]: v } }))
  const applyPreset = ms => setForm(f => ({ ...f, sectionModes: { ...createDefaultSectionModes(), ...ms } }))

  const toggleLock = useCallback((gid, qid) => {
    setGroups(gs => gs.map(g => g.id !== gid ? g : { ...g, questions: g.questions.map(q => q.id !== qid ? q : { ...q, locked: !q.locked }) }))
  }, [])
  const editBlock = useCallback((gid, qid, block) => {
    setGroups(gs => gs.map(g => g.id !== gid ? g : { ...g, questions: g.questions.map(q => q.id !== qid ? q : { ...q, block }) }))
  }, [])

  const doCopy = useCallback(async v => {
    await navigator.clipboard.writeText(v.content)
    setCopied(v.fileName); setTimeout(() => setCopied(''), 2000)
  }, [])
  const doDownload = useCallback(v => saveAs(new Blob([v.content], { type: 'text/plain;charset=utf-8' }), v.fileName), [])
  const doDownloadAll = useCallback(() => generated.forEach((v, i) => setTimeout(() => doDownload(v), i * 200)), [generated, doDownload])

  // ─── render ───────────────────────────────────────────────────────────────
  return (
    <div className="bg-gray-100 min-h-screen font-sans">
      <Notification msg={notice?.msg} tone={notice?.tone} onClose={() => setNotice(null)} />

      <div className="max-w-5xl mx-auto bg-white rounded-lg shadow-md my-4 sm:my-6 mx-3 sm:mx-auto p-5 sm:p-8">

        {/* ── Title ── */}
        <h1 className="text-2xl font-bold text-center text-blue-700 mb-1">Trộn Đề Typst 2025</h1>
        <p className="text-center text-sm text-gray-500 mb-6">Trộn riêng từng phần: TN · Đ/S · TLN · TL</p>

        {/* ── Tab bar ── */}
        <TabBar
          active={tab} onChange={setTab}
          tabs={[{ id: 'upload', label: 'Tải lên file .typ' }, { id: 'paste', label: 'Dán nội dung' }]}
        />

        {/* ── Source input ── */}
        {tab === 'upload' ? (
          <div className="mb-6 p-4 border-2 border-dashed border-gray-300 rounded-lg">
            <label className="block text-sm font-medium text-gray-700 mb-2">Chọn file Typst (.typ):</label>
            <input
              ref={fileRef}
              type="file"
              accept=".typ,text/plain"
              onChange={e => handleFile(e.target.files?.[0])}
              className="w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 cursor-pointer"
            />
            {fileName && <p className="mt-2 text-sm text-blue-600 font-medium">{fileName}</p>}
          </div>
        ) : (
          <div className="mb-6">
            <label className="block text-sm font-medium text-gray-700 mb-2">Dán nội dung Typst:</label>
            <textarea
              value={pasteText} onChange={e => setPasteText(e.target.value)} rows={10}
              placeholder="Dán nội dung file .typ vào đây..."
              className="w-full rounded-md border border-gray-300 px-3 py-2 text-sm font-mono shadow-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-400 outline-none"
            />
          </div>
        )}

        {/* ── Action row ── */}
        <div className="flex flex-wrap items-center gap-3 mb-6 mt-4">
          <Btn variant="primary" onClick={handleParse}>
            <IcoAnalyze />{hasParsed ? 'Phân tích lại' : 'Phân tích đề'}
          </Btn>
          {hasParsed && (
            <>
              <Btn variant="primary" onClick={handleGenerate}>
                <IcoShuffle />Trộn {Math.max(1, Number(form.numVersions) || 1)} mã đề
              </Btn>
              <Btn variant="danger" onClick={() => { setParsed(null); setGroups([]); setGenerated([]); setFileName(''); setUploadText('') }}>
                Đổi file
              </Btn>
            </>
          )}
          {hasParsed && (
            <div className="ml-auto flex flex-wrap gap-2">
              {[
                { k: 'tn',  label: `TN ${stats.tn}`,    cls: 'bg-blue-50 border-blue-200 text-blue-700' },
                { k: 'ds',  label: `Đ/S ${stats.ds}`,   cls: 'bg-green-50 border-green-200 text-green-700' },
                { k: 'tln', label: `TLN ${stats.tln}`,  cls: 'bg-amber-50 border-amber-200 text-amber-700' },
                { k: 'tl',  label: `TL ${stats.tl}`,    cls: 'bg-violet-50 border-violet-200 text-violet-700' },
              ].map(s => <span key={s.k} className={`border rounded-full px-3 py-0.5 text-xs font-semibold ${s.cls}`}>{s.label}</span>)}
            </div>
          )}
        </div>

        {/* ─────── After parse ─────── */}
        {hasParsed && (
          <>
            <hr className="border-gray-200 mb-6" />

            {/* ── Shuffle mode section ── */}
            <div className="mb-6">
              <div className="flex flex-wrap items-center justify-between gap-3 mb-3">
                <h2 className="text-base font-semibold text-gray-800">Chế độ trộn theo từng phần</h2>
                <div className="flex flex-wrap gap-2">
                  {PRESETS.map(p => (
                    <button key={p.id} type="button" onClick={() => applyPreset(p.modes)}
                      className={`rounded-full border px-3 py-1 text-xs font-semibold transition-colors ${
                        sameModes(modes, p.modes)
                          ? 'bg-blue-600 border-blue-600 text-white'
                          : 'border-gray-300 text-gray-600 hover:border-blue-400 hover:text-blue-600'
                      }`}>
                      {p.label}
                    </button>
                  ))}
                </div>
              </div>
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3">
                {QUESTION_TYPE_ORDER.map(type => {
                  const [borderCls] = TYPE_COLOR[type].split(' ')
                  const [, bgCls, textCls] = TYPE_COLOR[type].split(' ')
                  return (
                    <div key={type} className={`rounded-lg border border-gray-200 border-l-4 p-3 ${borderCls}`}>
                      <div className="flex items-center justify-between mb-2">
                        <span className={`text-xs font-bold px-2 py-0.5 rounded ${bgCls} ${textCls}`}>{TYPE_SHORT[type]}</span>
                        <span className="text-xs text-gray-500">{TYPE_LABEL[type]}</span>
                      </div>
                      <select value={modes[type]} onChange={e => setM(type, e.target.value)}
                        className="w-full rounded border border-gray-200 bg-white px-2 py-1.5 text-xs text-gray-700 focus:border-blue-400 focus:ring-1 focus:ring-blue-300 outline-none">
                        {SHUFFLE_MODE_OPTIONS.map(o => <option key={o.value} value={o.value}>{o.label}</option>)}
                      </select>
                    </div>
                  )
                })}
              </div>
            </div>

            {/* ── Metadata form ── */}
            <div className="mb-6">
              <h2 className="text-base font-semibold text-gray-800 mb-3">Thông tin đề thi</h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                <FInput label="Tên kỳ thi" value={form.examTitle || ''} onChange={e => setF('examTitle', e.target.value)} />
                <FInput label="Môn học" value={form.subject || ''} onChange={e => setF('subject', e.target.value)} />
                <FInput label="Thời gian" value={form.duration || ''} onChange={e => setF('duration', e.target.value)} />
                <FInput label="Trường / Tổ" value={form.school || ''} onChange={e => setF('school', e.target.value)} />
                <FInput label="Số mã đề" type="number" min="1" max="40" value={form.numVersions} onChange={e => setN(e.target.value)} />
                <FInput label="Mã đề (phân cách bằng dấu phẩy)" value={form.codesInput} onChange={e => setF('codesInput', e.target.value)} />
              </div>
            </div>

            <hr className="border-gray-200 mb-6" />

            {/* ── Questions list ── */}
            <div className="mb-6">
              <h2 className="text-base font-semibold text-gray-800 mb-3">
                Danh sách câu hỏi
                <span className="ml-2 text-sm font-normal text-gray-400">— đánh dấu để cố định vị trí khi trộn</span>
              </h2>
              <div className="space-y-4">
                {groups.map(group => (
                  <div key={group.id} className="border border-gray-200 rounded-lg overflow-hidden">
                    <div className="flex items-center justify-between bg-gray-50 border-b border-gray-200 px-4 py-2">
                      <span className="font-semibold text-sm text-gray-800">{group.title}</span>
                      <span className="text-xs text-gray-400">{group.questions.length} câu</span>
                    </div>
                    {group.questions.map(q => {
                      const [borderCls, bgCls, textCls] = TYPE_COLOR[q.type].split(' ')
                      return (
                        <div key={q.id} className={`flex border-l-4 ${borderCls}`}>
                          <div className="flex-1 p-3">
                            <div className="flex items-center gap-3 mb-2">
                              <span className={`text-xs font-semibold px-2 py-0.5 rounded ${bgCls} ${textCls}`}>{TYPE_SHORT[q.type]}</span>
                              <span className="text-xs text-gray-400">Câu {q.id}</span>
                              <label className="ml-auto flex items-center gap-1.5 cursor-pointer text-xs text-gray-500">
                                <input type="checkbox" checked={!!q.locked} onChange={() => toggleLock(group.id, q.id)}
                                  className="rounded border-gray-300 text-blue-600 focus:ring-blue-400 h-3.5 w-3.5" />
                                Cố định
                              </label>
                            </div>
                            <p className="text-xs text-gray-400 mb-2 line-clamp-2 leading-relaxed">{preview(q.block)}</p>
                            <textarea
                              value={q.block} onChange={e => editBlock(group.id, q.id, e.target.value)} rows={5}
                              className="w-full rounded border border-gray-200 bg-gray-50 px-3 py-2 font-mono text-xs leading-5 text-gray-700 focus:border-blue-400 focus:ring-1 focus:ring-blue-300 focus:bg-white outline-none resize-y transition"
                            />
                          </div>
                        </div>
                      )
                    })}
                  </div>
                ))}
              </div>
            </div>

            {/* ── Results ── */}
            {generated.length > 0 && (
              <>
                <hr className="border-gray-200 mb-6" />
                <div>
                  <div className="flex flex-wrap items-center justify-between gap-3 mb-4">
                    <h2 className="text-base font-semibold text-gray-800">
                      Kết quả trộn — {generated.length} mã đề
                    </h2>
                    <Btn onClick={doDownloadAll}><IcoDownload />Tải tất cả</Btn>
                  </div>

                  {/* Variant tab row */}
                  <div className="flex flex-wrap gap-2 mb-4">
                    {generated.map((v, i) => (
                      <button key={v.fileName} type="button" onClick={() => setActiveResult(i)}
                        className={`rounded-md border px-4 py-1.5 text-sm font-semibold transition-colors ${
                          activeResult === i
                            ? 'bg-blue-600 border-blue-600 text-white'
                            : 'border-gray-300 text-gray-600 hover:border-blue-400 hover:text-blue-600'
                        }`}>
                        Mã {v.code}
                      </button>
                    ))}
                  </div>

                  {/* Active variant */}
                  {generated[activeResult] && (
                    <div className="border border-gray-200 rounded-lg overflow-hidden">
                      <div className="flex items-center justify-between gap-3 bg-gray-50 border-b border-gray-200 px-4 py-2">
                        <span className="text-sm font-medium text-gray-700">{generated[activeResult].fileName}</span>
                        <div className="flex gap-2">
                          <Btn size="sm" onClick={() => doDownload(generated[activeResult])}>
                            <IcoDownload />Tải file
                          </Btn>
                          <Btn size="sm" variant="success" onClick={() => doCopy(generated[activeResult])}>
                            <IcoCopy />{copied === generated[activeResult].fileName ? 'Đã copy ✓' : 'Copy'}
                          </Btn>
                        </div>
                      </div>
                      <textarea
                        readOnly value={generated[activeResult].content} rows={18}
                        className="w-full border-0 bg-[#1e1e1e] px-4 py-3 font-mono text-xs leading-5 text-[#d4d4d4] outline-none resize-y"
                      />
                    </div>
                  )}
                </div>
              </>
            )}
          </>
        )}
      </div>
    </div>
  )
}
