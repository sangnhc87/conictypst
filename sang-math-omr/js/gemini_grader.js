window.GeminiGrader = {
  async listModels(apiKey) {
    if (!apiKey) throw new Error('Nhập Gemini API key trước.');
    const response = await fetch('https://generativelanguage.googleapis.com/v1beta/models?pageSize=100', {
      headers: { 'x-goog-api-key': apiKey }
    });
    const data = await response.json();
    if (!response.ok) throw new Error(data.error?.message || 'Không đọc được danh sách model.');
    return (data.models || []).filter(item =>
      item.name?.startsWith('models/gemini-') &&
      item.supportedGenerationMethods?.includes('generateContent') &&
      !/(image|tts|live|embedding|transcribe)/i.test(item.name)
    ).map(item => ({ id: item.name.replace(/^models\//, ''), label: item.displayName || item.name.replace(/^models\//, '') }));
  },
  async gradeEssay(file, rubric, maxScore, apiKey, model = 'gemini-3.8-flash') {
    if (!apiKey) throw new Error('Nhập Gemini API key trước.');
    if (!file || !(file.type?.startsWith('image/') || file.type === 'application/pdf' || /\.pdf$/i.test(file.name))) {
      throw new Error('Chọn ảnh hoặc PDF bài tự luận.');
    }
    if (file.size > 12 * 1024 * 1024) throw new Error('File vượt 12 MB; hãy chia nhỏ hoặc nén trước khi gửi AI.');
    if (!String(rubric || '').trim()) throw new Error('Cần nhập đáp án hoặc tiêu chí chấm.');
    const maximum = Number(maxScore);
    if (!Number.isFinite(maximum) || maximum <= 0 || maximum > 10) throw new Error('Điểm tối đa phải từ 0 đến 10.');
    const bytes = new Uint8Array(await file.arrayBuffer());
    let binary = '';
    for (let offset = 0; offset < bytes.length; offset += 32768) {
      binary += String.fromCharCode(...bytes.subarray(offset, offset + 32768));
    }
    const mimeType = /\.pdf$/i.test(file.name) ? 'application/pdf' : file.type;
    const prompt = `Bạn là trợ lý chấm bài Toán. Chỉ dựa vào bài làm đính kèm và rubric do giáo viên cung cấp; không suy đoán phần không đọc được. Điểm tối đa ${maximum}. Rubric:\n${String(rubric).slice(0, 20000)}\n\nTrả JSON duy nhất: {"score": số hoặc null, "confidence": "cao|trung bình|thấp", "criteria": [{"criterion": "...", "points": số, "maxPoints": số, "evidence": "dẫn chứng ngắn từ bài làm"}], "unreadableParts": ["..."], "feedback": "nhận xét ngắn", "needsReview": true}. Nếu ảnh mờ hoặc rubric thiếu, đặt score=null và needsReview=true. Không tự tạo đáp án ngoài rubric. Giáo viên quyết định điểm cuối cùng.`;
    const modelName = String(model || 'gemini-3.8-flash').trim();
    if (!/^gemini-[a-z0-9.-]+$/i.test(modelName)) throw new Error('Tên model Gemini không hợp lệ.');
    const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/${encodeURIComponent(modelName)}:generateContent`, {
      method: 'POST', headers: { 'Content-Type': 'application/json', 'x-goog-api-key': apiKey },
      body: JSON.stringify({ contents: [{ parts: [
        { text: prompt }, { inlineData: { mimeType, data: btoa(binary) } }
      ] }], generationConfig: { temperature: 0, responseMimeType: 'application/json' } })
    });
    const data = await response.json();
    if (!response.ok) throw new Error(data.error?.message || 'Lỗi gọi Gemini.');
    const raw = data.candidates?.[0]?.content?.parts?.filter(part => typeof part.text === 'string').map(part => part.text).join('') || '';
    if (!raw) throw new Error('Gemini không trả về nội dung chấm.');
    let result;
    try { result = JSON.parse(raw.replace(/^```(?:json)?/i, '').replace(/```$/, '').trim()); }
    catch { throw new Error('Gemini trả kết quả không đúng JSON.'); }
    if (result.score !== null && (!Number.isFinite(Number(result.score)) || Number(result.score) < 0 || Number(result.score) > maximum)) {
      throw new Error('Điểm AI đề xuất vượt thang điểm; không dùng kết quả này.');
    }
    return result;
  },
  async extractAnswers(base64Image, templateName, apiKey, template = null, model = 'gemini-3.8-flash') {
    if (!apiKey) throw new Error("Vui lòng nhập Gemini API Key!");
    const modelName = String(model || 'gemini-3.8-flash').trim();
    if (!/^gemini-[a-z0-9.-]+$/i.test(modelName)) throw new Error("Tên model Gemini không hợp lệ.");
    const endpoint = `https://generativelanguage.googleapis.com/v1beta/models/${encodeURIComponent(modelName)}:generateContent`;
    
    let prompt = `Bạn là một hệ thống OMR siêu việt. Đọc ảnh chụp phiếu trả lời trắc nghiệm và trả về DỮ LIỆU JSON.
Loại phiếu: ${templateName}.
`;
    
    if (template) {
        const numSbd = template.numSbd || 0;
        const numMade = template.numMade || 0;
        const numMCQ = template.numQ || 0;
        const numTF = Number(template.numTf || 0);
        const numTLN = Number(template.numTln || 0);
        const hasTF = numTF > 0;
        const hasTLN = numTLN > 0;
        
        prompt += `Gồm: SBD (${numSbd} số), Mã Đề (${numMade} số).
`;
        if (numMCQ > 0) prompt += `Phần MCQ: câu 1-${numMCQ} (A,B,C,D).
`;
        
        let jsonStruct = `{
  "sbd": "${'0'.repeat(numSbd)}",
  "made": "${'1'.repeat(numMade)}",
  "mcq": { "1": "A", "2": "B" }`;
        
        if (hasTF) {
            prompt += `Phần TF: ${numTF} câu ngay sau phần MCQ, mỗi câu có 4 ý a,b,c,d (Đ/S).
`;
            jsonStruct += `,
  "tf": {
    "${numMCQ+1}": { "a": "Đ", "b": "S", "c": "Đ", "d": "S" }
  }`;
        }
        if (hasTLN) {
            let tlnStart = numMCQ + numTF + 1;
            prompt += `Phần TLN: ${numTLN} câu bắt đầu từ câu ${tlnStart} (Số thập phân/âm/dương, tối đa 4 ký tự).
`;
            jsonStruct += `,
  "tln": {
    "${tlnStart}": "1.5",
    "${tlnStart+1}": "-2"
  }`;
        }
        jsonStruct += `
}`;
        
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
      generationConfig: { temperature: 0.1, responseMimeType: 'application/json' }
    };

    const res = await fetch(endpoint, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-goog-api-key": apiKey },
      body: JSON.stringify(payload)
    });

    if (!res.ok) {
      const err = await res.json();
      throw new Error(err.error?.message || "Lỗi gọi API Gemini");
    }

    const data = await res.json();
    const textPart = data.candidates?.[0]?.content?.parts?.find(part => typeof part.text === 'string');
    if (!textPart) throw new Error("Gemini không trả về nội dung đọc phiếu.");
    let text = textPart.text.trim();
    text = text.replace(/^```json/i, '').replace(/^```/, '').replace(/```$/, '').trim();
    
    try {
      return JSON.parse(text);
    } catch (e) {
      console.error("Gemini trả về JSON không hợp lệ:", text);
      throw new Error("Lỗi parse JSON từ Gemini.");
    }
  }
};
