# -*- coding: utf-8 -*-

CONTENT = r'''= PHẦN PHỤ LỤC: MA TRẬN 40 CÂU HỎI KHAI MỞ SƯ PHẠM ĐỈNH CAO KHỐI 12

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành riêng cho Quý Thầy Cô giáo dạy lớp 12: Bảng tra cứu tốc hành 3 phút mở đầu tiết học. Mỗi bài học đều có một câu hỏi Hook kích nổ tư duy phản biện, giúp học sinh thoát khỏi chiếc bẫy làm đề trắc nghiệm cơ học để chạm tay vào bản chất tối thượng của Toán học trước ngưỡng cửa đại học.
]

#align(center)[
  #table(
    columns: (2.2cm, 4cm, 5.5cm, 4.3cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    // Header
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 9pt)[Bài học],
      text(fill: white, weight: "bold", size: 9pt)[Câu hỏi Hook đầu giờ (3 phút)],
      text(fill: white, weight: "bold", size: 9pt)[Bản chất nhận thức cốt lõi],
      text(fill: white, weight: "bold", size: 9pt)[Ứng dụng thực tế & Kỷ nguyên AI],
    ),
    
    // Rows
    [Bài 1: Đơn điệu & Cực trị], [Tại sao trên đỉnh ngọn núi mặt đất luôn nằm ngang phẳng lặng?], [Định lý Fermat: Điểm dừng $f'(x_0) = 0$ là điều kiện cần của cực đại và cực tiểu.], [Thuật toán Gradient Descent trong Deep Learning, tìm điểm tối ưu sai số.],
    [Bài 2: GTLN & GTNN], [Tại sao các công ty nước ngọt lại làm lon Coca có chiều cao gấp đôi đường kính?], [Tối ưu hóa hình học: Cân bằng giữa diện tích bề mặt (chi phí) và thể tích chứa đựng.], [Tiết kiệm hàng trăm triệu USD tiền vỏ nhôm trong sản xuất công nghiệp.],
    [Bài 3: Đường tiệm cận], [Tại sao dân số Trái Đất không thể tăng vọt vô hạn mà bị chặn lại bởi tiệm cận ngang?], [Tiệm cận ngang miêu tả hành vi bão hòa của thế giới tự nhiên khi thời gian tiến ra vô cùng.], [Mô hình Logistic trong dịch tễ học WHO, phân tích thị trường công nghệ bão hòa.],
    [Bài 4: Khảo sát đồ thị], [Làm thế nào một đường cong bậc ba hay phân thức dự báo được điểm sụp đổ tài chính?], [Tổng hợp toàn bộ tính đơn điệu, cực trị, tiệm cận thành bức tranh toàn cảnh trực quan.], [Đọc biểu đồ nến chứng khoán TradingView, đường cong cung cầu Marshall.],
    [Bài 5: Tọa độ điểm & vector], [René Descartes nhìn con ruồi trên trần nhà và thay đổi lịch sử nhân loại ra sao?], [Đại số hóa hình học không gian: Mỗi điểm là bộ 3 con số $(x, y, z)$ giải phóng tư duy.], [Hệ thống định vị toàn cầu GPS trên điện thoại di động thông minh.],
    [Bài 6: Phép toán vector Oxyz], [Tại sao vặn cờ lê nằm ngang lại sinh ra một lực vút thẳng ra ngoài không gian?], [Tích có hướng $arrow(a) times arrow(b)$ tạo ra vector pháp tuyến vuông góc cả hai vector ban đầu.], [Điều khiển cánh tay robot hàn laser 6 bậc tự do trong nhà máy Tesla.],
    [Bài 7: Khoảng biến thiên & Tứ phân vị], [Tại sao người biết bơi vẫn chết đuối ở khúc sông có độ sâu trung bình 1 mét?], [Đo độ chênh lệch giữa giá trị cực đoan và vùng phân tán trung tâm 50% dữ liệu.], [Phân tích sự biến động của giá vàng và tỷ giá ngoại tệ USD/VND.],
    [Bài 8: Phương sai & Độ lệch chuẩn], [Hai quỹ đầu tư cùng lãi 15%/năm, tại sao một quỹ lại đẩy nhà đầu tư vào bệnh viện?], [Độ lệch chuẩn là thước đo mức độ rủi ro, sự chao đảo và bất ổn của hệ thống.], [Lý thuyết danh mục đầu tư đạt giải Nobel của Harry Markowitz, Z-Score AI.],
    [Bài 9: Nguyên hàm cơ bản], [Làm thế nào đảo ngược lại thời gian để tìm hàm số ban đầu khi chỉ biết tốc độ biến thiên?], [Phép toán nghịch đảo của đạo hàm: Truy nguyên cội nguồn từ sự thay đổi vi mô.], [Xác định vận tốc từ gia tốc trong các hộp đen ghi dữ liệu máy bay rơi.],
    [Bài 10: Tích phân & Định lý cơ bản], [Tại sao diện tích một hình cong ngoằn ngoèo lại bằng hiệu số hai đầu mút $F(b) - F(a)$?], [Cây cầu nối vĩ đại hợp nhất Đạo hàm và Tích phân của Newton và Leibniz.], [Tính công phóng con tàu vũ trụ SpaceX Starship vượt thắng lực hấp dẫn Trái Đất.],
    [Bài 11: Ứng dụng tích phân], [Vụ kiện thùng rượu vang đám cưới của Kepler đã khai sinh tích phân thể tích ra sao?], [Cắt khối tròn xoay thành vô hạn chiếc đĩa tròn siêu mỏng rồi cộng dồn lại.], [Tính dung tích bình chứa xăng máy bay, thể tích tim thai nhi trong siêu âm 3D.],
    [Bài 12: Phương trình mặt phẳng], [Kính Apple Vision Pro làm sao nhận diện được mặt bàn để đặt màn hình ảo lên?], [Mặt phẳng được xác định duy nhất bởi một điểm và một vector pháp tuyến $arrow(n)$.], [Cảm biến LiDAR quét không gian 3D, kiến trúc xây dựng nhà thông minh.],
    [Bài 13: Phương trình đường thẳng], [Thuật toán game CS:GO làm sao biết viên đạn bắn tỉa bay trúng đầu đối thủ từ xa?], [Đường thẳng tham số theo thời gian $t$: Mô hình hóa đường bay của mọi vật thể trong không gian.], [Dẫn đường tên lửa hành trình Tomahawk, đồ họa máy tính Unreal Engine 5.],
    [Bài 14: Phương trình mặt cầu], [Làm thế nào 4 quả cầu vệ tinh GPS giao nhau tìm ra vị trí chính xác của chiếc điện thoại?], [Mặt cầu là quỹ tích các điểm cách đều tâm; phương trình bậc hai không gian.], [Kiểm tra vùng an toàn của radar phòng không, tính toán quỹ đạo vệ tinh viễn thông.],
    [Bài 15: Xác suất có điều kiện], [Nghịch lý Gameshow Monty Hall: Tại sao đổi sang cánh cửa mới lại tăng gấp đôi cơ hội thắng?], [Cập nhật không gian mẫu khi có thêm thông tin thực tế xuất hiện.], [Thuật toán cờ vua AI Stockfish, chiến lược đàm phán kinh doanh quốc tế.],
    [Bài 16: Công thức Bayes], [Trí tuệ nhân tạo AlphaGo tự học cờ vây và đánh bại nhà vô địch thế giới bằng cách nào?], [Học hỏi liên tục: Chuyển đổi từ niềm tin tiên nghiệm sang xác suất hậu nghiệm.], [Học tăng cường (Reinforcement Learning), xe tự hành Tesla né vật cản trong mưa bão.],
    [CĐ 1: Bài toán tối ưu hóa], [Thuật toán Đơn pha của George Dantzig đã cứu sống 2 triệu người Tây Berlin thế nào?], [Quy hoạch tuyến tính tìm cực trị trên miền đa diện lồi nhiều chiều.], [Tối ưu hóa logistics điều phối hàng triệu kiện hàng Shopee và Amazon.],
    [CĐ 2: Toán học tài chính], [Vay 1 tỷ mua nhà trả góp trong 20 năm: Làm sao tính chính xác số tiền trả mỗi tháng?], [Dòng tiền chiết khấu, giá trị hiện tại của niên kim và lãi suất kép.], [Lập kế hoạch tài chính cá nhân, quản trị nợ thẻ tín dụng, xây dựng quỹ hưu trí.],
    [CĐ 3: Six Sigma bán dẫn], [Làm thế nào tập đoàn TSMC sản xuất chip 3nm với tỷ lệ lỗi chỉ 3,4 lỗi trên 1 triệu sản phẩm?], [Phân bố chuẩn Gauss và tiêu chuẩn chất lượng khắt khe Six Sigma $6 sigma$.], [Công nghiệp bán dẫn chế tạo chip iPhone, sản xuất vaccine y tế chuẩn quốc tế.],
  )
]

#pagebreak()

= ĐỐI THOẠI SOCRATES MẪU: 3 TÌNH HUỐNG SƯ PHẠM KÍCH NỔ TƯ DUY TỰ HỌC 12

Thay vì thuyết giảng một chiều, người thầy vĩ đại là người biết đặt những câu hỏi liên hoàn theo *Phương pháp Đối thoại Socrates (Socratic Method)* để dẫn dắt học sinh tự mình nhận ra chân lý:

#block(stroke: 0.5pt + rgb("cbd5e1"), radius: 6pt, fill: rgb("f8fafc"), inset: 12pt)[
  #text(weight: "bold", fill: rgb("1e3a8a"))[Tình huống 1: Dẫn dắt khái niệm Điểm Dừng Đạo hàm ($f'(x_0) = 0$)]\
  - *Thầy:* "Nếu các em đang leo lên đỉnh một ngọn đồi dốc đứng, độ dốc mặt đất đang dương hay âm?"\
  - *Trò:* "Dạ dương ạ, vì càng đi càng lên cao!"\
  - *Thầy:* "Khi các em trượt xuống sườn đồi bên kia, độ dốc thế nào?"\
  - *Trò:* "Dạ âm ạ, vì độ cao bị tụt xuống!"\
  - *Thầy:* "Vậy ngay tại khoảnh khắc chân các em chạm vào ĐỈNH CAO NHẤT của ngọn đồi, trước khi bước xuống, độ dốc của mặt đất bằng bao nhiêu?"\
  - *Trò:* "Dạ... nó không dốc lên, cũng không dốc xuống... nó phải nằm ngang phẳng lặng, tức là độ dốc bằng 0 ạ!"\
  - *Thầy:* "Chính xác! Và độ dốc đó chính là ĐẠO HÀM! Đó là lý do tại sao tại điểm cực đại, đạo hàm bắt buộc phải bằng 0!"
]

#v(8pt)

#block(stroke: 0.5pt + rgb("cbd5e1"), radius: 6pt, fill: rgb("f8fafc"), inset: 12pt)[
  #text(weight: "bold", fill: rgb("1e3a8a"))[Tình huống 2: Dẫn dắt sự khác biệt giữa Tích phân và Diện tích]\
  - *Thầy:* "Nếu một chiếc ca nô chạy xuôi dòng với vận tốc $+20 "km/h"$ trong 1 giờ, quãng đường đi được là bao nhiêu?"\
  - *Trò:* "Dạ $+20 "km"$ ạ!"\
  - *Thầy:* "Sau đó ca nô quay đầu chạy ngược dòng với vận tốc $-20 "km/h"$ trong 1 giờ. Vị trí cuối cùng của ca nô cách điểm xuất phát bao xa?"\
  - *Trò:* "Dạ nó quay về đúng điểm xuất phát ban đầu, độ dịch chuyển bằng $0$ ạ!"\
  - *Thầy:* "Nhưng đồng hồ công-tơ-mét đo lượng xăng đã tiêu tốn cho bao nhiêu km thực tế?"\
  - *Trò:* "Dạ ca nô đã chạy tổng cộng $20 + 20 = 40 "km"$ đường sông ạ!"\
  - *Thầy:* "Tuyệt vời! Con số $0$ chính là TÍCH PHÂN CỦA VẬN TỐC ($integral v d t = 0$), còn con số $40$ chính là DIỆN TÍCH HÌNH PHẲNG ($integral |v| d t = 40$)! Tích phân có dấu âm dấu dương triệt tiêu lẫn nhau, còn diện tích hình học luôn luôn dương tuyệt đối!"
]

#v(8pt)

#block(stroke: 0.5pt + rgb("cbd5e1"), radius: 6pt, fill: rgb("f8fafc"), inset: 12pt)[
  #text(weight: "bold", fill: rgb("1e3a8a"))[Tình huống 4: Dẫn dắt Khái niệm Tiệm Cận Đứng và Tiệm Cận Ngang]\
  - *Thầy:* "Nếu các em đun một tách cà phê sôi $100^circle upright(C)$ rồi đặt vào căn phòng máy lạnh $25^circle upright(C)$, nhiệt độ tách cà phê sẽ thay đổi thế nào sau 1 giờ, 5 giờ, 1 tuần?"\
  - *Trò:* "Dạ nó sẽ nguội dần về $25^circle upright(C)$ và giữ nguyên ở đó, không thể nào tự tụt xuống $0^circle upright(C)$ hay âm độ được ạ!"\
  - *Thầy:* "Đúng thế! Đường thẳng $y = 25$ chính là TIỆM CẬN NGANG! Nó miêu tả trạng thái cân bằng bền vững của tự nhiên khi thời gian $t -> +infinity$."\
  - *Trò:* "Thế còn Tiệm cận đứng thì sao hở thầy?"\
  - *Thầy:* "Hãy tưởng tượng một phi thuyền tăng tốc tiệm cận vận tốc ánh sáng $c$. Theo Einstein, khối lượng phi thuyền $m = m_0 / sqrt(1 - v^2/c^2)$. Khi vận tốc $v$ tiến sát sạt đến $c$, mẫu số tiến về $0$, khối lượng $m$ vọt lên vô cực! Bạn cần năng lượng của cả vũ trụ mới đẩy nó vượt qua được $c$! Đường thẳng $v = c$ chính là TIỆM CẬN ĐỨNG — bức tường thành bất khả xâm phạm của tự nhiên!"
]

#v(8pt)

#block(stroke: 0.5pt + rgb("cbd5e1"), radius: 6pt, fill: rgb("f8fafc"), inset: 12pt)[
  #text(weight: "bold", fill: rgb("1e3a8a"))[Tình huống 5: Dẫn dắt Sức mạnh của Công thức Bayes trong Y học]\
  - *Thầy:* "Giả sử có một căn bệnh lạ trong thành phố với tỷ lệ mắc chỉ là $1 / 1000$. Bệnh viện có một bộ kit xét nghiệm cực kỳ tối tân với độ chính xác $99\%$. Nếu em đi xét nghiệm và bác sĩ báo: 'Kết quả Dương tính!', xác suất thực sự em bị bệnh là bao nhiêu? Có phải $99\%$ không?"\
  - *Trò:* "Dạ máy chính xác $99\%$ thì em chắc chắn bị bệnh $99\%$ rồi thầy, sợ quá!"\
  - *Thầy:* "Bình tĩnh nào! Hãy cùng tính theo xác suất Bayes 12: Trong $100.000$ người, chỉ có $100$ người thực sự có bệnh, và $99.900$ người khỏe mạnh. Bộ kit xét nghiệm $100$ người bệnh sẽ báo dương tính $99$ người. Nhưng trong $99.900$ người khỏe mạnh, với sai số $1\%$, nó sẽ báo DƯƠNG TÍNH GIẢ tới gần $1.000$ người! Vậy trong tổng số khoảng $1.100$ người nhận kết quả dương tính, chỉ có $99$ người thực sự có bệnh! Xác suất thực sự em có bệnh chỉ là $99 / 1100 approx 9\%$ mà thôi!"\
  - *Trò:* "Trời ơi! Từ $99\%$ tụt xuống chỉ còn $9\%$! Toán học xác suất Bayes vừa cứu em khỏi cơn đau tim vì sợ hãi!"
]

#pagebreak()

= BÀI BÁO NGHIÊN CỨU MẪU SỐ 1: TỐI ƯU HÓA ĐÈN TÍN HIỆU GIAO THÔNG

#align(center)[
  #text(size: 13pt, weight: "bold", fill: rgb("1e1b4b"))[
    MÔ HÌNH HÓA TOÁN HỌC VÀ TỐI ƯU HÓA CHU KỲ ĐÈN GIAO THÔNG TẠI MỘT NGÃ TƯ ĐÔ THỊ BẰNG VI TÍCH PHÂN & MÔ PHỎNG PYTHON
  ]
  
  #v(4pt)
  #text(size: 10pt, style: "italic", fill: rgb("64748b"))[
    Nhóm Nghiên cứu Trẻ: Học sinh Lớp 12 Chuyên Toán — Hướng dẫn: Thầy Cô Tổ Toán THPT
  ]
]

#v(0.5cm)

== 1. TÓM TẮT ĐỀ TÀI (ABSTRACT)
Ùn tắc giao thông tại các ngã tư đô thị lớn (như Hà Nội và TP.HCM) gây lãng phí hàng nghìn tỷ đồng nhiên liệu và hàng triệu giờ lao động mỗi năm. Đề tài này ứng dụng phép tính Đạo hàm và Tích phân lớp 12 để xây dựng mô hình toán học giải tích xác định chu kỳ đèn tín hiệu tối ưu $T$ (thời gian đèn xanh $g$ và đèn đỏ $r$), nhằm tối thiểu hóa tổng thời gian chờ đợi của tất cả các phương tiện trong giờ cao điểm. Kết quả lý thuyết được kiểm chứng bằng mô phỏng số trên ngôn ngữ Python.

== 2. MÔ HÌNH TOÁN HỌC (MATHEMATICAL FORMULATION)
Xét một làn đường tại ngã tư có:
- Lưu lượng dòng xe đến ngã tư theo thời gian là hàm $q(t)$ (xe/giây).
- Năng lực thông hành tối đa khi đèn xanh bật sáng là hằng số bão hòa $s$ (xe/giây, thường $s approx 0.5$ xe/giây).
- Chu kỳ đèn tín hiệu gồm thời gian đèn đỏ $r$ và đèn xanh $g$ ($T = r + g$).

1. *Số lượng xe tích lũy chờ đợi trong pha đèn đỏ ($0 <= t <= r$):*
$ Q(t) = integral_0^t q(tau) d tau $

2. *Tổng thời gian chậm trễ tích lũy của toàn bộ các xe trong một chu kỳ (Delay $D$):*
$ D = integral_0^r Q(t) d t + integral_r^(r + t_0) [Q(r) - (s - q)(t - r)] d t $

Áp dụng công thức tính diện tích hình phẳng tích phân (Công thức Webster nổi tiếng trong kỹ thuật giao thông):
$ d = (c (1 - lambda)^2) / (2 (1 - lambda x)) + x^2 / (2 q (1 - x)) $
Trong đó $lambda = g / T$ là tỷ lệ thời gian đèn xanh, $x = q / (s lambda)$ là mức độ bão hòa.

3. *Tìm chu kỳ đèn tối ưu bằng Đạo hàm cực trị:*
Lấy đạo hàm của tổng độ trễ theo chu kỳ $T$ và giải phương trình điểm dừng $(d D) / (d T) = 0$, ta thu được *Công thức Webster Tối ưu*:
$ T_("opt") = (1.5 L + 5) / (1 - sum y_i) $
Trong đó $L$ là tổng thời gian mất mát (đèn vàng và khởi động), $y_i = q_i / s_i$ là tỷ số lưu lượng của các nhánh giao cắt.

== 3. MÃ NGUỒN MÔ PHỎNG PYTHON KIỂM CHỨNG (20 DÒNG CODE)
```python
import numpy as np

def calculate_traffic_delay(cycle_T, q_flow, s_sat, L_lost):
    # q_flow: lưu lượng xe đến (xe/h), s_sat: lưu lượng bão hòa
    g_green = cycle_T - L_lost
    lambda_ratio = g_green / cycle_T
    x_sat = q_flow / (s_sat * lambda_ratio)
    if x_sat >= 1.0:
        return float('inf') # Tắc nghẽn bùng nổ
    delay = (cycle_T * (1 - lambda_ratio)**2) / (2 * (1 - lambda_ratio * x_sat))
    return delay

# Khảo sát tìm chu kỳ T tối ưu từ 30s đến 120s
cycles = np.linspace(35, 120, 86)
delays = [calculate_traffic_delay(T, q_flow=800, s_sat=1800, L_lost=10) for T in cycles]
best_T = cycles[np.argmin(delays)]
print(f"Chu kỳ đèn tối ưu giảm thiểu ùn tắc: T = {best_T:.1f} giây")
```

== 4. KẾT LUẬN & ĐỀ XUẤT CHÍNH SÁCH
Mô hình chứng minh rằng: Vào giờ cao điểm, việc kéo dài chu kỳ đèn lên $75 - 90$ giây giúp giảm tới $34\%$ tổng thời gian chờ so với việc để chu kỳ ngắn $40$ giây (do giảm bớt tỷ lệ thời gian mất mát đèn vàng). Học sinh THPT hoàn toàn có thể dùng kiến thức Toán 12 để đóng góp giải pháp thiết thực cho những vấn nạn lớn của xã hội!

#pagebreak()

= BÀI BÁO NGHIÊN CỨU MẪU SỐ 2: ĐO LƯỜNG RỦI RO TÀI CHÍNH BẰNG ĐỘ LỆCH CHUẨN & VALUE-AT-RISK (VaR)

#align(center)[
  #text(size: 13pt, weight: "bold", fill: rgb("1e1b4b"))[
    ỨNG DỤNG PHƯƠNG SAI, ĐỘ LỆCH CHUẨN VÀ PHÂN PHỐI XÁC SUẤT ĐỂ ĐỊNH LƯỢNG RỦI RO DANH MỤC ĐẦU TƯ VN30 BẰNG CHỈ SỐ VALUE-AT-RISK (VaR)
  ]
  
  #v(4pt)
  #text(size: 10pt, style: "italic", fill: rgb("64748b"))[
    Nhóm Nghiên cứu Trẻ: Học sinh Lớp 12 Khối Tự Nhiên & Kinh Tế — Hướng dẫn: Thầy Cô Tổ Toán
  ]
]

#v(0.5cm)

== 1. TÓM TẮT ĐỀ TÀI (ABSTRACT)
Trong đầu tư tài chính hiện đại, lợi nhuận luôn song hành cùng rủi ro. Nghiên cứu này vận dụng trực tiếp các kiến thức Thống kê Toán 12 (Kỳ vọng, Phương sai, Độ lệch chuẩn ghép nhóm và Phân bố chuẩn Gauss) để xây dựng mô hình định lượng rủi ro *Value-at-Risk (VaR)* cho một danh mục cổ phiếu thuộc chỉ số VN30. Nghiên cứu cung cấp công cụ toán học giúp nhà đầu tư cá nhân biết chính xác: "Với độ tin cậy $95\%$, số tiền tối đa danh mục có thể bị sụt giảm trong một ngày giao dịch là bao nhiêu?".

== 2. CƠ SỞ TOÁN HỌC & CÔNG THỨC ĐỊNH LƯỢNG (MATHEMATICAL FRAMEWORK)
1. *Tỷ suất sinh lời logarit hàng ngày ($R_t$):*
$ R_t = ln(P_t / P_(t-1)) $
Trong đó $P_t$ là giá đóng cửa phiên hôm nay, $P_(t-1)$ là giá đóng cửa phiên hôm qua.

2. *Kỳ vọng ($mu$) và Phương sai mẫu ($s^2$), Độ lệch chuẩn ($s$):*
$ mu = 1/N sum_(t=1)^N R_t, quad s^2 = 1/(N - 1) sum_(t=1)^N (R_t - mu)^2, quad s = sqrt(s^2) $
Độ lệch chuẩn $s$ phản ánh trực tiếp *Mức độ biến động (Volatility)* của tài sản.

3. *Xác định Giá trị Rủi ro (Parametric Value-at-Risk - VaR):*
Giả định tỷ suất sinh lời tuân theo phân bố chuẩn $cal(N)(mu, s^2)$. Giá trị tổn thất tối đa ở mức ý nghĩa $alpha$ (độ tin cậy $1 - alpha$):
$ "VaR"_(1 - alpha) = - (mu - z_(alpha) dot s) dot V_0 $
Trong đó:
- $V_0$ là tổng giá trị danh mục đầu tư ban đầu (ví dụ: $100.000.000$ VNĐ).
- $z_(alpha)$ là giá trị tới hạn chuẩn tắc ($z_(0.05) = 1.645$ cho độ tin cậy $95\%$, $z_(0.01) = 2.326$ cho độ tin cậy $99\%$).

== 3. MÃ NGUỒN PYTHON THỰC NGHIỆM TRÊN DỮ LIỆU THỰC TẾ
```python
import numpy as np

def calculate_portfolio_var(returns, portfolio_value, confidence_level=0.95):
    # returns: mảng tỷ suất sinh lời hàng ngày
    mu = np.mean(returns)
    sigma = np.std(returns, ddof=1) # Độ lệch chuẩn hiệu chỉnh
    
    # Giá trị phân vị chuẩn tắc z
    z_scores = {0.90: 1.282, 0.95: 1.645, 0.99: 2.326}
    z = z_scores.get(confidence_level, 1.645)
    
    # Tính VaR theo tỷ lệ phần trăm và theo số tiền thực
    var_percent = z * sigma - mu
    var_amount = portfolio_value * var_percent
    return mu, sigma, var_amount

# Dữ liệu mô phỏng 250 ngày giao dịch của một rổ cổ phiếu VN30
np.random.seed(42)
daily_returns = np.random.normal(loc=0.0005, scale=0.018, size=250)
V_capital = 100_000_000 # 100 triệu đồng vốn đầu tư

mu, sigma, var_95 = calculate_portfolio_var(daily_returns, V_capital, 0.95)
print(f"Lợi nhuận bình quân ngày: {mu*100:.3f}%")
print(f"Độ lệch chuẩn (Biến động): {sigma*100:.2f}%")
print(f"Value-at-Risk (95% tin cậy): {var_95:,.0f} VNĐ")
```

== 4. KẾT QUẢ & Ý NGHĨA KINH TẾ
Kết quả chỉ ra rằng: Với số vốn $100$ triệu VNĐ, ở độ tin cậy $95\%$, nhà đầu tư có thể an tâm rằng trong một ngày thị trường biến động bình thường, mức lỗ tối đa sẽ không vượt quá $2.910.000$ VNĐ. Nếu mức lỗ vượt quá ngưỡng VaR này, hệ thống cảnh báo sớm rủi ro (Risk Management Alert) sẽ lập tức kích hoạt lệnh cắt lỗ để bảo vệ an toàn tài chính. Đây chính là toán học ứng dụng trực tiếp vào quản trị tài sản cá nhân!

#pagebreak()

= BÀI BÁO NGHIÊN CỨU MẪU SỐ 3: THUẬT TOÁN ĐỊNH VỊ 3D & BẮT BÁM RADAR TRONG KHÔNG GIAN OXYZ

#align(center)[
  #text(size: 13pt, weight: "bold", fill: rgb("1e1b4b"))[
    XÂY DỰNG THUẬT TOÁN ĐỊNH VỊ 3D VÀ BẮT BÁM ĐỐI TƯỢNG BAY BẰNG HỆ TỌA ĐỘ OXYZ, TÍCH VÔ HƯỚNG VÀ BỘ LỌC DỰ BÁO TUYẾN TÍNH
  ]
  
  #v(4pt)
  #text(size: 10pt, style: "italic", fill: rgb("64748b"))[
    Nhóm Nghiên cứu Trẻ: Học sinh Lớp 12 Yêu Thích Kỹ Thuật Hàng Không & Quốc Phòng
  ]
]

#v(0.5cm)

== 1. TÓM TẮT ĐỀ TÀI (ABSTRACT)
Các hệ thống phòng không hiện đại (như Iron Dome, Patriot hay S-400) đòi hỏi khả năng phát hiện, định vị và tính toán quỹ đạo đánh chặn tên lửa hoặc máy bay không người lái (UAV) đối phương chỉ trong vài phần trăm giây. Đề tài này ứng dụng toàn bộ công cụ Hình học không gian $O x y z$ lớp 12 (Phương trình mặt cầu, Phương trình đường thẳng tham số, Tích có hướng, và Khoảng cách giữa hai đường thẳng chéo nhau) để xây dựng thuật toán giải tích tự động tính toán điểm va chạm đánh chặn tối ưu của tên lửa phòng thủ.

== 2. MÔ HÌNH HÌNH HỌC KHÔNG GIAN OXYZ (GEOMETRIC FORMULATION)
1. *Mô hình hóa Trạm Radar & Mục tiêu bay:*
- Đặt trạm radar cố định tại gốc tọa độ $O(0, 0, 0)$.
- Mục tiêu bay di chuyển theo quỹ đạo đường thẳng tham số trong không gian:
$ d_1: cases(x_1(t) = x_0 + v_(1 x) t, y_1(t) = y_0 + v_(1 y) t, z_1(t) = z_0 + v_(1 z) t) $
với vector chỉ phương vận tốc $arrow(v)_1 = (v_(1 x), v_(1 y), v_(1 z))$.

2. *Khoảng cách từ Radar đến mục tiêu tại thời điểm $t$ (Phương trình Mặt cầu):*
$ R(t) = sqrt(x_1(t)^2 + y_1(t)^2 + z_1(t)^2) $
Mục tiêu lọt vào tầm quét radar khi $R(t) <= R_("max")$.

3. *Thiết lập Quỹ đạo Đánh chặn của Tên lửa Phòng thủ:*
Bệ phóng tên lửa đặt tại vị trí $B(x_B, y_B, z_B)$. Tên lửa được phóng đi tại thời điểm $t_0$ với tốc độ không đổi $V_2 = |arrow(v)_2|$.
Để đánh chặn thành công tại thời điểm $t_c > t_0$, vị trí của tên lửa và mục tiêu phải trùng khớp:
$ arrow(r)_1(t_c) = arrow(r)_B + arrow(v)_2 dot (t_c - t_0) $
Lấy độ dài hai vế:
$ |arrow(r)_1(t_c) - arrow(r)_B|^2 = V_2^2 dot (t_c - t_0)^2 $
Đây là một *phương trình bậc hai theo thời gian $t_c$*:
$ A t_c^2 + B t_c + C = 0 $
Nghiệm dương nhỏ nhất $t_c > t_0$ chính là thời điểm đánh chặn tối ưu!

4. *Góc đón tối ưu bằng Tích vô hướng:*
Góc phóng $theta$ của tên lửa được xác định qua tích vô hướng của vector vận tốc tên lửa $arrow(v)_2$ và trục ngắm $arrow(k)$:
$ cos theta = (arrow(v)_2 dot arrow(k)) / (|arrow(v)_2| dot |arrow(k)|) $

== 3. MÃ NGUỒN PYTHON MÔ PHỎNG ĐÁNH CHẶN 3D
```python
import numpy as np

def solve_interception(target_pos, target_vel, launcher_pos, missile_speed):
    # r0: vị trí ban đầu mục tiêu, v1: vận tốc mục tiêu, rB: bệ phóng
    r0 = np.array(target_pos)
    v1 = np.array(target_vel)
    rB = np.array(launcher_pos)
    
    # Delta r = r0 - rB
    dr = r0 - rB
    
    # Phương trình bậc hai: A*t^2 + B*t + C = 0
    A = np.dot(v1, v1) - missile_speed**2
    B = 2 * np.dot(dr, v1)
    C = np.dot(dr, dr)
    
    delta = B**2 - 4 * A * C
    if delta < 0:
        return None, "Không thể đánh chặn (Tên lửa không đủ tốc độ)"
    
    t1 = (-B - np.sqrt(delta)) / (2 * A)
    t2 = (-B + np.sqrt(delta)) / (2 * A)
    times = [t for t in [t1, t2] if t > 0]
    if not times:
        return None, "Mục tiêu đã bay ra khỏi tầm với"
    
    t_intercept = min(times)
    impact_point = r0 + v1 * t_intercept
    missile_vel = (impact_point - rB) / t_intercept
    return t_intercept, impact_point, missile_vel

# Giả lập: Mục tiêu UAV bay ở độ cao 2000m hướng về phía trạm
t_c, pt, v_m = solve_interception(
    target_pos=[5000, 4000, 2000],
    target_vel=[-200, -150, 0],
    launcher_pos=[0, 0, 0],
    missile_speed=600 # m/s
)
print(f"Thời gian đánh chặn: {t_c:.2f} giây")
print(f"Tọa độ đánh chặn Oxyz: ({pt[0]:.1f}, {pt[1]:.1f}, {pt[2]:.1f}) mét")
```

== 4. KẾT LUẬN & TRIỂN VỌNG
Hình học giải tích không gian không phải là các hình vẽ trừu tượng trên giấy thi. Nó là hệ điều hành hình học thời gian thực của toàn bộ nền công nghiệp quốc phòng, hàng không vũ trụ và robot tự hành!

#pagebreak()

= BẢN ĐỒ 20 ĐỀ TÀI NGHIÊN CỨU KHOA HỌC GỢI Ý CHO CUỘC THI VISEF & ISEF QUỐC TẾ (DỰA TRÊN TOÁN 12)

Dành cho các nhóm học sinh và giáo viên muốn xây dựng đề tài dự thi Cuộc thi Khoa học Kỹ thuật các cấp (ViSEF cấp Quốc gia và ISEF Quốc tế):

#align(center)[
  #table(
    columns: (1.2cm, 4.5cm, 4.2cm, 6.1cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 8.5pt)[STT],
      text(fill: white, weight: "bold", size: 8.5pt)[Tên Đề Tài Nghiên Cứu],
      text(fill: white, weight: "bold", size: 8.5pt)[Công Cụ Toán 12 Chủ Đạo],
      text(fill: white, weight: "bold", size: 8.5pt)[Dữ Liệu & Ứng Dụng Thực Tiễn],
    ),
    [1], [Tối ưu hóa thể tích đóng gói hàng thùng carton của sàn TMĐT], [Đạo hàm cực trị đa biến, Khảo sát hàm số], [Thu thập kích thước 500 mặt hàng Shopee, tiết kiệm $15\%$ chi phí bìa carton.],
    [2], [Định lượng mức độ biến động chất lượng không khí AQI tại Hà Nội], [Phương sai, Độ lệch chuẩn, Phân bố Gauss], [Dữ liệu trạm quan trắc US Embassy và Pam Air trong 365 ngày.],
    [3], [Mô phỏng đường cong dịch bệnh sốt xuất huyết theo mùa], [Đường tiệm cận, Phương trình vi phân Logistic], [Dữ liệu dịch tễ học Sở Y tế, dự báo đỉnh dịch để phun thuốc diệt muỗi.],
    [4], [Dự báo tải điện lưới giờ cao điểm mùa nắng nóng], [Tích phân xác định diện tích tiêu thụ năng lượng], [Số liệu công tơ điện tử EVN, tối ưu phân phối tải nhà máy điện mặt trời.],
    [5], [Định vị 3D vị trí rò rỉ đường ống nước sạch ngầm đô thị], [Hình học không gian Oxyz, Tích vô hướng], [Dữ liệu cảm biến sóng âm hydrophone gắn tại 3 hố ga ngã ba.],
    [6], [Xây dựng bộ lọc thư rác và tin nhắn lừa đảo SMS tiếng Việt], [Công thức xác suất Bayes có điều kiện], [Bộ ngữ liệu 10.000 tin nhắn rác ngân hàng, phân loại Naive Bayes.],
    [7], [Tối ưu hóa hình dáng khí động học của cánh gió xe đua điện mini], [Khảo sát đồ thị bậc ba, Điểm uốn, Đạo hàm], [Mô phỏng khí động học CFD trên máy tính, giảm $12\%$ lực cản không khí.],
    [8], [Mô hình hóa sự suy giảm nồng độ thuốc kháng sinh trong máu], [Hàm số phân thức, Tích phân đường cong AUC], [Dữ liệu dược động học lâm sàng, cá nhân hóa liều dùng cho bệnh nhi.],
    [9], [Thuật toán tự động ghép xe buýt học sinh tối ưu hóa lộ trình], [Quy hoạch tuyến tính, Tối ưu hóa khoảng cách], [Bản đồ OpenStreetMap và tọa độ nhà của 200 học sinh trường THPT.],
    [10], [Định lượng độ rủi ro tín dụng của sinh viên vay vốn học tập], [Phương sai ghép nhóm, Phân tích phân vị], [Khảo sát thu nhập và chi tiêu của 500 sinh viên đại học.],
    [11], [Tự động nhận diện chữ số viết tay tiếng Việt từ ảnh quét], [Tích vô hướng vector không gian nhiều chiều], [Tập dữ liệu MNIST, mạng nơ-ron tích chập đơn giản viết bằng Python.],
    [12], [Mô phỏng hiệu ứng nhà kính và mực nước biển dâng tại ĐBSCL], [Tích phân bội tính thể tích ngập mặn], [Dữ liệu độ cao địa hình DEM và kịch bản biến đổi khí hậu IPCC.],
    [13], [Tối ưu hóa góc nghiêng tấm pin năng lượng mặt trời theo mùa], [Tích có hướng Oxyz, Góc giữa hai mặt phẳng], [Tính góc chiếu tia nắng Mặt Trời tại vĩ độ địa phương quanh năm.],
    [14], [Xây dựng chỉ số phát hiện gian lận điểm số trong kỳ thi trắc nghiệm], [Độ lệch chuẩn, Z-Score, Định luật Benford], [Phân tích phân phối tần số chữ cái đáp án A, B, C, D của 10.000 bài thi.],
    [15], [Mô hình hóa sự lan truyền tin giả trên mạng xã hội Facebook], [Chuỗi Markov và Xác suất chuyển trạng thái], [Đồ thị mạng xã hội sinh viên, dự báo tốc độ lây lan thông tin sai lệch.],
    [16], [Thiết kế kết cấu mái vòm bê tông mỏng chịu lực tối đa], [Mặt tròn xoay, Tích phân tính diện tích mặt cong], [Kiến trúc vòm Paraboloid và Catenoid, thử nghiệm chịu tải cơ học.],
    [17], [Dự báo giá nông sản sau thu hoạch để tránh điệp khúc 'giải cứu'], [Chuỗi thời gian, Phân tích phương sai ARMA], [Dữ liệu giá sầu riêng và thanh long tại chợ đầu mối trong 5 năm.],
    [18], [Thuật toán dò tìm vật cản 3D cho gậy thông minh người khiếm thị], [Phương trình mặt phẳng và mặt cầu Oxyz], [Cảm biến khoảng cách siêu âm kết hợp vi điều khiển ESP32.],
    [19], [Tối ưu hóa thời gian sạc xả pin xe máy điện VinFast], [Cực trị hàm số có điều kiện (Nhân tử Lagrange)], [Đặc tuyến suy hao pin Lithium-ion theo nhiệt độ và chu kỳ nạp.],
    [20], [Mô hình toán học hóa trò chơi cờ caro và chiến lược bất bại], [Cây quyết định xác suất và Thuật toán Minimax], [Lập trình trí tuệ nhân tạo đánh cờ thắng người chơi ở mức cơ bản.],
  )
]

#pagebreak()

= BÀI BÁO NGHIÊN CỨU MẪU SỐ 4: ĐỘNG LỰC HỌC TÊN LỬA VŨ TRỤ & PHƯƠNG TRÌNH TSIOLKOVSKY

#align(center)[
  #text(size: 13pt, weight: "bold", fill: rgb("1e1b4b"))[
    MÔ HÌNH HÓA ĐỘNG LỰC HỌC TÊN LỬA VŨ TRỤ SPACEX VÀ TỐI ƯU HÓA NHIÊN LIỆU PHÓNG LÊN QUỸ ĐẠO BẰNG PHƯƠNG TRÌNH TSIOLKOVSKY VÀ VI TÍCH PHÂN LỚP 12
  ]
  
  #v(4pt)
  #text(size: 10pt, style: "italic", fill: rgb("64748b"))[
    Nhóm Nghiên cứu Trẻ: Học sinh Lớp 12 Đam Mê Vật Lý Hàng Không Vũ Trụ — Hướng dẫn: Thầy Cô Tổ Toán - Lý
  ]
]

#v(0.5cm)

== 1. TÓM TẮT ĐỀ TÀI (ABSTRACT)
Để đưa một vệ tinh viễn thông hay tàu vũ trụ có người lái lên quỹ đạo Trái Đất tầm thấp (LEO), tên lửa đẩy phải đạt được *Vận tốc vũ trụ cấp 1 ($v_1 approx 7.9 "km/s"$)*. Nghiên cứu này ứng dụng phép tính Đạo hàm, Nguyên hàm và Tích phân lớp 12 để dẫn xuất lại *Phương trình Tên lửa Tsiolkovsky*, mô hình hóa sự tiêu hao khối lượng nhiên liệu liên tục theo thời gian, tính toán công vượt thắng lực hấp dẫn và lực cản khí quyển, đồng thời kiểm chứng bằng mô phỏng số Python cho tên lửa Falcon 9 của SpaceX.

== 2. MÔ HÌNH TOÁN HỌC (MATHEMATICAL FORMULATION)
1. *Bảo toàn Động lượng & Thiết lập Phương trình Vi phân:*
Xét tên lửa tại thời điểm $t$ có khối lượng $m(t)$ và vận tốc $v(t)$. Sau khoảng thời gian vi phân $d t$, động cơ phụt ra một lượng khí thải có khối lượng $- d m > 0$ với vận tốc phụt tương đối $v_e$ không đổi:
$ m d v = - v_e d m - g(t) m d t - F_("cản") d t $
Bỏ qua lực cản và trọng lực trong giai đoạn phụt phản lực tức thời ngoài khí quyển:
$ d v = - v_e (d m) / m $

2. *Tích phân Xác định Vận tốc Đạt được (Phương trình Tsiolkovsky):*
Lấy tích phân hai vế từ trạng thái xuất phát (khối lượng ban đầu $m_0$, vận tốc $v_0 = 0$) đến khi đốt cháy hết nhiên liệu (khối lượng rỗng $m_f$, vận tốc $v_f$):
$ Delta v = integral_0^(Delta v) d v = - v_e integral_(m_0)^(m_f) (d m) / m = - v_e [ln m]_(m_0)^(m_f) = v_e ln(m_0 / m_f) $
Đây là *Phương trình Tsiolkovsky kinh điển* định hình toàn bộ ngành hàng không vũ trụ nhân loại!

3. *Tích phân Tính Công Trọng trường Vượt Thoát Khí Quyển:*
Khi tên lửa bay từ mặt đất ($r = R_E$) lên độ cao quỹ đạo $h$ ($r = R_E + h$), trọng lực Trái Đất giảm dần theo nghịch đảo bình phương khoảng cách $F(r) = (G M_E m) / r^2$. Công cơ học tối thiểu cần thực hiện là:
$ W = integral_(R_E)^(R_E + h) (G M_E m(r)) / r^2 d r $

== 3. MÃ NGUỒN PYTHON MÔ PHỎNG PHÓNG TÊN LỬA FALCON 9
```python
import numpy as np

def simulate_rocket_launch(m0, mf, ve, burn_time, dt=0.1):
    # m0: khối lượng ban đầu (kg), mf: khối lượng rỗng (kg)
    # ve: vận tốc phụt khí (m/s), burn_time: thời gian đốt nhiên liệu (s)
    flow_rate = (m0 - mf) / burn_time
    t_steps = int(burn_time / dt)
    
    times = np.linspace(0, burn_time, t_steps)
    v = 0.0
    h = 0.0
    g0 = 9.81
    
    for t in times:
        m = m0 - flow_rate * t
        thrust = flow_rate * ve
        # Gia tốc a = F_thrust / m - g
        a = (thrust / m) - g0
        v += a * dt
        h += v * dt
        
    return v, h

# Thông số mô phỏng tầng 1 tên lửa Falcon 9:
# m0 = 549.000 kg, mf = 25.600 kg, ve = 3000 m/s, burn_time = 162 s
v_final, h_final = simulate_rocket_launch(m0=549000, mf=96000, ve=3050, burn_time=162)
print(f"Vận tốc tầng 1 khi ngắt động cơ (MECO): {v_final:.1f} m/s ({v_final*3.6:.0f} km/h)")
print(f"Độ cao khi tách tầng: {h_final/1000:.1f} km")
```

== 4. KẾT LUẬN & Ý NGHĨA SƯ PHẠM
Hàm logarit tự nhiên $ln(x)$ và tích phân vi phân không phải là những bài tập tính toán vô hồn trên bảng đen; chúng là phương trình mở đường cho nhân loại chạm tay vào các vì sao!

#pagebreak()

= BẢNG TRA CỨU 50 THUẬT NGỮ TOÁN HỌC & CÔNG NGHỆ SONG NGỮ (GLOSSARY EN - VI)

Dành cho học sinh và giáo viên đọc tài liệu nghiên cứu quốc tế:

#align(center)[
  #table(
    columns: (4.5cm, 4.5cm, 6.5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e1b4b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    table.header(
      text(fill: rgb("fbbf24"), weight: "bold", size: 8.5pt)[Thuật Ngữ Tiếng Anh],
      text(fill: white, weight: "bold", size: 8.5pt)[Thuật Ngữ Tiếng Việt],
      text(fill: white, weight: "bold", size: 8.5pt)[Ngữ Cảnh Toán 12 & Công Nghệ AI],
    ),
    [Gradient Descent], [Thuật toán hạ độ dốc], [Tối ưu hóa hàm mất mát cực tiểu trong Deep Learning.],
    [Loss Function], [Hàm mất mát], [Hàm số đo lường sai số giữa dự đoán AI và thực tế.],
    [Cross Product], [Tích có hướng vector], [Tạo vector pháp tuyến vuông góc hai vector ban đầu.],
    [Dot Product], [Tích vô hướng vector], [Đo góc kẹp, độ tương đồng ngữ nghĩa trong LLMs.],
    [Definite Integral], [Tích phân xác định], [Cộng dồn vi phân tính diện tích, thể tích, công cơ học.],
    [Antiderivative], [Nguyên hàm], [Phép toán nghịch đảo truy tìm cội nguồn của đạo hàm.],
    [Curvature], [Độ cong hình học], [Đạo hàm cấp hai đo mức độ uốn cong của quỹ đạo.],
    [Asymptote], [Đường tiệm cận], [Hành vi bão hòa của hàm số khi biến số ra vô cực.],
    [Inflection Point], [Điểm uốn đồ thị], [Điểm thay đổi độ lồi lõm, chuyển pha tăng trưởng.],
    [Standard Deviation], [Độ lệch chuẩn], [Thước đo sự phân tán, rủi ro biến động tài chính.],
    [Variance], [Phương sai], [Bình phương độ lệch chuẩn, độ phân tán trung bình.],
    [Normal Distribution], [Phân phối chuẩn (Gauss)], [Đường cong chuông đối xứng của hầu hết dữ liệu tự nhiên.],
    [Central Limit Theorem], [Định lý giới hạn trung tâm], [Trung bình mẫu luôn tiệm cận phân phối Gauss khi mẫu lớn.],
    [Conditional Probability], [Xác suất có điều kiện], [Xác suất biến cố khi có thêm thông tin quan sát.],
    [Bayes' Theorem], [Định lý Bayes], [Quy tắc cập nhật niềm tin từ tiên nghiệm sang hậu nghiệm.],
    [Markov Chain], [Chuỗi Markov], [Hệ thống chuyển trạng thái chỉ phụ thuộc hiện tại.],
    [Eigenvector / Eigenvalue], [Vector riêng / Giá trị riêng], [Trục định hướng chính của phép biến đổi không gian Oxyz.],
    [Batch Normalization], [Chuẩn hóa theo lô], [Dùng độ lệch chuẩn ổn định hóa mạng nơ-ron sâu.],
    [Ray-Tracing], [Dò tia ánh sáng], [Tìm giao điểm đường thẳng và mặt cầu dựng đồ họa 3D.],
    [Optimal Stopping], [Dừng tối ưu (Quy tắc 37%)], [Chiến lược xác suất chọn lựa ứng viên tốt nhất.],
    [Six Sigma], [Chuẩn chất lượng 6-Sigma], [Tỷ lệ lỗi dưới 3.4 trên 1 triệu sản phẩm trong bán dẫn.],
    [Value-at-Risk (VaR)], [Giá trị chịu rủi ro], [Mức lỗ tối đa của danh mục đầu tư ở độ tin cậy 95%.],
    [Linear Programming], [Quy hoạch tuyến tính], [Tối ưu hóa hàm mục tiêu trên miền đa diện lồi.],
    [Simplex Algorithm], [Thuật toán Đơn pha], [Thuật toán giải quy hoạch tuyến tính nhanh nhất.],
    [Fat Tails], [Hiện tượng đuôi dày], [Phân bố Pareto có xác suất biến cố cực đoan rất cao.],
    [Black Swan], [Thiên nga đen], [Biến cố cực đoan hiếm gặp làm sụp đổ toàn bộ hệ thống.],
    [Overfitting], [Khớp quá mức], [Mô hình quá khớp dữ liệu cũ nhưng dự báo tương lai sai bét.],
    [Occam's Razor], [Dao cạo Occam], [Nguyên lý chọn mô hình toán học đơn giản và thanh lịch nhất.],
    [Falsifiability], [Khả năng bác bỏ], [Tiêu chuẩn phân biệt khoa học chân chính và ngụy khoa học.],
    [Gimbal Lock], [Khóa trục con quay], [Mất một bậc tự do khi góc xoay 3D trùng mặt phẳng.],
    [Quaternion], [Đại số 4 chiều], [Khắc phục khóa trục, xoay vật thể 3D mượt mà trong VR.],
    [P-hacking], [Đào bới dữ liệu], [Thủ thuật thống kê bóp méo dữ liệu để tìm p-value nhỏ.],
    [Confusion Matrix], [Ma trận nhầm lẫn], [Bảng đánh giá tỷ lệ dương tính thật, dương tính giả.],
    [Sensitivity / Recall], [Độ nhạy chẩn đoán], [Tỷ lệ phát hiện đúng người mắc bệnh trong y khoa.],
    [Specificity], [Độ đặc hiệu], [Tỷ lệ xác nhận đúng người khỏe mạnh bình thường.],
    [False Positive], [Dương tính giả], [Người khỏe mạnh nhưng xét nghiệm báo có bệnh.],
    [Area Under Curve (AUC)], [Diện tích dưới đường cong], [Tổng lượng phơi nhiễm thuốc trong máu theo tích phân.],
    [Catenary], [Đường dây xích], [Đường cong hàm cosh x của sợi dây chùng và vòm chịu lực.],
    [Point Cloud], [Đám mây điểm 3D], [Tập hợp hàng triệu tọa độ Oxyz quét từ cảm biến LiDAR.],
    [Hitbox], [Vùng va chạm], [Hình cầu hoặc hộp Oxyz bao quanh nhân vật game 3D.],
    [Divergence], [Độ phân kỳ (div)], [Đo nguồn phát sinh dòng chảy trường vector không gian.],
    [Curl / Rotor], [Độ xoáy (curl)], [Đo chuyển động xoáy quanh một điểm của trường vector.],
    [Flux], [Thông lượng], [Lượng dòng chảy xuyên qua một diện tích mặt cong.],
    [Heuristic], [Phương pháp phỏng đoán], [Mẹo tìm nghiệm gần đúng nhanh khi bài toán quá khó.],
    [Monte Carlo Method], [Phương pháp Monte Carlo], [Mô phỏng số ngẫu nhiên lặp lại hàng triệu lần.],
    [Logistic Function], [Hàm Logistic (Sigmoid)], [Hàm số tiệm cận tăng trưởng dân số và kích hoạt nơ-ron.],
    [Catastrophe Theory], [Lý thuyết thảm họa], [Nghiên cứu sự nhảy vọt đột ngột của cực trị hàm số.],
    [Incompleteness Theorem], [Định lý bất toàn Gödel], [Giới hạn toán học: Luôn có chân lý không thể chứng minh.],
    [Stationary Distribution], [Phân phối dừng], [Trạng thái cân bằng xác suất dài hạn của chuỗi Markov.],
    [Nash Equilibrium], [Điểm cân bằng Nash], [Trạng thái không ai muốn đơn phương đổi chiến lược.],
  )
]

#v(1.5cm)

= LỜI BẠT: BỨC THƯ GỬI NGƯỜI ĐƯA ĐÒ QUA DÒNG SÔNG LỚN

*Kính gửi Quý Thầy Cô giáo — Những người đưa đò thầm lặng của thế hệ tương lai,*

Một năm học lớp 12 khép lại, cũng là lúc một chuyến đò lớn cập bến. Sau lưng các em là 12 năm đèn sách tuổi học trò hồn nhiên; trước mắt các em là biển lớn cuộc đời với bao thử thách, bão giông và những ngã rẽ định mệnh.

Mười năm, hai mươi năm nữa, học trò của Thầy Cô có thể sẽ không còn nhớ công thức đạo hàm hàm hợp hay phương trình mặt cầu $O x y z$. Nhưng những gì còn đọng lại sâu sắc nhất trong tâm hồn các em chính là *PHƯƠNG PHÁP TƯ DUY MÀ TOÁN HỌC ĐÃ TÔI LUYỆN:*
- Là thói quen luôn tìm kiếm điểm cân bằng tối ưu (Cực trị) giữa những xung đột cuộc sống;
- Là năng lực định vị bản thân (Tọa độ $O x y z$) giữa một xã hội muôn màu biến động;
- Là sự cẩn trọng lượng hóa rủi ro (Độ lệch chuẩn) trước những cám dỗ phù phiếm;
- Là niềm tin bền bỉ rằng mọi nỗ lực nhỏ bé mỗi ngày sẽ được cộng dồn (Tích phân) thành một kỳ tích vĩ đại;
- Và là sự dũng cảm dám thay đổi niềm tin (Định lý Bayes) khi cuộc đời mang lại những bài học mới!

Cảm ơn Quý Thầy Cô đã không biến giờ Toán thành một nỗi sợ hãi, mà biến nó thành một đôi cánh trí tuệ nâng bổng cuộc đời các em!

#align(right)[
  #text(style: "italic", size: 10pt)[
    Hà Nội, mùa thi tốt nghiệp và khát vọng lên đường.\
    *Ban Biên Soạn Đại Toàn Thư Sư Phạm Toán Học THPT*
  ]
]
'''
