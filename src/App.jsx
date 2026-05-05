import React, { startTransition, useDeferredValue, useEffect, useMemo, useRef, useState } from 'react'
import bankCatalog from '../bank.json'
import {
  DIFFICULTY_BY_CODE,
  DIFFICULTY_OPTIONS,
  QUESTION_TYPE_OPTIONS,
  SAMPLE_RECORDS,
  STATUS_OPTIONS,
  createEmptyOptionArray,
  createEmptyStatements,
} from './questionBankSeed.js'

const STORAGE_KEY = 'conictypst.question-bank.records.v2'
const CART_KEY = 'conictypst.question-bank.cart.v1'
const VISIBLE_LIMIT = 180
const DEFAULT_FILTERS = {
  query: '',
  grade: '',
  branch: '',
  chapter: '',
  lesson: '',
  form: '',
  status: '',
  type: '',
  authored: 'all',
}

const TYPE_LABELS = Object.fromEntries(QUESTION_TYPE_OPTIONS.map(option => [option.value, option]))
const STATUS_LABELS = Object.fromEntries(STATUS_OPTIONS.map(option => [option.value, option.label]))
const DIFFICULTY_LABELS = Object.fromEntries(DIFFICULTY_OPTIONS.map(option => [option.value, option.label]))
const LEGACY_SAMPLE_STEMS = {
  '0D1N1-1': 'Phat bieu nao sau day la mot menh de?',
  '0D1N1-2': 'Xet cac phat bieu sau lien quan den khai niem menh de.',
  '0D1N1-3': 'Viet phu dinh cua menh de P: "5 la so nguyen to".',
  '0D1N1-4': 'Cho menh de P: "Neu mot tu giac la hinh vuong thi tu giac do la hinh chu nhat". Hay neu menh de dao va nhan xet tinh dung sai cua no.',
}

function getSegmentDetails(segment) {
  const text = String(segment || '').trim()
  const pieces = text.split(': ')

  if (pieces.length < 2) {
    return { tag: '', value: text }
  }

  return {
    tag: pieces[0],
    value: pieces.slice(1).join(': '),
  }
}

function parseBankCatalog(rawCatalog) {
  return Object.entries(rawCatalog)
    .map(([id, label]) => {
      const parts = String(label).split(' | ')
      const chapter = getSegmentDetails(parts[2])
      const lesson = getSegmentDetails(parts[3])
      const form = getSegmentDetails(parts[4])
      const difficultyCode = String(id).charAt(3).toUpperCase()

      return {
        id,
        label,
        grade: parts[0] || 'Không rõ lớp',
        branch: parts[1] || 'Không rõ nhóm',
        chapterTag: chapter.tag,
        chapter: chapter.value,
        lessonTag: lesson.tag,
        lesson: lesson.value,
        formTag: form.tag,
        form: form.value,
        inferredDifficulty: DIFFICULTY_BY_CODE[difficultyCode] || 'nhan-biet',
      }
    })
    .sort((left, right) => left.id.localeCompare(right.id, 'vi'))
}

function uniqueSorted(values) {
  return [...new Set(values.filter(Boolean))].sort((left, right) => left.localeCompare(right, 'vi'))
}

function parseStoredValue(rawValue, fallbackValue) {
  if (!rawValue) return fallbackValue

  try {
    return JSON.parse(rawValue)
  } catch {
    return fallbackValue
  }
}

function useLocalStorageState(key, fallbackValue) {
  const [value, setValue] = useState(() => {
    if (typeof window === 'undefined') return fallbackValue
    return parseStoredValue(window.localStorage.getItem(key), fallbackValue)
  })

  useEffect(() => {
    if (typeof window === 'undefined') return
    window.localStorage.setItem(key, JSON.stringify(value))
  }, [key, value])

  return [value, setValue]
}

function normalizeTags(value) {
  if (Array.isArray(value)) {
    return value.map(tag => String(tag).trim()).filter(Boolean)
  }

  if (typeof value === 'string') {
    return value
      .split(',')
      .map(tag => tag.trim())
      .filter(Boolean)
  }

  return []
}

function ensureArrayLength(values, minimumLength, builder) {
  const items = Array.isArray(values) ? [...values] : []

  while (items.length < minimumLength) {
    items.push(builder())
  }

  return items
}

function normalizeCorrectAnswers(value) {
  if (Array.isArray(value)) {
    const answers = value
      .map(item => Number(item))
      .filter(Number.isFinite)
      .filter(item => item > 0)

    return answers.length > 0 ? answers : [1]
  }

  const parsed = Number(value)
  return Number.isFinite(parsed) && parsed > 0 ? [parsed] : [1]
}

