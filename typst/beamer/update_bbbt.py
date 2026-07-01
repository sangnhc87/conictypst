import re

file_path = "/Users/admin/conictypst/typst/beamer/beamer-12-bai-2-gtln-gtnn-cua-ham-so.typ"

with open(file_path, "r", encoding="utf-8") as f:
    text = f.read()

def process_file(text):
    out = []
    i = 0
    while i < len(text):
        idx = text.find("#my-bbbt", i)
        if idx == -1:
            out.append(text[i:])
            break
        
        # append everything up to "#my-bbbt"
        out.append(text[i:idx])
        
        # find the opening parenthesis
        idx_open = text.find("(", idx)
        if idx_open == -1:
            out.append(text[idx:])
            break
            
        # find the matching closing parenthesis
        count = 0
        idx_close = -1
        for j in range(idx_open, len(text)):
            if text[j] == "(":
                count += 1
            elif text[j] == ")":
                count -= 1
                if count == 0:
                    idx_close = j
                    break
        
        if idx_close == -1:
            out.append(text[idx:])
            break
            
        bbbt_content = text[idx:idx_close+1]
        
        if "w1:" not in bbbt_content:
            # Insert the parameters just before the closing parenthesis
            # Usually the closing parenthesis is on a new line or at the end
            # Let's see what's before the closing parenthesis
            content_before_close = text[idx_open+1:idx_close]
            
            # check if it ends with a comma
            last_char_idx = -1
            for k in range(len(content_before_close)-1, -1, -1):
                if not content_before_close[k].isspace():
                    last_char_idx = k
                    break
            
            needs_comma = False
            if last_char_idx != -1 and content_before_close[last_char_idx] != ",":
                needs_comma = True
            
            params = ",\n        w1: 3,\n        w2: 19,\n        h1: 1.5,\n        h2: 1.5,\n        h3: 4\n      " if needs_comma else "\n        w1: 3,\n        w2: 19,\n        h1: 1.5,\n        h2: 1.5,\n        h3: 4\n      "
            
            new_bbbt_content = text[idx:idx_close] + params + ")"
            out.append(new_bbbt_content)
        else:
            out.append(bbbt_content)
            
        i = idx_close + 1
        
    return "".join(out)

new_text = process_file(text)

with open(file_path, "w", encoding="utf-8") as f:
    f.write(new_text)

print("Updated #my-bbbt calls.")
