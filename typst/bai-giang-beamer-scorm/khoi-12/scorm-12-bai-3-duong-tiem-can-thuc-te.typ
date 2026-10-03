#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// ĐỀ THỰC TẾ: ỨNG DỤNG TIỆM CẬN TRONG MÔ HÌNH HÓA
// Gồm 20 TN, 10 ĐS, 10 TLN (Có giải step-by-step, bảng biểu)
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer.typ": *
#import "../../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))

#show: lecture-theme.with(
  title:       "Bài 3: Ứng Dụng Tiệm Cận Thực Tế",
  subtitle:    "TOÁN 12 — Chuyên Đề Bồi Dưỡng Mô Hình Hóa",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

// ════════════════════════════════════════════════

#lt-section-link("sec-4434a3", "💡", [Các Mô Hình Thực Tế])
#lt-slide-back(title: "1. Mô Hình Y Học & Vật Lý")[
  #lt-two-col(ratio: (50%, 50%))[
    *Nồng độ thuốc trong máu*
    - Hàm số: 
      $ C(t) = (a t)/(t^2 + b) $
    - Tiệm cận ngang: $C = 0$.
    - *Ý nghĩa:* Sau một thời gian dài ($t -> +oo$), cơ thể đào thải hoàn toàn lượng thuốc và nồng độ thuốc trở về 0.
  ][
    *Định luật làm nguội Newton*
    - Hàm số: 
      $ T(t) = T_"môi_trường" + (T_"ban_đầu" - T_"môi_trường") e^(-k t) $
    - Tiệm cận ngang: $T = T_"môi_trường"$.
    - *Ý nghĩa:* Vật nóng sẽ nguội dần về trạng thái cân bằng nhiệt với môi trường.
  ]
]

#lt-slide-back(title: "2. Mô Hình Sinh Học & Xã Hội")[
  #lt-two-col(ratio: (50%, 50%))[
    *Tăng trưởng Logistic (Dân số/Vi khuẩn)*
    - Hàm số: 
      $ P(t) = C / (1 + A e^(-k t)) $
    - Tiệm cận ngang: $P = C$.
    - *Ý nghĩa:* Dân số không thể tăng mãi mà sẽ bị giới hạn bởi không gian và thức ăn ở ngưỡng sức chứa của môi trường là $C$.
  ][
    *Mô hình mức độ lan truyền thông tin*
    - Hàm số: 
      $ N(t) = (A t^2)/(t^2 + B) $
    - Tiệm cận ngang: $N = A$.
    - *Ý nghĩa:* Số lượng người tiếp cận tin tức bão hòa tại mức $A$ người dùng khi chiến dịch đã chạy đủ lâu.
  ]
]

#lt-slide-back(title: "3. Mô Hình Kinh Tế & Môi Trường")[
  #lt-two-col(ratio: (50%, 50%))[
    *Chi phí trung bình*
    - Hàm số: 
      $ C(x) = (A x + B)/x = A + B/x $
    - Tiệm cận ngang: $C = A$.
    - *Ý nghĩa:* Khi sản xuất cực kỳ nhiều, chi phí trung bình tiệm cận mức giá phí cố định tối thiểu.
  ][
    *Chi phí xử lý rác thải ($p%$)*
    - Hàm số: 
      $ C(p) = (k p)/(100 - p) $
    - Tiệm cận đứng: $p = 100$.
    - *Ý nghĩa:* Để làm sạch tuyệt đối 100% môi trường, chi phí sẽ bùng nổ vô hạn.
  ]
]


#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", dir: "doc", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: [])
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de, dir: dir)
}

