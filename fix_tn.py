import re

with open('/Users/admin/conictypst/bai_thu_hoach_chinh_tri_2026.typ', 'r') as f:
    content = f.read()

def replace_tn(match):
    q = match.group(1)
    opts = match.group(2).strip().split('],\n  [')
    opts = [o.strip() for o in opts]
    
    # Reconstruct opts without trailing/leading brackets from the split
    if opts:
        opts[0] = opts[0]
        opts[-1] = opts[-1]
    
    ans = match.group(3)
    
    ans_idx = ord(ans) - ord('A')
    
    new_opts = []
    for i, opt in enumerate(opts):
        # the split removes the ], [ in between, but the first one has [ and the last has ]
        if i == ans_idx:
            new_opts.append(f'True([{opt}])')
        else:
            new_opts.append(f'[{opt}]')
            
    opts_str = ",\n    ".join(new_opts)
    
    return f'#tn(\n  [{q}],\n  (\n    {opts_str}\n  )\n)'

# Pattern to match:
# #tn(
#   [Question],
#   [Opt A],
#   [Opt B],
#   [Opt C],
#   [Opt D],
#   ans: "B"
# )

pattern = re.compile(r'#tn\(\s*\[(.*?)\],\s*\[(.*?)\]\s*,\s*ans:\s*"([A-D])"\s*\)', re.DOTALL)
new_content = pattern.sub(replace_tn, content)

with open('/Users/admin/conictypst/bai_thu_hoach_chinh_tri_2026.typ', 'w') as f:
    f.write(new_content)
