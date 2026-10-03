// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ÔN TẬP CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP (ĐỀ SỐ 29B - THỰC TIỄN & VẬN DỤNG)
// Lớp: Khối 10  ·  Mã đề: 183  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "../../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")



#show: lecture-theme.with(
  title: "ÔN TẬP CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP (ĐỀ SỐ 29B - THỰC TIỄN & VẬN DỤNG)",
  subtitle: "CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP — MÃ ĐỀ: 183",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 183]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        })
      )
    ]
  }
]

#let exam-part(title, count: none) = {
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Mã PIN thẻ ATM)
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một ngân hàng phát hành mã PIN bảo mật cho thẻ ATM gồm $6$ chữ số $overline(c_1 c_2 c_3 c_4 c_5 c_6)$. Để hạn chế các mã quá dễ đoán, hệ thống quy định chữ số đầu tiên $c_1$ phải khác $0$ và hai chữ số đứng cạnh nhau bất kỳ không được giống nhau ($c_(i + 1) != c_i$ với mọi $i in {1, 2, 3, 4, 5}$). Số mã PIN hợp lệ có thể tạo ra là],
    (
        True([$531441$]),
        [$1000000$],
        [$900000$],
        [$478296$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân liên tiếp theo thứ tự các chữ số từ trái sang phải, với điều kiện chữ số sau khác chữ số liền trước.
        - #step([Chọn chữ số đầu tiên c1])
          $c_1 in {1, 2, ..., 9}$ (khác 0): có $9$ cách chọn.
        - #step([Chọn chữ số thứ hai c2])
          $c_2 in {0, 1, ..., 9} setminus {c_1}$: có $10 - 1 = 9$ cách chọn.
        - #step([Chọn các chữ số tiếp theo c3, c4, c5, c6])
          Với mỗi $i in {3, 4, 5, 6}$, chữ số $c_i$ chỉ cần khác chữ số đứng liền trước $c_(i - 1)$ nên luôn có đúng $10 - 1 = 9$ cách chọn.
        Theo quy tắc nhân, tổng số mã PIN hợp lệ là:
        $ 9 times 9 times 9 times 9 times 9 times 9 = 9^6 = 531441 text(" mã") $
    ]
)

// TN 2 (Mạng lưới đường bay có CeTZ)
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một hãng hàng không đang khai thác mạng lưới bay kết nối giữa $8$ thành phố lớn. Giữa hai thành phố bất kỳ có tối đa một đường bay thẳng hai chiều nối trực tiếp. Hiện tại hãng đã thiết lập được $20$ đường bay thẳng. Hỏi hãng hàng không đó có thể mở thêm tối đa bao nhiêu đường bay thẳng mới nữa?],
    (
        True([$8$]),
        [$16$],
        [$28$],
        [$12$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng tổ hợp để tính số cạnh tối đa của một đồ thị vô hướng $n$ đỉnh, sau đó lấy số cạnh tối đa trừ đi số cạnh hiện có.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          circle((0, 0), radius: 1.6, stroke: 0.5pt + gray)
          for i in range(8) {
            let a = i * 45deg
            let x = 1.6 * calc.cos(a)
            let y = 1.6 * calc.sin(a)
            circle((x, y), radius: 0.1, fill: accent)
            content((1.9 * calc.cos(a), 1.9 * calc.sin(a)), [TP#str(i + 1)])
          }
          // Một số đường bay mẫu
          for i in range(8) {
            let a1 = i * 45deg
            let a2 = ((i + 1) * 45deg)
            line((1.6 * calc.cos(a1), 1.6 * calc.sin(a1)), (1.6 * calc.cos(a2), 1.6 * calc.sin(a2)), stroke: 0.8pt + teal)
          }
        })
        ]
        - Số cặp gồm hai thành phố bất kỳ chọn từ 8 thành phố là:
          $ C_8^2 = (8 times 7) / 2 = 28 text(" cặp thành phố") $
        - Mỗi cặp thành phố có tối đa 1 đường bay thẳng, nên tổng số đường bay tối đa là $28$.
        - Số đường bay mới tối đa có thể mở thêm là:
          $ 28 - 20 = 8 text(" đường bay") $
    ]
)

