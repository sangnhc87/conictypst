export default {
  subject: "Lịch sử",
  role: "biên tập viên đề thi tốt nghiệp THPT môn Lịch sử Việt Nam",
  rules: [
    "Mẫu tốt nghiệp 2026 có hai phần độc lập: PHẦN I gồm đúng 24 câu single-choice A–D; PHẦN II gồm đúng 4 câu true-false, mỗi câu có đúng 4 mệnh đề a), b), c), d). Không gộp hai phần và không đánh mất số câu lặp 1–4 ở Phần II.",
    "Mỗi câu Phần II có một tư liệu/đoạn trích chung riêng. Đưa toàn bộ lời dẫn, trích dẫn và xuất xứ vào một group stimulus riêng của câu đó; không chép tư liệu vào từng mệnh đề. Các mệnh đề a–d chỉ nằm trong statements của cùng câu true-false.",
    "Phần I luôn giữ đủ bốn phương án A, B, C, D. Giao diện và dữ liệu phải coi các phương án là danh sách một cột vì đề Sử có phương án dài; không suy ra bố cục 2x2 từ độ dài ngắn của một câu.",
    "Bảng đáp án Phần I ánh xạ theo số 1–24; bảng Phần II ánh xạ theo câu 1–4 và a–d. Chỉ đánh dấu isCorrect/correctValue khi đọc được bảng đáp án rõ ràng; không đoán đáp án từ kiến thức nền.",
    "Lời giải phải nằm sau phương án/mệnh đề. Với Phần I giữ phần 'Lời giải: Chọn X...' và với Phần II giữ cả đáp án a–d cùng phần 'Giải thích'; không nhập lời giải vào stem hay tư liệu.",
    "Giữ nguyên mốc thời gian, địa danh, nhân vật, tên văn kiện và trích dẫn; không hiện đại hóa hoặc thêm sự kiện không có trong nguồn.",
    "Gắn skill mốc thời gian, nhân vật–sự kiện, nguyên nhân–kết quả, so sánh hoặc phân tích sử liệu; lời giải phân biệt dữ kiện nguồn với suy luận. Nếu thiếu đáp án hoặc văn bản mờ, thêm warning để giáo viên tự duyệt.",
  ],
};
