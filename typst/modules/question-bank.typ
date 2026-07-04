// ═══════════════════════════════════════════════════════════
// STEXGV QUESTION BANK MODULE
// Typst-native question registry keyed by stable IDs
// ═══════════════════════════════════════════════════════════

#import "bank.typ": bank-filter, bank-lookup
#import "exam.typ": ds, palette, tl, tln, tn

#let _as-array(value) = {
  if value == none {
    ()
  } else if type(value) == array {
    value
  } else {
    (value,)
  }
}

#let _matches(value, expected) = {
  if expected == none {
    true
  } else {
    lower(str(value)).contains(lower(str(expected)))
  }
}

#let _matches-any(value, expected) = {
  if expected == none {
    true
  } else {
    let ok = false
    for item in _as-array(expected) {
      if _matches(value, item) {
        ok = true
      }
    }
    ok
  }
}

#let _normalize-statement(statement) = {
  if type(statement) == dictionary {
    (
      body: statement.at("body", default: statement.at("text", default: "")),
      correct: statement.at("correct", default: false),
      note: statement.at("note", default: none),
    )
  } else {
    (
      body: statement,
      correct: false,
      note: none,
    )
  }
}

#let _has-tags(entry-tags, expected-tags) = {
  let wanted = _as-array(expected-tags)
  if wanted.len() == 0 {
    true
  } else {
    let keep = true
    let actual = _as-array(entry-tags)
    for tag in wanted {
      if not actual.contains(tag) {
        keep = false
      }
    }
    keep
  }
}

#let _normalize-question(item, fallback-id: none) = {
  let statements = ()
  for statement in _as-array(item.at("statements", default: ())) {
    statements.push(_normalize-statement(statement))
  }

  (
    id: item.at("id", default: fallback-id),
    type: lower(str(item.at("type", default: "tn"))),
    stem: item.at("stem", default: ""),
    options: _as-array(item.at("options", default: ())),
    statements: statements,
    correct: item.at("correct", default: none),
    cols: item.at("cols", default: none),
    answer: item.at("answer", default: none),
    solution: item.at("solution", default: item.at("loigiai", default: none)),
    tags: _as-array(item.at("tags", default: ())),
    difficulty: item.at("difficulty", default: none),
    status: item.at("status", default: "draft"),
    source: item.at("source", default: none),
    points: item.at("points", default: none),
    note: item.at("note", default: none),
  )
}

#let ds-item(body, correct: false, note: none) = (
  body: body,
  correct: correct,
  note: note,
)

#let question-tn(
  stem,
  options,
  correct: 1,
  cols: none,
  solution: none,
  tags: (),
  difficulty: none,
  status: "draft",
  source: none,
  points: none,
  note: none,
  id: none,
) = (
  id: id,
  type: "tn",
  stem: stem,
  options: _as-array(options),
  correct: correct,
  cols: cols,
  solution: solution,
  tags: _as-array(tags),
  difficulty: difficulty,
  status: status,
  source: source,
  points: points,
  note: note,
)

#let question-ds(
  stem,
  statements,
  solution: none,
  tags: (),
  difficulty: none,
  status: "draft",
  source: none,
  points: none,
  note: none,
  id: none,
) = (
  id: id,
  type: "ds",
  stem: stem,
  statements: _as-array(statements),
  solution: solution,
  tags: _as-array(tags),
  difficulty: difficulty,
  status: status,
  source: source,
  points: points,
  note: note,
)

#let question-tln(
  stem,
  answer,
  solution: none,
  tags: (),
  difficulty: none,
  status: "draft",
  source: none,
  points: none,
  note: none,
  id: none,
) = (
  id: id,
  type: "tln",
  stem: stem,
  answer: answer,
  solution: solution,
  tags: _as-array(tags),
  difficulty: difficulty,
  status: status,
  source: source,
  points: points,
  note: note,
)

#let question-tl(
  stem,
  solution: none,
  tags: (),
  difficulty: none,
  status: "draft",
  source: none,
  points: none,
  note: none,
  id: none,
) = (
  id: id,
  type: "tl",
  stem: stem,
  solution: solution,
  tags: _as-array(tags),
  difficulty: difficulty,
  status: status,
  source: source,
  points: points,
  note: note,
)

