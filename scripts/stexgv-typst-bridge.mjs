#!/usr/bin/env node
// Bridge STEXGV THPT banks into the ConicTypst question-bank pipeline.
//
// It imports STEXGV JS question modules, calls generateLatex(seed), parses the
// common ex_test structures (\choice, \choiceTF, \shortans, \loigiai), writes a
// full JSON snapshot, and emits a Typst-native registry keyed by the same IDs.

import { existsSync } from 'node:fs'
import { spawnSync } from 'node:child_process'
import { mkdir, readFile, readdir, writeFile } from 'node:fs/promises'
import { basename, dirname, join, relative, resolve } from 'node:path'
import { fileURLToPath, pathToFileURL } from 'node:url'

const __dirname = dirname(fileURLToPath(import.meta.url))
const repoRoot = resolve(__dirname, '..')
const defaultStexgvRoot = '/Users/admin/stexgv/src/pages/ThptExamBuilder'
const defaultOutDir = resolve(repoRoot, 'typst/stexgv-import')
const defaultPdfOut = resolve(repoRoot, 'output/stexgv-mix-demo.pdf')
const defaultSeed = '2026'

const SLOT_META = {
  1: ['Hàm số - Đồng biến / nghịch biến', 'tn'],
  2: ['Hàm số - Cực trị', 'tn'],
  3: ['Hàm số - GTLN / GTNN', 'tn'],
  4: ['Hàm số - Đồ thị & tiệm cận', 'tn'],
  5: ['Mũ - Logarit', 'tn'],
  6: ['Mũ - Logarit pt/bpt', 'tn'],
  7: ['Hình học không gian', 'tn'],
  8: ['Hình học không gian - thể tích', 'tn'],
  9: ['Hình học tọa độ', 'tn'],
  10: ['Tích phân - Nguyên hàm', 'tn'],
  11: ['Tổng hợp - Trắc nghiệm', 'tn'],
  12: ['Tổ hợp - Xác suất', 'tn'],
  13: ['Đúng sai - Hình học', 'ds'],
  14: ['Đúng sai - Giải tích', 'ds'],
  15: ['Đúng sai - Đại số', 'ds'],
  16: ['Đúng sai - Tổng hợp', 'ds'],
  17: ['TLN - Hàm số', 'tln'],
  18: ['TLN - Mũ Logarit', 'tln'],
  19: ['TLN - Hình học KG', 'tln'],
  20: ['TLN - Tích phân', 'tln'],
  21: ['TLN - Tổng hợp', 'tln'],
  22: ['TLN - Tổ hợp / XS', 'tln'],
}

function parseArgs(argv) {
  const args = {
    command: 'import',
    source: defaultStexgvRoot,
    outDir: defaultOutDir,
    seed: defaultSeed,
    limit: Infinity,
    codes: ['101', '102'],
    examSeed: 2026,
    status: 'any',
    compile: false,
  }

  const rest = [...argv]
  if (rest[0] && !rest[0].startsWith('--')) args.command = rest.shift()

  for (let i = 0; i < rest.length; i += 1) {
    const key = rest[i]
    const value = rest[i + 1]
    if (key === '--source') { args.source = resolve(value); i += 1 }
    else if (key === '--out-dir') { args.outDir = resolve(value); i += 1 }
    else if (key === '--seed') { args.seed = value; i += 1 }
    else if (key === '--exam-seed') { args.examSeed = Number(value) || args.examSeed; i += 1 }
    else if (key === '--limit') { args.limit = Number(value) || Infinity; i += 1 }
    else if (key === '--codes') { args.codes = value.split(',').map(item => item.trim()).filter(Boolean); i += 1 }
    else if (key === '--status') { args.status = value || 'any'; i += 1 }
    else if (key === '--compile') { args.compile = true }
    else if (key === '--help' || key === '-h') { args.command = 'help' }
  }

  return args
}

async function listFiles(dir, predicate) {
  const out = []
  async function walk(current) {
    const entries = await readdir(current, { withFileTypes: true })
    for (const entry of entries) {
      const full = join(current, entry.name)
      if (entry.isDirectory()) await walk(full)
      else if (predicate(full)) out.push(full)
    }
  }
  await walk(dir)
  return out.sort((a, b) => a.localeCompare(b))
}

