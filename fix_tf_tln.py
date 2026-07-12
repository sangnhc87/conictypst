import re

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    content = f.read()

# For tf
tf_target = r'''  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  if show-hyperlink { hl_cnt.step() }
  context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num'''

tf_repl = r'''  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
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

if tf_target in content:
    content = content.replace(tf_target, tf_repl)
else:
    print("tf target not found!")
    
# For tln
tln_target = r'''  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  if show-hyperlink { hl_cnt.step() }
  context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num'''

if tln_target in content:
    content = content.replace(tln_target, tf_repl) # using same repl since it's identical
else:
    print("tln target not found!")
    
# Remove q-state.markers in tf and tln
content = content.replace('    #q-state.markers\n', '')

# Also we need to add `<se-q-marker>` to `mcq`!
mcq_target = r'''  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  [
    #if num != auto { _q-cnt.update(num - 1) }
    #_q-cnt.step()
    #_global-q-cnt.step()
    #counter("se-step").update(0)
    #if show-hyperlink { hl_cnt.step() }
    #context {'''
mcq_repl = r'''  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  [
    #if num != auto { _q-cnt.update(num - 1) }
    #_q-cnt.step()
    #_global-q-cnt.step()
    #counter("se-step").update(0)
    #if show-hyperlink { hl_cnt.step() }
    #metadata("question") <se-q-marker>
    #context {'''
content = content.replace(mcq_target, mcq_repl)

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.write(content)
