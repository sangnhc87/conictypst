import sys

with open('bang-phan-tich-22cau-toan-2026.typ', 'r') as f:
    content = f.read()

# Find the start of part II
split_str = "// ╔════════════════════════════════════════════════════════╗\n// ║  PHẦN II — 4 CÂU ĐÚNG / SAI                         ║\n// ╚════════════════════════════════════════════════════════╝"
parts = content.split(split_str)
if len(parts) != 2:
    print("Error: Could not find Part II header")
    sys.exit(1)

new_content = parts[0] + split_str + """
#section-header(
  "PHẦN II — ĐÚNG / SAI (4 câu lớn × 4 ý a/b/c/d = 16 ý · 4,0 điểm)",
  "Tính linh hoạt cao: Mỗi vị trí câu hỏi có thể trộn nhiều mảng kiến thức (Đại số, Hình học, XS-TK) thuộc Lớp 10, 11, 12",
  teal
)

#let ds-block(so, title, badge-list, ys) = {
  block(
    width: 100%,
    stroke: 0.5pt + border,
    inset: 0pt,
    radius: 4pt,
  )[
    #block(
      width: 100%,
      fill: rgb("0d6e63"),
      inset: (x: 10pt, y: 7pt),
      radius: (top: 4pt, bottom: 0pt),
    )[
      #grid(columns: (auto, 1fr), gutter: 8pt,
        text(size: 13pt, weight: "bold", fill: white)[#so],
        [
          #text(size: 10pt, weight: "bold", fill: white)[#title] \\
          #badge-list
        ]
      )
    ]
    #table(
      columns: (0.6cm, 3.2cm, 5.5cm, 4.9cm, 3.6cm),
      inset: (x: 7pt, y: 7pt),
      align: (center, left, left, left, left),
      stroke: 0.5pt + border,
      fill: (x, y) => if y == 0 { rgb("e0f2fe") } else if calc.rem(y, 2) == 0 { white } else { slate },

      text(weight: "bold", size: 8.5pt, fill: teal)[Ý],
      text(weight: "bold", size: 8.5pt, fill: teal)[Kịch bản kiến thức / Cụm KT],
      text(weight: "bold", size: 8.5pt, fill: teal)[Nội dung chi tiết & Cách xử lý],
      text(weight: "bold", size: 8.5pt, fill: teal)[Trọng tâm Ôn tập & Lưu ý],
      text(weight: "bold", size: 8.5pt, fill: teal)[Bẫy & Chiến thuật],

      ..ys
    )
  ]
  v(0.7em)
}

// ══ CÂU 13: ĐẠI SỐ & GIẢI TÍCH 12 ══
#ds-block(
  "13",
  "Đại số & Giải tích — Hàm số, Mũ-Logarit, Lãi suất",
  [#badge12 Hàm số đa thức/phân thức · #badge12 Hàm ẩn · #badge11 Mũ - Logarit · #badge11 Dãy số & CSN],
  (
    text(weight: "bold", fill: teal)[a],
    [#badge12 *KB 1:* Đọc tính chất từ đồ thị/BBT \ #badge11 *KB 2:* PT/BPT Mũ, Logarit cơ bản],
    [#text(size: 8.5pt)[*KB 1:* Nhìn BBT xác định khoảng đơn điệu, điểm cực trị. Có thể hỏi giới hạn tại vô cực (TCN).\ *KB 2:* Kiểm tra nghiệm của $2^x = 4$, $log_2(x) < 3$. Kiểm tra tập xác định của hàm Logarit (biểu thức trong Log > 0).]],
    [#text(size: 8.5pt)[Ôn kỹ tập xác định hàm Logarit, điều kiện $0 < a < 1$ làm đổi chiều BPT. Đọc đồ thị $f'(x)$ thì cực trị là giao điểm với trục hoành.]],
    [#text(size: 8.5pt)[🟢 Dễ kiếm 0,1đ. Quên đổi chiều BPT mũ/log. Nhầm uốn với cực trị.]],

    text(weight: "bold", fill: teal)[b],
    [#badge12 *KB 1:* GTLN/GTNN trên đoạn \ #badge11 *KB 2:* Bài toán Lãi suất kép],
    [#text(size: 8.5pt)[*KB 1:* Tính $f'(x)$, tìm nghiệm, so sánh các giá trị ở đầu mút. \ *KB 2:* Ứng dụng lãi kép (CSN): $P_n = P_0(1+r)^n$. Kiểm tra sự gia tăng số lượng vi khuẩn, tiền gửi ngân hàng.]],
    [#text(size: 8.5pt)[★ Lãi kép/Tăng trưởng là dạng rất hay thi. Thuộc công thức $S_n$. Nếu $f(x)$ trên $(a, b)$ thì phải lập BBT để tìm cực trị.]],
    [#text(size: 8.5pt)[🟡 Không kiểm tra nghiệm đạo hàm có thuộc đoạn $[a; b]$ hay không. Lãi kép: Nhầm % (vd 5% = 0.05).]],

    text(weight: "bold", fill: teal)[c],
    [#badge12 *KB 1:* Tiệm cận xiên / Tiếp tuyến \ #badge11 *KB 2:* Biện luận nghiệm BPT Log],
    [#text(size: 8.5pt)[*KB 1:* Chia đa thức (hàm $bậc 2 / bậc 1$) tìm TCX. Hoặc tìm pttt: $y - y_0 = f'(x_0)(x - x_0)$.\ *KB 2:* BPT logarit chứa tham số $m$: $log_a(f(x)) > m$. Đòi hỏi phân tích miền nghiệm.]],
    [#text(size: 8.5pt)[★ Bắt buộc thực hiện phép chia đa thức cho hàm phân thức. Ôn hệ số góc của đường TCX.]],
    [#text(size: 8.5pt)[🟠 Hàm bậc 2/1 hỏi TCN (sai, chỉ có TCX và TCĐ). Chia đa thức sai dấu.]],

    text(weight: "bold", fill: teal)[d],
    [#badge12 *KB 1:* Hàm ẩn chứa tham số $m$ \ #badge11 *KB 2:* Bài toán tăng trưởng hàm hợp],
    [#text(size: 8.5pt)[Hỏi m để đồ thị hàm số có 3 cực trị, hoặc pt $f(f(x)) = m$ có $k$ nghiệm. Yêu cầu vẽ phác đồ thị, tịnh tiến đồ thị (GTTĐ, hàm hợp). Phân tích bảng biến thiên của hàm hợp $g(x) = f(u(x))$.]],
    [#text(size: 8.5pt)[★ Dùng sơ đồ V (hàm trị tuyệt đối) hoặc đặt ẩn phụ $t = u(x)$ để đếm số nghiệm theo tham số $m$.]],
    [#text(size: 8.5pt)[🔴 Quên trường hợp đường thẳng $y=m$ tiếp xúc với cực đại/tiểu. Bỏ sót điều kiện cực trị của hàm $u(x)$.]],
  )
)

// ══ CÂU 14: HÌNH HỌC KHÔNG GIAN ══
#ds-block(
  "14",
  "Hình học Không gian — Kết hợp Oxyz và Không gian cổ điển",
  [#badge12 Oxyz toàn diện · #badge12 Thể tích khối đa diện · #badge11 Góc & Khoảng cách cổ điển],
  (
    text(weight: "bold", fill: teal)[a],
    [#badge12 *KB 1:* Tọa độ điểm, vectơ (Oxyz) \ #badge11 *KB 2:* Nhận biết quan hệ song song/VG],
    [#text(size: 8.5pt)[*KB 1:* Các phép toán vectơ $+ - *$, tọa độ trung điểm, trọng tâm tam giác.\ *KB 2:* Cho hình chóp $S.ABCD$, kiểm tra $SA ⊥ (ABCD)$ hoặc $AB // (SCD)$ từ giả thiết.]],
    [#text(size: 8.5pt)[Nhớ hệ tọa độ $O x y z$, công thức trung điểm $M = (A+B)/2$. Thuộc định lý đường thẳng vuông góc với mặt phẳng.]],
    [#text(size: 8.5pt)[🟢 Nhầm dấu khi tính $vec(AB) = B - A$. Trực quan hình học yếu dẫn đến nhìn sai quan hệ vuông góc.]],

    text(weight: "bold", fill: teal)[b],
    [#badge12 *KB 1:* Pt mặt phẳng / đường thẳng \ #badge12 *KB 2:* Công thức thể tích cơ bản],
    [#text(size: 8.5pt)[*KB 1:* Lập pt mp qua 3 điểm (tích có hướng). Viết pt tham số của đường thẳng.\ *KB 2:* Tính thể tích hình chóp ($1/3 S h$), hình lăng trụ ($S h$). Xác định đường cao $h$ từ giả thiết.]],
    [#text(size: 8.5pt)[★ Tích có hướng: Dùng casio hoặc nhẩm cẩn thận. Thể tích: Xác định đúng đa giác đáy để tính $S$.]],
    [#text(size: 8.5pt)[🟡 Tính sai VTPT của mp. Quên nhân $1/3$ trong công thức thể tích khối chóp / nón.]],

    text(weight: "bold", fill: teal)[c],
    [#badge12 *KB 1:* Khoảng cách & Góc trong Oxyz \ #badge11 *KB 2:* Góc & Khoảng cách (Cổ điển)],
    [#text(size: 8.5pt)[*KB 1:* $d(M, (P)) = |a x_M + b y_M + c z_M + d| / sqrt(a^2 + b^2 + c^2)$. Góc giữa 2 mặt phẳng (cosin).\ *KB 2:* Dựng hình chiếu vuông góc. Tính góc giữa đường và mặt, góc nhị diện (hai mặt phẳng).]],
    [#text(size: 8.5pt)[★ Oxyz dễ ăn điểm hơn cổ điển. Nếu gặp cổ điển khó, có thể "tọa độ hóa" (gắn hệ trục $O x y z$) để làm.]],
    [#text(size: 8.5pt)[🟠 Quên trị tuyệt đối ở tử số tính khoảng cách. Góc nhị diện: xác định sai giao tuyến và 2 đường vuông góc.]],

    text(weight: "bold", fill: teal)[d],
    [#badge12 *KB 1:* Mặt cầu tương quan \ #badge12 *KB 2:* Tối ưu cực trị không gian],
    [#text(size: 8.5pt)[*KB 1:* Tương giao mặt cầu và mp (cắt theo đường tròn, tính bán kính thiết diện $r = sqrt(R^2 - d^2)$). \ *KB 2:* Cho điểm $A, B$, tìm $M ∈ (P)$ sao cho chu vi $ΔMAB$ nhỏ nhất, $MA^2 + MB^2$ cực tiểu.]],
    [#text(size: 8.5pt)[★ Tâm đường tròn giao tuyến là hình chiếu của tâm mặt cầu lên mp. Cực trị Oxyz: Dùng tâm tỉ cự hoặc đối xứng mặt phẳng.]],
    [#text(size: 8.5pt)[🔴 Mặt cầu chưa ở dạng chuẩn (quên chia hệ số). Cực trị: Lấy sai điểm đối xứng qua mặt phẳng.]],
  )
)

// ══ CÂU 15: GIẢI TÍCH, SỐ PHỨC & ĐẠI SỐ ══
#ds-block(
  "15",
  "Giải tích, Số phức & Đại số — Tính toán phức hợp",
  [#badge12 Tích phân & Ứng dụng · #badge12 Số phức (Mới) · #badge10 Bất phương trình · #badge10 Nhị thức Newton],
  (
    text(weight: "bold", fill: teal)[a],
    [#badge12 *KB 1:* Tính chất tích phân cơ bản \ #badge12 *KB 2:* Số phức - Dạng đại số],
    [#text(size: 8.5pt)[*KB 1:* Tách $∫_a^b [f(x) - g(x)] d x$; Đổi cận tích phân.\ *KB 2:* Các phép toán cộng, trừ, nhân số phức $z = a + b i$. Tìm phần thực, phần ảo, số phức liên hợp $overline(z)$.]],
    [#text(size: 8.5pt)[Tích phân: Đổi cận thì đổi dấu. Số phức: Nhớ $i^2 = -1$. Liên hợp của $a+bi$ là $a-bi$.]],
    [#text(size: 8.5pt)[🟢 Tính toán vội sai dấu. Số phức: Nhầm phần ảo là $bi$ (đúng là $b$ thôi).]],

    text(weight: "bold", fill: teal)[b],
    [#badge12 *KB 1:* Diện tích hình phẳng \ #badge12 *KB 2:* Phương trình bậc 2 số phức],
    [#text(size: 8.5pt)[*KB 1:* $S = ∫_a^b |f(x) - g(x)| d x$. Tính diện tích 1 miền cụ thể. \ *KB 2:* (L12 MỚI) Giải pt $a z^2 + b z + c = 0$ có $Δ < 0$, nghiệm là 2 số phức liên hợp. Hỏi thuộc tính nghiệm.]],
    [#text(size: 8.5pt)[★ Diện tích: Giải pt $f(x)=g(x)$ tìm cận, nhét $| |$ vào trong máy tính Casio.\ Số phức: Bấm máy giải PT bậc 2 (Mode 2).]],
    [#text(size: 8.5pt)[🟡 Diện tích ra âm do quên trị tuyệt đối. Số phức: Lấy sai mô-đun nghiệm $|z| = sqrt(a^2 + b^2)$.]],

    text(weight: "bold", fill: teal)[c],
    [#badge12 *KB 1:* Tích phân đổi biến/từng phần \ #badge10 *KB 2:* BPT 2 ẩn / Hệ BPT],
    [#text(size: 8.5pt)[*KB 1:* Tính $∫ f(x) e^x d x$ (Từng phần) hoặc $∫ x sqrt(x^2+1) d x$ (Đổi biến). \ *KB 2:* (Lớp 10) Biểu diễn miền nghiệm hệ BPT bậc nhất 2 ẩn, tìm GTLN/GTNN của hàm mục tiêu $F(x,y)$.]],
    [#text(size: 8.5pt)[★ Đổi biến: Nhớ đổi cận! Từng phần: Đặt $u$ theo thứ tự (Nhất log, nhì đa, tam lượng, tứ mũ). BPT: Tìm tọa độ các đỉnh miền đa giác.]],
    [#text(size: 8.5pt)[🟠 Đổi biến quên lấy vi phân $d x$. Từng phần sai quy tắc dấu. BPT: Xác định sai miền gạch chéo.]],

    text(weight: "bold", fill: teal)[d],
    [#badge12 *KB 1:* Thể tích vật tròn xoay / Thực tế \ #badge10 *KB 2:* Nhị thức Newton đa thức],
    [#text(size: 8.5pt)[*KB 1:* Quay miền quanh $O x$: $V = π ∫ f^2(x) d x$. Bài thực tế: tính quãng đường $S = ∫ v(t) d t$ với hàm $v(t)$ thay đổi dạng đa thức bậc 3. \ *KB 2:* Tìm hệ số của $x^k$ trong khai triển $(a x + b)^n$.]],
    [#text(size: 8.5pt)[★ Thể tích quay quanh $O y$ (đọc kỹ). Newton: $T_(k+1) = C_n^k a^(n-k) b^k$. Lưu ý khai triển gồm nhiều thành phần.]],
    [#text(size: 8.5pt)[🔴 Quên $π$ trong công thức thể tích. Quên bình phương $[f(x)]^2$. Newton: Quên dấu trừ nếu có $(-b)^k$.]],
  )
)

// ══ CÂU 16: XÁC SUẤT & THỐNG KÊ ══
#ds-block(
  "16",
  "Xác suất & Thống kê — Phân tích dữ liệu & Ra quyết định",
  [#badge12 Thống kê ghép nhóm · #badge12 Bayes · #badge11 Biến ngẫu nhiên · #badge10 Đại số tổ hợp],
  (
    text(weight: "bold", fill: teal)[a],
    [#badge12 *KB 1:* Bảng ghép nhóm (Trung vị/Tứ phân vị) \ #badge10 *KB 2:* Quy tắc đếm cơ bản],
    [#text(size: 8.5pt)[*KB 1:* Chỉ định nhóm chứa $Q_1, Q_2, Q_3$ bằng tần số tích lũy. Tính độ dài nhóm ghép. \ *KB 2:* Nhận diện dùng Hoán vị ($P_n$), Chỉnh hợp ($A_n^k$) hay Tổ hợp ($C_n^k$). Bài toán đếm số cách xếp chỗ.]],
    [#text(size: 8.5pt)[Tần số tích lũy: Cực kỳ quan trọng để xác định nhóm. Tổ hợp: Chọn không phân biệt thứ tự là $C$.]],
    [#text(size: 8.5pt)[🟢 Nhầm tần số tích lũy với tần số tuyệt đối. Nhầm Chỉnh hợp ($A$) và Tổ hợp ($C$).]],

    text(weight: "bold", fill: teal)[b],
    [#badge12 *KB 1:* Phương sai mẫu ghép nhóm \ #badge11 *KB 2:* Bảng PPXS của biến NN rời rạc],
    [#text(size: 8.5pt)[*KB 1:* Tính trung bình $overline(x)$, sau đó tính phương sai $s^2$. Đánh giá độ phân tán số liệu. \ *KB 2:* Tính Kỳ vọng $E(X) = Σ x_i p_i$. Kiểm tra tính hợp lệ của bảng: tổng các $p_i = 1$.]],
    [#text(size: 8.5pt)[★ *KB 1:* Bắt buộc dùng TRUNG ĐIỂM của mỗi nhóm làm đại diện. Dùng Casio 580/880 nhập bảng tần số thống kê.]],
    [#text(size: 8.5pt)[🟡 Lấy sai điểm đại diện nhóm (dùng cận thay vì trung điểm). Quên bình phương ở công thức độ lệch chuẩn.]],

    text(weight: "bold", fill: teal)[c],
    [#badge12 *KB 1:* Xác suất toàn phần \ #badge11 *KB 2:* Phân phối Nhị thức Bernoulli],
    [#text(size: 8.5pt)[*KB 1:* Bài toán sx 2-3 nhà máy. $P(L) = P(A)P(L|A) + P(B)P(L|B)$. \ *KB 2:* Thực hiện $n$ phép thử độc lập, xs thành công $p$. Tính xs đạt đúng $k$ thành công: $P(X=k) = C_n^k p^k (1-p)^(n-k)$.]],
    [#text(size: 8.5pt)[★ Toàn phần: Vẽ sơ đồ cây rẽ nhánh 2 cấp, nhân theo nhánh, cộng dọc các cành. Nhị thức: Dùng cho bài bắn súng, gieo xúc xắc n lần.]],
    [#text(size: 8.5pt)[🟠 Bernoulli: Quên nhân với $C_n^k$ tổ hợp các vị trí xuất hiện. Toàn phần: Thiết lập thiếu 1 nhánh.]],

    text(weight: "bold", fill: teal)[d],
    [#badge12 *KB 1:* Công thức Bayes \ #badge11 *KB 2:* Phương sai biến NN / Tổ hợp xác suất],
    [#text(size: 8.5pt)[*KB 1:* Hỏi ngược: Biết có lỗi, tính xs do nhà máy A làm? $P(A|L) = (P(A)*P(L|A))/P(L)$. \ *KB 2:* Tính $D(X) = E(X^2) - (E(X))^2$. Hoặc bài bốc bi (tổ hợp XS) qua nhiều hộp liên tiếp.]],
    [#text(size: 8.5pt)[★ Bayes = Tỉ lệ của (1 nhánh cụ thể) trên (tổng tất cả các nhánh đích). Sử dụng luôn kết quả mẫu số $P(L)$ từ câu c.]],
    [#text(size: 8.5pt)[🔴 Nghịch lý Bayes: Kết quả rất nhỏ/lớn so với trực giác. Đừng sợ, nếu vẽ cây đúng thì cứ tự tin điền.]],
  )
)

#v(0.5em)

// ╔════════════════════════════════════════════════════════╗
// ║  PHẦN III — 6 CÂU TRẢ LỜI NGẮN                     ║
// ╚════════════════════════════════════════════════════════╝
#section-header(
  "PHẦN III — TRẢ LỜI NGẮN (6 câu · 3,0 điểm · 0,5 đ/câu · Tự làm — Điền kết quả)",
  "Phân hóa siêu mạnh (0.5đ/câu): Các bài toán ở mức độ Vận Dụng và Vận Dụng Cao, rải rác nhiều chuyên đề",
  red
)

#table(
  columns: (0.5cm, 3.2cm, 4.5cm, 4.6cm, 3.7cm),
  inset: (x: 6pt, y: 7pt),
  align: (center, left, left, left, left),
  stroke: 0.5pt + border,
  fill: (x, y) => if y == 0 { rgb("991b1b") } else if calc.rem(y, 2) == 0 { rgb("fff1f2") } else { white },

  text(fill: white, weight: "bold", size: 8.5pt)[Câu],
  text(fill: white, weight: "bold", size: 8.5pt)[Phạm vi & Dạng toán],
  text(fill: white, weight: "bold", size: 8.5pt)[Các Kịch bản có thể xuất hiện],
  text(fill: white, weight: "bold", size: 8.5pt)[Phương pháp giải cốt lõi],
  text(fill: white, weight: "bold", size: 8.5pt)[Bẫy & Chú ý],

  // ══ C17 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[17]],
  [#badge12 *Tối ưu hóa hình học* \ #badge12 *Tối ưu kinh tế* \ #badge10 *BPT hệ 2 ẩn*],
  [#text(size: 8.5pt)[- Làm hộp, lon sữa (cố định V, min S).\ - Lợi nhuận/Chi phí doanh nghiệp.\ - Tìm max $F(x,y)$ với đk hệ BPT đa giác.]],
  [#text(size: 8.5pt)[*Hàm số:* Đưa về 1 biến $f(x)$, đạo hàm $f'(x)=0$ tìm cực trị. Lập BBT.\ *Lớp 10:* Tính $F(x,y)$ tại các đỉnh đa giác, lấy giá trị lớn nhất.]],
  [#text(size: 8.5pt)[Quên đk $r > 0, h > 0$. Giải pt đạo hàm sai. Điền sai đơn vị (lít vs cm3).]],

  // ══ C18 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[18]],
  [#badge12 *Xác suất Bayes* \ #badge11 *Xác suất cổ điển* \ #badge10 *Tổ hợp số lượng*],
  [#text(size: 8.5pt)[- Tính Bayes y tế (Dương tính/âm tính giả).\ - Rút thẻ/bi từ nhiều hộp phức tạp.\ - Đếm số cách xếp đội hình đan xen.]],
  [#text(size: 8.5pt)[*Bayes:* Vẽ sơ đồ cây 100%. \ *Cổ điển:* Đếm n(A) và n(Ω). \ *Tổ hợp:* Chia giai đoạn, quy tắc nhân. Cẩn thận bài chia nhóm.]],
  [#text(size: 8.5pt)[Xác suất Bayes thường ra số lẻ dài, làm tròn đúng yêu cầu (vd 2 chữ số thập phân). Nhầm tổ hợp và chỉnh hợp.]],

  // ══ C19 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[19]],
  [#badge12 *Oxyz Khoảng cách* \ #badge12 *Mặt cầu* \ #badge11 *KG cổ điển*],
  [#text(size: 8.5pt)[- Tính kc điểm đến mp, góc đường-mp.\ - Bán kính đường tròn thiết diện.\ - Hình chóp/Lăng trụ: Thể tích góc, kc.]],
  [#text(size: 8.5pt)[*Oxyz:* Thuộc công thức $d, cos, sin$. \ *Thiết diện:* Pitago $r^2 = R^2 - d^2$. \ *Cổ điển:* Đổi đỉnh tính khoảng cách, thể tích tỉ lệ (Simpson).]],
  [#text(size: 8.5pt)[Quên lấy căn khi tính $r$. Oxyz hay bị sai dấu vô duyên. Cổ điển: nhầm chiều cao h.]],

  // ══ C20 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[20]],
  [#badge12 *Tích phân thực tế* \ #badge11 *Mũ-Log ứng dụng* \ #badge12 *Diện tích phức*],
  [#text(size: 8.5pt)[- Tính quãng đường ($∫ |v(t)| d t$).\ - Tăng trưởng dân số ($P = P_0 e^(r t)$).\ - Diện tích hình phẳng nhiều hàm cắt nhau.]],
  [#text(size: 8.5pt)[*Vận tốc:* Nếu hàm đổi dấu qua $t_0$, phải tách thành $∫_{t_1}^{t_0} - ∫_{t_0}^{t_2}$. \ *Tăng trưởng:* Logarit hóa tìm $t$. \ *DT:* Vẽ phác đồ thị.]],
  [#text(size: 8.5pt)[Vận tốc âm: quên trị tuyệt đối → kết quả sai lệch. Tăng trưởng: nhầm rate $r$ ra số thập phân.]],

  // ══ C21 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[21]],
  [#badge12 *Thống kê* \ #badge11 *Dãy số - CSN* \ #badge10 *Đại số*],
  [#text(size: 8.5pt)[- Tính Phương sai, CV mẫu ghép nhóm.\ - Tính tổng vô hạn, kỳ hạn trả góp.\ - Parabol, hệ PT ứng dụng.]],
  [#text(size: 8.5pt)[*Thống kê:* Nhập máy tính số trung bình, phương sai $s^2 = overline(x^2) - (overline(x))^2$. \ *Dãy số:* $S_n = u_1 (q^n-1)/(q-1)$.]],
  [#text(size: 8.5pt)[Thống kê: Bắt buộc dùng trung điểm nhóm làm $x_i$, không lấy biên. Dãy số: Sai $n$ (đếm số kỳ).]],

  // ══ C22 ══
  align(center)[#text(weight: "bold", size: 10pt, fill: red)[22]],
  [#badge12 *Vận dụng cao Oxyz* \ #badge12 *Hàm ẩn/PT hàm* \ #badge10 *Cônic nâng cao*],
  [#text(size: 8.5pt)[- Tìm min $M A + M B$ trên mp.\ - Tích phân hàm ẩn $f(x) f'(x) = g(x)$.\ - Bài toán Elip/Parabol radar/cáp treo.]],
  [#text(size: 8.5pt)[*Oxyz:* Dùng phép đối xứng mặt phẳng. $A' = A - 2t vec(n)$.\ *Hàm ẩn:* Tích phân hai vế. \ *Cônic:* Tọa độ hóa đặt gốc O chuẩn.]],
  [#text(size: 8.5pt)[Câu phân loại lấy 9.5-10. Đừng kẹt quá 5 phút. Điền bừa nếu hết giờ (ví dụ số nguyên đẹp).]],
)

#v(1em)

// ╔════════════════════════════════════════════════════════╗
// ║  BẢNG TỔNG KẾT & CHIẾN LƯỢC                         ║
// ╚════════════════════════════════════════════════════════╝
#block(width: 100%, fill: amber, inset: (x: 12pt, y: 9pt), radius: (top: 5pt, bottom: 0pt))[
  #text(size: 11pt, weight: "bold", fill: white)[BẢNG TỔNG KẾT — Cấu trúc bao phủ đa chiều (Lớp 10 / 11 / 12)]
]

#table(
  columns: (0.8cm, 2.3cm, 1.2cm, 1.2cm, 1.2cm, 4.5cm, 3.8cm),
  inset: (x: 6pt, y: 7pt),
  align: (center, left, center, center, center, left, left),
  stroke: 0.5pt + border,
  fill: (x, y) => if y == 0 { rgb("78350f") } else if calc.rem(y, 2) == 0 { rgb("fffbeb") } else { white },

  text(fill: white, weight: "bold", size: 8.5pt)[Câu],
  text(fill: white, weight: "bold", size: 8.5pt)[Lĩnh vực Trọng điểm],
  text(fill: white, weight: "bold", size: 8.5pt)[L10],
  text(fill: white, weight: "bold", size: 8.5pt)[L11],
  text(fill: white, weight: "bold", size: 8.5pt)[L12],
  text(fill: white, weight: "bold", size: 8.5pt)[Các Kịch Bản Cốt Lõi Có Thể Xuất Hiện],
  text(fill: white, weight: "bold", size: 8.5pt)[Mục tiêu Điểm],

  [1–5], [Đại số & Giải tích],
  text(size: 8pt)[Bậc 2\ Parabol], text(size: 8pt)[Mũ-Log\ Dãy số], text(size: 8pt)[Bậc 3\ Phân thức],
  [#text(size: 8pt)[★ BBT, cực trị, Tiệm cận xiên (MỚI), Lãi kép, BPT Logarit]],
  [#text(size: 8pt)[1,25 điểm · Bắt buộc lấy]],

  [6–7], [Tích phân & Conic],
  text(size: 8pt)[★ Cônic], text(size: 8pt)[Lượng giác], text(size: 8pt)[Tích phân],
  [#text(size: 8pt)[★ Diện tích/Thể tích, Elip/Hyperbol (L10 MỚI)]],
  [#text(size: 8pt)[0,5 điểm P.I]],

  [8–9], [Không gian & Oxyz],
  text(size: 8pt)[ĐT mp], text(size: 8pt)[Góc/KC], text(size: 8pt)[★ Oxyz],
  [#text(size: 8pt)[★ PT mặt phẳng, đường thẳng, góc, khoảng cách, mặt cầu]],
  [#text(size: 8pt)[0,5 điểm P.I]],

  [10–12], [TK, XS, Thực tế],
  text(size: 8pt)[Đếm], text(size: 8pt)[Bernoulli], text(size: 8pt)[★ Ghép\ nhóm],
  [#text(size: 8pt)[★ Tứ phân vị, Bayes, XS toàn phần, Nhị thức (L11)]],
  [#text(size: 8pt)[0,75 điểm P.I]],

  [13–16], [4 câu Đ/S Đa năng],
  text(size: 8pt)[Nhị thức\ BPT], text(size: 8pt)[Mũ-Log\ Số phức], text(size: 8pt)[★ Chủ đạo],
  [#text(size: 8pt)[★ Không fix cứng chương! Trộn Đại số, Hình, TK-XS. Câu c, d phân hóa cực độ (Tiếp tuyến, Bayes, Cực trị Oxyz)]],
  [#text(size: 8pt)[4,0 điểm · Tâm điểm bài thi]],

  [17–22], [6 câu Trả lời ngắn],
  text(size: 8pt)[Hệ PT\ Đa giác], text(size: 8pt)[Lãi kép\ C.số], text(size: 8pt)[★ Chủ đạo],
  [#text(size: 8pt)[★ Có 3 kịch bản cho mỗi câu. Tối ưu thực tế, Bayes nâng cao, Tích phân ẩn, Oxyz cực trị, Phương sai mẫu nhóm.]],
  [#text(size: 8pt)[3,0 điểm · Chọn câu sở trường]],
)

#v(0.8em)

// Box chiến lược cuối
#block(width: 100%, fill: rgb("f0fdf4"), stroke: (left: 4pt + teal, rest: 0.5pt + rgb("bbf7d0")), inset: 12pt, radius: (right: 4pt))[
  #text(fill: teal, weight: "bold", size: 11pt)[📌 CHIẾN LƯỢC TỐI ƯU HÓA 90 PHÚT THEO TỪNG CẤP ĐỘ ĐIỂM MỤC TIÊU]
  #v(0.5em)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 10pt,
    block(fill: white, stroke: 0.5pt + border, inset: 8pt, radius: 3pt)[
      #text(weight: "bold", fill: navy, size: 9.5pt)[Mục tiêu 6.5 - 7.0]
      #text(size: 8.5pt)[
        - Hoàn hảo Phần I (3.0đ) trong 30p \
        - Phần II: Chỉ đánh ý a, b (chắc 1.4đ). Đoán c, d theo quy luật (chỉ 1-2 True/False). \
        - Phần III: Chỉ làm câu Dễ (Thống kê / Oxyz cơ bản) \
        - *Chiến thuật: Chậm, chắc, không sai ngu.*
      ]
    ],
    block(fill: white, stroke: 0.5pt + border, inset: 8pt, radius: 3pt)[
      #text(weight: "bold", fill: teal, size: 9.5pt)[Mục tiêu 8.0 - 8.5]
      #text(size: 8.5pt)[
        - Phần I: 25p tốc độ cao. \
        - Phần II: Làm 3 ý a, b, c của cả 4 câu (khoảng 2.0đ - 3.0đ). Cố gồng 1 ý d quen thuộc. \
        - Phần III: Làm 3-4 câu (Tối ưu hóa, Bayes, Thống kê ghép nhóm).
      ]
    ],
    block(fill: white, stroke: 0.5pt + border, inset: 8pt, radius: 3pt)[
      #text(weight: "bold", fill: red, size: 9.5pt)[Mục tiêu 9.5+]
      #text(size: 8.5pt)[
        - Phần I: 15-20p. \
        - Phần II: Quét sạch 4 ý d phân hóa (Cực trị đồ thị, Max-min Oxyz, Bayes khó). \
        - Phần III: Xử lý Tích phân hàm ẩn và Hệ PT/Conic Lớp 10. \
        - *Bẫy: Tỉnh táo đơn vị và điều kiện đầu mút.*
      ]
    ],
  )
]
"""

with open('bang-phan-tich-22cau-toan-2026.typ', 'w') as f:
    f.write(new_content)

print("Part II and III replaced successfully.")
