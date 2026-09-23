/**
 * latexToTypst.js
 * Bộ chuyển đổi mã LaTeX Toán THPT (đặc biệt chuẩn ex_test.sty) sang mã Typst chuẩn @preview/sang-math:1.0.5
 */

// Chuyển đổi cú pháp công thức Toán từ LaTeX sang Typst
export function convertLatexMathToTypst(mathText) {
  let s = String(mathText || '').trim()

  // Bỏ bọc $...$ hoặc $$...$$ nếu có
  const isDisplay = s.startsWith('$$') && s.endsWith('$$')
  if (isDisplay) {
    s = s.slice(2, -2).trim()
  } else if (s.startsWith('$') && s.endsWith('$')) {
    s = s.slice(1, -1).trim()
  }

  // Thay thế các cấu trúc lồng nhau phổ biến
  // 1. Phân số: \dfrac{a}{b} hoặc \frac{a}{b} -> (a)/(b)
  let fracRegex = /\\(?:d|c)?frac\s*\{([^{}]+)\}\s*\{([^{}]+)\}/g
  while (fracRegex.test(s)) {
    s = s.replace(fracRegex, '($1)/($2)')
  }

  // 2. Căn bậc n: \sqrt[n]{x} -> root(n, x)
  s = s.replace(/\\sqrt\s*\[([^\]]+)\]\s*\{([^{}]+)\}/g, 'root($1, $2)')

  // 3. Căn bậc 2: \sqrt{x} -> sqrt(x)
  let sqrtRegex = /\\sqrt\s*\{([^{}]+)\}/g
  while (sqrtRegex.test(s)) {
    s = s.replace(sqrtRegex, 'sqrt($1)')
  }

  // 4. Ngoặc tự co: \left( \right) -> ( )
  s = s.replace(/\\left\s*\(/g, '(')
    .replace(/\\right\s*\)/g, ')')
    .replace(/\\left\s*\[/g, '[')
    .replace(/\\right\s*\]/g, ']')
    .replace(/\\left\s*\\\{/g, '{')
    .replace(/\\right\s*\\\}/g, '}')
    .replace(/\\left\s*\|/g, '|')
    .replace(/\\right\s*\|/g, '|')
    .replace(/\\left\./g, '')
    .replace(/\\right\./g, '')

  // 5. Tập số chuẩn: \mathbb{R} -> RR
  s = s.replace(/\\mathbb\s*\{\s*R\s*\}/g, 'RR')
    .replace(/\\mathbb\s*\{\s*Z\s*\}/g, 'ZZ')
    .replace(/\\mathbb\s*\{\s*N\s*\}/g, 'NN')
    .replace(/\\mathbb\s*\{\s*Q\s*\}/g, 'QQ')
    .replace(/\\mathbb\s*\{\s*C\s*\}/g, 'CC')
    .replace(/\\mathbf\s*\{([^}]+)\}/g, 'bold($1)')
    .replace(/\\mathit\s*\{([^}]+)\}/g, '$1')
    .replace(/\\mathrm\s*\{\s*d\s*\}\s*([a-zA-Z])/g, 'dif $1')
    .replace(/\\mathrm\s*\{([^}]+)\}/g, 'upright($1)')
    .replace(/\\text\s*\{([^}]+)\}/g, '"$1"')

  // 6. Vector: \vec{u} -> arrow(u), \overrightarrow{AB} -> arrow(A B)
  s = s.replace(/\\(?:vec|overrightarrow)\s*\{([^}]+)\}/g, 'arrow($1)')

  // 7. Giới hạn: \lim_{x \to a} -> lim_(x -> a)
  s = s.replace(/\\lim\s*_\s*\{([^}]+)\}/g, 'lim_($1)')

  // 8. Tích phân: \int_{a}^{b} -> integral_(a)^(b)
  s = s.replace(/\\int\s*_\s*\{([^}]+)\}\s*\^\s*\{([^}]+)\}/g, 'integral_($1)^($2)')
    .replace(/\\int\s*\^\s*\{([^}]+)\}\s*_\s*\{([^}]+)\}/g, 'integral_($2)^($1)')
    .replace(/\\int/g, 'integral')

  // 9. Tổng, tích: \sum, \prod
  s = s.replace(/\\sum\s*_\s*\{([^}]+)\}\s*\^\s*\{([^}]+)\}/g, 'sum_($1)^($2)')
    .replace(/\\sum/g, 'sum')
    .replace(/\\prod\s*_\s*\{([^}]+)\}\s*\^\s*\{([^}]+)\}/g, 'product_($1)^($2)')
    .replace(/\\prod/g, 'product')

  // 10. Ký hiệu quan hệ và phép toán
  const symMap = [
    [/\\le(?:q)?\b/g, '<='],
    [/\\ge(?:q)?\b/g, '>='],
    [/\\ne(?:q)?\b/g, '!='],
    [/\\to\b|\\rightarrow\b/g, '->'],
    [/\\leftarrow\b/g, '<-'],
    [/\\Rightarrow\b/g, '=>'],
    [/\\Leftarrow\b/g, '<='],
    [/\\Leftrightarrow\b/g, '<=>'],
    [/\\in\b/g, 'in'],
    [/\\notin\b/g, 'not in'],
    [/\\subset\b/g, 'subset'],
    [/\\supset\b/g, 'supset'],
    [/\\cup\b/g, 'union'],
    [/\\cap\b/g, 'sect'],
    [/\\emptyset\b/g, 'nothing'],
    [/\\infty\b/g, 'infinity'],
    [/\\pm\b/g, '+-'],
    [/\\mp\b/g, '-+'],
    [/\\times\b/g, 'times'],
    [/\\cdot\b/g, 'dot'],
    [/\\ldots\b|\\dots\b/g, '...'],
    [/\\circ\b/g, 'degree'],
    [/\\parallel\b/g, '//'],
    [/\\perp\b/g, 'bot'],
    [/\\angle\b/g, 'angle'],
    [/\\forall\b/g, 'forall'],
    [/\\exists\b/g, 'exists'],
    // Chữ Hy Lạp
    [/\\alpha\b/g, 'alpha'],
    [/\\beta\b/g, 'beta'],
    [/\\gamma\b/g, 'gamma'],
    [/\\delta\b/g, 'delta'],
    [/\\Delta\b/g, 'Delta'],
    [/\\epsilon\b/g, 'epsilon'],
    [/\\varepsilon\b/g, 'epsilon.alt'],
    [/\\theta\b/g, 'theta'],
    [/\\lambda\b/g, 'lambda'],
    [/\\Lambda\b/g, 'Lambda'],
    [/\\mu\b/g, 'mu'],
    [/\\pi\b/g, 'pi'],
    [/\\Pi\b/g, 'Pi'],
    [/\\sigma\b/g, 'sigma'],
    [/\\Sigma\b/g, 'Sigma'],
    [/\\omega\b/g, 'omega'],
    [/\\Omega\b/g, 'Omega'],
    [/\\phi\b/g, 'phi'],
    [/\\Phi\b/g, 'Phi'],
  ]

  for (const [re, rep] of symMap) {
    s = s.replace(re, rep)
  }

  // Xóa khoảng trắng TeX: \, \; \! \quad \qquad
  s = s.replace(/\\[,;!]/g, ' ')
    .replace(/\\quad\b/g, '   ')
    .replace(/\\qquad\b/g, '      ')

  // Bỏ dấu ngoặc nhọn thừa {x} -> (x) hoặc x nếu đơn
  s = s.replace(/\{([a-zA-Z0-9_+-]+)\}/g, '$1')

  return s.trim()
}

