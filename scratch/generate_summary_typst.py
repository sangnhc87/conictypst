import json
import os
import re

classified_path = "/Users/admin/conictypst/scratch/classified_exams.json"
extracted_path = "/Users/admin/conictypst/scratch/extracted_questions_v3.json"
output_typst_path = "/Users/admin/conictypst/typst/exams/CD-TongHop-TatCa-ChuyenDe.typ"

# Load the files
with open(classified_path, "r", encoding="utf-8") as f:
    classified_data = json.load(f)

with open(extracted_path, "r", encoding="utf-8") as f:
    extracted_questions = json.load(f)

# Define the groups
groups = {
    1: "NHÓM 1: TỔ HỢP & ĐẾM NÂNG CAO (COMBINATORICS & COUNTING)",
    2: "NHÓM 2: XÁC SUẤT & MÔ HÌNH PHÂN NHÁNH (PROBABILITY & BRANCHING)",
    3: "NHÓM 3: HÀM SINH TRONG TỔ HỢP (GENERATING FUNCTIONS)",
    4: "NHÓM 4: GIẢI TÍCH, TÍCH PHÂN & TỐI ƯU HÓA (CALCULUS & OPTIMIZATION)",
    5: "NHÓM 5: HÌNH HỌC OXYZ & CHUYỂN ĐỘNG (SPACE GEOMETRY & MOTION)",
    6: "NHÓM 6: ĐƯỜNG CONIC & SỰ TIẾP XÚC ĐƯỜNG CONG (CONIC SECTIONS & TANGENCY)",
    7: "NHÓM 7: MÔ HÌNH HÓA VẬT LÝ & CƠ HỌC THỰC TẾ (PHYSICAL MODELING)"
}

