export default {
  subject: "Tin học tốt nghiệp THPT 2026",
  role: "biên tập viên đề thi Tin học THPT",
  rules: [
    "Đề Tin học mẫu này có PHẦN I gồm 24 câu trắc nghiệm nhiều phương án A–D; phải giữ đủ 24 câu, mỗi câu đúng một phương án và xếp phương án theo một cột khi hiển thị.",
    "PHẦN II gồm 6 câu Đúng/Sai, mỗi câu có đúng bốn ý a), b), c), d). Câu 1–2 là phần chung; Câu 3–4 thuộc định hướng Khoa học máy tính; Câu 5–6 thuộc định hướng Tin học ứng dụng. Không gộp các câu này thành một câu duy nhất và không làm mất phần định hướng.",
    "Mỗi câu Đúng/Sai phải có một group stimulus riêng. Đưa nguyên văn tình huống, bảng cơ sở dữ liệu, câu lệnh SQL, đoạn mã Python/C++, HTML/CSS hoặc dữ kiện vào stimulus; các ý a), b), c), d) chỉ giữ mệnh đề cần đánh giá.",
    "Bảng mã hai cột Python/C++ phải được giữ dưới dạng table, bảo toàn thứ tự dòng, thụt đầu dòng, dấu ngoặc, toán tử, tên biến và phân biệt hoa thường. Không tự sửa mã chỉ vì thấy khác phong cách; nếu nguồn có lỗi hiển nhiên như Return/return thì giữ nguyên và thêm warning.",
    "Các cấu trúc HTML/CSS, SQL, Python, C++, tên bảng, tên trường, khóa chính, khóa ngoại, hàm và thuật toán là nội dung chuyên môn; không dịch, không diễn giải thay vào phần câu hỏi.",
    "Bảng ĐÁP ÁN THAM KHẢO: đọc cặp Câu–Đáp án của Phần I để gán isCorrect. Bảng Đáp án Phần II chứa chuỗi Đúng/Sai theo thứ tự a–d; gán correctValue đúng vị trí, không suy đoán nếu bảng bị thiếu.",
    "LỜI GIẢI THAM KHẢO phải đặt sau phương án hoặc sau bốn mệnh đề tương ứng; tách theo từng câu, giữ các bước phân tích thuật toán, truy vấn SQL, mạng máy tính, AI và HTML/CSS.",
    "Giữ nguyên các từ viết tắt và thuật ngữ: LAN, WAN, Modem, Router, Switch, SQL, HTML, CSS, AI, Machine Learning, VLOOKUP. Sửa lỗi OCR hiển nhiên ở văn bản thường chỉ khi chắc chắn; nếu gặp E?l hoặc ký tự nghi vấn thì giữ gần nguyên bản và thêm warning.",
    "Không biến dòng kết thúc đề, hướng dẫn coi thi, mã đề, họ tên và số báo danh thành câu hỏi. Không đưa bảng đáp án vào stimulus của câu hỏi.",
    "Nếu đề có cả hai định hướng trong cùng file, vẫn nhập đủ Câu 3–6 để giáo viên chọn hoặc ẩn định hướng không dùng khi soạn và giao thi; tuyệt đối không trộn nội dung Khoa học máy tính với Tin học ứng dụng.",
  ],
};
