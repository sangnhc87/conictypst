// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 1: MỆNH ĐỀ TOÁN HỌC (ĐỀ SỐ 3)
// Lớp: Khối 10  ·  Mã đề: 104  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 1: MỆNH ĐỀ TOÁN HỌC (ĐỀ SỐ 3)",
  subtitle: "ÔN TẬP CHƯƠNG 1 — MÃ ĐỀ: 104",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 104]],
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
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Trong các câu sau, câu nào là mệnh đề Toán học?],
    (
        [Hôm nay là thứ mấy?],
        [Hình bình hành có hai đường chéo cắt nhau tại trung điểm mỗi đường phải không?],
        True([Hai tam giác bằng nhau thì có diện tích bằng nhau.]),
        [Các em hãy cố gắng học giỏi Toán!]
    ),
    loigiai: [
        - "Hôm nay là thứ mấy?" là câu hỏi.
        - "Hình bình hành có... phải không?" là câu hỏi.
        - "Hai tam giác bằng nhau thì có diện tích bằng nhau." là câu khẳng định có tính đúng/sai rõ ràng, nên nó là mệnh đề Toán học.
        - "Các em hãy cố gắng học giỏi Toán!" là câu cầu khiến.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Phủ định của mệnh đề $P$: "Tất cả các số tự nhiên đều là số chẵn" là mệnh đề nào sau đây?],
    (
        [Tất cả các số tự nhiên đều là số lẻ.],
        True([Có ít nhất một số tự nhiên là số lẻ.]),
        [Có ít nhất một số tự nhiên là số chẵn.],
        [Không có số tự nhiên nào là số chẵn.]
    ),
    loigiai: [
        Mệnh đề $P$ có dạng "$forall x in NN, x text(" là số chẵn") $".
        Phủ định của $P$ là "$exists x in NN, x text(" không là số chẵn") $", tức là "$exists x in NN, x text(" là số lẻ") $".
        Vậy phủ định là: "Có ít nhất một số tự nhiên là số lẻ".
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Mệnh đề nào sau đây là mệnh đề ĐÚNG?],
    (
        [$forall x in RR, x^2 > 0$],
        True([$exists n in NN, n text(" chia hết cho ") n+1$]),
        [$forall n in NN, n text(" là số nguyên tố")$],
        [$exists x in RR, x^2 + 1 = 0$]
    ),
    loigiai: [
        - a) Sai vì tại $x=0$ thì $0^2 = 0$ không thỏa mãn $>0$.
        - b) Đúng vì chọn $n=0$, ta có $0$ chia hết cho $0+1=1$.
        - c) Sai vì có vô số hợp số (VD: $4, 6, 8$).
        - d) Sai vì $x^2 + 1 >= 1 > 0$ với mọi $x in RR$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Cho hai mệnh đề $P$: "Tứ giác ABCD là hình thoi" và $Q$: "Tứ giác ABCD có hai đường chéo vuông góc với nhau". Khẳng định nào sau đây là ĐÚNG?],
    (
        [Mệnh đề $P => Q$ là sai.],
        True([Mệnh đề $P => Q$ đúng và mệnh đề $Q => P$ sai.]),
        [Mệnh đề $P => Q$ sai và mệnh đề $Q => P$ đúng.],
        [Mệnh đề $P <=> Q$ là đúng.]
    ),
    loigiai: [
        - $P => Q$: "Nếu ABCD là hình thoi thì hai đường chéo vuông góc với nhau". Đây là mệnh đề ĐÚNG (tính chất hình thoi).
        - $Q => P$: "Nếu ABCD có hai đường chéo vuông góc thì nó là hình thoi". Đây là mệnh đề SAI (vì hình diều cũng có 2 đường chéo vuông góc nhưng không phải hình thoi).
        Do đó chỉ có $P => Q$ đúng, còn $Q => P$ sai.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Mệnh đề "Nếu một tam giác cân có một góc bằng $60^o$ thì tam giác đó là tam giác đều" có thể được phát biểu dưới dạng điều kiện cần, điều kiện đủ như thế nào?],
    (
        [Tam giác cân có một góc bằng $60^o$ là điều kiện cần để nó là tam giác đều.],
        True([Tam giác cân có một góc bằng $60^o$ là điều kiện đủ để nó là tam giác đều.]),
        [Tam giác đều là điều kiện đủ để tam giác đó cân và có một góc bằng $60^o$.],
        [Tam giác đều không phải là điều kiện cần để tam giác cân có một góc $60^o$.]
    ),
    loigiai: [
        Cấu trúc "Nếu P thì Q" ($P => Q$) tương đương với "$P$ là điều kiện đủ để có $Q$" hoặc "$Q$ là điều kiện cần để có $P$".
        Trong đó:
        $P$: Tam giác cân có một góc $60^o$.
        $Q$: Tam giác đó là tam giác đều.
        Do đó, "Tam giác cân có một góc $60^o$ là điều kiện đủ để tam giác đó đều" là phát biểu đúng.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Khẳng định nào sau đây là mệnh đề *sai*?],
    (
        [$forall x in RR, x > 3 => x^2 > 9$],
        True([$forall x in RR, x^2 > 9 => x > 3$]),
        [$forall x in RR, x > 3 => x^2 > 0$],
        [$exists x in RR, x^2 > 9$]
    ),
    loigiai: [
        - a) Đúng. Vì $x > 3 > 0 => x^2 > 9$.
        - b) Sai. Phản ví dụ: $x = -4$ thì $x^2 = 16 > 9$ nhưng $-4$ không lớn hơn $3$. 
        - c) Đúng. Nếu $x > 3$ thì $x$ dương nên $x^2 > 0$.
        - d) Đúng. Chỉ cần tồn tại, ví dụ $x = 4$ thì $16 > 9$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Trong hình học phẳng, phát biểu nào sau đây là mệnh đề tương đương ĐÚNG?],
    (
        [Hai tam giác có diện tích bằng nhau khi và chỉ khi chúng bằng nhau.],
        True([Tam giác $A B C$ vuông tại $A$ khi và chỉ khi $B C^2 = A B^2 + A C^2$.]),
        [Tứ giác là hình chữ nhật khi và chỉ khi nó có hai đường chéo bằng nhau.],
        [Một góc là góc nhọn khi và chỉ khi số đo của nó nhỏ hơn $180^o$.]
    ),
    loigiai: [
        - a) Sai. Hai tam giác có diện tích bằng nhau chưa chắc đã bằng nhau (chiều đảo sai).
        - b) Đúng. Đây là nội dung của Định lý Pythagore thuận và đảo, cả 2 chiều đều đúng nên tạo thành mệnh đề tương đương.
        - c) Sai. Hình thang cân cũng có hai đường chéo bằng nhau.
        - d) Sai. Góc nhọn phải nhỏ hơn $90^o$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Cho hai mệnh đề chứa biến $P(n)$: "$n$ là số nguyên tố" và $Q(n)$: "$n$ là số lẻ", với $n$ là số tự nhiên. Có bao nhiêu giá trị của $n$ thỏa mãn mệnh đề $P(n)$ đúng nhưng $Q(n)$ sai?],
    (
        [0],
        True([1]),
        [2],
        [Vô số]
    ),
    loigiai: [
        Ta cần tìm số tự nhiên $n$ sao cho "$n$ là số nguyên tố" (ĐÚNG) và "$n$ là số lẻ" (SAI, tức là $n$ là số chẵn).
        Số nguyên tố chẵn duy nhất trong tập hợp số tự nhiên là số 2.
        Vậy có đúng 1 giá trị của $n$ thỏa mãn là $n=2$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Cho mệnh đề "Mọi số tự nhiên có tận cùng bằng 0 thì đều chia hết cho 5". Mệnh đề đảo của mệnh đề này là gì?],
    (
        [Mọi số tự nhiên có tận cùng bằng 0 thì không chia hết cho 5.],
        True([Mọi số tự nhiên chia hết cho 5 thì đều có tận cùng bằng 0.]),
        [Nếu số tự nhiên không chia hết cho 5 thì không có tận cùng bằng 0.],
        [Mọi số tự nhiên có tận cùng bằng 5 thì đều chia hết cho 5.]
    ),
    loigiai: [
        Mệnh đề ban đầu có dạng: "Nếu $n$ có tận cùng bằng 0 thì $n$ chia hết cho 5".
        Mệnh đề đảo đổi chỗ giả thiết và kết luận: "Nếu $n$ chia hết cho 5 thì $n$ có tận cùng bằng 0".
        (Lưu ý: mệnh đề đảo này là một mệnh đề SAI vì số chia hết cho 5 có thể tận cùng bằng 5).
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Trong các mệnh đề dưới đây, mệnh đề nào SAI?],
    (
        [Nếu hai đường thẳng phân biệt cùng song song với đường thẳng thứ ba thì chúng song song với nhau.],
        True([Nếu hai mặt phẳng phân biệt cùng vuông góc với một mặt phẳng thứ ba thì chúng song song với nhau.]),
        [Trong mặt phẳng, nếu hai đường thẳng phân biệt cùng vuông góc với một đường thẳng thứ ba thì chúng song song với nhau.],
        [Trong tam giác, đường trung bình song song với cạnh đáy và bằng nửa cạnh đáy.]
    ),
    loigiai: [
        - Câu b) sai. Trong không gian, hai mặt phẳng cùng vuông góc với mặt phẳng thứ ba vẫn có thể cắt nhau (ví dụ: mặt phẳng xOz và yOz cùng vuông góc với mặt phẳng xOy nhưng chúng cắt nhau theo trục Oz).
        - Các câu còn lại là các định lý hình học cơ bản luôn đúng.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Mệnh đề $exists x in ZZ, 2x^2 - 3x + 1 = 0$ là mệnh đề ĐÚNG hay SAI?],
    (
        True([Đúng, vì phương trình có nghiệm $x = 1 in ZZ$.]),
        [Sai, vì phương trình có nghiệm $x = 1/2 notin ZZ$.],
        [Đúng, vì phương trình có hai nghiệm phân biệt.],
        [Sai, vì phương trình vô nghiệm.]
    ),
    loigiai: [
        Phương trình $2x^2 - 3x + 1 = 0 <=> x = 1$ hoặc $x = 1/2$.
        Ký hiệu $exists$ chỉ cần TỒN TẠI ít nhất một giá trị $x in ZZ$ thỏa mãn là đủ.
        Vì $x = 1 in ZZ$ nên mệnh đề TỒN TẠI này là mệnh đề ĐÚNG.
    ]
)

