import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update tfQs loop for column major if A5
old_tf_loop = """            if (tf > 0) {
                let tfQs = [];
                for (let i = 1; i <= tf; i++) {"""
new_tf_loop = """            if (tf > 0) {
                let tfQs = [];
                let cols = (isA5 && tf === 20) ? 4 : Math.min(5, tf);
                let sortedIs = [];
                let rows = Math.ceil(tf / cols);
                for (let r = 0; r < rows; r++) {
                    for (let c = 0; c < cols; c++) {
                        let i = c * rows + r + 1;
                        if (i <= tf) sortedIs.push(i);
                    }
                }
                for (let i of sortedIs) {"""
content = content.replace(old_tf_loop, new_tf_loop)

# 2. Update tfCols in grid
old_tf_cols = """                const tfCols = Math.min(5, tf);
                tfSection = `
#v(4pt)
#block(width:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"), radius:4pt, clip:true, [
  #rect(width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN II – ĐÚNG / SAI (${tf} câu, mỗi câu 4 ý a/b/c/d)]]])
  #block(
    inset: (top: 8pt, bottom: 8pt, left: 10pt, right: 10pt),
    grid(
      columns: (1fr,) * ${tfCols},
      row-gutter: 12pt,"""
new_tf_cols = """                const tfCols = (isA5 && tf === 20) ? 4 : Math.min(5, tf);
                tfSection = `
#v(4pt)
#block(width:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"), radius:4pt, clip:true, [
  #rect(width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN II – ĐÚNG / SAI (${tf} câu, mỗi câu 4 ý a/b/c/d)]]])
  #block(
    inset: (top: 8pt, bottom: 8pt, left: 10pt, right: 10pt),
    grid(
      columns: (1fr,) * ${tfCols},
      row-gutter: ${isA5 ? '4pt' : '12pt'},"""
content = content.replace(old_tf_cols, new_tf_cols)

# 3. Update TLN gutter just in case
old_tln_gutter = """      columns: (1fr,) * ${cnt},
      ${tlnQs.join(', ')}"""
new_tln_gutter = """      columns: (1fr,) * ${cnt},
      row-gutter: ${isA5 ? '4pt' : '12pt'},
      ${tlnQs.join(', ')}"""
content = content.replace(old_tln_gutter, new_tln_gutter)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