#my-tn(de: "Toán Thực Tế - Tiệm cận ngang",
  [Một công ty dược phẩm ước tính rằng nồng độ của một loại thuốc trong máu của bệnh nhân sau $t$ giờ tiêm được mô phỏng bởi hàm số $C(t) = (25t)/(t^2 + 4)$ (mg/L). Khi thời gian trôi đi rất lâu ($t -> +oo$), nồng độ thuốc trong máu tiến tới giá trị nào sau đây?],
  (
    [$25$ mg/L.],
    [$12.5$ mg/L.],
    [$0$ mg/L.],
    [$6.25$ mg/L.]
  ),
  correct: 2,
  loigiai: [
    #step[Bước 1: Thiết lập giới hạn]
    Để tìm nồng độ thuốc khi thời gian trôi đi rất lâu, ta cần tính giới hạn của $C(t)$ khi $t -> +oo$.
    #step[Bước 2: Tính toán]
    $ limits(lim)_(t -> +oo) C(t) = limits(lim)_(t -> +oo) (25t)/(t^2 + 4) = limits(lim)_(t -> +oo) (25/t)/(1 + 4/t^2) $
    #step[Bước 3: Kết luận]
    Khi $t -> +oo$, ta có $25/t -> 0$ và $4/t^2 -> 0$, do đó giới hạn bằng $0$.
    Điều này có nghĩa nồng độ thuốc trong máu sẽ giảm dần về $0$ (cơ thể đào thải hoàn toàn thuốc). Đồ thị có tiệm cận ngang là trục hoành $C = 0$.
  ]
)

#my-tn(de: "Toán Thực Tế - Tiệm cận ngang",
  [Chi phí trung bình (nghìn đồng) để sản xuất một linh kiện điện tử phụ thuộc vào số lượng linh kiện $x$ được sản xuất theo hàm số $C(x) = (150x + 2000)/(x)$. Khi sản xuất số lượng linh kiện cực kì lớn, chi phí trung bình cho mỗi linh kiện sẽ tiệm cận về mức nào?],
  (
    [$150$ nghìn đồng.],
    [$2000$ nghìn đồng.],
    [$0$ nghìn đồng.],
    [$15$ nghìn đồng.]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Thiết lập giới hạn]
    Tính giới hạn của hàm chi phí trung bình $C(x)$ khi $x -> +oo$.
    #step[Bước 2: Tính toán]
    $ limits(lim)_(x -> +oo) C(x) = limits(lim)_(x -> +oo) (150x + 2000)/(x) = limits(lim)_(x -> +oo) (150 + 2000/x) $
    #step[Bước 3: Kết luận]
    Vì $2000/x -> 0$ khi $x -> +oo$, nên giới hạn bằng $150$.
    Điều này cho thấy khi mở rộng quy mô sản xuất vô hạn, chi phí sản xuất mỗi linh kiện sẽ tiệm cận mức giá tối thiểu là $150$ nghìn đồng (chỉ còn chi phí biến đổi, khấu hao chi phí cố định).
  ]
)

#my-tn(de: "Toán Thực Tế - Tiệm cận đứng",
  [Theo định luật Boyle-Mariotte, áp suất $P$ (atm) của một khối khí lý tưởng trong một xilanh phụ thuộc vào thể tích $V$ (lít) theo công thức $P(V) = 20/V$ (với nhiệt độ không đổi). Nếu thể tích xilanh bị nén lại gần bằng $0$, điều gì sẽ xảy ra với áp suất?],
  (
    [Áp suất tiến tới $0$.],
    [Áp suất tiến tới vô cực (rất lớn).],
    [Áp suất giữ nguyên $20$ atm.],
    [Áp suất giảm xuống số âm.]
  ),
  correct: 1,
  loigiai: [
    #step[Bước 1: Phân tích mô hình]
    Khảo sát hàm số $P(V) = 20/V$ khi thể tích $V -> 0^+$.
    #step[Bước 2: Tính giới hạn]
    $ limits(lim)_(V -> 0^+) P(V) = limits(lim)_(V -> 0^+) 20/V = +oo $
    #step[Bước 3: Kết luận]
    Hàm số có đường tiệm cận đứng là $V = 0$ (trục tung). Nghĩa là khi bị nén đến mức cực hạn (thể tích tiến về $0$), áp suất của khối khí sẽ tăng lên vô hạn, có thể gây nổ xilanh.
  ]
)