#let question-list(registry) = {
  let questions = ()

  if type(registry) == dictionary {
    for (id, item) in registry {
      questions.push(_normalize-question(item, fallback-id: id))
    }
  } else if type(registry) == array {
    for item in registry {
      questions.push(_normalize-question(item))
    }
  }

  questions
}

#let question-lookup(registry, id) = {
  let found = none
  for item in question-list(registry) {
    if item.id == id {
      found = item
    }
  }
  found
}

#let question-filter(
  registry,
  ids: (),
  exclude-ids: (),
  type: none,
  difficulty: none,
  status: none,
  source: none,
  tags: (),
  query: none,
) = {
  let questions = ()

  for item in question-list(registry) {
    let keep = (
      (ids.len() == 0 or ids.contains(item.id))
        and not exclude-ids.contains(item.id)
        and _matches-any(item.type, type)
        and _matches-any(item.difficulty, difficulty)
        and _matches-any(item.status, status)
        and _matches-any(item.source, source)
        and _has-tags(item.tags, tags)
        and (
          query == none
            or _matches(item.id, query)
            or _matches(item.stem, query)
            or _matches(item.source, query)
            or _matches(item.tags.join(" "), query)
        )
    )

    if keep {
      questions.push(item)
    }
  }

  questions
}

#let question-missing(entries, registry) = {
  let missing = ()
  for entry in entries {
    if question-lookup(registry, entry.id) == none {
      missing.push(entry)
    }
  }
  missing
}

#let question-orphans(entries, registry) = {
  let orphans = ()
  for item in question-list(registry) {
    if bank-lookup(entries, item.id) == none {
      orphans.push(item)
    }
  }
  orphans
}

#let question-select(
  entries,
  registry,
  grade: none,
  branch: none,
  chapter: none,
  lesson: none,
  form: none,
  ids: (),
  type: none,
  difficulty: none,
  status: none,
  source: none,
  tags: (),
  query: none,
  limit: auto,
) = {
  let filtered-meta = bank-filter(
    entries,
    grade: grade,
    branch: branch,
    chapter: chapter,
    lesson: lesson,
    form: form,
    query: query,
    ids: ids,
  )
  let filtered-questions = question-filter(
    registry,
    ids: filtered-meta.map(entry => entry.id),
    type: type,
    difficulty: difficulty,
    status: status,
    source: source,
    tags: tags,
    query: query,
  )
  let selected = ()

  for entry in filtered-meta {
    let question = question-lookup(filtered-questions, entry.id)
    if question != none and (limit == auto or selected.len() < limit) {
      selected.push((
        id: entry.id,
        meta: entry,
        question: question,
      ))
    }
  }

  selected
}

#let _correct-indices(value) = {
  if value == none {
    ()
  } else if type(value) == array {
    value
  } else {
    (value,)
  }
}

#let render-question(
  item,
  mode: "dethi",
  accent: palette.accent,
  num: auto,
  prefix: "Câu",
  show-id: false,
) = {
  let data = if item.at("question", default: none) == none {
    _normalize-question(item)
  } else {
    _normalize-question(item.question, fallback-id: item.id)
  }
  let solution = if mode == "dethi" { none } else { data.solution }
  let kind = lower(str(data.type))

  [
    #metadata((kind: "question-bank", id: data.id, type: kind)) <question-bank-item>
    #if show-id {
      text(size: 9pt, fill: palette.muted)[ID: #data.id]
      v(0.2em)
    }
    #if ("tn", "mcq").contains(kind) {
      tn(
        data.stem,
        data.options,
        correct: _correct-indices(data.correct),
        cols: if data.cols != none { data.cols } else { 0 },
        loigiai: solution,
        mode: mode,
        accent: accent,
        num: num,
        prefix: prefix,
      )
    } else if ("ds", "tf").contains(kind) {
      ds(
        data.stem,
        data.statements,
        loigiai: solution,
        mode: mode,
        accent: accent,
        num: num,
        prefix: prefix,
      )
    } else if ("tln", "short").contains(kind) {
      tln(
        data.stem,
        if data.answer != none { data.answer } else { data.correct },
        loigiai: solution,
        mode: mode,
        accent: accent,
        num: num,
        prefix: prefix,
      )
    } else {
      tl(
        data.stem,
        loigiai: solution,
        mode: mode,
        accent: accent,
        num: num,
        prefix: prefix,
      )
    }
  ]
}