function createRecordDraft(entry) {
  return {
    id: entry?.id || '',
    type: 'tn',
    status: 'draft',
    difficulty: entry?.inferredDifficulty || 'nhan-biet',
    tags: [entry?.grade, entry?.branch].filter(Boolean),
    stem: '',
    solution: '',
    note: '',
    options: createEmptyOptionArray(4),
    correctAnswers: [1],
    statements: createEmptyStatements(4),
    shortAnswer: '',
    updatedAt: '',
    createdAt: '',
  }
}

function normalizeRecord(record, entry) {
  const fallback = createRecordDraft(entry)
  const source = record ? { ...fallback, ...record } : fallback

  return {
    ...fallback,
    ...source,
    id: source.id || entry?.id || fallback.id,
    type: TYPE_LABELS[source.type] ? source.type : fallback.type,
    status: STATUS_LABELS[source.status] ? source.status : fallback.status,
    difficulty: DIFFICULTY_LABELS[source.difficulty] ? source.difficulty : fallback.difficulty,
    tags: normalizeTags(source.tags),
    stem: String(source.stem || ''),
    solution: String(source.solution || ''),
    note: String(source.note || ''),
    options: ensureArrayLength(source.options, 4, () => '').map(option => String(option || '')),
    correctAnswers: normalizeCorrectAnswers(source.correctAnswers || source.correct || 1),
    statements: ensureArrayLength(source.statements, 4, () => ({ text: '', correct: false })).map(statement => ({
      text: String(statement?.text || statement?.body || ''),
      correct: Boolean(statement?.correct),
    })),
    shortAnswer: String(source.shortAnswer || source.answer || ''),
    updatedAt: String(source.updatedAt || ''),
    createdAt: String(source.createdAt || ''),
  }
}

function serializeRecord(record, entry, baselineRecord) {
  const normalized = normalizeRecord(record, entry)
  const now = new Date().toISOString()

  return {
    id: normalized.id,
    type: normalized.type,
    status: normalized.status,
    difficulty: normalized.difficulty,
    tags: normalized.tags,
    stem: normalized.stem.trim(),
    solution: normalized.solution.trim(),
    note: normalized.note.trim(),
    options: normalized.options,
    correctAnswers: normalized.correctAnswers,
    statements: normalized.statements,
    shortAnswer: normalized.shortAnswer.trim(),
    createdAt: baselineRecord?.createdAt || normalized.createdAt || now,
    updatedAt: now,
  }
}

function buildSearchableText(entry, record) {
  return [
    entry.id,
    entry.label,
    entry.chapter,
    entry.lesson,
    entry.form,
    record?.stem,
    record?.solution,
    record?.tags?.join(' '),
  ]
    .filter(Boolean)
    .join(' ')
    .toLowerCase()
}

function matchesFilters(entry, record, filters) {
  const hasRecord = Boolean(record)
  const effectiveStatus = hasRecord ? record.status : 'missing'
  const effectiveType = hasRecord ? record.type : ''
  const searchableText = buildSearchableText(entry, record)

  if (filters.authored === 'authored' && !hasRecord) return false
  if (filters.authored === 'missing' && hasRecord) return false
  if (filters.grade && entry.grade !== filters.grade) return false
  if (filters.branch && entry.branch !== filters.branch) return false
  if (filters.chapter && entry.chapter !== filters.chapter) return false
  if (filters.lesson && entry.lesson !== filters.lesson) return false
  if (filters.form && entry.form !== filters.form) return false
  if (filters.status && effectiveStatus !== filters.status) return false
  if (filters.type && effectiveType !== filters.type) return false
  if (filters.query && !searchableText.includes(filters.query)) return false

  return true
}

function sortEntries(left, right, recordsById) {
  const leftRecord = recordsById[left.id]
  const rightRecord = recordsById[right.id]
  const leftRank = leftRecord ? 0 : 1
  const rightRank = rightRecord ? 0 : 1

  if (leftRank !== rightRank) return leftRank - rightRank

  const leftReady = leftRecord?.status === 'ready' ? 0 : 1
  const rightReady = rightRecord?.status === 'ready' ? 0 : 1

  if (leftReady !== rightReady) return leftReady - rightReady

  return left.id.localeCompare(right.id, 'vi')
}

function buildExportPayload(ids, recordsById, catalogById) {
  const questions = ids
    .filter(id => recordsById[id])
    .map(id => ({
      taxonomy: catalogById.get(id) || null,
      record: recordsById[id],
    }))

  return {
    exportedAt: new Date().toISOString(),
    questionCount: questions.length,
    questions,
  }
}

