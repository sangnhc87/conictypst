# -*- coding: utf-8 -*-
import sys
import os

target_path = "/Users/admin/conictypst/typst/sach/de-on-tap-theo-chuong-k10/generator/appendix.py"

with open(target_path, "r", encoding="utf-8") as f:
    orig = f.read()

# 1. Đoạn bổ sung 20 đề tài NCKH mới (Đề tài 21 đến 40)
extra_visef = r'''
== 4. PHÂN KHOA Y SINH, CÔNG NGHỆ MÔI TRƯỜNG & VẬT LIỆU MỚI
21. *Đề tài 21: Tối ưu hóa liều lượng và thời gian phân rã thuốc trong máu bằng mô hình hàm số.*
    - *Mô hình toán:* Hàm số suy giảm phi tuyến tính và khoảng tứ phân vị nồng độ dược chất an toàn.
    - *Dữ liệu:* Dữ liệu dược động học (Pharmacokinetics) công bố của 3 loại kháng sinh phổ rộng.
    - *Sản phẩm dự kiến:* Phần mềm hỗ trợ điều dưỡng viên tính toán phác đồ truyền dịch tối ưu tránh sốc thuốc.

22. *Đề tài 22: Nhận diện biến dạng cấu trúc tế bào máu bằng độ tương đồng Cosine vectơ.*
    - *Mô hình toán:* Vector Embedding trích xuất đặc trưng hình thái tế bào, khoảng cách Cosine đa chiều.
    - *Dữ liệu:* Bộ ảnh kính hiển vi tế bào hồng cầu bình thường và hồng cầu hình liềm (1.000 mẫu).
    - *Sản phẩm dự kiến:* Thuật toán sàng lọc sớm bệnh thiếu máu hồng cầu hình liềm cho trạm y tế cơ sở.

23. *Đề tài 23: Mô hình hóa dòng chảy xả lũ qua đập tràn hình Elip bằng phương trình thủy lực.*
    - *Mô hình toán:* Hình học giao tuyến nón Conic và tích phân lưu lượng nước qua mặt cắt cong.
    - *Dữ liệu:* Đo đạc mô hình thủy lực thu nhỏ tỉ lệ $1:50$ tại phòng thí nghiệm trường học.
    - *Sản phẩm dự kiến:* Thiết kế gờ giảm chấn chân đập dạng nửa Elip triệt tiêu $45\%$ năng lượng sóng xói lở.

24. *Đề tài 24: Dự báo chất lượng không khí PM2.5 bằng Hồi quy Tuyến tính & Độ phân tán IQR.*
    - *Mô hình toán:* Hồi quy đa biến OLS, loại bỏ ngoại lai bằng khoảng tứ phân vị Tukey.
    - *Dữ liệu:* Cảm biến bụi mịn PMS7003 gắn tại cổng trường đo đạc liên tục 90 ngày.
    - *Sản phẩm dự kiến:* Bản tin cảnh báo ô nhiễm không khí tự động qua loa phát thanh và website trường.

25. *Đề tài 25: Tối ưu hóa hướng pin mặt trời mái trường bằng Hình học Không gian Descartes.*
    - *Mô hình toán:* Tích vô hướng giữa vectơ pháp tuyến tấm pin và vectơ tia bức xạ Mặt Trời theo mùa.
    - *Dữ liệu:* Tọa độ kinh vĩ độ trường học và bảng đo cường độ bức xạ quang thông hàng tháng.
    - *Sản phẩm dự kiến:* Giá đỡ tấm pin tự động nghiêng theo góc tối ưu từng tháng, tăng $22\%$ sản lượng điện.

26. *Đề tài 26: Khảo sát khả năng hấp thụ kim loại nặng của than hoạt tính gáo dừa bằng đẳng nhiệt Langmuir.*
    - *Mô hình toán:* Hàm hữu tỉ quy về tuyến tính hóa (Linearization of Hyperbolic isotherms).
    - *Dữ liệu:* Nồng độ ion chì và cadmi đo bằng máy quang phổ hấp thụ nguyên tử AAS.
    - *Sản phẩm dự kiến:* Lõi lọc nước sinh hoạt giá rẻ từ phụ phẩm nông nghiệp cho vùng ngập mặn.

27. *Đề tài 27: Đo đạc tốc độ lắng tụ phù sa ven sông bằng Hệ thức Lượng Tam giác đạc.*
    - *Mô hình toán:* Định lý Sin, Định lý Côsin và công thức khoảng cách từ điểm đến đường thẳng.
    - *Dữ liệu:* Cọc tiêu định vị GPS và số liệu đo góc bằng máy kinh vĩ quang cơ học.
    - *Sản phẩm dự kiến:* Bản đồ dự báo sạt lở bờ sông hỗ trợ chính quyền địa phương di dời dân cư.

28. *Đề tài 28: Thiết kế cánh tuabin gió tự chế biên dạng Parabol thu hồi năng lượng tối đa.*
    - *Mô hình toán:* Bề mặt Paraboloid xoay và định luật Betz về giới hạn khí động học tuabin gió.
    - *Dữ liệu:* Máy đo vận tốc gió và đồng hồ đo điện áp máy phát đa kênh.
    - *Sản phẩm dự kiến:* Tuabin gió mini trục đứng khởi động được ở vận tốc gió thấp ($2 "m/s"$).

29. *Đề tài 29: Phân tích phổ phản xạ âm thanh vách ngăn học đường bằng Đường Hypebol.*
    - *Mô hình toán:* Tính chất tiêu điểm và hiệu khoảng cách không đổi của hai nhánh Hypebol.
    - *Dữ liệu:* Cảm biến cường độ âm dB đo tại 50 vị trí khác nhau trong hội trường trường học.
    - *Sản phẩm dự kiến:* Bản vẽ bố trí tiêu âm chống vang dội nâng cao chất lượng nghe giảng.

30. *Đề tài 30: Đánh giá độ bền kéo thanh composite sợi chuối bằng kiểm định Thống kê mô tả.*
    - *Mô hình toán:* Trung vị, độ lệch chuẩn mẫu, biểu đồ hộp Boxplot so sánh nhiều nhóm vật liệu.
    - *Dữ liệu:* 100 mẫu thử kéo đứt trên máy nén thủy lực đo lực cực hạn Newton.
    - *Sản phẩm dự kiến:* Vật liệu tấm ốp tường xanh thân thiện môi trường thay thế xốp nhựa.

== 5. PHÂN KHOA MẬT MÃ HỌC, AN NINH MẠNG & TRÍ TUỆ NHÂN TẠO
31. *Đề tài 31: Mô phỏng đòn tấn công Birthday Attack trên hệ mã băm SHA-256 mini.*
    - *Mô hình toán:* Nghịch lý ngày sinh (Birthday Paradox) và ước lượng độ phức tạp tổ hợp $O(sqrt(N))$.
    - *Dữ liệu:* Không gian mã băm rút gọn 16-bit và 32-bit thực nghiệm trên máy tính trường học.
    - *Sản phẩm dự kiến:* Công cụ giảng dạy tương tác trực quan hóa nguy cơ va chạm hàm băm cho học sinh.

32. *Đề tài 32: Thuật toán nén ảnh số ma trận dựa trên Khử Gauss bậc thang.*
    - *Mô hình toán:* Biến đổi sơ cấp trên dòng, phân tích ma trận bậc thang rút gọn RREF.
    - *Dữ liệu:* Ảnh số xám $128 times 128$ pixel.
    - *Sản phẩm dự kiến:* Ứng dụng nén ảnh nhẹ phục vụ truyền tin khẩn cấp qua sóng vô tuyền tầm ngắn.

33. *Đề tài 33: Tối ưu hóa vị trí đặt trạm phát Wi-Fi trường học bằng Đa giác Voronoi.*
    - *Mô hình toán:* Hệ phương trình đường trung trực, phương pháp tọa độ Descartes trong mặt phẳng.
    - *Dữ liệu:* Bản đồ kiến trúc mặt bằng các dãy phòng học và số lượng học sinh truy cập đồng thời.
    - *Sản phẩm dự kiến:* Sơ đồ lắp đặt 12 điểm truy cập Wi-Fi bảo đảm phủ sóng đều $100\%$ diện tích.

34. *Đề tài 34: Xây dựng hệ thống phát hiện thư rác (Spam Filter) bằng Xác suất Bayes.*
    - *Mô hình toán:* Định lý Bayes, xác suất có điều kiện và độc lập thống kê Naive Bayes.
    - *Dữ liệu:* Bộ dữ liệu $5.000$ tin nhắn SMS rác và tin nhắn bình thường (SMS Spam Collection).
    - *Sản phẩm dự kiến:* Tiện ích mở rộng trình duyệt tự động chặn thư rác lừa đảo học đường.

35. *Đề tài 35: Phân tích tương quan chuỗi điểm số và thời gian sử dụng mạng xã hội bằng OLS.*
    - *Mô hình toán:* Hệ số tương quan Pearson, phương sai, độ lệch chuẩn và đường hồi quy tuyến tính.
    - *Dữ liệu:* Khảo sát ẩn danh 400 học sinh THPT với các biến số thời gian ngủ, thời gian online.
    - *Sản phẩm dự kiến:* Cẩm nang hướng dẫn học sinh cân bằng cuộc sống số và học tập hiệu quả.

36. *Đề tài 36: Mô phỏng bài toán xếp lịch thi tốt nghiệp THPT bằng Tô màu Đồ thị Euler.*
    - *Mô hình toán:* Lý thuyết đồ thị, đỉnh xung đột và thuật toán tổ hợp chia nhánh.
    - *Dữ liệu:* Danh sách đăng ký môn thi tự chọn của toàn bộ khối 12 trong trường.
    - *Sản phẩm dự kiến:* Phần mềm xếp lịch thi tự động trong số ca thi tối thiểu không bị trùng môn.

37. *Đề tài 37: Ứng dụng Nguyên lý Chuồng bồ câu Dirichlet trong thuật toán kiểm tra tính nguyên tố.*
    - *Mô hình toán:* Bổ đề Dirichlet, lý thuyết đồng dư số học và thuật toán Fermat nhỏ.
    - *Dữ liệu:* Dãy các số nguyên lớn phục vụ sinh khóa bảo mật RSA.
    - *Sản phẩm dự kiến:* Module Python mã nguồn mở phục vụ câu lạc bộ Tin học trẻ trường học.

38. *Đề tài 38: Nhận diện giọng nói điều khiển thiết bị bằng tích vô hướng phổ âm tần.*
    - *Mô hình toán:* Vector không gian tần số FFT, độ tương đồng góc Cosine giữa hai phổ âm.
    - *Dữ liệu:* Mẫu thu âm 20 khẩu lệnh "Bật đèn", "Tắt quạt" của học sinh các vùng miền.
    - *Sản phẩm dự kiến:* Công tắc thông minh nhận diện giọng nói tiếng Việt không cần kết nối Internet.

39. *Đề tài 39: Đánh giá độ công bằng phân chia tài nguyên phòng máy tính bằng Chỉ số Gini.*
    - *Mô hình toán:* Đường cong Lorenz, hình học tích phân diện tích giữa tam giác và đường cong.
    - *Dữ liệu:* Nhật ký đăng ký sử dụng phòng máy thực hành của các lớp trong học kỳ.
    - *Sản phẩm dự kiến:* Báo cáo khuyến nghị điều phối thời khóa biểu công bằng cho học sinh khó khăn.

40. *Đề tài 40: Thiết kế hệ thống khóa mật mã cá nhân dựa trên Bài toán Chia kẹo Stars and Bars.*
    - *Mô hình toán:* Nghiệm nguyên không âm của phương trình tổng cố định, ánh xạ hoán vị tổ hợp.
    - *Dữ liệu:* Không gian khóa bảo vệ mật khẩu ứng dụng di động.
    - *Sản phẩm dự kiến:* Phương thức xác thực người dùng dựa trên thao tác chia vách ngăn hình học.
'''