#let render-selection(items, ..args) = [
  #for item in items {
    render-question(item, ..args)
  }
]

// ═══════════════════════════════════════════════════════════
// STEXGV TYPST EXAM BUILDER
// Seeded mixing + matrix slot selection, inspired by stexgv.web.app
// but fully Typst-native and keyed by the same stable question IDs.
// ═══════════════════════════════════════════════════════════

#let qb-lcg(seed) = {
  calc.rem(seed * 1664525 + 1013904223, 4294967296)
}

#let qb-shuffle(items, seed: 2026) = {
  let out = ()
  let source = items
  let current-seed = seed

  while source.len() > 0 {
    current-seed = qb-lcg(current-seed)
    let idx = calc.rem(current-seed, source.len())
    out.push(source.remove(idx))
  }

  out
}

#let _question-id(item) = {
  if type(item) == dictionary and item.at("id", default: none) != none {
    item.id
  } else if type(item) == dictionary and item.at("question", default: none) != none {
    item.at("id", default: item.question.at("id", default: none))
  } else {
    none
  }
}

#let _as-plan-item(item, slot: none, spec: none, relaxed: "exact") = {
  if type(item) == dictionary and item.at("question", default: none) != none {
    (
      ..item,
      id: item.at("id", default: item.question.at("id", default: none)),
      slot: slot,
      spec: spec,
      relaxed: relaxed,
    )
  } else {
    let q = _normalize-question(item)
    (
      id: q.id,
      question: q,
      meta: none,
      slot: slot,
      spec: spec,
      relaxed: relaxed,
    )
  }
}

#let _without-used(items, used-ids) = {
  let kept = ()
  for item in items {
    let id = _question-id(item)
    if id == none or not used-ids.contains(id) {
      kept.push(item)
    }
  }
  kept
}

#let exam-slot(
  slot,
  label: none,
  type: none,
  difficulty: none,
  tags: (),
  grade: none,
  branch: none,
  chapter: none,
  lesson: none,
  form: none,
  source: none,
  status: auto,
  ids: (),
  query: none,
  count: 1,
) = (
  slot: slot,
  label: label,
  type: type,
  difficulty: difficulty,
  tags: _as-array(tags),
  grade: grade,
  branch: branch,
  chapter: chapter,
  lesson: lesson,
  form: form,
  source: source,
  status: status,
  ids: _as-array(ids),
  query: query,
  count: count,
)

#let _slot-status(spec, default-status) = {
  let value = spec.at("status", default: auto)
  if value == auto { default-status } else { value }
}

#let _uses-meta(spec) = {
  (
    spec.at("grade", default: none) != none
      or spec.at("branch", default: none) != none
      or spec.at("chapter", default: none) != none
      or spec.at("lesson", default: none) != none
      or spec.at("form", default: none) != none
  )
}

#let _registry-candidates(registry, spec, status: "ready", used-ids: ()) = {
  _without-used(
    question-filter(
      registry,
      ids: spec.at("ids", default: ()),
      type: spec.at("type", default: none),
      difficulty: spec.at("difficulty", default: none),
      status: _slot-status(spec, status),
      source: spec.at("source", default: none),
      tags: spec.at("tags", default: ()),
      query: spec.at("query", default: none),
    ),
    used-ids,
  )
}

#let _meta-candidates(entries, registry, spec, status: "ready", used-ids: ()) = {
  _without-used(
    question-select(
      entries,
      registry,
      grade: spec.at("grade", default: none),
      branch: spec.at("branch", default: none),
      chapter: spec.at("chapter", default: none),
      lesson: spec.at("lesson", default: none),
      form: spec.at("form", default: none),
      ids: spec.at("ids", default: ()),
      type: spec.at("type", default: none),
      difficulty: spec.at("difficulty", default: none),
      status: _slot-status(spec, status),
      source: spec.at("source", default: none),
      tags: spec.at("tags", default: ()),
      query: spec.at("query", default: none),
      limit: auto,
    ),
    used-ids,
  )
}

