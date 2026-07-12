import re
with open('sang-math-omr/index.html', 'r') as f:
    html = f.read()

made_selector_html = """                    <div class="row-between mb-3" style="background:#f8fafc; padding:10px; border-radius:8px; border:1px solid #e2e8f0;">
                        <div class="row" style="gap:10px; align-items:center;">
                            <label style="font-weight:600; color:#334155;">Mã đề đang chọn:</label>
                            <select id="activeMadeKey" class="form-input" style="width:140px; padding:4px 8px; font-weight:bold;" onchange="switchAnswerKey(this.value)">
                                <option value="default">Mặc định (Chung)</option>
                            </select>
                        </div>
                        <div class="row" style="gap:6px;">
                            <button class="btn btn-outline btn-sm" onclick="addAnswerKey()" style="padding:4px 10px; border-color:#3b82f6; color:#3b82f6;">➕ Thêm mã</button>
                            <button class="btn btn-outline btn-sm" onclick="removeAnswerKey()" style="padding:4px 10px; border-color:#ef4444; color:#ef4444;" title="Xoá mã đề đang chọn">🗑️</button>
                        </div>
                    </div>"""

html = html.replace('<div class="answer-grid" id="answersGrid"></div>', made_selector_html + '\n                    <div class="answer-grid" id="answersGrid"></div>')

with open('sang-math-omr/index.html', 'w') as f:
    f.write(html)
