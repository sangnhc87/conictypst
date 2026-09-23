import re

def replacer(match):
    q = match.group(1)
    o_a = match.group(2)
    o_b = match.group(3)
    o_c = match.group(4)
    o_d = match.group(5)
    ans = match.group(6)
    
    opts = [o_a, o_b, o_c, o_d]
    ans_idx = -1
    if ans == 'A': ans_idx = 0
    elif ans == 'B': ans_idx = 1
    elif ans == 'C': ans_idx = 2
    elif ans == 'D': ans_idx = 3
    else:
        if ans in opts:
            ans_idx = opts.index(ans)
        else:
            ans_idx = 0
            
    res = f"#tn([{q}],\n  (\n"
    for idx, o in enumerate(opts):
        if idx == ans_idx:
            res += f"    True([{o}]),\n"
        else:
            res += f"    [{o}],\n"
    res += "  ),\n  loigiai:"
    return res

for i in range(1, 6):
    path = f"typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-{i}.typ"
    with open(path, "r") as f:
        text = f.read()
    
    new_text = re.sub(
        r'#tn\(\s*\[(.*?)\],\s*\[(.*?)\],\s*\[(.*?)\],\s*\[(.*?)\],\s*\[(.*?)\],\s*\[(.*?)\],\s*loigiai:',
        replacer,
        text,
        flags=re.DOTALL
    )
    with open(path, "w") as f:
        f.write(new_text)