// TN 12 (Số học và logic)
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Ba bạn A, B, C tham gia một trò chơi vòng tròn. 
A nói: "B đang nói dối".
B nói: "C đang nói dối".
C nói: "Cả A và B đều đang nói dối".
Biết rằng mỗi bạn chỉ có thể luôn nói thật hoặc luôn nói dối. Khẳng định nào sau đây là ĐÚNG?],
    (
        [Cả ba bạn đều nói dối.],
        [Chỉ có A nói thật.],
        True([Chỉ có B nói thật.]),
        [Chỉ có C nói thật.]
    ),
    loigiai: [
        - Giả sử C nói thật $=>$ A dối, B dối. Nếu B dối thì C thật (Khớp). Nếu A dối thì B thật (Mâu thuẫn với "B dối"). Vậy C không thể nói thật. $=>$ C dối.
        - Vì C dối, nên "Cả A và B đều dối" là sai $=>$ Có ít nhất một người thật trong A, B.
        - Xét câu của B: "C dối" là sự thật. Vậy B nói thật.
        - Xét câu của A: "B dối". Nhưng ta vừa kết luận B thật. Vậy A dối.
        - Tóm lại: A dối, B thật, C dối. Khẳng định đúng là "Chỉ có B nói thật".
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Xét các mệnh đề về tính chất hình học của tứ giác:],
  (
    True([Mệnh đề "Tứ giác có 4 cạnh bằng nhau là hình thoi" là một mệnh đề đúng.]),
    [Nếu một tứ giác là hình thoi thì tứ giác đó có hai đường chéo bằng nhau.],
    True([Điều kiện cần và đủ để tứ giác là hình vuông là nó có 4 cạnh bằng nhau và 4 góc vuông.]),
    [Phủ định của mệnh đề "Mọi hình chữ nhật đều là hình bình hành" là "Có ít nhất một hình bình hành không phải là hình chữ nhật".]
  ),
  loigiai: [
    a) Đúng. Định nghĩa hình thoi.
    b) Sai. Hình thoi không nhất thiết có 2 đường chéo bằng nhau (chỉ hình vuông mới có hai đường chéo bằng nhau).
    c) Đúng. Đây là điều kiện chuẩn xác của hình vuông.
    d) Sai. Phủ định của "Mọi hình chữ nhật đều là hình bình hành" phải là "Có ít nhất một hình chữ nhật không phải là hình bình hành".
  ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Cho các mệnh đề số học trên tập số tự nhiên $NN$:],
  (
    True([Mệnh đề "$forall n in NN, n(n+1)$ là số chẵn" là một mệnh đề đúng.]),
    True([Nếu bình phương của một số tự nhiên là số chẵn thì số tự nhiên đó cũng là số chẵn.]),
    [Mệnh đề "$exists n in NN, n^2 + 1$ chia hết cho 4" là một mệnh đề đúng.],
    True([Phủ định của mệnh đề "$forall n in NN, n^3 >= n$" là "$exists n in NN, n^3 < n$".])
  ),
  loigiai: [
    a) Đúng. Tích của hai số tự nhiên liên tiếp luôn có một số chẵn nên tích là số chẵn.
    b) Đúng. Nếu $n^2$ chẵn thì $n$ phải chẵn (vì nếu $n$ lẻ thì $n^2$ lẻ).
    c) Sai. Bình phương của số tự nhiên chia cho 4 dư 0 (nếu n chẵn) hoặc 1 (nếu n lẻ). Do đó $n^2 + 1$ chia cho 4 chỉ có thể dư 1 hoặc 2. Không tồn tại $n$ để $n^2+1$ chia hết cho 4.
    d) Đúng. Phủ định của $forall$ là $exists$, của $>=$ là $<$.
  ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Cho ba điểm $A, B, C$ phân biệt trên mặt phẳng. Xét các mệnh đề sau:],
  (
    [Mệnh đề "Nếu $A, B, C$ thẳng hàng thì $A B + B C = A C$" là mệnh đề đúng.],
    True([Điều kiện đủ để 3 điểm $A, B, C$ thẳng hàng là điểm $B$ nằm giữa hai điểm $A$ và $C$.]),
    [Mệnh đề "$A, B, C$ tạo thành một tam giác khi và chỉ khi chúng không thẳng hàng" là mệnh đề tương đương sai.],
    [Nếu mệnh đề "$A B + B C = A C$" sai thì $A, B, C$ chắc chắn tạo thành một tam giác.]
  ),
  loigiai: [
    a) Sai. $A, B, C$ thẳng hàng có thể xảy ra trường hợp $A$ nằm giữa $B$ và $C$ (lúc đó $B A + A C = B C$). Do đó mệnh đề này chưa chắc đúng.
    b) Đúng. Nếu $B$ nằm giữa thì chắc chắn thẳng hàng (điều kiện đủ).
    c) Sai. Ba điểm phân biệt không thẳng hàng thì tạo thành tam giác. Đây là mệnh đề tương đương ĐÚNG, không phải sai.
    d) Sai. Nếu $A B + B C = A C$ sai, có thể $C$ nằm giữa $A B$ (thẳng hàng), chứ không bắt buộc phải tạo thành tam giác.
  ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Trong vương quốc có hai loại người: Hiệp sĩ (luôn nói thật) và Kẻ gian (luôn nói dối). Bạn gặp hai người cư dân tên là X và Y. 