function slotFromPath(file) {
  const match = file.match(/bank_(\d+)\//)
  return match ? Number(match[1]) : null
}

function typeFromSlot(slot) {
  return SLOT_META[slot]?.[1] || 'tn'
}

function difficultyFromLevel(level) {
  const n = Number(level)
  if (!Number.isFinite(n)) return 'TH'
  if (n <= 2) return 'NB'
  if (n <= 4) return 'TH'
  if (n <= 7) return 'VD'
  return 'VDC'
}

function slug(value) {
  return String(value || '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
}

function normalizeTags(values) {
  const tags = []
  const seen = new Set()
  for (const value of values.flat().filter(Boolean)) {
    const tag = slug(value)
    if (!tag || seen.has(tag)) continue
    seen.add(tag)
    tags.push(tag)
  }
  return tags.slice(0, 16)
}

function readBraced(text, openIndex) {
  let start = openIndex
  while (/\s/.test(text[start] || '')) start += 1
  if (text[start] !== '{') return null

  let depth = 0
  for (let i = start; i < text.length; i += 1) {
    const ch = text[i]
    if (ch === '\\') { i += 1; continue }
    if (ch === '{') depth += 1
    if (ch === '}') {
      depth -= 1
      if (depth === 0) {
        return { start, end: i + 1, body: text.slice(start + 1, i) }
      }
    }
  }
  return null
}

function extractCommand(text, command) {
  const pattern = new RegExp(`\\\\${command}\\b`)
  const match = pattern.exec(text)
  if (!match) return null
  const arg = readBraced(text, match.index + match[0].length)
  if (!arg) return null
  return {
    commandStart: match.index,
    commandEnd: arg.end,
    body: arg.body,
    before: text.slice(0, match.index),
    after: text.slice(arg.end),
  }
}

function readChoiceArgs(text, commandStart, commandName) {
  let pos = commandStart + commandName.length + 1
  const args = []
  for (let i = 0; i < 4; i += 1) {
    const arg = readBraced(text, pos)
    if (!arg) return null
    args.push(arg.body)
    pos = arg.end
  }
  return { args, end: pos }
}

function stripExEnvironment(latex) {
  return String(latex || '')
    .replace(/^\s*\\begin\{ex\}(?:\[[^\]]*\])?(?:%\[[^\]]*\])*/i, '')
    .replace(/\\end\{ex\}\s*$/i, '')
    .trim()
}

function replaceLatexCommandWithArgs(text, names, arity, formatter) {
  let out = text
  let changed = true
  while (changed) {
    changed = false
    for (const name of names) {
      const token = `\\${name}`
      const idx = out.indexOf(token)
      if (idx === -1) continue
      let pos = idx + token.length
      const args = []
      let ok = true
      for (let i = 0; i < arity; i += 1) {
        const arg = readBraced(out, pos)
        if (!arg) { ok = false; break }
        args.push(arg.body)
        pos = arg.end
      }
      if (!ok) continue
      out = `${out.slice(0, idx)}${formatter(...args)}${out.slice(pos)}`
      changed = true
    }
  }
  return out
}

