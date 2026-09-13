# HƯỚNG DẪN BÀN GIAO & TỔNG KẾT BỘ ĐỀ CHUYÊN ĐỀ HỌC TẬP TOÁN 12
*(Chương trình GDPT 2018 - Định dạng chuẩn Ma trận Đề thi 2025)*

---

> [!IMPORTANT]
> **DÀNH CHO MODEL KẾ NHIỆM & GIÁO VIÊN SỬ DỤNG**:
> Tài liệu này tổng kết toàn bộ tiến độ, quy chuẩn thiết kế, ma trận đề thi và hướng dẫn vận hành cho bộ sách **Chuyên đề Học tập Toán lớp 12 (Chương trình GDPT 2018)** bằng **Typst** kết hợp thư viện đồ họa **CeTZ**.
> Toàn bộ đề thi được thiết kế độc lập, phân hóa cao ở mức độ Vận dụng - Vận dụng cao (VD - VDC), phục vụ luyện thi học sinh giỏi, kỳ thi Đánh giá năng lực (ĐGNL) và kỳ thi Tốt nghiệp THPT theo cấu trúc mới của Bộ Giáo dục & Đào tạo.

---

## 1. QUY TẮC BẤT BIẾN TỪ NGƯỜI DÙNG & HỆ THỐNG (USER RULES)

1. **Quy tắc Người dùng đặc biệt (AGENTS.md)**:
   - Hai email admin: `nguyensangnhc@gmail.com` và `sangbeau@gmail.com` được **miễn phí toàn bộ trọn đời**, không cần mua, được dùng full mọi tính năng hệ thống.
   - Không được tự ý deploy hoặc xóa deployment nếu người dùng không yêu cầu. Tuân thủ tuyệt đối an toàn dữ liệu trong `DEPLOYMENT-SAFETY.md`.
   - Giữ gìn worktree sạch sẽ, không xóa file ngoài phạm vi nhiệm vụ.
2. **Chỉ đạo chất lượng sư phạm từ người dùng**:
   - Mức độ câu hỏi: Cực kỳ chuyên sâu, tập trung vào mô hình toán học hóa thực tiễn, tối ưu hóa đa mục tiêu, phân hóa mạnh mẽ ở cấp độ VD - VDC.
   - Trực quan hóa đồ họa: **100% câu hỏi và đề thi** có hình vẽ trực quan bằng CeTZ (mặt cắt 2D, không gian 3D, mô hình gấp giấy, đồ thị vận tốc Snell, giản đồ nước dâng, vùng chấp nhận phương án miền đa giác lồi QHTT, đường cong Logistic và mô hình MSY).
   - Chuẩn ký hiệu Toán học:
     - Ký hiệu vectơ: Bắt buộc dùng `$vec(...)$` (ví dụ: `$vec(v)$`, `$vec(a)$`, `$vec(0)$`). Tuyệt đối **không** dùng `$arrow(...)$`.
     - Ký hiệu góc: Dùng `$hat(...)$` (ví dụ: `$hat(A)$`, `$hat(alpha)$`).
     - Toán thực tế ngoài math mode viết chuẩn Typst: Viết `đồng/m#super[2]` thay vì `đồng$/"m"^2$`.
   - Lời giải sư phạm: 100% câu hỏi có lời giải giải thích rõ phương pháp `#step([Phương pháp giải])` và chi tiết từng bước `#step([Lời giải chi tiết])` hoặc phân tích từng ý `#step([Phân tích ý a])`.

---

## 2. BẢNG TIẾN ĐỘ HOÀN THÀNH TOÀN BỘ CHUYÊN ĐỀ 1 KHỐI 12

Thư mục lưu trữ: `typst/sach/de-on-tap-theo-chuong-k12/chuyen-de-1-bai-toan-toi-uu/`

