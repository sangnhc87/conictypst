// Bảng tuỳ chọn làm đẹp / trộn đề dùng chung cho app Mac và add-in. Mỗi trường khớp một khoá trong engine (docx_shuffler.configure_style).
const FONTS = ['Times New Roman', 'Cambria', 'Arial', 'Calibri', 'Tahoma', 'Verdana']

export const GROUPS = [
  { title: 'Màu sắc', fields: [
    { key: 'palette', label: 'Bảng màu', type: 'select', value: 'mac_dinh', options: [['mac_dinh', 'Xanh – tím (mặc định)'], ['xanh', 'Xanh dương nhã'], ['xanh_la', 'Xanh lá'], ['do', 'Đỏ – xanh đậm'], ['den', 'Đen trắng (in tiết kiệm)']] },
    { key: 'title_color', label: 'Màu tiêu đề phần', type: 'color' },
    { key: 'qnum_color', label: 'Màu "Câu 1:"', type: 'color' },
    { key: 'label_color', label: 'Màu A. B. C. D.', type: 'color' },
    { key: 'frame_color', label: 'Màu khung/viền', type: 'color' },
  ] },
  { title: 'Chữ và khoảng cách', fields: [
    { key: 'font_name', label: 'Phông chữ', type: 'select', value: 'Times New Roman', options: FONTS.map(f => [f, f]) },
    { key: 'font_size', label: 'Cỡ chữ (pt)', type: 'select', value: '12', options: ['10', '11', '12', '13', '14'].map(x => [x, x]) },
    { key: 'line_spacing', label: 'Giãn dòng', type: 'select', value: '1.0', options: [['1.0', 'Đơn (1.0)'], ['1.15', '1.15'], ['1.3', '1.3'], ['1.5', '1.5']] },
    { key: 'question_gap', label: 'Khoảng cách giữa các câu', type: 'select', value: 'vua', options: [['sat', 'Sát'], ['vua', 'Vừa'], ['rong', 'Rộng']] },
    { key: 'bold_labels', label: 'In đậm A. B. C. D.', type: 'check', value: true },
  ] },
  { title: 'Khung và bố cục câu hỏi', fields: [
    { key: 'frame_style', label: 'Đóng khung từng câu', type: 'select', value: 'none', options: [['none', 'Không khung'], ['simple', 'Khung đơn'], ['shadow', 'Khung đổ bóng'], ['double', 'Khung đôi'], ['dotted', 'Khung chấm'], ['left_bar', 'Vạch đậm bên trái'], ['fill', 'Khung nền nhạt']] },
    { key: 'choices_layout', label: 'Xếp đáp án A B C D', type: 'select', value: 'auto', options: [['auto', 'Tự chọn hợp lý'], ['1x4', '1 hàng (4 cột)'], ['2x2', '2 hàng × 2 cột'], ['4x1', '4 hàng (dọc)']] },
    { key: 'tf_style', label: 'Câu Đúng/Sai (Phần II)', type: 'select', value: 'list', options: [['list', 'Dạng danh sách a) b) c) d)'], ['table', 'Dạng bảng Đúng | Sai']] },
    { key: 'columns', label: 'Số cột trang', type: 'select', value: '1', options: [['1', '1 cột'], ['2', '2 cột (tiết kiệm giấy)']] },
    { key: 'margin_lr_cm', label: 'Lề trái/phải (cm)', type: 'number', value: '1.75', min: 0.8, max: 4, step: 0.05 },
    { key: 'margin_tb_cm', label: 'Lề trên/dưới (cm)', type: 'number', value: '1.5', min: 0.8, max: 4, step: 0.05 },
  ] },
  { title: 'Đầu đề, tiêu đề phần, kết thúc', fields: [
    { key: 'show_titles', label: 'Tiêu đề từng phần (PHẦN I…)', type: 'check', value: true },
    { key: 'title_line', label: 'Kẻ đường dưới tiêu đề phần', type: 'check', value: true },
    { key: 'section_hints', label: 'Dòng hướng dẫn dưới tiêu đề phần', type: 'check', value: true },
    { key: 'de_chinh_thuc_text', label: 'Chữ dưới tên trường', type: 'text', value: 'ĐỀ CHÍNH THỨC', placeholder: 'để trống nếu không cần' },
    { key: 'header_box', label: 'Kẻ khung đầu đề', type: 'check', value: false },
    { key: 'show_student', label: 'Dòng Họ tên / Số báo danh / Mã đề', type: 'check', value: true },
    { key: 'show_ender', label: 'Dòng ---Hết---', type: 'check', value: true },
    { key: 'ender_note', label: 'Ghi chú cuối đề', type: 'text', value: 'Thí Sinh Không Được Sử Dụng Tài Liệu - Cán Bộ Coi Thi Không Giải Thích Gì Thêm.' },
    { key: 'show_footer', label: 'Chân trang "Trang X / Y – Mã đề"', type: 'check', value: true },
  ] },
  { title: 'Chỗ trả lời', fields: [
    { key: 'sa_answer_line', label: 'Dòng "Trả lời: ……" sau câu trả lời ngắn', type: 'check', value: false },
    { key: 'sa_lines', label: 'Số dòng kẻ chấm sau câu trả lời ngắn', type: 'number', value: '0', min: 0, max: 12, step: 1 },
    { key: 'tl_lines', label: 'Số dòng kẻ chấm sau câu tự luận', type: 'number', value: '0', min: 0, max: 40, step: 1 },
  ] },
  { title: 'Tệp xuất ra', fields: [
    { key: 'ten_tep', label: 'Tên tệp (thay "TronDe")', type: 'text', value: '', placeholder: 'TronDe' },
    { key: 'xuat_loigiai', label: 'Xuất bản đáp án + lời giải từng mã đề', type: 'check', value: true },
    { key: 'xuat_bangdapan', label: 'Xuất BangDapAn.docx (bảng đáp án các mã)', type: 'check', value: true },
  ] },
]