#let _candidates(entries, registry, spec, status: "ready", used-ids: (), strict: false) = {
  let exact = if entries != none and _uses-meta(spec) {
    _meta-candidates(entries, registry, spec, status: status, used-ids: used-ids)
  } else {
    _registry-candidates(registry, spec, status: status, used-ids: used-ids)
  }

  if exact.len() > 0 or strict {
    return (items: exact, relaxed: "exact")
  }

  let relaxed-spec = (..spec, difficulty: none, tags: ())
  let relaxed = if entries != none and _uses-meta(spec) {
    _meta-candidates(entries, registry, relaxed-spec, status: status, used-ids: used-ids)
  } else {
    _registry-candidates(registry, relaxed-spec, status: status, used-ids: used-ids)
  }

  if relaxed.len() > 0 {
    return (items: relaxed, relaxed: "relaxed-difficulty-tags")
  }

  let global-spec = (
    slot: spec.at("slot", default: none),
    label: spec.at("label", default: none),
    type: spec.at("type", default: none),
    difficulty: none,
    tags: (),
    source: none,
    status: spec.at("status", default: auto),
    ids: (),
    query: none,
  )

  (
    items: _registry-candidates(registry, global-spec, status: status, used-ids: used-ids),
    relaxed: "global-type-fallback",
  )
}

#let build-exam-plan(
  registry,
  matrix,
  entries: none,
  seed: 2026,
  status: "ready",
  strict: false,
  allow-duplicates: false,
) = {
  let plan = ()
  let used = ()
  let order = 0

  for raw-spec in matrix {
    let spec = if type(raw-spec) == dictionary { raw-spec } else { exam-slot(raw-spec) }
    let count = spec.at("count", default: 1)
    for local-index in range(count) {
      let slot = spec.at("slot", default: order + 1)
      let used-for-slot = if allow-duplicates { () } else { used }
      let picked = _candidates(entries, registry, spec, status: status, used-ids: used-for-slot, strict: strict)
      let shuffled = qb-shuffle(picked.items, seed: seed + (slot + 1) * 1009 + order * 9173 + local-index * 37)

      if shuffled.len() == 0 {
        plan.push((
          id: none,
          question: none,
          meta: none,
          slot: slot,
          spec: spec,
          relaxed: "missing",
          missing: true,
        ))
      } else {
        let item = _as-plan-item(shuffled.first(), slot: slot, spec: spec, relaxed: picked.relaxed)
        plan.push(item)
        if item.id != none and not used.contains(item.id) {
          used.push(item.id)
        }
      }
      order += 1
    }
  }

  plan
}

#let _correct-list(q) = _correct-indices(q.correct)

#let _shuffle-tn-question(question, seed) = {
  let q = _normalize-question(question)
  let paired = ()
  let corrects = _correct-list(q)
  for (i, option) in q.options.enumerate() {
    let body = if type(option) == dictionary { option.body } else { option }
    let ok = if type(option) == dictionary {
      option.at("correct", default: false)
    } else {
      corrects.contains(i + 1)
    }
    paired.push((body: body, correct: ok))
  }

  let shuffled = qb-shuffle(paired, seed: seed)
  let new-options = ()
  let new-correct = ()
  for (i, item) in shuffled.enumerate() {
    new-options.push(item.body)
    if item.correct {
      new-correct.push(i + 1)
    }
  }

  (..q, options: new-options, correct: new-correct)
}

#let _shuffle-ds-question(question, seed) = {
  let q = _normalize-question(question)
  (..q, statements: qb-shuffle(q.statements, seed: seed))
}

#let prepare-exam-item(
  item,
  seed: 2026,
  shuffle-options: true,
  shuffle-statements: false,
) = {
  if item.at("missing", default: false) {
    return item
  }

  let q = _normalize-question(item.question, fallback-id: item.id)
  let kind = lower(str(q.type))
  let prepared = if shuffle-options and ("tn", "mcq").contains(kind) {
    _shuffle-tn-question(q, seed)
  } else if shuffle-statements and ("ds", "tf").contains(kind) {
    _shuffle-ds-question(q, seed)
  } else {
    q
  }

  (..item, question: prepared)
}

#let prepare-exam-plan(
  plan,
  seed: 2026,
  shuffle-options: true,
  shuffle-statements: false,
) = {
  let prepared = ()
  for (i, item) in plan.enumerate() {
    prepared.push(prepare-exam-item(
      item,
      seed: seed + (item.at("slot", default: i + 1) + 1) * 7919 + i * 101,
      shuffle-options: shuffle-options,
      shuffle-statements: shuffle-statements,
    ))
  }
  prepared
}

