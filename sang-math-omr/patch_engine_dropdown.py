import re

with open('index.html', 'r') as f:
    content = f.read()

old_html = """
        <div class="form-group" style="margin-top: 10px;">
          <label>🔑 Gemini API Key (Bắt buộc để chấm)</label>
          <input type="password" class="form-input" id="geminiApiKey" placeholder="Nhập API Key của Google Gemini...">
          <div style="font-size: 11px; color: var(--muted); margin-top: 4px;">
            Dùng AI Gemini 3.5 Flash để đọc ảnh chính xác tuyệt đối ngay cả khi mờ, tẩy xoá hoặc ảnh méo.
          </div>
        </div>
"""

new_html = """
        <div class="form-group" style="margin-top: 10px;">
          <label>🚀 Động cơ chấm điểm</label>
          <select class="form-input" id="gradeEngine" onchange="toggleApiKeyInput()">
            <option value="opencv">⚡ Siêu tốc Offline (OpenCV) - Nhanh, Miễn phí</option>
            <option value="gemini">🧠 Trí Tuệ AI (Gemini 3.5) - Chậm, Rất chính xác</option>
          </select>
        </div>
        <div class="form-group" id="apiKeyContainer" style="margin-top: 10px; display: none;">
          <label>🔑 Gemini API Key (Bắt buộc)</label>
          <input type="password" class="form-input" id="geminiApiKey" placeholder="Nhập API Key của Google Gemini...">
          <div style="font-size: 11px; color: var(--muted); margin-top: 4px;">
            Dùng AI Gemini 3.5 Flash để cứu các bài thi méo, mờ, tẩy xoá.
          </div>
        </div>
"""

content = content.replace(old_html.strip(), new_html.strip())

# We also need to add the toggleApiKeyInput function in a script tag.
# We'll put it right after toggleTab.
script_patch = """
    <script>
      function toggleApiKeyInput() {
        const engine = document.getElementById('gradeEngine').value;
        const keyContainer = document.getElementById('apiKeyContainer');
        if (engine === 'gemini') {
           keyContainer.style.display = 'block';
        } else {
           keyContainer.style.display = 'none';
        }
      }
"""
content = content.replace("    <script>", script_patch)

# And update gradeNext to pass the engine.
grade_next_old = "const result = await window.OmrEngine.gradeImage(entry.imgEl, template, fullAnswers, apiKey, sheetType);"
grade_next_new = """
          const engine = document.getElementById('gradeEngine').value;
          const result = await window.OmrEngine.gradeImage(entry.imgEl, template, fullAnswers, apiKey, sheetType, engine);
"""
content = content.replace(grade_next_old, grade_next_new.strip())


with open('index.html', 'w') as f:
    f.write(content)
print("index.html patched with dropdown")
