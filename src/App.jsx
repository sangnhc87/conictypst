import React, { startTransition, useDeferredValue, useEffect, useMemo, useRef, useState } from 'react'
import bankCatalog from '../bank.json'
import TemplateGen from './TemplateGen.jsx'
import TypstEditor from './TypstEditor.jsx'
import CeTZGallery from './CeTZGallery.jsx'
import ExamShuffler from './ExamShuffler.jsx'
import ExtractImages from './ExtractImages.jsx'
import Pdv3StudioPage from './Pdv3StudioPage.jsx'
import ExamApp from './exam/ExamApp.jsx'
import GiaiToanApp from './giaitoan/GiaiToanApp.jsx'
import FileBrowser from './FileBrowser.jsx'
import SimilarGenerator from './SimilarGenerator.jsx'
import {
  DIFFICULTY_BY_CODE,
  DIFFICULTY_OPTIONS,
  QUESTION_TYPE_OPTIONS,
  SAMPLE_RECORDS,
  STATUS_OPTIONS,
  createEmptyOptionArray,
  createEmptyStatements,
} from './questionBankSeed.js'
import {
  buildQuestionBankPayload,
  recordsFromQuestionBankPayload,
  typstForRecords,
  typstQuestionForRecord,
} from './questionBankFormat.js'

const STORAGE_KEY = 'conictypst.question-bank.records.v2'
const CART_KEY = 'conictypst.question-bank.cart.v1'
const PACKS_KEY = 'conictypst.question-bank.packs.v1'
const FEATURED_BUNDLE_URL = '/data/ngo-duc-tai-hk1-bundle-with-figures.v1.json'
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
  collection: '',
  figure: '',
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
    bankId: entry?.bankId || entry?.id || '',
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
    bankId: String(source.bankId || entry?.bankId || source.id || fallback.bankId || ''),
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
    source: String(source.source || ''),
    sourcePage: String(source.sourcePage || ''),
    sourcePdf: String(source.sourcePdf || ''),
    collection: String(source.collection || ''),
    examId: String(source.examId || ''),
    examTitle: String(source.examTitle || ''),
    figure: String(source.figure || ''),
    figureAlt: String(source.figureAlt || ''),
    figureStatus: String(source.figureStatus || ''),
    confidence: String(source.confidence || ''),
    reviewNotes: String(source.reviewNotes || ''),
    answerVerified: Boolean(source.answerVerified),
    solutionVerified: Boolean(source.solutionVerified),
    updatedAt: String(source.updatedAt || ''),
    createdAt: String(source.createdAt || ''),
  }
}