function latexMathToTypst(math) {
  let out = String(math || '')

  out = replaceLatexCommandWithArgs(out, ['dfrac', 'frac', 'tfrac'], 2, (a, b) => `frac(${latexMathToTypst(a)}, ${latexMathToTypst(b)})`)
  out = replaceLatexCommandWithArgs(out, ['sqrt'], 1, a => `sqrt(${latexMathToTypst(a)})`)
  out = replaceLatexCommandWithArgs(out, ['overline'], 1, a => `overline(${latexMathToTypst(a)})`)
  out = replaceLatexCommandWithArgs(out, ['widehat', 'hat'], 1, a => `hat(${latexMathToTypst(a)})`)
  out = replaceLatexCommandWithArgs(out, ['vec'], 1, a => `arrow(${latexMathToTypst(a)})`)
  out = replaceLatexCommandWithArgs(out, ['text', 'mathrm'], 1, a => `"${a.replace(/"/g, '\\"')}"`)
  out = replaceLatexCommandWithArgs(out, ['mathbb'], 1, a => ({ R: 'RR', N: 'NN', Z: 'ZZ', Q: 'QQ', C: 'CC' }[a.trim()] || a.trim()))

  const replacements = [
    [/\\left/g, ''], [/\\right/g, ''], [/\\,/g, ' '], [/\\;/g, ' '], [/\\:/g, ' '], [/\\!/g, ''],
    [/\\infty/g, 'oo'], [/\\pi/g, 'pi'], [/\\Omega/g, 'Omega'], [/\\Delta/g, 'Delta'],
    [/\\alpha/g, 'alpha'], [/\\beta/g, 'beta'], [/\\gamma/g, 'gamma'], [/\\theta/g, 'theta'],
    [/\\sin/g, 'sin'], [/\\cos/g, 'cos'], [/\\tan/g, 'tan'], [/\\ln/g, 'ln'], [/\\log/g, 'log'],
    [/\\min/g, 'min'], [/\\max/g, 'max'], [/\\lim/g, 'lim'],
    [/\\Leftrightarrow/g, '<=>'], [/\\Rightarrow/g, '=>'], [/\\Longleftrightarrow/g, '<=>'],
    [/\\leq/g, '<='], [/\\geq/g, '>='], [/\\neq/g, '!='], [/\\ne/g, '!='],
    [/\\cdot/g, ' dot '], [/\\times/g, ' times '], [/\\pm/g, ' plus.minus '],
    [/\\ldots/g, 'dots'], [/\\dots/g, 'dots'], [/\\forall/g, 'forall'], [/\\in\b/g, 'in'],
    [/\\not\\vdots/g, '!|'], [/\\vdots/g, '|'],
    [/\\%/g, '%'], [/\\{/g, '{'], [/\\}/g, '}'],
  ]
  for (const [from, to] of replacements) out = out.replace(from, to)

  out = out.replace(/([_^])\{([^{}]+)\}/g, (_, op, body) => `${op}(${latexMathToTypst(body)})`)
  out = out.replace(/\\\\/g, '; ')
  out = out.replace(/&/g, '')
  out = out.replace(/\\([a-zA-Z]+)/g, '$1')
  out = out.replace(/[{}]/g, match => (match === '{' ? '(' : ')'))
  out = out.replace(/\s+/g, ' ').trim()
  return out
}

function removeUnsupportedLatexBlocks(text, flags) {
  let out = text
  const patterns = [
    /\\begin\{center\}\s*\\begin\{tikzpicture\}[\s\S]*?\\end\{tikzpicture\}\s*\\end\{center\}/gi,
    /\\begin\{tikzpicture\}[\s\S]*?\\end\{tikzpicture\}/gi,
  ]
  for (const pattern of patterns) {
    out = out.replace(pattern, () => {
      flags.push('tikz')
      return '\n[Hình/BBT LaTeX cần chuyển sang CeTZ hoặc #bbtv2.]\n'
    })
  }
  return out
}

function latexTextToTypst(text, flags = []) {
  let out = String(text || '')
  out = removeUnsupportedLatexBlocks(out, flags)

  out = replaceLatexCommandWithArgs(out, ['textbf'], 1, a => `*${latexTextToTypst(a, flags)}*`)
  out = replaceLatexCommandWithArgs(out, ['textit', 'emph'], 1, a => `_${latexTextToTypst(a, flags)}_`)

  out = out
    .replace(/\\begin\{bodembox\}/g, '\nPhương pháp: ')
    .replace(/\\end\{bodembox\}/g, '\n')
    .replace(/\\begin\{itemize\}/g, '\n')
    .replace(/\\end\{itemize\}/g, '\n')
    .replace(/\\begin\{itemchoice\}/g, '\n')
    .replace(/\\end\{itemchoice\}/g, '\n')
    .replace(/\\itemch\b/g, '\n- ')
    .replace(/\\item\b/g, '\n- ')
    .replace(/\\begin\{center\}/g, '\n')
    .replace(/\\end\{center\}/g, '\n')
    .replace(/\\\\/g, '\n')
    .replace(/\\%/g, '%')

  out = out.replace(/\$\$([\s\S]*?)\$\$/g, (_, m) => `$${latexMathToTypst(m)}$`)
  out = out.replace(/\$([^$\n]*(?:\n(?!\n)[^$\n]*)*)\$/g, (_, m) => `$${latexMathToTypst(m)}$`)

  out = out.replace(/\\([a-zA-Z]+)/g, (_, name) => {
    flags.push(`leftover:${name}`)
    return name
  })
  out = out.replace(/[ \t]+\n/g, '\n').replace(/\n{3,}/g, '\n\n').trim()
  return out
}