function downloadJson(filename, payload) {
  const blob = new Blob([JSON.stringify(payload, null, 2)], { type: 'application/json' })
  const url = URL.createObjectURL(blob)
  const anchor = document.createElement('a')
  anchor.href = url
  anchor.download = filename
  anchor.click()
  URL.revokeObjectURL(url)
}

function formatDateTime(value) {
  if (!value) return 'Chưa lưu'

  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) return 'Chưa lưu'

  return new Intl.DateTimeFormat('vi-VN', {
    dateStyle: 'short',
    timeStyle: 'short',
  }).format(parsed)
}

function getStatusTone(status) {
  if (status === 'ready') return 'ready'
  if (status === 'review') return 'review'
  if (status === 'archived') return 'archived'
  if (status === 'missing') return 'missing'
  return 'draft'
}

function getPreviewText(entry, record) {
  if (record?.stem) return record.stem
  return `${entry.chapter} / ${entry.form}`
}

function coerceImportedRecords(payload, catalogById) {
  const source = Array.isArray(payload)
    ? Object.fromEntries(payload.map(item => [item.id, item]))
    : payload?.records || payload

  if (!source || typeof source !== 'object') {
    return {}
  }

  return Object.fromEntries(
    Object.entries(source)
      .filter(([id]) => typeof id === 'string')
      .map(([id, value]) => [id, normalizeRecord({ ...value, id }, catalogById.get(id))]),
  )
}

function upgradeLegacySeedRecords(records) {
  let changed = false
  const nextRecords = { ...records }

  for (const [id, legacyStem] of Object.entries(LEGACY_SAMPLE_STEMS)) {
    const currentRecord = records[id]
    const sampleRecord = SAMPLE_RECORDS[id]

    if (!currentRecord || !sampleRecord) continue

    if (currentRecord.stem === legacyStem && currentRecord.updatedAt === sampleRecord.updatedAt) {
      nextRecords[id] = {
        ...sampleRecord,
        createdAt: currentRecord.createdAt || sampleRecord.createdAt || '',
        updatedAt: currentRecord.updatedAt,
      }
      changed = true
    }
  }

  return changed ? nextRecords : records
}

function StatCard({ label, value, meta, tone = 'accent' }) {
  return (
    <article className={`stat-card stat-card--${tone}`}>
      <span className="stat-card__label">{label}</span>
      <strong className="stat-card__value">{value}</strong>
      <span className="stat-card__meta">{meta}</span>
    </article>
  )
}

function FilterField({ label, value, options, onChange }) {
  return (
    <label className="field">
      <span className="field__label">{label}</span>
      <select className="field__control" value={value} onChange={event => onChange(event.target.value)}>
        <option value="">Tất cả</option>
        {options.map(option => (
          <option key={option} value={option}>
            {option}
          </option>
        ))}
      </select>
    </label>
  )
}

