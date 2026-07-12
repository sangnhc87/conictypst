import re

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    content = f.read()

# Fix TLN
tln_target = r'''  box-radius: 4pt,
  ..args,
) = context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num'''

tln_repl = r'''  box-radius: 4pt,
  show-hyperlink: false,
  ..args,
) = {
  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  [
    #if num != auto { _q-cnt.update(num - 1) }
    #_q-cnt.step()
    #_global-q-cnt.step()
    #counter("se-step").update(0)
    #if show-hyperlink { hl_cnt.step() }
    #metadata("question") <se-q-marker>
    #context {
      let loigiai = _resolve-loigiai(loigiai, args)
      let num = _q-cnt.get().first()
      let q-id = _global-q-cnt.get().first()'''

if tln_target in content:
    content = content.replace(tln_target, tln_repl)
else:
    print("TLN not found")

# Fix TL
tl_target = r'''  box-radius: 4pt,
  show-hyperlink: false,
  ..args,
) = context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num'''

tl_repl = r'''  box-radius: 4pt,
  show-hyperlink: false,
  ..args,
) = {
  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  [
    #if num != auto { _q-cnt.update(num - 1) }
    #_q-cnt.step()
    #_global-q-cnt.step()
    #counter("se-step").update(0)
    #if show-hyperlink { hl_cnt.step() }
    #metadata("question") <se-q-marker>
    #context {
      let loigiai = _resolve-loigiai(loigiai, args)
      let num = _q-cnt.get().first()
      let q-id = _global-q-cnt.get().first()'''

if tl_target in content:
    content = content.replace(tl_target, tl_repl)
else:
    print("TL not found")

# Remove remaining q-state.markers that might be below
content = content.replace('    #q-state.markers\n', '')

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.write(content)