category_mapping = {
    # Group 1: Tổ hợp & Đếm nâng cao
    "CD-DaiSo-ToHop-content.typ": ("Đại số Tổ hợp & Quy tắc đếm cơ bản", 1, "Tổng hợp kiến thức về nguyên lý cộng, nguyên lý nhân, hoán vị, chỉnh hợp, tổ hợp và phương pháp phân nhóm."),
    "CD-FSM-Dem-To-Hop.typ": ("Đếm Tổ hợp bằng Máy trạng thái hữu hạn (FSM)", 1, "Ứng dụng Máy trạng thái hữu hạn để đếm số chuỗi ký tự, chuỗi nhị phân có ràng buộc phức tạp."),
    "FSM.typ": ("Xây dựng Máy trạng thái hữu hạn FSM trong bài toán đếm", 1, "Chi tiết cách thiết lập các trạng thái và lập công thức truy hồi đếm chuỗi bằng FSM."),
    "Đếm-FSM-NxN.typ": ("Kỹ thuật đếm FSM trên bảng lưới vuông N x N", 1, "Đếm số cách sắp xếp các đối tượng trên lưới tọa độ vuông thỏa mãn điều kiện biên bằng FSM."),
    "CD-ToMau.typ": ("Bài toán Tô màu Bản đồ & Hàng ô vuông", 1, "Phương pháp đếm số cách tô màu các đỉnh của đa giác, các ô vuông liên tiếp sao cho hai ô kề nhau khác màu."),
    "FSM-To-Mau.typ": ("Đếm số cách tô màu sử dụng trạng thái FSM", 1, "Thiết lập mô hình trạng thái FSM để giải bài toán tô màu các hình phẳng phức tạp."),
    "Da-Giac-Deu.typ": ("Tổ hợp và Hình học trên Đa giác đều", 1, "Tính toán số tam giác, hình chữ nhật, đa giác con tạo bởi các đỉnh của đa giác đều."),
    "CD-Đếm Nâng Cao.typ": ("Các kỹ thuật đếm nâng cao và truy hồi", 1, "Các bài toán đếm mức độ vận dụng cao sử dụng hệ thức truy hồi tuyến tính."),
    
    # Group 2: Xác suất & Sơ đồ cây
    "CD-SoDoCay-XacSuat-TroChoi.typ": ("Sơ đồ cây & Xác suất trò chơi", 2, "Trực quan hóa các kịch bản thi đấu nhiều giai đoạn (có momentum, hồi sinh) bằng sơ đồ cây vector."),
    "Xác-Suât-Đối Kháng.typ": ("Xác suất đối kháng & Thi đấu luân lưu", 2, "Tính toán xác suất chiến thắng trong các trận đấu thể thao, loạt sút luân lưu với phong độ thay đổi."),
    "Sơ-Đồ-Cây-1-3-6.typ": ("Sơ đồ cây xác suất 1-3-6 (Phân nhánh động)", 2, "Mô hình phân nhánh xác suất với 3 kịch bản ở mỗi giai đoạn phát triển."),
    "Sơ-Đồ-Cây-2-4-8.typ": ("Sơ đồ cây xác suất 2-4-8 (Trò chơi phân nhánh)", 2, "Phân tích trò chơi có 3 lựa chọn với trọng số xác suất thay đổi theo thời gian."),
    "Xác-Suất-Bốc-Bi.typ": ("Bài toán bốc bi & Xác suất có điều kiện", 2, "Các bài toán bốc bi từ nhiều hộp, chuyển bi giữa các hộp và tính xác suất sau khi biết thông tin phụ."),
    "Gieo-Xúc-Sắc-Xác-Suất-Bốc-Bi.typ": ("Xác suất gieo xúc sắc kết hợp bốc bi", 2, "Mô hình xác suất liên kết giữa kết quả gieo xúc sắc và số lượng bi được rút ra từ các hộp."),
    "CD-Xac-Suất-Bayes-Tim-x.typ": ("Công thức xác suất Bayes và bài toán tìm x", 2, "Ứng dụng công thức xác suất đầy đủ và công thức Bayes để tìm các tham số chưa biết trong mô hình."),
    "CD-XacSuat-DieuKien-Gia.typ": ("Xác suất có điều kiện và mô hình giả thuyết", 2, "Giải quyết các bài toán xác suất thực tế phức tạp bằng phương pháp giả thuyết hóa các điều kiện biên."),
    "CD-XacSuat-DieuKien-PhanPhoi.typ": ("Xác suất có điều kiện trên phân phối vật vào hộp", 2, "Tính xác suất để các hộp thỏa mãn điều kiện nhất định khi phân phối ngẫu nhiên các quả cầu."),
    
    # Group 3: Hàm sinh trong Tổ hợp
    "CD-HamSinh-GeneratingFunction-content.typ": ("Hàm sinh trong Tổ hợp (Generating Functions)", 3, "Nền tảng lý thuyết về hàm sinh thường (OGF) và hàm sinh lũy thừa (EGF) trong toán rời rạc."),
    "CD-HamSinh-LoiBai-NangCao-content.typ": ("Giải bài toán đếm nâng cao bằng Hàm sinh (EGF)", 3, "Ứng dụng hàm sinh lũy thừa để giải quyết các bài toán đếm chuỗi ký tự có giới hạn tần suất xuất hiện."),
    "CD-Chia-Keo-Euler.typ": ("Chia kẹo Euler — Sao và Vạch & Đa thức sinh", 3, "Phương pháp Sao và Vạch cổ điển kết hợp với hàm sinh để đếm số nghiệm nguyên không âm."),
    "CD-PhanPhoi-4TruongHop.typ": ("Mô hình Phân phối vật vào hộp (4 Trường hợp)", 3, "Phân loại cách phân phối vật (phân biệt/giống nhau) vào hộp (phân biệt/giống nhau) sử dụng số Stirling."),
    "CD-ChuoiTrangThai-Markov.typ": ("Chuỗi trạng thái Markov & Xác suất đệ quy", 3, "Lập hệ phương trình tuyến tính tính xác suất thắng cuộc trong trò chơi lặp vô hạn dựa trên tính chất Markov."),
    
    # Group 4: Giải tích, Tích phân & Tối ưu hóa
    "CD-Kinh-Te-Tich-Phan.typ": ("Tích phân trong Kinh tế: Thặng dư CS & PS", 4, "Tính thặng dư tiêu dùng (CS) và thặng dư sản xuất (PS) tại điểm cân bằng cung cầu bằng tích phân."),
    "CD-TichPhan-TocDo-DoanhThu.typ": ("Tích phân tốc độ thay đổi & Doanh thu lũy tiến", 4, "Ứng dụng tích phân xác định tính tổng doanh thu lũy tích, chi phí khi biết hàm tốc độ thay đổi."),
    "CD-tich-Phan-đọc lạ.typ": ("Các bài toán tích phân độc lạ và nâng cao", 4, "Các dạng bài tích phân phi chuẩn, ứng dụng tính diện tích, thể tích các vật thể có biên phức tạp."),
    "CD-NangSuat-NhaMay-ToiUu.typ": ("Tối ưu hóa năng suất nhà máy (Hàm phân đoạn)", 4, "Tối ưu hóa chi phí và sản lượng nhà máy khi hàm sản xuất có sự thay đổi theo các phân đoạn."),
    "CD-ToiUu-KinhTe-DaDieuKien.typ": ("Tối ưu hóa kinh tế nhiều điều kiện ràng buộc", 4, "Tìm giá trị cực trị của hàm nhiều biến dưới các điều kiện ràng buộc kinh tế hoặc sản xuất."),
    "CD-Tang-Giam-LienTuc.typ": ("Mô hình tăng giảm liên tục & Cực trị", 4, "Khảo sát và tìm cực trị của các mô hình tăng trưởng liên tục hoặc suy giảm liên tục trong thực tế."),
    "CHủ Đề Thay Đổi Bảo Hoà.typ": ("Suy diễn Logistic & Giới hạn thay đổi bão hòa", 4, "Mô hình hóa sự phát triển theo hàm số Logistic và tìm điểm giới hạn bão hòa tối ưu."),
    
    # Group 5: Hình học Oxyz & Chuyển động
    "CD-DuongThang-Oxyz.typ": ("Đường thẳng trong không gian Oxyz", 5, "Khảo sát phương trình tham số, vị trí tương đối và các bài toán cực trị hình học liên quan đến đường thẳng."),
    "CD-Oxyz-ChuyenDong-CamBien.typ": ("Chuyển động Oxyz & Tầm quét Cảm biến", 5, "Mô hình hóa quỹ đạo chuyển động thẳng đều và tính khoảng cách đến trạm cảm biến cố định."),
    "CD-QuyDaoTron-KhoangCach.typ": ("Quỹ đạo tròn & Cực trị khoảng cách trong Oxyz", 5, "Tìm khoảng cách lớn nhất, nhỏ nhất từ một điểm trên đường tròn nghiêng đến một đường thẳng hoặc mặt phẳng."),
    "CD-min-max-DT-DuongTron.typ": ("Cực trị khoảng cách Đường thẳng & Đường tròn", 5, "Cực trị khoảng cách giữa điểm di động trên đường tròn và điểm di động trên đường thẳng."),
    "min-đường-thẳng-đường-tròn.typ": ("Khoảng cách nhỏ nhất giữa đường thẳng & đường tròn phẳng", 5, "Tìm khoảng cách cực trị trong hệ tọa độ phẳng Oxy."),
    "Parabol-Oxyz.typ": ("Đường Parabol trong không gian tọa độ Oxyz", 5, "Phương trình và tính chất của đường cong Parabol nằm trong một mặt phẳng nghiêng trong Oxyz."),
    "Parabol-Oxyz-Có-Vận-Tốc.typ": ("Quỹ đạo Parabol có vận tốc trong Oxyz", 5, "Quỹ đạo ném xiên của vật thể dưới tác dụng của trọng lực trong hệ tọa độ Oxyz."),
    "Quả-Cầu-Di-Chuyển.typ": ("Quỹ đạo chuyển động của Quả cầu trong Oxyz", 5, "Mô phỏng chuyển động của mặt cầu và tính khoảng cách tiếp xúc với các chướng ngại vật."),
    "CD-MatCau.typ": ("Mặt cầu & Cực trị mặt cầu trong Oxyz", 5, "Các bài toán tương giao giữa mặt cầu và đường thẳng, mặt phẳng và cực trị hình học Oxyz."),
    "CD-Goc-Khoang-Cach.typ": ("Góc và khoảng cách trong tọa độ Oxyz", 5, "Hệ thống công thức và bài tập tính góc giữa hai đường thẳng, hai mặt phẳng và khoảng cách."),
    "CD-HHKG.typ": ("Hình học không gian nâng cao (Thể tích & Góc)", 5, "Tính thể tích khối đa diện, khoảng cách và góc bằng phương pháp cổ điển kết hợp tọa độ hóa."),
    
    # Group 6: Đường Conic & Thiết diện
    "CD-Conic-DayDu.typ": ("Ba đường Conic đầy đủ (Elip, Parabol, Hyperbol)", 6, "Tổng ôn toàn diện về phương trình chính tắc, tiêu điểm, tiêu cự và tâm sai của ba đường Conic."),
    "CD-Conic-KhoiQuay.typ": ("Tích phân & Khối tròn xoay từ đường Conic", 6, "Tính thể tích nước trong bể hình Paraboloid hoặc Ellipsoid xoay tròn bằng tích phân phân lát."),
    "CD-Thiet-Dien-Parabol-Hinh-Non.typ": ("Thiết diện Parabol của hình nón", 6, "Thiết diện cắt bởi mặt phẳng song song với một đường sinh của hình nón là một Parabol. Tính diện tích thiết diện."),
    "Dien-Tich-Conic-Ẩn.typ": ("Diện tích hình phẳng giới hạn bởi đường Conic ẩn", 6, "Tính diện tích hình phẳng khi phương trình Conic chưa ở dạng chính tắc."),
    "CD-Sự-Tiếp-Xúc-2-Đường-Cong.typ": ("Sự tiếp xúc của hai đường cong", 6, "Điều kiện tiếp xúc (chung điểm và chung tiếp tuyến) của parabol, đường tròn, đường thẳng."),
    
    # Group 7: Mô hình hóa Vật lý & Thực tế
    "CD-Chim-Săn-Mồi.typ": ("Đường bay Chim săn mồi (Quỹ đạo parabol săn mồi)", 7, "Mô hình hóa đường bay của chim săn mồi theo parabol để tối thiểu hóa độ cao hoặc quãng đường bay."),
    "Cánh-Tay-Robot.typ": ("Quỹ đạo quay & Tọa độ Cánh tay Robot trong Oxyz", 7, "Tính toán tọa độ điểm đầu cuối của cánh tay robot nhiều khớp xoay trong không gian Oxyz."),
    "Di-Chuyển-Qua-Nhiều-Môi-Trường-Có-Vận-Tốc.typ": ("Tối ưu hóa thời gian di chuyển qua nhiều môi trường (Snell)", 7, "Tìm đường đi nhanh nhất giữa hai điểm khi đi qua các vùng có vận tốc khác nhau (Định luật khúc xạ Snell)."),
    "CD-Treo-Vật.typ": ("Bài toán treo vật nặng (Cân bằng lực lượng giác)", 7, "Tối ưu hóa lực căng dây treo bằng cách lập hàm số lượng giác và tìm cực trị."),
    "CD-Vật-Chắn-Tầm-Nhìn.typ": ("Góc nhìn tối ưu & Bài toán vật chắn tầm nhìn", 7, "Tìm vị trí đứng để có góc quan sát bảng hiệu quảng cáo lớn nhất khi bị vật cản che khuất."),
    "Cầu Bị Gió Thổi.typ": ("Xác suất chuyển động ngẫu nhiên: Cầu bị gió thổi", 7, "Tính xác suất quả cầu rơi trúng mục tiêu khi chịu ảnh hưởng của các lực cản ngẫu nhiên."),
    "Đon-Bắt-Mục tiêu.typ": ("Tọa độ hóa bài toán săn bắt mục tiêu di động", 7, "Radar quét mục tiêu và điều khiển thiết bị đánh chặn mục tiêu di động thẳng đều trong không gian."),
    "Đánh-Trận-Có Vận Tốc.typ": ("Bài toán đánh trận có vận tốc di chuyển", 7, "Tối ưu hóa thời điểm khai hỏa bắn hạ phương tiện di động dựa trên vận tốc đạn và xe đua."),
    "CD-Hai-con-bo.typ": ("Bài toán Hai con bò (Tối ưu vị trí chăn thả)", 7, "Tìm khoảng cách ngắn nhất để hai con bò di chuyển đến bờ sông uống nước rồi về chuồng."),
    "CD-ChiPhi-An-VanToc.typ": ("Tối ưu hóa chi phí ẩn và vận tốc di chuyển", 7, "Thiết lập hàm tổng chi phí gồm chi phí nhiên liệu và chi phí nhân công để tìm vận tốc tối ưu nhất."),
}

