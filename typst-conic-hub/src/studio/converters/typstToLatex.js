/**
 * typstToLatex.js
 * Bộ chuyển đổi từ mã nguồn Typst chuẩn @preview/sang-math:1.0.5 sang LaTeX gói ex_test.sty
 */

// Chuyển đổi công thức Typst math sang LaTeX math
export function convertTypstMathToLatex(mathText) {
  let s = String(mathText || '').trim()

  if (s.startsWith('$') && s.endsWith('$')) {
    s = s.slice(1, -1).trim()
  }

  // 1. Phân số: (a)/(b) hoặc a/b -> \frac{a}{b}
  s = s.replace(/\(([^()]+)\)\s*\/\s*\(([^()]+)\)/g, '\\frac{$1}{$2}')
    .replace(/([a-zA-Z0-9]+)\s*\/\s*([a-zA-Z0-9]+)/g, '\\frac{$1}{$2}')

  // 2. Căn: sqrt(x) -> \sqrt{x}, root(n, x) -> \sqrt[n]{x}
  s = s.replace(/root\s*\(([^,]+),\s*([^)]+)\)/g, '\\sqrt[$1]{$2}')
  s = s.replace(/sqrt\s*\(([^)]+)\)/g, '\\sqrt{$1}')

  // 3. Tích phân & Giới hạn & Tổng
  s = s.replace(/integral_\(([^)]+)\)\^\(([^)]+)\)/g, '\\int_{$1}^{$2}')
    .replace(/integral/g, '\\int')
    .replace(/lim_\(([^)]+)\)/g, '\\lim_{$1}')
    .replace(/sum_\(([^)]+)\)\^\(([^)]+)\)/g, '\\sum_{$1}^{$2}')
    .replace(/product_\(([^)]+)\)\^\(([^)]+)\)/g, '\\prod_{$1}^{$2}')

  // 4. Vector: arrow(u) -> \vec{u}
  s = s.replace(/arrow\s*\(([^)]+)\)/g, '\\vec{$1}')

  // 5. Tập số
  s = s.replace(/\bRR\b/g, '\\mathbb{R}')
    .replace(/\bZZ\b/g, '\\mathbb{Z}')
    .replace(/\bNN\b/g, '\\mathbb{N}')
    .replace(/\bQQ\b/g, '\\mathbb{Q}')
    .replace(/\bCC\b/g, '\\mathbb{C}')

  // 6. Toán tử và ký hiệu
  const typToTex = [
    [/<=/g, '\\le '],
    [/>=/g, '\\ge '],
    [/!=/g, '\\ne '],
    [/->/g, '\\to '],
    [/<-/g, '\\leftarrow '],
    [/=>/g, '\\Rightarrow '],
    [/<=>/g, '\\Leftrightarrow '],
    [/\bnot\s+in\b/g, '\\notin '],
    [/\bin\b/g, '\\in '],
    [/\bsubset\b/g, '\\subset '],
    [/\bsupset\b/g, '\\supset '],
    [/\bunion\b/g, '\\cup '],
    [/\bsect\b/g, '\\cap '],
    [/\bnothing\b/g, '\\emptyset '],
    [/\binfinity\b/g, '\\infty '],
    [/\+-/g, '\\pm '],
    [/\bdegree\b/g, '^\\circ '],
    [/\/\//g, '\\parallel '],
    [/\bbot\b/g, '\\perp '],
    [/\bangle\b/g, '\\angle '],
    [/\bdif\s+([a-zA-Z])/g, '\\mathrm{d}$1'],
    [/\bupright\(([^)]+)\)/g, '\\mathrm{$1}'],
    [/\bbold\(([^)]+)\)/g, '\\mathbf{$1}'],
  ]

  for (const [re, rep] of typToTex) {
    s = s.replace(re, rep)
  }

  return s.trim()
}

