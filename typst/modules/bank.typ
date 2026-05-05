// ═══════════════════════════════════════════════════════════
// STEXGV BANK MODULE
// Lớp quản lý metadata ngân hàng câu hỏi từ bank.json
// Mặc định đọc mirror trong typst/ để compile an toàn với --root typst
// ═══════════════════════════════════════════════════════════

#let _segment(text) = {
  let value = if text == none { "" } else { str(text) }
  let pieces = value.split(": ")
  if pieces.len() >= 2 {
    (
      tag: pieces.first(),
      value: pieces.slice(1).join(": "),
    )
  } else {
    (
      tag: none,
      value: value,
    )
  }
}

#let _matches(value, expected) = {
  if expected == none {
    true
  } else {
    lower(str(value)).contains(lower(str(expected)))
  }
}

#let load-bank(path: "../bank.json") = {
  let raw = json(path)
  let entries = ()

  for (id, label) in raw {
    let parts = str(label).split(" | ")
    let chapter = _segment(parts.at(2, default: ""))
    let lesson = _segment(parts.at(3, default: ""))
    let form = _segment(parts.at(4, default: ""))

    entries.push((
      id: id,
      label: label,
      grade: parts.at(0, default: none),
      branch: parts.at(1, default: none),
      chapter: chapter.value,
      chapter_tag: chapter.tag,
      lesson: lesson.value,
      lesson_tag: lesson.tag,
      form: form.value,
      form_tag: form.tag,
    ))
  }

  entries
}

#let bank-field(entry, by: "chapter") = {
  if by == "grade" {
    entry.grade
  } else if by == "branch" {
    entry.branch
  } else if by == "chapter" {
    entry.chapter
  } else if by == "lesson" {
    entry.lesson
  } else if by == "form" or by == "topic" {
    entry.form
  } else {
    entry.label
  }
}

#let bank-filter(
  entries,
  grade: none,
  branch: none,
  chapter: none,
  lesson: none,
  form: none,
  query: none,
  ids: (),
) = {
  let results = ()

  for entry in entries {
    let keep = _matches(entry.grade, grade) and _matches(entry.branch, branch) and _matches(entry.chapter, chapter) and _matches(entry.lesson, lesson) and _matches(entry.form, form) and (ids.len() == 0 or ids.contains(entry.id)) and (query == none or _matches(entry.id, query) or _matches(entry.label, query))

    if keep {
      results.push(entry)
    }
  }

  results
}

#let bank-count(entries, by: "chapter") = {
  let rows = ()
  let seen = ()

  for entry in entries {
    let label = bank-field(entry, by: by)
    if not seen.contains(label) {
      seen.push(label)
      let total = 0
      for candidate in entries {
        if bank-field(candidate, by: by) == label {
          total += 1
        }
      }
      rows.push((label: label, count: total))
    }
  }

  rows
}

#let bank-lookup(entries, id) = {
  let found = none
  for entry in entries {
    if entry.id == id {
      found = entry
    }
  }
  found
}

#let bank-attach(questions, entries, id-field: "id") = {
  let linked = ()
  for item in questions {
    let id = item.at(id-field, default: none)
    linked.push((
      question: item,
      meta: if id == none { none } else { bank-lookup(entries, id) },
    ))
  }
  linked
}