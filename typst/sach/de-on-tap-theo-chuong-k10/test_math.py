import re

def convert_math(inner):
    def balance_paren_args(s, func_name):
        start_search = 0
        while True:
            idx = s.find(func_name + '(', start_search)
            if idx == -1: return None, -1, -1
            if idx > 0 and s[idx-1].isalpha():
                start_search = idx + 1
                continue
            break
        start = idx + len(func_name)
        depth = 0
        end = -1
        for i in range(start, len(s)):
            if s[i] == '(': depth += 1
            elif s[i] == ')':
                depth -= 1
                if depth == 0:
                    end = i
                    break
        if end == -1: return None, -1, -1
        args_str = s[start+1:end]
        args, cur, d = [], [], 0
        for c in args_str:
            if c == '(': d += 1
            elif c == ')': d -= 1
            elif c == ',' and d == 0:
                args.append(''.join(cur).strip())
                cur = []
                continue
            cur.append(c)
        if cur: args.append(''.join(cur).strip())
        return args, idx, end

    while True:
        changed = False

        for fn in ['vec', 'arrow', 'vect', 'overrightarrow']:
            args, start, end = balance_paren_args(inner, fn)
            if args is not None and len(args) >= 1:
                inner = inner[:start] + r'\overrightarrow{' + args[0] + '}' + inner[end+1:]
                changed = True; break
        if changed: continue
        break

    word_syms = [
        (r'\bunion\b', r'\cup'), (r'\bcup\b', r'\cup'),
        (r'\bsect\b', r'\cap'), (r'\bcap\b', r'\cap'),
    ]
    for pat, repl in word_syms:
        inner = re.sub(pat, lambda m, r=repl: r, inner)
    
    return inner

print(convert_math("A cap B"))
print(convert_math("overline(A)"))
print(convert_math("A union B"))
