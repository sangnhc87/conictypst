import re

with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Let's find all #prob blocks.
# A #prob block starts with #prob( and ends with ) or a matching parenthesis.
# We can parse the parentheses matching to extract each #prob block.

probs = []
pattern = re.compile(r'#prob\(')
for match in pattern.finditer(content):
    start_idx = match.start()
    # Find matching closing parenthesis
    depth = 0
    in_bracket_depth = 0
    in_quote = False
    escape = False
    end_idx = -1
    for i in range(start_idx + 5, len(content)):
        char = content[i]
        if escape:
            escape = False
            continue
        if char == '\\':
            escape = True
            continue
        if char == '"':
            in_quote = not in_quote
            continue
        if in_quote:
            continue
        
        if char == '(':
            depth += 1
        elif char == ')':
            if depth == 0:
                end_idx = i
                break
            else:
                depth -= 1
        elif char == '[':
            in_bracket_depth += 1
        elif char == ']':
            in_bracket_depth -= 1
            
    if end_idx != -1:
        probs.append((start_idx, end_idx, content[start_idx:end_idx+1]))

print(f"Found {len(probs)} #prob blocks.")

# Let's inspect the first few lines of each to see the number, title/description and if they contain Generating Functions
for idx, (s, e, block) in enumerate(probs):
    # Extract number (first argument)
    args = []
    # Let's split by comma at top level
    depth = 0
    in_bracket = 0
    in_quote = False
    curr = ""
    for char in block[6:-1]:
        if char == '"':
            in_quote = not in_quote
            curr += char
        elif in_quote:
            curr += char
        elif char == '[':
            in_bracket += 1
            curr += char
        elif char == ']':
            in_bracket -= 1
            curr += char
        elif char == '(':
            depth += 1
            curr += char
        elif char == ')':
            depth -= 1
            curr += char
        elif char == ',' and depth == 0 and in_bracket == 0:
            args.append(curr.strip())
            curr = ""
        else:
            curr += char
    args.append(curr.strip())
    
    num = args[0] if len(args) > 0 else "Unknown"
    de_snippet = args[1][:60].replace("\n", " ") if len(args) > 1 else "Unknown"
    has_gf = "Hàm sinh" in block or "Generating" in block or "OGF" in block or "EGF" in block or "PGF" in block
    print(f"{idx+1}: Prob {num} | GF: {has_gf} | Snippet: {de_snippet}")
