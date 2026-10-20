// Kiểm thử phần dựng AppleScript của thẻ Công cụ soạn trong app Mac (không cần Word).
// Chạy: node tools/sang-mathtype/tests/tools-mac.test.mjs   (thử với Word thật: SM_LIVE_WORD=1 node tests/live-word-tools.mjs)
import { execFileSync } from 'node:child_process'
import { writeFileSync, mkdtempSync } from 'node:fs'
import { tmpdir } from 'node:os'
import path from 'node:path'
import { readScript, parseRead, buildApply, finishApply, FMT } from '../desktop/word-tools.mjs'
import { planRenumber } from '../src/tools/parse.js'
import { planFormat, planAnswerTable, planQr, TEMPLATES } from '../src/tools/plans.js'
import { prepare } from '../src/tools/runner.js'

let failures = 0
const check = (name, ok, extra = '') => { console.log(`${ok ? 'OK  ' : 'FAIL'} ${name} ${ok ? '' : extra}`); if (!ok) failures++ }
const J = JSON.stringify
const canCompile = process.platform === 'darwin' && (() => { try { execFileSync('which', ['osacompile']); return true } catch { return false } })()
const compiles = script => {
  const dir = mkdtempSync(path.join(tmpdir(), 'smt-'))
  const f = path.join(dir, 'x.applescript')
  writeFileSync(f, script)
  try { execFileSync('osacompile', ['-o', path.join(dir, 'x.scpt'), f], { stdio: 'pipe' }); return true } catch (e) { return String(e.stderr) }
}

// đọc đoạn văn
const parsed = parseRead('0\t12\tPHẦN I. Test\n12\t20\tCâu 5. a\tb\n20\t21\t\n')
check('đọc đoạn: chữ có tab vẫn nguyên, đoạn trống', parsed.paras.length === 3 && parsed.paras[1] === 'Câu 5. a\tb' && parsed.paras[2] === '' && J(parsed.layout.starts) === J([0, 12, 20]) && J(parsed.layout.ends) === J([12, 20, 21]))
check('vùng chọn rỗng', parseRead('EMPTY').paras.length === 0)
check('đọc tài liệu tiếng Việt từ osascript dùng \\r', parseRead('0\t5\tabc\r5\t9\tdef\r').paras.length === 2)

const PARAS = ['PHẦN I. Trắc nghiệm', 'Câu 5. Tính', 'A. 1', 'C. 2', 'Câu 7: Cho', 'A. a\tB. b\tD. d']
const layout = { starts: [0, 20, 32, 37, 42, 53], ends: [20, 32, 37, 42, 53, 67] }

// đổi nhãn: từ cuối lên đầu, thao tác ngược theo tọa độ sau khi đổi
{
  const ops = planRenumber(PARAS)
  const { script, plan } = buildApply(ops, layout, '/tmp/x')
  const order = [...script.matchAll(/set rg to create range d start (\d+) end/g)].map(m => Number(m[1]))
  check('nhãn xử lý từ cuối lên đầu', order.every((v, i) => i === 0 || order[i - 1] > v), J(order))
  check('nhãn chỉ đổi khi nội dung đúng như mong đợi', /if \(content of rg\) is "Câu 5" then/.test(script) && /set content of rg to "Câu 1"/.test(script))
  const out = plan.labels.map(l => `L|${l.idx}|ok`).join('\n') + '\n'
  const fin = finishApply(out, plan)
  const inv = fin.inverse
  check('thao tác ngược gồm đủ nhãn, đánh dấu post và đảo from/to', inv.length === ops.length && inv.every(o => o.t === 'label' && o.post === true) && inv.some(o => o.from === 'Câu 1' && o.to === 'Câu 5'), J(inv))
  const rev = buildApply(inv, layout, '/tmp/x').script
  check('thao tác ngược dùng tọa độ tuyệt đối', /create range d start 20 end 25/.test(rev) || inv.some(o => o.abs === 20))
  if (canCompile) check('AppleScript đổi nhãn biên dịch được', compiles(script) === true, compiles(script))
}

