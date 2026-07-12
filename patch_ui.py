import re

with open("public/hdsd/exam-templates.html", "r", encoding="utf-8") as f:
    html = f.read()

# Replace wasm-actions
old_actions = """        <div class="wasm-actions">
          <button type="button" id="renderExamBtn"><i data-lucide="file-check-2"></i> Render đề thật</button>
          <button type="button" class="secondary" id="renderChuyendeBtn"><i data-lucide="layers"></i> Render Chuyên đề thật</button>
          <button type="button" class="secondary" id="renderBookBtn"><i data-lucide="book-open"></i> Render sách thật</button>
          <button type="button" class="secondary" id="renderBeamerBtn"><i data-lucide="monitor-play"></i> Render Slide thật</button>
          <button type="button" class="ghost" id="copyLiveCodeBtn"><i data-lucide="copy"></i> Copy mã</button>
        </div>"""

new_actions = """        <div class="wasm-actions" style="display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 12px; background: rgba(15, 23, 42, 0.4); padding: 8px; border-radius: 8px; border: 1px solid #1e293b;">
          <button type="button" id="renderExamBtn" style="padding: 6px 12px; font-size: 0.85rem; border-radius: 6px; background: #3b82f6; border: none; color: white; display: flex; align-items: center; gap: 6px; cursor: pointer; transition: all 0.2s;"><i data-lucide="file-check-2" style="width: 16px; height: 16px;"></i> Xem Trước Đề</button>
          <button type="button" id="renderChuyendeBtn" style="padding: 6px 12px; font-size: 0.85rem; border-radius: 6px; background: #8b5cf6; border: none; color: white; display: flex; align-items: center; gap: 6px; cursor: pointer; transition: all 0.2s;"><i data-lucide="layers" style="width: 16px; height: 16px;"></i> Xem Chuyên Đề</button>
          <button type="button" id="renderBookBtn" style="padding: 6px 12px; font-size: 0.85rem; border-radius: 6px; background: #10b981; border: none; color: white; display: flex; align-items: center; gap: 6px; cursor: pointer; transition: all 0.2s;"><i data-lucide="book-open" style="width: 16px; height: 16px;"></i> Xem Sách</button>
          <button type="button" id="renderBeamerBtn" style="padding: 6px 12px; font-size: 0.85rem; border-radius: 6px; background: #f59e0b; border: none; color: white; display: flex; align-items: center; gap: 6px; cursor: pointer; transition: all 0.2s;"><i data-lucide="monitor-play" style="width: 16px; height: 16px;"></i> Xem Slide</button>
          <button type="button" id="toggleCodeBtn" style="padding: 6px 12px; font-size: 0.85rem; border-radius: 6px; background: transparent; border: 1px solid #475569; color: #cbd5e1; display: flex; align-items: center; gap: 6px; cursor: pointer; transition: all 0.2s; margin-left: auto;" onmouseover="this.style.background='#334155'" onmouseout="this.style.background='transparent'"><i data-lucide="code" style="width: 16px; height: 16px;"></i> Mã Nguồn</button>
          <button type="button" id="copyLiveCodeBtn" style="padding: 6px 12px; font-size: 0.85rem; border-radius: 6px; background: transparent; border: 1px dashed #475569; color: #cbd5e1; display: flex; align-items: center; gap: 6px; cursor: pointer; transition: all 0.2s;" onmouseover="this.style.background='#334155'" onmouseout="this.style.background='transparent'"><i data-lucide="copy" style="width: 16px; height: 16px;"></i> Copy</button>
        </div>"""

html = html.replace(old_actions, new_actions)

# Hide textarea by default
html = html.replace('<textarea id="liveTypstCode" class="wasm-code" spellcheck="false"></textarea>', 
                    '<textarea id="liveTypstCode" class="wasm-code" spellcheck="false" style="display: none;"></textarea>')

with open("public/hdsd/exam-templates.html", "w", encoding="utf-8") as f:
    f.write(html)
