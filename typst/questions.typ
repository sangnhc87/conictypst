// ═══════════════════════════════════════════════════════════
// typst/questions.typ — MASTER IMPORT & SMART QUERY API
// ✅ "Muốn là lấy được" — lọc theo mọi tiêu chí
//
// CÁCH DÙNG NHANH:
//   #import "questions.typ": question-bank, qb-get, qb-filter
//
//   // Lấy 1 câu theo ID
//   #render-question(qb-get(question-bank, "12GT-TI-01"))
//
//   // Lấy tất cả câu NB, loại TN
//   #let nbs = qb-filter(question-bank, difficulty: "NB", type: "tn")
//   #render-selection(nbs)
//
//   // Lấy câu có tag "oxyz", mức VD trở lên
//   #let oxyz-vd = qb-filter(question-bank, tag: "oxyz", difficulty: ("VD","VDC"))
//
//   // Xem thống kê
//   #qb-print-stat(question-bank)
// ═══════════════════════════════════════════════════════════

#import "modules/question-bank.typ": ds-item, question-tn, question-ds, question-tln, question-tl, render-question, render-selection

// ── Import các file ngân hàng theo môn/lớp ──────────────
#import "questions/lop12-giai-tich.typ": q-lop12-giai-tich
#import "questions/lop12-hinh-hoc.typ": q-lop12-hinh-hoc
#import "questions/lop12-xac-suat.typ": q-lop12-xac-suat
// Thêm file mới:
// #import "questions/lop11-xac-suat.typ": q-lop11-xac-suat
// #import "questions/lop10-dai-so.typ": q-lop10-dai-so

// ── Câu hỏi mẫu lớp 10 (giữ nguyên từ phiên bản cũ) ────
#let _q-lop10-mau = (
  "0D1N1-1": question-tn(
    [Phát biểu nào sau đây là một mệnh đề?],
    (
      [Bạn học tốt nhé!],
      [$2$ là số nguyên tố.],
      [Hôm nay đẹp quá!],
      [$x + 1 = 3$],
    ),
    correct: 2,
    solution: [Chỉ phát biểu "$2$ là số nguyên tố" có thể xác định đúng hoặc sai nên là mệnh đề.],
    tags: ("lop10", "menh-de"),
    difficulty: "NB",
    status: "ready",
    source: "questions.typ",
  ),

  "0D1N1-2": question-ds(
    [Xét các phát biểu sau liên quan đến khái niệm mệnh đề.],
    (
      ds-item([Phát biểu "$2$ là số chẵn" là một mệnh đề.], correct: true),
      ds-item([Câu "Hãy mở sách ra" là một mệnh đề.], correct: false),
      ds-item([Phát biểu "$3 > 5$" vẫn là một mệnh đề dù sai.], correct: true),
      ds-item([Biểu thức "$x^2 - 1 = 0$" luôn là một mệnh đề.], correct: false),
    ),
    solution: [Mệnh đề chỉ cần có thể xác định đúng hoặc sai. Câu cầu khiến và mệnh đề chứa biến tự do không phải mệnh đề.],
    tags: ("lop10", "menh-de"),
    difficulty: "TH",
    status: "ready",
    source: "questions.typ",
  ),

  "0D1N1-3": question-tln(
    [Viết phủ định của mệnh đề $P$: "$5$ là số nguyên tố".],
    [$5$ không phải là số nguyên tố.],
    solution: [Phủ định của "$5$ là số nguyên tố" là "$5$ không phải là số nguyên tố".],
    tags: ("lop10", "menh-de"),
    difficulty: "TH",
    status: "ready",
    source: "questions.typ",
  ),

  "0D1N1-4": question-tl(
    [Cho mệnh đề $P$: "Nếu một tứ giác là hình vuông thì tứ giác đó là hình chữ nhật". Hãy nêu mệnh đề đảo và nhận xét tính đúng sai.],
    solution: [
      Mệnh đề đảo: "Nếu một tứ giác là hình chữ nhật thì tứ giác đó là hình vuông".
      Mệnh đề đảo *sai* vì có những hình chữ nhật không phải hình vuông.
    ],
    tags: ("lop10", "menh-de"),
    difficulty: "VD",
    status: "ready",
    source: "questions.typ",
  ),
)

// ── Hợp nhất toàn bộ ngân hàng ──────────────────────────
#let question-bank = (
  .._q-lop10-mau,
  ..q-lop12-giai-tich,
  ..q-lop12-hinh-hoc,
  ..q-lop12-xac-suat,
  // Thêm ở đây khi có file mới
)

// ════════════════════════════════════════════════════════
// SMART QUERY API
// ════════════════════════════════════════════════════════

