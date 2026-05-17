// ═══════════════════════════════════════════════════════════
// STEXGV TEMPLATE ECOSYSTEM
// Hệ sinh thái Typst chuẩn mực cho Toán học
// ═══════════════════════════════════════════════════════════

// Export các công cụ dùng chung
#import "modules/exam.typ": (
  True, bode, classic, dl, dn, ds, exam-mode, exam-part, giainhanh, het, luuy, lythuyet, mcq, meo, note, palette,
  ppgiai, print-answer-key, resetcau, resetcounter, resetexamstate, resetphan, setcau, setcounter, setphan, short, tc,
  tf, thpt-school-exam, tl, tln, tn,
)
#import "modules/book.typ": (
  appendix, appendix-section, bai, baitap, bangthuatngu, bt, cauhoi, chapter, chuanbi, dang, definition, duan, ghinho,
  gioithieu, glossary, hd, hoatdong, hoatdongn, huongdansudung, introduction, khampha, khoidong, khung, lesson,
  loinoidau, luyentap, microsection, morang, muc, mucphuluc, muctieu, muctieuchung, nhanxet, onluyen, part, phuluc,
  phuongphap, preface, references, resetbai, resetbookcounter, resetbt, resetchuong, resetmuc, resetphuluc,
  resettieumuc, resetvd, resety, section, setbai, setbookcounter, setbt, setchuong, setmuc, setphuluc, settieumuc,
  setvd, sety, smartbox, stexgv-book, subsection, tailieuthamkhao, tieumuc, tomtat, topic, unit, vandung, vd, vidu, y,
)
#import "modules/exam-set.typ": dacta, de, dethi, huongdancham, luuybode, matran, stexgv-exam-set
#import "modules/bank.typ": bank-attach, bank-count, bank-field, bank-filter, bank-lookup, load-bank
#import "modules/question-bank.typ": (
  ds-item, question-ds, question-filter, question-list, question-lookup, question-missing, question-orphans,
  question-select, question-tl, question-tln, question-tn, render-question, render-selection,
)
#import "modules/research.typ": stexgv-research

// ─────────────────────────────────────────────────────────
// HÀM ĐIỀU PHỐI CHÍNH (ROUTER)
// ─────────────────────────────────────────────────────────
#let stexgv-doc(
  doc-type: "book", // "exam" | "book" | "sgk" | "chuyende" | "bo-de" | "research"
  title: "TÀI LIỆU STEXGV",
  subtitle: none,
  author: "Tác Giả",
  theme-color: classic.blue,
  // Tham số chung cho tài liệu học tập / bộ đề
  institution: none,
  subject: none,
  grade: none,
  series: none,
  academic-year: none,
  publisher: none,
  cover-note: none,
  show-cover: true,
  show-outline: true,
  outline-depth: 4,
  // Tham số cho đề thi
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  duration: "90 phút",
  structure: auto,
  code: "",
  footer-left: none,
  // Tham số cho NCKH
  abstract: none,
  keywords: (),
  two-columns: true,
  body,
) = {
  let kind = lower(str(doc-type))

  // Tự động chuyển C, A, P (những chữ số gán sub/sup) thành chữ đứng (chuẩn Toán VN)
  show math.attach: it => {
    let f = it.base.fields()
    if "text" in f and f.text in ("C", "A", "P") {
      return math.attach(math.upright(f.text), t: it.t, b: it.b, tl: it.tl, bl: it.bl, tr: it.tr, br: it.br)
    }
    it
  }

  if kind == "exam" {
    show: thpt-school-exam.with(
      department: department,
      school: school,
      exam-title: title,
      subject: if subject == none { "TOÁN - LỚP 12" } else { subject },
      duration: duration,
      structure: structure,
      code: code,
      footer-left: footer-left,
      accent: theme-color,
    )
    body
  } else if ("book", "outline", "sgk", "textbook", "chuyende").contains(kind) {
    show: stexgv-book.with(
      title: title,
      subtitle: subtitle,
      author: author,
      theme-color: theme-color,
      doc-type: kind,
      institution: institution,
      subject: subject,
      grade: grade,
      series: series,
      academic-year: academic-year,
      publisher: publisher,
      cover-note: cover-note,
      show-cover: show-cover,
      show-outline: show-outline,
      outline-depth: outline-depth,
    )
    body
  } else if ("bo-de", "exam-set").contains(kind) {
    show: stexgv-exam-set.with(
      title: title,
      subtitle: subtitle,
      author: author,
      institution: institution,
      subject: subject,
      grade: grade,
      series: series,
      academic-year: academic-year,
      publisher: publisher,
      cover-note: cover-note,
      theme-color: theme-color,
      show-cover: show-cover,
      show-outline: show-outline,
      outline-depth: outline-depth,
    )
    body
  } else if kind == "research" {
    show: stexgv-research.with(
      title: title,
      authors: (author,),
      abstract: abstract,
      keywords: keywords,
      two-columns: two-columns,
      theme-color: theme-color,
    )
    body
  } else {
    // Fallback mặc định
    body
  }
}