function serializeRecord(record, entry, baselineRecord) {
  const normalized = normalizeRecord(record, entry)
  const now = new Date().toISOString()

  return {
    id: normalized.id,
    bankId: normalized.bankId,
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
    source: normalized.source.trim(),
    sourcePage: normalized.sourcePage.trim(),
    sourcePdf: normalized.sourcePdf.trim(),
    collection: normalized.collection.trim(),
    examId: normalized.examId.trim(),
    examTitle: normalized.examTitle.trim(),
    figure: normalized.figure.trim(),
    figureAlt: normalized.figureAlt.trim(),
    figureStatus: normalized.figureStatus.trim(),
    confidence: normalized.confidence.trim(),
    reviewNotes: normalized.reviewNotes.trim(),
    answerVerified: normalized.answerVerified,
    solutionVerified: normalized.solutionVerified,
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
    record?.source,
    record?.sourcePdf,
    record?.collection,
    record?.examId,
    record?.examTitle,
    record?.figure,
    record?.figureAlt,
    record?.reviewNotes,
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
  if (filters.collection && record?.collection !== filters.collection) return false
  if (filters.figure && (filters.figure === 'has' ? !record?.figure : Boolean(record?.figure))) return false
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

function buildExportPayload(ids, recordsById, taxonomyById) {
  const questions = ids
    .filter(id => recordsById[id])
    .map(id => ({
      taxonomy: taxonomyById.get(recordsById[id].bankId || id) || null,
      record: recordsById[id],
    }))

  return {
    exportedAt: new Date().toISOString(),
    questionCount: questions.length,
    questions,
  }
}

function shuffleItems(items) {
  const result = [...items]
  for (let index = result.length - 1; index > 0; index -= 1) {
    const swapIndex = Math.floor(Math.random() * (index + 1))
    ;[result[index], result[swapIndex]] = [result[swapIndex], result[index]]
  }
  return result
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

function coerceImportedRecords(payload, taxonomyById) {
  const source = recordsFromQuestionBankPayload(payload)

  if (!source || typeof source !== 'object') {
    return {}
  }

  return Object.fromEntries(
    Object.entries(source)
      .filter(([id]) => typeof id === 'string')
      .map(([id, value]) => [id, normalizeRecord({ ...value, id }, taxonomyById.get(value?.bankId || id))]),
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
  const isDesktopRuntime = typeof window !== 'undefined' && Boolean(window.desktopApi)
  const catalogEntries = useMemo(() => parseBankCatalog(bankCatalog), [])
  const taxonomyById = useMemo(() => new Map(catalogEntries.map(entry => [entry.id, entry])), [catalogEntries])
  const hadStoredRecords = useRef(typeof window !== 'undefined' && Boolean(window.localStorage.getItem(STORAGE_KEY)))
  const [records, setRecords] = useLocalStorageState(STORAGE_KEY, SAMPLE_RECORDS)
  const [cartIds, setCartIds] = useLocalStorageState(CART_KEY, Object.keys(SAMPLE_RECORDS))
  const [savedPacks, setSavedPacks] = useLocalStorageState(PACKS_KEY, [])
  const [filters, setFilters] = useState(DEFAULT_FILTERS)
  const [randomCount, setRandomCount] = useState(10)
  const [randomType, setRandomType] = useState('')
  const [randomDifficulty, setRandomDifficulty] = useState('')
  const [packName, setPackName] = useState('')
  const [bundleLoading, setBundleLoading] = useState(false)
  const [selectedId, setSelectedId] = useState(Object.keys(SAMPLE_RECORDS)[0] || catalogEntries[0]?.id || '')
  const [editorDraft, setEditorDraft] = useState(null)
  const [notice, setNotice] = useState(null)
  const [activeView, setActiveView] = useState(isDesktopRuntime ? 'extract' : 'bank')
  const [viewMode, setViewMode] = useState('flat')
  const importInputRef = useRef(null)
  const deferredQuery = useDeferredValue(filters.query.trim().toLowerCase())

  useEffect(() => {
    document.title = activeView === 'gen'
      ? 'ConicTypst - Tạo khung dự án'
      : activeView === 'editor'
        ? 'ConicTypst - Editor'
        : activeView === 'texdocx'
          ? 'ConicTypst - TeX to DOCX'
          : activeView === 'shuffle'
            ? 'ConicTypst - Trộn đề'
            : activeView === 'exam'
              ? 'ConicTypst - Thi Online'
              : activeView === 'giaitoan'
                ? 'ConicTypst - Giải Toán'
                : activeView === 'extract'
                  ? 'ConicTypst - Typ to DOCX'
                  : activeView === 'filebrowser'
                    ? 'ConicTypst - Thư viện Typst'
                    : 'ConicTypst - Quản lý ngân hàng câu hỏi'
  }, [activeView])

  const navTabs = isDesktopRuntime
    ? [
      { id: 'extract', label: 'Typ -> DOCX' },
      { id: 'texdocx', label: 'TeX -> DOCX' },
    ]
    : [
      { id: 'bank', label: 'Ngân hàng' },
      { id: 'similar', label: 'Sinh Tương Tự' },
      { id: 'filebrowser', label: '📁 Thư viện' },
      { id: 'gen', label: 'Tạo khung' },
      { id: 'editor', label: 'Editor' },
      { id: 'cetz', label: 'CeTZ Gallery' },
      { id: 'shuffle', label: 'Trộn đề' },
      { id: 'exam', label: '🎓 Thi Online' },
      { id: 'giaitoan', label: '🧭 Giải Toán' },
      { id: 'extract', label: 'Typ -> DOCX' },
      { id: 'texdocx', label: 'TeX -> DOCX' },
    ]

  useEffect(() => {
    setRecords(currentRecords => upgradeLegacySeedRecords(currentRecords))
  }, [setRecords])

  useEffect(() => {
    if (typeof window === 'undefined' || hadStoredRecords.current) return undefined
    let cancelled = false
    setBundleLoading(true)
    fetch(FEATURED_BUNDLE_URL)
      .then(response => {
        if (!response.ok) throw new Error(`HTTP ${response.status}`)
        return response.json()
      })
      .then(payload => {
        if (cancelled) return
        const importedRecords = coerceImportedRecords(payload, taxonomyById)
        if (Object.keys(importedRecords).length === 0) throw new Error('empty bundle')
        setRecords(currentRecords => ({ ...currentRecords, ...importedRecords }))
        setNotice({ tone: 'success', message: `Đã nạp sẵn ${Object.keys(importedRecords).length} câu Ngô Đức Tài` })
      })
      .catch(() => {
        if (!cancelled) setNotice({ tone: 'danger', message: 'Chưa nạp được bộ đề dựng sẵn; bạn có thể nhập JSON thủ công.' })
      })
      .finally(() => {
        if (!cancelled) setBundleLoading(false)
      })
    return () => { cancelled = true }
  }, [setRecords, taxonomyById])

  const normalizedRecords = useMemo(
    () =>
      Object.fromEntries(
        Object.entries(records).map(([id, record]) => [id, normalizeRecord(record, taxonomyById.get(record?.bankId || id))]),
      ),
    [records, taxonomyById],
  )

  const authoredEntries = useMemo(
    () => Object.values(normalizedRecords)
      .filter(record => !taxonomyById.has(record.id))
      .map(record => {
        const taxonomy = taxonomyById.get(record.bankId)
        return {
          id: record.id,
          bankId: record.bankId,
          label: `${record.bankId || 'Không gắn bank ID'} | ${record.collection || record.examTitle || 'Bản ghi nhập'}`,
          grade: taxonomy?.grade || 'Lớp 12',
          branch: taxonomy?.branch || 'Bản ghi nhập',
          chapterTag: taxonomy?.chapterTag || '',
          chapter: taxonomy?.chapter || record.collection || 'Bản ghi nhập',
          lessonTag: taxonomy?.lessonTag || '',
          lesson: taxonomy?.lesson || record.examTitle || record.examId || 'Câu hỏi nguồn',
          formTag: taxonomy?.formTag || '',
          form: taxonomy?.form || record.type,
          inferredDifficulty: taxonomy?.inferredDifficulty || record.difficulty,
          isVariant: true,
        }
      }),
    [normalizedRecords, taxonomyById],
  )
  const displayEntries = useMemo(() => [...catalogEntries, ...authoredEntries], [catalogEntries, authoredEntries])
  const displayById = useMemo(() => new Map(displayEntries.map(entry => [entry.id, entry])), [displayEntries])

  const filterOptions = useMemo(
    () => ({
      grades: uniqueSorted(displayEntries.map(entry => entry.grade)),
      branches: uniqueSorted(displayEntries.map(entry => entry.branch)),
      chapters: uniqueSorted(displayEntries.map(entry => entry.chapter)),
      lessons: uniqueSorted(displayEntries.map(entry => entry.lesson)),
      forms: uniqueSorted(displayEntries.map(entry => entry.form)),
      collections: uniqueSorted(Object.values(normalizedRecords).map(record => record.collection)),
    }),
    [displayEntries, normalizedRecords],
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
      displayEntries
        .filter(entry => matchesFilters(entry, normalizedRecords[entry.id], effectiveFilters))
        .sort((left, right) => sortEntries(left, right, normalizedRecords)),
    [displayEntries, effectiveFilters, normalizedRecords],
  )

  const visibleEntries = filteredEntries.slice(0, VISIBLE_LIMIT)

  const treeData = useMemo(() => {
    if (viewMode !== 'tree') return null
    const tree = {}
    for (const entry of filteredEntries) {
      const grade = entry.grade || 'Không rõ lớp'
      const branch = entry.branch || 'Khác'
      const chapter = entry.chapter || 'Chưa phân chương'
      const lesson = entry.lesson || 'Chưa phân bài'
      if (!tree[grade]) tree[grade] = {}
      if (!tree[grade][branch]) tree[grade][branch] = {}
      if (!tree[grade][branch][chapter]) tree[grade][branch][chapter] = {}
      if (!tree[grade][branch][chapter][lesson]) tree[grade][branch][chapter][lesson] = []
      tree[grade][branch][chapter][lesson].push(entry)
    }
    return tree
  }, [filteredEntries, viewMode])

  const examData = useMemo(() => {
    if (viewMode !== 'exam') return null
    const groups = {}
    for (const entry of filteredEntries) {
      const record = normalizedRecords[entry.id]
      let groupName = 'Chưa phân đề'
      if (record && (record.examTitle || record.collection)) {
        groupName = record.examTitle || record.collection
      }
      if (!groups[groupName]) groups[groupName] = []
      groups[groupName].push(entry)
    }
    return groups
  }, [filteredEntries, normalizedRecords, viewMode])

  const selectedEntry = displayById.get(selectedId) || visibleEntries[0] || displayEntries[0] || null
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
  const orphanIds = Object.values(normalizedRecords).filter(record => !taxonomyById.has(record.bankId || record.id))

  const selectedCartRows = cartIds.map(id => ({ id, entry: displayById.get(id), record: normalizedRecords[id] })).filter(row => row.entry && row.record)

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

  function handleRandomizeCart() {
    const candidates = filteredEntries
      .filter(entry => normalizedRecords[entry.id])
      .filter(entry => !randomType || normalizedRecords[entry.id].type === randomType)
      .filter(entry => !randomDifficulty || normalizedRecords[entry.id].difficulty === randomDifficulty)

    if (candidates.length === 0) {
      setNotice({ tone: 'danger', message: 'Không có câu phù hợp với bộ lọc ngẫu nhiên' })
      return
    }

    const selected = shuffleItems(candidates).slice(0, Math.max(1, Math.min(200, Number(randomCount) || 1)))
    setCartIds(selected.map(entry => entry.id))
    setSelectedId(selected[0].id)
    setNotice({ tone: 'success', message: `Đã chọn ngẫu nhiên ${selected.length} câu vào giỏ đề` })
  }

  function handleSavePack() {
    if (selectedCartRows.length === 0) {
      setNotice({ tone: 'danger', message: 'Hãy chọn câu vào giỏ trước khi lưu gói đề' })
      return
    }

    const label = packName.trim() || `Gói đề ${new Date().toLocaleDateString('vi-VN')}`
    const pack = {
      id: `pack-${Date.now()}`,
      name: label,
      ids: selectedCartRows.map(row => row.id),
      filters,
      createdAt: new Date().toISOString(),
    }
    setSavedPacks(current => [pack, ...current.filter(item => item.name !== label)].slice(0, 50))
    setPackName('')
    setNotice({ tone: 'success', message: `Đã lưu gói “${label}”` })
  }

  function handleLoadPack(pack) {
    const ids = (pack?.ids || []).filter(id => normalizedRecords[id])
    setCartIds(ids)
    if (ids[0]) setSelectedId(ids[0])
    setNotice({ tone: 'success', message: `Đã nạp ${ids.length} câu từ gói “${pack.name}”` })
  }

  function handleDeletePack(packId) {
    setSavedPacks(current => current.filter(pack => pack.id !== packId))
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
    downloadJson('conictypst-question-bank.v1.json', buildQuestionBankPayload(normalizedRecords, {
      source: 'ConicTypst question bank UI',
    }))
    setNotice({ tone: 'success', message: 'Đã tải toàn bộ dữ liệu JSON' })
  }

  function handleExportTypst() {
    const recordsToExport = selectedCartRows.length > 0
      ? selectedCartRows.map(row => row.record)
      : Object.values(normalizedRecords).filter(record => record.status !== 'archived')

    if (!recordsToExport.length) {
      setNotice({ tone: 'danger', message: 'Chưa có câu hỏi đã soạn để xuất Typst' })
      return
    }

    const typ = typstForRecords(recordsToExport, {
      title: 'NGÂN HÀNG CÂU HỎI TOÁN THPT',
      profile: 'loigiai',
    })
    const blob = new Blob([typ], { type: 'text/plain;charset=utf-8' })
    const url = URL.createObjectURL(blob)
    const anchor = document.createElement('a')
    anchor.href = url
    anchor.download = 'conictypst-question-bank-sang-math-1.0.4.typ'
    anchor.click()
    URL.revokeObjectURL(url)
    setNotice({ tone: 'success', message: `Đã xuất ${recordsToExport.length} câu Typst chuẩn 1.0.4` })
  }

  function handleExportCart() {
    const payload = buildExportPayload(cartIds, normalizedRecords, taxonomyById)
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
      const importedRecords = coerceImportedRecords(payload, taxonomyById)

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

  async function handleLoadFeaturedBundle() {
    setBundleLoading(true)
    try {
      const response = await fetch(FEATURED_BUNDLE_URL)
      if (!response.ok) throw new Error(`HTTP ${response.status}`)
      const importedRecords = coerceImportedRecords(await response.json(), taxonomyById)
      setRecords(currentRecords => ({ ...currentRecords, ...importedRecords }))
      setNotice({ tone: 'success', message: `Đã nạp ${Object.keys(importedRecords).length} câu vào kho hiện tại` })
    } catch {
      setNotice({ tone: 'danger', message: 'Không tải được bộ đề dựng sẵn' })
    } finally {
      setBundleLoading(false)
    }
  }

  function handleResetSeed() {
    if (!window.confirm('Khôi phục bộ dữ liệu mẫu và ghi đè local data hiện tại?')) return

    setRecords(SAMPLE_RECORDS)
    setCartIds(Object.keys(SAMPLE_RECORDS))
    setNotice({ tone: 'success', message: 'Đã khôi phục bộ dữ liệu mẫu' })
  }

  async function handleCopyTypst() {
    if (!selectedEntry || !editorDraft) return
    const code = typstQuestionForRecord({ ...editorDraft, id: selectedEntry.id })

    try {
      await navigator.clipboard.writeText(code)
      setNotice({ tone: 'success', message: 'Đã copy mã Typst siêu gọn!' })
    } catch {
      setNotice({ tone: 'danger', message: 'Không thể copy mã Typst' })
    }
  }

  if (!selectedEntry || !editorDraft) {
    return null
  }

  return (
    <div className={`dashboard-shell ${activeView === 'editor' ? 'dashboard-shell--editor' : ''} ${activeView === 'cetz' ? 'dashboard-shell--cetz' : ''}`}>
      <input
        ref={importInputRef}
        className="visually-hidden"
        type="file"
        accept="application/json"
        onChange={handleImportFile}
      />

      <header className="hero-panel paper-panel">
        <div className="hero-copy">
          <h1>{isDesktopRuntime ? 'ConicTypst Desktop' : 'ConicTypst'}</h1>
        </div>

        <nav className="app-tabs">
          {navTabs.map(tab => (
            <button
              key={tab.id}
              type="button"
              className={`app-tab ${activeView === tab.id ? 'app-tab--active' : ''}`}
              onClick={() => setActiveView(tab.id)}
            >
              {tab.label}
            </button>
          ))}
          {!isDesktopRuntime && (
            <a
              className="app-tab"
              href="https://admin-conictypst.pages.dev/account.html"
              target="_blank"
              rel="noreferrer"
            >
              👤 Tài khoản
            </a>
          )}
        </nav>

        {!isDesktopRuntime && <div className="hero-actions">
          <div className="action-stack">
            <button type="button" className="action-btn action-btn--accent" onClick={handleExportAll}>
              Xuất JSON
            </button>
            <button type="button" className="action-btn" onClick={handleExportTypst}>
              Xuất Typst 1.0.4
            </button>
            <button type="button" className="action-btn" onClick={handleImportClick}>
              Nhập JSON
            </button>
            <button type="button" className="action-btn" onClick={handleLoadFeaturedBundle} disabled={bundleLoading}>
              {bundleLoading ? 'Đang nạp bộ đề…' : 'Nạp 40 đề Ngô Đức Tài'}
            </button>
            <button type="button" className="action-btn" onClick={handleResetSeed}>
              Khôi phục mẫu
            </button>
          </div>

          {notice ? <div className={`notice notice--${notice.tone}`}>{notice.message}</div> : null}
        </div>}
      </header>

      {activeView === 'gen' && <TemplateGen />}
      {activeView === 'similar' && <SimilarGenerator />}

      {activeView === 'editor' && <TypstEditor />}

      {activeView === 'cetz' && <CeTZGallery />}

      {activeView === 'shuffle' && <ExamShuffler />}

      {activeView === 'exam' && <ExamApp />}

      {activeView === 'giaitoan' && <GiaiToanApp />}

      {activeView === 'extract' && <ExtractImages />}

      {activeView === 'texdocx' && <Pdv3StudioPage />}

      {activeView === 'filebrowser' && (
        <FileBrowser
          onOpenInEditor={(filePath, content) => {
            // Store the file to open, then switch to editor tab
            window.__filebrowser_open = { filePath, content }
            setActiveView('editor')
          }}
        />
      )}

      {activeView === 'bank' && (
        <>
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
                  <FilterField label="Bộ đề / nguồn" value={filters.collection} options={filterOptions.collections} onChange={value => updateFilter('collection', value)} />
                  <FilterField label="Hình / BBT" value={filters.figure} options={['has', 'missing']} onChange={value => updateFilter('figure', value)} />

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

              <section className="panel-section panel-section--accent">
                <div className="section-head section-head--space">
                  <h2>Chọn ngẫu nhiên</h2>
                  <span className="muted-copy">theo bộ lọc</span>
                </div>
                <div className="field-grid">
                  <label className="field">
                    <span className="field__label">Số câu</span>
                    <input className="field__control" type="number" min="1" max="200" value={randomCount} onChange={event => setRandomCount(event.target.value)} />
                  </label>
                  <FilterField label="Loại" value={randomType} options={QUESTION_TYPE_OPTIONS.map(option => option.value)} onChange={setRandomType} />
                  <FilterField label="Mức độ" value={randomDifficulty} options={DIFFICULTY_OPTIONS.map(option => option.value)} onChange={setRandomDifficulty} />
                </div>
                <button type="button" className="action-btn action-btn--accent" onClick={handleRandomizeCart}>
                  Trộn vào giỏ đề
                </button>
              </section>

              <section className="panel-section">
                <div className="section-head section-head--space">
                  <h2>Gói đã lưu</h2>
                  <span className="muted-copy">{savedPacks.length}</span>
                </div>
                <div className="pack-save-row">
                  <input className="field__control" value={packName} onChange={event => setPackName(event.target.value)} placeholder="Tên gói đề" />
                  <button type="button" className="mini-btn" onClick={handleSavePack}>Lưu</button>
                </div>
                <div className="saved-pack-list">
                  {savedPacks.length === 0 ? <p className="empty-copy">Chưa có preset. Lưu giỏ đề để dùng lại.</p> : savedPacks.map(pack => (
                    <div key={pack.id} className="saved-pack-row">
                      <button type="button" className="saved-pack-row__load" onClick={() => handleLoadPack(pack)}>
                        <strong>{pack.name}</strong>
                        <span>{pack.ids.length} câu</span>
                      </button>
                      <button type="button" className="mini-btn mini-btn--danger" onClick={() => handleDeletePack(pack.id)} aria-label={`Xóa ${pack.name}`}>×</button>
                    </div>
                  ))}
                </div>
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
                <div className="view-mode-tabs">
                  <button type="button" className={`action-btn ${viewMode === 'flat' ? 'action-btn--accent' : ''}`} onClick={() => setViewMode('flat')}>Danh sách</button>
                  <button type="button" className={`action-btn ${viewMode === 'tree' ? 'action-btn--accent' : ''}`} onClick={() => setViewMode('tree')}>Cây thư mục</button>
                  <button type="button" className={`action-btn ${viewMode === 'exam' ? 'action-btn--accent' : ''}`} onClick={() => setViewMode('exam')}>Theo đề</button>
                </div>
              </div>

              {(() => {
                const renderEntry = (entry) => {
                  const record = normalizedRecords[entry.id]
                  const inCart = cartIds.includes(entry.id)
                  const effectiveStatus = record ? record.status : 'missing'

                  return (
                    <article
                      key={entry.id}
                      className={`catalog-row ${selectedEntry?.id === entry.id ? 'is-selected' : ''}`}
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
                }

                if (viewMode === 'flat') {
                  return (
                    <div className="catalog-list">
                      {visibleEntries.map(renderEntry)}
                    </div>
                  )
                }

                if (viewMode === 'exam') {
                  return (
                    <div className="catalog-list catalog-list--grouped">
                      {Object.entries(examData || {}).map(([groupName, entries]) => (
                        <details key={groupName} className="smart-tree-node exam-group-node" open>
                          <summary className="smart-tree-summary">
                            <span className="folder-icon">📝</span> <strong>{groupName}</strong>
                            <span className="node-count">{entries.length} câu</span>
                          </summary>
                          <div className="smart-tree-children catalog-grid">
                            {entries.map(renderEntry)}
                          </div>
                        </details>
                      ))}
                    </div>
                  )
                }

                if (viewMode === 'tree') {
                  return (
                    <div className="catalog-list catalog-list--tree">
                      {Object.entries(treeData || {}).map(([grade, branches]) => (
                        <details key={grade} className="smart-tree-node level-grade">
                          <summary className="smart-tree-summary">
                            <span className="folder-icon">📚</span> <strong>{grade}</strong>
                          </summary>
                          <div className="smart-tree-children">
                            {Object.entries(branches).map(([branch, chapters]) => (
                              <details key={branch} className="smart-tree-node level-branch" open>
                                <summary className="smart-tree-summary">
                                  <span className="folder-icon">📂</span> <strong>{branch}</strong>
                                </summary>
                                <div className="smart-tree-children">
                                  {Object.entries(chapters).map(([chapter, lessons]) => (
                                    <details key={chapter} className="smart-tree-node level-chapter">
                                      <summary className="smart-tree-summary">
                                        <span className="folder-icon">📁</span> <strong>{chapter}</strong>
                                      </summary>
                                      <div className="smart-tree-children">
                                        {Object.entries(lessons).map(([lesson, entries]) => (
                                          <details key={lesson} className="smart-tree-node level-lesson">
                                            <summary className="smart-tree-summary">
                                              <span className="folder-icon">📄</span> <strong>{lesson}</strong>
                                              <span className="node-count">{entries.length} câu</span>
                                            </summary>
                                            <div className="smart-tree-children catalog-grid">
                                              {entries.map(renderEntry)}
                                            </div>
                                          </details>
                                        ))}
                                      </div>
                                    </details>
                                  ))}
                                </div>
                              </details>
                            ))}
                          </div>
                        </details>
                      ))}
                    </div>
                  )
                }

                return null
              })()}
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

              <section className="editor-block">
                <div className="section-head section-head--space">
                  <h3>Nguồn và kiểm duyệt</h3>
                  <span className="tiny-note">Dùng cho câu nhập từ PDF / AI</span>
                </div>
                <div className="field-grid">
                  <label className="field">
                    <span className="field__label">Tệp nguồn</span>
                    <input
                      className="field__control"
                      value={editorDraft.source}
                      onChange={event => updateDraft({ source: event.target.value })}
                      placeholder="de-giua-ky-1.pdf"
                    />
                  </label>
                  <label className="field">
                    <span className="field__label">Trang / vị trí</span>
                    <input
                      className="field__control"
                      value={editorDraft.sourcePage}
                      onChange={event => updateDraft({ sourcePage: event.target.value })}
                      placeholder="trang 3, câu 12"
                    />
                  </label>
                  <label className="field">
                    <span className="field__label">Độ tin cậy</span>
                    <input
                      className="field__control"
                      value={editorDraft.confidence}
                      onChange={event => updateDraft({ confidence: event.target.value })}
                      placeholder="cao / vừa / cần OCR lại"
                    />
                  </label>
                  <label className="field">
                    <span className="field__label">Hình Typst</span>
                    <input
                      className="field__control"
                      value={editorDraft.figure}
                      onChange={event => updateDraft({ figure: event.target.value })}
                      placeholder="figures/de-01-cau-06.png hoặc #cetz.canvas(...)"
                    />
                  </label>
                  <label className="field">
                    <span className="field__label">Mô tả hình</span>
                    <input
                      className="field__control"
                      value={editorDraft.figureAlt}
                      onChange={event => updateDraft({ figureAlt: event.target.value })}
                      placeholder="Đồ thị hàm phân thức có tiệm cận..."
                    />
                  </label>
                </div>
                <div className="editor-checks">
                  <label className="toggle-pill">
                    <input
                      type="checkbox"
                      checked={editorDraft.answerVerified}
                      onChange={event => updateDraft({ answerVerified: event.target.checked })}
                    />
                    <span>Đã kiểm tra đáp án</span>
                  </label>
                  <label className="toggle-pill">
                    <input
                      type="checkbox"
                      checked={editorDraft.solutionVerified}
                      onChange={event => updateDraft({ solutionVerified: event.target.checked })}
                    />
                    <span>Đã kiểm tra lời giải</span>
                  </label>
                </div>
                <label className="field">
                  <span className="field__label">Ghi chú soát lỗi</span>
                  <textarea
                    className="field__control"
                    value={editorDraft.reviewNotes}
                    onChange={event => updateDraft({ reviewNotes: event.target.value })}
                    placeholder="Ví dụ: cần đối chiếu hình ở trang 4; đáp án cần xác minh lại."
                  />
                </label>
              </section>

              <div className="editor-actions">
                <button type="button" className="action-btn action-btn--accent" onClick={handleSaveRecord}>
                  Lưu hồ sơ
                </button>
                <button type="button" className="action-btn action-btn--accent" onClick={handleCopyTypst}>
                  Copy mã Typst
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
        </>
      )}
    </div>
  )
}

export default App