// Lấy 1 câu theo ID — trả về dict hoặc none
#let qb-get(bank, id) = {
  let q = bank.at(id, default: none)
  if q == none { return none }
  (id: id, question: q)
}

// Lọc câu theo nhiều tiêu chí — tất cả tuỳ chọn
//
// Tham số:
//   type:       "tn"|"ds"|"tln"|"tl"|none
//   difficulty: "NB"|"TH"|"VD"|"VDC" hoặc array ("NB","TH")
//   tag:        chuỗi — câu có tag chứa chuỗi này (partial match)
//   tags:       array — câu phải có TẤT CẢ tags này (exact)
//   status:     "ready"|"draft"|"review"|none
//   source:     tên file nguồn (partial match)
//   ids:        array ID — ưu tiên chỉ lấy các câu này
//   exclude:    array ID — bỏ qua các câu này
//   limit:      số câu tối đa
//
// Trả về: array of (id, question) — dùng với render-selection()
#let qb-filter(
  bank,
  type: none,
  difficulty: none,
  tag: none,
  tags: (),
  status: none,
  source: none,
  ids: (),
  exclude: (),
  limit: none,
) = {
  let _ci(a, b) = lower(str(a)).contains(lower(str(b)))
  let _get(q, k, d) = if type(q) == dictionary { q.at(k, default: d) } else { d }
  let _all-tags(qtags, wanted) = {
    let ok = true
    for t in wanted { if not qtags.contains(t) { ok = false } }
    ok
  }

  let result = ()

  for (id, q) in bank {
    // Bỏ qua nếu trong exclude list
    if exclude.contains(id) { continue }

    // Nếu có ids cụ thể, chỉ lấy những ID đó
    if ids.len() > 0 and not ids.contains(id) { continue }

    // Lọc type
    if type != none {
      if not _ci(_get(q, "type", "tn"), type) { continue }
    }

    // Lọc difficulty (có thể là 1 giá trị hoặc array)
    if difficulty != none {
      let qd = _get(q, "difficulty", "")
      let diffs = if type(difficulty) == array { difficulty } else { (str(difficulty),) }
      let match = false
      for d in diffs { if str(qd) == str(d) { match = true } }
      if not match { continue }
    }

    // Lọc status
    if status != none {
      if _get(q, "status", "draft") != str(status) { continue }
    }

    // Lọc source (partial match)
    if source != none {
      if not _ci(_get(q, "source", ""), source) { continue }
    }

    // Lọc tag đơn (partial match)
    if tag != none {
      let qtags = _get(q, "tags", ())
      let found = false
      for t in qtags { if _ci(t, tag) { found = true } }
      if not found { continue }
    }

    // Lọc nhiều tags (phải có TẤT CẢ — exact match)
    if tags.len() > 0 {
      if not _all-tags(_get(q, "tags", ()), tags) { continue }
    }

    result.push((id: id, question: q))
    if limit != none and result.len() >= limit { break }
  }

  result
}

// Lấy danh sách ID từ kết quả qb-filter
#let qb-ids(filtered) = filtered.map(item => item.id)

// Lấy câu theo IDs có thứ tự — giữ đúng thứ tự ids
#let qb-pick(bank, ..picked-ids) = {
  let result = ()
  for id in picked-ids.pos() {
    let q = bank.at(id, default: none)
    if q != none { result.push((id: id, question: q)) }
  }
  result
}

// ── Thống kê nhanh ───────────────────────────────────────
#let qb-stat(bank) = {
  let total = 0
  let by-type = (:)
  let by-diff = (:)
  let by-status = (:)
  for (id, q) in bank {
    total += 1
    if type(q) == dictionary {
      let t = str(q.at("type", default: "tn"))
      let d = str(q.at("difficulty", default: "?"))
      let s = str(q.at("status", default: "draft"))
      by-type.insert(t, by-type.at(t, default: 0) + 1)
      by-diff.insert(d, by-diff.at(d, default: 0) + 1)
      by-status.insert(s, by-status.at(s, default: 0) + 1)
    }
  }
  (total: total, by-type: by-type, by-diff: by-diff, by-status: by-status)
}

// In thống kê đẹp ngay trong tài liệu
#let qb-print-stat(bank) = {
  let stat = qb-stat(bank)
  [
    *Tổng số câu:* #stat.total

    *Theo loại:*
    #for (k, v) in stat.by-type [- *#k*: #v câu
    ]

    *Theo mức độ:*
    #for (k, v) in stat.by-diff [- *#k*: #v câu
    ]

    *Theo trạng thái:*
    #for (k, v) in stat.by-status [- *#k*: #v câu
    ]
  ]
}