// TN 3 (Xác suất nhị thức Bernoulli)
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một dây chuyền sản xuất vi mạch có tỉ lệ sản phẩm khuyết tật là $10%$ ($p = 0.1$). Một kỹ sư kiểm định chất lượng chọn ngẫu nhiên độc lập $5$ vi mạch từ dây chuyền. Xác suất để trong $5$ vi mạch lấy ra có đúng $2$ vi mạch bị khuyết tật là],
    (
        True([$0.0729$]),
        [$0.081$],
        [$0.027$],
        [$0.1458$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức Bernoulli với $n = 5$ phép thử độc lập, xác suất thành công $p = 0.1$ và xác suất thất bại $q = 1 - p = 0.9$.
        Số cách chọn 2 vi mạch khuyết tật trong 5 vi mạch là $C_5^2$.
        Xác suất cần tìm là:
        $ P(X = 2) = C_5^2 p^2 q^(5 - 2) = C_5^2 (0.1)^2 (0.9)^3 $
        $ = 10 times 0.01 times 0.729 = 0.0729 $
    ]
)

// TN 4 (Phân phối vắc-xin có CeTZ)
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một bệnh viện dã chiến nhận được $15$ liều vắc-xin đặc hiệu để phân bổ cho $4$ trạm y tế $A, B, C, D$. Để đảm bảo năng lực cấp cứu tại chỗ, mỗi trạm y tế phải nhận được ít nhất $2$ liều vắc-xin. Có bao nhiêu cách phân bổ các liều vắc-xin này?],
    (
        True([$120$]),
        [$165$],
        [$364$],
        [$84$]
    ),
    loigiai: [
        *Phương pháp giải:* Chuyển đổi bài toán chia kẹo Euler về dạng nghiệm nguyên dương bằng kỹ thuật đổi biến số: $x_i >= 2 <=> y_i = x_i - 1 >= 1$.
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for i in range(11) {
            circle((i * 0.5, 0), radius: 0.12, fill: rgb("ccfbf1"), stroke: 0.8pt + teal)
          }
          line((1.5 + 0.25, -0.3), (1.5 + 0.25, 0.3), stroke: 1.5pt + red)
          line((4.0 + 0.25, -0.3), (4.0 + 0.25, 0.3), stroke: 1.5pt + red)
          line((6.5 + 0.25, -0.3), (6.5 + 0.25, 0.3), stroke: 1.5pt + red)
          content((2.75, -0.5), [11 phần tử và 3 vách ngăn đặt vào 10 khoảng trống])
        })
        ]
        Gọi số liều vắc-xin cấp cho 4 trạm lần lượt là $x_1, x_2, x_3, x_4$ ($x_i >= 2, x_i in NN^*$).
        Ta có phương trình: $x_1 + x_2 + x_3 + x_4 = 15$.
        Đặt $y_i = x_i - 1 >= 1$, khi đó:
        $ (y_1 + 1) + (y_2 + 1) + (y_3 + 1) + (y_4 + 1) = 15 <=> y_1 + y_2 + y_3 + y_4 = 11 $
        với $y_i$ là các số nguyên dương ($y_i >= 1$).
        Số cách chia bằng số cách đặt $4 - 1 = 3$ vách ngăn vào $11 - 1 = 10$ khoảng trống:
        $ C_10^3 = (10 times 9 times 8) / (3 times 2 times 1) = 120 text(" cách") $
    ]
)

// TN 5 (Lãi kép nhị thức Newton)
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một doanh nghiệp đầu tư khoản vốn $P_0$ với lãi suất $r = 5% = 0.05$/năm theo hình thức lãi kép hàng năm. Sau $4$ năm, tổng giá trị vốn và lãi là $P = P_0 (1 + 0.05)^4$. Sử dụng công thức nhị thức Newton, giá trị chính xác của hệ số tăng trưởng $(1 + 0.05)^4$ bằng],
    (
        True([$1.21550625$]),
        [$1.20000000$],
        [$1.21550000$],
        [$1.25000000$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng khai triển nhị thức Newton cho lũy thừa $(1 + x)^4$ với $x = 0.05$.
        $ (1 + x)^4 = 1 + 4x + 6x^2 + 4x^3 + x^4 $
        Thay $x = 0.05$:
        - $4(0.05) = 0.2$
        - $6(0.05)^2 = 6(0.0025) = 0.015$
        - $4(0.05)^3 = 4(0.000125) = 0.0005$
        - $(0.05)^4 = 0.00000625$
        Cộng các số hạng:
        $ 1 + 0.2 + 0.015 + 0.0005 + 0.00000625 = 1.21550625 $
    ]
)

