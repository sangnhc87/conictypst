// ═══════════════════════════════════════════════════════════
// STEXGV QUESTION BANK MODULE
// Typst-native question registry keyed by stable IDs
// ═══════════════════════════════════════════════════════════

#import "bank.typ": bank-filter, bank-lookup
#import "exam.typ": palette, tn, ds, tln, tl

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
    let keep = (ids.len() == 0 or ids.contains(item.id)) and not exclude-ids.contains(item.id) and _matches(item.type, type) and _matches(item.difficulty, difficulty) and _matches(item.status, status) and _matches(item.source, source) and _has-tags(item.tags, tags) and (query == none or _matches(item.id, query) or _matches(item.stem, query) or _matches(item.source, query) or _matches(item.tags.join(" "), query))

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