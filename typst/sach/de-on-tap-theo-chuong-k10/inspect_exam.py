import sys, os

def find_blocks(text, func_name):
    # finds calls like #tn( ... ) or #ds( ... ) or #tln( ... )
    prefix = f"#{func_name}("
    pos = 0
    results = []
    while True:
        idx = text.find(prefix, pos)
        if idx == -1:
            break
        # find matching closing parenthesis
        start_paren = idx + len(prefix) - 1
        paren_depth = 0
        bracket_depth = 0
        brace_depth = 0
        end_paren = -1
        in_math = False
        in_str = False
        i = start_paren
        while i < len(text):
            ch = text[i]
            if ch == '\\' and i + 1 < len(text):
                i += 2
                continue
            if ch == '"' and not in_math:
                in_str = not in_str
            elif not in_str:
                if ch == '$':
                    in_math = not in_math
                elif not in_math:
                    if ch == '(':
                        paren_depth += 1
                    elif ch == ')':
                        paren_depth -= 1
                        if paren_depth == 0 and bracket_depth == 0:
                            end_paren = i
                            break
                    elif ch == '[':
                        bracket_depth += 1
                    elif ch == ']':
                        bracket_depth -= 1
                    elif ch == '{':
                        brace_depth += 1
                    elif ch == '}':
                        brace_depth -= 1
            i += 1
        
        if end_paren != -1:
            results.append(text[start_paren+1:end_paren].strip())
            pos = end_paren + 1
        else:
            break
    return results

def extract_bracket_content(text, start_idx):
    b_start = text.find('[', start_idx)
    if b_start == -1: return ""
    depth = 0
    in_math = False
    for j in range(b_start, len(text)):
        ch = text[j]
        if ch == '$':
            in_math = not in_math
        elif not in_math:
            if ch == '[': depth += 1
            elif ch == ']':
                depth -= 1
                if depth == 0:
                    return text[b_start+1:j].strip()
    return ""

def extract_bracket_content_with_end(text, start_idx):
    b_start = text.find('[', start_idx)
    if b_start == -1: return "", -1
    depth = 0
    in_math = False
    for j in range(b_start, len(text)):
        ch = text[j]
        if ch == '$':
            in_math = not in_math
        elif not in_math:
            if ch == '[': depth += 1
            elif ch == ']':
                depth -= 1
                if depth == 0:
                    return text[b_start+1:j].strip(), j
    return "", -1

def examine(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        txt = f.read()
    
    name = os.path.basename(filepath)
    print("="*75)
    print("EXAM:", name)
    print("="*75)

    # 1. TN
    tns = find_blocks(txt, "tn")
    print(f"Total TN: {len(tns)}")
    for i, raw in enumerate(tns, 1):
        q_txt = extract_bracket_content(raw, 0)
        
        # find True([...])
        is_true_idx = raw.find("True(")
        true_val = ""
        if is_true_idx != -1:
            true_val = extract_bracket_content(raw, is_true_idx)

        # find loigiai
        lg_idx = raw.find("loigiai:")
        lg_txt = ""
        if lg_idx != -1:
            lg_txt = extract_bracket_content(raw, lg_idx)

        print(f"TN {i:02d} | Key: [{true_val}]")
        print(f"      Q: {q_txt[:100]}...")
        # print first 150 chars of lg
        print(f"      LG: {lg_txt[:150].replace(chr(10), ' ')}...")
        print()

    # 2. DS
    dss = find_blocks(txt, "ds")
    print(f"Total DS: {len(dss)}")
    for i, raw in enumerate(dss, 1):
        q_txt = extract_bracket_content(raw, 0)
        
        # choices are in tuple (...)
        # find first '(' that starts the choices tuple after question
        q_bracket_start = raw.find('[')
        # skip question bracket block
        q_depth = 0
        in_m = False
        q_end = -1
        for j in range(q_bracket_start, len(raw)):
            if raw[j] == '$': in_m = not in_m
            elif not in_m:
                if raw[j] == '[': q_depth += 1
                elif raw[j] == ']':
                    q_depth -= 1
                    if q_depth == 0:
                        q_end = j
                        break
        
        choices_start = raw.find('(', q_end)
        # find matching paren ignoring content inside [...] and $...$
        p_depth = 0
        b_depth = 0
        in_m = False
        choices_end = -1
        for j in range(choices_start, len(raw)):
            ch = raw[j]
            if ch == '$':
                in_m = not in_m
            elif not in_m:
                if ch == '[': b_depth += 1
                elif ch == ']': b_depth -= 1
                elif b_depth == 0:
                    if ch == '(': p_depth += 1
                    elif ch == ')':
                        p_depth -= 1
                        if p_depth == 0:
                            choices_end = j
                            break
        choices_raw = raw[choices_start+1:choices_end] if choices_start != -1 and choices_end != -1 else ""
        
        # find loigiai
        lg_idx = raw.find("loigiai:", choices_end)
        lg_txt = ""
        if lg_idx != -1:
            lg_txt = extract_bracket_content(raw, lg_idx)

        print(f"DS {i:02d} (Câu {12+i}) | Q: {q_txt[:80]}...")
        # find each item
        pos_c = 0
        sub_items = []
        while pos_c < len(choices_raw):
            t_idx = choices_raw.find("True(", pos_c)
            b_idx = choices_raw.find("[", pos_c)
            if b_idx == -1 and t_idx == -1:
                break
            if t_idx != -1 and (b_idx == -1 or t_idx < b_idx):
                # True item
                val, end_b = extract_bracket_content_with_end(choices_raw, t_idx)
                sub_items.append(("DUNG", val))
                close_p = choices_raw.find(")", end_b)
                pos_c = (close_p + 1) if close_p != -1 else ((end_b + 1) if end_b != -1 else len(choices_raw))
            elif b_idx != -1:
                # False item
                val, end_b = extract_bracket_content_with_end(choices_raw, b_idx)
                sub_items.append(("SAI", val))
                pos_c = (end_b + 1) if end_b != -1 else len(choices_raw)

        for idx_sub, (status, val) in enumerate(sub_items):
            letter = chr(ord('a') + idx_sub)
            print(f"   {letter}) [{status}] {val[:70]}...")
        print(f"   LG: {lg_txt[:180].replace(chr(10), ' ')}...")
        print()

    # 3. TLN
    tlns = find_blocks(txt, "tln")
    print(f"Total TLN: {len(tlns)}")
    for i, raw in enumerate(tlns, 1):
        q_txt, q_end = extract_bracket_content_with_end(raw, 0)
        ans_txt, ans_end = extract_bracket_content_with_end(raw, q_end + 1)
        
        # loigiai
        lg_idx = raw.find("loigiai:", ans_end)
        lg_txt = extract_bracket_content(raw, lg_idx) if lg_idx != -1 else ""

        print(f"TLN {i:02d} (Câu {16+i}) | Key: [{ans_txt}]")
        print(f"       Q: {q_txt[:90]}...")
        print(f"       LG: {lg_txt[:150].replace(chr(10), ' ')}...")
        print()

if __name__ == "__main__":
    for p in sys.argv[1:]:
        examine(p)
