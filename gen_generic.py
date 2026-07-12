import re
import os
import glob

# Read the template CD-DaiSo-ToHop.typ for the cover layout
with open('typst/exams/CD-DaiSo-ToHop.typ', 'r', encoding='utf-8') as f:
    template_content = f.read()

# We want to extract the cover part (lines 1 to 210 approximately)
# The cover part ends around `#pagebreak()` after the outline.
cover_match = re.search(r'(.*#pagebreak\(\).*?#pagebreak\(\))', template_content, flags=re.DOTALL)
if cover_match:
    cover_template = cover_match.group(1)
else:
    cover_template = template_content.split('#include')[0]

# Add generic content
generic_content = '''

// ==========================================
// CẤU HÌNH HEADER/FOOTER (Có thể tùy chỉnh)
// ==========================================
#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("1565C0"))
    grid(
      columns: (1fr, auto),
      [TÀI LIỆU CHUYÊN ĐỀ — SƯ PHẠM TOÀN DIỆN],
      [Giáo Viên Toán · Năm học 2026],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("1565C0"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("1565C0"))
    grid(
      columns: (1fr, auto),
      [Conic Typst · Tài liệu chia sẻ nội bộ],
      [Trang #counter(page).display()],
    )
  },
)

= CHỦ ĐỀ 1: GIỚI THIỆU MẪU CHUYÊN ĐỀ

== 1. Tóm tắt lý thuyết
#definition-box(title: "Định nghĩa cơ bản")[
  Đây là một mẫu định nghĩa sử dụng macro của sang-math.
  Bạn có thể thay đổi màu sắc và cấu trúc bằng cách sửa hàm `definition-box` hoặc tạo một template mới.
]

#theorem-box(title: "Định lý quan trọng")[
  Nếu một hàm số $f(x)$ liên tục trên đoạn $[a, b]$ và $f(a)f(b) < 0$, thì tồn tại ít nhất một nghiệm $c \\in (a,b)$ sao cho $f(c) = 0$.
]

== 2. Các dạng bài tập
#example-box(title: "Ví dụ minh họa")[
  Giải phương trình sau: $x^2 - 3x + 2 = 0$
  
  *Lời giải:*
  Ta có $a+b+c = 1 - 3 + 2 = 0$.
  Nên phương trình có 2 nghiệm phân biệt:
  $ x_1 = 1, quad x_2 = 2 $
]

#practice-box(title: "Bài tập tự luyện")[
  1. Giải phương trình $2x^2 - 5x + 3 = 0$.
  2. Xét dấu của tam thức bậc hai $f(x) = -x^2 + 4x - 4$.
]

#summary-box[
  Đây là khung tổng kết bài học. Rất thích hợp để đặt ở cuối mỗi chủ đề để học sinh tiện ôn tập.
]

'''

# Create 3 variations
variations = [
    {
        "filename": "12-mau-chuyen-de-vip.typ",
        "title": "MẪU CHUYÊN ĐỀ VIP",
        "subtitle": "TÀI LIỆU TOÁN HỌC CHUYÊN SÂU",
        "color1": "#4A148C",
        "color2": "#6A1B9A",
        "color3": "#880E4F",
        "desc": "Mẫu chuyên đề thiết kế bìa đẹp mắt, có thống kê nội dung."
    },
    {
        "filename": "13-mau-chuyen-de-thuc-te.typ",
        "title": "MẪU BÀI TOÁN THỰC TẾ",
        "subtitle": "ỨNG DỤNG TOÁN VÀO ĐỜI SỐNG",
        "color1": "#004D40",
        "color2": "#00695C",
        "color3": "#00796B",
        "desc": "Mẫu chuyên đề tone xanh lá, phù hợp tài liệu thực tế."
    },
    {
        "filename": "14-mau-chuyen-de-hinh-hoc.typ",
        "title": "MẪU HÌNH HỌC KHÔNG GIAN",
        "subtitle": "TƯ DUY HÌNH HỌC TRỰC QUAN",
        "color1": "#01579B",
        "color2": "#0277BD",
        "color3": "#0288D1",
        "desc": "Mẫu chuyên đề tone xanh dương mướt mắt cho Hình học."
    }
]

out_dir = 'sang-math-user-guide-examples-v2/examples'
dst_dir = 'public/hdsd/typst'

html_data = []

for var in variations:
    content = cover_template
    # Replace titles
    content = content.replace("ĐẠI SỐ TỔ HỢP", var["title"])
    content = content.replace("COMBINATORICS — CHUYÊN ĐỀ SƯ PHẠM TOÀN DIỆN", var["subtitle"])
    content = content.replace("Mục Lục Chuyên Đề Đại Số Tổ Hợp", f"Mục Lục {var['title']}")
    content = content.replace("GV Nguyễn Văn Sang", "Giáo Viên Biên Soạn")
    
    # Replace colors
    content = content.replace("#4A148C", var["color1"])
    content = content.replace("#6A1B9A", var["color2"])
    content = content.replace("#880E4F", var["color3"])
    
    # Combine with generic content
    final_content = content + generic_content
    
    # Save to user-guide
    with open(os.path.join(out_dir, var["filename"]), 'w', encoding='utf-8') as f:
        f.write(final_content)
    
    # Copy to public/hdsd/typst for the web
    with open(os.path.join(dst_dir, var["filename"]), 'w', encoding='utf-8') as f:
        f.write(final_content)
        
    html_data.append({
        "title": var["title"],
        "color": var["color2"],
        "desc": var["desc"],
        "macros": var["filename"]
    })