X nói: "Nếu tôi là Hiệp sĩ thì Y là Kẻ gian".
Xét các mệnh đề sau:],
  (
    [Nếu X là Kẻ gian, thì mệnh đề X phát biểu là một mệnh đề sai.],
    True([Chắc chắn X là Hiệp sĩ.]),
    True([Chắc chắn Y là Kẻ gian.]),
    [Có thể cả X và Y đều là Kẻ gian.]
  ),
  loigiai: [
    #step([Lập bảng chân trị và phân tích])
    Câu nói của X có dạng mệnh đề kéo theo $P => Q$ với:
    $P$: "X là Hiệp sĩ"
    $Q$: "Y là Kẻ gian"
    
    Trường hợp 1: X là Kẻ gian (nói dối).
    Khi đó, $P$ sai. Mệnh đề $P => Q$ mang giá trị ĐÚNG về mặt logic (Sai $=>$ Bất kỳ là Đúng).
    Nhưng X là Kẻ gian thì lời X nói phải là SAI. Điều này mâu thuẫn.
    Vậy X KHÔNG THỂ LÀ KẺ GIAN.
    
    Trường hợp 2: X là Hiệp sĩ (nói thật).
    Khi đó, mệnh đề $P => Q$ phải mang giá trị ĐÚNG.
    Vì X là Hiệp sĩ nên giả thiết $P$ ĐÚNG.
    Để $P => Q$ ĐÚNG mà $P$ ĐÚNG, thì bắt buộc $Q$ phải ĐÚNG.
    Tức là sự thật Y chính là Kẻ gian.
    
    #step([Kết luận các lựa chọn])
    a) Sai. Nếu X là Kẻ gian thì theo logic toán học mệnh đề đó là ĐÚNG (mâu thuẫn với bản chất Kẻ gian).
    b) Đúng. Bắt buộc X là Hiệp sĩ.
    c) Đúng. Bắt buộc Y là Kẻ gian.
    d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TLN 1
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Có bao nhiêu mệnh đề ĐÚNG trong các mệnh đề sau?
(1) Tổng của hai số lẻ là một số chẵn.
(2) Mọi số nguyên tố đều là số lẻ.
(3) Phương trình $x^2 + 1 = 0$ có nghiệm thực.
(4) Tam giác có hai góc bằng $45^o$ là tam giác vuông cân.
(5) Đường tròn có vô số trục đối xứng.],
    [3],
    loigiai: [
        #step([Kiểm tra từng mệnh đề])
        (1) Đúng. Số lẻ + Số lẻ = Số chẵn (VD: $3+5=8$).
        (2) Sai. Số 2 là số nguyên tố chẵn.
        (3) Sai. Phương trình $x^2 + 1 = 0$ vô nghiệm trên tập số thực.
        (4) Đúng. Tổng 3 góc bằng $180^o$, hai góc bằng $45^o$ thì góc còn lại bằng $90^o$. Tam giác có 1 góc vuông và 2 góc bằng nhau nên vuông cân.
        (5) Đúng. Mọi đường thẳng đi qua tâm đều là trục đối xứng.
        
        #step([Kết luận])
        Có $3$ mệnh đề đúng là (1), (4), (5).
    ]
)