// TN 6 (Lập đội dự án)
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một công ty công nghệ có $10$ kỹ sư phần mềm và $6$ chuyên viên thiết kế đồ họa. Giám đốc muốn thành lập một đội dự án gồm $5$ thành viên sao cho trong đội có ít nhất $3$ kỹ sư phần mềm và có ít nhất $1$ chuyên viên đồ họa. Số cách thành lập đội dự án là],
    (
        True([$3060$]),
        [$4368$],
        [$1800$],
        [$2520$]
    ),
    loigiai: [
        *Phương pháp giải:* Phân loại các cấu hình hợp lệ của đội dự án gồm 5 người:
        - #step([Trường hợp 1: Gồm 3 kỹ sư và 2 chuyên viên đồ họa])
          + Chọn 3 kỹ sư từ 10 kỹ sư: có $C_10^3 = 120$ cách.
          + Chọn 2 chuyên viên từ 6 chuyên viên: có $C_6^2 = 15$ cách.
          Số cách trong TH1: $120 times 15 = 1800$ cách.
        - #step([Trường hợp 2: Gồm 4 kỹ sư và 1 chuyên viên đồ họa])
          + Chọn 4 kỹ sư từ 10 kỹ sư: có $C_10^4 = 210$ cách.
          + Chọn 1 chuyên viên từ 6 chuyên viên: có $C_6^1 = 6$ cách.
          Số cách trong TH2: $210 times 6 = 1260$ cách.
        Theo quy tắc cộng:
        $ 1800 + 1260 = 3060 text(" cách") $
    ]
)

// TN 7 (Mã kiểm tra Checksum)
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một công ty vận tải gán mã vận đơn gồm $5$ chữ số $overline(c_1 c_2 c_3 c_4 c_5)$ cho các gói hàng. Chữ số đầu $c_1 != 0$, các chữ số $c_2, c_3, c_4 in {0, 1, ..., 9}$. Chữ số cuối $c_5$ là chữ số kiểm tra (checksum) được xác định duy nhất bởi điều kiện $(c_1 + 2c_2 + 3c_3 + 4c_4 + c_5)$ chia hết cho $10$. Hỏi có bao nhiêu mã vận đơn hợp lệ?],
    (
        True([$9000$]),
        [$10000$],
        [$8100$],
        [$900$]
    ),
    loigiai: [
        *Phương pháp giải:* Xét số cách chọn 4 chữ số đầu tiên, sau đó chứng minh với mỗi bộ 4 chữ số đầu luôn tồn tại duy nhất một chữ số kiểm tra $c_5$ thỏa mãn điều kiện đồng dư.
        - Chữ số $c_1 in {1, 2, ..., 9}$: có $9$ cách chọn.
        - Chữ số $c_2, c_3, c_4 in {0, 1, ..., 9}$: mỗi chữ số có $10$ cách chọn.
        Số cách chọn bộ $4$ chữ số đầu $(c_1, c_2, c_3, c_4)$ là:
        $ 9 times 10 times 10 times 10 = 9000 text(" cách") $
        - Với mỗi bộ $(c_1, c_2, c_3, c_4)$ xác định, đặt $S = c_1 + 2c_2 + 3c_3 + 4c_4$. Khi đó $c_5$ thỏa mãn $S + c_5 equiv 0 (mod 10)$, tức là $c_5 equiv -S (mod 10)$. Trong tập ${0, 1, ..., 9}$, luôn có DUY NHẤT một giá trị của $c_5$ thỏa mãn.
        Vậy có tất cả $9000$ mã vận đơn hợp lệ.
    ]
)