def clean_math_delimiters(text):
    # Replace markdown double asterisks ** with typst single asterisk *
    text = text.replace('**', '*')
    
    # Ensure that any '$' is balanced in the text.
    count = text.count('$')
    if count % 2 != 0:
        text += '$'
    
    # Balance brackets
    b_count = 0
    for char in text:
        if char == '[':
            b_count += 1
        elif char == ']':
            b_count -= 1
    if b_count > 0:
        text += ']' * b_count
    elif b_count < 0:
        text = '[' * (-b_count) + text
        
    return text

def strip_cetz(text):
    # Strip #cetz.canvas(...) blocks
    pos = 0
    while True:
        idx = text.find("#cetz.canvas", pos)
        if idx == -1:
            break
        
        # Find first opening punctuation
        start_char = None
        open_idx = -1
        for i in range(idx + len("#cetz.canvas"), len(text)):
            if text[i] in ['(', '[', '{']:
                start_char = text[i]
                open_idx = i
                break
        
        if open_idx == -1:
            pos = idx + len("#cetz.canvas")
            continue
            
        close_char = ')' if start_char == '(' else (']' if start_char == '[' else '}')
        count = 1
        j = open_idx + 1
        while j < len(text):
            if text[j] == start_char:
                count += 1
            elif text[j] == close_char:
                count -= 1
                if count == 0:
                    break
            j += 1
            
        # Cut the block out
        text = text[:idx] + text[j+1:]
        
    # Remove empty center alignments
    text = re.sub(r'#align\(center\)\[\s*\]', '', text)
    # Remove multiple line breaks
    text = re.sub(r'\n{3,}', '\n\n', text)
    return text.strip()

