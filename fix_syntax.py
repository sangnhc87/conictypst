import re

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    content = f.read()

# We know mcq ends around line 969. tf ends around 1144. tln ends around 1318. tl ends around 1445.
# Let's find the closing brace of each function and add a `]` before the last `}`.
# Wait, if `mcq` ends with `}` at indentation 0, the `context` block also ends with `}` at some indentation?
# Actually, the original function looked like:
# #let mcq(...) = {
#   let hl_cnt = ...
#   context {
#     ...
#   }
# }
# Oh! So there are TWO closing braces at the end!
# One for `context {`, one for `#let mcq(...) = {`!
# Let's check the end of `mcq`!