// định dạng: đọc giá trị cũ rồi mới ghi; khôi phục từ giá trị đọc được
{
  const ops = prepare(planFormat(PARAS, { ...TEMPLATES.chuan, boldLabel: true }))
  const { script, plan } = buildApply(ops, layout, '/tmp/x')
  const firstRead = script.indexOf('"F|'), firstWrite = script.indexOf('set name of font object')
  check('đọc giá trị cũ trước khi ghi', firstRead >= 0 && firstRead < firstWrite)
  check('giãn dòng 1,15 → quy tắc nhiều dòng 13,8 pt', /set line spacing rule of paragraph format of rg to line space multiple\n\s+set line spacing of paragraph format of rg to 13\.8/.test(script))
  check('chèn dòng kẻ sau tiêu đề PHẦN', /create range d start 20 end 20|set vp to 20/.test(script) && script.includes('─'.repeat(10)))
  const f0 = plan.fmts.find(f => f.o.p === 1 && !f.o.span)
  const stdout = [`F|${f0.idx}|font|Calibri`, `F|${f0.idx}|size|11,5`, `F|${f0.idx}|lineSpacing|12,95`, `F|${f0.idx}|lsRule|multiple`, `F|${f0.idx}|align|left`, `F|${f0.idx}|spaceBefore|0`, `F|${f0.idx}|spaceAfter|0`, ...plan.inserts.map(i => `I|${i.idx}|${i.pos}|${i.pos + 70}|70`)].join('\n')
  const fin = finishApply(stdout, plan)
  const back = fin.inverse.find(o => o.t === 'fmt' && o.abs.s === 20)
  check('khôi phục định dạng: số thập phân dấu phẩy, quy tắc dòng', back && back.props.size === 11.5 && back.props.lineSpacing === 12.95 && back.props.lsRule === 'multiple' && back.props.font === 'Calibri' && back.abs.e === 31, J(back))
  const removes = fin.inverse.filter(o => o.t === 'remove')
  check('gỡ dòng kẻ: tọa độ cuối cộng độ dài khối chèn phía trước', removes.length === 1 && removes[0].start === 20 && removes[0].end === 90 && removes[0].clen === 70, J(removes))
  const inverseScript = buildApply(fin.inverse, layout, '/tmp/x').script
  check('thao tác ngược: gỡ khối trước, khôi phục định dạng sau', inverseScript.indexOf('-- gỡ') >= 0 && inverseScript.indexOf('-- gỡ') < inverseScript.indexOf('-- định dạng'))
  if (canCompile) { check('AppleScript định dạng biên dịch được', compiles(script) === true, compiles(script)); check('AppleScript thao tác ngược biên dịch được', compiles(inverseScript) === true, compiles(inverseScript)) }
}
check('màu #c00000 → 16 bit', FMT.color.set('#c00000') === 'set color of font object of rg to {49344, 0, 0}', FMT.color.set('#c00000'))
check('màu đọc lại 49344,0,0 → #c00000', FMT.color.parse('49344,0,0') === '#c00000')
check('ký tự đặc biệt trong chuỗi AppleScript được thoát', buildApply([{ t: 'label', abs: 5, from: 'a"b', to: 'c\\d' }], layout, '/tmp/x').script.includes('"a\\"b"'))

// chèn bảng, ảnh QR
{
  const ops = prepare(planAnswerTable(PARAS, { key: '5A 7B', where: 'end' }))
  const { script } = buildApply(ops, layout, '/tmp/share')
  check('chèn cuối tài liệu: mở đầu bằng dấu đoạn mới', /set vp to \(end of content of text object of d\) - 1/.test(script) && /make new table at d with properties \{text object:\(create range d start vp end vp\), number of rows:2, number of columns:3\}/.test(script))
  check('bảng có viền ngoài + trong', /set outside line style of border options of vtb to line style single/.test(script) && /set inside line style of border options of vtb to line style single/.test(script))
  check('ô bảng điền bằng nội dung', /set content of text object of cell 2 of row 2 of vtb to "A"/.test(script))
  if (canCompile) check('AppleScript chèn bảng biên dịch được', compiles(script) === true, compiles(script))
  const qr = planQr(PARAS, { key: '5A 7B', ma: '1', where: 'selEnd' })
  const b = buildApply(prepare(qr.ops), layout, '/tmp/share')
  check('ảnh QR ghi ra tệp .gif trong thư mục chia sẻ với Word', b.files.length === 1 && b.files[0].file.startsWith('/tmp/share/') && b.files[0].file.endsWith('.gif') && /make new inline picture at vrg with properties \{file name:"\/tmp\/share\//.test(b.script))
  check('chèn tại con trỏ: tính vị trí lúc chạy', /set vsp to end of content of selection/.test(b.script))
  if (canCompile) check('AppleScript chèn QR biên dịch được', compiles(b.script) === true, compiles(b.script))
}
check('không cho trộn đổi nhãn với chèn', (() => { try { buildApply([{ t: 'label', abs: 1, from: 'a', to: 'b' }, { t: 'insert', where: 'end', blocks: [] }], layout, '/x'); return false } catch (e) { return /không kết hợp/i.test(e.message) } })())
if (canCompile) check('AppleScript đọc đoạn biên dịch được', compiles(readScript('doc')) === true && compiles(readScript('sel')) === true, compiles(readScript('doc')))

if (failures) { console.error(`${failures} kiểm thử thất bại`); process.exit(1) }
console.log('Tất cả đạt')