# Now update exam-templates.html to add JUST THESE 3 to the gallery
import json
html_path = 'public/hdsd/exam-templates.html'
with open(html_path, 'r', encoding='utf-8') as f:
    html = f.read()

# Only inject if not already there
if 'const chuyende =' not in html:
    js_data = "const chuyende = " + json.dumps(html_data, indent=2, ensure_ascii=False) + ";"
    html = html.replace('const beamerThemes = [', js_data + '\\n\\n    const beamerThemes = [')

    btn_html = '<button class="switch-btn" type="button" data-panel="chuyendePanel"><i data-lucide="layers"></i> Mẫu Chuyên Đề</button>'
    html = html.replace('<button class="switch-btn" type="button" data-panel="bookPanel">', btn_html + '\\n      <button class="switch-btn" type="button" data-panel="bookPanel">')

    select_html = '<select id="chuyendeThemeSelect" style="margin-top:10px;width:100%;min-height:42px;border-radius:8px;border:1px solid #334155;background:#020617;color:#e2e8f0;padding:0 12px;font:inherit;display:none;">\\n'
    for item in html_data:
        select_html += f'          <option value="{item["macros"]}">{item["title"]}</option>\\n'
    select_html += '        </select>'
    html = html.replace('<select id="bookThemeSelect"', select_html + '\\n        <select id="bookThemeSelect"')

    render_btn = '<button type="button" class="secondary" id="renderChuyendeBtn"><i data-lucide="layers"></i> Render Chuyên đề thật</button>'
    html = html.replace('<button type="button" class="secondary" id="renderBookBtn">', render_btn + '\\n          <button type="button" class="secondary" id="renderBookBtn">')

    section_html = """
    <section id="chuyendePanel" class="hidden">
      <div class="template-title" style="margin-bottom: 18px;">
        <div class="eyebrow">Chuyên Đề & Tài Liệu</div>
        <h2 style="margin:0 0 10px;">Thư viện Mẫu Chuyên Đề</h2>
        <p>Bộ template Chuyên đề với thiết kế bìa tuyệt đẹp, được tách ra khỏi nội dung cá nhân để chia sẻ công khai.</p>
      </div>
      <div class="book-grid" id="chuyendeGrid"></div>
    </section>
    """
    html = html.replace('<section id="bookPanel"', section_html.strip() + '\\n\\n    <section id="bookPanel"')

    js_render = """
    function renderChuyende() {
      document.getElementById("chuyendeGrid").innerHTML = chuyende.map(item => `
        <article class="book-card" style="--book:${item.color}">
          <div class="book-band" style="font-size: 0.85em; height: 110px;">${item.title}</div>
          <p style="margin:0;color:#64748b;line-height:1.6;font-size:0.8rem;">${item.desc}</p>
          <div class="tag-row">
            <span class="tag" style="background:#0284c7;color:#fff;">chuyên đề mẫu</span>
            <span class="tag">${item.macros}</span>
          </div>
        </article>
      `).join("");
    }
    """
    html = html.replace('function renderBooks()', js_render.strip() + '\\n\\n    function renderBooks()')
    html = html.replace('renderBooks();', 'renderChuyende();\\n    renderBooks();')

    btn_logic = 'document.getElementById("renderChuyendeBtn").addEventListener("click", () => renderTypst("chuyende"));\\n    '
    html = html.replace('document.getElementById("renderBookBtn").addEventListener("click"', btn_logic + 'document.getElementById("renderBookBtn").addEventListener("click"')

    sel_logic = """
    document.getElementById("chuyendeThemeSelect").addEventListener("change", async () => {
      const code = await bookTypstCode(document.getElementById("chuyendeThemeSelect").value);
      liveTypstCode.value = code;
    });
    """
    html = html.replace('bookThemeSelect.addEventListener("change"', sel_logic.strip() + '\\n\\n    bookThemeSelect.addEventListener("change"')

    html = html.replace('["examPanel", "profilePanel", "bookPanel", "beamerPanel"]', '["examPanel", "profilePanel", "chuyendePanel", "bookPanel", "beamerPanel"]')
    html = html.replace('btn.dataset.panel === "bookPanel" ? "inline-flex" : "none";', 'btn.dataset.panel === "bookPanel" ? "inline-flex" : "none";\\n        document.getElementById("renderChuyendeBtn").style.display = btn.dataset.panel === "chuyendePanel" ? "inline-flex" : "none";')
    html = html.replace('btn.dataset.panel === "bookPanel" ? "block" : "none";', 'btn.dataset.panel === "bookPanel" ? "block" : "none";\\n        document.getElementById("chuyendeThemeSelect").style.display = btn.dataset.panel === "chuyendePanel" ? "block" : "none";')
    html = html.replace('document.getElementById("renderBookBtn").style.display = "none";', 'document.getElementById("renderBookBtn").style.display = "none";\\n    document.getElementById("renderChuyendeBtn").style.display = "none";')

    render_fn = """
      if (kind === "chuyende") liveTypstCode.value = await bookTypstCode(document.getElementById("chuyendeThemeSelect").value);
      else if (kind === "book")
    """
    html = html.replace('if (kind === "book")', render_fn.strip())
    
    # Fix python escapes
    html = html.replace('\\\\n', '\\n')

    with open(html_path, 'w', encoding='utf-8') as f:
        f.write(html)
    print("Injected 3 generic templates into exam-templates.html")