# Build the Typst document
out = []
out.append('#import "../sang-exam.typ": *')
out.append('#import "../template.typ": *')
out.append('#import "../sang-full.typ": *')
out.append('#import "@preview/cetz:0.5.2"')
out.append('')
out.append('// ═══════════════════════════════════════════════')
out.append('// CẤU HÌNH TRANG')
out.append('// ═══════════════════════════════════════════════')
out.append('#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))')
out.append('#set text(font: "New Computer Modern", size: 11pt, lang: "vi")')
out.append('#set par(justify: true, leading: 0.85em)')
out.append('#set list(indent: 1em, body-indent: 0.5em)')
out.append('#set enum(indent: 0.5em, body-indent: 0.5em)')
out.append('')
out.append('#show heading.where(level: 1): it => block(')
out.append('  width: 100%,')
out.append('  fill: gradient.linear(rgb("1A237E"), rgb("283593"), rgb("3F51B5"), angle: 135deg),')
out.append('  stroke: none,')
out.append('  inset: (x: 15pt, y: 11pt),')
out.append('  radius: 7pt,')
out.append('  above: 1.8em,')
out.append('  below: 1.2em,')
out.append('  text(fill: white, size: 14pt, weight: "bold", it.body),')
out.append(')')
out.append('#show heading.where(level: 2): it => block(')
out.append('  above: 1.5em,')
out.append('  below: 0.8em,')
out.append('  stroke: (left: 4pt + rgb("1A237E")),')
out.append('  inset: (left: 10pt, y: 5pt),')
out.append('  text(fill: rgb("1A237E"), size: 12pt, weight: "bold", it.body),')
out.append(')')
out.append('')
out.append('#let mode = "loigiai"')
out.append('#let accent = classic.blue')
out.append('#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)')
out.append('#show math.equation: set text(fill: rgb("#000000"))')
out.append('#show math.equation.where(block: false): math.display')
out.append('#show math.frac: math.display')
out.append('')
out.append('#let col-blue = rgb("1A237E")')
out.append('#let col-amber = rgb("E65100")')
out.append('#let col-green = rgb("2E7D32")')
out.append('#let col-teal = rgb("006064")')
out.append('#let col-purple = rgb("4A148C")')
out.append('')
out.append('#let eg-box(title: "🎯 Ví dụ minh họa", body) = block(')
out.append('  fill: rgb("FFF3E0"),')
out.append('  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFE0B2")),')
out.append('  radius: (right: 6pt),')
out.append('  inset: (x: 14pt, y: 11pt),')
out.append('  width: 100%,')
out.append(')[')
out.append('  #text(fill: col-amber, weight: "bold")[#title]')
out.append('  #v(0.3em)')
out.append('  #body')
out.append(']')
out.append('')
out.append('// ═══════════════════════════════════════════════')
out.append('// TRANG BÌA')
out.append('// ═══════════════════════════════════════════════')
out.append('#align(center)[')
out.append('  #block(')
out.append('    width: 100%,')
out.append('    fill: gradient.linear(rgb("0D47A1"), rgb("1565C0"), rgb("1E88E5"), rgb("42A5F5"), angle: 135deg),')
out.append('    inset: (x: 2cm, y: 1.8cm),')
out.append('    radius: 14pt,')
out.append('  )[')
out.append('    #text(fill: rgb("E3F2FD"), size: 11pt, weight: "bold", tracking: 2pt)[')
out.append('      BỘ TÀI LIỆU CHUYÊN SÂU HSG & ĐGNL')
out.append('    ]')
out.append('    #v(0.6em)')
out.append('    #text(fill: white, size: 22pt, weight: "black")[Hệ Thống Chuyên Đề & Ví Dụ Minh Họa]')
out.append('    #v(0.4em)')
out.append('    #text(fill: rgb("E3F2FD"), size: 14pt)[📚 Tổng hợp toàn bộ các dạng toán nâng cao, thực tế và liên môn]')
out.append('    #v(0.5em)')
out.append('    #text(fill: rgb("E3F2FD"), size: 11pt, style: "italic")[')
out.append('      "Tổng hợp đầy đủ các chuyên đề và ví dụ mẫu tiêu biểu giúp học sinh ôn tập và ghi nhớ cốt lõi"')
out.append('    ]')
out.append('  ]')
out.append(']')
out.append('')
out.append('#v(1.5em)')
out.append('#outline(title: "Mục Lục Hệ Thống Chuyên Đề", depth: 2, indent: 1.5em)')
out.append('#pagebreak()')
out.append('')