export const PRESETS = {
  chuan: { name: 'Chuẩn (mặc định)', values: {} },
  hien_dai: { name: 'Hiện đại – xanh, khung đơn, bảng Đ/S', values: { palette: 'xanh', frame_style: 'simple', tf_style: 'table', line_spacing: '1.15', question_gap: 'rong', sa_answer_line: true } },
  tiet_kiem: { name: 'Tiết kiệm giấy – 2 cột, chữ 11', values: { columns: '2', font_size: '11', margin_lr_cm: '1.2', margin_tb_cm: '1.2', question_gap: 'sat', section_hints: false, choices_layout: '2x2' } },
  den_trang: { name: 'Đen trắng in ấn – không màu', values: { palette: 'den', tf_style: 'table', frame_style: 'none', bold_labels: true } },
  tu_luan: { name: 'Có chỗ làm bài – kẻ dòng', values: { palette: 'xanh', sa_answer_line: true, tl_lines: 8, sa_lines: 2, question_gap: 'rong' } },
}

const ALL = GROUPS.flatMap(g => g.fields)
const defaults = () => Object.fromEntries(ALL.filter(f => f.type !== 'color').map(f => [f.key, f.value]))

const el = (tag, props = {}, ...kids) => { const n = Object.assign(document.createElement(tag), props); n.append(...kids); return n }

/** Dựng bảng tuỳ chọn vào `container`. Trả về { read, write, reset }. */
export function mountStyleOptions(container, onChange = () => {}) {
  const inputs = new Map()
  const fire = () => onChange(read())

  const preset = el('select', { className: 'preset' }, ...Object.entries(PRESETS).map(([k, v]) => el('option', { value: k, textContent: v.name })))
  preset.addEventListener('change', () => { write({ ...defaults(), ...PRESETS[preset.value].values }, true); fire() })
  const bar = el('label', {}, 'Mẫu nhanh ', preset)
  const wrap = el('div', { className: 'style-groups' })

  for (const group of GROUPS) {
    const box = el('fieldset', { className: 'style-group' }, el('legend', { textContent: group.title }))
    const grid = el('div', { className: 'grid2' })
    for (const f of group.fields) {
      let input
      if (f.type === 'select') input = el('select', {}, ...f.options.map(([v, t]) => el('option', { value: v, textContent: t })))
      else if (f.type === 'check') input = el('input', { type: 'checkbox' })
      else if (f.type === 'color') input = el('input', { type: 'color' })
      else if (f.type === 'number') input = el('input', { type: 'number', min: f.min, max: f.max, step: f.step })
      else input = el('input', { type: 'text', placeholder: f.placeholder || '' })
      inputs.set(f.key, { f, input, touched: false })
      input.addEventListener('input', () => { inputs.get(f.key).touched = true; fire() })
      input.addEventListener('change', () => { inputs.get(f.key).touched = true; fire() })
      let line
      if (f.type === 'check') line = el('label', { className: 'check' }, input, ' ' + f.label)
      else if (f.type === 'color') {
        const clear = el('button', { type: 'button', className: 'link', textContent: 'đặt lại' })
        clear.addEventListener('click', () => { inputs.get(f.key).touched = false; input.value = '#000000'; fire() })
        line = el('label', {}, f.label + ' ', input, ' ', clear)
      } else line = el('label', {}, f.label, input)
      grid.append(line)
    }
    box.append(grid); wrap.append(box)
  }
  container.replaceChildren(bar, wrap)

  function read() {
    const out = {}
    for (const [key, { f, input, touched }] of inputs) {
      if (f.type === 'check') out[key] = input.checked
      else if (f.type === 'color') { if (touched) out[key] = input.value.replace('#', '') }
      else out[key] = input.value.trim()
    }
    return out
  }
  function write(values = {}, resetTouched = false) {
    const merged = { ...defaults(), ...values }
    for (const [key, entry] of inputs) {
      const { f, input } = entry
      if (f.type === 'check') input.checked = !!merged[key]
      else if (f.type === 'color') {
        const v = values[key]
        entry.touched = !!v && !resetTouched
        input.value = v && !resetTouched ? '#' + String(v).replace('#', '') : '#000000'
      } else input.value = merged[key] ?? ''
    }
  }
  write()
  return { read, write, reset: () => write() }
}
