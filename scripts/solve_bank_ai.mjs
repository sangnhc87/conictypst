#!/usr/bin/env node
import { GoogleGenAI } from '@google/genai';
import fs from 'node:fs';
import path from 'node:path';
import 'dotenv/config';

// Khởi tạo Gemini với key từ .env
const ai = new GoogleGenAI({ apiKey: process.env.GCP_API_KEY });

const pdfPath = process.argv[2];
if (!pdfPath) {
  console.error('Usage: node scripts/solve_bank_ai.mjs <pdf_path>');
  process.exit(1);
}

const resolvedPath = path.resolve(pdfPath);
if (!fs.existsSync(resolvedPath)) {
  console.error(`File không tồn tại: ${resolvedPath}`);
  process.exit(1);
}

console.log(`Đang phân tích PDF bằng AI: ${resolvedPath}`);

async function processPdf() {
  try {
    // 1. Upload PDF
    console.log('Đang tải file lên Google Gemini...');
    const uploadResult = await ai.files.upload({
        file: resolvedPath,
        mimeType: 'application/pdf',
    });
    
    console.log(`File uploaded: ${uploadResult.name}`);
    
    // 2. Chờ file processing
    let fileState = await ai.files.get({ name: uploadResult.name });
    while (fileState.state === 'PROCESSING') {
        console.log('Đang chờ xử lý file...');
        await new Promise(resolve => setTimeout(resolve, 5000));
        fileState = await ai.files.get({ name: uploadResult.name });
    }

    if (fileState.state === 'FAILED') {
        throw new Error('Gemini không thể xử lý PDF này.');
    }

    // 3. Gọi model để giải
    console.log('Đang yêu cầu giải đề và bóc tách ra Typst...');
    
    const prompt = `
      Bạn là một giáo viên Toán cấp 3 chuyên nghiệp. 
      Nhiệm vụ của bạn là đọc đề thi Toán trong file đính kèm, bóc tách toàn bộ câu hỏi và cung cấp lời giải sư phạm chi tiết.
      Nếu có hình vẽ hoặc đồ thị, hãy sinh mã Typst (thư viện CeTZ) để vẽ lại.
      Mọi công thức phải được viết dưới dạng mã Typst thay vì LaTeX, chuẩn "sang-math:1.0.4".
      Đừng bao gồm thông tin tác giả/người ra đề.
      Kết quả trả về dưới dạng JSON định dạng "conictypst.question-bank/v1".
    `;

    const response = await ai.models.generateContent({
      model: 'gemini-2.0-flash-lite-001',
      contents: [
        {
          role: 'user',
          parts: [
            { fileData: { fileUri: uploadResult.uri, mimeType: uploadResult.mimeType } },
            { text: prompt }
          ]
        }
      ],
      config: {
        responseMimeType: "application/json",
      }
    });

    console.log('=== KẾT QUẢ TỪ AI ===');
    const outputPath = resolvedPath.replace('.pdf', '-solved.json');
    fs.writeFileSync(outputPath, response.text, 'utf-8');
    console.log(`Đã lưu kết quả vào file: ${outputPath}`);

    // Xóa file sau khi xong
    await ai.files.delete({ name: uploadResult.name });
    console.log('Hoàn tất!');

  } catch (error) {
    console.error('\n[LỖI NGHIÊM TRỌNG]: Không thể thực thi giải đề bằng AI.');
    console.error('Chi tiết lỗi:', error.message);
    if (error.status === 403 || error.message.includes('Permission Denied') || error.message.includes('API key')) {
        console.error('\n=> NGUYÊN NHÂN: GCP_API_KEY của bạn không hợp lệ hoặc không có quyền gọi API.');
        console.error('=> GIẢI PHÁP: Vui lòng thay thế GCP_API_KEY trong file .env bằng mã hợp lệ từ Google AI Studio.');
    }
  }
}

processPdf();
