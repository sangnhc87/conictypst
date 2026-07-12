import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Add tracking-marker to sbd-box and made-box in genWasmTypst and genMathStandardTypst
# We will just insert it at the beginning of the block content.

sbd_pattern = r'#align\(center\)\[#text\(weight:\s*"bold",\s*size:\s*8pt\)\[SỐ BÁO DANH\]\]'
sbd_replacement = r'#place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]\n        ' + '#align(center)[#text(weight: "bold", size: 8pt)[SỐ BÁO DANH]]'
content = re.sub(sbd_pattern, sbd_replacement, content)

sbd_pattern2 = r'#align\(center\)\[#text\(weight:\s*"bold",\s*size:\s*8pt\)\[SBD\]\]'
sbd_replacement2 = r'#place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]\n        ' + '#align(center)[#text(weight: "bold", size: 8pt)[SBD]]'
content = re.sub(sbd_pattern2, sbd_replacement2, content)


made_pattern = r'#align\(center\)\[#text\(weight:\s*"bold",\s*size:\s*8pt\)\[MÃ ĐỀ THI\]\]'
made_replacement = r'#place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]\n        ' + '#align(center)[#text(weight: "bold", size: 8pt)[MÃ ĐỀ THI]]'
content = re.sub(made_pattern, made_replacement, content)

made_pattern2 = r'#align\(center\)\[#text\(weight:\s*"bold",\s*size:\s*8pt\)\[Mã đề\]\]'
made_replacement2 = r'#place(top + left, dx: -2pt, dy: -2pt)[#tracking-marker]\n        ' + '#align(center)[#text(weight: "bold", size: 8pt)[Mã đề]]'
content = re.sub(made_pattern2, made_replacement2, content)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
print("index.html patched with local anchors in SBD and MaDe.")
