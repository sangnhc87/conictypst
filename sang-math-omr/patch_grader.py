import re

with open("js/omr_engine.js", "r") as f:
    js = f.read()
js = js.replace("await window.GeminiGrader.extractAnswers(base64, templateName, apiKey);", "await window.GeminiGrader.extractAnswers(base64, templateName, apiKey, template);")
with open("js/omr_engine.js", "w") as f:
    f.write(js)

with open("js/gemini_grader.js", "r") as f:
    gjs = f.read()

new_grader = """window.GeminiGrader = {
  async extractAnswers(base64Image, templateName, apiKey, template = null) {
    if (!apiKey) throw new Error("Vui lòng nhập Gemini API Key!");
    const endpoint = `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${apiKey}`;
    
    let prompt = `Bạn là một hệ thống OMR siêu việt. Đọc ảnh chụp phiếu trả lời trắc nghiệm và trả về DỮ LIỆU JSON.
Loại phiếu: ${templateName}.
`;
    
    if (template) {
        const numSbd = template.numSbd || 0;
        const numMade = template.numMade || 0;
        const numMCQ = template.numQ || 0;
        const hasTF = !!template.tf;
        const hasTLN = !!template.tln;
        
        prompt += `Gồm: SBD (${numSbd} số), Mã Đề (${numMade} số).\n`;
        if (numMCQ > 0) prompt += `Phần MCQ: câu 1-${numMCQ} (A,B,C,D).\n`;
        
        let jsonStruct = `{\n  "sbd": "${'0'.repeat(numSbd)}",\n  "made": "${'1'.repeat(numMade)}",\n  "mcq": { "1": "A", "2": "B" }`;
        
        if (hasTF) {
            prompt += `Phần TF: các câu sau phần MCQ, mỗi câu có 4 ý a,b,c,d (Đ/S).\n`;
            jsonStruct += `,\n  "tf": {\n    "${numMCQ+1}": { "a": "Đ", "b": "S", "c": "Đ", "d": "S" }\n  }`;
        }
        if (hasTLN) {
            let tlnStart = numMCQ + (hasTF ? 4 : 0) + 1;
            prompt += `Phần TLN: bắt đầu từ câu ${tlnStart} (Số thập phân/âm/dương, tối đa 4 ký tự).\n`;
            jsonStruct += `,\n  "tln": {\n    "${tlnStart}": "1.5",\n    "${tlnStart+1}": "-2"\n  }`;
        }
        jsonStruct += `\n}`;
        
        prompt += `
Trả về ĐÚNG cấu trúc JSON sau (KHÔNG dùng markdown code block, chỉ trả chuỗi JSON bắt đầu bằng { và kết thúc bằng }):
${jsonStruct}
Lưu ý: Học sinh không tô thì để trống "". Tô đúp/sai luật MCQ thì để "MULTIPLE".
`;
    } else {
        // Fallback for simple MCQ
        prompt += `
Gồm: SBD (tuỳ ý), Mã Đề (tuỳ ý). Trắc nghiệm A,B,C,D.
Trả về ĐÚNG cấu trúc JSON sau (KHÔNG dùng markdown code block, chỉ trả chuỗi JSON):
{
  "sbd": "012345",
  "made": "101",
  "mcq": { "1": "A", "2": "B", "3": "C" }
}
`;
    }

    const payload = {
      contents: [{
        parts: [
          { text: prompt },
          { inlineData: { mimeType: "image/jpeg", data: base64Image } }
        ]
      }],
      generationConfig: { temperature: 0.1 }
    };

    const res = await fetch(endpoint, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload)
    });

    if (!res.ok) {
      const err = await res.json();
      throw new Error(err.error?.message || "Lỗi gọi API Gemini");
    }

    const data = await res.json();
    let text = data.candidates[0].content.parts[0].text.trim();
    text = text.replace(/^```json/i, '').replace(/^```/, '').replace(/```$/, '').trim();
    
    try {
      return JSON.parse(text);
    } catch (e) {
      console.error("Gemini trả về JSON không hợp lệ:", text);
      throw new Error("Lỗi parse JSON từ Gemini.");
    }
  }
};
"""

with open("js/gemini_grader.js", "w") as f:
    f.write(new_grader)
print("gemini_grader.js upgraded!")