// TN 8 (Đa giác lồi quy hoạch giao lộ)
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một khu đô thị mới được quy hoạch gồm $10$ giao lộ tạo thành các đỉnh của một đa giác lồi. Người ta muốn thiết kế các đoạn đường thẳng nối từng cặp giao lộ với nhau (gồm cả đường bao quanh và đường nội bộ xuyên tâm). Hỏi có tất cả bao nhiêu đoạn đường thẳng nối các cặp giao lộ?],
    (
        True([$45$]),
        [$35$],
        [$90$],
        [$20$]
    ),
    loigiai: [
        *Phương pháp giải:* Mỗi đoạn đường thẳng nối trực tiếp hai giao lộ tương ứng với một cách chọn $2$ đỉnh bất kỳ từ $10$ đỉnh của đa giác.
        Số đoạn đường thẳng là:
        $ C_10^2 = (10 times 9) / 2 = 45 text(" đoạn đường") $
    ]
)

// TN 9 (Lịch trực nhật không trùng đầu cuối)
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Có $5$ bạn học sinh trực nhật trong $5$ ngày từ thứ Hai đến thứ Sáu, mỗi ngày đúng một bạn. Biết rằng bạn An không thể trực nhật vào ngày thứ Hai và ngày thứ Sáu. Số cách phân công lịch trực nhật là],
    (
        True([$72$]),
        [$120$],
        [$96$],
        [$48$]
    ),
    loigiai: [
        *Phương pháp giải:* Phân công cho đối tượng có ràng buộc ngặt trước (bạn An), sau đó xếp các bạn còn lại vào các ngày còn lại.
        - Bạn An không trực thứ Hai và thứ Sáu nên chỉ có thể trực vào một trong 3 ngày: thứ Ba, thứ Tư, thứ Năm. Do đó bạn An có $3$ cách chọn ngày.
        - Sau khi An đã chọn ngày, còn lại $4$ ngày dành cho $4$ bạn học sinh còn lại: có $4! = 24$ cách xếp.
        Theo quy tắc nhân:
        $ 3 times 24 = 72 text(" cách") $
    ]
)

// TN 10 (Di truyền học Mendel)
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Theo định luật phân li độc lập của Mendel, khi lai hai cây đậu Hà Lan dị hợp $A a times A a$, xác suất sinh hạt vàng ($A-$) là $3 / 4$ và hạt xanh ($a a$) là $1 / 4$. Thu hoạch ngẫu nhiên $4$ hạt đậu từ phép lai. Xác suất để có đúng $3$ hạt đậu màu vàng là],
    (
        True([$27 / 64$]),
        [$81 / 256$],
        [$27 / 128$],
        [$9 / 16$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức với tham số $n = 4$, $p = 3 / 4$ và $k = 3$.
        $ P(X = 3) = C_4^3 (3 / 4)^3 (1 / 4)^(4 - 3) = 4 times (27 / 64) times (1 / 4) = 27 / 64 $
    ]
)

// TN 11 (Bảo mật mật khẩu)
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một mật khẩu máy tính gồm $8$ ký tự, trong đó có $6$ chữ cái in hoa (chọn từ $26$ chữ cái tiếng Anh) và $2$ chữ số (chọn từ $0$ đến $9$). Có bao nhiêu mật khẩu thỏa mãn nếu hai chữ số bắt buộc phải đứng cạnh nhau? (Các chữ cái và chữ số được phép lặp lại).],
    (
        True([$7 times 26^6 times 10^2$]),
        [$8 times 26^6 times 10^2$],
        [$C_8^2 times 26^6 times 10^2$],
        [$26^6 times 10^2$]
    ),
    loigiai: [
        *Phương pháp giải:* Buộc hai chữ số đứng cạnh nhau thành một khối $[text("SốSố")]$.
        - Trong dãy 8 ký tự, hai chữ số đứng cạnh nhau chiếm 2 vị trí liền kề. Có $8 - 1 = 7$ vị trí cho khối 2 chữ số này.
        - Hai chữ số được chọn từ 10 chữ số (cho phép lặp lại): có $10 times 10 = 10^2$ cách.
        - Sáu vị trí còn lại dành cho 6 chữ cái in hoa (cho phép lặp lại): có $26^6$ cách.
        Theo quy tắc nhân, tổng số mật khẩu thỏa mãn là:
        $ 7 times 26^6 times 10^2 $
    ]
)