// Chuyển toàn bộ đoạn văn bản chứa inline $...$ hoặc display $$...$$ hoặc \[...\]
export function convertTextMathSpans(text) {
  let s = String(text || '')

  // 1. Display math: \[ ... \] hoặc $$ ... $$
  s = s.replace(/\\\[([\s\S]*?)\\\]/g, (_, m) => {
    return `\n$ ${convertLatexMathToTypst(m)} $\n`
  })
  s = s.replace(/\$\$([\s\S]*?)\$\$/g, (_, m) => {
    return `\n$ ${convertLatexMathToTypst(m)} $\n`
  })

  // 2. Inline math: \( ... \) hoặc $ ... $
  s = s.replace(/\\\(([\s\S]*?)\\\)/g, (_, m) => {
    return `$${convertLatexMathToTypst(m)}$`
  })
  s = s.replace(/\$([^\$\n]+)\$/g, (_, m) => {
    return `$${convertLatexMathToTypst(m)}$`
  })

  // 3. Text format: \textbf{...} -> *...*, \textit{...} -> _..._
  s = s.replace(/\\textbf\s*\{([^}]+)\}/g, '*$1*')
    .replace(/\\textit\s*\{([^}]+)\}/g, '_$1_')
    .replace(/\\underline\s*\{([^}]+)\}/g, '#underline[$1]')

  return s
}

// Trích xuất các tham số trong cặp ngoặc nhọn {...} theo thứ tự cân bằng
function extractBracedGroups(text, maxCount = 10) {
  const groups = []
  let depth = 0
  let startIndex = -1

  for (let i = 0; i < text.length; i++) {
    const ch = text[i]
    if (ch === '{') {
      if (depth === 0) startIndex = i + 1
      depth++
    } else if (ch === '}') {
      depth--
      if (depth === 0 && startIndex !== -1) {
        groups.push(text.slice(startIndex, i))
        startIndex = -1
        if (groups.length >= maxCount) break
      }
    }
  }
  return groups
}

