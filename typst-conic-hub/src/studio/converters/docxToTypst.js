/**
 * docxToTypst.js
 * Trích xuất nội dung từ file Microsoft Word (.docx) sang Typst chuẩn @preview/sang-math:1.0.5
 * Hỗ trợ bóc tách công thức Word Equation (OMML) và ảnh đính kèm từ word/media/
 */

import JSZip from 'jszip'

/**
 * Chuyển một thẻ OMML (<m:oMath> hoặc con của nó) thành chuỗi Typst math
 */
function ommlNodeToTypst(node) {
  if (!node) return ''
  const tag = node.localName || node.nodeName

  switch (tag) {
    case 'oMath':
    case 'oMathPara': {
      let content = ''
      for (const child of node.childNodes) {
        content += ommlNodeToTypst(child)
      }
      return content.trim()
    }

    case 'r': { // math run
      let text = ''
      for (const child of node.childNodes) {
        if (child.localName === 't' || child.nodeName.endsWith(':t')) {
          text += child.textContent || ''
        }
      }
      return text
    }

    case 'f': { // fraction (phân số)
      let num = ''
      let den = ''
      for (const child of node.childNodes) {
        const ctag = child.localName || child.nodeName
        if (ctag === 'num') num = ommlNodeToTypst(child)
        else if (ctag === 'den') den = ommlNodeToTypst(child)
      }
      return `(${num})/(${den})`
    }

    case 'rad': { // radical (căn)
      let deg = ''
      let e = ''
      for (const child of node.childNodes) {
        const ctag = child.localName || child.nodeName
        if (ctag === 'deg') deg = ommlNodeToTypst(child)
        else if (ctag === 'e') e = ommlNodeToTypst(child)
      }
      if (deg && deg.trim()) {
        return `root(${deg.trim()}, ${e})`
      }
      return `sqrt(${e})`
    }

    case 'sSup': { // superscript (mũ)
      let e = ''
      let sup = ''
      for (const child of node.childNodes) {
        const ctag = child.localName || child.nodeName
        if (ctag === 'e') e = ommlNodeToTypst(child)
        else if (ctag === 'sup') sup = ommlNodeToTypst(child)
      }
      return `${e}^(${sup})`
    }

    case 'sSub': { // subscript (chỉ số dưới)
      let e = ''
      let sub = ''
      for (const child of node.childNodes) {
        const ctag = child.localName || child.nodeName
        if (ctag === 'e') e = ommlNodeToTypst(child)
        else if (ctag === 'sub') sub = ommlNodeToTypst(child)
      }
      return `${e}_(${sub})`
    }

    case 'sSubSup': { // cả sub và sup
      let e = ''
      let sub = ''
      let sup = ''
      for (const child of node.childNodes) {
        const ctag = child.localName || child.nodeName
        if (ctag === 'e') e = ommlNodeToTypst(child)
        else if (ctag === 'sub') sub = ommlNodeToTypst(child)
        else if (ctag === 'sup') sup = ommlNodeToTypst(child)
      }
      return `${e}_(${sub})^(${sup})`
    }

    case 'd': { // delimiter (ngoặc)
      let e = ''
      for (const child of node.childNodes) {
        const ctag = child.localName || child.nodeName
        if (ctag === 'e') e = ommlNodeToTypst(child)
      }
      return `(${e})`
    }

    case 'nary': { // integral, sum, etc.
      let chr = ''
      let sub = ''
      let sup = ''
      let e = ''
      for (const child of node.childNodes) {
        const ctag = child.localName || child.nodeName
        if (ctag === 'naryPr') {
          for (const pr of child.childNodes) {
            if ((pr.localName || pr.nodeName) === 'chr') {
              chr = pr.getAttribute('m:val') || pr.getAttribute('val') || ''
            }
          }
        } else if (ctag === 'sub') sub = ommlNodeToTypst(child)
        else if (ctag === 'sup') sup = ommlNodeToTypst(child)
        else if (ctag === 'e') e = ommlNodeToTypst(child)
      }

      let op = 'integral'
      if (chr === '∑' || chr.includes('sum')) op = 'sum'
      if (chr === '∏') op = 'product'

      if (sub && sup) return `${op}_(${sub})^(${sup}) ${e}`
      if (sub) return `${op}_(${sub}) ${e}`
      return `${op} ${e}`
    }

    default: {
      let res = ''
      for (const child of node.childNodes) {
        res += ommlNodeToTypst(child)
      }
      return res
    }
  }
}

/**
 * Đọc file .docx và phân giải thành { typstCode, images }
 */
