import re
import os

filepath = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Custom parser to extract tln calls
idx = 0
tln_calls = []
while True:
    pos = content.find("#tln(", idx)
    if pos == -1:
        break
    
    stack = 0
    in_string = False
    escape = False
    end_pos = -1
    for i in range(pos + 4, len(content)):
        char = content[i]
        if in_string:
            if escape:
                escape = False
            elif char == '\\':
                escape = True
            elif char == '"':
                in_string = False
        else:
            if char == '"':
                in_string = True
            elif char == '[':
                stack += 1
            elif char == ']':
                stack -= 1
            elif char == '(':
                stack += 1
            elif char == ')':
                stack -= 1
                if stack == 0:
                    end_pos = i
                    break
    if end_pos != -1:
        tln_calls.append((pos, end_pos))
        idx = end_pos + 1
    else:
        idx = pos + 1

def split_args(arg_str):
    args = []
    current = []
    stack = 0
    in_string = False
    escape = False
    for char in arg_str:
        if in_string:
            if escape:
                escape = False
            elif char == '\\':
                escape = True
            elif char == '"':
                in_string = False
            current.append(char)
        else:
            if char == '"':
                in_string = True
                current.append(char)
            elif char in ('(', '[', '{'):
                stack += 1
                current.append(char)
            elif char in (')', ']', '}'):
                stack -= 1
                current.append(char)
            elif char == ',' and stack == 0:
                args.append("".join(current).strip())
                current = []
            else:
                current.append(char)
    if current:
        args.append("".join(current).strip())
    return args

# Let's define the manual answer keys for Q1 to Q45
answer_keys = {
    1: "12",
    2: "60",
    3: "13",
    4: "775",
    5: "49875",
    6: "134",
    7: "a) 59280; b) 9880",
    8: "Đpcm",
    9: "126",
    10: "240",
    11: "14400",
    12: "48",
    13: "720",
    14: "20",
    15: "17",
    16: "36",
    17: "560",
    18: "220",
    19: "10",
    20: "6",
    21: "10",
    22: "7",
    23: "150",
    24: "90",
    25: "35",
    26: "135",
    27: "$frac(n(n-1), 2)$",
    28: "36",
    29: "7200",
    30: "96",
    31: "Đpcm",
    32: "992",
    33: "$frac(1, n+1) C_(2n)^n$",
    34: "Đpcm",
    35: "Đpcm",
    36: "Đpcm",
    37: "8",
    38: "$F_(n+2)$",
    39: "$2^n + 2 (-1)^n$",
    40: "84",
    41: "$n 2^(n-1)$",
    42: "$frac(2^(n+1) - 1, n+1)$",
    43: "$frac(5, 16)$",
    44: "0.68256",
    45: "$2/3$"
}

def extract_box_content(text, box_name):
    pos = text.find(box_name + "[")
    if pos == -1:
        return None
    start = pos + len(box_name) + 1
    stack = 1
    for i in range(start, len(text)):
        if text[i] == '[':
            stack += 1
        elif text[i] == ']':
            stack -= 1
            if stack == 0:
                return text[start:i].strip()
    return None

def parse_segment(seg_text, method_num):
    # Match *Cách X: Description* (e.g. *Cách 1: Sử dụng...*)
    match_colon = re.match(r'^\s*\*Cách\s*\d+\s*:\s*(.*?)\*[\s:]*', seg_text)
    if match_colon:
        desc = match_colon.group(1)
        content = seg_text[match_colon.end():].strip()
        return f"Cách {method_num} — {desc}", content

    # Match *Cách X (Description)*
    match = re.match(r'^\s*\*Cách\s*\d+\s*(?:\((.*?)\))?[\s:]*\*[\s:]*', seg_text)
    if match:
        desc = match.group(1)
        content = seg_text[match.end():].strip()
        if desc:
            title = f"Cách {method_num} — {desc}"
        else:
            title = f"Cách {method_num}"
        return title, content
    
    # Match Lời giải chi tiết
    if seg_text.startswith("Lời giải chi tiết"):
        return "Lời giải chi tiết", seg_text[len("Lời giải chi tiết"):].strip()
    
    # Match Cách X if it has a custom title already
    match_custom = re.match(r'^\s*Cách\s*\d+\s*—\s*(.*)', seg_text)
    if match_custom:
        return seg_text.split("\n")[0].strip(), "\n".join(seg_text.split("\n")[1:]).strip()
        
    # Match Giải / Giải chi tiết
    match_giai = re.match(r'^\s*\*(?:Giải|Giải chi tiết):\*[\s:]*', seg_text)
    if match_giai:
        content = seg_text[match_giai.end():].strip()
        return "Lời giải chi tiết", content
        
    return f"Cách {method_num}", seg_text.strip()

print(f"Modifying {len(tln_calls)} #tln calls...")

new_content = list(content)
offset = 0

