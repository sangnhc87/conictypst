import codecs

with codecs.open('CD-ToMau.typ.bak', 'r', encoding='utf-8') as f:
    old_text = f.read()

# Extract box definitions from old_text
# from line starting with "// ─── Hộp lý thuyết" up to "// ═══════════════════════════════════════════════\n// TRANG BÌA"
start_idx = old_text.find('// ─── Hộp lý thuyết')
end_idx = old_text.find('// ═══════════════════════════════════════════════\n// TRANG BÌA')

if start_idx != -1 and end_idx != -1:
    missing_boxes = old_text[start_idx:end_idx]
    
    with codecs.open('CD-ToMau.typ', 'r', encoding='utf-8') as f:
        new_text = f.read()
    
    # Insert missing boxes before the page cover
    insert_pos = new_text.find('// TRANG BÌA')
    if insert_pos != -1:
        final_text = new_text[:insert_pos] + missing_boxes + new_text[insert_pos:]
        
        with codecs.open('CD-ToMau.typ', 'w', encoding='utf-8') as f:
            f.write(final_text)
        print("Missing boxes inserted.")