// TN 12 (Hệ số nhị thức)
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Hệ số của số hạng chứa $x^2$ trong khai triển nhị thức Newton của biểu thức $(2 - 3x)^5$ bằng],
    (
        True([$720$]),
        [$-720$],
        [$1080$],
        [$-1080$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng công thức số hạng tổng quát của nhị thức Newton: $T_(k + 1) = C_5^k 2^(5 - k) (-3x)^k$.
        Số hạng chứa $x^2$ tương ứng với $k = 2$:
        $ T_3 = C_5^2 2^(5 - 2) (-3x)^2 = C_5^2 cdot 2^3 cdot (-3)^2 cdot x^2 $
        $ = 10 times 8 times 9 times x^2 = 720 x^2 $
        Vậy hệ số là $720$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đội ngũ dự án)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một công ty công nghệ có $10$ kỹ sư phần mềm và $6$ chuyên viên thiết kế đồ họa. Cần chọn một nhóm công tác gồm $5$ người.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách chọn $5$ người bất kỳ từ $16$ người bằng $4368$ cách.]),
    True([Số cách chọn nhóm công tác chỉ toàn là kỹ sư phần mềm bằng $252$ cách.]),
    True([Số cách chọn nhóm công tác có ít nhất $3$ kỹ sư và ít nhất $1$ chuyên viên đồ họa bằng $3060$ cách.]),
    [Số cách chọn nhóm công tác không có bất kỳ kỹ sư phần mềm nào bằng $500$ cách.]
  ),
  loigiai: [
    #step([Xét ý a: Chọn 5 người tùy ý])
    $C_16^5 = (16 times 15 times 14 times 13 times 12) / 120 = 4368$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Toàn kỹ sư])
    $C_10^5 = 252$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Ít nhất 3 kỹ sư và ít nhất 1 đồ họa])
    $C_10^3 times C_6^2 + C_10^4 times C_6^1 = 1800 + 1260 = 3060$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Không có kỹ sư nào (toàn đồ họa)])
    Chọn 5 người từ 6 chuyên viên đồ họa: $C_6^5 = 6$ (chứ không phải $500$). Mệnh đề d SAI.
  ]
)

// DS 2 (Mạng lưới giao thông)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Xét mạng lưới giao thông kết nối giữa $8$ thành phố phân biệt.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số đường bay thẳng tối đa kết nối giữa hai thành phố bất kỳ bằng $28$.]),
    True([Số tam giác liên kết đường bay tạo bởi bộ ba thành phố bất kỳ bằng $56$.]),
    True([Nếu hiện tại đã có $20$ đường bay, số đường bay có thể mở thêm tối đa bằng $8$.]),
    [Số chu trình nối $4$ thành phố bất kỳ bằng $100$.]
  ),
  loigiai: [
    #step([Xét ý a: Số đường bay tối đa])
    $C_8^2 = 28$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Số tam giác liên kết])
    $C_8^3 = (8 times 7 times 6) / 6 = 56$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Số đường bay mở thêm])
    $28 - 20 = 8$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Số bộ 4 thành phố])
    $C_8^4 = (8 times 7 times 6 times 5) / 24 = 70$ (chứ không phải $100$). Mệnh đề d SAI.
  ]
)

// DS 3 (Phân phối vắc-xin)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Xét bài toán phân phối $15$ liều vắc-xin cho $4$ trạm y tế $A, B, C, D$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu mỗi trạm nhận ít nhất $1$ liều vắc-xin, số cách phân phối bằng $364$.]),
    True([Nếu mỗi trạm nhận ít nhất $2$ liều vắc-xin, số cách phân phối bằng $120$.]),
    True([Nếu trạm $A$ nhận đúng $3$ liều và ba trạm còn lại mỗi trạm nhận ít nhất $2$ liều, số cách phân phối bằng $28$.]),
    [Số cách phân phối tùy ý (có trạm có thể nhận 0 liều) bằng $500$.]
  ),
  loigiai: [
    #step([Xét ý a: Mỗi trạm >= 1 liều])
    $C_(15 - 1)^(4 - 1) = C_14^3 = (14 times 13 times 12) / 6 = 364$. Mệnh đề a ĐÚNG.

    #step([Xét ý b: Mỗi trạm >= 2 liều])
    Đặt $y_i = x_i - 1 >= 1 => sum y_i = 11 => C_10^3 = 120$. Mệnh đề b ĐÚNG.

    #step([Xét ý c: Trạm A nhận 3 liều, 3 trạm còn lại >= 2 liều])
    $x_2 + x_3 + x_4 = 12$ với $x_i >= 2$. Đặt $y_i = x_i - 1 >= 1 => y_2 + y_3 + y_4 = 9$.
    Số cách: $C_8^2 = (8 times 7) / 2 = 28$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Phân phối tùy ý])
    $C_(15 + 4 - 1)^(4 - 1) = C_18^3 = (18 times 17 times 16) / 6 = 816$ (chứ không phải $500$). Mệnh đề d SAI.
  ]
)