| Đề | Mã đề | Tên chủ đề chuyên sâu | Màu chủ đạo (Accent Color) | Số câu (TN/DS/TLN) | Trạng thái |
| :---: | :---: | :--- | :---: | :---: | :---: |
| **cd01A** | **501** | **Tối ưu hóa Hình học 2D & Uốn dây tạo hình**<br>*(Rào đất ven sông, cửa sổ vòm Norman, diện tích tam giác/hình thang cực đại, cắt dây thép uốn hình đa giác, tiếp tuyến & cực trị Oxy)* | Royal Blue<br>`rgb("1e40af")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu)* | **HOÀN THÀNH 100%**<br>`cd01A.pdf` OK |
| **cd01B** | **502** | **Tối ưu hóa Hình học Không gian 3D & Khối tròn xoay**<br>*(Hình trụ, hình nón, hình cầu nội/ngoại tiếp, lon bia, bồn chứa hình xuyến, lều bạt nón cụt, máng nước lục giác)* | Dark Teal<br>`rgb("0f766e")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu)* | **HOÀN THÀNH 100%**<br>`cd01B.pdf` OK |
| **cd01C** | **503** | **Cắt giấy gấp hình & Thiết kế bao bì vật liệu**<br>*(Gấp hộp không nắp từ tấm bìa chữ nhật/vuông, cắt 4 góc, cuộn quạt tròn thành nón, gấp dải giấy tạo nếp gấp ngắn nhất, gấp hộp sữa tứ diện)* | Amber Brown<br>`rgb("92400e")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu)* | **HOÀN THÀNH 100%**<br>`cd01C.pdf` OK |
| **cd01D** | **504** | **Tối ưu hóa Kinh tế, Doanh thu & Lợi nhuận**<br>*(Hàm cầu $p(x)$, độ co giãn của cầu theo giá $E(p)$, mô hình tồn kho kinh tế EOQ, hàm sản xuất Cobb-Douglas, bài toán tăng giảm giá vé rạp phim/chung cư)* | Forest Green<br>`rgb("15803d")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu)* | **HOÀN THÀNH 100%**<br>`cd01D.pdf` OK |
| **cd01E** | **505** | **Di chuyển, Vận tốc & Quy hoạch đường đi (Snell & Fermat)**<br>*(Cứu hộ bãi biển, truyền tín hiệu cáp quang qua hai môi trường, đường ống dầu vượt sông, trạm biến áp cấp điện cho 2 nhà máy, bay ngược gió)* | Purple Violet<br>`rgb("6d28d9")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu)* | **HOÀN THÀNH 100%**<br>`cd01E.pdf` OK |
| **cd01F** | **506** | **Chi phí ẩn theo Vận tốc & Vận hành phương tiện**<br>*(Tàu thủy chạy ngược dòng tiêu hao nhiên liệu tỷ lệ với $v^3$, xe tải cao tốc cân đối lương tài xế theo giờ và tiền dầu theo $v$, máy bay tối ưu nhiên liệu cản gió)* | Fuchsia Magenta<br>`rgb("a21caf")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu)* | **HOÀN THÀNH 100%**<br>`cd01F.pdf` OK |
| **cd01G** | **507** | **Tốc độ thay đổi, Nước dâng, Rút nước (Related Rates)**<br>*(Phễu nón rút nước $d h/d t$, bồn nằm ngang hình trụ, thang trượt tường $d y/d t$, bóng người đi dưới đèn đường, góc nâng ngắm tên lửa vũ trụ $d theta/d t$)* | Sky Blue<br>`rgb("0284c7")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu)* | **HOÀN THÀNH 100%**<br>`cd01G.pdf` OK |
| **cd01H** | **508** | **Quy hoạch tuyến tính (Linear Programming) & Tối ưu đa mục tiêu**<br>*(Sản xuất 2 mặt hàng tối đa hóa lợi nhuận, khẩu phần thức ăn chăn nuôi tối thiểu chi phí, pha trộn nguyên liệu lọc dầu, đa giác lồi nghiệm miền chấp nhận)* | Burnt Orange<br>`rgb("ea580c")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu)* | **HOÀN THÀNH 100%**<br>`cd01H.pdf` OK |
| **cd01I** | **509** | **Mô hình Sinh thái, Khai thác bền vững & Dịch tễ học**<br>*(Mô hình tăng trưởng Logistic điểm uốn tốc độ cực đại, sản lượng khai thác tối đa MSY Schaefer, nỗ lực tối đa hóa lợi nhuận MEY, đỉnh dịch bùng phát, dược động học nồng độ thuốc)* | Crimson Rose<br>`rgb("be123c")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu)* | **HOÀN THÀNH 100%**<br>`cd01I.pdf` OK |

---

## 3. CÔNG NGHỆ & QUY TRÌNH KIỂM ĐỊNH TỰ ĐỘNG

### 3.1. Cú pháp thư viện `sang-math:1.0.4`
Mỗi file `.typ` tuân thủ nghiêm ngặt khung cấu trúc:
```typst
#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let mode = "loigiai" // Chế độ "loigiai" hoặc "de"
#let accent = rgb("...") // Mã màu riêng của từng đề

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: BÀI TOÁN TỐI ƯU HÓA TRONG THỰC TIỄN",
  exam-title: "...",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "...",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [
  #exam-part([PHẦN I. ...])
  // 12 câu #tn(...)

  #exam-part([PHẦN II. ...])
  // 4 câu #ds(...)

  #exam-part([PHẦN III. ...])
  // 6 câu #tln(...)
]

