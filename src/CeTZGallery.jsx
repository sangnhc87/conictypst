import { useState, useCallback, useRef } from 'react'
import { extractTypstBlocks, compileTypstToPngBuffer } from './typstRenderer'

export default function CeTZGallery() {
  const [fileName, setFileName] = useState('')
  const [fileContent, setFileContent] = useState('')
  const [blocks, setBlocks] = useState([])
  const [renderedBlocks, setRenderedBlocks] = useState([])
  const [loading, setLoading] = useState(false)
  const [compilingIdx, setCompilingIdx] = useState(-1)
  const [errors, setErrors] = useState([])
  const [showCode, setShowCode] = useState(false)
  const [dragOver, setDragOver] = useState(false)
  const [filterType, setFilterType] = useState('all')
  const fileInputRef = useRef(null)

  // Handle file load
  const handleFile = useCallback((file) => {
    if (!file) return
    setFileName(file.name)
    setBlocks([])
    setRenderedBlocks([])
    setErrors([])
    setCompilingIdx(-1)
    setFilterType('all')

    const reader = new FileReader()
    reader.onload = (e) => {
      setFileContent(e.target.result)
    }
    reader.readAsText(file)
  }, [])

  // Drag & drop
  const handleDrop = useCallback((e) => {
    e.preventDefault()
    setDragOver(false)
    const file = e.dataTransfer.files[0]
    if (file && (file.name.endsWith('.typ') || file.type === 'text/plain')) {
      handleFile(file)
    }
  }, [handleFile])

  // File input change
  const handleInputChange = useCallback((e) => {
    const file = e.target.files[0]
    if (file) handleFile(file)
  }, [handleFile])

  // Extract blocks
  const extractBlocks = useCallback(() => {
    const found = extractTypstBlocks(fileContent)
    setBlocks(found)
    setRenderedBlocks([])
    setErrors([])
  }, [fileContent])

  // Compile all blocks to PNG
  const compileAll = useCallback(async () => {
    setLoading(true)
    setRenderedBlocks([])
    setErrors([])

    const results = []
    const errs = []

    for (let i = 0; i < blocks.length; i++) {
      setCompilingIdx(i)
      const block = blocks[i]

      try {
        const pngData = await compileTypstToPngBuffer(block)
        results.push({
          ...block,
          index: i,
          pngUrl: URL.createObjectURL(new Blob([pngData.buffer], { type: 'image/png' })),
          width: pngData.width,
          height: pngData.height,
        })
      } catch (err) {
        errs.push({
          index: i,
          prefix: block.prefix,
          message: err.message || String(err),
          code: block.code.substring(0, 120) + '...',
        })
      }
    }

    setRenderedBlocks(results)
    setErrors(errs)
    setCompilingIdx(-1)
    setLoading(false)
  }, [blocks])

  // Download single PNG
  const downloadPng = useCallback((block) => {
    const a = document.createElement('a')
    a.href = block.pngUrl
    const baseName = fileName.replace('.typ', '')
    a.download = `${baseName}-block-${block.index}.png`
    a.click()
  }, [fileName])

  // Download all PNGs
  const downloadAll = useCallback(() => {
    renderedBlocks.forEach((block, i) => {
      setTimeout(() => downloadPng(block), i * 300)
    })
  }, [renderedBlocks, downloadPng])

  // Copy code
  const copyCode = useCallback((block) => {
    navigator.clipboard.writeText(block.code)
  }, [])

  const uniqueTypes = [...new Set(blocks.map(b => b.prefix))]
  const filteredBlocks = filterType === 'all'
    ? renderedBlocks
    : renderedBlocks.filter(b => b.prefix === filterType)

  return (
    <div className="min-h-screen bg-[#0a0a0f] text-gray-100">
      {/* Header */}
      <header className="border-b border-gray-800/60 bg-[#0d0d14]/80 backdrop-blur sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-6 py-3 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-cyan-500 to-blue-600 flex items-center justify-center text-sm font-bold shadow-lg shadow-cyan-500/20">C</div>
            <div>
              <h1 className="text-lg font-bold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent">
                CeTZ Block Extractor
              </h1>
              <p className="text-[11px] text-gray-500 -mt-0.5">Upload .typ → Extract CeTZ/BBT → PNG Gallery</p>
            </div>
          </div>
          {renderedBlocks.length > 0 && (
            <button
              onClick={() => setShowCode(!showCode)}
              className={`px-3 py-1.5 rounded-md text-xs font-medium transition-colors ${
                showCode ? 'bg-cyan-600 text-white' : 'bg-gray-800 text-gray-400 hover:text-white'
              }`}
            >
              {showCode ? 'Ẩn code' : 'Hiện code'}
            </button>
          )}
        </div>
      </header>

      <main className="max-w-7xl mx-auto px-6 py-6">
        {/* Upload area */}
        {!fileContent && (
          <div
            className={`border-2 border-dashed rounded-2xl p-16 text-center transition-all cursor-pointer ${
              dragOver
                ? 'border-cyan-500 bg-cyan-500/5'
                : 'border-gray-700 hover:border-gray-600 hover:bg-gray-900/30'
            }`}
            onDragOver={(e) => { e.preventDefault(); setDragOver(true) }}
            onDragLeave={() => setDragOver(false)}
            onDrop={handleDrop}
            onClick={() => fileInputRef.current?.click()}
          >
            <input
              ref={fileInputRef}
              type="file"
              accept=".typ,text/plain"
              className="hidden"
              onChange={handleInputChange}
            />
            <div className="w-16 h-16 mx-auto mb-4 rounded-2xl bg-gray-800/50 flex items-center justify-center">
              <svg className="w-8 h-8 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3" />
              </svg>
            </div>
            <h3 className="text-lg font-medium text-gray-300 mb-1">Kéo thả file .typ vào đây</h3>
            <p className="text-sm text-gray-600">hoặc click để chọn file — hỗ trợ đề thi, chuyên đề, sách...</p>
          </div>
        )}

        {/* File loaded — actions */}
        {fileContent && (
          <>
            {/* File info bar */}
            <div className="mb-6 flex items-center justify-between bg-gray-900/50 rounded-xl px-4 py-3 border border-gray-800/60">
              <div className="flex items-center gap-3">
                <div className="w-8 h-8 rounded-lg bg-gray-800 flex items-center justify-center">
                  <svg className="w-4 h-4 text-cyan-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                  </svg>
                </div>
                <div>
                  <div className="text-sm font-medium text-gray-200">{fileName}</div>
                  <div className="text-xs text-gray-500">{fileContent.length.toLocaleString()} ký tự · {(fileContent.length / 1024).toFixed(1)} KB</div>
                </div>
              </div>
              <div className="flex gap-2">
                <button
                  onClick={() => { setFileName(''); setFileContent(''); setBlocks([]); setRenderedBlocks([]); setErrors([]); }}
                  className="px-3 py-1.5 rounded-lg text-xs bg-gray-800 text-gray-400 hover:text-white hover:bg-gray-700 transition-colors"
                >
                  Đổi file
                </button>
                <button
                  onClick={extractBlocks}
                  className="px-4 py-1.5 rounded-lg text-xs font-medium bg-emerald-600/90 hover:bg-emerald-500 text-white transition-colors"
                >
                  Trích xuất blocks
                </button>
              </div>
            </div>

            {/* Action buttons */}
            {blocks.length > 0 && (
              <div className="mb-6 flex flex-wrap gap-3 items-center">
                <button
                  onClick={compileAll}
                  disabled={loading}
                  className="px-5 py-2 rounded-lg bg-blue-600 hover:bg-blue-500 disabled:opacity-40 disabled:cursor-not-allowed text-white font-medium text-sm transition-colors shadow-lg shadow-blue-600/10"
                >
                  {loading
                    ? `Đang biên dịch... (${compilingIdx + 1}/${blocks.length})`
                    : `Biên dịch ${blocks.length} blocks → PNG`}
                </button>

                {renderedBlocks.length > 0 && (
                  <button
                    onClick={downloadAll}
                    className="px-5 py-2 rounded-lg bg-purple-600/90 hover:bg-purple-500 text-white font-medium text-sm transition-colors"
                  >
                    Tải tất cả ({renderedBlocks.length})
                  </button>
                )}

                {/* Stats */}
                <div className="ml-auto flex gap-4 text-xs text-gray-500">
                  <span><span className="text-blue-400 font-bold text-base">{blocks.length}</span> blocks</span>
                  <span><span className="text-emerald-400 font-bold text-base">{renderedBlocks.length}</span> thành công</span>
                  {errors.length > 0 && <span><span className="text-red-400 font-bold text-base">{errors.length}</span> lỗi</span>}
                </div>
              </div>
            )}

            {/* Filter */}
            {uniqueTypes.length > 1 && renderedBlocks.length > 0 && (
              <div className="mb-6 flex flex-wrap gap-2 items-center">
                <span className="text-xs text-gray-500 mr-1">Lọc:</span>
                <button
                  onClick={() => setFilterType('all')}
                  className={`px-2.5 py-1 rounded text-xs font-medium transition-colors ${
                    filterType === 'all' ? 'bg-blue-600 text-white' : 'bg-gray-800 text-gray-500 hover:text-gray-300'
                  }`}
                >
                  Tất cả
                </button>
                {uniqueTypes.map(p => {
                  const count = renderedBlocks.filter(b => b.prefix === p).length
                  return (
                    <button
                      key={p}
                      onClick={() => setFilterType(p)}
                      className={`px-2.5 py-1 rounded text-xs font-mono font-medium transition-colors ${
                        filterType === p ? 'bg-blue-600 text-white' : 'bg-gray-800 text-gray-500 hover:text-gray-300'
                      }`}
                    >
                      {p.replace('#', '').replace('(', '')} ({count})
                    </button>
                  )
                })}
              </div>
            )}

            {/* Progress bar */}
            {loading && (
              <div className="mb-6">
                <div className="bg-gray-800 rounded-full h-1.5 overflow-hidden">
                  <div
                    className="h-full bg-gradient-to-r from-blue-500 to-cyan-400 transition-all duration-300"
                    style={{ width: `${((compilingIdx + 1) / blocks.length) * 100}%` }}
                  />
                </div>
              </div>
            )}

            {/* Errors */}
            {errors.length > 0 && (
              <div className="mb-6 space-y-2">
                {errors.map((err, i) => (
                  <div key={i} className="bg-red-950/40 border border-red-900/50 rounded-lg p-3">
                    <div className="text-xs text-red-400 font-mono">
                      Block #{err.index} — {err.prefix}
                    </div>
                    <div className="text-xs text-red-300/80 mt-0.5">{err.message}</div>
                  </div>
                ))}
              </div>
            )}

            {/* Gallery grid */}
            {filteredBlocks.length > 0 && (
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                {filteredBlocks.map((block) => (
                  <div
                    key={block.index}
                    className="bg-gray-900/60 rounded-xl border border-gray-800/60 overflow-hidden hover:border-gray-700/80 transition-all group"
                  >
                    {/* Image */}
                    <div className="bg-white p-4 flex items-center justify-center min-h-[100px]">
                      <img
                        src={block.pngUrl}
                        alt={`Block #${block.index}`}
                        className="max-w-full max-h-[280px] object-contain"
                      />
                    </div>

                    {/* Info bar */}
                    <div className="px-3 py-2 border-t border-gray-800/60 flex items-center justify-between">
                      <div className="flex items-center gap-2">
                        <span className="text-[10px] font-mono bg-gray-800 text-cyan-400 px-1.5 py-0.5 rounded">
                          #{block.index}
                        </span>
                        <span className="text-[10px] font-mono text-gray-600">
                          {block.prefix.replace('#', '').replace('(', '')}
                        </span>
                        <span className="text-[10px] text-gray-700">
                          {block.width}×{block.height}
                        </span>
                      </div>
                      <div className="flex gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                        <button onClick={() => downloadPng(block)} className="p-1 rounded hover:bg-gray-800 text-gray-500 hover:text-white transition-colors" title="Tải PNG">
                          <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" /></svg>
                        </button>
                        <button onClick={() => copyCode(block)} className="p-1 rounded hover:bg-gray-800 text-gray-500 hover:text-white transition-colors" title="Copy code">
                          <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" /></svg>
                        </button>
                      </div>
                    </div>

                    {/* Code */}
                    {showCode && (
                      <div className="border-t border-gray-800/60">
                        <pre className="p-3 text-[10px] font-mono text-gray-500 overflow-x-auto max-h-36 overflow-y-auto bg-[#0a0a0f] whitespace-pre-wrap break-all">
                          {block.code}
                        </pre>
                      </div>
                    )}
                  </div>
                ))}
              </div>
            )}

            {/* No blocks found */}
            {blocks.length === 0 && fileContent && (
              <div className="text-center py-16">
                <div className="w-14 h-14 mx-auto mb-3 rounded-xl bg-gray-800/50 flex items-center justify-center">
                  <svg className="w-7 h-7 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                  </svg>
                </div>
                <h3 className="text-base font-medium text-gray-400 mb-1">Không tìm thấy CeTZ/BBT blocks</h3>
                <p className="text-sm text-gray-600">File này không chứa #cetz.canvas, #bbtv2, #bxd, #bbbt...</p>
              </div>
            )}
          </>
        )}
      </main>
    </div>
  )
}
