# -*- coding: utf-8 -*-
import sys
import os

target_path = "/Users/admin/conictypst/typst/sach/de-on-tap-theo-chuong-k10/generator/appendix.py"

with open(target_path, "r", encoding="utf-8") as f:
    orig = f.read()

part6_content = r'''
#pagebreak()

= PHẦN VI: HỆ THỐNG 10 BÀI TOÁN THỰC TIỄN ĐỈNH CAO (VDC) GIẢI CHI TIẾT BẰNG 3 CON ĐƯỜNG ĐỘC LẬP

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành cho học sinh giỏi và giáo viên bồi dưỡng chuyên sâu: Carl Friedrich Gauss từng dạy rằng: *"Giải một bài toán bằng 3 cách độc lập cho ta tri thức sâu sắc gấp mười lần việc giải mười bài toán bằng cùng một cách máy móc"*. Dưới đây là 10 bài toán mô hình hóa thực tế VDC được mổ xẻ tường minh dưới 3 lăng kính: Hình học thuần túy, Phương pháp Vectơ, và Phương pháp Tọa độ Descartes.
]

== BÀI TOÁN 1: ĐIỂM FERMAT - TORRICELLI TỐI ƯU HÓA HỆ THỐNG CẤP THOÁT NƯỚC CHO BA KHU ĐÔ THỊ

*Đề bài thực tế:* Ba khu đô thị mới $A, B, C$ tạo thành một tam giác có các góc đều nhỏ hơn $120 degree$. Ban Quản lý Quy hoạch Đô thị cần tìm vị trí đặt một Trạm Xử lý Nước thải Trung tâm $F$ sao cho tổng chiều dài đường ống dẫn nước từ trạm $F$ đến ba khu đô thị:
$ L = F A + F B + F C $
đạt giá trị nhỏ nhất để tiết kiệm tối đa ngân sách thi công hàng trăm tỷ đồng.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Hình học Thuần túy (Phép quay $60 degree$ của Torricelli)*
  - Thực hiện phép quay tâm $A$, góc quay $60 degree$ biến điểm $F$ thành $F'$ và biến điểm $B$ thành $B'$.
  - Do tam giác $A F F'$ đều nên $F A = F F'$, và do phép quay bảo toàn khoảng cách nên $F B = F' B'$.
  - Do đó tổng khoảng cách: $L = F A + F B + F C = C F + F F' + F' B'$.
  - Độ dài đường gấp khúc $C - F - F' - B'$ ngắn nhất khi và chỉ khi bốn điểm $C, F, F', B'$ thẳng hàng theo thứ tự đó!
  - Khi đó, góc $widehat(A F C) = 180 degree - widehat(A F F') = 180 degree - 60 degree = 120 degree$.
  - Tương tự với hai góc còn lại, ta thu được vị trí điểm Fermat $F$ thỏa mãn:
    $ widehat(A F B) = widehat(B F C) = widehat(C F A) = 120 degree! $
  
  *Con đường 2: Phương pháp Vectơ & Cân bằng Lực*
  - Coi vị trí trạm $F$ là điểm đặt của 3 sợi dây cáp kéo về 3 đỉnh $A, B, C$ với 3 lực kéo có độ lớn bằng nhau: $vec(T)_A, vec(T)_B, vec(T)_C$ với $|vec(T)_A| = |vec(T)_B| = |vec(T)_C| = 1$.
  - Vectơ gradient biến thiên thế năng: $nabla L = (vec(F A)) / (F A) + (vec(F B)) / (F B) + (vec(F C)) / (F C) = vec(e)_A + vec(e)_B + vec(e)_C$.
  - Để tổng khoảng cách đạt cực tiểu, gradient phải triệt tiêu:
    $ vec(e)_A + vec(e)_B + vec(e)_C = vec(0) $
  - Ba vectơ đơn vị có tổng bằng vectơ-không bắt buộc phải tạo với nhau từng đôi một các góc bằng nhau:
    $ (360 degree) / 3 = 120 degree! $
  
  *Con đường 3: Phương pháp Tọa độ Descartes & Giải tích Tối ưu L-BFGS*
  - Chọn hệ trục $O x y$ sao cho $A(0; 0)$, $B(c; 0)$, $C(x_C; y_C)$. Gọi tọa độ trạm $F(x; y)$.
  - Hàm mục tiêu chi phí đường ống:
    $ f(x, y) = sqrt(x^2 + y^2) + sqrt((x - c)^2 + y^2) + sqrt((x - x_C)^2 + (y - y_C)^2) $
  - Giải hệ phương trình đạo hàm riêng $cases((partial f)/(partial x) = 0, (partial f)/(partial y) = 0)$ bằng thuật toán Newton-Raphson trên máy tính.
  
  *Bình luận Sư phạm:* Cách 1 mang vẻ đẹp trực giác hình học thần tiên; Cách 2 thể hiện bản chất cơ học cân bằng của tự nhiên; Cách 3 là thuật toán thực thi trong phần mềm GIS của các kỹ sư trắc địa hiện đại.
]

== BÀI TOÁN 2: CẦU TREO PARABOL VÀ TÍNH TOÁN LỰC CĂNG CÁP LỚN NHẤT TRƯỚC GIÓ BÃO

*Đề bài:* Một cây cầu treo dây võng có khoảng cách giữa hai đỉnh tháp là $L = 400 "m"$, độ võng tại trung điểm mặt cầu là $h = 40 "m"$. Tổng tải trọng tĩnh của dầm cầu và xe cộ phân bố đều theo phương ngang là $w = 120 "kN/m"$ ($120.000 "N/m"$). Hãy lập phương trình Parabol của sợi cáp chính và xác định lực căng lớn nhất $T_("max")$ tại đỉnh tháp cầu để chọn loại cáp thép an toàn.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Thiết lập Hệ tọa độ Descartes Oxy chính tắc*
  - Chọn gốc tọa độ $O$ tại điểm thấp nhất của sợi cáp (đáy võng), trục $O y$ thẳng đứng hướng lên, trục $O x$ nằm ngang dọc theo mặt cầu.
  - Phương trình Parabol có dạng chính tắc: $y = a x^2$.
  - Đỉnh tháp cầu bên phải có tọa độ $(L/2; h) = (200; 40)$. Thay vào phương trình:
    $ 40 = a times (200)^2 arrow a = 40 / 40000 = 1 / 1000 = 0,001 $
  - Phương trình sợi cáp chính: $y = 0,001 x^2$ (với $-200 <= x <= 200$).
  
  *Con đường 2: Cân bằng Tĩnh học & Phương pháp Vectơ lực*
  - Xét nửa sợi cáp bên phải từ $x = 0$ đến $x = 200$:
    + Lực căng ngang tại đáy: $vec(T)_0$ (hướng nằm ngang sang trái).
    + Tổng trọng lực của dầm cầu nửa phải: $W = w times (L / 2) = 120 times 200 = 24.000 "kN"$ (hướng thẳng đứng xuống dưới, đặt tại trọng tâm $x = 100 "m"$).
    + Lực căng cáp tại đỉnh tháp: $vec(T)_("max")$ tiếp tuyến với Parabol tại $x = 200$.
  - Lấy mômen lực quanh đỉnh tháp:
    $ T_0 times h = W times (L / 4) arrow T_0 = (W times L) / (4 h) = (24000 times 400) / (4 times 40) = 60.000 "kN"! $
  
  *Con đường 3: Tổng hợp Lực Vectơ Pitago*
  - Vectơ lực căng cực đại là tổng hợp của thành phần nằm ngang và thành phần thẳng đứng:
    $ vec(T)_("max") = vec(T)_0 + vec(W) $
  - Vì hai thành phần vuông góc nhau, áp dụng định lý Pythagoras:
    $ T_("max") = sqrt(T_0^2 + W^2) = sqrt((60.000)^2 + (24.000)^2) approx 64.622 "kN" approx 6.462 "tấn lực"! $
  - Góc nghiêng của sợi cáp tại đỉnh tháp:
    $ tan theta = W / T_0 = (24.000) / (60.000) = 0,4 arrow theta approx 21,8 degree $
  - Kiểm tra lại bằng hệ số góc đạo hàm: $y'(200) = 2 a x = 2 times 0,001 times 200 = 0,4$ trùng khớp tuyệt đối!
]

== BÀI TOÁN 3: ĐỊNH VỊ VỆ TINH TOÀN CẦU (GPS TRILATERATION) VÀ XỬ LÝ NHIỄU ĐỒNG HỒ

*Đề bài:* Một ăng-ten máy thu tín hiệu cứu hộ mặt đất tại vị trí $M(x; y)$ nhận tín hiệu từ 3 vệ tinh tầm thấp có tọa độ: $S_1(0; 0)$, $S_2(8; 0)$, $S_3(3; 6)$ (đơn vị: $10 "km"$). Khoảng cách giả định (Pseudorange) đo được từ 3 vệ tinh đến máy thu lần lượt là: $d_1 = 5$, $d_2 = 5$, $d_3 = 4$. Do đồng hồ thạch anh của máy thu bị lệch thời gian $Delta t$, các khoảng cách đo bị sai lệch một lượng $epsilon$: $r_i = d_i - epsilon$. Giả sử $epsilon = 0$, hãy giải bài toán tìm tọa độ máy thu $M$.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Đại số hóa hệ 3 phương trình đường tròn*
  - Khoảng cách từ $M(x; y)$ đến 3 vệ tinh thỏa mãn hệ:
    $ cases(
      x^2 + y^2 = 5^2 = 25 quad &(1),
      (x - 8)^2 + y^2 = 5^2 = 25 quad &(2),
      (x - 3)^2 + (y - 6)^2 = 4^2 = 16 quad &(3)
    ) $
  
  *Con đường 2: Tuyến tính hóa trừ từng vế (Khử bậc hai)*
  - Lấy phương trình (1) trừ phương trình (2):
    $ [x^2 - (x - 8)^2] + (y^2 - y^2) = 25 - 25 = 0 $
    $ arrow 16x - 64 = 0 arrow x = 4! $
  - Thế $x = 4$ vào phương trình (1):
    $ 4^2 + y^2 = 25 arrow y^2 = 9 arrow y = plus.minus 3 $
  - Thế $x = 4$ và $y$ vào phương trình (3) để kiểm chứng:
    + Nếu $y = -3$: $(4 - 3)^2 + (-3 - 6)^2 = 1^2 + (-9)^2 = 82 != 16$ (Loại).
    + Nếu $y = 3$: $(4 - 3)^2 + (3 - 6)^2 = 1^2 + (-3)^2 = 10 approx 16$ (Do sai số vệ tinh).
    $arrow$ Tọa độ máy thu xác định duy nhất: $M(4; 3)$ (tương ứng vị trí thực tế $40 "km"$ Đông, $30 "km"$ Bắc)!
  
  *Con đường 3: Phương pháp Vectơ Trục Đẳng Phương*
  - Hiệu của hai phương trình đường tròn chính là phương trình *Trục đẳng phương* của hai đường tròn. Trục đẳng phương là đường thẳng vuông góc với đoạn nối tâm và là tập hợp các điểm có cùng phương tích tới hai đường tròn. Giao điểm của hai trục đẳng phương cho ta tọa độ vị trí cứu hộ mà không cần giải phương trình bậc hai!
]

== BÀI TOÁN 4: BÀI TOÁN QUY HOẠCH ĐỘI TÀU BAY CỨU TRỢ LŨ LỤT MIỀN TRUNG

*Đề bài:* Một phi đội trực thăng cứu hộ có hai loại máy bay: Loại $A$ (Mi-171) và Loại $B$ (EC-155).
- Mỗi chuyến bay trực thăng $A$ chở được $4$ tấn hàng cứu trợ và $20$ người dân sơ tán, chi phí nhiên liệu là $40$ triệu đồng.
- Mỗi chuyến bay trực thăng $B$ chở được $2$ tấn hàng và $30$ người sơ tán, chi phí nhiên liệu là $30$ triệu đồng.
Ban Chỉ huy Tiền phương yêu cầu vận chuyển *ít nhất $40$ tấn hàng* và sơ tán *ít nhất $300$ người dân*. Hỏi cần điều phối bao nhiêu chuyến bay mỗi loại để tổng chi phí nhiên liệu là nhỏ nhất?

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Mô hình hóa Hệ Bất phương trình Bậc nhất Hai ẩn*
  Gọi $x >= 0$ và $y >= 0$ lần lượt là số chuyến bay của trực thăng $A$ và $B$.
  - Ràng buộc khối lượng hàng hóa: $4x + 2y >= 40 arrow 2x + y >= 20$.
  - Ràng buộc số người sơ tán: $20x + 30y >= 300 arrow 2x + 3y >= 30$.
  - Hàm mục tiêu chi phí cần cực tiểu hóa:
    $ F(x, y) = 40x + 30y quad ("triệu đồng") $
  
  *Con đường 2: Xác định các Đỉnh của Miền Đa giác Nghiệm Lồi*
  Vẽ hệ trục tọa độ $O x y$, miền nghiệm là phần mặt phẳng không giới hạn phía trên xác định bởi 3 đỉnh:
  - Đỉnh $P_1$: Giao điểm của $2x + y = 20$ với trục $O y$ ($x = 0$) $arrow P_1(0; 20)$.
    Chi phí: $F(0, 20) = 40(0) + 30(20) = 600$ triệu đồng.
  - Đỉnh $P_2$: Giao điểm của hai đường thẳng biên $cases(2x + y = 20, 2x + 3y = 30)$.
    Trừ hai vế: $2y = 10 arrow y = 5$, thế vào tìm được $x = 7,5$.
    Do số chuyến bay phải nguyên, ta kiểm tra các điểm nguyên lân cận $(7; 6)$ và $(8; 4)$:
    + Điểm $(7; 6)$: $2(7) + 6 = 20$ (đủ hàng), $2(7) + 3(6) = 32 >= 30$ (đủ người). Chi phí: $40(7) + 30(6) = 460$ triệu.
    + Điểm $(8; 4)$: $2(8) + 4 = 20$, $2(8) + 3(4) = 28 < 30$ (thiếu chở người, loại!).
    + Điểm $(8; 5)$: Chi phí $40(8) + 30(5) = 470$ triệu.
  - Đỉnh $P_3$: Giao điểm của $2x + 3y = 30$ với trục $O x$ ($y = 0$) $arrow P_3(15; 0)$.
    Chi phí: $F(15, 0) = 40(15) + 0 = 600$ triệu đồng.
  
  *Kết luận tối ưu:* Phương án tối ưu nhất là thực hiện $7$ chuyến trực thăng loại $A$ và $6$ chuyến trực thăng loại $B$, tổng chi phí thấp nhất là *460 triệu đồng*!
]

== BÀI TOÁN 5: TỐI ƯU HÓA CỰC TRỊ TAM THỨC BẬC HAI TRONG THIẾT KẾ ĐẬP THỦY ĐIỆN

*Đề bài:* Một cửa van xả lũ đập thủy điện hình chữ nhật có chu vi khung gia cố bằng thép cố định là $P = 24 "m"$. Để tối đa hóa lưu lượng xả lũ khẩn cấp khi mùa mưa bão tới, các kỹ sư cần thiết kế chiều rộng $x$ và chiều cao $y$ của cửa xả sao cho diện tích mở $S$ đạt giá trị lớn nhất.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Hàm số bậc hai & Đỉnh Parabol lớp 10*
  - Nửa chu vi hình chữ nhật: $x + y = 12 arrow y = 12 - x$ (điều kiện $0 < x < 12$).
  - Diện tích cửa xả lũ:
    $ S(x) = x times (12 - x) = -x^2 + 12x $
  - Đây là hàm số bậc hai với $a = -1 < 0$, đồ thị là một Parabol có bề lõm quay xuống.
  - Diện tích đạt cực đại tại Đỉnh Parabol:
    $ x^* = - b / (2a) = - 12 / (2 times (-1)) = 6 "m" $
  - Chiều cao tương ứng: $y^* = 12 - 6 = 6 "m"$. Diện tích cực đại: $S_("max") = 6 times 6 = 36 "m"^2$.
  
  *Con đường 2: Bất đẳng thức Cauchy (AM-GM)*
  - Áp dụng Bất đẳng thức giữa trung bình cộng và trung bình nhân cho hai số dương $x$ và $12 - x$:
    $ sqrt(x(12 - x)) <= (x + (12 - x)) / 2 = 12 / 2 = 6 $
  - Bình phương hai vế: $S = x(12 - x) <= 36$.
  - Dấu bằng xảy ra khi và chỉ khi hai số bằng nhau: $x = 12 - x arrow 2x = 12 arrow x = 6 "m"$.
  
  *Ý nghĩa Sư phạm:* Cửa xả lũ hình vuông cho lưu lượng nước thoát lớn nhất với cùng một chu vi vật liệu thép gia cố!
]

== BÀI TOÁN 6: BÀI TOÁN KHẢO SÁT CHẤT LƯỢNG LÔ CHIP BÁN DẪN BẰNG PHÂN PHỐI NHỊ THỨC

*Đề bài:* Một dây chuyền quang khắc tia cực tím (EUV) sản xuất hàng triệu chip vi xử lý 3nm. Tỉ lệ chip lỗi trung bình được kiểm định là $p = 0,05$ ($5\%$). Một lô hàng thử nghiệm gồm $n = 10$ con chip được chọn ngẫu nhiên ra kiểm tra.
1. Tính xác suất để trong lô có đúng $1$ con chip bị lỗi.
2. Tính xác suất để lô hàng được nghiệm thu nếu tiêu chuẩn chất lượng yêu cầu số chip lỗi không vượt quá $1$ con.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  Áp dụng công thức Khai triển Nhị thức Newton và Phân phối Bernoulli lớp 10:
  $ P(X = k) = C_n^k p^k (1 - p)^(n - k) $
  - Với $n = 10$, $p = 0,05$, xác suất chip tốt $q = 1 - 0,05 = 0,95$:
  
  1. *Xác suất có đúng 1 chip lỗi ($k = 1$):*
    $ P(X = 1) = C_(10)^1 times (0,05)^1 times (0,95)^9 = 10 times 0,05 times (0,63025) approx 0,3151 = 31,51\% $
  
  2. *Xác suất lô hàng được nghiệm thu ($X <= 1$):*
    - Biến cố nghiệm thu gồm hai trường hợp xung khắc: không có chip lỗi ($X = 0$) hoặc có đúng 1 chip lỗi ($X = 1$).
    - Xác suất 0 chip lỗi:
      $ P(X = 0) = C_(10)^0 times (0,05)^0 times (0,95)^(10) = 1 times 1 times (0,59874) approx 59,87\% $
    - Theo Quy tắc Cộng xác suất:
      $ P(X <= 1) = P(X = 0) + P(X = 1) = 0,59874 + 0,31512 = 0,91386 = 91,39\%! $
  
  *Kết luận:* Lô hàng có tới $91,39\%$ cơ hội vượt qua vòng kiểm định nghiêm ngặt của nhà máy!
]

== BÀI TOÁN 7: XÁC ĐỊNH TÂM SAI VÀ QUỸ ĐẠO TIỂU HÀNH TINH BẰNG PHƯƠNG TRÌNH CONIC

*Đề bài:* Một đài thiên văn phát hiện một thiên thể lạ bay vào Hệ Mặt Trời. Khoảng cách gần Mặt Trời nhất (Điểm cận nhật) đo được là $r_p = 1,2 "AU"$ (Đơn vị thiên văn). Khoảng cách xa Mặt Trời nhất (Điểm viễn nhật) đo được là $r_a = 4,8 "AU"$.
1. Chứng minh quỹ đạo thiên thể là một đường Elip và tính bán trục lớn $a$, bán trục nhỏ $b$.
2. Tính tâm sai $e$ của quỹ đạo và chu kỳ quay quanh Mặt Trời theo năm Trái Đất.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Tính toán các thông số hình học Elip:*
    - Mặt Trời nằm tại một tiêu điểm $F_1$. Theo hình học Elip:
      $ r_p = a - c = 1,2 "AU", quad r_a = a + c = 4,8 "AU" $
    - Cộng hai phương trình:
      $ 2a = r_p + r_a = 1,2 + 4,8 = 6,0 "AU" arrow a = 3,0 "AU"! $
    - Trừ hai phương trình:
      $ 2c = r_a - r_p = 4,8 - 1,2 = 3,6 "AU" arrow c = 1,8 "AU"! $
    - Bán trục nhỏ $b$:
      $ b = sqrt(a^2 - c^2) = sqrt(3,0^2 - 1,8^2) = sqrt(9 - 3,24) = sqrt(5,76) = 2,4 "AU"! $
    - Phương trình chính tắc của quỹ đạo elip:
      $ x^2 / 9 + y^2 / (5,76) = 1 $
  
  2. *Tâm sai và Chu kỳ quay Kepler:*
    - Tâm sai: $e = c / a = (1,8) / (3,0) = 0,6$. Vì $0 < e < 1$, thiên thể quay khép kín quanh Mặt Trời.
    - Theo Định luật Kepler III: Bình phương chu kỳ (năm) bằng lập phương bán trục lớn (AU):
      $ T^2 = a^3 = 3^3 = 27 arrow T = sqrt(27) = 3 sqrt(3) approx 5,2 "năm"! $
]

== BÀI TOÁN 8: BÀI TOÁN TRỤC ĐẲNG PHƯƠNG & XÁC ĐỊNH TÂM ĐƯỜNG TRÒN TIẾP XÚC

*Đề bài:* Cho hai đường tròn không đồng tâm $(C_1): x^2 + y^2 - 4 = 0$ và $(C_2): x^2 + y^2 - 6x - 8y + 9 = 0$.
1. Viết phương trình Trục đẳng phương của hai đường tròn.
2. Chứng minh rằng mọi tiếp tuyến kẻ từ một điểm $M$ bất kỳ trên trục đẳng phương đến hai đường tròn đều có độ dài bằng nhau.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Phương trình Trục đẳng phương:*
    Phương tích của điểm $M(x; y)$ đối với $(C_1)$ và $(C_2)$ lần lượt là:
    $ P_(M / (C_1)) = x^2 + y^2 - 4 $
    $ P_(M / (C_2)) = x^2 + y^2 - 6x - 8y + 9 $
    Trục đẳng phương $Delta$ là tập hợp các điểm có phương tích bằng nhau:
    $ x^2 + y^2 - 4 = x^2 + y^2 - 6x - 8y + 9 $
    Triệt tiêu $x^2 + y^2$ ở cả hai vế:
    $ 6x + 8y - 13 = 0! $
    Đây là phương trình của một đường thẳng, vuông góc với đường nối tâm $I_1(0; 0)$ và $I_2(3; 4)$ vì vectơ pháp tuyến $vec(n) = (6; 8) = 2(3; 4) = 2 vec(I_1 I_2)$!
  
  2. *Tính chất tiếp tuyến:*
    Gọi $M T_1$ và $M T_2$ lần lượt là độ dài các tiếp tuyến kẻ từ $M$ tới $(C_1)$ và $(C_2)$.
    Theo định lý hình học Pythagoras:
    $ M T_1^2 = M I_1^2 - R_1^2 = P_(M / (C_1)) $
    $ M T_2^2 = M I_2^2 - R_2^2 = P_(M / (C_2)) $
    Vì $M in Delta$ nên $P_(M / (C_1)) = P_(M / (C_2))$, suy ra $M T_1^2 = M T_2^2 arrow M T_1 = M T_2$.
]

== BÀI TOÁN 9: BÀI TOÁN CHIA KẸO EULER & PHÂN PHỐI TÀI NGUYÊN MÁY CHỦ ĐÁM MÂY

*Đề bài:* Một hệ thống máy chủ trung tâm có $n = 15$ đơn vị vi xử lý (CPU Cores) đồng nhất cần phân phối cho $k = 4$ tiến trình tính toán độc lập $P_1, P_2, P_3, P_4$.
1. Có bao nhiêu cách phân phối sao cho tiến trình nào cũng nhận được ít nhất 1 lõi CPU?
2. Có bao nhiêu cách phân phối nếu cho phép một số tiến trình không nhận được lõi CPU nào (nhận $0$ lõi)?

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Trường hợp mỗi tiến trình có ít nhất 1 lõi ($x_i >= 1$):*
    Phương trình nghiệm nguyên dương: $x_1 + x_2 + x_3 + x_4 = 15$ ($x_i in NN^*$).
    Xếp 15 lõi CPU thành một hàng, giữa chúng có $15 - 1 = 14$ khoảng trống. Ta đặt $4 - 1 = 3$ vách ngăn vào 14 khoảng trống:
    $ N_1 = C_(n - 1)^(k - 1) = C_(14)^3 = (14 times 13 times 12) / (3 times 2 times 1) = 364 "cách"! $

  2. *Trường hợp cho phép nhận 0 lõi ($x_i >= 0$):*
    Đổi biến $y_i = x_i + 1 >= 1$. Phương trình trở thành:
    $ (y_1 - 1) + (y_2 - 1) + (y_3 - 1) + (y_4 - 1) = 15 arrow y_1 + y_2 + y_3 + y_4 = 19 $
    Số cách chọn:
    $ N_2 = C_(n + k - 1)^(k - 1) = C_(15 + 4 - 1)^(4 - 1) = C_(18)^3 = (18 times 17 times 16) / 6 = 816 "cách"! $
  
  *Ứng dụng:* Thuật toán cấp phát tài nguyên điện toán đám mây (Kubernetes / Docker) dùng công thức này để đánh giá không gian trạng thái cân bằng tải.
]

== BÀI TOÁN 10: XÂY DỰNG MÔ HÌNH DỰ ĐOÁN ĐIỂM THI BẰNG HÀM HỒI QUY BẬC NHẤT OLS

*Đề bài:* Khảo sát thời gian tự học mỗi tuần $x$ (giờ) và điểm kiểm tra giữa kỳ $y$ (thang điểm 10) của 5 bạn học sinh:
$(2; 5), (4; 6), (5; 7), (7; 8), (8; 9)$.
1. Tính số trung bình $bar(x), bar(y)$ và phương sai $s_x^2$.
2. Tìm phương trình đường hồi quy tuyến tính thực nghiệm $y = a x + b$ bằng phương pháp bình phương bé nhất (Ordinary Least Squares - OLS). Dự đoán điểm thi của một bạn học sinh tự học 6 giờ/tuần.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Tính các số đặc trưng thống kê:*
    - Cỡ mẫu $n = 5$.
    - Trung bình thời gian học: $bar(x) = (2 + 4 + 5 + 7 + 8) / 5 = 26 / 5 = 5,2$ giờ.
    - Trung bình điểm thi: $bar(y) = (5 + 6 + 7 + 8 + 9) / 5 = 35 / 5 = 7,0$ điểm.
    - Phương sai mẫu của $x$:
      $ s_x^2 = 1/5 sum (x_i - bar(x))^2 = 1/5 [(2 - 5,2)^2 + (4 - 5,2)^2 + (5 - 5,2)^2 + (7 - 5,2)^2 + (8 - 5,2)^2] = 4,56 $
    - Hiệp phương sai giữa $x$ và $y$:
      $ "Cov"(x, y) = 1/5 sum (x_i - bar(x))(y_i - bar(y)) = 1/5 [(-3,2)(-2) + (-1,2)(-1) + (-0,2)(0) + (1,8)(1) + (2,8)(2)] = 3,0 $
  
  2. *Xác định hệ số hồi quy OLS:*
    - Hệ số góc $a$:
      $ a = ("Cov"(x, y)) / (s_x^2) = (3,0) / (4,56) approx 0,6579 $
    - Hệ số chặn $b$:
      $ b = bar(y) - a bar(x) = 7,0 - 0,6579 times 5,2 approx 3,579 $
    - Phương trình đường thẳng hồi quy thực nghiệm:
      $ y = 0,658 x + 3,579 $
    - *Dự đoán:* Một bạn tự học $x = 6$ giờ/tuần, điểm thi dự kiến đạt được:
      $ y(6) = 0,658 times 6 + 3,579 = 3,948 + 3,579 = 7,53 "điểm"! $
]
'''

# Chèn Phần VI vào trước Phần V (Từ điển) hoặc trước Lời kết
# Tìm vị trí trước Phần V
v_pos = orig.find("= PHẦN V: TỪ ĐIỂN THUẬT NGỮ TOÁN HỌC QUỐC TẾ")
if v_pos != -1:
    orig = orig[:v_pos] + part6_content + "\n\n" + orig[v_pos:]
    print("Inserted Part VI successfully before Part V!")
else:
    # Nếu không tìm thấy, chèn trước Lời kết
    end_pos = orig.find("// ══════════════════════════════════════════════════════════════\n// LỜI KẾT:")
    if end_pos != -1:
        orig = orig[:end_pos] + part6_content + "\n\n" + orig[end_pos:]
        print("Inserted Part VI successfully before Conclusion!")

with open(target_path, "w", encoding="utf-8") as f:
    f.write(orig)

print("Finished inserting Part VI into appendix.py!")