#my-tn(de: "Toán Thực Tế - Tiệm cận xiên",
  [Hàm số biểu diễn tổng lợi nhuận $P(x)$ (triệu đồng) của một cửa hàng kinh doanh phụ thuộc vào lượng hàng hóa $x$ (tấn) bán ra theo mô hình $P(x) = (3x^2 - x + 10)/(x + 1)$. Đường tiệm cận xiên của đồ thị hàm số này phản ánh xu hướng lợi nhuận biên khi lượng hàng bán ra rất lớn. Phương trình đường tiệm cận xiên là:],
  (
    [$y = 3x - 1$],
    [$y = 3x - 4$],
    [$y = 3x + 1$],
    [$y = x - 4$]
  ),
  correct: 1,
  loigiai: [
    #step[Bước 1: Thực hiện phép chia đa thức]
    Chia tử thức $(3x^2 - x + 10)$ cho mẫu thức $(x + 1)$:
    $3x^2 - x + 10 = 3x(x + 1) - 4(x + 1) + 14$
    Do đó, $P(x) = 3x - 4 + 14/(x + 1)$.
    #step[Bước 2: Tìm tiệm cận xiên]
    Khi $x -> +oo$, đại lượng $14/(x + 1) -> 0$.
    Nên đường tiệm cận xiên của đồ thị là $y = 3x - 4$.
    #step[Bước 3: Phân tích thực tế]
    Đường tiệm cận xiên $y = 3x - 4$ cho thấy khi bán lượng hàng rất lớn, mỗi tấn hàng tăng thêm sẽ đóng góp gần đúng $3$ triệu đồng vào tổng lợi nhuận, bù trừ một khoản hao hụt cố định là $4$ triệu.
  ]
)

#my-tn(de: "Toán Thực Tế - Tăng trưởng Logistic",
  [Số lượng người tham gia một mạng xã hội mới sau $t$ tháng ra mắt được mô phỏng bởi hàm Logistic: $N(t) = 500000 / (1 + 49 e^(-0.2t))$. Hỏi số lượng người dùng tối đa mà mạng xã hội này có thể đạt được (tiệm cận ngang) là bao nhiêu?],
  (
    [$10,000$ người.],
    [$490,000$ người.],
    [$500,000$ người.],
    [Vô hạn.]
  ),
  correct: 2,
  loigiai: [
    #step[Bước 1: Thiết lập giới hạn]
    Để tìm lượng người dùng bão hòa (tối đa), ta xét giới hạn của $N(t)$ khi thời gian trôi đi rất lâu, tức là $t -> +oo$.
    #step[Bước 2: Tính toán]
    Vì $e^(-0.2t) = 1/(e^(0.2t))$, nên khi $t -> +oo$, ta có $e^(-0.2t) -> 0$.
    Khi đó, mẫu số sẽ tiến tới $1 + 49 dot 0 = 1$.
    $ limits(lim)_(t -> +oo) N(t) = 500000 / 1 = 500000 $
    #step[Bước 3: Kết luận]
    Số lượng người dùng sẽ đạt trạng thái bão hòa (tiệm cận ngang) ở ngưỡng $500,000$ người.
  ]
)

