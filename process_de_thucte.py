import re

with open('typst/sach/DECUONG12-HK1/chuong-01/bai04-de-thucte.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Find the 3 sections using #exam-part
parts = text.split('#exam-part')
header = parts[0]
tn_part = '#exam-part' + parts[1]
ds_part = '#exam-part' + parts[2]
tln_part = '#exam-part' + parts[3]

def process_section(sec_text, prefix, count):
    questions = sec_text.split('// ─── CÂU ')
    out = [questions[0]]
    added = 0
    for i in range(1, len(questions)):
        if added >= count:
            break
        q = questions[i]
        
        # We need to process the loigiai block.
        # Find everything between loigiai: [ and the closing ]
        loigiai_match = re.search(r'loigiai:\s*\[(.*)\]\n\)', q, re.DOTALL)
        if loigiai_match:
            loigiai_content = loigiai_match.group(1).strip()
            
            # Split by empty lines or some logical steps
            lines = [line.strip() for line in loigiai_content.split('\n') if line.strip()]
            new_loigiai = "\n"
            for line in lines:
                new_loigiai += f"    #step[{line}]\n"
            new_loigiai += "  "
            
            q = q[:loigiai_match.start(1)] + "\n" + new_loigiai + "]" + q[loigiai_match.end(1):]
        else:
            # Maybe the closing parenthesis is different
            pass
            
        out.append(f'// ─── CÂU {added + 1} ───\n' + q.split(' ───\n', 1)[-1])
        added += 1
    return ''.join(out)

new_tn = process_section(tn_part, 'TN', 10)
new_ds = process_section(ds_part, 'DS', 4)
new_tln = process_section(tln_part, 'TLN', 6)

# Fix section headers to remove exact counts or keep them dynamic
new_tn = re.sub(r'\(20 câu\)', '(10 câu)', new_tn)
new_ds = re.sub(r'\(10 câu\)', '(4 câu)', new_ds)
new_tln = re.sub(r'\(10 câu\)', '(6 câu)', new_tln)

final_text = header + new_tn + new_ds + new_tln

# Fix LaTeX formatting issues
final_text = final_text.replace(r'\mathbb{R}', 'RR')
final_text = final_text.replace(r'\mathbb{Z}', 'ZZ')
final_text = final_text.replace(r'\Delta', 'Delta')
final_text = final_text.replace(r'\implies', '=>')
final_text = final_text.replace(r'\Leftrightarrow', '<=>')
final_text = final_text.replace(r'\neq', '!=')
final_text = final_text.replace(r'\infty', 'oo')
final_text = final_text.replace(r'\to', '->')
final_text = final_text.replace(r'\sqrt', 'sqrt')
final_text = final_text.replace(r'\pm', 'plus.minus')
final_text = final_text.replace(r'\forall', 'forall')
final_text = final_text.replace(r'\setminus', '\\')
final_text = final_text.replace(r'\cup', 'union')
final_text = final_text.replace(r'\in', 'in')
final_text = final_text.replace('y_{CT}', 'y_"CT"')
final_text = final_text.replace('y_{CĐ}', 'y_"CĐ"')
final_text = final_text.replace('C_{tb}', 'C_"tb"')
final_text = final_text.replace('C\'_{tb}', 'C\'_"tb"')


with open('typst/sach/DECUONG12-HK1/chuong-01/bai04-de-thucte.typ', 'w', encoding='utf-8') as f:
    f.write(final_text)