for idx, (start, end) in enumerate(tln_calls):
    inner = content[start+5:end].strip()
    args = split_args(inner)
    named = {}
    positional = []
    for a in args:
        if ":" in a and not a.startswith("[") and not a.startswith('"'):
            k, v = a.split(":", 1)
            named[k.strip()] = v.strip()
        else:
            positional.append(a)
            
    level_str = positional[0].strip('"')
    q_block = positional[1] if len(positional) > 1 else "[]"
    ans_block = positional[2] if len(positional) > 2 else "[]"
    loigiai_block = named.get("loigiai", "[]")
    
    # Extract tags
    tags = []
    if "Dễ" in level_str or "★" in level_str:
        tags.append("Dễ")
    if "Trung bình" in level_str or "★★" in level_str:
        tags.append("Trung bình")
    if "Khó" in level_str or "★★★" in level_str:
        tags.append("Khó")
        
    # Get actual question text from q_block
    if q_block.startswith("[") and q_block.endswith("]"):
        q_text = q_block[1:-1].strip()
    else:
        q_text = q_block.strip()
        
    # Check if the solution is already split in loigiai_block
    lg_text = ""
    if loigiai_block.startswith("[") and loigiai_block.endswith("]"):
        lg_text = loigiai_block[1:-1].strip()
    else:
        lg_text = loigiai_block.strip()
        
    has_pre_converted_boxes = "#cach1-box" in lg_text or "#cach-box" in lg_text
    
    segments = []
    actual_q = q_text
    
    if has_pre_converted_boxes:
        # Extract from existing boxes
        c1 = extract_box_content(lg_text, "#cach1-box") or extract_box_content(lg_text, '#cach-box(title: "Cách 1') or extract_box_content(lg_text, '#cach-box(title: "Lời giải chi tiết')
        c2 = extract_box_content(lg_text, "#cach2-box") or extract_box_content(lg_text, '#cach-box(title: "Cách 2')
        c3 = extract_box_content(lg_text, "#cach3-box") or extract_box_content(lg_text, '#cach-box(title: "Cách 3')
        
        if c1:
            # Let's see if it has a custom title inside the box
            segments.append(c1)
        if c2:
            segments.append(c2)
        if c3:
            segments.append(c3)
            
        if not segments:
            # Fallback if extraction failed
            segments.append(lg_text)
    else:
        # Check if the question text contains solution markers, we split them
        sol_marker_pattern = re.compile(
            r'(?:\*Giải:\*|\*Giải chi tiết:\*|\*Cách 1.*?\*|🔵\s*Cách 1|🔴\s*Cách 1|\*Giải\*:)',
            re.IGNORECASE
        )
        
        m = sol_marker_pattern.search(q_text)
        if m:
            # Split!
            actual_q = q_text[:m.start()].strip()
            sol_text = q_text[m.start():].strip()
        else:
            actual_q = q_text
            sol_text = lg_text
            
        # Extract the solution segments
        c1_pos = sol_text.find("*Cách 1")
        c2_pos = sol_text.find("*Cách 2")
        c3_pos = sol_text.find("*Cách 3")
        
        if c1_pos != -1:
            if c2_pos != -1:
                segments.append(sol_text[c1_pos:c2_pos].strip())
                if c3_pos != -1:
                    segments.append(sol_text[c2_pos:c3_pos].strip())
                    segments.append(sol_text[c3_pos:].strip())
                else:
                    segments.append(sol_text[c2_pos:].strip())
            else:
                segments.append(sol_text[c1_pos:].strip())
        else:
            segments.append(sol_text)
            
    # Rebuild solution boxes
    lg_boxes = []
    if len(segments) > 1 or (len(segments) == 1 and (segments[0].startswith("*Cách 1") or has_pre_converted_boxes)):
        lg_boxes.append("    #ppgiai[\n      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.\n    ]")
        colors = ["col-blue", "col-violet", "col-pink"]
        icons = ["🔵", "🟣", "🔴"]
        for s_idx, seg in enumerate(segments):
            title, s_content = parse_segment(seg, s_idx + 1)
            color = colors[s_idx % len(colors)]
            icon = icons[s_idx % len(icons)]
            lg_boxes.append(f"""    #cach-box(title: "{title}", color: {color}, icon: "{icon}")[
      {s_content}
    ]""")
    elif segments and segments[0].strip():
        title, s_content = parse_segment(segments[0], 1)
        lg_boxes.append(f"""    #ppgiai[
      Xem hướng dẫn giải chi tiết dưới đây để nắm được phương pháp thực hiện.
    ]
    #cach-box(title: "{title}", color: col-blue, icon: "🔵")[
      {s_content}
    ]""")
    
    # Get correct answer
    ans_val = ""
    q_num = idx + 1
    if q_num in answer_keys:
        ans_val = answer_keys[q_num]
    else:
        # Use existing answer block if it has one (like for calls 46-60)
        if ans_block.startswith("[") and ans_block.endswith("]"):
            ans_val = ans_block[1:-1].strip()
        else:
            ans_val = ans_block.strip()
            
    # Rebuild tln call
    if tags:
        tags_str = ", ".join(f'"{t}"' for t in tags)
        tags_arg = f"({tags_str},)"
    else:
        tags_arg = "()"
    replacement = f"""#tln(
  tags: {tags_arg},
  [
    {actual_q}
  ],
  [{ans_val}],
  loigiai: [
{"\n\n".join(lg_boxes)}
  ]
)"""

    # Apply replacement
    t_start = start + offset
    t_end = end + 1 + offset
    orig_len = t_end - t_start
    rep_len = len(replacement)
    
    new_content[t_start:t_end] = list(replacement)
    offset += rep_len - orig_len

fixed_content = "".join(new_content)

# Add the new cach-box definition near the other box definitions
# Let's search for eg-box or note-box definition
target_def = """#let eg-box(title: "🎯 Ví Dụ Trực Quan", body) = block("""
if target_def in fixed_content:
    new_def = """#let cach-box(title: "Hướng giải", color: col-blue, icon: "🔵", body) = block(
  fill: color.lighten(94%),
  stroke: (left: 4pt + color, rest: 0.5pt + color.lighten(70%)),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: color, weight: "bold", size: 10.5pt)[#icon #title]
  #v(0.3em)
  #body
]

#let eg-box(title: "🎯 Ví Dụ Trực Quan", body) = block("""
    fixed_content = fixed_content.replace(target_def, new_def)

# Write back
with open(filepath, "w", encoding="utf-8") as f:
    f.write(fixed_content)

print("Modification complete!")
