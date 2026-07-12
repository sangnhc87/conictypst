with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    content = f.read()

import re

target1 = r'''  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  if show-hyperlink { hl_cnt.step() }
  context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num'''

repl1 = r'''  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  [
    #if num != auto { _q-cnt.update(num - 1) }
    #_q-cnt.step()
    #_global-q-cnt.step()
    #counter("se-step").update(0)
    #if show-hyperlink { hl_cnt.step() }
    #context {
      let loigiai = _resolve-loigiai(loigiai, args)
      let num = _q-cnt.get().first()
      let q-id = _global-q-cnt.get().first()'''

if target1 in content:
    print("Found mcq/tf/tln!")
    content = content.replace(target1, repl1)
else:
    print("NOT FOUND mcq!")
    # Let's search using regex
    pattern = r'  let hl_cnt = if mode == "dethi" \{ _hl-q-cnt \} else \{ _hl-sol-cnt \}\s*if show-hyperlink \{ hl_cnt\.step\(\) \}\s*context \{\s*let loigiai = _resolve-loigiai\(loigiai, args\)\s*let q-state = _next-question-num\(num: num\)\s*let num = q-state\.num'
    if re.search(pattern, content):
        print("Found with regex!")
        content = re.sub(pattern, repl1, content)
    else:
        print("Still not found!")

# Remove q-state.markers
content = re.sub(r'\s*#q-state\.markers', '', content)

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.write(content)