export async function parseDocxToTypst(docxBlobOrBuffer, options = {}) {
  const { title = 'ĐỀ KIỂM TRA TỪ WORD', school = 'TRƯỜNG THPT ................................' } = options

  const zip = await JSZip.loadAsync(docxBlobOrBuffer)
  const images = {}
  const relsMap = {} // rId -> image filename

  // 1. Đọc quan hệ trong word/_rels/document.xml.rels để ánh xạ rId -> media/imageX.png
  const relsXmlStr = await zip.file('word/_rels/document.xml.rels')?.async('string')
  if (relsXmlStr) {
    const parser = new DOMParser()
    const relsDoc = parser.parseFromString(relsXmlStr, 'application/xml')
    const rels = relsDoc.querySelectorAll('Relationship')
    for (const rel of rels) {
      const id = rel.getAttribute('Id')
      const target = rel.getAttribute('Target')
      if (id && target && target.startsWith('media/')) {
        relsMap[id] = target.replace('media/', '')
      }
    }
  }

  // 2. Trích xuất tất cả ảnh trong thư mục word/media/
  for (const [relativePath, zipEntry] of Object.entries(zip.files)) {
    if (relativePath.startsWith('word/media/') && !zipEntry.dir) {
      const fileName = relativePath.replace('word/media/', '')
      const imageBytes = await zipEntry.async('uint8array')
      // Nhận diện mime type
      const ext = fileName.split('.').pop()?.toLowerCase() || 'png'
      const mime = ext === 'jpg' || ext === 'jpeg' ? 'image/jpeg' : ext === 'svg' ? 'image/svg+xml' : 'image/png'
      const blob = new Blob([imageBytes], { type: mime })
      images[fileName] = blob
    }
  }

  // 3. Đọc và parse word/document.xml
  const docXmlStr = await zip.file('word/document.xml')?.async('string')
  if (!docXmlStr) {
    throw new Error('File không hợp lệ: Không tìm thấy word/document.xml')
  }

  const parser = new DOMParser()
  const doc = parser.parseFromString(docXmlStr, 'application/xml')
  const paragraphs = doc.querySelectorAll('w\\:p, p')

  const parsedParas = []

  for (const p of paragraphs) {
    let paraText = ''
    for (const child of p.childNodes) {
      const tag = child.localName || child.nodeName

      // Xử lý công thức OMML
      if (tag === 'oMath' || tag === 'oMathPara') {
        const mathStr = ommlNodeToTypst(child)
        if (mathStr) {
          paraText += ` $${mathStr}$ `
        }
      }
      // Xử lý text run thông thường
      else if (tag === 'r') {
        for (const rChild of child.childNodes) {
          const rTag = rChild.localName || rChild.nodeName
          if (rTag === 't') {
            paraText += rChild.textContent || ''
          } else if (rTag === 'drawing') {
            // Tìm ảnh trong drawing
            const blips = rChild.querySelectorAll('a\\:blip, blip')
            for (const blip of blips) {
              const rId = blip.getAttribute('r:embed') || blip.getAttribute('embed')
              if (rId && relsMap[rId]) {
                paraText += `\n#image("${relsMap[rId]}", width: 45%)\n`
              }
            }
          }
        }
      }
    }

    const clean = paraText.replace(/\s+/g, ' ').trim()
    if (clean) {
      parsedParas.push(clean)
    }
  }

  // 4. Nhận diện cấu trúc đề thi THPT từ danh sách các đoạn văn
  const fullText = parsedParas.join('\n\n')

  // Gom các câu hỏi
  const questionBlocks = []
  const questionRegex = /(?:^|\n\n)(?:Câu|Bài)\s*(\d+)[:.]\s*([\s\S]*?)(?=(?:\n\n(?:Câu|Bài)\s*\d+[:.]|$))/gi
  let m

  while ((m = questionRegex.exec(fullText)) !== null) {
    const qNum = m[1]
    const content = m[2].trim()
    questionBlocks.push({ qNum, content })
  }

  const tnList = []
  const dsList = []
  const tlnList = []
  const tlList = []

  let autoId = 1

  if (questionBlocks.length > 0) {
    for (const q of questionBlocks) {
      const text = q.content

      // A) Kiểm tra Đúng - Sai: chứa a), b), c), d)
      const dsMatch = text.match(/(?:^|\n)\s*a\)\s*([\s\S]*?)(?:^|\n)\s*b\)\s*([\s\S]*?)(?:^|\n)\s*c\)\s*([\s\S]*?)(?:^|\n)\s*d\)\s*([\s\S]*?)$/i)
      if (dsMatch) {
        const stem = text.slice(0, text.search(/(?:^|\n)\s*a\)/i)).trim()
        const stmts = [
          `[${dsMatch[1].trim()}]`,
          `[${dsMatch[2].trim()}]`,
          `[${dsMatch[3].trim()}]`,
          `[${dsMatch[4].trim()}]`
        ]
        dsList.push({
          id: `DS${String(autoId++).padStart(2, '0')}`,
          stem,
          stmts
        })
        continue
      }

      // B) Kiểm tra 4 phương án A., B., C., D.
      const tnMatch = text.match(/(?:^|\s)A[\.:]\s*([\s\S]*?)(?:^|\s)B[\.:]\s*([\s\S]*?)(?:^|\s)C[\.:]\s*([\s\S]*?)(?:^|\s)D[\.:]\s*([\s\S]*?)$/i)
      if (tnMatch) {
        const stem = text.slice(0, text.search(/(?:^|\s)A[\.:]/i)).trim()
        const choices = [
          `[${tnMatch[1].trim()}]`,
          `[${tnMatch[2].trim()}]`,
          `[${tnMatch[3].trim()}]`,
          `[${tnMatch[4].trim()}]`
        ]
        tnList.push({
          id: `TN${String(autoId++).padStart(2, '0')}`,
          stem,
          choices
        })
        continue
      }

      // C) Kiểm tra Trả lời ngắn / Tự luận
      if (text.toLowerCase().includes('đáp án:') || text.toLowerCase().includes('kết quả:')) {
        const parts = text.split(/(?:đáp án|kết quả)[:.]/i)
        tlnList.push({
          id: `TLN${String(autoId++).padStart(2, '0')}`,
          stem: parts[0].trim(),
          ans: parts[1]?.trim() || ''
        })
      } else {
        tlList.push({
          id: `TL${String(autoId++).padStart(2, '0')}`,
          stem: text
        })
      }
    }
  } else {
    // Nếu không nhận diện được "Câu 1, Câu 2", đưa toàn bộ đoạn văn vào dạng tự luận
    tlList.push({
      id: `TL01`,
      stem: fullText
    })
  }

  // 5. Kết xuất mã nguồn Typst chuẩn
  const lines = [
    '// ĐỀ THI NHẬP TỪ FILE WORD (.DOCX) - CHUẨN SANG-MATH:1.0.5',
    '#import "@preview/sang-math:1.0.5": *',
    '',
    '#let profile = sys.inputs.at("profile", default: "dethi")',
    '#let preset = exam-preset(theme: "teal-pro", profile: profile)',
    '#let (tn, ds, tln, tl) = exam-mode(..preset.question)',
    '',
    '#show: sang-setup.with(math-color: black)',
    '#show: exam-theme.with(',
    '  theme: preset.theme,',
    `  school: "${school.replace(/"/g, '\\"')}",`,
    `  exam-title: "${title.replace(/"/g, '\\"')}",`,
    '  subject: "TOÁN THPT",',
    '  duration: "90 phút",',
    '  code: "101",',
    '  watermark: none, // Chữ in chìm: đổi thành [TÊN TRƯỜNG] hoặc "ĐỀ THI THỬ", hoặc để none nếu không dùng',
    '  watermark-opacity: 0.05, // Độ mờ chữ in chìm (0.01 đến 0.2)',
    '  ..preset.template,',
    ')',
    ''
  ]

  if (tnList.length > 0) {
    lines.push(`#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: ${tnList.length})\n`)
    for (const q of tnList) {
      lines.push(`#tn([${q.stem}], (${q.choices.join(', ')}), id: "${q.id}")\n`)
    }
  }

  if (dsList.length > 0) {
    lines.push(`#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: ${dsList.length})\n`)
    for (const q of dsList) {
      lines.push(`#ds([${q.stem}], (\n    ${q.stmts.join(',\n    ')}\n  ), id: "${q.id}")\n`)
    }
  }

  if (tlnList.length > 0) {
    lines.push(`#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: ${tlnList.length})\n`)
    for (const q of tlnList) {
      lines.push(`#tln([${q.stem}], [${q.ans}], id: "${q.id}")\n`)
    }
  }

  if (tlList.length > 0) {
    lines.push(`#exam-part([PHẦN IV. Tự luận], count: ${tlList.length})\n`)
    for (const q of tlList) {
      lines.push(`#tl([${q.stem}], id: "${q.id}", lines: 6)\n`)
    }
  }

  lines.push('#het')

  return {
    typstCode: lines.join('\n'),
    images
  }
}
