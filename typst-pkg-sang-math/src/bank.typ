#import "core/validate.typ": validate-question

#let question-bank(..questions) = questions.pos()

#let bank-filter(bank, grade: none, topic: none, difficulty: none, kind: none, tags: ()) = {
  bank.filter(q => {
    let grade-ok = grade == none or q.at("grade", default: none) == grade
    let topic-ok = topic == none or q.at("topic", default: none) == topic
    let kind-ok = kind == none or q.at("kind", default: none) == kind
    let difficulty-ok = difficulty == none or (if type(difficulty) == array { difficulty.contains(q.at("difficulty", default: none)) } else { q.at("difficulty", default: none) == difficulty })
    let tags-ok = tags.all(tag => q.at("tags", default: ()).contains(tag))
    grade-ok and topic-ok and kind-ok and difficulty-ok and tags-ok
  })
}

// Park–Miller LCG; arithmetic stays in signed 64-bit range on Typst 0.14.
#let _next-seed(seed) = calc.rem(seed * 48271, 2147483647)

#let bank-select(bank, count: none, seed: 1) = {
  if type(seed) != int { panic("sang-math: bank-select seed must be an integer") }
  if count != none and (type(count) != int or count < 0 or count > bank.len()) {
    panic("sang-math: bank-select count must be between 0 and the bank size")
  }
  let n = if count == none { bank.len() } else { count }
  let state = calc.rem(calc.abs(seed), 2147483646) + 1
  let remaining = bank
  let selected = ()
  for _ in range(n) {
    state = _next-seed(state)
    let index = calc.rem(state, remaining.len())
    selected.push(remaining.at(index))
    remaining = remaining.enumerate().filter(((i, _)) => i != index).map(((_, q)) => q)
  }
  selected
}

#let bank-shuffle-choices(q, seed: 1) = {
  let _ = validate-question(q)
  let choices = q.choices
  if choices.len() == 0 { return q }
  let indexed = choices.enumerate().map(((i, item)) => (index: i + 1, choice: item))
  let shuffled = bank-select(indexed, seed: seed)
  let old-answer = q.at("answer", default: none)
  let new-answer = if type(old-answer) == dictionary and old-answer.at("kind", default: none) == "choice" {
    let matching = shuffled.enumerate().filter(((i, item)) => item.index == old-answer.value)
    if matching.len() > 0 { (..old-answer, value: matching.first().at(0) + 1) } else { old-answer }
  } else { old-answer }
  (..q, choices: shuffled.map(item => item.choice), answer: new-answer)
}
