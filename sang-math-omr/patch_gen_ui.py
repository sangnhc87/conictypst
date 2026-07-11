import re
html = open('index.html', 'r', encoding='utf-8').read()

checkbox_html = """
        <div class="form-group" style="margin-top: 10px;">
          <label style="display:flex;align-items:center;gap:5px;cursor:pointer;">
            <input type="checkbox" id="genHandwritten" checked>
            ✍ Có chừa khoảng trống Tự luận viết tay (để gọn phiếu khi tắt)
          </label>
        </div>
      </div>
"""
html = html.replace('        </div>\n      </div>\n\n      <div class="card">', checkbox_html + '\n      <div class="card">')

download_typ_fix = """function downloadTypFile() {
  const conf = TEMPLATES[selectedTemplateType];
  if (!conf) return alert("Vui lòng chọn mẫu phiếu!");
  
  const school = document.getElementById('genSchool')?.value || 'SANG MATH OMR';
  const subtitle = document.getElementById('genSubtitle')?.value || 'Custom Template';
  const handwritten = document.getElementById('genHandwritten')?.checked ?? true;
  
  const code = genWasmTypst({ mcq: conf.mcq, tf: conf.tf, tln: conf.tln, paper: conf.paper, school, subtitle, handwritten, realQr: true });
  const blob = new Blob([code], {type:'text/plain'});
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = `phieu_omr_${selectedTemplateType}.typ`;
  a.click();
}"""

html = re.sub(r'function downloadTypFile\(\)\s*\{[\s\S]*?a\.click\(\);\s*\}', download_typ_fix, html)

open('index.html', 'w', encoding='utf-8').write(html)
