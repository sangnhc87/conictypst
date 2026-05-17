// ═══════════════════════════════════════════════════════════
// SANG-FULL.TYP v1.0 — Import tổng hợp một lần
// ═══════════════════════════════════════════════════════════
// Đây là file tổng hợp import toàn bộ hệ thống ConicTypst.
// Chỉ cần 1 dòng: #import "sang-full.typ": *
// Sẽ có tất cả: tn/ds/tln/tl, hộp sư phạm, bbt, geometry, themdep
//
// Dùng cho:
//   - typst.app (soạn online): import file này là có tất cả
//   - VS Code (soạn local): import file này là có tất cả
// ═══════════════════════════════════════════════════════════

// ── Engine đề thi chính ─────────────────────────────────
#import "sang-exam.typ": (
  // Màu
  palette, classic,
  // Show rules
  sang-setup,
  // Hộp sư phạm (Lời giải)
  ppgiai, luuy, meo, nhanxet, giainhanh, lythuyet, note,
  // Hộp học thuật
  dn, dl, tc, bode,
  // Câu hỏi đề thi (alias ngắn)
  tn, ds, tln, tl,
  // Câu hỏi đề thi (tên đầy đủ)
  mcq, tf, short,
  // Macro tiện ích
  True, False,
  exam-mode, exam-part, het,
  thpt-school-exam, print-answer-key,
  // Bộ đếm
  setcounter, resetcounter, setcau, resetcau, setphan, resetphan,
  resetexamstate,
  // Công cụ
  draw-lines, dien-khuyet, o-ly,
  step, reset-step, configure-step-reveal,
  tfrac, vect, hoac, heva,
)

// ── BBT — Bảng biến thiên & xét dấu ─────────────────────
#import "bbt.typ": (
  bbbt,    // BBT tổng quát
  bbt-opt, // BBT tối ưu (1 cực trị)
  bbtv2,   // BBT nâng cao (có shade/tiệm cận)
  bxd,     // Bảng xét dấu
  auto-bbt,// BBT tự động kiểu cũ
  bang-gia-tri,     // Bảng giá trị đơn giản
  bang-phan-phoi,   // Bảng phân phối xác suất
)

// ── Geometry — Vẽ hình học nhanh ────────────────────────
#import "geometry.typ": (
  tri-xyz, tri-abc, tri-right,      // Tam giác
  rect-xyz, rect-abc, square,        // Hình chữ nhật / vuông
  chop-sabc, chop-sabcd,            // Hình chóp
  lang-tru-abc,                      // Lăng trụ
  circle-desc, semicircle,           // Đường tròn
  angle-mark, seg, dashed-seg, point, // Markers
  axis-xy, parabola, plot, line-through, // Đồ thị
  ellipse-h,                         // Elip
)

// ── Math Symbols — Alias LaTeX→Typst ────────────────────
#import "math-sym.typ": *

// ── Template Router — stexgv-doc các loại tài liệu ──────
#import "template.typ": (
  stexgv-doc,
  // Book/SGK macros
  chapter, lesson, bai, part, unit,
  section, muc, subsection, tieumuc, microsection,
  appendix, phuluc, appendix-section, mucphuluc,
  topic, dang,
  vd, vidu, bt, baitap, cauhoi, hoatdongn, hd, onluyen,
  muctieu, chuanbi, khoidong, khampha, hoatdong,
  luyentap, vandung, morang, tomtat, duan, ghinho,
  phuongphap, nhanxet, gioithieu, loinoidau,
  huongdansudung, bangthuatngu, tailieuthamkhao,
  muctieuchung, khung, smartbox,
  setbookcounter, resetbookcounter,
  setchuong, resetchuong, setbai, resetbai,
  setmuc, resetmuc, setphuluc, resetphuluc,
  setvd, resetvd, setbt, resetbt, settieumuc, resettieumuc,
  stexgv-book,
  // Exam-set
  de, dethi, matran, dacta, huongdancham, luuybode,
  stexgv-exam-set,
  // Bank
  bank-attach, bank-count, bank-field, bank-filter, bank-lookup, load-bank,
  // Question bank
  ds-item, question-ds, question-filter, question-list, question-lookup,
  question-missing, question-orphans, question-select,
  question-tl, question-tln, question-tn,
  render-question, render-selection,
  // Research
  stexgv-research,
)

// ── Layout nâng cao — themdep.typ ───────────────────────
#import "themdep.typ": (
  layout-draft, layout-2col, layout-2col-draft,
  cover-exam, cover-cd, cover-book,
  answer-sheet, barem, matrix-box, student-block,
  chuyende-header, part-fancy,
  callout, info, warn, success-box, tip-box, quote-box,
  deco-line, timeline, progress-strip,
  stamp, qr-placeholder, option-box, exam-2col-wrap,
)
