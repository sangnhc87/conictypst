import re

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    content = f.read()

# 1. Update setcounter to just use the counter.
setcounter_pattern = r'#let setcounter\(env, start\) = \{[\s\S]*?none\s*\}\s*\}'
setcounter_repl = r'''#let setcounter(env, start) = {
  let current = if start > 0 { start - 1 } else { 0 }
  let name = if type(env) == str { lower(env) } else { env }
  if ("cau", "question", "tn", "ds", "tln", "tl").contains(name) {
    [#_q-cnt.update(current)]
  } else if ("part", "phan").contains(name) {
    [#_part-cnt.update(current)]
  } else {
    none
  }
}'''
content = re.sub(setcounter_pattern, setcounter_repl, content)

# 2. Update mcq, tf, tln to use the simple counter logic
def fix_func(func_name, content):
    # Find the top of the function
    pattern = r'(#let ' + func_name + r'\([\s\S]*?show-hyperlink: false,\s*\.\.args,\s*\)\s*=\s*\{\s*let hl_cnt = if mode == "dethi" \{ _hl-q-cnt \} else \{ _hl-sol-cnt \}\s*if show-hyperlink \{ hl_cnt.step\(\) \}\s*context\s*\{)\s*let loigiai = _resolve-loigiai\(loigiai, args\)\s*let q-state = _next-question-num\(num: num\)\s*let num = q-state\.num'
    
    repl = r'''#let ''' + func_name + r'''(
  \g<1>
  let loigiai = _resolve-loigiai(loigiai, args)
  let num_val = _q-cnt.get().first()
  let num = num_val'''
    
    # Wait, the `\g<1>` part doesn't work easily if I just want to replace the `context {` with `[ #updates #context { ]`.
    # Let's do it manually.
    pass

# Wait, `fix_func` using regex is messy here. Let's just string match and replace!
content = content.replace(
    '''  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  if show-hyperlink { hl_cnt.step() }
  context {
  let loigiai = _resolve-loigiai(loigiai, args)
  let q-state = _next-question-num(num: num)
  let num = q-state.num''',
    '''  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  [
    #if num != auto { _q-cnt.update(num - 1) }
    #_q-cnt.step()
    #_global-q-cnt.step()
    #counter("se-step").update(0)
    #if show-hyperlink { hl_cnt.step() }
    #context {
      let loigiai = _resolve-loigiai(loigiai, args)
      let num = _q-cnt.get().first()
      let q-id = _global-q-cnt.get().first()
'''
)

# And remove `#q-state.markers` from the output
content = content.replace('    #q-state.markers\n', '')

# Remove `_next-question-num` completely? I don't strictly have to remove it, but let's just make sure it's not used.
# Let's write the file.
with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.write(content)