#let render-missing-slot(item) = block(
  width: 100%,
  fill: rgb("#fff7ed"),
  stroke: (left: 3pt + rgb("#ea580c")),
  inset: (x: 10pt, y: 8pt),
  radius: 4pt,
)[
  #text(weight: "bold", fill: rgb("#c2410c"))[Thiếu câu cho slot #item.slot.]
  #if item.spec.at("label", default: none) != none { [ #item.spec.label] }
  \
  Không tìm thấy câu phù hợp với bộ lọc hiện tại. Hãy bổ sung câu vào registry, nới `difficulty/tags`, hoặc bật `strict: false`.
]

#let render-exam-plan(
  plan,
  mode: "dethi",
  seed: 2026,
  shuffle-options: true,
  shuffle-statements: false,
  show-id: false,
  accent: palette.accent,
  prefix: "Câu",
) = {
  let prepared = prepare-exam-plan(
    plan,
    seed: seed,
    shuffle-options: shuffle-options,
    shuffle-statements: shuffle-statements,
  )

  [
    #for item in prepared {
      if item.at("missing", default: false) {
        render-missing-slot(item)
      } else {
        render-question(item, mode: mode, show-id: show-id, accent: accent, prefix: prefix)
      }
    }
  ]
}

#let _answer-of-question(question) = {
  let q = _normalize-question(question)
  let kind = lower(str(q.type))
  let labels = ("A", "B", "C", "D", "E", "F")

  if ("tn", "mcq").contains(kind) {
    let ans = ()
    for i in _correct-list(q) {
      ans.push(labels.at(i - 1, default: str(i)))
    }
    ans.join(", ")
  } else if ("ds", "tf").contains(kind) {
    q.statements.map(s => if s.correct { "Đ" } else { "S" }).join("")
  } else if ("tln", "short").contains(kind) {
    q.answer
  } else {
    "Tự luận"
  }
}

#let answer-key(
  plan,
  seed: 2026,
  shuffle-options: true,
  shuffle-statements: false,
) = {
  let prepared = prepare-exam-plan(
    plan,
    seed: seed,
    shuffle-options: shuffle-options,
    shuffle-statements: shuffle-statements,
  )
  let rows = ()
  for (i, item) in prepared.enumerate() {
    if not item.at("missing", default: false) {
      rows.push((
        no: i + 1,
        slot: item.at("slot", default: i + 1),
        id: item.id,
        type: item.question.type,
        answer: _answer-of-question(item.question),
      ))
    }
  }
  rows
}

