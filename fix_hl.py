import re

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    content = f.read()

def fix_func(func_name, content):
    # Find the start of the function definition
    # e.g. #let mcq(... ) = context {
    pattern = r'(#let ' + func_name + r'\([\s\S]*?show-hyperlink: false,\s*\.\.args,\s*\)\s*=\s*)context\s*\{'
    
    def repl(m):
        return m.group(1) + r'''{
  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  [
    #if show-hyperlink { hl_cnt.step() }
    #context {
'''
    content = re.sub(pattern, repl, content)
    
    # Replace the `_should-hl` block inside the function
    hl_block_pattern = r'let _should-hl = show-hyperlink\s*let _hl-id = none\s*let _hl-upd = \[\]\s*if _should-hl \{\s*if mode == "dethi" \{\s*let r = _hl-next\(_hl-q-cnt\)\s*_hl-id = r\.id\s*_hl-upd = r\.upd\s*\} else if mode == "loigiai" \{\s*let r = _hl-next\(_hl-sol-cnt\)\s*_hl-id = r\.id\s*_hl-upd = r\.upd\s*\}\s*\}'
    
    hl_block_repl = r'''let _should-hl = show-hyperlink
    let _hl-id = if _should-hl { hl_cnt.get().first() } else { none }
    let _hl-upd = []'''
    
    content = re.sub(hl_block_pattern, hl_block_repl, content)
    
    # We also need to add a closing `]` to match the opening `[` after hl_cnt.step()
    # BUT finding the end of the function is hard. Wait, is the whole `context` returning a block?
    # Yes, it ends with `}`. So we replace the closing `}` with `} ]`
    # Let's not use regex for the end bracket. It's safer to just inject `[` and `]` inside the function text?
    # Actually, we don't strictly need `[` and `]`. 
    # `#if show-hyperlink { hl_cnt.step() }` and `#context { ... }` can just be written as:
    # {
    #   if show-hyperlink { hl_cnt.step() }
    #   context { ... }
    # }
    # Let's verify if Typst allows this! Yes, returning multiple things from `{}` block implicitly joins them.
    return content

# Wait, if we use implicit joining in `{ }`:
# #let mcq(...) = {
#   let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
#   if show-hyperlink { hl_cnt.step() }
#   context {
#     ...
#   }
# }
# This is perfectly valid Typst code!

def fix_func_clean(func_name, content):
    pattern = r'(#let ' + func_name + r'\([\s\S]*?show-hyperlink: false,\s*\.\.args,\s*\)\s*=\s*)context\s*\{'
    
    def repl(m):
        return m.group(1) + r'''{
  let hl_cnt = if mode == "dethi" { _hl-q-cnt } else { _hl-sol-cnt }
  if show-hyperlink { hl_cnt.step() }
  context {'''
    content = re.sub(pattern, repl, content)
    
    hl_block_pattern = r'let _should-hl = show-hyperlink\s*let _hl-id = none\s*let _hl-upd = \[\]\s*if _should-hl \{\s*if mode == "dethi" \{\s*let r = _hl-next\(_hl-q-cnt\)\s*_hl-id = r\.id\s*_hl-upd = r\.upd\s*\} else if mode == "loigiai" \{\s*let r = _hl-next\(_hl-sol-cnt\)\s*_hl-id = r\.id\s*_hl-upd = r\.upd\s*\}\s*\}'
    
    hl_block_repl = r'''let _should-hl = show-hyperlink
    let _hl-id = if _should-hl { hl_cnt.get().first() } else { none }
    let _hl-upd = none'''
    
    content = re.sub(hl_block_pattern, hl_block_repl, content)
    
    return content

content = fix_func_clean('mcq', content)
content = fix_func_clean('tf', content)
content = fix_func_clean('tln', content)

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.write(content)

