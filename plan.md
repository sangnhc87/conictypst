# Kế hoạch chi tiết sửa đổi hdsd-exam.typ

1. **Sửa phần Hướng dẫn gán ID**:
   - Sửa lại nội dung giải thích "cách gán ID", cung cấp một mẫu code "cấu trúc tối thiểu" thực tế, rõ ràng.
   - Xóa các mô tả lan man không cần thiết. Trực tiếp đi thẳng vào: "Đây là cách gắn ID vào câu hỏi, đây là ví dụ, đây là kết quả".

2. **Viết lại toàn bộ phần Hướng dẫn Bảng Biến Thiên (BBT)**:
   - Sửa lỗi nghiêm trọng trong mảng `d-signs` (sai số lượng phần tử dẫn đến render sai mũi tên).
   - Đưa ra cấu trúc tối thiểu cho `bbtv2` (chỉ với 3 mốc x), `bbbt`, `bxd`.
   - Giải thích cặn kẽ từng tham số: `w1`, `w2`, `h1`, `h2`, `h3`, `shade`, `ranks`,... với từng ví dụ code + render `#demo-out` riêng biệt để người dùng dễ tra cứu.
   - Làm rõ quy luật `2n-3` của `d-signs` bằng một bảng phân tích thật trực quan (có lẽ người dùng đã không hiểu quy luật này nên mới làm sai `d-signs`).
   - Thêm ví dụ có tiệm cận đứng, cực tiểu, hàm phân thức.

