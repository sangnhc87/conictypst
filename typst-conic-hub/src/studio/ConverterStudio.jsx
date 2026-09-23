/**
 * ConverterStudio.jsx
 * Studio Chuyển Đổi Đa Năng Conic Typst Convert
 * Tích hợp trực tiếp trong TypstConicHub
 * Chuyển đổi 2 chiều: Word / LaTeX / AI / PDF <-> Typst sang-math:1.0.5 <-> Word Cloud Run
 */

import React, { useState, useEffect, useRef } from 'react'
import { parseLatexToTypst } from './converters/latexToTypst.js'
import { parseTypstToLatex } from './converters/typstToLatex.js'
import { parseDocxToTypst } from './converters/docxToTypst.js'
import { cleanAiOutputToTypst } from './converters/aiCleaner.js'
import { recognizeExamWithGemini, recognizeMultiplePagesWithGemini } from './converters/geminiOcr.js'
import { loadPdfDocument, renderPdfPageToImage, extractPdfThumbnails } from './converters/pdfLoader.js'
import {
  convertTypstToDocxCloudRun,
  checkCloudRunHealth,
  getSavedCloudRunUrl,
  saveCloudRunUrl,
  DEFAULT_CLOUDRUN_URL
} from './converters/cloudRunPandoc.js'

const STORAGE_KEY_GEMINI_KEY = 'conictypst_gemini_api_key'
const STORAGE_KEY_GEMINI_MODEL = 'conictypst_gemini_model'