// DS 4 (Lãi kép nhị thức Newton)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Xét công thức lãi kép tích lũy bậc $4$: $f(r) = (1 + r)^4$ với $r = 0.05$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khai triển nhị thức Newton của $(1 + r)^4$ bằng $1 + 4r + 6r^2 + 4r^3 + r^4$.]),
    True([Giá trị xấp xỉ tuyến tính bậc nhất $1 + 4r$ tại $r = 0.05$ bằng $1.20$.]),
    True([Giá trị chính xác của $(1 + 0.05)^4$ bằng $1.21550625$.]),
    [Sai số tuyệt đối giữa giá trị chính xác và xấp xỉ bậc nhất lớn hơn $0.05$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tính toán khai triển và xấp xỉ])
    - Khai triển chuẩn: $1 + 4r + 6r^2 + 4r^3 + r^4$.
    - Xấp xỉ bậc nhất: $1 + 4(0.05) = 1.20$.
    - Chính xác: $1.21550625$.
    Các mệnh đề a, b, c ĐÚNG.

    #step([Xét ý d: Sai số tuyệt đối])
    Sai số: $|1.21550625 - 1.20| = 0.01550625 < 0.05$.
    Khẳng định lớn hơn $0.05$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Một công ty có $10$ kỹ sư và $6$ chuyên viên thiết kế. Có bao nhiêu cách lập đội gồm $5$ người có ít nhất $3$ kỹ sư và ít nhất $1$ chuyên viên thiết kế?],
    [3060],
    loigiai: [
        #step([Tính tổng 2 trường hợp])
        $ C_10^3 times C_6^2 + C_10^4 times C_6^1 = 1800 + 1260 = 3060 text(" cách") $
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Giữa $8$ thành phố hiện có $20$ đường bay thẳng trực tiếp. Hãng hàng không có thể mở thêm tối đa bao nhiêu đường bay thẳng mới nữa?],
    [8],
    loigiai: [
        #step([Lấy hiệu số])
        $ C_8^2 - 20 = 28 - 20 = 8 text(" đường bay") $
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Có bao nhiêu cách phân bổ $15$ liều vắc-xin cho $4$ trạm y tế sao cho mỗi trạm nhận được ít nhất $2$ liều?],
    [120],
    loigiai: [
        #step([Stars and Bars đổi biến])
        $ y_1 + y_2 + y_3 + y_4 = 11 => C_10^3 = 120 text(" cách") $
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Tìm hệ số của số hạng chứa $x^2$ trong khai triển của biểu thức $(2 - 3x)^5$.],
    [720],
    loigiai: [
        #step([Khai triển nhị thức])
        $ C_5^2 cdot 2^3 cdot (-3)^2 = 10 times 8 times 9 = 720 $
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Có $5$ bạn học sinh trực nhật trong $5$ ngày từ thứ Hai đến thứ Sáu. Bạn An không trực thứ Hai và thứ Sáu. Có bao nhiêu cách phân công?],
    [72],
    loigiai: [
        #step([Quy tắc nhân])
        $ 3 times 4! = 3 times 24 = 72 text(" cách") $
    ]
)

// TLN 6
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 183], back-to: "sec-exercise-hub",[Có bao nhiêu mã PIN gồm $6$ chữ số có chữ số đầu khác $0$ và hai chữ số đứng cạnh nhau bất kỳ không giống nhau?],
    [531441],
    loigiai: [
        #step([Lũy thừa 9^6])
        $ 9 times 9^5 = 9^6 = 531441 text(" mã") $
    ]
)

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ÔN TẬP CHƯƠNG VIII: ĐẠI SỐ TỔ HỢP (ĐỀ SỐ 29B - THỰC TIỄN & VẬN DỤNG)!]      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
