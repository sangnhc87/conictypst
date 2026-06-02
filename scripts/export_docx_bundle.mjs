import fs from 'node:fs'
import os from 'node:os'
import path from 'node:path'
import { execFileSync } from 'node:child_process'
import { fileURLToPath } from 'node:url'

import { getMockMacros, injectLayouts } from './docx_backend.js'

const projectRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')

function extractBlocksForDocx(content, keyword) {
  const extracted = []
  let searchIndex = 0

  while ((searchIndex = content.indexOf(keyword, searchIndex)) !== -1) {
    let blockStart = searchIndex
    let hasHash = false

    if (searchIndex > 0 && content[searchIndex - 1] === '#') {
      blockStart = searchIndex - 1
      hasHash = true
    }

    let openParenIndex = content.indexOf('(', searchIndex + keyword.length)
    let openBracketIndex = content.indexOf('[', searchIndex + keyword.length)
    if (openParenIndex === -1 && openBracketIndex === -1) {
      searchIndex += keyword.length
      continue
    }

    const closestParen = Math.min(
      openParenIndex === -1 ? Infinity : openParenIndex,
      openBracketIndex === -1 ? Infinity : openBracketIndex,
    )

    if (closestParen - (searchIndex + keyword.length) > 5) {
      searchIndex += keyword.length
      continue
    }

    openParenIndex = closestParen
    const stack = []
    let endIndex = -1
    let inString = false
    let inComment = false

    for (let index = openParenIndex; index < content.length; index += 1) {
      const char = content[index]
      const nextChar = content[index + 1]

      if (char === '"' && content[index - 1] !== '\\') inString = !inString
      if (inString) continue

      if (char === '/' && nextChar === '/') inComment = true
      if (inComment && char === '\n') inComment = false
      if (char === '/' && nextChar === '*') inComment = true
      if (inComment && char === '*' && nextChar === '/') inComment = false
      if (inComment) continue

      if (char === '(' || char === '{' || char === '[') {
        stack.push(char)
      } else if (char === ')' || char === '}' || char === ']') {
        const last = stack[stack.length - 1]
        if (
          (char === ')' && last === '(') ||
          (char === '}' && last === '{') ||
          (char === ']' && last === '[')
        ) {
          stack.pop()
        } else {
          break
        }
        if (stack.length === 0) {
          endIndex = index
          break
        }
      }
    }

    if (endIndex !== -1) {
      extracted.push({ text: content.substring(blockStart, endIndex + 1), hasHash })
      searchIndex = endIndex + 1
    } else {
      searchIndex += keyword.length
    }
  }

  return extracted
}

function buildHeaderBlock({ examTitle, schoolName, examCode, examSubject }) {
  if (!examTitle && !schoolName) return ''

  let headerBlock = '#align(center)[\n'
  if (schoolName) headerBlock += `  #text(size: 11pt)[${schoolName}]\\ \n`
  headerBlock += `  #text(size: 14pt, weight: "bold")[${examTitle || 'ĐỀ KIỂM TRA'}]\\ \n`
  if (examSubject || examCode) {
    let subjectLine = '  #text(size: 11pt)['
    if (examSubject) subjectLine += `Môn: ${examSubject}`
    if (examSubject && examCode) subjectLine += '    —    '
    if (examCode) subjectLine += `Mã đề: *${examCode}*`
    subjectLine += ']\n'
    headerBlock += subjectLine
  }
  headerBlock += ']\n\n'
  return headerBlock
}

