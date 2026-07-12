import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Add dropdown options to grade and gen tabs
grade_opt = '<option value="ds-12">12 Câu Đúng/Sai (A4)</option>'
if 'value="ds-20-ngang"' not in content:
    content = content.replace(grade_opt, grade_opt + '\n          <option value="ds-20-ngang">20 Câu Đúng/Sai (A5 Ngang)</option>\n          <option value="tln-10-ngang">10 Câu Trả lời ngắn (A5 Ngang)</option>')

# 2. Add mapping logic in generateSheet
mapping_old = """            if (selectedTemplateType === 'ds-12') {
                return { mcq: 0, tf: 12, tln: 0, paper: 'a4' };
            }"""
mapping_new = """            if (selectedTemplateType === 'ds-12') {
                return { mcq: 0, tf: 12, tln: 0, paper: 'a4' };
            }
            if (selectedTemplateType === 'ds-20-ngang') {
                return { mcq: 0, tf: 20, tln: 0, paper: 'a5' };
            }
            if (selectedTemplateType === 'tln-10-ngang') {
                return { mcq: 0, tf: 0, tln: 10, paper: 'a5' };
            }"""
content = content.replace(mapping_old, mapping_new)

# 3. Patch genWasmTypst for tf=20 column-major ordering
tf_loop_old = """                for (let i = 1; i <= tf; i++) {
                    tfQs.push(`grid("""
tf_loop_new = """                // If A5, order column-major
                let sortedIs = [];
                let rows = Math.ceil(tf / Math.min(5, tf));
                let cols = Math.min(5, tf);
                for (let r = 0; r < rows; r++) {
                    for (let c = 0; c < cols; c++) {
                        let i = c * rows + r + 1;
                        if (i <= tf) sortedIs.push(i);
                    }
                }
                
                for (let i of sortedIs) {
                    tfQs.push(`grid("""
if 'let sortedIs = [];' not in content:
    content = content.replace(tf_loop_old, tf_loop_new)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
print("Patched index.html for dropdowns and layout")