#let render-answer-key(
  plan,
  seed: 2026,
  shuffle-options: true,
  shuffle-statements: false,
  title: [Bảng đáp án],
) = {
  let rows = answer-key(
    plan,
    seed: seed,
    shuffle-options: shuffle-options,
    shuffle-statements: shuffle-statements,
  )

  [
    #text(weight: "bold")[#title]
    #v(0.4em)
    #table(
      columns: (auto, auto, 1fr, auto, auto),
      stroke: 0.45pt + palette.border,
      align: (center, center, left, center, center),
      table.header(
        table.cell(fill: palette.accent, inset: 5pt)[#text(fill: white, weight: "bold")[STT]],
        table.cell(fill: palette.accent, inset: 5pt)[#text(fill: white, weight: "bold")[Slot]],
        table.cell(fill: palette.accent, inset: 5pt)[#text(fill: white, weight: "bold")[ID]],
        table.cell(fill: palette.accent, inset: 5pt)[#text(fill: white, weight: "bold")[Loại]],
        table.cell(fill: palette.accent, inset: 5pt)[#text(fill: white, weight: "bold")[Đáp án]],
      ),
      ..rows.map(row => (
        table.cell(inset: 5pt)[#row.no],
        table.cell(inset: 5pt)[#row.slot],
        table.cell(inset: 5pt)[#text(font: "Courier New", size: 9pt)[#row.id]],
        table.cell(inset: 5pt)[#upper(row.type)],
        table.cell(inset: 5pt)[#row.answer],
      )).flatten(),
    )
  ]
}

#let render-exam-versions(
  registry,
  matrix,
  entries: none,
  codes: ("101", "102"),
  seed: 2026,
  status: "ready",
  strict: false,
  allow-duplicates: false,
  mode: "dethi",
  shuffle-options: true,
  shuffle-statements: false,
  show-id: false,
  render-wrapper: none,
) = {
  for (i, code) in codes.enumerate() {
    let plan = build-exam-plan(
      registry,
      matrix,
      entries: entries,
      seed: seed + i * 100003,
      status: status,
      strict: strict,
      allow-duplicates: allow-duplicates,
    )
    let body = render-exam-plan(
      plan,
      mode: mode,
      seed: seed + i * 100003,
      shuffle-options: shuffle-options,
      shuffle-statements: shuffle-statements,
      show-id: show-id,
    )

    if render-wrapper == none {
      body
      pagebreak(weak: true)
      render-answer-key(
        plan,
        seed: seed + i * 100003,
        shuffle-options: shuffle-options,
        shuffle-statements: shuffle-statements,
        title: [Bảng đáp án mã #code],
      )
    } else {
      render-wrapper(code, body, plan)
    }

    if i < codes.len() - 1 {
      pagebreak()
    }
  }
}

#let thpt-2025-matrix = (
  exam-slot(1,  label: [Hàm số — đơn điệu],        type: "tn",  tags: ("ham-so",), difficulty: ("NB", "TH")),
  exam-slot(2,  label: [Hàm số — cực trị],         type: "tn",  tags: ("ham-so",), difficulty: ("NB", "TH")),
  exam-slot(3,  label: [GTLN / GTNN],              type: "tn",  tags: ("gtln-gtnn",), difficulty: ("TH", "VD")),
  exam-slot(4,  label: [Đồ thị / tiệm cận],        type: "tn",  tags: ("tiem-can",), difficulty: ("NB", "TH")),
  exam-slot(5,  label: [Mũ — logarit],             type: "tn",  tags: ("mu-logarit", "logarit"), difficulty: ("NB", "TH")),
  exam-slot(6,  label: [Mũ — logarit nâng cao],    type: "tn",  tags: ("mu-logarit",), difficulty: ("TH", "VD")),
  exam-slot(7,  label: [Hình học không gian],      type: "tn",  tags: ("hinh-hoc-khong-gian",), difficulty: ("NB", "TH")),
  exam-slot(8,  label: [Thể tích khối],            type: "tn",  tags: ("the-tich",), difficulty: ("TH", "VD")),
  exam-slot(9,  label: [Oxyz],                     type: "tn",  tags: ("oxyz",), difficulty: ("NB", "TH")),
  exam-slot(10, label: [Nguyên hàm / tích phân],   type: "tn",  tags: ("tich-phan", "nguyen-ham"), difficulty: ("NB", "TH")),
  exam-slot(11, label: [Tổng hợp],                 type: "tn",  difficulty: ("TH", "VD")),
  exam-slot(12, label: [Xác suất / thống kê],      type: "tn",  tags: ("xac-suat", "thong-ke"), difficulty: ("NB", "TH")),
  exam-slot(13, label: [Đúng sai — Hình học],      type: "ds",  tags: ("hinh-hoc", "oxyz"), difficulty: ("TH", "VD")),
  exam-slot(14, label: [Đúng sai — Giải tích],     type: "ds",  tags: ("ham-so", "tich-phan"), difficulty: ("TH", "VD")),
  exam-slot(15, label: [Đúng sai — Đại số],        type: "ds",  difficulty: ("TH", "VD")),
  exam-slot(16, label: [Đúng sai — Tổng hợp],      type: "ds",  difficulty: ("VD", "VDC")),
  exam-slot(17, label: [TLN — Hàm số],             type: "tln", tags: ("ham-so",), difficulty: ("TH", "VD")),
  exam-slot(18, label: [TLN — Mũ logarit],         type: "tln", tags: ("mu-logarit", "logarit"), difficulty: ("TH", "VD")),
  exam-slot(19, label: [TLN — Hình học],           type: "tln", tags: ("hinh-hoc", "oxyz"), difficulty: ("TH", "VD")),
  exam-slot(20, label: [TLN — Tích phân],          type: "tln", tags: ("tich-phan",), difficulty: ("TH", "VD")),
  exam-slot(21, label: [TLN — Tổng hợp],           type: "tln", difficulty: ("VD", "VDC")),
  exam-slot(22, label: [TLN — Xác suất],           type: "tln", tags: ("xac-suat",), difficulty: ("TH", "VD")),
)