function buildFigurePrelude(sourceText) {
  let imports = ''
  const importLines = sourceText.split('\n').filter(line => line.trim().startsWith('#import'))
  importLines.forEach(line => {
    let finalLine = line
    if (line.includes('sang-exam.typ')) finalLine = '#import "/typst/sang-exam.typ": *'
    else if (line.includes('bbt.typ')) finalLine = '#import "/typst/bbt.typ": *'
    else if (line.includes('math-sym.typ')) finalLine = '#import "/typst/math-sym.typ": *'
    imports += `${finalLine}\n`
  })

  const firstQuestionIndex = sourceText.search(/^#(?:tn|ds|tln|tl|exam-part)\s*\(/m)
  const preamble = firstQuestionIndex > 0 ? sourceText.substring(0, firstQuestionIndex) : ''
  const letLines = preamble.split('\n').filter(line => {
    const trimmed = line.trim()
    return trimmed.startsWith('#let ') &&
      !trimmed.startsWith('#let accent') &&
      !trimmed.startsWith('#let mode') &&
      !trimmed.match(/^#let\s+\(tn/)
  })

  if (letLines.length > 0) {
    imports += `${letLines.join('\n')}\n`
  }

  return imports
}

export function exportTypstDocxBundle({
  content,
  examTitle = '',
  schoolName = '',
  examCode = '',
  examSubject = '',
  addFooter = false,
}) {
  if (!content) {
    throw new Error('Không có nội dung file.')
  }

  const tempDir = fs.mkdtempSync(path.join(os.tmpdir(), 'conictypst-docx-'))

  try {
    const cetzBlocks = extractBlocksForDocx(content, 'cetz.canvas')
    const bbtBlocks = extractBlocksForDocx(content, 'bbt')
    const allBlocks = [...cetzBlocks, ...bbtBlocks]

    let strippedContent = content.split('\n')
      .filter(line => !line.trim().startsWith('#import'))
      .filter(line => !line.trim().startsWith('#let accent'))
      .filter(line => !line.trim().startsWith('#let mode'))
      .join('\n')
    strippedContent = strippedContent.replace(/#show:\s*thpt-school-exam\.with\([\s\S]*?\n\)/g, '')
    strippedContent = strippedContent.replace(/#let\s+\(tn,\s*ds,\s*tln,\s*tl\)\s*=\s*exam-mode\([\s\S]*?\)/g, '')

    const headerBlock = buildHeaderBlock({ examTitle, schoolName, examCode, examSubject })
    if (headerBlock) strippedContent = headerBlock + strippedContent

    if (allBlocks.length > 0) {
      const outDir = path.join(tempDir, 'figs')
      fs.mkdirSync(outDir)

      const tempContent = `${buildFigurePrelude(content)}
#set page(width: auto, height: auto, margin: 10pt)
#show math.equation: set text(fill: black)

${allBlocks.map(block => (block.hasHash ? block.text : `#${block.text}`)).join('\n#pagebreak()\n')}`

      const tempTypstFile = path.join(tempDir, 'export.typ')
      fs.writeFileSync(tempTypstFile, tempContent)

      const outputPattern = path.join(outDir, 'fig-{p}.png')
      try {
        execFileSync(
          'typst',
          ['compile', tempTypstFile, outputPattern, '--root', projectRoot, '--font-path', 'src/assets/fonts', '--font-path', 'fonts', '--ppi', '450'],
          { cwd: projectRoot, encoding: 'utf-8' },
        )
      } catch {
        // Keep going: missing figures should not block the whole export.
      }

      allBlocks.forEach((block, index) => {
        const figName = `figs/fig-${index + 1}.png`
        const replacement = block.hasHash
          ? `#image("${figName}", width: 42%)`
          : `image("${figName}", width: 42%)`
        strippedContent = strippedContent.replace(block.text, replacement)
      })
    }

    strippedContent = injectLayouts(strippedContent)

    const fileNames = {
      hocsinh: 'De_HocSinh.docx',
      loigiai: 'De_LoiGiai.docx',
      dapan: 'De_DapAn.docx',
    }

    for (const mode of ['hocsinh', 'loigiai', 'dapan']) {
      const finalTypst = getMockMacros(mode) + strippedContent
      const pandocTypstFile = path.join(tempDir, `pandoc_${mode}.typ`)
      fs.writeFileSync(pandocTypstFile, finalTypst)

      execFileSync(
        'pandoc',
        [
          path.basename(pandocTypstFile),
          '-o',
          fileNames[mode],
          `--reference-doc=${path.join(projectRoot, 'scripts', 'template.docx')}`,
          `--lua-filter=${path.join(projectRoot, 'scripts', 'tabs.lua')}`,
        ],
        { cwd: tempDir, encoding: 'utf-8' },
      )
    }

    const postProcessScript = path.join(projectRoot, 'scripts', 'docx_postprocess.py')
    for (const mode of ['hocsinh', 'loigiai', 'dapan']) {
      const docxPath = path.join(tempDir, fileNames[mode])
      const scriptArgs = [postProcessScript, docxPath]
      if (examCode) scriptArgs.push('--exam-code', examCode)
      if (addFooter) scriptArgs.push('--add-footer')
      try {
        execFileSync('python3', scriptArgs, { encoding: 'utf-8', timeout: 15000 })
      } catch {
        // Footer/post-process is best-effort.
      }
    }

    const zipPath = path.join(tempDir, 'export.zip')
    execFileSync('zip', ['-j', zipPath, ...Object.values(fileNames)], { cwd: tempDir, encoding: 'utf-8' })

    return {
      fileName: 'export.zip',
      zipBuffer: fs.readFileSync(zipPath),
    }
  } finally {
    fs.rmSync(tempDir, { recursive: true, force: true })
  }
}