#my-tn(de: "Toán Thực Tế - Vật lý (Định luật làm nguội)",
  [Một thanh kim loại có nhiệt độ $150^circ C$ được nhúng vào một bể nước làm mát có nhiệt độ ổn định ở mức $25^circ C$. Nhiệt độ thanh kim loại sau $t$ phút tuân theo hàm số $T(t) = 25 + 125 e^(-0.1t)$. Đường tiệm cận ngang của đồ thị biểu diễn nhiệt độ $T(t)$ là gì và mang ý nghĩa gì?],
  (
    [$T = 0$; thanh kim loại nguội hoàn toàn về $0^circ C$.],
    [$T = 25$; thanh kim loại dần cân bằng với nhiệt độ bể làm mát là $25^circ C$.],
    [$T = 150$; nhiệt độ thanh kim loại không đổi.],
    [$T = 125$; nhiệt độ giảm dần đi $125^circ C$.]
  ),
  correct: 1,
  loigiai: [
    #step[Bước 1: Tìm giới hạn vô cực]
    Xét giới hạn của hàm nhiệt độ $T(t)$ khi $t -> +oo$:
    $ limits(lim)_(t -> +oo) T(t) = limits(lim)_(t -> +oo) (25 + 125 e^(-0.1t)) $
    #step[Bước 2: Đánh giá thành phần]
    Khi $t -> +oo$, phần mũ $e^(-0.1t) -> 0$.
    Do đó, $T(t) -> 25 + 125 dot 0 = 25$.
    #step[Bước 3: Kết luận]
    Đường tiệm cận ngang là $T = 25$. Về mặt vật lý, sau một thời gian dài, thanh kim loại sẽ đạt trạng thái cân bằng nhiệt với môi trường bể nước là $25^circ C$.
  ]
)

#my-tn(de: "Toán Thực Tế - Động lực học (Vận tốc rơi)",
  [Một viên bi thép được thả rơi trong một chất lỏng. Vận tốc rơi của viên bi $v(t)$ (m/s) thay đổi theo thời gian $t$ (giây) theo phương trình $v(t) = 15(1 - e^(-2t))$. Sau một thời gian đủ dài, viên bi sẽ rơi với một "vận tốc giới hạn" không đổi. Vận tốc giới hạn đó là:],
  (
    [$0$ m/s.],
    [$2$ m/s.],
    [$15$ m/s.],
    [$30$ m/s.]
  ),
  correct: 2,
  loigiai: [
    #step[Bước 1: Nhận định mô hình]
    Vận tốc giới hạn (terminal velocity) chính là giới hạn của hàm $v(t)$ khi $t -> +oo$.
    #step[Bước 2: Tính giới hạn]
    Ta có $limits(lim)_(t -> +oo) v(t) = limits(lim)_(t -> +oo) 15(1 - e^(-2t))$.
    Vì $e^(-2t) -> 0$ khi $t -> +oo$.
    Nên giới hạn bằng $15(1 - 0) = 15$.
    #step[Bước 3: Kết luận]
    Đường tiệm cận ngang của đồ thị vận tốc là $v = 15$. Vận tốc giới hạn của viên bi thép trong chất lỏng là $15$ m/s.
  ]
)

#my-tn(de: "Toán Thực Tế - Mức độ nhiễm trùng",
  [Mức độ nhiễm một loại vi khuẩn trong một cơ thể (tính bằng hàng nghìn tế bào/ml) sau $t$ ngày sử dụng kháng sinh được mô hình bởi hàm $M(t) = (10t + 50)/(t^2 + 1)$. Đường tiệm cận của đồ thị hàm số này cho biết điều gì về tình trạng bệnh nhân về lâu dài?],
  (
    [Tiệm cận ngang $M = 0$: Vi khuẩn bị tiêu diệt hoàn toàn.],
    [Tiệm cận ngang $M = 10$: Vi khuẩn giảm nhưng duy trì ở mức $10$ nghìn tế bào/ml.],
    [Tiệm cận ngang $M = 50$: Mức độ nhiễm không đổi.],
    [Tiệm cận đứng $t = -1$: Bệnh nhân phục hồi ở ngày thứ $-1$.]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tìm tiệm cận ngang]
    Xét giới hạn $limits(lim)_(t -> +oo) (10t + 50)/(t^2 + 1)$. Bậc của tử số (bậc 1) nhỏ hơn bậc của mẫu số (bậc 2).
    #step[Bước 2: Tính toán]
    Chia cả tử và mẫu cho $t^2$, ta được:
    $ limits(lim)_(t -> +oo) (10/t + 50/t^2)/(1 + 1/t^2) = 0/1 = 0 $
    #step[Bước 3: Kết luận]
    Đường tiệm cận ngang là trục hoành $M = 0$. Về mặt y học, điều này cho thấy nếu duy trì dùng kháng sinh, lượng vi khuẩn sẽ tiến dần về $0$, đồng nghĩa bệnh nhân sẽ khỏi bệnh hoàn toàn.
  ]
)