#make-questions()
```

### 3.2. Quy trình biên dịch & kiểm định 100% không lỗi
Trước khi bàn giao, mọi file đều được kiểm thử qua 2 bước:
1. **Kiểm tra ma trận câu hỏi**:
   ```bash
   python3 typst/sach/de-on-tap-theo-chuong-k10/inspect_exam.py typst/sach/de-on-tap-theo-chuong-k12/chuyen-de-1-bai-toan-toi-uu/cd01X.typ
   ```
   *Yêu cầu*: Đủ chính xác 12 TN (có key), 4 DS (16 ý có key đúng/sai), 6 TLN (có số liệu đáp án).
2. **Biên dịch xuất bản PDF**:
   ```bash
   typst compile typst/sach/de-on-tap-theo-chuong-k12/chuyen-de-1-bai-toan-toi-uu/cd01X.typ typst/sach/de-on-tap-theo-chuong-k12/chuyen-de-1-bai-toan-toi-uu/cd01X.pdf
   ```
   *Yêu cầu*: Exit code 0, không có cảnh báo deprecation hay lỗi cú pháp layout.

---

## 4. TIẾN ĐỘ CHUYÊN ĐỀ 2: ỨNG DỤNG TOÁN HỌC TRONG TÀI CHÍNH (TOÁN TÀI CHÍNH)

Thư mục lưu trữ: `typst/sach/de-on-tap-theo-chuong-k12/chuyen-de-2-toan-tai-chinh/`

| Đề | Mã đề | Tên chủ đề chuyên sâu | Màu chủ đạo (Accent Color) | Số câu (TN/DS/TLN) | Trạng thái |
| :---: | :---: | :--- | :---: | :---: | :---: |
| **cd02A** | **511** | **Lãi đơn, Lãi kép định kỳ, Lãi kép liên tục & Lợi suất thực tế (EAR)**<br>*(Tăng trưởng tiền gửi, quy tắc 72, lãi suất danh nghĩa APR vs thực tế hiệu dụng EAR, lãi kép liên tục $e^(r t)$, lạm phát Fisher)* | Sapphire Blue<br>`rgb("0369a1")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd02A.pdf` OK |
| **cd02B** | **512** | **Giá trị hiện tại ($"PV"$), Tương lai ($"FV"$), Chiết khấu dòng tiền & NPV - IRR**<br>*(Chiết khấu ngân lưu DCF, thẩm định dự án đầu tư NPV, tỷ suất hoàn vốn nội bộ IRR, chi phí cơ hội của vốn WACC)* | Emerald Green<br>`rgb("047857")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd02B.pdf` OK |
| **cd02C** | **513** | **Dòng tiền Niên kim định kỳ & Quỹ chìm tích lũy (Sinking Fund)**<br>*(Niên kim cuối kỳ Ordinary Annuity, đầu kỳ Annuity Due, niên kim vĩnh viễn Perpetuity, lập quỹ khấu hao & mua nhà)* | Amber Brown<br>`rgb("b45309")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd02C.pdf` OK |
| **cd02D** | **514** | **Vay nợ trả góp & Phân bổ nợ (Amortization)**<br>*(Khoản trả góp đều định kỳ $R$, cơ cấu tách gốc - lãi $P_k$ và $I_k$, dư nợ giảm dần, so sánh trả góp đều vs gốc đều, phí phạt tất toán nợ trước hạn)* | Purple<br>`rgb("7c3aed")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd02D.pdf` OK |
| **cd02E** | **515** | **Lập kế hoạch tài chính cá nhân, Quỹ hưu trí & Dòng tiền**<br>*(Mô hình hai giai đoạn Accumulation vs Decumulation, Quy tắc $4\%$ FIRE Trinity Study, chiết khấu lạm phát sức mua, quỹ khẩn cấp 50/30/20, đầu tư sớm vs muộn)* | Rose<br>`rgb("e11d48")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd02E.pdf` OK |
| **cd02F** | **516** | **Định giá Trái phiếu, Lợi suất đáo hạn & Thời lượng Macaulay**<br>*(Định giá trái phiếu coupon, trái phiếu zero-coupon, tính chất lồi Convexity, thời lượng Macaulay $D$, thời lượng điều chỉnh $D^*$, miễn dịch hóa danh mục)* | Indigo<br>`rgb("4338ca")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd02F.pdf` OK |
| **cd02G** | **517** | **Thuế thu nhập cá nhân lũy tiến từng phần & Tối ưu thuế**<br>*(Bậc thuế lũy tiến từng phần, thuế suất biên Marginal Tax Rate, giảm trừ gia cảnh, bảo hiểm bắt buộc & tối ưu hóa thu nhập sau thuế)* | Teal<br>`rgb("0f766e")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd02G.pdf` OK |
| **cd02H** | **518** | **Phân tích dự án tài chính: Thuê tài chính vs Mua đứt (Lease vs Buy)**<br>*(So sánh chi phí hiện tại ròng NAL, khấu hao thuế lá chắn Tax Shield, điểm hòa vốn tài chính & đòn bẩy hoạt động)* | Orange<br>`rgb("ea580c")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd02H.pdf` OK |
| **cd02I** | **519** | **Mô hình toán tài chính nâng cao VD - VDC & Tối ưu hóa danh mục**<br>*(Mô hình biên độ phương sai Markowitz, tỷ số Sharpe, đa dạng hóa rủi ro phi hệ thống, quản trị rủi ro dòng tiền và tái cân bằng tài sản)* | Cyan / Dark Slate<br>`rgb("0891b2")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd02I.pdf` OK |

> [!NOTE]
> **TỔNG KẾT CHUYÊN ĐỀ 2**: Đã hoàn thành trọn vẹn **9/9 đề thi chuẩn 2025 (198 câu hỏi VD - VDC)** với **198 hình vẽ CeTZ sắc nét 100%**, biên dịch PDF hoàn hảo không một lỗi cú pháp.

---

## 5. KẾ HOẠCH TRIỂN KHAI CHUYÊN ĐỀ 3: BIẾN NGẪU NHIÊN RỜI RẠC & CÁC SỐ ĐẶC TRƯNG

Thư mục dự kiến: `typst/sach/de-on-tap-theo-chuong-k12/chuyen-de-3-bien-ngau-nhien-roi-rac/`

| Đề | Mã đề | Tên chủ đề chuyên sâu | Màu chủ đạo (Accent Color) | Số câu (TN/DS/TLN) | Trạng thái |
| :---: | :---: | :--- | :---: | :---: | :---: |
| **cd03A** | **521** | **Khái niệm Biến ngẫu nhiên rời rạc & Bảng phân bố xác suất**<br>*(Biến ngẫu nhiên nhận giá trị hữu hạn/đếm được, bảng phân bố xác suất $P(X = x_i)$, tính chất $\sum p_i = 1$, hàm phân bố tích lũy $F(x)$, xác suất sự kiện phức hợp)* | Deep Navy<br>`rgb("1e3a8a")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd03A.pdf` OK |
| **cd03B** | **522** | **Kỳ vọng Toán học $E(X)$ & Ứng dụng ra quyết định trong thực tế**<br>*(Công thức kỳ vọng $E(X) = \sum x_i p_i$, tính chất tuyến tính $E(a X + b) = a E(X) + b$, trò chơi may rủi công bằng Fair Game, định giá bảo hiểm, dự toán chi phí kỳ vọng)* | Emerald<br>`rgb("065f46")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd03B.pdf` OK |
| **cd03C** | **523** | **Phương sai $V(X)$, Độ lệch chuẩn $sigma(X)$ & Đo lường mức độ rủi ro**<br>*(Phương sai $V(X) = E(X^2) - [E(X)]^2$, độ lệch chuẩn $sigma(X)$, tính chất $V(a X + b) = a^2 V(X)$, so sánh phương án kinh doanh cùng kỳ vọng khác rủi ro, kiểm soát chất lượng sản phẩm)* | Violet<br>`rgb("5b21b6")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd03C.pdf` OK |
| **cd03D** | **524** | **Phép thử Bernoulli & Phân bố xác suất Nhị thức $B(n, p)$**<br>*(Dãy phép thử độc lập Bernoulli, công thức xác suất nhị thức $P(X = k) = C_n^k p^k (1-p)^{n-k}$, giá trị tin chắc nhất Mode $k_0$, bảng phân bố nhị thức, kiểm định sản phẩm lỗi)* | Crimson<br>`rgb("9f1239")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd03D.pdf` & SCORM OK |
| **cd03E** | **525** | **Các số đặc trưng của Phân bố Nhị thức: Kỳ vọng $n p$ & Phương sai $n p(1-p)$**<br>*(Kỳ vọng $E(X) = n p$, phương sai $V(X) = n p q$, độ lệch chuẩn $sigma = \sqrt{n p q}$, ứng dụng dự báo số lượng tiêu thụ, kiểm soát tỷ lệ phế phẩm, bắn bia mục tiêu)* | Burnt Amber<br>`rgb("92400e")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd03E.pdf` & SCORM OK |
| **cd03F** | **526** | **Biến ngẫu nhiên độc lập, Tổng & Hiệu biến ngẫu nhiên rời rạc**<br>*(Tính độc lập của hai biến ngẫu nhiên, phân bố của $X + Y$ và $X dot Y$, công thức $E(X + Y) = E(X) + E(Y)$, $V(X + Y) = V(X) + V(Y)$ khi $X, Y$ độc lập, bài toán cung ứng đa nguồn)* | Dark Cyan<br>`rgb("155e75")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd03F.pdf` & SCORM OK |
| **cd03G** | **527** | **Bài toán Quyết định kinh doanh & Quản trị rủi ro bằng Kỳ vọng**<br>*(Cây quyết định Decision Tree, giá trị kỳ vọng của thông tin hoàn hảo EVPI, tối đa hóa lợi nhuận kỳ vọng trong điều kiện bất định, chiến lược đặt hàng mùa vụ Newsboy problem)* | Rose Pink<br>`rgb("be123c")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd03G.pdf` & SCORM OK |
| **cd03H** | **528** | **Mô hình Hàng đợi rời rạc, Tiếp nhận dịch vụ & Kiểm soát chất lượng**<br>*(Số khách hàng đến trong khoảng thời gian, số cuộc gọi tổng đài, số lỗi linh kiện trên bo mạch, kiểm tra mẫu ngẫu nhiên không hoàn lại siêu bội xấp xỉ nhị thức)* | Bronze Orange<br>`rgb("c2410c")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd03H.pdf` & SCORM OK |
| **cd03I** | **529** | **Tổng hợp VD - VDC: Mô hình ngẫu nhiên trong Y học, Kỹ thuật & Khoa học dữ liệu**<br>*(Độ nhạy Sensitivity, độ đặc hiệu Specificity, sàng lọc dịch bệnh diện rộng, độ tin cậy hệ thống mắc nối tiếp/song song, ước lượng kỳ vọng bằng luật số lớn)* | Royal Indigo<br>`rgb("3730a3")` | 12 TN + 4 DS + 6 TLN<br>*(22 câu + 22 CeTZ)* | **HOÀN THÀNH 100%**<br>`cd03I.pdf` & SCORM OK |

> [!NOTE]
> **TỔNG KẾT TOÀN DIỆN BỘ CHUYÊN ĐỀ HỌC TẬP TOÁN 12 (GDPT 2018)**:
> Đã hoàn thành trọn vẹn **27/27 đề thi chuẩn Ma trận Đề thi 2025** (tổng cộng **594 câu hỏi phân hóa VD - VDC**) với **594 hình vẽ CeTZ trực quan 100%**, biên dịch ra **27 file PDF xuất bản in ấn** và **27 gói SCORM 1.2 ZIP** tương thích hoàn toàn K12Online, Moodle, LMS tại `typst/sach/de-on-tap-theo-chuong-k12/scorm_output/`.

---

## 6. QUY CHUẨN CÚ PHÁP ĐẶC BIỆT KHI SOẠN TYPST (BẮT BUỘC TUÂN THỦ)

1. **Chuẩn số thập phân**:
   - **Bắt buộc dùng `0","07`, `1","06`, `0","005`...**: Tuyệt đối không dùng cú pháp LaTeX `0{,}07` vì trong Typst `{,}` không triệt tiêu khoảng trắng mà còn gây lỗi font.
2. **Ký hiệu toán học trong Math mode**:
   - Các biến nhiều chữ cái (`PV`, `FV`, `NPV`, `IRR`, `EAR`, `DSR`, `YTM`, `FIRE`, `EVPI`, `Mode`) bắt buộc đặt trong dấu ngoặc kép: `$"PV"$`, `$"EVPI"$` để tránh lỗi `unknown variable`.
   - Ký hiệu tổ hợp, chỉnh hợp: Dùng `$C_n^k$`, `$A_n^k$`.
   - Phân bố nhị thức: Dùng `$B(n, p)$`.
3. **Ký hiệu suy luận**:
   - Dùng `==>` và `<==>`, tuyệt đối không gõ `\implies` hay `\iff`.
   - Dùng `approx` thay cho `\approx`.
4. **CeTZ Drawing**:
   - Không dùng `ellipse(...)` (dùng `circle((x, y), radius: (rx, ry))`).
   - 100% câu hỏi đều kèm hình vẽ đồ họa CeTZ trực quan (biểu đồ hình cột phân bố xác suất, biểu đồ cây xác suất, đồ thị hàm phân bố bậc thang, sơ đồ mạch hệ thống linh kiện, sơ đồ kiểm định chất lượng).
5. **Trình bày sư phạm**:
   - Lời giải phân tách display mode `$ ... $` riêng biệt từng dòng, có `#step([Phương pháp giải])` và `#step([Lời giải chi tiết])` hoặc `#step([Phân tích ý a])`.