function App() {
  const catalogEntries = useMemo(() => parseBankCatalog(bankCatalog), [])
  const catalogById = useMemo(() => new Map(catalogEntries.map(entry => [entry.id, entry])), [catalogEntries])
  const [records, setRecords] = useLocalStorageState(STORAGE_KEY, SAMPLE_RECORDS)
  const [cartIds, setCartIds] = useLocalStorageState(CART_KEY, Object.keys(SAMPLE_RECORDS))
  const [filters, setFilters] = useState(DEFAULT_FILTERS)
  const [selectedId, setSelectedId] = useState(Object.keys(SAMPLE_RECORDS)[0] || catalogEntries[0]?.id || '')
  const [editorDraft, setEditorDraft] = useState(null)
  const [notice, setNotice] = useState(null)
  const importInputRef = useRef(null)
  const deferredQuery = useDeferredValue(filters.query.trim().toLowerCase())

  useEffect(() => {
    document.title = 'ConicTypst - Quản lý ngân hàng câu hỏi'
  }, [])

  useEffect(() => {
    setRecords(currentRecords => upgradeLegacySeedRecords(currentRecords))
  }, [setRecords])

  const normalizedRecords = useMemo(
    () =>
      Object.fromEntries(
        Object.entries(records).map(([id, record]) => [id, normalizeRecord(record, catalogById.get(id))]),
      ),
    [records, catalogById],
  )

  const filterOptions = useMemo(
    () => ({
      grades: uniqueSorted(catalogEntries.map(entry => entry.grade)),
      branches: uniqueSorted(catalogEntries.map(entry => entry.branch)),
      chapters: uniqueSorted(catalogEntries.map(entry => entry.chapter)),
      lessons: uniqueSorted(catalogEntries.map(entry => entry.lesson)),
      forms: uniqueSorted(catalogEntries.map(entry => entry.form)),
    }),
    [catalogEntries],
  )

  const effectiveFilters = useMemo(
    () => ({
      ...filters,
      query: deferredQuery,
    }),
    [filters, deferredQuery],
  )

  const filteredEntries = useMemo(
    () =>
      catalogEntries
        .filter(entry => matchesFilters(entry, normalizedRecords[entry.id], effectiveFilters))
        .sort((left, right) => sortEntries(left, right, normalizedRecords)),
    [catalogEntries, effectiveFilters, normalizedRecords],
  )

  const visibleEntries = filteredEntries.slice(0, VISIBLE_LIMIT)
  const selectedEntry = catalogById.get(selectedId) || visibleEntries[0] || catalogEntries[0] || null
  const baselineRecord = selectedEntry ? normalizedRecords[selectedEntry.id] || createRecordDraft(selectedEntry) : null
  const baselineSignature = useMemo(() => JSON.stringify(baselineRecord), [baselineRecord])

  useEffect(() => {
    if (!selectedEntry) return
    if (selectedEntry.id !== selectedId) {
      setSelectedId(selectedEntry.id)
    }
  }, [selectedEntry, selectedId])

  useEffect(() => {
    setEditorDraft(baselineRecord)
  }, [selectedEntry?.id, baselineSignature])

  useEffect(() => {
    if (!notice) return undefined

    const timeoutId = window.setTimeout(() => setNotice(null), 2400)
    return () => window.clearTimeout(timeoutId)
  }, [notice])

  useEffect(() => {
    setCartIds(currentCart => {
      const nextCart = currentCart.filter(id => normalizedRecords[id])
      return nextCart.length === currentCart.length ? currentCart : nextCart
    })
  }, [normalizedRecords, setCartIds])

  const draftSignature = useMemo(() => JSON.stringify(editorDraft), [editorDraft])
  const editorDirty = draftSignature !== baselineSignature
  const authoredCount = Object.keys(normalizedRecords).length
  const readyCount = Object.values(normalizedRecords).filter(record => record.status === 'ready').length
  const reviewCount = Object.values(normalizedRecords).filter(record => record.status === 'review').length
  const coverage = catalogEntries.length === 0 ? 0 : Math.round((authoredCount / catalogEntries.length) * 100)
  const orphanIds = Object.keys(normalizedRecords).filter(id => !catalogById.has(id))

  const selectedCartRows = cartIds.map(id => ({ id, entry: catalogById.get(id), record: normalizedRecords[id] })).filter(row => row.entry && row.record)

  function updateFilter(field, value) {
    startTransition(() => {
      setFilters(currentFilters => ({
        ...currentFilters,
        [field]: value,
      }))
    })
  }

  function updateDraft(patch) {
    setEditorDraft(currentDraft => ({ ...currentDraft, ...patch }))
  }

  function updateOption(index, value) {
    setEditorDraft(currentDraft => ({
      ...currentDraft,
      options: currentDraft.options.map((option, optionIndex) => (optionIndex === index ? value : option)),
    }))
  }

  function updateStatement(index, patch) {
    setEditorDraft(currentDraft => ({
      ...currentDraft,
      statements: currentDraft.statements.map((statement, statementIndex) => (
        statementIndex === index ? { ...statement, ...patch } : statement
      )),
    }))
  }

  function setQuestionType(nextType) {
    setEditorDraft(currentDraft => ({
      ...currentDraft,
      type: nextType,
      options: currentDraft.options?.length ? currentDraft.options : createEmptyOptionArray(4),
      correctAnswers: currentDraft.correctAnswers?.length ? currentDraft.correctAnswers : [1],
      statements: currentDraft.statements?.length ? currentDraft.statements : createEmptyStatements(4),
      shortAnswer: currentDraft.shortAnswer || '',
    }))
  }

  function handleSaveRecord() {
    if (!selectedEntry || !editorDraft) return

    const nextRecord = serializeRecord(editorDraft, selectedEntry, normalizedRecords[selectedEntry.id])
    setRecords(currentRecords => ({
      ...currentRecords,
      [selectedEntry.id]: nextRecord,
    }))
    setNotice({ tone: 'success', message: `Đã lưu ${selectedEntry.id}` })
  }

  function handleDeleteRecord() {
    if (!selectedEntry || !normalizedRecords[selectedEntry.id]) return
    if (!window.confirm(`Xóa nội dung đã soạn cho ${selectedEntry.id}?`)) return

    setRecords(currentRecords => {
      const nextRecords = { ...currentRecords }
      delete nextRecords[selectedEntry.id]
      return nextRecords
    })
    setNotice({ tone: 'danger', message: `Đã xóa nội dung ${selectedEntry.id}` })
  }

  function handleToggleCart(id) {
    if (!normalizedRecords[id]) return

    setCartIds(currentCart => (
      currentCart.includes(id) ? currentCart.filter(item => item !== id) : [...currentCart, id]
    ))
  }

  async function handleCopyCartIds() {
    if (selectedCartRows.length === 0) return

    const text = selectedCartRows.map(row => row.id).join('\n')

    try {
      await navigator.clipboard.writeText(text)
      setNotice({ tone: 'success', message: 'Đã sao chép danh sách ID vào clipboard' })
    } catch {
      setNotice({ tone: 'danger', message: 'Không thể sao chép danh sách ID' })
    }
  }

  function handleExportAll() {
    downloadJson('conictypst-question-bank.json', {
      records: normalizedRecords,
      exportedAt: new Date().toISOString(),
    })
    setNotice({ tone: 'success', message: 'Đã tải toàn bộ dữ liệu JSON' })
  }

  function handleExportCart() {
    const payload = buildExportPayload(cartIds, normalizedRecords, catalogById)
    downloadJson('conictypst-exam-pack.json', payload)
    setNotice({ tone: 'success', message: 'Đã tải gói đề đang chọn' })
  }

  function handleImportClick() {
    importInputRef.current?.click()
  }

  async function handleImportFile(event) {
    const file = event.target.files?.[0]
    if (!file) return

    try {
      const text = await file.text()
      const payload = JSON.parse(text)
      const importedRecords = coerceImportedRecords(payload, catalogById)

      setRecords(currentRecords => ({
        ...currentRecords,
        ...importedRecords,
      }))
      setNotice({ tone: 'success', message: `Đã nhập ${Object.keys(importedRecords).length} hồ sơ câu hỏi` })
    } catch {
      setNotice({ tone: 'danger', message: 'File JSON không hợp lệ' })
    }

    event.target.value = ''
  }

  function handleResetSeed() {
    if (!window.confirm('Khôi phục bộ dữ liệu mẫu và ghi đè local data hiện tại?')) return

    setRecords(SAMPLE_RECORDS)
    setCartIds(Object.keys(SAMPLE_RECORDS))
    setNotice({ tone: 'success', message: 'Đã khôi phục bộ dữ liệu mẫu' })
  }

  if (!selectedEntry || !editorDraft) {
    return null
  }

  return (
    <div className="dashboard-shell">
      <input
        ref={importInputRef}
        className="visually-hidden"
        type="file"
        accept="application/json"
        onChange={handleImportFile}
      />

      <header className="hero-panel paper-panel">
        <div className="hero-copy">
          <span className="hero-kicker">ConicTypst Data Manager</span>
          <h1>Quản lý ngân hàng câu hỏi trên web, không còn phụ thuộc WASM.</h1>
          <p>
            Dashboard này tách hẳn khỏi Typst runtime trong trình duyệt. Phân loại vẫn lấy từ
            bank.json, còn nội dung câu hỏi được soạn, lọc, đóng gói và sao lưu trực tiếp trên Pages.
          </p>
          <div className="hero-tags">
            <span className="pill">ID ổn định theo bank.json</span>
            <span className="pill">Soạn nội dung theo loại câu hỏi</span>
            <span className="pill">Import / export JSON để đồng bộ</span>
          </div>
        </div>

        <div className="hero-actions">
          <div className="action-stack">
            <button type="button" className="action-btn action-btn--accent" onClick={handleExportAll}>
              Tải toàn bộ JSON
            </button>
            <button type="button" className="action-btn" onClick={handleImportClick}>
              Nhập JSON
            </button>
            <button type="button" className="action-btn" onClick={handleResetSeed}>
              Khôi phục dữ liệu mẫu
            </button>
          </div>

          <div className="hero-note">
            <span className="hero-note__label">Lưu trữ</span>
            <strong>Trình duyệt hiện tại</strong>
            <p>
              Bản Pages này là static app. Dữ liệu đang được lưu local trong trình duyệt và trao
              đổi bằng JSON import / export. Khi cần đồng bộ nhiều thiết bị, mình có thể nâng cấp tiếp sang D1 hoặc API.
            </p>
          </div>

          {notice ? <div className={`notice notice--${notice.tone}`}>{notice.message}</div> : null}
        </div>
      </header>

      <section className="stats-grid">
        <StatCard label="Phân loại" value={catalogEntries.length} meta="ID đã đồng bộ từ bank.json" tone="accent" />
        <StatCard label="Đã soạn" value={authoredCount} meta={`${coverage}% độ phủ trên toàn bộ kho`} tone="copper" />
        <StatCard label="Sẵn sàng" value={readyCount} meta="Hồ sơ có thể đưa vào gói đề" tone="ready" />
        <StatCard label="Đang soát" value={reviewCount} meta="Cần kiểm tra lại lời giải / rubric" tone="review" />
        <StatCard label="Giỏ đề" value={selectedCartRows.length} meta="Tập câu hỏi đang chọn để đóng gói" tone="ink" />
      </section>

      <main className="workspace-grid">
        <aside className="paper-panel sidebar-panel">
          <section className="panel-section">
            <div className="section-head">
              <h2>Bộ lọc</h2>
              <button
                type="button"
                className="text-link"
                onClick={() => setFilters(DEFAULT_FILTERS)}
              >
                Đặt lại
              </button>
            </div>

            <label className="field">
              <span className="field__label">Tìm nhanh theo ID / chủ đề / nội dung</span>
              <input
                className="field__control"
                type="search"
                value={filters.query}
                placeholder="VD: 0D1N1-3, mệnh đề, phủ định..."
                onChange={event => updateFilter('query', event.target.value)}
              />
            </label>

            <div className="field-grid">
              <FilterField label="Khối lớp" value={filters.grade} options={filterOptions.grades} onChange={value => updateFilter('grade', value)} />
              <FilterField label="Mạch kiến thức" value={filters.branch} options={filterOptions.branches} onChange={value => updateFilter('branch', value)} />
              <FilterField label="Chương" value={filters.chapter} options={filterOptions.chapters} onChange={value => updateFilter('chapter', value)} />
              <FilterField label="Bài" value={filters.lesson} options={filterOptions.lessons} onChange={value => updateFilter('lesson', value)} />
              <FilterField label="Dạng" value={filters.form} options={filterOptions.forms} onChange={value => updateFilter('form', value)} />
              <FilterField
                label="Trạng thái"
                value={filters.status}
                options={['missing', ...STATUS_OPTIONS.map(option => option.value)]}
                onChange={value => updateFilter('status', value)}
              />
              <FilterField
                label="Loại câu"
                value={filters.type}
                options={QUESTION_TYPE_OPTIONS.map(option => option.value)}
                onChange={value => updateFilter('type', value)}
              />

              <label className="field">
                <span className="field__label">Độ phủ nội dung</span>
                <select
                  className="field__control"
                  value={filters.authored}
                  onChange={event => updateFilter('authored', event.target.value)}
                >
                  <option value="all">Tất cả</option>
                  <option value="authored">Đã có nội dung</option>
                  <option value="missing">Còn thiếu nội dung</option>
                </select>
              </label>
            </div>
          </section>

          <section className="panel-section panel-section--accent">
            <div className="section-head">
              <h2>Gói đề đang chọn</h2>
              <span className="muted-copy">{selectedCartRows.length} ID</span>
            </div>

            <div className="cart-actions">
              <button type="button" className="action-btn action-btn--accent" onClick={handleExportCart} disabled={selectedCartRows.length === 0}>
                Tải gói đề
              </button>
              <button type="button" className="action-btn" onClick={handleCopyCartIds} disabled={selectedCartRows.length === 0}>
                Sao chép ID
              </button>
            </div>

            <div className="cart-list">
              {selectedCartRows.length === 0 ? (
                <p className="empty-copy">Thêm các câu hỏi đã soạn vào giỏ đề để đóng gói nhanh.</p>
              ) : (
                selectedCartRows.map(row => (
                  <button
                    key={row.id}
                    type="button"
                    className="cart-chip"
                    onClick={() => setSelectedId(row.id)}
                  >
                    <span>{row.id}</span>
                    <strong>{TYPE_LABELS[row.record.type]?.shortLabel || 'NA'}</strong>
                  </button>
                ))
              )}
            </div>
          </section>

          <section className="panel-section">
            <div className="section-head">
              <h2>Cảnh báo dữ liệu</h2>
            </div>
            <p className="muted-copy">
              Bản ghi mồ côi: <strong>{orphanIds.length}</strong>
            </p>
            <p className="muted-copy">
              Nếu có bản ghi mồ côi, nghĩa là có câu hỏi trong local JSON không còn tồn tại trong taxonomy hiện tại.
            </p>
          </section>
        </aside>

        <section className="paper-panel catalog-panel">
          <div className="section-head section-head--space">
            <div>
              <h2>Danh mục ID và tiến độ biên soạn</h2>
              <p className="muted-copy">
                {filteredEntries.length} kết quả{filteredEntries.length > VISIBLE_LIMIT ? `, đang hiện ${VISIBLE_LIMIT} mục đầu` : ''}
              </p>
            </div>
            <span className="tiny-note">Bấm vào dòng để chuyển sang trình soạn ở bên phải</span>
          </div>

          <div className="catalog-list">
            {visibleEntries.map(entry => {
              const record = normalizedRecords[entry.id]
              const inCart = cartIds.includes(entry.id)
              const effectiveStatus = record ? record.status : 'missing'

              return (
                <article
                  key={entry.id}
                  className={`catalog-row ${selectedEntry.id === entry.id ? 'is-selected' : ''}`}
                >
                  <button type="button" className="catalog-row__body" onClick={() => setSelectedId(entry.id)}>
                    <div className="catalog-row__topline">
                      <span className="catalog-id">{entry.id}</span>
                      <span className={`status-badge status-badge--${getStatusTone(effectiveStatus)}`}>
                        {STATUS_LABELS[effectiveStatus] || 'Chưa soạn'}
                      </span>
                    </div>

                    <h3>{entry.chapter}</h3>
                    <p className="catalog-meta">{entry.lesson}</p>
                    <p className="catalog-preview">{getPreviewText(entry, record)}</p>

                    <div className="catalog-foot">
                      <span>{entry.form}</span>
                      <span>{record ? TYPE_LABELS[record.type]?.shortLabel || record.type : 'MỚI'}</span>
                      <span>{record ? DIFFICULTY_LABELS[record.difficulty] : DIFFICULTY_LABELS[entry.inferredDifficulty]}</span>
                    </div>
                  </button>

                  <div className="catalog-row__actions">
                    <button
                      type="button"
                      className={`mini-btn ${inCart ? 'is-active' : ''}`}
                      onClick={() => handleToggleCart(entry.id)}
                      disabled={!record}
                    >
                      {inCart ? 'Bỏ khỏi gói' : 'Thêm gói đề'}
                    </button>
                  </div>
                </article>
              )
            })}
          </div>
        </section>

        <section className="paper-panel editor-panel">
          <div className="section-head section-head--space">
            <div>
              <h2>Trình soạn theo ID</h2>
              <p className="muted-copy">Lưu lần cuối: {formatDateTime(normalizedRecords[selectedEntry.id]?.updatedAt)}</p>
            </div>
            <span className={`status-badge status-badge--${editorDirty ? 'draft' : 'ready'}`}>
              {editorDirty ? 'Chưa lưu' : 'Đồng bộ'}
            </span>
          </div>

          <div className="taxonomy-card">
            <div>
              <span className="taxonomy-card__label">ID ổn định</span>
              <strong>{selectedEntry.id}</strong>
            </div>
            <div>
              <span className="taxonomy-card__label">Phân loại</span>
              <p>
                {selectedEntry.grade} / {selectedEntry.branch}
              </p>
            </div>
            <div>
              <span className="taxonomy-card__label">Mục tiêu</span>
              <p>
                {selectedEntry.chapter} / {selectedEntry.lesson} / {selectedEntry.form}
              </p>
            </div>
          </div>

          <div className="field-grid">
            <label className="field">
              <span className="field__label">Loại câu hỏi</span>
              <select className="field__control" value={editorDraft.type} onChange={event => setQuestionType(event.target.value)}>
                {QUESTION_TYPE_OPTIONS.map(option => (
                  <option key={option.value} value={option.value}>
                    {option.label}
                  </option>
                ))}
              </select>
            </label>

            <label className="field">
              <span className="field__label">Trạng thái</span>
              <select className="field__control" value={editorDraft.status} onChange={event => updateDraft({ status: event.target.value })}>
                {STATUS_OPTIONS.map(option => (
                  <option key={option.value} value={option.value}>
                    {option.label}
                  </option>
                ))}
              </select>
            </label>

            <label className="field">
              <span className="field__label">Độ khó</span>
              <select className="field__control" value={editorDraft.difficulty} onChange={event => updateDraft({ difficulty: event.target.value })}>
                {DIFFICULTY_OPTIONS.map(option => (
                  <option key={option.value} value={option.value}>
                    {option.label}
                  </option>
                ))}
              </select>
            </label>

            <label className="field">
              <span className="field__label">Thẻ</span>
              <input
                className="field__control"
                value={editorDraft.tags.join(', ')}
                onChange={event => updateDraft({ tags: normalizeTags(event.target.value) })}
                placeholder="lop10, menh-de, phu-dinh"
              />
            </label>
          </div>

          <label className="field">
            <span className="field__label">Nội dung câu hỏi</span>
            <textarea
              className="field__control field__control--tall"
              value={editorDraft.stem}
              onChange={event => updateDraft({ stem: event.target.value })}
              placeholder="Nhập đề bài, bối cảnh, yêu cầu và dữ liệu cần có..."
            />
          </label>

          {editorDraft.type === 'tn' ? (
            <section className="editor-block">
              <div className="section-head section-head--space">
                <h3>Lựa chọn và đáp án</h3>
                <button
                  type="button"
                  className="text-link"
                  onClick={() => updateDraft({ options: [...editorDraft.options, ''] })}
                >
                  Thêm lựa chọn
                </button>
              </div>

              <div className="stack-list">
                {editorDraft.options.map((option, index) => (
                  <div key={`${selectedEntry.id}-option-${index}`} className="option-row">
                    <label className="radio-pill">
                      <input
                        type="radio"
                        name="correct-answer"
                        checked={editorDraft.correctAnswers[0] === index + 1}
                        onChange={() => updateDraft({ correctAnswers: [index + 1] })}
                      />
                      <span>Đáp án {index + 1}</span>
                    </label>
                    <textarea
                      className="field__control option-row__control"
                      value={option}
                      onChange={event => updateOption(index, event.target.value)}
                      placeholder={`Lựa chọn ${index + 1}`}
                    />
                  </div>
                ))}
              </div>
            </section>
          ) : null}

          {editorDraft.type === 'ds' ? (
            <section className="editor-block">
              <div className="section-head section-head--space">
                <h3>Phát biểu đúng / sai</h3>
                <button
                  type="button"
                  className="text-link"
                  onClick={() => updateDraft({ statements: [...editorDraft.statements, { text: '', correct: false }] })}
                >
                  Thêm phát biểu
                </button>
              </div>

              <div className="stack-list">
                {editorDraft.statements.map((statement, index) => (
                  <div key={`${selectedEntry.id}-statement-${index}`} className="statement-row">
                    <label className="toggle-pill">
                      <input
                        type="checkbox"
                        checked={statement.correct}
                        onChange={event => updateStatement(index, { correct: event.target.checked })}
                      />
                      <span>{statement.correct ? 'Đúng' : 'Sai'}</span>
                    </label>
                    <textarea
                      className="field__control statement-row__control"
                      value={statement.text}
                      onChange={event => updateStatement(index, { text: event.target.value })}
                      placeholder={`Phát biểu ${index + 1}`}
                    />
                  </div>
                ))}
              </div>
            </section>
          ) : null}

          {editorDraft.type === 'tln' ? (
            <label className="field">
              <span className="field__label">Đáp án ngắn</span>
              <input
                className="field__control"
                value={editorDraft.shortAnswer}
                onChange={event => updateDraft({ shortAnswer: event.target.value })}
                placeholder="Nhập đáp án ngắn / giá trị kỳ vọng"
              />
            </label>
          ) : null}

          <label className="field">
            <span className="field__label">Lời giải / rubric</span>
            <textarea
              className="field__control field__control--medium"
              value={editorDraft.solution}
              onChange={event => updateDraft({ solution: event.target.value })}
              placeholder="Nhập hướng giải, đáp án mẫu hoặc rubric chấm điểm"
            />
          </label>

          <label className="field">
            <span className="field__label">Ghi chú biên soạn</span>
            <textarea
              className="field__control"
              value={editorDraft.note}
              onChange={event => updateDraft({ note: event.target.value })}
              placeholder="Cảnh báo, yêu cầu hình vẽ, tài liệu gốc hoặc ghi chú nội bộ"
            />
          </label>

          <div className="editor-actions">
            <button type="button" className="action-btn action-btn--accent" onClick={handleSaveRecord}>
              Lưu hồ sơ
            </button>
            <button type="button" className="action-btn" onClick={() => setEditorDraft(createRecordDraft(selectedEntry))}>
              Tạo trang mới
            </button>
            <button
              type="button"
              className="action-btn action-btn--danger"
              onClick={handleDeleteRecord}
              disabled={!normalizedRecords[selectedEntry.id]}
            >
              Xóa nội dung
            </button>
          </div>
        </section>
      </main>
    </div>
  )
}

export default App
