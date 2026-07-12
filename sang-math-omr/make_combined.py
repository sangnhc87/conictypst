with open('templates/ds-20-ngang.typ', 'r') as f:
    ds_content = f.read()

with open('templates/tln-10-ngang.typ', 'r') as f:
    tln_content = f.read()

# Extract TLN block from tln-10-ngang.typ
# It starts with #block(width:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"), radius:4pt, clip:true, [
#  #rect(width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN III – TỰ LUẬN NGẮN (Câu 1-10)]]])
start_str = '#block(width:100%, stroke:(paint:rgb("#666666"),thickness:0.8pt,dash:"dashed"), radius:4pt, clip:true, [\n  #rect(width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN III'
tln_idx = tln_content.find(start_str)

# Find the end of the tln block
# The tln block ends right before // ── TỰ LUẬN VIẾT TAY
end_str = '// ── TỰ LUẬN VIẾT TAY'
tln_end_idx = tln_content.find(end_str, tln_idx)

tln_block = tln_content[tln_idx:tln_end_idx]

# Now insert it into ds_content, right before // ── TỰ LUẬN VIẾT TAY
ds_end_idx = ds_content.find(end_str)

combined = ds_content[:ds_end_idx] + '#v(4pt)\n' + tln_block + ds_content[ds_end_idx:]

with open('templates/ds20-tln10-ngang.typ', 'w') as f:
    f.write(combined)

print("Combined successfully!")
