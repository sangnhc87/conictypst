import re
import os

files_to_process = [
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de1.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de2.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de3.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de4.typ",
]

beamer_file = "typst/beamer/beamer-12-bai-2-gtln-gtnn-cua-ham-so.typ"

# First, append wrappers to the beamer file
wrappers = """
#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0)
  let options = pos.at(1)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (60%, 40%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0)
  let options = pos.at(1)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (60%, 40%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0)
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (60%, 40%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}

"""

with open(beamer_file, 'a', encoding='utf-8') as f:
    f.write(wrappers)

def extract_blocks(text, kw):
    blocks = []
    idx = 0
    while True:
        idx = text.find(kw + '(', idx)
        if idx == -1:
            break
        
        start = idx
        depth = 0
        in_str = False
        in_comment = False
        for i in range(idx + len(kw), len(text)):
            if text[i] == '"' and text[i-1] != '\\':
                in_str = not in_str
            if not in_str:
                if text[i] == '/' and text[i+1] == '/':
                    in_comment = True
                if text[i] == '\n':
                    in_comment = False
                
                if not in_comment:
                    if text[i] == '(':
                        depth += 1
                    elif text[i] == ')':
                        depth -= 1
                        if depth == 0:
                            blocks.append(text[start:i+1])
                            idx = i + 1
                            break
        else:
            break
    return blocks


for idx, file_path in enumerate(files_to_process):
    if not os.path.exists(file_path):
        continue
    
    de_name = f"Đề {idx+1}"
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # We need to change the function calls from #tn to #my-tn and insert de: "Đề X",
    
    tns = extract_blocks(content, "#tn")
    dss = extract_blocks(content, "#ds")
    tlns = extract_blocks(content, "#tln")
    
    out_content = f"\n// ==================== {de_name} ====================\n"
    
    for block in tns:
        new_block = block.replace("#tn(", f"#my-tn(de: \"{de_name}\", ", 1)
        out_content += new_block + "\n\n"
    
    for block in dss:
        new_block = block.replace("#ds(", f"#my-ds(de: \"{de_name}\", ", 1)
        out_content += new_block + "\n\n"
        
    for block in tlns:
        new_block = block.replace("#tln(", f"#my-tln(de: \"{de_name}\", ", 1)
        out_content += new_block + "\n\n"

    with open(beamer_file, 'a', encoding='utf-8') as f:
        f.write(out_content)

print("Done extracting and appending.")
