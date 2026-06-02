import codecs

with codecs.open('CD-ToMau.typ.bak', 'r', encoding='utf-8') as f:
    old_text = f.read()

start_idx = old_text.find('// ─── Bảng màu chủ đề')
end_idx = old_text.find('// ─── Hộp lý thuyết')

if start_idx != -1 and end_idx != -1:
    missing_colors = old_text[start_idx:end_idx]
    
    with codecs.open('CD-ToMau.typ', 'r', encoding='utf-8') as f:
        new_text = f.read()
    
    insert_pos = new_text.find('// ─── Hộp lý thuyết')
    if insert_pos != -1:
        final_text = new_text[:insert_pos] + missing_colors + new_text[insert_pos:]
        
        with codecs.open('CD-ToMau.typ', 'w', encoding='utf-8') as f:
            f.write(final_text)
        print("Missing colors inserted.")
