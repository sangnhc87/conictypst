import re

html = open('index.html', 'r', encoding='utf-8').read()

# 1. Add Checkbox UI
checkbox_ui = """            </label>
          </div>
        </div>
        <div class="builder-row">
          <span class="builder-label">✍ Tự luận viết tay</span>
          <div style="display:flex;gap:8px">
            <label style="display:flex;align-items:center;gap:5px;cursor:pointer;font-size:13px">
              <input type="checkbox" id="bldHandwritten" checked onchange="updateBuilder()">
              Có phần tự luận viết tay
            </label>
          </div>
        </div>"""
html = html.replace('            </label>\n          </div>\n        </div>', checkbox_ui, 1)

# 2. Extract value in buildWasmPreviewTypst
# Search for: paper: document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4',
cfg_replace = """    paper: document.querySelector('input[name="bldPaper"]:checked')?.value || 'a4',
    handwritten: document.getElementById('bldHandwritten')?.checked ?? true,"""
html = html.replace("    paper: document.querySelector('input[name=\"bldPaper\"]:checked')?.value || 'a4',", cfg_replace)

# 3. Modify genWasmTypst parameters
html = html.replace('function genWasmTypst({ mcq, tf, tln, paper, school, subtitle }) {', 'function genWasmTypst({ mcq, tf, tln, paper, school, subtitle, handwritten }) {')

# 4. Modify genWasmTypst generation to conditionally append handwritten
handwritten_block = """// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────
#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, fill:luma(252), [
  #rect(fill:luma(238), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, fill:gray)[✍ PHẦN TỰ LUẬN – Viết bên dưới]]])
  #v(4pt)
  #set par(leading: 14pt)
  #for _ in range(${Math.floor(isA5 ? 4 : 8)}) [
    #line(length:100%, stroke:(thickness:.3pt, dash:"dashed", paint:luma(200))) \\\\
  ]
  #v(4pt)
])"""

conditional_handwritten = """${handwritten !== false ? `
// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────
#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, fill:luma(252), [
  #rect(fill:luma(238), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, fill:gray)[✍ PHẦN TỰ LUẬN – Viết bên dưới]]])
  #v(4pt)
  #set par(leading: 14pt)
  #for _ in range(${Math.floor(isA5 ? 4 : 8)}) [
    #line(length:100%, stroke:(thickness:.3pt, dash:"dashed", paint:luma(200))) \\\\\\\\
  ]
  #v(4pt)
])` : ''}"""

html = html.replace(handwritten_block, conditional_handwritten)

# 5. Modify renderSheetPreview (Canvas rendering)
# Look for:
# if (type === 'tln-10' || type === 'a4' || (type === 'custom' && H > 800)) {
canvas_cond_old = "if (type === 'tln-10' || type === 'a4' || (type === 'custom' && H > 800)) {"
canvas_cond_new = "if (document.getElementById('bldHandwritten')?.checked !== false && (type === 'tln-10' || type === 'a4' || (type === 'custom' && H > 800))) {"
html = html.replace(canvas_cond_old, canvas_cond_new)

open('index.html', 'w', encoding='utf-8').write(html)
