import json
import sys

# Read the category_mapping from generate_summary_solutions_typst.py
mapping = {
    # Group 1: Tổ hợp & Đếm nâng cao
    "CD-DaiSo-ToHop-content.typ": ("Đại số Tổ hợp & Quy tắc đếm cơ bản", 1),
    "CD-FSM-Dem-To-Hop.typ": ("Đếm Tổ hợp bằng Máy trạng thái hữu hạn (FSM)", 1),
    "FSM.typ": ("Xây dựng Máy trạng thái hữu hạn FSM trong bài toán đếm", 1),
    "Đếm-FSM-NxN.typ": ("Kỹ thuật đếm FSM trên bảng lưới vuông N x N", 1),
    "CD-ToMau.typ": ("Bài toán Tô màu Bản đồ & Hàng ô vuông", 1),
    "FSM-To-Mau.typ": ("Đếm số cách tô màu sử dụng trạng thái FSM", 1),
    "Da-Giac-Deu.typ": ("Tổ hợp và Hình học trên Đa giác đều", 1),
    "CD-Đếm Nâng Cao.typ": ("Các kỹ thuật đếm nâng cao và truy hồi", 1),
    
    # Group 2: Xác suất & Sơ đồ cây
    "CD-SoDoCay-XacSuat-TroChoi.typ": ("Sơ đồ cây & Xác suất trò chơi", 2),
    "Xác-Suât-Đối Kháng.typ": ("Xác suất đối kháng & Thi đấu luân lưu", 2),
    "Sơ-Đồ-Cây-1-3-6.typ": ("Sơ đồ cây xác suất 1-3-6 (Phân nhánh động)", 2),
    "Sơ-Đồ-Cây-2-4-8.typ": ("Sơ đồ cây xác suất 2-4-8 (Trò chơi phân nhánh)", 2),
    "Xác-Suất-Bốc-Bi.typ": ("Bài toán bốc bi & Xác suất có điều kiện", 2),
    "Gieo-Xúc-Sắc-Xác-Suất-Bốc-Bi.typ": ("Xác suất gieo xúc sắc kết hợp bốc bi", 2),
    "CD-Xac-Suất-Bayes-Tim-x.typ": ("Công thức xác suất Bayes và bài toán tìm x", 2),
    "CD-XacSuat-DieuKien-Gia.typ": ("Xác suất có điều kiện và mô hình giả thuyết", 2),
    "CD-XacSuat-DieuKien-PhanPhoi.typ": ("Xác suất có điều kiện trên phân phối vật vào hộp", 2),
    
    # Group 3: Hàm sinh trong Tổ hợp
    "CD-HamSinh-GeneratingFunction-content.typ": ("Hàm sinh trong Tổ hợp (Generating Functions)", 3),
    "CD-HamSinh-LoiBai-NangCao-content.typ": ("Giải bài toán đếm nâng cao bằng Hàm sinh (EGF)", 3),
    "CD-Chia-Keo-Euler.typ": ("Chia kẹo Euler — Sao và Vạch & Đa thức sinh", 3),
    "CD-PhanPhoi-4TruongHop.typ": ("Mô hình Phân phối vật vào hộp (4 Trường hợp)", 3),
    "CD-ChuoiTrangThai-Markov.typ": ("Chuỗi trạng thái Markov & Xác suất đệ quy", 3),
    
    # Group 4: Giải tích, Tích phân & Tối ưu hóa
    "CD-Kinh-Te-Tich-Phan.typ": ("Tích phân trong Kinh tế: Thặng dư CS & PS", 4),
    "CD-TichPhan-TocDo-DoanhThu.typ": ("Tích phân tốc độ thay đổi & Doanh thu lũy tiến", 4),
    "CD-tich-Phan-đọc lạ.typ": ("Các bài toán tích phân độc lạ và nâng cao", 4),
    "CD-NangSuat-NhaMay-ToiUu.typ": ("Tối ưu hóa năng suất nhà máy (Hàm phân đoạn)", 4),
    "CD-ToiUu-KinhTe-DaDieuKien.typ": ("Tối ưu hóa kinh tế nhiều điều kiện ràng buộc", 4),
    "CD-Tang-Giam-LienTuc.typ": ("Mô hình tăng giảm liên tục & Cực trị", 4),
    "CHủ Đề Thay Đổi Bảo Hoà.typ": ("Suy diễn Logistic & Giới hạn thay đổi bão hòa", 4),
    
    # Group 5: Hình học Oxyz & Chuyển động
    "CD-DuongThang-Oxyz.typ": ("Đường thẳng trong không gian Oxyz", 5),
    "CD-Oxyz-ChuyenDong-CamBien.typ": ("Chuyển động Oxyz & Tầm quét Cảm biến", 5),
    "CD-QuyDaoTron-KhoangCach.typ": ("Quỹ đạo tròn & Cực trị khoảng cách trong Oxyz", 5),
    "CD-min-max-DT-DuongTron.typ": ("Cực trị khoảng cách Đường thẳng & Đường tròn", 5),
    "min-đường-thẳng-đường-tròn.typ": ("Khoảng cách nhỏ nhất giữa đường thẳng & đường tròn phẳng", 5),
    "Parabol-Oxyz.typ": ("Đường Parabol trong không gian tọa độ Oxyz", 5),
    "Parabol-Oxyz-Có-Vận-Tốc.typ": ("Quỹ đạo Parabol có vận tốc trong Oxyz", 5),
    "Quả-Cầu-Di-Chuyển.typ": ("Quỹ đạo chuyển động của Quả cầu trong Oxyz", 5),
    "CD-MatCau.typ": ("Mặt cầu & Cực trị mặt cầu trong Oxyz", 5),
    "CD-Goc-Khoang-Cach.typ": ("Góc và khoảng cách trong tọa độ Oxyz", 5),
    "CD-HHKG.typ": ("Hình học không gian nâng cao (Thể tích & Góc)", 5),
    
    # Group 6: Đường Conic & Thiết diện
    "CD-Conic-DayDu.typ": ("Ba đường Conic đầy đủ (Elip, Parabol, Hyperbol)", 6),
    "CD-Conic-KhoiQuay.typ": ("Tích phân & Khối tròn xoay từ đường Conic", 6),
    "CD-Thiet-Dien-Parabol-Hinh-Non.typ": ("Thiết diện Parabol của hình nón", 6),
    "Dien-Tich-Conic-Ẩn.typ": ("Diện tích hình phẳng giới hạn bởi đường Conic ẩn", 6),
    "CD-Sự-Tiếp-Xúc-2-Đường-Cong.typ": ("Sự tiếp xúc của hai đường cong", 6),
    
    # Group 7: Mô hình hóa Vật lý & Thực tế
    "CD-Chim-Săn-Mồi.typ": ("Đường bay Chim săn mồi (Quỹ đạo parabol săn mồi)", 7),
    "Cánh-Tay-Robot.typ": ("Quỹ đạo quay & Tọa độ Cánh tay Robot trong Oxyz", 7),
    "Di-Chuyển-Qua-Nhiều-Môi-Trường-Có-Vận-Tốc.typ": ("Tối ưu hóa thời gian di chuyển qua nhiều môi trường (Snell)", 7),
    "CD-Treo-Vật.typ": ("Bài toán treo vật nặng (Cân bằng lực lượng giác)", 7),
    "CD-Vật-Chắn-Tầm-Nhìn.typ": ("Góc nhìn tối ưu & Bài toán vật chắn tầm nhìn", 7),
    "Cầu Bị Gió Thổi.typ": ("Xác suất chuyển động ngẫu nhiên: Cầu bị gió thổi", 7),
    "Đon-Bắt-Mục tiêu.typ": ("Tọa độ hóa bài toán săn bắt mục tiêu di động", 7),
    "Đánh-Trận-Có Vận Tốc.typ": ("Bài toán đánh trận có vận tốc di chuyển", 7),
    "CD-Hai-con-bo.typ": ("Bài toán Hai con bò (Tối ưu vị trí chăn thả)", 7),
    "CD-ChiPhi-An-VanToc.typ": ("Tối ưu hóa chi phí ẩn và vận tốc di chuyển", 7),
}

