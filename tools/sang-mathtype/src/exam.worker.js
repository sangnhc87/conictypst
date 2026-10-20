/* Chạy bộ máy Python trộn đề của thầy cô ngay trong trình duyệt (Pyodide) để add-in trộn được đề trong Word Online / Windows / Mac.
   Worker kiểu cổ điển (không qua bundler): được nạp bằng new Worker('exam.worker.js'). */
/* global importScripts, loadPyodide */
importScripts('https://cdn.jsdelivr.net/pyodide/v0.26.1/full/pyodide.js')

let ready = null

function init(base) {
  if (!ready) {
    ready = (async () => {
      const py = await loadPyodide()
      await py.loadPackage('micropip')
      await py.runPythonAsync("import micropip\nawait micropip.install('openpyxl')") // openpyxl cài từ PyPI giống app trộn đề gốc
      for (const name of ['docx_shuffler.py', 'sm_analyze.py']) {
        const res = await fetch(`${base}python/${name}`)
        if (!res.ok) throw new Error(`Không tải được ${name} (${res.status})`)
        py.FS.writeFile(name, new Uint8Array(await res.arrayBuffer()))
      }
      return { analyze: py.pyimport('sm_analyze'), py }
    })()
    ready.catch(() => { ready = null })
  }
  return ready
}

self.onmessage = async event => {
  const { id, type, base, bytes, options } = event.data
  try {
    const mods = await init(base)
    if (type === 'init') { self.postMessage({ id, ok: true }); return }
    if (type === 'analyze') {
      const json = await mods.analyze.analyze_exam_js(bytes)
      self.postMessage({ id, ok: true, result: JSON.parse(json) })
    } else if (type === 'shuffle') {
      const proxy = await mods.analyze.shuffle_pack(bytes, options)
      const out = proxy.toJs({ dict_converter: Object.fromEntries })
      proxy.destroy()
      const transfer = Object.values(out.files).map(b => b.buffer)
      self.postMessage({ id, ok: true, result: out }, transfer)
    } else {
      throw new Error(`Lệnh không biết: ${type}`)
    }
  } catch (err) {
    self.postMessage({ id, ok: false, error: String(err && err.message || err) })
  }
}