// TLN 2
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Cho mệnh đề chứa biến $P(n)$: "$n^2 - 3n + 2 <= 0$". Có bao nhiêu số nguyên $n$ làm cho mệnh đề $P(n)$ đúng?],
    [2],
    loigiai: [
        #step([Giải bất phương trình])
        Ta có: $n^2 - 3n + 2 <= 0 <=> (n-1)(n-2) <= 0 <=> 1 <= n <= 2$.
        
        #step([Tìm các giá trị nguyên])
        Vì $n$ là số nguyên, ta có $n in {1, 2}$.
        Có tổng cộng $2$ giá trị của $n$ làm cho mệnh đề đúng.
    ]
)

// TLN 3
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Cho $P$: "Tam giác ABC vuông tại A", $Q$: "$A B^2 + B C^2 = A C^2$". 
Nếu ghép hai mệnh đề lại thành $P => Q$, mệnh đề thu được là mệnh đề ĐÚNG hay SAI? (Quy ước: Điền 1 nếu ĐÚNG, điền 0 nếu SAI).],
    [0],
    loigiai: [
        #step([Phân tích lý thuyết])
        Theo định lý Pythagore: Tam giác ABC vuông tại A thì $B C^2 = A B^2 + A C^2$ (BC là cạnh huyền).
        Biểu thức $Q$: $A B^2 + B C^2 = A C^2$ tương ứng với tam giác vuông tại B.
        
        #step([Kết luận])
        Do đó, nếu tam giác vuông tại A thì mệnh đề $Q$ là sai.
        Suy ra mệnh đề kéo theo $P => Q$ là một mệnh đề SAI. Điền số $0$.
        #align(center)[
            #cetz.canvas({
                import cetz.draw: *
                line((0,0), (3,0), (0,2), close: true, stroke: 1.2pt)
                line((0,0.2), (0.2,0.2), (0.2,0), stroke: 1.2pt)
                content((-0.2, -0.2), [$A$])
                content((3.2, -0.2), [$B$])
                content((-0.2, 2.2), [$C$])
            })
        ]
    ]
)

