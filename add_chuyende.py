import os
import shutil
import re
import json
import glob

# 1. Copy files
src_dir = '/Users/admin/conictypst/typst/exams'
dst_dir = '/Users/admin/conictypst/public/hdsd/typst'

cd_files = glob.glob(os.path.join(src_dir, 'CD-*.typ'))
cd_files.sort()

chuyende_data = []
colors = ["#e11d48", "#c026d3", "#7c3aed", "#4f46e5", "#2563eb", "#0891b2", "#0d9488", "#059669", "#65a30d", "#ea580c"]

for i, f in enumerate(cd_files):
    basename = os.path.basename(f)
    if "content" in basename or "bak" in basename or "HEAD" in basename: continue # skip raw content files
    
    # copy to dst
    shutil.copy(f, os.path.join(dst_dir, basename))
    
    name = basename.replace('CD-', '').replace('.typ', '').replace('-', ' ')
    
    chuyende_data.append({
        "title": name,
        "color": colors[i % len(colors)],
        "desc": f"Mẫu chuyên đề {name}",
        "macros": basename
    })

# 2. Update exam-templates.html
html_path = '/Users/admin/conictypst/public/hdsd/exam-templates.html'
with open(html_path, 'r', encoding='utf-8') as f:
    html = f.read()

# Inject constant
js_data = "const chuyende = " + json.dumps(chuyende_data, indent=2, ensure_ascii=False) + ";"
html = html.replace('const beamerThemes = [', js_data + '\n\n    const beamerThemes = [')

# Inject button
btn_html = '<button class="switch-btn" type="button" data-panel="chuyendePanel"><i data-lucide="layers"></i> Mẫu Chuyên Đề</button>'
html = html.replace('<button class="switch-btn" type="button" data-panel="bookPanel">', btn_html + '\n      <button class="switch-btn" type="button" data-panel="bookPanel">')

# Inject select for Chuyen de
select_html = '<select id="chuyendeThemeSelect" style="margin-top:10px;width:100%;min-height:42px;border-radius:8px;border:1px solid #334155;background:#020617;color:#e2e8f0;padding:0 12px;font:inherit;display:none;">\n'
for item in chuyende_data:
    select_html += f'          <option value="{item["macros"]}">{item["title"]}</option>\n'
select_html += '        </select>'

html = html.replace('<select id="bookThemeSelect"', select_html + '\n        <select id="bookThemeSelect"')

# Inject button for render Chuyen De
render_btn = '<button type="button" class="secondary" id="renderChuyendeBtn"><i data-lucide="layers"></i> Render Chuyên đề thật</button>'
html = html.replace('<button type="button" class="secondary" id="renderBookBtn">', render_btn + '\n          <button type="button" class="secondary" id="renderBookBtn">')

# Inject section
section_html = '''
    <section id="chuyendePanel" class="hidden">
      <div class="template-title" style="margin-bottom: 18px;">
        <div class="eyebrow">Chuyên Đề & Tài Liệu</div>
        <h2 style="margin:0 0 10px;">Thư viện Mẫu Chuyên Đề</h2>
        <p>Bộ sưu tập hơn 50 mẫu Chuyên Đề Toán học đỉnh cao. Copy thư viện hoặc bấm Render để xem ngay trên trình duyệt.</p>
      </div>
      <div class="book-grid" id="chuyendeGrid"></div>
    </section>
'''
html = html.replace('<section id="bookPanel"', section_html.strip() + '\n\n    <section id="bookPanel"')

# Inject JS render logic
js_render = '''
    function renderChuyende() {
      document.getElementById("chuyendeGrid").innerHTML = chuyende.map(item => `
        <article class="book-card" style="--book:${item.color}">
          <div class="book-band" style="font-size: 0.85em; height: 110px;">${item.title}</div>
          <p style="margin:0;color:#64748b;line-height:1.6;font-size:0.8rem;">${item.desc}</p>
          <div class="tag-row">
            <span class="tag" style="background:#0284c7;color:#fff;">chuyên đề</span>
            <span class="tag">${item.macros}</span>
          </div>
        </article>
      `).join("");
    }
'''
html = html.replace('function renderBooks()', js_render.strip() + '\n\n    function renderBooks()')

# Call render
html = html.replace('renderBooks();', 'renderChuyende();\n    renderBooks();')

# Event listener for btn
btn_logic = 'document.getElementById("renderChuyendeBtn").addEventListener("click", () => renderTypst("chuyende"));\n    '
html = html.replace('document.getElementById("renderBookBtn").addEventListener("click"', btn_logic + 'document.getElementById("renderBookBtn").addEventListener("click"')

# select logic
sel_logic = '''
    document.getElementById("chuyendeThemeSelect").addEventListener("change", async () => {
      const code = await bookTypstCode(document.getElementById("chuyendeThemeSelect").value);
      liveTypstCode.value = code;
    });
'''
html = html.replace('bookThemeSelect.addEventListener("change"', sel_logic.strip() + '\n\n    bookThemeSelect.addEventListener("change"')

# switch logic
html = html.replace('["examPanel", "profilePanel", "bookPanel", "beamerPanel"]', '["examPanel", "profilePanel", "chuyendePanel", "bookPanel", "beamerPanel"]')
html = html.replace('btn.dataset.panel === "bookPanel" ? "inline-flex" : "none";', 'btn.dataset.panel === "bookPanel" ? "inline-flex" : "none";\\n        document.getElementById("renderChuyendeBtn").style.display = btn.dataset.panel === "chuyendePanel" ? "inline-flex" : "none";')
html = html.replace('btn.dataset.panel === "bookPanel" ? "block" : "none";', 'btn.dataset.panel === "bookPanel" ? "block" : "none";\\n        document.getElementById("chuyendeThemeSelect").style.display = btn.dataset.panel === "chuyendePanel" ? "block" : "none";')

# init hide
html = html.replace('document.getElementById("renderBookBtn").style.display = "none";', 'document.getElementById("renderBookBtn").style.display = "none";\n    document.getElementById("renderChuyendeBtn").style.display = "none";')

# renderTypst function
render_fn = '''
      if (kind === "chuyende") liveTypstCode.value = await bookTypstCode(document.getElementById("chuyendeThemeSelect").value);
      else if (kind === "book")
'''
html = html.replace('if (kind === "book")', render_fn.strip())

with open(html_path, 'w', encoding='utf-8') as f:
    # fix literal \n injected by python replace string
    html = html.replace('\\n', '\n')
    f.write(html)
print(f"Done updating exam-templates.html with {len(chuyende_data)} Chuyen de templates.")
