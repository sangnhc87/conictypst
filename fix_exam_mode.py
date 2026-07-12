import re

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    content = f.read()

target = r'''#let exam-mode(mode: "dethi", accent: palette.accent) = (
  tn: tn.with(mode: mode, accent: accent),
  ds: ds.with(mode: mode, accent: accent),
  tln: tln.with(mode: mode, accent: accent),
  tl: tl.with(mode: mode, accent: accent),
  mcq: mcq.with(mode: mode, accent: accent),
  tf: tf.with(mode: mode, accent: accent),
  short: short.with(mode: mode, accent: accent),
)'''

repl = r'''#let exam-mode(
  mode: "dethi",
  accent: palette.accent,
  opt-style: "plain",
  opt-label-color: auto,
  q-label-style: "plain",
  show-tags: true,
  draft: false,
  draft-width: 30%,
  draft-lines: 5,
  boxed: false,
  box-fill: white,
  box-stroke: 0.6pt + palette.border,
  show-hyperlink: false,
) = (
  tn: tn.with(mode: mode, accent: accent, opt-style: opt-style, opt-label-color: opt-label-color, q-label-style: q-label-style, show-tags: show-tags, draft: draft, draft-width: draft-width, draft-lines: draft-lines, boxed: boxed, box-fill: box-fill, box-stroke: box-stroke, show-hyperlink: show-hyperlink),
  ds: ds.with(mode: mode, accent: accent, q-label-style: q-label-style, show-tags: show-tags, draft: draft, draft-width: draft-width, draft-lines: draft-lines, boxed: boxed, box-fill: box-fill, box-stroke: box-stroke, show-hyperlink: show-hyperlink),
  tln: tln.with(mode: mode, accent: accent, q-label-style: q-label-style, show-tags: show-tags, draft: draft, draft-width: draft-width, draft-lines: draft-lines, boxed: boxed, box-fill: box-fill, box-stroke: box-stroke, show-hyperlink: show-hyperlink),
  tl: tl.with(mode: mode, accent: accent, q-label-style: q-label-style, draft: draft, draft-width: draft-width, draft-lines: draft-lines, boxed: boxed, box-fill: box-fill, box-stroke: box-stroke, show-hyperlink: show-hyperlink),
  mcq: mcq.with(mode: mode, accent: accent, opt-style: opt-style, opt-label-color: opt-label-color, q-label-style: q-label-style, show-tags: show-tags, draft: draft, draft-width: draft-width, draft-lines: draft-lines, boxed: boxed, box-fill: box-fill, box-stroke: box-stroke, show-hyperlink: show-hyperlink),
  tf: tf.with(mode: mode, accent: accent, q-label-style: q-label-style, show-tags: show-tags, draft: draft, draft-width: draft-width, draft-lines: draft-lines, boxed: boxed, box-fill: box-fill, box-stroke: box-stroke, show-hyperlink: show-hyperlink),
  short: short.with(mode: mode, accent: accent, q-label-style: q-label-style, show-tags: show-tags, draft: draft, draft-width: draft-width, draft-lines: draft-lines, boxed: boxed, box-fill: box-fill, box-stroke: box-stroke, show-hyperlink: show-hyperlink),
)'''

if target in content:
    content = content.replace(target, repl)
else:
    print("NOT FOUND EXAM MODE")

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.write(content)