// TLN 4
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Biết $P$ là mệnh đề ĐÚNG, $Q$ là mệnh đề SAI, và $R$ là mệnh đề ĐÚNG.
Hãy đếm số mệnh đề ĐÚNG trong các mệnh đề sau:
(1) $P => Q$
(2) $Q => R$
(3) $(P text(" và ") R) => Q$
(4) $overline(Q) => P$],
    [2],
    loigiai: [
        #step([Thay chân trị và đánh giá từng mệnh đề])
        - Mệnh đề (1): $P => Q$ (Đúng $=>$ Sai). Giá trị là SAI.
        - Mệnh đề (2): $Q => R$ (Sai $=>$ Đúng). Giá trị là ĐÚNG.
        - Mệnh đề (3): $(P text(" và ") R) => Q$. Ta có $(P text(" và ") R)$ là Đúng. Đúng $=>$ Sai. Giá trị là SAI.
        - Mệnh đề (4): $overline(Q) => P$. Ta có $overline(Q)$ là Đúng. Đúng $=>$ Đúng. Giá trị là ĐÚNG.
        
        #step([Kết luận])
        Có 2 mệnh đề ĐÚNG là (2) và (4).
    ]
)

// TLN 5
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Tìm giá trị thực của tham số $m$ để mệnh đề "$forall x in RR, (m^2 - 1)x + m - 1 = 0$" là một mệnh đề ĐÚNG.],
    [1],
    loigiai: [
        #step([Điều kiện để phương trình nghiệm đúng với mọi x])
        Phương trình bậc nhất một ẩn $a x + b = 0$ nghiệm đúng với mọi số thực $x in RR$ khi và chỉ khi cả hai hệ số $a$ và $b$ đồng thời bằng 0:
        $ cases(a = 0, b = 0) $
        
        #step([Giải hệ điều kiện tìm m])
        Áp dụng vào mệnh đề chứa biến $(m^2 - 1)x + m - 1 = 0$:
        $ cases(m^2 - 1 = 0, m - 1 = 0) <=> cases(m = plus.minus 1, m = 1) <=> m = 1 $
        Khi $m = 1$, mệnh đề trở thành $0x + 0 = 0$ (luôn ĐÚNG với mọi $x in RR$).
        Vậy giá trị cần tìm là $m = 1$.
    ]
)