#my-tn(de: "Toán Thực Tế - Năng lượng tuabin",
  [Công suất phát điện $P$ (MegaWatt) của một tuabin gió phụ thuộc vào vận tốc gió $v$ (m/s) theo hàm $P(v) = (5v^3)/(v^3 + 200)$ với $v >= 0$. Hỏi công suất tối đa theo thiết kế của tuabin này tiến tới bao nhiêu khi vận tốc gió cực lớn?],
  (
    [$0$ MW.],
    [$200$ MW.],
    [$5$ MW.],
    [Vô hạn.]
  ),
  correct: 2,
  loigiai: [
    #step[Bước 1: Phân tích mô hình]
    Công suất khi vận tốc gió cực lớn tương ứng với $limits(lim)_(v -> +oo) P(v)$.
    #step[Bước 2: Tính giới hạn]
    Ta có $limits(lim)_(v -> +oo) (5v^3)/(v^3 + 200) = limits(lim)_(v -> +oo) 5/(1 + 200/v^3) = 5/1 = 5$.
    #step[Bước 3: Kết luận]
    Đồ thị có tiệm cận ngang $P = 5$. Dù gió có mạnh đến mức bão, hệ thống điều tốc của tuabin cũng sẽ giới hạn công suất phát điện ở ngưỡng cực đại thiết kế là $5$ MW.
  ]
)