export default function ConverterStudio({
  initialTypstCode = '',
  onApplyToEditor,
  onClose,
  notify = (msg) => alert(msg)
}) {
  const [activeTab, setActiveTab] = useState('docx') // 'docx' | 'latex' | 'ai' | 'gemini'
  const [inputText, setInputText] = useState('')
  const [outputText, setOutputText] = useState(initialTypstCode || '')
  const [extractedImages, setExtractedImages] = useState({}) // { [filename]: Blob }
  const [isProcessing, setIsProcessing] = useState(false)
  const [statusMessage, setStatusMessage] = useState('')

  // Smart PDF / Image OCR States
  const [pdfData, setPdfData] = useState(null) // { file, pdfDoc, numPages, fileName, thumbnails: [] }
  const [selectedPages, setSelectedPages] = useState([])
  const [imagePreview, setImagePreview] = useState(null)
  const [ocrProgress, setOcrProgress] = useState(null) // { current, total, pageNum, percent, status }

  // Settings
  const [isSettingsOpen, setIsSettingsOpen] = useState(false)
  const [cloudRunUrl, setCloudRunUrl] = useState(getSavedCloudRunUrl() || '')
  const [geminiApiKey, setGeminiApiKey] = useState(localStorage.getItem(STORAGE_KEY_GEMINI_KEY) || '')
  const [geminiModel, setGeminiModel] = useState(() => {
    const saved = localStorage.getItem(STORAGE_KEY_GEMINI_MODEL)
    if (!saved || saved === 'gemini-3.1-pro') return 'gemini-3.8-flash'
    return saved
  })
  const [healthStatus, setHealthStatus] = useState(null)
  const [isCheckingHealth, setIsCheckingHealth] = useState(false)

  // Preview Mode: 'code' | 'latex'
  const [previewTab, setPreviewTab] = useState('typst')

  const fileInputRef = useRef(null)

  // Đếm thống kê số lượng câu hỏi trong outputText
  const stats = {
    tn: (outputText.match(/#tn\s*\(/g) || []).length,
    ds: (outputText.match(/#ds\s*\(/g) || []).length,
    tln: (outputText.match(/#tln\s*\(/g) || []).length,
    tl: (outputText.match(/#tl\s*\(/g) || []).length,
    images: Object.keys(extractedImages).length
  }

  // Tải file Word (.docx)
  const handleDocxFile = async (file) => {
    if (!file) return
    setIsProcessing(true)
    setStatusMessage('Đang phân tích cấu trúc Word và công thức OMML...')
    try {
      const { typstCode, images } = await parseDocxToTypst(file, {
        title: file.name.replace(/\.docx$/i, '')
      })
      setOutputText(typstCode)
      setExtractedImages(images)
      setStatusMessage(`Đã chuyển đổi thành công từ Word! Trích xuất ${Object.keys(images).length} hình ảnh.`)
      notify(`Đã chuyển đổi thành công từ file Word! (${Object.keys(images).length} ảnh)`)
    } catch (err) {
      console.error(err)
      notify(`Lỗi đọc file Word: ${err.message}`, 'error')
      setStatusMessage(`Lỗi: ${err.message}`)
    } finally {
      setIsProcessing(false)
    }
  }

  // Chuyển đổi từ LaTeX
  const handleConvertLatex = () => {
    if (!inputText.trim()) {
      notify('Vui lòng dán mã nguồn LaTeX vào ô nhập!', 'error')
      return
    }
    setIsProcessing(true)
    setStatusMessage('Đang phân tích môi trường ex_test và ánh xạ công thức...')
    try {
      const typst = parseLatexToTypst(inputText)
      setOutputText(typst)
      setStatusMessage('Đã chuyển đổi thành công từ LaTeX ex_test sang sang-math:1.0.5!')
      notify('Đã chuyển đổi LaTeX ex_test thành công!')
    } catch (err) {
      console.error(err)
      notify(`Lỗi phân tích LaTeX: ${err.message}`, 'error')
      setStatusMessage(`Lỗi: ${err.message}`)
    } finally {
      setIsProcessing(false)
    }
  }

  // Chuyển đổi từ kết quả AI
  const handleConvertAi = () => {
    if (!inputText.trim()) {
      notify('Vui lòng dán nội dung từ AI vào ô nhập!', 'error')
      return
    }
    setIsProcessing(true)
    setStatusMessage('Đang làm sạch markdown, chuẩn hóa công thức toán...')
    try {
      const typst = cleanAiOutputToTypst(inputText)
      setOutputText(typst)
      setStatusMessage('Đã chuẩn hoá thành công văn bản AI sang sang-math:1.0.5!')
      notify('Đã chuẩn hoá văn bản AI thành công!')
    } catch (err) {
      console.error(err)
      notify(`Lỗi chuẩn hoá AI: ${err.message}`, 'error')
      setStatusMessage(`Lỗi: ${err.message}`)
    } finally {
      setIsProcessing(false)
    }
  }

  // Xử lý nạp file PDF hoặc Ảnh chụp đề thi vào giao diện
  const handleGeminiFile = async (file) => {
    if (!file) return
    const isPdf = file.type === 'application/pdf' || file.name.toLowerCase().endsWith('.pdf')

    if (isPdf) {
      setIsProcessing(true)
      setStatusMessage('Đang nạp file PDF và dựng bộ xem trước các trang...')
      try {
        const { pdfDoc, numPages, fileName } = await loadPdfDocument(file)
        const thumbs = await extractPdfThumbnails(pdfDoc, 30, (curr, tot) => {
          setStatusMessage(`Đang dựng thumbnail trang ${curr}/${tot}...`)
        })
        const allPages = Array.from({ length: numPages }, (_, i) => i + 1)
        setPdfData({ file, pdfDoc, numPages, fileName, thumbnails: thumbs })
        setSelectedPages(allPages)
        setImagePreview(null)
        setStatusMessage(`Đã nạp file PDF "${fileName}" (${numPages} trang). Hãy chọn các trang cần OCR rồi bấm Bắt đầu nhận diện.`)
        notify(`Đã nạp file PDF (${numPages} trang) thành công!`)
      } catch (err) {
        console.error(err)
        notify(`Lỗi đọc file PDF: ${err.message}`, 'error')
        setStatusMessage(`Lỗi PDF: ${err.message}`)
      } finally {
        setIsProcessing(false)
      }
    } else {
      // Ảnh đơn
      setPdfData(null)
      setSelectedPages([])
      const reader = new FileReader()
      reader.onload = () => {
        setImagePreview(reader.result)
        setStatusMessage(`Đã nạp ảnh "${file.name}". Bấm "Nhận diện ảnh đề thi" để xử lý bằng Gemini AI.`)
      }
      reader.readAsDataURL(file)
    }
  }

  // Toggle chọn trang PDF
  const toggleSelectPage = (pageNum) => {
    setSelectedPages((prev) =>
      prev.includes(pageNum) ? prev.filter((p) => p !== pageNum) : [...prev, pageNum].sort((a, b) => a - b)
    )
  }

  const selectAllPages = () => {
    if (!pdfData) return
    setSelectedPages(Array.from({ length: pdfData.numPages }, (_, i) => i + 1))
  }

  const clearSelectedPages = () => {
    setSelectedPages([])
  }

  const selectQuickRange = (rangeType) => {
    if (!pdfData) return
    if (rangeType === 'first') {
      setSelectedPages([1])
    } else if (rangeType === 'first2') {
      setSelectedPages(pdfData.numPages >= 2 ? [1, 2] : [1])
    } else if (rangeType === 'first4') {
      const max = Math.min(4, pdfData.numPages)
      setSelectedPages(Array.from({ length: max }, (_, i) => i + 1))
    }
  }

  // Bắt đầu nhận diện PDF thông minh theo từng trang tuần tự
  const handleStartPdfOcr = async () => {
    if (!pdfData || selectedPages.length === 0) {
      notify('Vui lòng chọn ít nhất 1 trang PDF để nhận diện!', 'error')
      return
    }
    const key = geminiApiKey || localStorage.getItem(STORAGE_KEY_GEMINI_KEY)
    if (!key) {
      setIsSettingsOpen(true)
      notify('Vui lòng nhập Gemini API Key trong Cài đặt để sử dụng tính năng OCR!', 'error')
      return
    }

    setIsProcessing(true)
    setOcrProgress({
      current: 0,
      total: selectedPages.length,
      percent: 5,
      status: `Đang kết xuất hình ảnh sắc nét cho ${selectedPages.length} trang đã chọn...`
    })

    try {
      // 1. Render các trang đã chọn thành ảnh JPEG chất lượng cao (1.6x DPI)
      const pagesToProcess = []
      for (let i = 0; i < selectedPages.length; i++) {
        const pageNum = selectedPages[i]
        setOcrProgress({
          current: i + 1,
          total: selectedPages.length,
          pageNum,
          percent: Math.round(((i + 1) / (selectedPages.length * 2)) * 100),
          status: `Đang kết xuất trang ${pageNum}/${pdfData.numPages}...`
        })
        const img = await renderPdfPageToImage(pdfData.pdfDoc, pageNum, 1.6, 0.9)
        pagesToProcess.push({
          pageNum,
          base64: img.base64,
          mimeType: img.mimeType
        })
      }

      // 2. Nhận diện tuần tự với cơ chế Auto-Retry & Fallback Model
      const { fullTypstCode } = await recognizeMultiplePagesWithGemini(
        pagesToProcess,
        key,
        {
          model: geminiModel,
          title: pdfData.fileName.replace(/\.pdf$/i, '')
        },
        (prog) => {
          const percent = Math.round(50 + (prog.current / prog.total) * 50)
          setOcrProgress({
            ...prog,
            percent
          })
          setStatusMessage(prog.status)
        }
      )

      setOutputText(fullTypstCode)
      setStatusMessage(`Đã hoàn tất nhận diện ${selectedPages.length} trang PDF bằng Gemini AI!`)
      notify(`Nhận diện thành công ${selectedPages.length} trang đề thi!`)
    } catch (err) {
      console.error(err)
      notify(`Lỗi nhận diện PDF: ${err.message}`, 'error')
      setStatusMessage(`Lỗi: ${err.message}`)
    } finally {
      setIsProcessing(false)
      setOcrProgress(null)
    }
  }

  // Nhận diện ảnh đơn qua Gemini
  const handleStartImageOcr = async () => {
    if (!imagePreview) return
    const key = geminiApiKey || localStorage.getItem(STORAGE_KEY_GEMINI_KEY)
    if (!key) {
      setIsSettingsOpen(true)
      notify('Vui lòng nhập Gemini API Key trong Cài đặt để sử dụng tính năng OCR!', 'error')
      return
    }

    setIsProcessing(true)
    setStatusMessage('Đang gửi ảnh sang Gemini Multimodal API...')
    setOcrProgress({ current: 1, total: 1, percent: 50, status: 'Đang phân tích hình ảnh và công thức...' })

    try {
      const code = await recognizeExamWithGemini(imagePreview, 'image/jpeg', key, {
        model: geminiModel,
        onProgress: (p) => {
          setStatusMessage(p.message)
          setOcrProgress({ current: 1, total: 1, percent: 80, status: p.message })
        }
      })
      setOutputText(code)
      setStatusMessage('Gemini đã nhận diện và sinh mã Typst + CeTZ thành công!')
      notify('Nhận diện ảnh đề thi thành công!')
    } catch (err) {
      console.error(err)
      notify(`Lỗi nhận diện ảnh: ${err.message}`, 'error')
      setStatusMessage(`Lỗi: ${err.message}`)
    } finally {
      setIsProcessing(false)
      setOcrProgress(null)
    }
  }

  // Xuất file Word (.docx) qua Google Cloud Run
  const handleExportDocxCloudRun = async () => {
    if (!outputText.trim()) {
      notify('Chưa có nội dung Typst để xuất Word!', 'error')
      return
    }

    setIsProcessing(true)
    setStatusMessage('Đang gửi sang Cloud Run native Pandoc để xuất Word Equation OMML...')
    try {
      const docxBlob = await convertTypstToDocxCloudRun(outputText, extractedImages, {
        cloudRunUrl: cloudRunUrl || DEFAULT_CLOUDRUN_URL
      })

      // Tải file về máy
      const url = URL.createObjectURL(docxBlob)
      const a = document.createElement('a')
      a.href = url
      a.download = 'de-thi-conictypst-equation.docx'
      document.body.appendChild(a)
      a.click()
      document.body.removeChild(a)
      URL.revokeObjectURL(url)

      notify('Đã tải file Word (.docx) xuất sắc nét qua Google Cloud Run!')
      setStatusMessage('Đã tạo file Word DOCX với Equation OMML thành công!')
    } catch (err) {
      console.error(err)
      notify(`Không thể tạo Word qua Cloud Run: ${err.message}. Kiểm tra URL trong Cài đặt.`, 'error')
      setStatusMessage(`Lỗi xuất Word: ${err.message}`)
    } finally {
      setIsProcessing(false)
    }
  }

  // Xuất LaTeX ex_test (.tex)
  const handleExportLatex = () => {
    if (!outputText.trim()) {
      notify('Chưa có nội dung Typst để xuất LaTeX!', 'error')
      return
    }
    try {
      const latex = parseTypstToLatex(outputText)
      const blob = new Blob([latex], { type: 'text/x-tex;charset=utf-8' })
      const url = URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      a.download = 'de-thi-ex_test.tex'
      document.body.appendChild(a)
      a.click()
      document.body.removeChild(a)
      URL.revokeObjectURL(url)
      notify('Đã tải file LaTeX (ex_test.sty) về máy!')
    } catch (err) {
      notify(`Lỗi xuất LaTeX: ${err.message}`, 'error')
    }
  }

  // Tải file Typst (.typ)
  const handleDownloadTypst = () => {
    if (!outputText.trim()) return
    const blob = new Blob([outputText], { type: 'text/plain;charset=utf-8' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = 'de-thi-sang-math.typ'
    document.body.appendChild(a)
    a.click()
    document.body.removeChild(a)
    URL.revokeObjectURL(url)
    notify('Đã tải mã nguồn Typst (.typ) về máy!')
  }

  // Kiểm tra sức khỏe Cloud Run
  const handleCheckHealth = async () => {
    setIsCheckingHealth(true)
    const res = await checkCloudRunHealth(cloudRunUrl)
    setHealthStatus(res)
    setIsCheckingHealth(false)
  }

  const handleSaveSettings = () => {
    saveCloudRunUrl(cloudRunUrl)
    localStorage.setItem(STORAGE_KEY_GEMINI_MODEL, geminiModel)
    if (geminiApiKey) {
      localStorage.setItem(STORAGE_KEY_GEMINI_KEY, geminiApiKey.trim())
    } else {
      localStorage.removeItem(STORAGE_KEY_GEMINI_KEY)
    }
    setIsSettingsOpen(false)
    notify('Đã lưu cài đặt kết nối!')
  }

  return (
    <div className="converter-studio-container">
      {/* Topbar điều hướng */}
      <header className="converter-header">
        <div className="converter-header__left">
          <button type="button" className="converter-btn-back" onClick={onClose} title="Quay lại Studio Soạn Thảo">
            ← Studio
          </button>
          <div className="converter-brand">
            <span className="converter-brand__tag">Conic</span>
            <h2>Conic Typst Convert</h2>
          </div>
          <div className="converter-badges">
            <span className="badge badge--green">sang-math:1.0.5</span>
            <span className="badge badge--orange">Word Equation OMML</span>
            <span className="badge badge--blue">Cloud Run Native</span>
          </div>
        </div>

        <div className="converter-header__actions">
          <button
            type="button"
            className="converter-btn converter-btn--apply"
            onClick={() => onApplyToEditor && onApplyToEditor(outputText, extractedImages)}
            disabled={!outputText.trim()}
            title="Đưa mã Typst này vào Editor hiện tại để biên dịch và sửa tiếp"
          >
            📥 Mở trong Editor
          </button>

          <button
            type="button"
            className="converter-btn converter-btn--word"
            onClick={handleExportDocxCloudRun}
            disabled={isProcessing || !outputText.trim()}
            title="Xuất Word chất lượng cao với công thức Equation OMML qua Google Cloud Run"
          >
            📘 Xuất Word (Cloud Run)
          </button>

          <button
            type="button"
            className="converter-btn converter-btn--latex"
            onClick={handleExportLatex}
            disabled={!outputText.trim()}
            title="Xuất đề thi chuẩn gói LaTeX ex_test.sty"
          >
            📗 Xuất LaTeX (ex_test)
          </button>

          <button
            type="button"
            className="converter-btn converter-btn--typst"
            onClick={handleDownloadTypst}
            disabled={!outputText.trim()}
            title="Tải tệp mã nguồn .typ"
          >
            📙 Tải .typ
          </button>

          <button
            type="button"
            className="converter-btn converter-btn--settings"
            onClick={() => setIsSettingsOpen(true)}
            title="Cấu hình Google Cloud Run & Gemini API"
          >
            ⚙️ Cài đặt
          </button>
        </div>
      </header>

      {/* Thân chính: 2 cột (Nguồn nhập và Kết quả đích) */}
      <div className="converter-main-layout">
        {/* CỘT TRÁI: NGUỒN NHẬP */}
        <div className="converter-panel converter-panel--source">
          <div className="converter-tabs">
            <button
              className={`converter-tab ${activeTab === 'docx' ? 'is-active' : ''}`}
              onClick={() => setActiveTab('docx')}
            >
              📄 1. Word (.docx)
            </button>
            <button
              className={`converter-tab ${activeTab === 'latex' ? 'is-active' : ''}`}
              onClick={() => setActiveTab('latex')}
            >
              📘 2. LaTeX (ex_test)
            </button>
            <button
              className={`converter-tab ${activeTab === 'ai' ? 'is-active' : ''}`}
              onClick={() => setActiveTab('ai')}
            >
              🤖 3. AI (ChatGPT/NotebookLM)
            </button>
            <button
              className={`converter-tab ${activeTab === 'gemini' ? 'is-active' : ''}`}
              onClick={() => setActiveTab('gemini')}
            >
              📷 4. PDF / Ảnh (Gemini OCR)
            </button>
          </div>

          <div className="converter-tab-content">
            {/* TAB 1: WORD DOCX */}
            {activeTab === 'docx' && (
              <div className="converter-dropzone-box">
                <div
                  className="converter-dropzone"
                  onClick={() => fileInputRef.current?.click()}
                  onDragOver={(e) => e.preventDefault()}
                  onDrop={(e) => {
                    e.preventDefault()
                    if (e.dataTransfer.files?.[0]) handleDocxFile(e.dataTransfer.files[0])
                  }}
                >
                  <span className="dropzone-icon">📄</span>
                  <h3>Kéo thả file Word (.docx) vào đây</h3>
                  <p>Hỗ trợ trích xuất công thức Equation OMML, MathType và hình ảnh trong Word</p>
                  <button type="button" className="btn-select-file">Chọn tệp từ máy tính</button>
                  <input
                    type="file"
                    ref={fileInputRef}
                    accept=".docx"
                    style={{ display: 'none' }}
                    onChange={(e) => {
                      if (e.target.files?.[0]) handleDocxFile(e.target.files[0])
                    }}
                  />
                </div>
                <div className="converter-hint-box">
                  <b>💡 Điểm nổi bật:</b> Giữ nguyên các phương án A, B, C, D, tự động ánh xạ sang dạng thức trắc nghiệm <code>#tn</code>, <code>#ds</code>, <code>#tln</code> chuẩn BGD 2025.
                </div>
              </div>
            )}

            {/* TAB 2: LATEX EX_TEST */}
            {activeTab === 'latex' && (
              <div className="converter-editor-box">
                <div className="box-header">
                  <span>Dán mã nguồn LaTeX (gói ex_test, \\choice, \\choiceTF, \\shortans):</span>
                  <button
                    type="button"
                    className="btn-action-sm"
                    onClick={() => {
                      // Nạp mã LaTeX từ Typst hiện tại nếu muốn đảo ngược
                      if (outputText) setInputText(parseTypstToLatex(outputText))
                    }}
                  >
                    Đảo từ Typst sang
                  </button>
                </div>
                <textarea
                  className="converter-textarea"
                  value={inputText}
                  onChange={(e) => setInputText(e.target.value)}
                  placeholder="Ví dụ:
\begin{ex}
  Cho hàm số $y=x^3-3x$. Mệnh đề nào đúng?
  \choice
    {\True Đồng biến trên $(1; +\infty)$}
    {Nghịch biến trên $(0; 2)$}
    {Cực đại tại $x=1$}
    {Cực tiểu tại $x=-1$}
  \loigiai{Ta có $y'=3x^2-3=0 \Leftrightarrow x=\pm 1$.}
\end{ex}"
                />
                <button
                  type="button"
                  className="converter-btn-process"
                  onClick={handleConvertLatex}
                  disabled={isProcessing || !inputText.trim()}
                >
                  ⚡ Chuyển sang Typst sang-math:1.0.5
                </button>
              </div>
            )}

            {/* TAB 3: AI OUTPUT */}
            {activeTab === 'ai' && (
              <div className="converter-editor-box">
                <div className="box-header">
                  <span>Dán kết quả từ ChatGPT, NotebookLM, DeepSeek, Gemini:</span>
                  <button
                    type="button"
                    className="btn-action-sm"
                    onClick={() => setInputText('')}
                  >
                    Xóa ô nhập
                  </button>
                </div>
                <textarea
                  className="converter-textarea"
                  value={inputText}
                  onChange={(e) => setInputText(e.target.value)}
                  placeholder="Dán toàn bộ đoạn chat hoặc văn bản đề thi từ ChatGPT, NotebookLM vào đây..."
                />
                <button
                  type="button"
                  className="converter-btn-process"
                  onClick={handleConvertAi}
                  disabled={isProcessing || !inputText.trim()}
                >
                  ⚡ Làm sạch & Chuẩn hoá sang-math:1.0.5
                </button>
              </div>
            )}

            {/* TAB 4: PDF / ẢNH (GEMINI) */}
            {activeTab === 'gemini' && (
              <div className="converter-gemini-container">
                {/* 1. Nếu đã nạp file PDF: Hiển thị giao diện Smart PDF Workspace */}
                {pdfData ? (
                  <div className="converter-pdf-workspace">
                    <div className="converter-pdf-workspace__header">
                      <div className="pdf-header-info">
                        <span className="pdf-icon">📑</span>
                        <div>
                          <h4 className="pdf-filename" title={pdfData.fileName}>{pdfData.fileName}</h4>
                          <span className="pdf-meta">
                            Tổng {pdfData.numPages} trang · Đã chọn <b>{selectedPages.length}</b> trang
                          </span>
                        </div>
                      </div>
                      <button
                        type="button"
                        className="btn-change-file"
                        onClick={() => {
                          setPdfData(null)
                          setSelectedPages([])
                          if (fileInputRef.current) fileInputRef.current.value = ''
                        }}
                        disabled={isProcessing}
                      >
                        ✕ Đổi file khác
                      </button>
                    </div>

                    {/* Thanh chọn nhanh phạm vi trang */}
                    <div className="converter-pdf-quick-select">
                      <span className="quick-label">Chọn nhanh:</span>
                      <button
                        type="button"
                        className="btn-quick-tag"
                        onClick={selectAllPages}
                        disabled={isProcessing}
                      >
                        Tất cả ({pdfData.numPages})
                      </button>
                      <button
                        type="button"
                        className="btn-quick-tag"
                        onClick={() => selectQuickRange('first')}
                        disabled={isProcessing}
                      >
                        Trang 1
                      </button>
                      {pdfData.numPages >= 2 && (
                        <button
                          type="button"
                          className="btn-quick-tag"
                          onClick={() => selectQuickRange('first2')}
                          disabled={isProcessing}
                        >
                          Trang 1-2
                        </button>
                      )}
                      {pdfData.numPages >= 4 && (
                        <button
                          type="button"
                          className="btn-quick-tag"
                          onClick={() => selectQuickRange('first4')}
                          disabled={isProcessing}
                        >
                          Trang 1-4
                        </button>
                      )}
                      <button
                        type="button"
                        className="btn-quick-tag btn-quick-tag--clear"
                        onClick={clearSelectedPages}
                        disabled={isProcessing}
                      >
                        Bỏ chọn
                      </button>
                    </div>

                    {/* Lưới thumbnail các trang */}
                    <div className="converter-pdf-grid">
                      {pdfData.thumbnails.map((t) => {
                        const isChecked = selectedPages.includes(t.pageNum)
                        return (
                          <div
                            key={t.pageNum}
                            className={`converter-pdf-thumb-card ${isChecked ? 'is-selected' : ''}`}
                            onClick={() => !isProcessing && toggleSelectPage(t.pageNum)}
                            title={`Bấm để chọn/bỏ chọn Trang ${t.pageNum}`}
                          >
                            <div className="thumb-header">
                              <input
                                type="checkbox"
                                checked={isChecked}
                                onChange={() => {}}
                                disabled={isProcessing}
                              />
                              <span className="thumb-page-num">Trang {t.pageNum}</span>
                            </div>
                            <div className="thumb-img-wrapper">
                              <img src={t.thumbUrl} alt={`Trang ${t.pageNum}`} />
                            </div>
                          </div>
                        )
                      })}
                    </div>

                    {/* Tiến trình nhận diện thông minh */}
                    {isProcessing && ocrProgress && (
                      <div className="converter-pdf-progress-box">
                        <div className="progress-info">
                          <span className="progress-status-text">{ocrProgress.status}</span>
                          <span className="progress-percent">{ocrProgress.percent || 0}%</span>
                        </div>
                        <div className="converter-pdf-progress-bar">
                          <div
                            className="converter-pdf-progress-fill"
                            style={{ width: `${ocrProgress.percent || 0}%` }}
                          />
                        </div>
                        <div className="progress-subtext">
                          Mô hình đang chạy: <code>{geminiModel}</code> (Tự động thử lại và đổi mô hình nếu bận)
                        </div>
                      </div>
                    )}

                    {/* Nút hành động */}
                    <div className="converter-pdf-actions">
                      <button
                        type="button"
                        className="converter-btn-process converter-btn-process--pdf"
                        onClick={handleStartPdfOcr}
                        disabled={isProcessing || selectedPages.length === 0}
                      >
                        {isProcessing ? '↻ Đang nhận diện...' : `⚡ Nhận diện thông minh (${selectedPages.length} trang đã chọn)`}
                      </button>
                    </div>
                  </div>
                ) : imagePreview ? (
                  /* 2. Nếu là ảnh đơn: Hiển thị preview ảnh và nút nhận diện */
                  <div className="converter-image-workspace">
                    <div className="image-preview-header">
                      <span>Bản xem trước ảnh đề thi:</span>
                      <button
                        type="button"
                        className="btn-change-file"
                        onClick={() => {
                          setImagePreview(null)
                          if (fileInputRef.current) fileInputRef.current.value = ''
                        }}
                        disabled={isProcessing}
                      >
                        ✕ Đổi ảnh khác
                      </button>
                    </div>
                    <div className="image-preview-container">
                      <img src={imagePreview} alt="Đề thi đã chọn" />
                    </div>

                    {isProcessing && ocrProgress && (
                      <div className="converter-pdf-progress-box">
                        <div className="progress-info">
                          <span>{ocrProgress.status}</span>
                          <span className="progress-percent">{ocrProgress.percent || 0}%</span>
                        </div>
                        <div className="converter-pdf-progress-bar">
                          <div
                            className="converter-pdf-progress-fill"
                            style={{ width: `${ocrProgress.percent || 0}%` }}
                          />
                        </div>
                      </div>
                    )}

                    <button
                      type="button"
                      className="converter-btn-process"
                      onClick={handleStartImageOcr}
                      disabled={isProcessing}
                    >
                      {isProcessing ? '↻ Đang nhận diện...' : '⚡ Nhận diện ảnh sang Typst sang-math:1.0.5'}
                    </button>
                  </div>
                ) : (
                  /* 3. Dropzone ban đầu khi chưa nạp file */
                  <div className="converter-dropzone-box">
                    <div
                      className="converter-dropzone"
                      onClick={() => fileInputRef.current?.click()}
                      onDragOver={(e) => e.preventDefault()}
                      onDrop={(e) => {
                        e.preventDefault()
                        if (e.dataTransfer.files?.[0]) handleGeminiFile(e.dataTransfer.files[0])
                      }}
                    >
                      <span className="dropzone-icon">📷</span>
                      <h3>Kéo thả file PDF hoặc Ảnh chụp đề thi vào đây</h3>
                      <p>
                        Cơ chế chia trang thông minh & Gemini Vision AI nhận diện đề, công thức, hình CeTZ (sm-*)
                      </p>
                      <button type="button" className="btn-select-file">Chọn tệp PDF / Ảnh</button>
                      <input
                        type="file"
                        ref={fileInputRef}
                        accept="application/pdf,image/*"
                        style={{ display: 'none' }}
                        onChange={(e) => {
                          if (e.target.files?.[0]) handleGeminiFile(e.target.files[0])
                        }}
                      />
                    </div>
                    {!geminiApiKey && (
                      <div className="converter-warning-box">
                        ⚠️ Chưa có Gemini API Key. Bấm <b>Cài đặt</b> để nhập key miễn phí từ Google AI Studio.
                      </div>
                    )}

                    <div className="converter-kaggle-tip-box">
                      <div className="kaggle-tip-content">
                        <span className="kaggle-badge">💡 Mẹo xử lý hàng loạt</span>
                        <p>
                          Nếu cần xử lý hàng chục file PDF đề thi lớn, dùng <b>Kaggle Notebook</b> (quota 30 giờ/tuần miễn phí) để AI chạy ngầm trích xuất hàng trăm trang mà không tốn tài nguyên máy tính.
                        </p>
                      </div>
                      <a
                        href="/downloads/ConicTypst_Kaggle_Batch_OCR.ipynb"
                        download="ConicTypst_Kaggle_Batch_OCR.ipynb"
                        className="btn-download-kaggle-nb"
                        title="Tải sổ tay Kaggle Notebook (.ipynb) về máy"
                      >
                        📥 Tải Notebook Kaggle (.ipynb)
                      </a>
                    </div>
                  </div>
                )}
              </div>
            )}
          </div>

          {/* Thanh trạng thái */}
          {statusMessage && (
            <div className={`converter-status ${isProcessing ? 'is-loading' : ''}`}>
              {isProcessing && <span className="spinner">↻</span>}
              <span>{statusMessage}</span>
            </div>
          )}
        </div>

        {/* CỘT PHẢI: KẾT QUẢ ĐÍCH & XEM TRƯỚC */}
        <div className="converter-panel converter-panel--target">
          <div className="target-header">
            <div className="target-tabs">
              <button
                className={`target-tab ${previewTab === 'typst' ? 'is-active' : ''}`}
                onClick={() => setPreviewTab('typst')}
              >
                📝 Mã Typst (sang-math:1.0.5)
              </button>
              <button
                className={`target-tab ${previewTab === 'latex' ? 'is-active' : ''}`}
                onClick={() => setPreviewTab('latex')}
              >
                📗 Xem trước LaTeX (ex_test)
              </button>
            </div>

            {/* Thống kê câu hỏi */}
            <div className="target-stats">
              <span><b>TN (I):</b> {stats.tn}</span>
              <span><b>Đ/S (II):</b> {stats.ds}</span>
              <span><b>TLN (III):</b> {stats.tln}</span>
              <span><b>TL (IV):</b> {stats.tl}</span>
              {stats.images > 0 && <span><b>Ảnh:</b> {stats.images}</span>}
            </div>
          </div>

          <div className="target-body">
            {previewTab === 'typst' ? (
              <textarea
                className="target-textarea"
                value={outputText}
                onChange={(e) => setOutputText(e.target.value)}
                placeholder="Mã nguồn Typst chuẩn @preview/sang-math:1.0.5 sẽ hiển thị tại đây sau khi chuyển đổi..."
                spellCheck={false}
              />
            ) : (
              <textarea
                className="target-textarea"
                value={outputText ? parseTypstToLatex(outputText) : ''}
                readOnly
                placeholder="Xem trước mã nguồn LaTeX ex_test..."
                spellCheck={false}
              />
            )}
          </div>
        </div>
      </div>

      {/* Modal Cài Đặt Cloud Run & Gemini API */}
      {isSettingsOpen && (
        <div className="converter-modal-overlay">
          <div className="converter-modal">
            <div className="converter-modal__header">
              <h3>⚙️ Cài đặt kết nối Cloud Run & Gemini API</h3>
              <button type="button" onClick={() => setIsSettingsOpen(false)}>×</button>
            </div>

            <div className="converter-modal__body">
              <div className="form-group">
                <label>URL Pandoc Service (Local hoặc Google Cloud Run):</label>
                <input
                  type="url"
                  value={cloudRunUrl || (typeof window !== 'undefined' && window.location.hostname === 'localhost' ? 'http://localhost:8080' : '')}
                  onChange={(e) => setCloudRunUrl(e.target.value)}
                  placeholder="http://localhost:8080 hoặc https://service.a.run.app"
                />
                <small>Dịch vụ chạy native Pandoc 3.x để xuất Word (.docx) chuẩn Equation OMML thật.</small>
                <div className="test-connection-row">
                  <button
                    type="button"
                    className="btn-test"
                    onClick={handleCheckHealth}
                    disabled={isCheckingHealth}
                  >
                    {isCheckingHealth ? 'Đang kiểm tra...' : 'Kiểm tra kết nối'}
                  </button>
                  {healthStatus && (
                    <span className={`health-badge ${healthStatus.ok ? 'is-ok' : 'is-error'}`}>
                      {healthStatus.ok ? `✓ Hoạt động: ${healthStatus.pandocVersion}` : `✗ Lỗi: ${healthStatus.error}`}
                    </span>
                  )}
                </div>
              </div>

              <div className="form-group">
                <label>Google Gemini API Key (dành cho OCR PDF/Ảnh):</label>
                <input
                  type="password"
                  value={geminiApiKey}
                  onChange={(e) => setGeminiApiKey(e.target.value)}
                  placeholder="Dán API Key từ aistudio.google.com..."
                />
                <small>API Key được lưu an toàn trong trình duyệt cục bộ (localStorage) của bạn.</small>
              </div>

              <div className="form-group">
                <label>Phiên bản Mô hình Gemini AI:</label>
                <select
                  value={geminiModel}
                  onChange={(e) => setGeminiModel(e.target.value)}
                  style={{
                    padding: '8px 12px',
                    borderRadius: '6px',
                    border: '1px solid #cbd5e1',
                    fontSize: '13px',
                    background: 'inherit',
                    color: 'inherit'
                  }}
                >
                  <option value="gemini-3.8-flash">⚡ Gemini 3.8 Flash (Mặc định · Mới nhất & Siêu tốc)</option>
                  <option value="gemini-3.7-flash">⚡ Gemini 3.7 Flash (Chuẩn xác & Ổn định)</option>
                  <option value="gemini-3.5-flash">⚡ Gemini 3.5 Flash (Dự phòng tải cao)</option>
                  <option value="gemini-3.1-pro-preview">🧠 Gemini 3.1 Pro Preview (Suy luận sâu & Bài khó)</option>
                </select>
                <small>Hệ thống tự động chuyển mô hình dự phòng nếu mô hình chính bận.</small>
              </div>
            </div>

            <div className="converter-modal__footer">
              <button type="button" className="btn-cancel" onClick={() => setIsSettingsOpen(false)}>
                Hủy
              </button>
              <button type="button" className="btn-save" onClick={handleSaveSettings}>
                Lưu cài đặt
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