// TLN 6 (Tư duy)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 104], back-to: "sec-exercise-hub",[Cho một số tự nhiên có 3 chữ số $n = overline(a b c)$. Đặt mệnh đề $P(n)$: "$a, b, c$ là ba số tự nhiên liên tiếp tăng dần", mệnh đề $Q(n)$: "$n$ chia hết cho 3".
Có bao nhiêu số tự nhiên $n$ có 3 chữ số thỏa mãn mệnh đề $P(n) => Q(n)$ là mệnh đề SAI?],
    [0],
    loigiai: [
        #step([Phân tích điều kiện để mệnh đề kéo theo sai])
        Mệnh đề $P(n) => Q(n)$ bị SAI khi và chỉ khi giả thiết $P(n)$ ĐÚNG và kết luận $Q(n)$ SAI.
        Tức là: $n = overline(a b c)$ có 3 chữ số liên tiếp tăng dần, nhưng số $n$ lại KHÔNG chia hết cho 3.
        
        #step([Kiểm tra dấu hiệu chia hết cho 3])
        Nếu $a, b, c$ là 3 số tự nhiên liên tiếp tăng dần, ta có: $b = a+1$ và $c = a+2$ ($1 <= a <= 7$).
        Tổng các chữ số của $n$ là:
        $ S = a + b + c = a + (a+1) + (a+2) = 3a + 3 = 3(a+1) $
        Vì $3(a+1)$ luôn chia hết cho 3 với mọi số tự nhiên $a$, nên tổng các chữ số của $n$ luôn chia hết cho 3, dẫn đến số $n$ LUÔN LUÔN chia hết cho 3.
        Do đó, khi $P(n)$ đúng thì mệnh đề $Q(n)$ cũng LUÔN ĐÚNG.
        
        #step([Kết luận])
        Vì kết luận $Q(n)$ không bao giờ bị sai khi $P(n)$ đúng, nên mệnh đề kéo theo $P(n) => Q(n)$ luôn luôn ĐÚNG với mọi số tự nhiên $n$ có 3 chữ số liên tiếp tăng dần.
        Vậy không có số tự nhiên nào thỏa mãn để mệnh đề trên bị SAI.
        Số lượng số tự nhiên thỏa mãn là: $0$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 1: MỆNH ĐỀ TOÁN HỌC (ĐỀ SỐ 3)!]      #v(0.6em)
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