# 2. Đoạn bổ sung Phần VIII: Bảng 100 Công thức & Định lý Vàng Toàn thư Toán 10
part8_content = r'''
#pagebreak()

= PHẦN VIII: ĐẠI BẢNG TRA CỨU 100 CÔNG THỨC & ĐỊNH LÝ VÀNG TOÁN HỌC KHỐI 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Hệ thống hóa toàn bộ công thức cốt lõi, điều kiện tồn tại và cạm bẫy nhận thức cần tránh của toàn bộ chương trình Toán học lớp 10. Đây là cẩm nang bỏ túi tối thượng giúp học sinh tra cứu tốc hành và tự tin bước vào mọi kỳ thi tuyển chọn.
]

#align(center)[
  #table(
    columns: (2.5cm, 4.5cm, 4.5cm, 4.5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e293b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    table.header(
      text(fill: white, weight: "bold", size: 8.5pt)[Tên Định lý / Khái niệm],
      text(fill: white, weight: "bold", size: 8.5pt)[Công thức Toán học Chuẩn],
      text(fill: white, weight: "bold", size: 8.5pt)[Điều kiện Áp dụng / Tồn tại],
      text(fill: white, weight: "bold", size: 8.5pt)[Cạm bẫy Cần Tuyệt đối Tránh],
    ),
    
    [Mệnh đề Phủ định], [$macron(forall x in X, P(x)) equiv exists x in X, macron(P(x))$], [Mọi tập hợp $X != emptyset$], [Quên phủ định dấu bất đẳng thức ($>$ thành $<=$).],
    [Mệnh đề Kéo theo], [$P arrow Q equiv macron(P) or Q$], [Chân trị chỉ sai khi $1 arrow 0$], [Tưởng rằng tiền đề sai thì cả mệnh đề sai (thực chất luôn đúng!).],
    [Tập con / Số tập con], [$n(P(A)) = 2^n$], [Tập $A$ có $n$ phần tử hữu hạn], [Quên đếm tập rỗng $emptyset$ và chính tập hợp $A$.],
    [Hiệu hai tập hợp], [$A \\ B = {x in A | x in.not B}$], [Mọi tập hợp $A, B$], [Nhầm lẫn giữa hiệu $A \\ B$ và giao $A inter B$.],
    [Bất đẳng thức Cauchy], [$a + b >= 2 sqrt(a b)$], [$a >= 0, b >= 0$], [Áp dụng khi hai số chưa chắc chắn không âm.],
    [Bất đẳng thức Bunhiacopxki], [$(a x + b y)^2 <= (a^2 + b^2)(x^2 + y^2)$], [Mọi số thực $a, b, x, y$], [Quên điều kiện xảy ra dấu bằng ($a/x = b/y$).],
    [Định lý Côsin], [$a^2 = b^2 + c^2 - 2 b c cos A$], [Tam giác bất kỳ], [Nhầm dấu trừ thành dấu cộng (dễ nhầm với Pitago mở rộng).],
    [Định lý Sin], [$a / (sin A) = b / (sin B) = c / (sin C) = 2R$], [Góc $A, B, C != 0, 180 degree$], [Quên số 2 trước bán kính đường tròn ngoại tiếp $R$.],
    [Công thức Heron], [$S = sqrt(p(p - a)(p - b)(p - c))$], [$p = (a + b + c) / 2$ (nửa chu vi)], [Nhầm $p$ là chu vi thay vì nửa chu vi.],
    [Bán kính nội tiếp $r$], [$S = p r arrow r = S / p$], [Tam giác bất kỳ], [Nhầm bán kính nội tiếp $r$ với ngoại tiếp $R$.],
    [Độ dài Trung tuyến], [$m_a^2 = (2(b^2 + c^2) - a^2) / 4$], [Hệ thức Apollonius], [Quên chia mẫu cho 4, nhầm dấu trừ của cạnh đối diện $a^2$.],
    [Độ dài Phân giác trong], [$l_a = (2 b c cos(A / 2)) / (b + c)$], [Tam giác bất kỳ], [Nhầm góc $A/2$ với góc $A$.],
    [Tổng hai Vectơ], [$vec(A B) + vec(B C) = vec(A C)$], [Quy tắc 3 điểm Chasles], [Cộng hai vectơ không chung điểm nối tiếp.],
    [Quy tắc Hình bình hành], [$vec(A B) + vec(A D) = vec(A C)$], [$A B C D$ là hình bình hành], [Nhầm vectơ đường chéo $vec(A C)$ với $vec(B D)$.],
    [Tọa độ Trung điểm], [$x_M = (x_A + x_B) / 2, y_M = (y_A + y_B) / 2$], [$M$ là trung điểm đoạn $A B$], [Nhầm dấu cộng thành dấu trừ.],
    [Tọa độ Trọng tâm], [$x_G = (x_A + x_B + x_C) / 3$], [$G$ là trọng tâm $Delta A B C$], [Quên chia cho 3 (dễ nhầm chia 2 như trung điểm).],
    [Tâm tỉ cự 3 điểm], [$alpha vec(I A) + beta vec(I B) + gamma vec(I C) = vec(0)$], [$alpha + beta + gamma != 0$], [Áp dụng khi tổng các hệ số triệt tiêu bằng 0.],
    [Tích vô hướng], [$vec(u) dot vec(v) = |vec(u)| |vec(v)| cos(vec(u), vec(v))$], [Mọi cặp vectơ], [Tưởng kết quả là một vectơ (thực chất là một số thực!).],
    [Biểu thức Tọa độ Tích VH], [$vec(u) dot vec(v) = u_1 v_1 + u_2 v_2$], [Trong hệ trục chuẩn $O x y$], [Nhầm nhân chéo thay vì hoành nhân hoành cộng tung nhân tung.],
    [Điều kiện Vuông góc], [$vec(u) perp vec(v) arrow.double u_1 v_1 + u_2 v_2 = 0$], [$vec(u), vec(v) != vec(0)$], [Quên điều kiện hai vectơ phải khác vectơ-không.],
    [Độ dài Vectơ], [$|vec(u)| = sqrt(u_1^2 + u_2^2)$], [Hệ trục Descartes], [Quên dấu căn bậc hai ngoài cùng.],
    [Góc giữa hai Vectơ], [$cos theta = (u_1 v_1 + u_2 v_2) / (sqrt(u_1^2 + u_2^2) sqrt(v_1^2 + v_2^2))$], [$vec(u), vec(v) != vec(0)$], [Mẫu số bị triệt tiêu khi có vectơ-không.],
    [Sai số tuyệt đối], [$Delta_a = |bar(a) - a| <= d$], [$d > 0$ là độ chính xác], [Nhầm sai số tuyệt đối với sai số tương đối.],
    [Sai số tương đối], [$delta_a = Delta_a / |a| <= d / |a|$], [$a != 0$], [Tính sai số tương đối mà quên chia cho độ lớn của số đo.],
    [Số Trung bình], [$bar(x) = 1/n sum_(i=1)^n x_i$], [Mẫu số liệu $n >= 1$], [Bị bóp méo hoàn toàn khi có giá trị ngoại lai cực đoan.],
    [Trung vị ($M_e$)], [Giá trị đứng chính giữa dãy đã sắp xếp], [Dãy số đã xếp thứ tự tăng dần], [Quên sắp xếp dãy số trước khi tìm trung vị!],
    [Tứ phân vị ($Q_1, Q_2, Q_3$)], [$Q_2 = M_e$, $Q_1$ là trung vị nửa dưới], [Mẫu số liệu chia đôi], [Không rõ quy tắc bỏ hay giữ trung vị khi $n$ lẻ.],
    [Khoảng Tứ phân vị], [$I Q R = Q_3 - Q_1$], [Thước đo độ phân tán vững], [Nhầm $I Q R$ với khoảng biến thiên $R = "Max" - "Min"$.],
    [Hàng rào Ngoại lai Tukey], [$["Lower", "Upper"] = [Q_1 - 1,5 I Q R; Q_3 + 1,5 I Q R]$], [Phát hiện Outliers], [Nhầm hệ số $1,5$ thành $3,0$ (hàng rào cực đoan).],
    [Phương sai mẫu], [$s^2 = 1/(n - 1) sum (x_i - bar(x))^2$], [Mẫu ngẫu nhiên kích thước $n$], [Chia cho $n$ thay vì chia $n - 1$ (quên hiệu chỉnh Bessel!).],
    [Độ lệch chuẩn], [$s = sqrt(s^2)$], [Cùng đơn vị với dữ liệu gốc], [Nhầm lẫn đơn vị giữa phương sai (bình phương) và độ lệch chuẩn.],
    [Hệ số biến thiên], [$C V = s / bar(x)$], [$bar(x) > 0$], [Dùng để so sánh độ phân tán giữa hai mẫu có đơn vị đo khác nhau.],
    [Tọa độ Đỉnh Parabol], [$I(-b / (2a); -Delta / (4a))$], [Hàm bậc hai $a != 0$], [Nhầm tung độ đỉnh là $-Delta / (2a)$ thay vì $-Delta / (4a)$.],
    [Trục đối xứng Parabol], [$x = -b / (2a)$], [Đường thẳng đứng], [Viết thiếu chữ $x =$ (chỉ ghi mỗi giá trị $-b/(2a)$).],
    [Định lý Viète], [$x_1 + x_2 = -b / a, x_1 x_2 = c / a$], [$Delta >= 0$], [Áp dụng Viète khi phương trình chưa chắc có nghiệm ($Delta < 0$).],
    [Dấu Tam thức bậc hai], [$a f(x) > 0 forall x in RR arrow.double cases(a != 0, Delta < 0)$], [Tam thức bậc hai], [Quên xét trường hợp hệ số $a = 0$ khi $a$ chứa tham số $m$.],
    [PT Vô tỉ dạng 1], [$sqrt(f(x)) = g(x) arrow.double cases(g(x) >= 0, f(x) = [g(x)]^2)$], [Phương trình chứa căn], [Quên đặt điều kiện $g(x) >= 0$ dẫn đến rước nghiệm ma!],
    [PT Vô tỉ dạng 2], [$sqrt(f(x)) = sqrt(g(x)) arrow.double cases(f(x) >= 0, f(x) = g(x))$], [Hai vế cùng có căn], [Đặt thừa cả hai điều kiện $f >= 0$ và $g >= 0$ gây cồng kềnh.],
    [PT Tổng quát ĐT], [$a x + b y + c = 0$], [$a^2 + b^2 > 0$ (VTPT $vec(n) = (a; b)$)], [Nhầm lẫn giữa vectơ pháp tuyến và vectơ chỉ phương.],
    [PT Tham số ĐT], [$cases(x = x_0 + u_1 t, y = y_0 + u_2 t)$], [$vec(u) = (u_1; u_2) != vec(0), t in RR$], [Quên miền xác định của tham số thời gian $t in RR$.],
    [Khoảng cách Điểm - ĐT], [$d(M, Delta) = (|a x_0 + b y_0 + c|) / sqrt(a^2 + b^2)$], [$Delta: a x + b y + c = 0$], [Quên dấu trị tuyệt đối trên tử số hoặc quên căn ở mẫu.],
    [Góc giữa hai ĐT], [$cos varphi = (|a_1 a_2 + b_1 b_2|) / (sqrt(a_1^2 + b_1^2) sqrt(a_2^2 + b_2^2))$], [$0 degree <= varphi <= 90 degree$], [Quên trị tuyệt đối trên tử (góc giữa 2 ĐT không bao giờ tù!).],
    [PT Chính tắc Đường tròn], [$(x - a)^2 + (y - b)^2 = R^2$], [Tâm $I(a; b)$, bán kính $R > 0$], [Nhầm dấu tọa độ tâm khi chuyển từ phương trình ra.],
    [Điều kiện Đường tròn], [$a^2 + b^2 - c > 0$], [Dạng $x^2 + y^2 - 2a x - 2b y + c = 0$], [Quên kiểm tra điều kiện $a^2 + b^2 - c > 0$.],
    [Tiếp tuyến Đường tròn], [$d(I, Delta) = R$], [Tiếp xúc tại đúng 1 điểm], [Nhầm điều kiện tiếp xúc với điều kiện cắt nhau ($d < R$).],
    [Phương trình Elip], [$x^2 / a^2 + y^2 / b^2 = 1$], [$a > b > 0, b^2 = a^2 - c^2$], [Nhầm hệ thức $b^2 = a^2 - c^2$ với Hypebol ($c^2 = a^2 + b^2$).],
    [Phương trình Hypebol], [$x^2 / a^2 - y^2 / b^2 = 1$], [$c^2 = a^2 + b^2, c > a > 0$], [Nhầm dấu trừ thành dấu cộng của Elip.],
    [Phương trình Parabol], [$y^2 = 2 p x$], [$p > 0$ (Tham số tiêu)], [Tiêu điểm $F(p/2; 0)$, đường chuẩn $x = -p/2$ (dễ nhầm chia 4).],
    [Tâm sai Conic], [$e = c / a$ (Elip, Hyp), $e = 1$ (Parabol)], [Mọi đường Conic], [Quên rằng đường tròn là trường hợp suy biến có $e = 0$.],
    [Quy tắc Cộng], [$n(A union B) = n(A) + n(B)$], [$A inter B = emptyset$ (Xung khắc)], [Áp dụng quy tắc cộng khi hai phương án không loại trừ nhau.],
    [Quy tắc Nhân], [$n(A_1 times A_2) = n_1 times n_2$], [Các công đoạn liên tiếp độc lập], [Áp dụng nhầm khi các công đoạn phụ thuộc điều kiện nhau.],
    [Hoán vị $P_n$], [$P_n = n!$], [$n in NN^*$ phần tử phân biệt], [Quy ước $0! = 1$ trong tính toán tổ hợp.],
    [Chỉnh hợp $A_n^k$], [$A_n^k = (n!) / ((n - k)!)$], [$0 <= k <= n$ (Có xếp thứ tự)], [Nhầm chỉnh hợp với tổ hợp khi thứ tự không quan trọng.],
    [Tổ hợp $C_n^k$], [$C_n^k = (n!) / (k! (n - k)!)$], [$0 <= k <= n$ (Không thứ tự)], [Tính chất đối xứng: $C_n^k = C_n^(n - k)$.],
    [Công thức Tam giác Pascal], [$C_n^k = C_(n-1)^(k-1) + C_(n-1)^k$], [$1 <= k <= n - 1$], [Dùng để lập trình sinh tổ hợp không bị tràn số nguyên.],
    [Khai triển Nhị thức Newton], [$(a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k$], [$n in NN$], [Quên hệ số tổ hợp $C_n^k$ đứng trước mỗi số hạng.],
    [Số hạng tổng quát thứ $k+1$], [$T_(k+1) = C_n^k a^(n-k) b^k$], [Đếm từ $k = 0$], [Nhầm số hạng thứ $k$ có chỉ số là $k$ thay vì $k - 1$.],
    [Không gian mẫu $Omega$], [Tập hợp mọi kết quả khả dĩ], [Phép thử ngẫu nhiên], [Liệt kê thiếu kết quả hoặc kết quả không đồng khả năng.],
    [Xác suất Cổ điển], [$P(A) = (n(A)) / (n(Omega))$], [Các kết quả đồng khả năng], [Áp dụng công thức Laplace cho biến cố không đồng khả năng!],
    [Xác suất Biến cố đối], [$P(macron(A)) = 1 - P(A)$], [$macron(A) = Omega \\ A$], [Không nhận ra biến cố đối khi đề bài có từ "ít nhất một".],
    [Quy nạp Toán học], [1. Cơ sở $n=1$; 2. $k arrow k+1$], [Mệnh đề trên $NN^*$], [Quên bước cơ sở $n=1$ hoặc giả thiết quy nạp sai.],
    [Khử Gauss], [Biến đổi dòng về ma trận bậc thang], [Hệ phương trình tuyến tính], [Chia cho một số bằng 0 khi làm phép biến đổi sơ cấp dòng.],
  )
]
'''

# Thay thế trong orig:
# 1. Chèn thêm đề tài NCKH 21-40 sau đề tài 20
pos_visef = orig.find("12. *Đề tài 12: Tối ưu hóa chu kỳ tưới tiêu vườn lan tự động bằng hàm số bậc hai.*")
if pos_visef != -1:
    end_visef_sec = orig.find("\n\n#pagebreak()\n\n= PHẦN V:", pos_visef)
    if end_visef_sec != -1:
        orig = orig[:end_visef_sec] + "\n" + extra_visef + orig[end_visef_sec:]
        print("Inserted 20 extra ViSEF topics successfully!")

# 2. Chèn Phần VIII vào trước Lời kết
end_pos = orig.find("// ══════════════════════════════════════════════════════════════\n// LỜI KẾT:")
if end_pos != -1:
    orig = orig[:end_pos] + part8_content + "\n\n" + orig[end_pos:]
    print("Inserted Part VIII successfully before Conclusion!")

with open(target_path, "w", encoding="utf-8") as f:
    f.write(orig)

print("Finished final expansion of appendix.py!")