with open("/Users/admin/conictypst/scratch/extracted_questions_solutions_v5.json", "r", encoding="utf-8") as f:
    extracted = json.load(f)

missing_examples = []
missing_solutions = []
few_solutions = []
has_good = []

for filename, (title, g_id) in mapping.items():
    if filename not in extracted:
        missing_examples.append((filename, title))
        continue
    
    probs = extracted[filename]
    if not probs:
        missing_examples.append((filename, title))
        continue
        
    sols = [p for p in probs if p.get("solutions")]
    if not sols:
        missing_solutions.append((filename, title, len(probs)))
    elif len(sols) < len(probs):
        few_solutions.append((filename, title, len(probs), len(sols)))
    else:
        has_good.append((filename, title, len(probs), len(sols)))

print(f"Total topics mapped: {len(mapping)}")
print(f"Good coverage: {len(has_good)}")
print(f"Missing examples: {len(missing_examples)}")
for item in missing_examples:
    print(f"  - {item[0]}: {item[1]}")

print(f"Missing solutions: {len(missing_solutions)}")
for item in missing_solutions:
    print(f"  - {item[0]}: {item[1]} ({item[2]} qns)")

print(f"Partial solutions: {len(few_solutions)}")
for item in few_solutions:
    print(f"  - {item[0]}: {item[1]} ({item[2]} qns total, {item[3]} solved)")
