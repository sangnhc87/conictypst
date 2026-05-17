import React, { useState, useRef } from 'react'

export default function ExtractImages() {
  const [isDragging, setIsDragging] = useState(false)
  const [isProcessing, setIsProcessing] = useState(false)
  const [message, setMessage] = useState('')
  const [error, setError] = useState(false)
  const [exportFormat, setExportFormat] = useState('docx')
  const fileInputRef = useRef(null)

  const handleDragOver = (e) => {
    e.preventDefault()
    setIsDragging(true)
  }

  const handleDragLeave = () => {
    setIsDragging(false)
  }

  const handleDrop = (e) => {
    e.preventDefault()
    setIsDragging(false)
    const files = e.dataTransfer.files
    if (files.length > 0) {
      processFile(files[0])
    }
  }

  const handleFileSelect = (e) => {
    const files = e.target.files
    if (files.length > 0) {
      processFile(files[0])
    }
    // reset input
    e.target.value = ''
  }

  const processFile = async (file) => {
    if (!file.name.endsWith('.typ')) {
      setError(true)
      setMessage('Vui lòng chọn file có định dạng .typ')
      return
    }

    try {
      setIsProcessing(true)
      setError(false)
      setMessage('Đang trích xuất và biên dịch ảnh (có thể mất vài giây)...')

      const text = await file.text()

      const endpoint = exportFormat === 'docx' ? '/api/export-docx' : '/api/export-figs'
      const response = await fetch(endpoint, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ content: text })
      })

      if (!response.ok) {
        let errMessage = 'Đã có lỗi xảy ra khi gọi API.'
        try {
          const errData = await response.json()
          errMessage = errData.error || errMessage
        } catch (e) {}
        throw new Error(errMessage)
      }

      const contentType = response.headers.get('Content-Type')
      if (contentType && contentType.includes('application/json')) {
        const errData = await response.json()
        throw new Error(errData.error || 'Có lỗi xảy ra')
      }

      // Download the file
      const blob = await response.blob()
      const url = window.URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      
      if (exportFormat === 'docx') {
        a.download = `${file.name.replace('.typ', '')}_3_versions.zip`
      } else {
        a.download = `${file.name.replace('.typ', '')}_figures.zip`
      }
      
      document.body.appendChild(a)
      a.click()
      window.URL.revokeObjectURL(url)
      document.body.removeChild(a)

      setMessage(`Thành công! File ${exportFormat.toUpperCase()} đã được tải xuống.`)
      setError(false)
    } catch (err) {
      setError(true)
      setMessage(`Lỗi: ${err.message}`)
    } finally {
      setIsProcessing(false)
    }
  }

  return (
    <main className="workspace-grid" style={{ padding: '2rem' }}>
      <div className="paper-panel" style={{ gridColumn: '1 / -1', maxWidth: '800px', margin: '0 auto', width: '100%' }}>
        <h2 style={{ fontSize: '1.5rem', marginBottom: '1rem', color: 'var(--ink)' }}>Xuất DOCX / Ảnh Từ File .typ</h2>
        <p style={{ marginBottom: '1rem', color: 'var(--slate)' }}>
          Kéo thả file <code>.typ</code> của bạn vào ô bên dưới. Hệ thống sẽ tự động trích xuất các khối 
          <code>#cetz.canvas(...)</code> và <code>#bbt(...)</code> thành ảnh PNG.
        </p>

        <div style={{ display: 'flex', gap: '1rem', marginBottom: '2rem', justifyContent: 'center' }}>
          <label style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', cursor: 'pointer' }}>
            <input 
              type="radio" 
              name="format" 
              value="docx" 
              checked={exportFormat === 'docx'} 
              onChange={() => setExportFormat('docx')} 
            />
            <span>Xuất toàn bộ đề sang Word (.zip chứa 3 bản: Đề, Lời Giải, Đáp Án)</span>
          </label>
          <label style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', cursor: 'pointer' }}>
            <input 
              type="radio" 
              name="format" 
              value="zip" 
              checked={exportFormat === 'zip'} 
              onChange={() => setExportFormat('zip')} 
            />
            <span>Chỉ xuất Hình Vẽ (.zip)</span>
          </label>
        </div>

        <div
          style={{
            border: `2px dashed ${isDragging ? 'var(--accent)' : 'var(--slate-light)'}`,
            borderRadius: '8px',
            padding: '4rem 2rem',
            textAlign: 'center',
            backgroundColor: isDragging ? 'var(--accent-wash)' : 'var(--bg-wash)',
            transition: 'all 0.2s ease',
            cursor: 'pointer'
          }}
          onDragOver={handleDragOver}
          onDragLeave={handleDragLeave}
          onDrop={handleDrop}
          onClick={() => fileInputRef.current?.click()}
        >
          <input 
            type="file" 
            accept=".typ" 
            style={{ display: 'none' }} 
            ref={fileInputRef}
            onChange={handleFileSelect}
          />
          
          <div style={{ fontSize: '3rem', marginBottom: '1rem', color: 'var(--accent)' }}>
            📁
          </div>
          <h3 style={{ fontSize: '1.25rem', marginBottom: '0.5rem' }}>
            {isProcessing ? 'Đang xử lý...' : 'Kéo thả file .typ vào đây'}
          </h3>
          {!isProcessing && (
            <p style={{ color: 'var(--slate)' }}>Hoặc click để chọn file từ máy tính</p>
          )}
        </div>

        {message && (
          <div style={{ 
            marginTop: '1.5rem', 
            padding: '1rem', 
            borderRadius: '4px',
            backgroundColor: error ? 'var(--danger-wash)' : 'var(--ready-wash)',
            color: error ? 'var(--danger)' : 'var(--ready-dark)',
            border: `1px solid ${error ? 'var(--danger-light)' : 'var(--ready-light)'}`
          }}>
            {message}
          </div>
        )}
      </div>
    </main>
  )
}