// Chuyển đổi các khối $...$ trong văn bản sang LaTeX math
export function convertTypstContentToLatex(text) {
  let s = String(text || '')

  // Chuyển ảnh #image("...") sang chú thích LaTeX
  s = s.replace(/#?image\s*\(\s*"([^"]+)"[^)]*\)/g, '\n% [HÌNH VẼ: $1]\n\\includegraphics[width=0.45\\textwidth]{$1}\n')

  // Chuyển math inline $ ... $
  s = s.replace(/\$([^\$]+)\$/g, (_, m) => {
    return `$${convertTypstMathToLatex(m)}$`
  })

  // Định dạng chữ: *bold* -> \textbf{...}, _italic_ -> \textit{...}
  s = s.replace(/\*([^*\n]+)\*/g, '\\textbf{$1}')
    .replace(/_([^_\n]+)_/g, '\\textit{$1}')

  return s.trim()
}

/**
 * Parser chính: Chuyển mã Typst sang LaTeX ex_test.sty
 */
export function parseTypstToLatex(typstSource, options = {}) {
  const { title = 'ĐỀ KIỂM TRA TOÁN', school = 'TRƯỜNG THPT ................................' } = options

  const lines = []
  lines.push('\\documentclass[12pt,a4paper]{article}')
  lines.push('\\usepackage[utf8]{inputenc}')
  lines.push('\\usepackage[vietnamese]{babel}')
  lines.push('\\usepackage{amsmath,amssymb,amsfonts}')
  lines.push('\\usepackage{graphicx}')
  lines.push('\\usepackage{ex_test} % Gói chuẩn trắc nghiệm THPT')
  lines.push('')
  lines.push('\\begin{document}')
  lines.push(`\\begin{center}`)
  lines.push(`  \\textbf{\\large ${school}}\\\\[0.5em]`)
  lines.push(`  \\textbf{\\Large ${title}}\\\\[1em]`)
  lines.push(`\\end{center}`)
  lines.push('')

  const raw = String(typstSource || '')

  // Regex tìm các khối câu hỏi #tn, #ds, #tln, #tl
  const qRegex = /#(tn|ds|tln|tl)\s*\(/g
  let match
  const matches = []

  while ((match = qRegex.exec(raw)) !== null) {
    matches.push({ type: match[1], index: match.index })
  }

  for (let i = 0; i < matches.length; i++) {
    const current = matches[i]
    const nextIndex = i + 1 < matches.length ? matches[i + 1].index : raw.length
    const callSnippet = raw.slice(current.index, nextIndex)

    // Trích xuất lời giải: loigiai: [...]
    let loigiai = ''
    const lgMatch = callSnippet.match(/loigiai\s*:\s*\[([\s\S]*?)\]\s*(?:\)|,)/)
    if (lgMatch) {
      loigiai = convertTypstContentToLatex(lgMatch[1].trim())
    }

    if (current.type === 'tn') {
      // #tn([stem], (choices...))
      const stemMatch = callSnippet.match(/#tn\s*\(\s*\[([\s\S]*?)\]\s*,\s*\(([\s\S]*?)\)(?:,|\))/s)
      if (stemMatch) {
        const stem = convertTypstContentToLatex(stemMatch[1].trim())
        const rawChoices = stemMatch[2].split(/,(?![^[]*\])/).map(c => c.trim()).filter(Boolean)

        const choices = rawChoices.map(c => {
          let isTrue = false
          let clean = c
          if (c.startsWith('True(') || c.includes('True([')) {
            isTrue = true
            clean = c.replace(/True\s*\(\s*\[([\s\S]*?)\]\s*\)/, '$1').replace(/True\s*\(\s*([^)]+)\s*\)/, '$1')
          }
          clean = clean.replace(/^\[/, '').replace(/\]$/, '').trim()
          clean = convertTypstContentToLatex(clean)
          return isTrue ? `\\True ${clean}` : clean
        })

        while (choices.length < 4) choices.push('...')

        lines.push('\\begin{ex}')
        lines.push(`  ${stem}`)
        lines.push(`  \\choice`)
        lines.push(`    {${choices[0]}}`)
        lines.push(`    {${choices[1]}}`)
        lines.push(`    {${choices[2]}}`)
        lines.push(`    {${choices[3]}}`)
        if (loigiai) {
          lines.push(`  \\loigiai{`)
          lines.push(`    ${loigiai}`)
          lines.push(`  }`)
        }
        lines.push('\\end{ex}\n')
      }
    } else if (current.type === 'ds') {
      // #ds([stem], (stmts...))
      const dsMatch = callSnippet.match(/#ds\s*\(\s*\[([\s\S]*?)\]\s*,\s*\(([\s\S]*?)\)(?:,|\))/s)
      if (dsMatch) {
        const stem = convertTypstContentToLatex(dsMatch[1].trim())
        const rawStmts = dsMatch[2].split(/,(?![^[]*\])/).map(c => c.trim()).filter(Boolean)

        const stmts = rawStmts.map(s => {
          let isTrue = false
          let clean = s
          if (s.startsWith('True(') || s.includes('True([')) {
            isTrue = true
            clean = s.replace(/True\s*\(\s*\[([\s\S]*?)\]\s*\)/, '$1').replace(/True\s*\(\s*([^)]+)\s*\)/, '$1')
          }
          clean = clean.replace(/^\[/, '').replace(/\]$/, '').trim()
          clean = convertTypstContentToLatex(clean)
          return isTrue ? `\\True ${clean}` : clean
        })

        while (stmts.length < 4) stmts.push('...')

        lines.push('\\begin{ex}')
        lines.push(`  ${stem}`)
        lines.push(`  \\choiceTF`)
        lines.push(`    {${stmts[0]}}`)
        lines.push(`    {${stmts[1]}}`)
        lines.push(`    {${stmts[2]}}`)
        lines.push(`    {${stmts[3]}}`)
        if (loigiai) {
          lines.push(`  \\loigiai{`)
          lines.push(`    ${loigiai}`)
          lines.push(`  }`)
        }
        lines.push('\\end{ex}\n')
      }
    } else if (current.type === 'tln') {
      // #tln([stem], [ans])
      const tlnMatch = callSnippet.match(/#tln\s*\(\s*\[([\s\S]*?)\]\s*,\s*\[([\s\S]*?)\](?:,|\))/s)
      if (tlnMatch) {
        const stem = convertTypstContentToLatex(tlnMatch[1].trim())
        const ans = convertTypstContentToLatex(tlnMatch[2].trim())

        lines.push('\\begin{ex}')
        lines.push(`  ${stem}`)
        lines.push(`  \\shortans{${ans}}`)
        if (loigiai) {
          lines.push(`  \\loigiai{`)
          lines.push(`    ${loigiai}`)
          lines.push(`  }`)
        }
        lines.push('\\end{ex}\n')
      }
    } else if (current.type === 'tl') {
      // #tl([stem])
      const tlMatch = callSnippet.match(/#tl\s*\(\s*\[([\s\S]*?)\](?:,|\))/s)
      if (tlMatch) {
        const stem = convertTypstContentToLatex(tlMatch[1].trim())

        lines.push('\\begin{ex}')
        lines.push(`  ${stem}`)
        if (loigiai) {
          lines.push(`  \\loigiai{`)
          lines.push(`    ${loigiai}`)
          lines.push(`  }`)
        }
        lines.push('\\end{ex}\n')
      }
    }
  }

  lines.push('\\end{document}')
  return lines.join('\n')
}
