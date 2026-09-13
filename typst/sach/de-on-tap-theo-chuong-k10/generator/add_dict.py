# -*- coding: utf-8 -*-
path = "/Users/admin/conictypst/typst/sach/de-on-tap-theo-chuong-k10/generator/appendix.py"
with open(path, "r", encoding="utf-8") as f:
    c = f.read()

extra_dict = r'''  [Linear Programming (LP)], [Quy hoạch tuyến tính], [Phương pháp tối ưu hóa hàm mục tiêu tuyến tính trên miền đa giác lồi.],
  [Feasible Region], [Miền chấp nhận được], [Tập hợp tất cả các điểm thỏa mãn toàn bộ hệ bất phương trình ràng buộc.],
  [Convex Set / Polygon], [Tập lồi / Đa giác lồi], [Tập hợp mà đoạn thẳng nối hai điểm bất kỳ thuộc tập đều nằm trọn trong tập.],
  [Objective Function], [Hàm mục tiêu], [Hàm số F(x, y) = a x + b y cần tìm giá trị lớn nhất hoặc nhỏ nhất.],
  [Simplex Method], [Thuật toán Đơn hình], [Thuật toán của George Dantzig duyệt qua các đỉnh của đa giác lồi để tìm điểm tối ưu.],
  [Barycentric Coordinates], [Tọa độ tỉ cự khối tâm], [Hệ tọa độ biểu diễn điểm qua trọng số khối lượng của các đỉnh tam giác.],
  [Cosine Similarity], [Độ tương đồng Cosine], [Độ đo góc giữa hai vectơ, dùng trong FaceID và Vector Embedding AI.],
  [Floating Point (IEEE 754)], [Số thực dấu phẩy động], [Chuẩn biểu diễn số thực trong bộ nhớ máy tính nhị phân bằng phần định quy và số mũ.],
  [Integer Overflow], [Tràn số nguyên], [Lỗi xảy ra khi giá trị tính toán vượt quá dung lượng bit tối đa của kiểu dữ liệu.],
  [Least Squares Method (OLS)], [Phương pháp bình phương bé nhất], [Kỹ thuật tìm đường hồi quy thực nghiệm giảm thiểu sai số bình phương.],
  [Correlation Coefficient (r)], [Hệ số tương quan], [Đại lượng trong khoảng [-1; 1] đo mức độ liên hệ tuyến tính giữa hai biến.],
  [Central Limit Theorem (CLT)], [Định lý giới hạn trung tâm], [Tổng hoặc trung bình của các biến ngẫu nhiên độc lập luôn hội tụ về Phân phối Chuẩn.],
  [Normal Distribution], [Phân phối Chuẩn (Gauss)], [Phân phối xác suất liên tục hình quả chuông đối xứng N(mu, sigma^2).],
  [Null Hypothesis (H0)], [Giả thuyết không], [Giả định ban đầu rằng không có sự khác biệt hay tương quan thực sự giữa các biến.],
  [p-value], [Mức ý nghĩa p], [Xác suất quan sát được kết quả cực đoan như thực tế nếu giả thiết H0 là đúng.],
  [Bernstein Polynomials], [Đa thức Bernstein], [Các đa thức cơ sở kết hợp với hệ số nhị thức Newton để tạo đường cong Bézier.],
  [Hash Collision], [Xung đột hàm băm], [Hiện tượng hai dữ liệu đầu vào khác nhau sinh ra cùng một chuỗi mã băm đầu ra.],
  [Public Key Cryptography], [Mật mã khóa công khai], [Hệ mã hóa bất đối xứng sử dụng cặp khóa công khai và khóa bí mật (RSA).],
  [Ray Tracing], [Dò tia quang học], [Thuật toán đồ họa mô phỏng đường đi của tia sáng tương tác với các mặt cong Conic.],
  [Bresenham Algorithm], [Thuật toán Bresenham], [Thuật toán vẽ đường thẳng và đường tròn số nguyên siêu tốc trong GPU.],
  [Markov Chain], [Xích Markov], [Quá trình ngẫu nhiên trong đó trạng thái tương lai chỉ phụ thuộc vào trạng thái hiện tại.],
  [Decision Tree], [Cây quyết định], [Mô hình máy học phân nhánh nhị phân dựa trên các quy tắc đếm tổ hợp và xác suất.],
  [Gradient Descent], [Suy giảm độ dốc], [Thuật toán tối ưu hóa lặp bậc hai tìm cực tiểu hàm mất mát huấn luyện mạng nơ-ron AI.],
  [Turing Complete], [Tính đầy đủ Turing], [Khả năng của một ngôn ngữ lập trình giải được mọi bài toán mà máy Turing giải được.],
  [Occam's Razor], [Dao cạo Occam], [Nguyên lý triết học: Trong các lời giải cùng đúng, lời giải đơn giản nhất là lời giải tốt nhất.],
'''

target = '[Birthday Paradox], [Nghịch lý Ngày sinh], [Xác suất có ít nhất 2 người trùng sinh nhật vượt $50\%$ chỉ với 23 cá nhân ngẫu nhiên.],'
if target in c:
    c = c.replace(target, target + "\n" + extra_dict)
    print("Added extra dictionary terms successfully!")
else:
    print("Target string not found!")

with open(path, "w", encoding="utf-8") as f:
    f.write(c)