# Group files by group ID
grouped_files = {g_id: [] for g_id in groups.keys()}
for filename, (title, group_id, desc) in category_mapping.items():
    grouped_files[group_id].append((filename, title, desc))

# Sort topics alphabetically by title inside each group
for g_id in grouped_files:
    grouped_files[g_id].sort(key=lambda x: x[1])

# Generate the content for each group
for g_id, g_title in groups.items():
    out.append(f"= {g_title}")
    out.append("")
    
    topics = grouped_files[g_id]
    for idx, (filename, title, desc) in enumerate(topics, 1):
        out.append(f"== {idx}. {title} ({filename})")
        out.append(f"- *Ý tưởng chính:* {desc}")
        out.append("")
        
        # Add examples
        probs = extracted_questions.get(filename, [])
        if not probs:
            out.append("*(Chưa có ví dụ trích xuất)*")
            out.append("")
            continue
            
        for p_idx, p in enumerate(probs[:2], 1):
            q_text = strip_cetz(p['q'])
            q_text = clean_math_delimiters(q_text)
            
            ans_text = p.get('ans', '')
            
            # Escape strings if necessary, but here we write directly as content block
            out.append(f"#eg-box(title: \"🎯 Ví dụ mẫu {p_idx}\")[")
            out.append(f"  {q_text}")
            if ans_text:
                ans_clean = ans_text.replace('[', '').replace(']', '').strip()
                ans_clean = clean_math_delimiters(ans_clean)
                if ans_clean:
                    out.append("")
                    out.append(f"  *Đáp số:* {ans_clean}")
            out.append("]")
            out.append("")
        out.append("")

# Write to file
with open(output_typst_path, "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print(f"Generated summary typst file at {output_typst_path}")
