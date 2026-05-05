// ═══════════════════════════════════════════════════════════
// STEXGV TEMPLATE ECOSYSTEM
// Hệ sinh thái Typst chuẩn mực cho Toán học
// ═══════════════════════════════════════════════════════════

// Export các công cụ dùng chung
#import "modules/exam.typ": palette, classic, True, tn, ds, tln, tl, mcq, tf, short, exam-part, het, print-answer-key, exam-mode, ppgiai, luuy, meo, giainhanh, lythuyet, note, dn, dl, tc, bode, setcounter, resetcounter, setcau, resetcau, setphan, resetphan, resetexamstate, thpt-school-exam
#import "modules/book.typ": stexgv-book, setbookcounter, resetbookcounter, setchuong, resetchuong, setbai, resetbai, setmuc, resetmuc, settieumuc, resettieumuc, sety, resety, setphuluc, resetphuluc, setvd, resetvd, setbt, resetbt, loinoidau, gioithieu, huongdansudung, muctieuchung, bangthuatngu, tailieuthamkhao, references, glossary, preface, introduction, part, unit, chapter, lesson, bai, topic, dang, section, muc, subsection, tieumuc, microsection, y, appendix, phuluc, appendix-section, mucphuluc, vd, vidu, bt, baitap, cauhoi, hoatdongn, hd, onluyen, smartbox, khung, muctieu, chuanbi, khoidong, khampha, hoatdong, luyentap, vandung, morang, tomtat, duan, nhanxet, ghinho, phuongphap, definition
#import "modules/exam-set.typ": stexgv-exam-set, de, dethi, matran, dacta, huongdancham, luuybode
#import "modules/bank.typ": load-bank, bank-field, bank-filter, bank-count, bank-lookup, bank-attach
#import "modules/question-bank.typ": ds-item, question-tn, question-ds, question-tln, question-tl, question-list, question-filter, question-lookup, question-select, question-missing, question-orphans, render-question, render-selection
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

  body
) = {
  let kind = lower(str(doc-type))

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
      accent: theme-color
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
      outline-depth: outline-depth
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
      outline-depth: outline-depth
    )
    body
  } else if kind == "research" {
    show: stexgv-research.with(
      title: title,
      authors: (author,),
      abstract: abstract,
      keywords: keywords,
      two-columns: two-columns,
      theme-color: theme-color
    )
    body
  } else {
    // Fallback mặc định
    body
  }
}
