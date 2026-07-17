function typstString(value) {
  return JSON.stringify(value)
}

export function createCollectorWrapper({ sourceImport, questionFactory, rendererImport }) {
  return `#set page(width: 18cm, height: auto, margin: 6mm)

#import ${typstString(rendererImport)}: tn, ds, tln, tl
#let base-tn = tn
#let base-ds = ds
#let base-tln = tln
#let base-tl = tl
#import ${typstString(sourceImport)}: ${questionFactory}

#let conic-output = sys.inputs.at("conic-output", default: "metadata")
#let conic-nodes = state("conic-publisher-nodes", ())
#let add-node(node) = conic-nodes.update(nodes => nodes + (node,))
#let as-array(value) = if value == none { () } else if type(value) == array { value } else { (value,) }

#let collect-tn(stem, options, mode: "dethi", ..args) = add-node((
  kind: "question", type: "tn", stem: stem, payload: options, args: args,
))
#let collect-ds(stem, statements, mode: "dethi", ..args) = add-node((
  kind: "question", type: "ds", stem: stem, payload: statements, args: args,
))
#let collect-tln(stem, answer, mode: "dethi", ..args) = add-node((
  kind: "question", type: "tln", stem: stem, payload: answer, args: args,
))
#let collect-tl(stem, mode: "dethi", ..args) = add-node((
  kind: "question", type: "tl", stem: stem, payload: none, args: args,
))
#let collect-part(title, ..args) = add-node((kind: "part", title: title, args: args))

#place(hide(${questionFactory}(
  tn: collect-tn,
  ds: collect-ds,
  tln: collect-tln,
  tl: collect-tl,
  exam-part: collect-part,
)))

#let emit(value) = [#metadata(value) <conic-export-node>]
#let normalized-options(options, named) = {
  let explicit = as-array(named.at("correct", default: ()))
  options.enumerate().map(((index, option)) => {
    let dictionary = type(option) == dictionary
    (
      id: if dictionary { option.at("id", default: "o" + str(index + 1)) } else { "o" + str(index + 1) },
      source-index: index + 1,
      is-correct: if dictionary { option.at("correct", default: false) } else { explicit.contains(index + 1) },
    )
  })
}
#let normalized-statements(statements) = statements.enumerate().map(((index, statement)) => (
  id: if type(statement) == dictionary { statement.at("id", default: "s" + str(index + 1)) } else { "s" + str(index + 1) },
  source-index: index + 1,
  is-correct: type(statement) == dictionary and statement.at("correct", default: false),
))

#let metadata-node(node, position, part-index) = {
  let named = node.args.named()
  let points = named.at("points", default: if node.type == "tn" { 0.25 } else if node.type == "ds" { 1 } else if node.type == "tln" { 0.5 } else { 1 })
  let solution = named.at("loigiai", default: named.at("solution", default: none))
  let common = (
    kind: "question",
    position: position,
    part-index: part-index,
    type: node.type,
    source-id: named.at("id", default: none),
    points: points,
    tags: named.at("tags", default: ()),
    difficulty: named.at("difficulty", default: none),
    stem: node.stem,
    has-solution: solution != none,
  )
  if node.type == "tn" {
    (..common, options: normalized-options(node.payload, named))
  } else if node.type == "ds" {
    (..common, statements: normalized-statements(node.payload))
  } else if node.type == "tln" {
    (..common,
      answer-display: node.payload,
      answer-value: named.at("answer-value", default: none),
      accepted-answers: named.at("accepted-answers", default: none),
      tolerance: named.at("tolerance", default: 0),
    )
  } else {
    (..common, rubric: named.at("rubric", default: ()))
  }
}

#let render-question(node, mode) = {
  if node.type == "tn" {
    base-tn(node.stem, node.payload, mode: mode, ..node.args)
  } else if node.type == "ds" {
    base-ds(node.stem, node.payload, mode: mode, ..node.args)
  } else if node.type == "tln" {
    base-tln(node.stem, node.payload, mode: mode, ..node.args)
  } else {
    base-tl(node.stem, mode: mode, ..node.args)
  }
}

#context {
  let nodes = conic-nodes.get()
  if conic-output == "metadata" {
    let position = 0
    let part-index = 0
    for node in nodes {
      if node.kind == "part" {
        part-index += 1
        emit((kind: "part", part-index: part-index, title: node.title, count: node.args.named().at("count", default: none)))
      } else {
        position += 1
        emit(metadata-node(node, position, part-index))
      }
    }
  } else {
    let questions = nodes.filter(node => node.kind == "question")
    for (index, node) in questions.enumerate() {
      if index > 0 { pagebreak() }
      render-question(node, if conic-output == "review" { "loigiai" } else { "dethi" })
    }
  }
}`
}