#my-tn(de: "Toán Thực Tế - Chi phí làm sạch môi trường",
  [Chi phí $C$ (tỷ đồng) để xử lý $p\%$ lượng rác thải hóa học trên một dòng sông được cho bởi hàm $C(p) = (120p)/(100 - p)$ với $0 <= p < 100$. Điều gì xảy ra với chi phí khi yêu cầu xử lý triệt để 100% rác thải ($p -> 100^-$)?],
  (
    [Chi phí bằng $120$ tỷ đồng.],
    [Chi phí sẽ bằng $0$ (vì đã sạch).],
    [Chi phí tăng tới vô cực (rất khó đạt 100% sạch).],
    [Chi phí giảm đột ngột.]
  ),
  correct: 2,
  loigiai: [
    #step[Bước 1: Xét giới hạn tại $p = 100$]
    Ta tính $limits(lim)_(p -> 100^-) C(p) = limits(lim)_(p -> 100^-) (120p)/(100 - p)$.
    #step[Bước 2: Phân tích kết quả]
    Khi $p -> 100^-$, tử số $120p -> 12000 > 0$, mẫu số $100 - p -> 0$ và mang dấu dương.
    Nên phân thức tiến tới $+oo$.
    #step[Bước 3: Kết luận]
    Đồ thị hàm số nhận đường thẳng $p = 100$ làm tiệm cận đứng. Về thực tế, để lọc sạch tuyệt đối $100\%$ lượng chất độc hóa học trong một con sông là một nhiệm vụ đòi hỏi chi phí khổng lồ (vô hạn), gần như bất khả thi.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 11",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (110t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$110$],
    [$50$],
    [$55$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (110t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $110$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $110$ cá thể.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 12",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (120t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$120$],
    [$50$],
    [$60$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (120t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $120$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $120$ cá thể.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 13",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (130t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$130$],
    [$50$],
    [$65$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (130t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $130$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $130$ cá thể.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 14",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (140t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$140$],
    [$50$],
    [$70$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (140t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $140$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $140$ cá thể.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 15",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (150t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$150$],
    [$50$],
    [$75$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (150t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $150$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $150$ cá thể.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 16",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (160t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$160$],
    [$50$],
    [$80$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (160t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $160$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $160$ cá thể.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 17",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (170t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$170$],
    [$50$],
    [$85$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (170t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $170$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $170$ cá thể.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 18",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (180t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$180$],
    [$50$],
    [$90$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (180t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $180$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $180$ cá thể.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 19",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (190t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$190$],
    [$50$],
    [$95$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (190t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $190$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $190$ cá thể.
  ]
)

#my-tn(de: "Toán Thực Tế - Bài toán 20",
  [Một mô hình dân số sinh thái cho biết số cá thể $P(t)$ sau $t$ năm tuân theo quy luật $P(t) = (200t^2 + 50) / (t^2 + 2)$. Khi thời gian tiến về vô cực, quần thể này sẽ ổn định ở mức bao nhiêu cá thể?],
  (
    [$200$],
    [$50$],
    [$100$],
    [Vô hạn]
  ),
  correct: 0,
  loigiai: [
    #step[Bước 1: Tính tiệm cận ngang]
    Giới hạn tại vô cực: $limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (200t^2 + 50) / (t^2 + 2)$.
    #step[Bước 2: Tính toán]
    Bậc tử bằng bậc mẫu, chia tử và mẫu cho $t^2$, ta được kết quả là $200$.
    #step[Kết luận:]
    Quần thể tiến đến mức ổn định (tiệm cận ngang) là $200$ cá thể.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 1",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 1x + 2 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 1$.],
    [Đường tiệm cận xiên của hàm số là $y = 1x + 2$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (1x + 2 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 1x + 2$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 2",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 2x + 4 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 2$.],
    [Đường tiệm cận xiên của hàm số là $y = 2x + 4$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (2x + 4 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 2x + 4$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 3",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 3x + 6 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 3$.],
    [Đường tiệm cận xiên của hàm số là $y = 3x + 6$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (3x + 6 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 3x + 6$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 4",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 4x + 8 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 4$.],
    [Đường tiệm cận xiên của hàm số là $y = 4x + 8$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (4x + 8 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 4x + 8$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 5",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 5x + 10 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 5$.],
    [Đường tiệm cận xiên của hàm số là $y = 5x + 10$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (5x + 10 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 5x + 10$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 6",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 6x + 12 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 6$.],
    [Đường tiệm cận xiên của hàm số là $y = 6x + 12$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (6x + 12 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 6x + 12$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 7",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 7x + 14 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 7$.],
    [Đường tiệm cận xiên của hàm số là $y = 7x + 14$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (7x + 14 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 7x + 14$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 8",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 8x + 16 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 8$.],
    [Đường tiệm cận xiên của hàm số là $y = 8x + 16$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (8x + 16 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 8x + 16$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 9",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 9x + 18 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 9$.],
    [Đường tiệm cận xiên của hàm số là $y = 9x + 18$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (9x + 18 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 9x + 18$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-ds(de: "Toán Thực Tế - Đúng/Sai 10",
  [Một nhà nghiên cứu kinh tế đưa ra mô hình hàm chi phí sản xuất trung bình $A(x) = 10x + 20 + 100/x$ (triệu đồng) với $x > 0$ là số ngàn sản phẩm. Xét tính đúng sai của các nhận định:],
  (
    [Đồ thị hàm số có tiệm cận đứng là $x = 0$.],
    [Đồ thị hàm số có tiệm cận ngang là $y = 10$.],
    [Đường tiệm cận xiên của hàm số là $y = 10x + 20$.],
    [Khi sản xuất vô hạn ($x -> +oo$), chi phí trung bình sẽ tiến dần về $0$.]
  ),
  correct: "1010",
  loigiai: [
    - a) Đúng. Vì $limits(lim)_(x -> 0^+) (10x + 20 + 100/x) = +oo$ nên $x = 0$ là TCĐ (khi làm ra quá ít sản phẩm, chi phí chia đều sẽ khổng lồ).
    - b) Sai. Hàm số bậc nhất chia $x$ không có TCN, $limits(lim)_(x -> +oo) A(x) = +oo$.
    - c) Đúng. Vì phần dư $100/x -> 0$ khi $x -> +oo$, TCX là $y = 10x + 20$.
    - d) Sai. Khi $x -> +oo$, chi phí tăng dọc theo đường tiệm cận xiên, không phải giảm về $0$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 1",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (3t^2 - 1t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-1$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(3t^2 - 1t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 3t - 4$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 3t - 4$. 
    Suy ra $a = 3$ và $b = -4$.
    #step[Kết luận:]
    $T = a + b = 3 - 4 = -1$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 2",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (6t^2 - 2t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-2$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(6t^2 - 2t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 6t - 8$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 6t - 8$. 
    Suy ra $a = 6$ và $b = -8$.
    #step[Kết luận:]
    $T = a + b = 6 - 8 = -2$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 3",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (9t^2 - 3t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-3$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(9t^2 - 3t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 9t - 12$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 9t - 12$. 
    Suy ra $a = 9$ và $b = -12$.
    #step[Kết luận:]
    $T = a + b = 9 - 12 = -3$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 4",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (12t^2 - 4t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-4$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(12t^2 - 4t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 12t - 16$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 12t - 16$. 
    Suy ra $a = 12$ và $b = -16$.
    #step[Kết luận:]
    $T = a + b = 12 - 16 = -4$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 5",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (15t^2 - 5t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-5$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(15t^2 - 5t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 15t - 20$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 15t - 20$. 
    Suy ra $a = 15$ và $b = -20$.
    #step[Kết luận:]
    $T = a + b = 15 - 20 = -5$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 6",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (18t^2 - 6t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-6$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(18t^2 - 6t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 18t - 24$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 18t - 24$. 
    Suy ra $a = 18$ và $b = -24$.
    #step[Kết luận:]
    $T = a + b = 18 - 24 = -6$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 7",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (21t^2 - 7t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-7$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(21t^2 - 7t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 21t - 28$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 21t - 28$. 
    Suy ra $a = 21$ và $b = -28$.
    #step[Kết luận:]
    $T = a + b = 21 - 28 = -7$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 8",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (24t^2 - 8t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-8$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(24t^2 - 8t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 24t - 32$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 24t - 32$. 
    Suy ra $a = 24$ và $b = -32$.
    #step[Kết luận:]
    $T = a + b = 24 - 32 = -8$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 9",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (27t^2 - 9t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-9$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(27t^2 - 9t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 27t - 36$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 27t - 36$. 
    Suy ra $a = 27$ và $b = -36$.
    #step[Kết luận:]
    $T = a + b = 27 - 36 = -9$.
  ]
)

#my-tln(de: "Toán Thực Tế - Trả Lời Ngắn 10",
  [Lợi nhuận lũy kế của một siêu thị sau $t$ tháng hoạt động được ước tính bằng $P(t) = (30t^2 - 10t + 10) / (t + 1)$ (đơn vị: trăm triệu đồng). Biết rằng sau một thời gian rất dài, hàm lợi nhuận có xu hướng bám sát một đường tiệm cận xiên $y = a t + b$. Tính giá trị của biểu thức $T = a + b$.],
  [$-10$],
  loigiai: [
    #step[Bước 1: Phân tích phép chia đa thức]
    Thực hiện phép chia tử cho mẫu:
    $(30t^2 - 10t + 10) : (t + 1)$
    #step[Bước 2: Tìm thương]
    Thương của phép chia là $y = 30t - 40$. Phần dư sẽ tiến về $0$ khi $t -> +oo$.
    #step[Bước 3: Xác định hệ số]
    Đường tiệm cận xiên là $y = 30t - 40$. 
    Suy ra $a = 30$ và $b = -40$.
    #step[Kết luận:]
    $T = a + b = 30 - 40 = -10$.
  ]
)