function parseLatexQuestion(latex, fallbackType = 'tn') {
  let body = stripExEnvironment(latex)
  const solutionBlock = extractCommand(body, 'loigiai')
  let solutionLatex = ''
  if (solutionBlock) {
    solutionLatex = solutionBlock.body
    body = `${solutionBlock.before}${solutionBlock.after}`.trim()
  }

  let type = fallbackType
  let stemLatex = body
  let options = []
  let statements = []
  let answer = ''
  let correct = []

  const tfIndex = body.search(/\\choiceTF\b/)
  const mcIndex = body.search(/\\choice\b/)
  const saIndex = body.search(/\\shortans(?:\[[^\]]*\])?\s*\{/)

  if (tfIndex >= 0) {
    type = 'ds'
    const parsed = readChoiceArgs(body, tfIndex, 'choiceTF')
    if (parsed) {
      stemLatex = body.slice(0, tfIndex).trim()
      statements = parsed.args.map(item => {
        const ok = /\\True\b/.test(item)
        return { body: item.replace(/\\True\b/g, '').trim(), correct: ok }
      })
    }
  } else if (mcIndex >= 0) {
    type = 'tn'
    const parsed = readChoiceArgs(body, mcIndex, 'choice')
    if (parsed) {
      stemLatex = body.slice(0, mcIndex).trim()
      options = parsed.args.map((item, index) => {
        const ok = /\\True\b/.test(item)
        if (ok) correct.push(index + 1)
        return item.replace(/\\True\b/g, '').trim()
      })
    }
  } else if (saIndex >= 0) {
    type = 'tln'
    const match = /\\shortans(?:\[[^\]]*\])?/.exec(body.slice(saIndex))
    const arg = match ? readBraced(body, saIndex + match[0].length) : null
    if (arg) {
      stemLatex = body.slice(0, saIndex).trim()
      answer = arg.body.trim()
    }
  } else {
    type = fallbackType === 'tln' ? 'tln' : 'tl'
  }

  const flags = []
  const stem = latexTextToTypst(stemLatex, flags)
  const solution = latexTextToTypst(solutionLatex, flags)
  const convertedOptions = options.map(item => latexTextToTypst(item, flags))
  const convertedStatements = statements.map(item => ({
    body: latexTextToTypst(item.body, flags),
    correct: item.correct,
  }))
  const convertedAnswer = latexTextToTypst(answer, flags)

  const leftover = flags.filter(flag => flag.startsWith('leftover:')).length
  const status = leftover > 0 || flags.includes('tikz') ? 'review' : 'ready'

  return {
    type,
    stem,
    options: convertedOptions,
    statements: convertedStatements,
    answer: convertedAnswer,
    correct: correct.length ? correct : [1],
    solution,
    status,
    flags: [...new Set(flags)],
  }
}

function typstString(value) {
  return JSON.stringify(String(value ?? ''))
}

