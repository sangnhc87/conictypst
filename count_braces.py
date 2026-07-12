with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    lines = f.readlines()

def check_balance(start_idx, end_idx):
    stack = []
    pairs = {'}': '{', ']': '[', ')': '('}
    for i in range(start_idx, end_idx):
        line = lines[i]
        # Very simple check ignoring comments and strings!
        # Good enough for a rough estimate
        # Let's remove comments and strings first
        line = line.split('//')[0]
        # remove strings
        in_str = False
        new_line = ''
        for char in line:
            if char == '"': in_str = not in_str
            elif not in_str: new_line += char
        
        for col, char in enumerate(new_line):
            if char in '{[(':
                stack.append((char, i+1, col))
            elif char in '}])':
                if not stack:
                    print(f"Unmatched {char} at line {i+1}")
                else:
                    top, top_line, top_col = stack.pop()
                    if top != pairs[char]:
                        print(f"Mismatched {char} at line {i+1}, expected to close {top} from line {top_line}")
                        return
    if stack:
        print("Unclosed:")
        for char, line, col in stack:
            print(f"  {char} at line {line}")
    else:
        print("Perfectly balanced!")

print("Checking mcq:")
check_balance(686, 969)