/**
 * Parser chính: Chuyển tài liệu LaTeX (ex_test.sty hoặc thông thường) sang Typst sang-math:1.0.5
 */
export function parseLatexToTypst(latexSource, options = {}) {
  const { title = 'ĐỀ KIỂM TRA', subject = 'TOÁN THPT', school = 'TRƯỜNG THPT ................................' } = options

  const lines = []
  lines.push('// ĐỀ THI ĐƯỢC CHUYỂN ĐỔI TỰ ĐỘNG SANG TYPST CHUẨN SANG-MATH:1.0.5')
  lines.push('#import "@preview/sang-math:1.0.5": *')
  lines.push('')
  lines.push('#let profile = sys.inputs.at("profile", default: "dethi")')
  lines.push('#let preset = exam-preset(theme: "teal-pro", profile: profile)')
  lines.push('#let (tn, ds, tln, tl) = exam-mode(..preset.question)')
  lines.push('')
  lines.push('#show: sang-setup.with(math-color: black)')
  lines.push('#show: exam-theme.with(')
  lines.push(`  theme: preset.theme,`)
  lines.push(`  school: "${school.replace(/"/g, '\\"')}",`)
  lines.push(`  exam-title: "${title.replace(/"/g, '\\"')}",`)
  lines.push(`  subject: "${subject.replace(/"/g, '\\"')}",`)
  lines.push(`  duration: "90 phút",`)
  lines.push(`  code: "101",`)
  lines.push(`  watermark: none, // Chữ in chìm: đổi thành [TÊN TRƯỜNG] hoặc "ĐỀ THI THỬ", hoặc để none nếu không dùng`)
  lines.push(`  watermark-opacity: 0.05, // Độ mờ chữ in chìm (0.01 đến 0.2)`)
  lines.push(`  ..preset.template,`)
  lines.push(')')
  lines.push('')

  let raw = String(latexSource || '')

  // Lấy nội dung trong \begin{document} ... \end{document} nếu có
  const docMatch = raw.match(/\\begin\{document\}([\s\S]*?)\\end\{document\}/)
  if (docMatch) raw = docMatch[1]

  // Tách câu hỏi theo các môi trường: ex, bt, vd hoặc \begin{ex} ... \end{ex}
  // Hoặc tách theo "Câu 1.", "Câu 2."
  const exRegex = /\\begin\{(ex|bt|vd)\}(?:\[([^\]]*)\])?([\s\S]*?)\\end\{\1\}/g
  let match
  const questions = []

  while ((match = exRegex.exec(raw)) !== null) {
    const meta = match[2] || ''
    const content = match[3] || ''
    questions.push({ meta, content })
  }

  // Nếu không thấy môi trường ex, thử chia theo khối Câu / \item
  if (questions.length === 0) {
    const parts = raw.split(/(?=\b(?:Câu|Bài)\s+\d+[:.])/gi)
    for (const part of parts) {
      if (part.trim().length > 10) {
        questions.push({ meta: '', content: part })
      }
    }
  }

  const tnList = []
  const dsList = []
  const tlnList = []
  const tlList = []

  let qIndex = 1
  for (const q of questions) {
    let qContent = q.content

    // 1. Trích xuất lời giải \loigiai{...} nếu có
    let loigiai = ''
    const lgIndex = qContent.indexOf('\\loigiai')
    if (lgIndex !== -1) {
      const lgBraces = extractBracedGroups(qContent.slice(lgIndex), 1)
      if (lgBraces.length > 0) {
        loigiai = convertTextMathSpans(lgBraces[0].trim())
        qContent = qContent.slice(0, lgIndex) + qContent.slice(lgIndex + lgBraces[0].length + 10)
      }
    }

    // 2. Nhận diện dạng Đúng - Sai: \choiceTF{...}{...}{...}{...}
    const choiceTFIdx = qContent.indexOf('\\choiceTF')
    if (choiceTFIdx !== -1) {
      const stem = convertTextMathSpans(qContent.slice(0, choiceTFIdx).replace(/^(?:Câu|Bài)\s*\d+[:.]\s*/i, '').trim())
      const stmts = extractBracedGroups(qContent.slice(choiceTFIdx), 4)

      const formattedStmts = stmts.map(stmt => {
        let isTrue = false
        let cleanStmt = stmt.trim()
        if (cleanStmt.startsWith('\\True') || cleanStmt.includes('\\True')) {
          isTrue = true
          cleanStmt = cleanStmt.replace(/\\True\b/g, '').trim()
        }
        cleanStmt = convertTextMathSpans(cleanStmt)
        return isTrue ? `True([${cleanStmt}])` : `[${cleanStmt}]`
      })

      while (formattedStmts.length < 4) {
        formattedStmts.push(`[Mệnh đề]`)
      }

      dsList.push({
        id: `DS${String(qIndex).padStart(2, '0')}`,
        stem,
        stmts: formattedStmts,
        loigiai
      })
      qIndex++
      continue
    }

    // 3. Nhận diện dạng Trắc nghiệm 4 lựa chọn: \choice{A}{B}{C}{D}
    const choiceIdx = qContent.search(/\\(?:choice|motcot|haicot|boncot)\s*\{/)
    if (choiceIdx !== -1) {
      const stem = convertTextMathSpans(qContent.slice(0, choiceIdx).replace(/^(?:Câu|Bài)\s*\d+[:.]\s*/i, '').trim())
      const choices = extractBracedGroups(qContent.slice(choiceIdx), 4)

      let correctIndex = -1
      const formattedChoices = choices.map((c, idx) => {
        let isTrue = false
        let clean = c.trim()
        if (clean.startsWith('\\True') || clean.includes('\\True')) {
          isTrue = true
          correctIndex = idx
          clean = clean.replace(/\\True\b/g, '').trim()
        }
        clean = convertTextMathSpans(clean)
        return isTrue ? `True([${clean}])` : `[${clean}]`
      })

      while (formattedChoices.length < 4) {
        formattedChoices.push(`[...]`)
      }

      tnList.push({
        id: `TN${String(qIndex).padStart(2, '0')}`,
        stem,
        choices: formattedChoices,
        loigiai
      })
      qIndex++
      continue
    }

    // 4. Nhận diện dạng Trả lời ngắn: \shortans{...}
    const shortansIdx = qContent.indexOf('\\shortans')
    if (shortansIdx !== -1) {
      const stem = convertTextMathSpans(qContent.slice(0, shortansIdx).replace(/^(?:Câu|Bài)\s*\d+[:.]\s*/i, '').trim())
      const ansGroup = extractBracedGroups(qContent.slice(shortansIdx), 1)
      const ans = ansGroup.length > 0 ? convertTextMathSpans(ansGroup[0].trim()) : ''

      tlnList.push({
        id: `TLN${String(qIndex).padStart(2, '0')}`,
        stem,
        ans,
        loigiai
      })
      qIndex++
      continue
    }

    // 5. Mặc định là Tự luận
    const stem = convertTextMathSpans(qContent.replace(/^(?:Câu|Bài)\s*\d+[:.]\s*/i, '').trim())
    if (stem) {
      tlList.push({
        id: `TL${String(qIndex).padStart(2, '0')}`,
        stem,
        loigiai
      })
      qIndex++
    }
  }

  // Kết xuất mã nguồn Typst chuẩn
  if (tnList.length > 0) {
    lines.push(`#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: ${tnList.length})`)
    lines.push('')
    for (const item of tnList) {
      const lgPart = item.loigiai ? `, loigiai: [${item.loigiai}]` : ''
      lines.push(`#tn(`)
      lines.push(`  [${item.stem}],`)
      lines.push(`  (${item.choices.join(', ')}),`)
      lines.push(`  id: "${item.id}"${lgPart}`)
      lines.push(`)`)
      lines.push('')
    }
  }

  if (dsList.length > 0) {
    lines.push(`#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: ${dsList.length})`)
    lines.push('')
    for (const item of dsList) {
      const lgPart = item.loigiai ? `, loigiai: [${item.loigiai}]` : ''
      lines.push(`#ds(`)
      lines.push(`  [${item.stem}],`)
      lines.push(`  (`)
      lines.push(`    ${item.stmts.join(',\n    ')}`)
      lines.push(`  ),`)
      lines.push(`  id: "${item.id}"${lgPart}`)
      lines.push(`)`)
      lines.push('')
    }
  }

  if (tlnList.length > 0) {
    lines.push(`#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: ${tlnList.length})`)
    lines.push('')
    for (const item of tlnList) {
      const lgPart = item.loigiai ? `, loigiai: [${item.loigiai}]` : ''
      lines.push(`#tln(`)
      lines.push(`  [${item.stem}],`)
      lines.push(`  [${item.ans}],`)
      lines.push(`  id: "${item.id}"${lgPart}`)
      lines.push(`)`)
      lines.push('')
    }
  }

  if (tlList.length > 0) {
    lines.push(`#exam-part([PHẦN IV. Tự luận], count: ${tlList.length})`)
    lines.push('')
    for (const item of tlList) {
      const lgPart = item.loigiai ? `, loigiai: [${item.loigiai}]` : ''
      lines.push(`#tl(`)
      lines.push(`  [${item.stem}],`)
      lines.push(`  id: "${item.id}",`)
      lines.push(`  lines: 6${lgPart}`)
      lines.push(`)`)
      lines.push('')
    }
  }

  lines.push('#het')
  return lines.join('\n')
}