function typstContent(value) {
  const text = String(value ?? '').trim()
  if (!text) return '[]'
  const safe = text
    .replace(/#/g, '\\#')
    .replace(/<([A-Za-z][^>]*)>/g, '\\<$1\\>')
  return `[${safe}]`
}

function typstTuple(items, formatter = typstString) {
  if (!items?.length) return '()'
  const body = items.map(item => `    ${formatter(item)},`).join('\n')
  return `(\n${body}\n  )`
}

function typstTags(tags) {
  if (!tags?.length) return '()'
  return `(${tags.map(tag => `${typstString(tag)},`).join(' ')})`
}

function questionToTypst(q) {
  const meta = [
    `tags: ${typstTags(q.tags)}`,
    `difficulty: ${typstString(q.difficulty)}`,
    `status: ${typstString(q.status)}`,
    `source: ${typstString(q.source)}`,
    `id: ${typstString(q.id)}`,
    q.note ? `note: ${typstString(q.note)}` : null,
  ].filter(Boolean)

  if (q.type === 'tn') {
    return `${typstString(q.id)}: question-tn(\n  ${typstString(q.stem)},\n  ${typstTuple(q.options)},\n  correct: ${q.correct.length === 1 ? q.correct[0] : `(${q.correct.join(', ')})`},\n  solution: ${typstString(q.solution)},\n  ${meta.join(',\n  ')},\n),`
  }
  if (q.type === 'ds') {
    const statements = typstTuple(q.statements, item => `ds-item(${typstString(item.body)}, correct: ${item.correct ? 'true' : 'false'})`)
    return `${typstString(q.id)}: question-ds(\n  ${typstString(q.stem)},\n  ${statements},\n  solution: ${typstString(q.solution)},\n  ${meta.join(',\n  ')},\n),`
  }
  if (q.type === 'tln') {
    return `${typstString(q.id)}: question-tln(\n  ${typstString(q.stem)},\n  ${typstString(q.answer || ' ')},\n  solution: ${typstString(q.solution)},\n  ${meta.join(',\n  ')},\n),`
  }
  return `${typstString(q.id)}: question-tl(\n  ${typstString(q.stem)},\n  solution: ${typstString(q.solution)},\n  ${meta.join(',\n  ')},\n),`
}

async function loadJsQuestions(sourceRoot, seed, limit) {
  const bankRoot = join(sourceRoot, 'banks')
  const files = (await listFiles(bankRoot, file => file.endsWith('.js') && !file.includes('/_shared/'))).slice(0, limit)
  const questions = []
  const errors = []

  for (const file of files) {
    const slot = slotFromPath(file)
    if (!slot) continue
    try {
      const mod = await import(pathToFileURL(file).href)
      for (const [exportName, value] of Object.entries(mod)) {
        if (!value || typeof value !== 'object' || typeof value.generateLatex !== 'function') continue
        const id = String(value.id || exportName)
        let latex = ''
        try {
          latex = String(value.generateLatex(`${seed}-${slot}-${id}`) || '')
        } catch (error) {
          errors.push({ file, id, error: error?.message || String(error) })
          continue
        }
        const fallbackType = value.type ? ({ MC: 'tn', TF: 'ds', SA: 'tln' }[String(value.type).toUpperCase()] || String(value.type).toLowerCase()) : typeFromSlot(slot)
        const parsed = parseLatexQuestion(latex, fallbackType)
        const tags = normalizeTags([
          `stexgv-slot-${slot}`,
          `slot-${slot}`,
          SLOT_META[slot]?.[0],
          value.topic,
          value.keywords || [],
        ])
        questions.push({
          id,
          slot,
          type: parsed.type,
          topic: value.topic || SLOT_META[slot]?.[0] || '',
          level: value.level ?? null,
          difficulty: difficultyFromLevel(value.level),
          source: value.source || `STEXGV:${basename(file, '.js')}`,
          profile: basename(file, '.js').split('_')[1] || 'GEN',
          tags,
          status: parsed.status,
          note: parsed.flags.length ? `STEXGV import flags: ${parsed.flags.join(', ')}` : '',
          stem: parsed.stem,
          options: parsed.options,
          statements: parsed.statements,
          answer: parsed.answer,
          correct: parsed.correct,
          solution: parsed.solution,
          latex,
          file: relative(sourceRoot, file),
        })
      }
    } catch (error) {
      errors.push({ file, error: error?.message || String(error) })
    }
  }

  return { questions, errors }
}

async function writeGeneratedFiles(outDir, questions, errors, args) {
  await mkdir(outDir, { recursive: true })

  const bySlot = {}
  const byStatus = {}
  for (const q of questions) {
    bySlot[q.slot] = (bySlot[q.slot] || 0) + 1
    byStatus[q.status] = (byStatus[q.status] || 0) + 1
  }

  const snapshot = {
    generatedAt: new Date().toISOString(),
    source: args.source,
    seed: args.seed,
    total: questions.length,
    bySlot,
    byStatus,
    errors,
    questions,
  }

  await writeFile(join(outDir, 'stexgv-bank.json'), JSON.stringify(snapshot, null, 2), 'utf8')
  await writeFile(join(outDir, 'stexgv-stats.json'), JSON.stringify({ total: questions.length, bySlot, byStatus, errors }, null, 2), 'utf8')

  const matrix = Object.entries(SLOT_META).map(([slot, [label, type]]) =>
    `  exam-slot(${slot}, label: [${label}], type: ${typstString(type)}, tags: (${typstString(`stexgv-slot-${slot}`)},), status: none),`
  ).join('\n')

  const typ = `// Generated by scripts/stexgv-typst-bridge.mjs. Do not edit by hand.\n#import \"../modules/question-bank.typ\": ds-item, exam-slot, question-ds, question-tl, question-tln, question-tn\n\n#let stexgv-question-bank = (:\n${questions.map(questionToTypst).map(line => `  ${line}`).join('\n\n')}\n)\n\n#let stexgv-thpt-matrix = (\n${matrix}\n)\n`

  await writeFile(join(outDir, 'stexgv-bank.typ'), typ, 'utf8')

  const demo = `// Generated STEXGV -> Typst mix demo.\n#import \"../sang-exam.typ\": *\n#import \"../modules/exam-set.typ\": de\n#import \"../modules/question-bank.typ\": build-exam-plan, render-answer-key, render-exam-plan\n#import \"stexgv-bank.typ\": stexgv-question-bank, stexgv-thpt-matrix\n\n#let render-code(code, seed) = {\n  let plan = build-exam-plan(\n    stexgv-question-bank,\n    stexgv-thpt-matrix,\n    seed: seed,\n    status: none,\n    strict: false,\n  )\n\n  de(\n    [\n      #exam-part([PHẦN I. TRẮC NGHIỆM], count: 12)\n      #render-exam-plan(plan.slice(0, 12), mode: \"dethi\", seed: seed, shuffle-options: true, show-id: true)\n\n      #exam-part([PHẦN II. ĐÚNG / SAI], count: 4)\n      #render-exam-plan(plan.slice(12, 16), mode: \"dethi\", seed: seed, shuffle-options: true, show-id: true)\n\n      #exam-part([PHẦN III. TRẢ LỜI NGẮN], count: 6)\n      #render-exam-plan(plan.slice(16), mode: \"dethi\", seed: seed, shuffle-options: true, show-id: true)\n\n      #pagebreak()\n      #render-answer-key(plan, seed: seed, shuffle-options: true, title: [Bảng đáp án mã #code])\n    ],\n    title: [STEXGV Typst mã #code],\n    exam-title: [ĐỀ TRỘN TỪ KHO STEXGV - TYPST],\n    department: \"HỆ THỐNG CONICTYPST\",\n    school: \"STEXGV BRIDGE\",\n    subject: \"TOÁN\",\n    duration: \"90 phút\",\n    code: code,\n    pagebreak-before: true,\n    show-answer-key: false,\n    show-end: true,\n  )\n}\n\n${args.codes.map((code, i) => `#render-code(${typstString(code)}, ${args.examSeed + i})`).join('\n')}\n`

  await writeFile(join(outDir, 'stexgv-mix-demo.typ'), demo, 'utf8')
}

async function compileDemo(outDir) {
  await mkdir(resolve(repoRoot, 'output'), { recursive: true })
  const input = relative(repoRoot, join(outDir, 'stexgv-mix-demo.typ'))
  const output = relative(repoRoot, defaultPdfOut)
  const result = spawnSync('typst', ['compile', '--root', 'typst', input, output], {
    cwd: repoRoot,
    encoding: 'utf8',
  })

  if (result.stdout) process.stdout.write(result.stdout)
  if (result.stderr) process.stderr.write(result.stderr)
  if (result.status !== 0) {
    throw new Error(`Typst compile failed with exit code ${result.status}`)
  }
  return defaultPdfOut
}

async function main() {
  const args = parseArgs(process.argv.slice(2))
  if (args.command === 'help') {
    console.log(`Usage:\n  node scripts/stexgv-typst-bridge.mjs import [--source PATH] [--out-dir PATH] [--seed S] [--limit N] [--compile]\n  node scripts/stexgv-typst-bridge.mjs mix [--codes 101,102] [--exam-seed 2026] [--compile]\n\nThe import command writes typst/stexgv-import/stexgv-bank.{json,typ} and stexgv-mix-demo.typ.`)
    return
  }

  if (!existsSync(args.source)) {
    throw new Error(`Không tìm thấy STEXGV source: ${args.source}`)
  }

  const { questions, errors } = await loadJsQuestions(args.source, args.seed, args.limit)
  await writeGeneratedFiles(args.outDir, questions, errors, args)
  const pdf = args.compile ? await compileDemo(args.outDir) : null

  console.log(JSON.stringify({
    ok: true,
    source: args.source,
    outDir: args.outDir,
    total: questions.length,
    ready: questions.filter(q => q.status === 'ready').length,
    review: questions.filter(q => q.status === 'review').length,
    errors: errors.length,
    pdf,
  }, null, 2))
}

main().catch(error => {
  console.error(error)
  process.exit(1)
})
