path = '/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ'
text_path = '/Users/admin/conictypst/scratch/new_problems_text.typ'

with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

with open(text_path, 'r', encoding='utf-8') as f:
    new_text = f.read()

start_marker = '= Đề Luyện Tổng Hợp'
start_idx = content.find(start_marker)
if start_idx == -1:
    print("Start marker not found")
    exit(1)

prob_start = content.find('#prob(', start_idx)
if prob_start == -1:
    print("prob_start not found")
    exit(1)

end_marker = '#pagebreak()\n\n// ══════════════════════════════════════════════════════════════\n// PHẦN III: BẢNG TỔNG HỢP CÔNG THỨC'
end_idx = content.find(end_marker)
if end_idx == -1:
    print("End marker not found")
    exit(1)

updated_content = content[:prob_start] + new_text + '\n' + content[end_idx:]

with open(path, 'w', encoding='utf-8') as f:
    f.write(updated_content)

print("Replacement successful!")
