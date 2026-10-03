// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 04)
// Lớp: Khối 11  ·  Mã đề: 101  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

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
  title: "CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 04)",
  subtitle: "ÔN TẬP CHƯƠNG 4 — MÃ ĐỀ: 101",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 101]],
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
#lt-tn(num: 1, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Thông qua phép chiếu song song lên mặt phẳng $(P)$, hình chiếu của một tam giác $A B C$ không thể là hình nào dưới đây?],
    (
        [Một tam giác.],
        [Một đoạn thẳng.],
        True([Một điểm.]),
        [Một tam giác vuông.]
    ),
    loigiai: [
        Phép chiếu song song biến một tam giác thành một tam giác (nếu mặt phẳng tam giác không song song với phương chiếu) hoặc thành một đoạn thẳng (nếu mặt phẳng tam giác song song với phương chiếu).
        Nó không thể biến một tam giác thành một điểm.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình hộp $A B C D . A' B' C' D'$. Cặp đường thẳng nào sau đây chéo nhau trong không gian?],
    (
        [$A A'$ và $B B'$.],
        [$A B$ và $C D$.],
        True([$A B'$ và $C D'$]),
        [$A' C'$ và $A C$.]
    ),
    loigiai: [
        - $A A' parallel B B'$ (song song).
        - $A B parallel C D$ (song song).
        - $A' C' parallel A C$ (song song).
        - $A B'$ và $C D'$ chéo nhau vì chúng thuộc hai mặt song song của hình hộp và không song song với nhau.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Phép chiếu song song của một hình thang lên một mặt phẳng luôn thu được hình chiếu là hình gì (trong trường hợp mặt phẳng hình thang không song song với phương chiếu)?],
    (
        [Hình bình hành.],
        True([Hình thang.]),
        [Hình chữ nhật.],
        [Đoạn thẳng.]
    ),
    loigiai: [
        Vì phép chiếu song song bảo toàn tính song song của các đường thẳng, nên hai cạnh đáy song song của hình thang sẽ được chiếu thành hai đường thẳng song song. Do đó, hình chiếu của hình thang vẫn là một hình thang.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Một tấm pin năng lượng mặt trời phẳng hình chữ nhật có diện tích $S = 6$ $"m"^2$ được lắp đặt song song với mặt đất phẳng. Khi ánh mặt trời chiếu thẳng đứng từ trên xuống, bóng của tấm pin trên mặt đất có diện tích là bao nhiêu?],
    (
        [$3$ $"m"^2$.],
        [$4$ $"m"^2$.],
        True([$6$ $"m"^2$.]),
        [$12$ $"m"^2$.]
    ),
    loigiai: [
        Vì tấm pin song song với mặt đất nên phép chiếu song song theo phương thẳng đứng sẽ cho hình chiếu là một hình chữ nhật có kích thước và diện tích bằng đúng tấm pin gốc.
        Do đó diện tích bóng là $6$ $"m"^2$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình hộp $A B C D . A' B' C' D'$. Mặt phẳng $(A B' D')$ song song với mặt phẳng nào sau đây?],
    (
        [$(A' B C)$.],
        [$(B C' D)$.],
        True([$(C D' B')$]),
        [$(B D C')$.]
    ),
    loigiai: [
        Ta có:
        - $A D' parallel B C'$
        - $A B' parallel D C'$
        Do đó $(A B' D') parallel (B C' D)$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Trong phép chiếu song song theo phương chiếu $l$ lên mặt phẳng $(P)$, hình chiếu của đường thẳng $d$ song song với phương chiếu $l$ là gì?],
    (
        [Đường thẳng $d$.],
        [Đường thẳng song song với $d$.],
        True([Một điểm.]),
        [Vô số điểm.]
    ),
    loigiai: [
        Nếu đường thẳng $d$ song song với phương chiếu $l$, mọi điểm thuộc $d$ đều có hình chiếu trùng nhau và chính là giao điểm của $d$ với mặt phẳng chiếu $(P)$. Do đó, hình chiếu của đường thẳng $d$ là một điểm.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M$ là trung điểm của $A B$. Mặt phẳng đi qua $M$ và song song với mặt phẳng $(A' B' C')$ cắt cạnh $A C$ tại $N$. Khẳng định nào sau đây đúng?],
    (
        [$M N$ chéo với $B C$.],
        True([$M N parallel B C$.]),
        [$M N$ vuông góc với $B C$.],
        [$M N = 2 B C$.]
    ),
    loigiai: [
        Mặt phẳng qua $M$ song song với mặt đáy $(A' B' C')$ cũng song song với mặt đáy $(A B C)$.
        Giao tuyến của mặt phẳng này với mặt phẳng đáy $(A B C)$ là đường thẳng đi qua $M$ và song song với $B C$ (vì $M$ là trung điểm $A B$).
        Do đó $M N parallel B C$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Một cấu kiện mái che di động có dạng hình hộp $A B C D . A' B' C' D'$. Các thanh chống $A A', B B', C C', D D'$ song song với nhau và vuông góc với mặt đất nằm ngang. Mặt che tôn $A' B' C' D'$ song song với mặt sàn bê tông $A B C D$. Khẳng định nào sau đây là đúng về vị trí của thanh giằng chéo $A' C$ đối với mặt che tôn $A' B' C' D'$?],
    (
        [$A' C$ song song với mặt che tôn.],
        True([$A' C$ cắt mặt che tôn tại $A'$.]),
        [$A' C$ nằm trên mặt che tôn.],
        [$A' C$ vuông góc với mặt che tôn.]
    ),
    loigiai: [
        Đường thẳng $A' C$ đi qua điểm $A'$ nằm trên mặt che tôn $(A' B' C' D')$ và điểm $C$ nằm ngoài mặt phẳng này. Do đó, đường thẳng $A' C$ cắt mặt che tôn tại điểm duy nhất là $A'$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hai đoạn thẳng $A B$ và $C D$ song song với nhau. Gọi $A', B'$ là hình chiếu song song của $A, B$ và $C', D'$ là hình chiếu song song của $C, D$ lên cùng một mặt phẳng $(P)$. Mệnh đề nào sau đây luôn đúng?],
    (
        [$A' B' = C' D'$.],
        True([$(A' B') / (C' D') = (A B) / (C D)$ nếu các đường thẳng không song song với phương chiếu.]),
        [$A' B' parallel C' D'$ trong mọi trường hợp.],
        [$A' B'$ vuông góc với $C' D'$.]
    ),
    loigiai: [
        Theo tính chất phép chiếu song song: Tỉ số độ dài của hai đoạn thẳng nằm trên hai đường thẳng song song (hoặc trùng nhau) được bảo toàn qua phép chiếu song song.
        Do đó $(A' B') / (C' D') = (A B) / (C D)$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Bóng nắng của một chiếc cột dựng thẳng đứng lên mặt đất phẳng được tạo bởi ánh mặt trời chiếu chéo. Khẳng định nào sau đây đúng về mối quan hệ giữa cột và bóng của nó?],
    (
        [Cột song song với bóng của nó.],
        True([Cột cắt bóng của nó tại chân cột.]),
        [Cột chéo nhau với bóng của nó.],
        [Cột trùng với bóng của nó.]
    ),
    loigiai: [
        Chiếc cột và bóng của nó nằm trong cùng một mặt phẳng chứa tia nắng đi qua đỉnh cột. Chúng cắt nhau tại chân cột (nơi cột tiếp xúc với mặt đất).
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình hộp $A B C D . A' B' C' D'$. Mặt phẳng $(A C D')$ song song với mặt phẳng nào sau đây?],
    (
        [$(A' B' C')$.],
        [$(B B' D')$.],
        True([$(A' C' B)$]),
        [$(A B D)$.]
    ),
    loigiai: [
        Ta có $A C parallel A' C'$ và $C D' parallel A' B$.
        Do đó $(A C D') parallel (A' C' B)$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Bóng của một cái mâm hình tròn đặt nghiêng so với mặt đất phẳng dưới ánh mặt trời chiếu chéo là hình gì trên mặt đất phẳng?],
    (
        [Hình tròn.],
        True([Hình elip.]),
        [Hình vuông.],
        [Đoạn thẳng.]
    ),
    loigiai: [
        Khi mâm hình tròn đặt nghiêng (không song song với mặt đất và không song song với tia sáng mặt trời), hình chiếu song song của hình tròn lên mặt đất phẳng là một hình elip.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#lt-ds(num: 13, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình hộp $A B C D . A' B' C' D'$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $C D$. Các phát biểu sau đúng hay sai?], (
        True([Đường thẳng $M N$ song song với mặt phẳng $(A' B' C' D')$.]),
        True([Đường thẳng $A' C$ chéo nhau với đường thẳng $B D'$.]),
        [Mặt phẳng $(B' M N)$ song song với mặt phẳng $(D' A C)$.],
        True([Phép chiếu song song theo phương $A A'$ lên mặt phẳng $(A B C D)$ biến đoạn thẳng $M N$ thành chính nó.])
    ), 
    loigiai: [
        - *a)* Đúng. Vì $M N$ là đường trung bình của hình bình hành $A B C D => M N parallel A D parallel A' D' => M N parallel (A' B' C' D')$.
        - *b)* Đúng. $A' C$ và $B D'$ là hai đường chéo của hình hộp, chúng cắt nhau tại tâm $O$ của hình hộp (không chéo nhau). Do đó phát biểu b) là Sai.
        - *c)* Sai. Mặt phẳng $(B' M N)$ không song song với $(D' A C)$ vì chúng có các đường thẳng cắt nhau.
        - *d)* Đúng. Vì $M, N$ nằm trên mặt phẳng đáy $(A B C D)$ nên hình chiếu song song của chúng lên mặt đáy theo phương $A A'$ chính là $M, N$. Do đó hình chiếu của đoạn thẳng $M N$ là chính nó.
    ]
)

// DS 2
#lt-ds(num: 14, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Xét phép chiếu song song lên mặt phẳng $(P)$ theo phương chiếu $l$. Các phát biểu sau đúng hay sai?], (
        [Hình chiếu của một tam giác đều luôn luôn là một tam giác đều.],
        [Hình chiếu của một hình chữ nhật luôn luôn là một hình chữ nhật.],
        True([Hình chiếu của hai đường thẳng song song là hai đường thẳng song song hoặc trùng nhau.]),
        True([Hình chiếu của một góc nhọn có thể là một góc tù.])
    ), 
    loigiai: [
        - *a)* Sai. Phép chiếu song song không bảo toàn góc và khoảng cách, nên hình chiếu của tam giác đều thông thường chỉ là tam giác thường.
        - *b)* Sai. Hình chiếu của hình chữ nhật thông thường là hình bình hành.
        - *c)* Đúng. Nếu hai đường thẳng song song không song song với phương chiếu, hình chiếu của chúng là hai đường thẳng song song. Nếu chúng song song với phương chiếu thì hình chiếu là hai điểm (hoặc trùng nhau).
        - *d)* Đúng. Vì góc không được bảo toàn qua phép chiếu song song, nên một góc nhọn hoàn toàn có thể có hình chiếu là góc tù.
    ]
)

// DS 3
#lt-ds(num: 15, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Mô hình hóa hệ khung giàn thép nhà thi đấu dạng hình hộp $A B C D . A' B' C' D'$. Các thanh giằng chịu lực gồm $A C', B D', C A', D B'$. Các phát biểu sau đúng hay sai?], (
        True([Bốn thanh giằng chéo này đồng quy tại tâm $O$ của hình hộp.]),
        [Thanh giằng $A C'$ song song với thanh giằng $C A'$.],
        [Mặt phẳng chứa hai thanh giằng $A C'$ và $B D'$ song song với mặt bên của hình hộp.],
        True([Tỉ số khoảng cách từ tâm $O$ đến các mặt đối diện của hình hộp bằng $1$.])
    ), 
    loigiai: [
        - *a)* Đúng. Bốn đường chéo của hình hộp luôn cắt nhau tại trung điểm của mỗi đường, đó chính là tâm $O$ của hình hộp.
        - *b)* Sai. Hai đường chéo $A C'$ và $C A'$ cắt nhau tại $O$, không song song với nhau.
        - *c)* Sai. Mặt phẳng $(A C' B D')$ cắt các mặt bên của hình hộp nên không thể song song với chúng.
        - *d)* Đúng. Vì tâm $O$ là trung điểm của các đường chéo nên khoảng cách từ $O$ đến các mặt phẳng đối diện luôn bằng nhau, tỉ số bằng $1$.
    ]
)

// DS 4
#lt-ds(num: 16, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N, P$ lần lượt là trung điểm của các cạnh $A A', B B', C C'$. Các phát biểu sau đúng hay sai?], (
        True([Mặt phẳng $(M N P)$ song song với mặt phẳng $(A B C)$.]),
        True([Thiết diện của hình lăng trụ cắt bởi mặt phẳng $(M N P)$ là tam giác $M N P$ bằng tam giác đáy $A' B' C'$.]),
        True([Đoạn nối trọng tâm tam giác $A B C$ và trọng tâm tam giác $M N P$ song song với các cạnh bên hình lăng trụ.]),
        [Thể tích khối lăng trụ phần dưới $A B C . M N P$ bằng $(1)/(3)$ thể tích khối lăng trụ $A B C . A' B' C'$.]
    ), 
    loigiai: [
        - *a)* Đúng. Vì $M N parallel A B$, $N P parallel B C$, nên $(M N P) parallel (A B C)$.
        - *b)* Đúng. Thiết diện chính là tam giác $M N P$ đồng dạng tỉ số $1$ (bằng) tam giác đáy $A' B' C'$.
        - *c)* Đúng. Trọng tâm của hai thiết diện song song nối với nhau song song với các cạnh bên của hình lăng trụ đứng.
        - *d)* Sai. Vì $M, N, P$ là trung điểm các cạnh bên nên mặt phẳng $(M N P)$ chia đôi hình lăng trụ thành hai phần có thể tích bằng nhau. Thể tích phần dưới bằng $(1)/(2)$ thể tích lăng trụ.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#lt-tln(num: 17, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình hộp $A B C D . A' B' C' D'$ tâm $O$. Mặt phẳng $(alpha)$ đi qua $O$ và song song với hai đường thẳng $A B$ và $A D$. Mặt phẳng $(alpha)$ cắt cạnh $A A'$ tại điểm $M$. Tính tỉ số $(A M) / (A A')$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [3],
    loigiai: [
        Mặt phẳng $(alpha)$ qua $O$ và song song với $A B, A D$ nên $(alpha)$ song song với mặt phẳng đáy $(A B C D)$.
        Do đó, mặt phẳng $(alpha)$ chính là mặt phẳng trung bình cắt tất cả các cạnh bên tại trung điểm của chúng.
        Suy ra $M$ là trung điểm của $A A' => (A M) / (A A') = (1)/(2)$.
        Phân số tối giản là $(1)/(2)$, ta được $a = 1, b = 2 => a + b = 3$.
    ]
)

// TL 2
#lt-tln(num: 18, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Một tấm biển quảng cáo hình chữ nhật $A B C D$ có chiều dài $a = 3$ m, chiều rộng $b = 2$ m được lắp đặt song song với mặt đất phẳng nằm ngang. Dưới ánh nắng mặt trời chiếu song song chéo góc, bóng của tấm biển lên mặt đất tạo thành hình bình hành $A' B' C' D'$. Tính diện tích hình bình hành bóng đó (tính bằng mét vuông).],
    [6],
    loigiai: [
        Vì tấm biển quảng cáo $A B C D$ song song với mặt đất phẳng nên phép chiếu song song của tấm biển lên mặt đất sẽ cho hình ảnh có kích thước và diện tích bằng đúng tấm biển ban đầu.
        Do đó diện tích hình bình hành bóng $A' B' C' D'$ là:
        $ S = a dot b = 3 dot 2 = 6 $ ($m^2$).
    ]
)

// TL 3
#lt-tln(num: 19, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình hộp $A B C D . A' B' C' D'$ có thể tích bằng $72$ $"cm"^3$. Gọi $M, N$ lần lượt là trung điểm của các cạnh $A B$ và $A D$. Mặt phẳng $(A' M N)$ chia hình hộp thành hai phần. Tính thể tích phần nhỏ hơn chứa đỉnh $A$ (tính bằng xăng-ti-mét khối).],
    [21],
    loigiai: [
        Phần nhỏ hơn chứa đỉnh $A$ là khối đa diện có thể tích được tính bằng công thức tương tự hình chóp cụt / nêm:
        $ V = (7)/(24) V_("hộp") $.
        Thay số vào:
        $ V = (7)/(24) dot 72 = 21 " (cm"^3")" $.
    ]
)

// TL 4
#lt-tln(num: 20, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình lăng trụ tam giác $A B C . A' B' C'$. Gọi $M, N$ lần lượt là trung điểm của $A' B'$ và $B' C'$. Mặt phẳng $(A M N)$ cắt cạnh $C C'$ tại điểm $P$. Tính tỉ số $(C' P) / (C C')$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [3],
    loigiai: [
        Ta có $M N$ là đường trung bình của tam giác $A' B' C' => M N parallel A' C' parallel A C$.
        Do đó mặt phẳng $(A M N)$ chứa đường thẳng $M N parallel A C$.
        Vì vậy giao tuyến của $(A M N)$ với mặt bên $(A C C' A')$ song song với $A C$.
        Đường thẳng đi qua $A$ song song với $A C$ chính là đường thẳng $A C$.
        Suy ra giao tuyến này cắt $C C'$ tại điểm $P$ sao cho $A P parallel M N parallel A' C'$.
        Do đó $P$ trùng với $C'$.
        Tỉ số $(C' P) / (C C') = 0 / 1$ (vì $P$ trùng $C'$ nên đoạn $C'P = 0$).
        Tuy nhiên, đề hỏi tỉ số đoạn thẳng từ đỉnh $C'$ đến điểm cắt $P$ trên $C C'$.
        Nếu cắt qua $A, M, N$ thì thiết diện là hình thang $A M N C$, nghĩa là giao điểm $P$ trùng với điểm $C$.
        Do đó $P$ trùng $C$.
        Suy ra $(C' P) / (C C') = (C' C) / (C C') = 1$.
        Đáp án tỉ số bằng $1$. Nhập đáp án $a/b = 1/1 => a+b = 2$.
    ]
)

// TL 5
#lt-tln(num: 21, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Cho hình hộp $A B C D . A' B' C' D'$. Điểm $M$ thuộc cạnh $A A'$ sao cho $(A M) / (A A') = (1)/(3)$. Mặt phẳng $(M C D')$ cắt cạnh $B B'$ tại điểm $N$. Tính tỉ số $(B N) / (B B')$ (viết kết quả dưới dạng phân số tối giản $a/b$, nhập đáp án là $a+b$).],
    [4],
    fig: canvas(length: 1.3cm, {
      import draw: *
      let A = (-1.5, 0.5)
      let B = (1.5, 0.5)
      let C = (2.5, -0.8)
      let D = (-0.5, -0.8)
      
      let Ap = (-1.5, 2.5)
      let Bp = (1.5, 2.5)
      let Cp = (2.5, 1.2)
      let Dp = (-0.5, 1.2)
      
      // M on AA' and N on BB' with ratio 1/3
      let M = (-1.5, 1.17)
      let N = (1.5, 1.17)
      
      // Color fill for cross-section MNCD'
      line(M, N, C, Dp, close: true, fill: rgb("#0F766E1a"), stroke: none)
      
      // Hidden edges of hộp
      line(A, B, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      line(A, D, stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      // Hidden edges of cross-section
      line(M, N, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      line(Dp, M, stroke: (paint: rgb("#0F766E"), thickness: 1.2pt, dash: "dashed"))
      
      // Visible edges of hộp
      line(A, Ap, stroke: 1pt + black)
      line(B, C, stroke: 1pt + black)
      line(C, D, stroke: 1pt + black)
      line(B, Bp, stroke: 1pt + black)
      line(C, Cp, stroke: 1pt + black)
      line(D, Dp, stroke: 1pt + black)
      
      line(Ap, Bp, stroke: 1.2pt + black)
      line(Bp, Cp, stroke: 1.2pt + black)
      line(Cp, Dp, stroke: 1.2pt + black)
      line(Dp, Ap, stroke: 1.2pt + black)
      
      // Visible edges of cross-section
      line(N, C, stroke: 1.5pt + rgb("#0F766E"))
      line(C, Dp, stroke: 1.5pt + rgb("#0F766E"))
      
      // Labels
      circle(A, radius: 1.8pt, fill: black); content((A.at(0) - 0.35, A.at(1) + 0.2), $A$, size: 10pt)
      circle(B, radius: 1.8pt, fill: black); content((B.at(0) + 0.35, B.at(1) + 0.2), $B$, size: 10pt)
      circle(C, radius: 1.8pt, fill: black); content((C.at(0) + 0.25, C.at(1) - 0.25), $C$, size: 10pt)
      circle(D, radius: 1.8pt, fill: black); content((D.at(0) - 0.35, D.at(1) - 0.2), $D$, size: 10pt)
      circle(Ap, radius: 1.8pt, fill: black); content((Ap.at(0) - 0.35, Ap.at(1) + 0.25), $A'$, size: 10pt)
      circle(Bp, radius: 1.8pt, fill: black); content((Bp.at(0) + 0.35, Bp.at(1) + 0.25), $B'$, size: 10pt)
      circle(Cp, radius: 1.8pt, fill: black); content((Cp.at(0) + 0.25, Cp.at(1) - 0.25), $C'$, size: 10pt)
      circle(Dp, radius: 1.8pt, fill: black); content((Dp.at(0) - 0.35, Dp.at(1) - 0.2), $D'$, size: 10pt)
      
      circle(M, radius: 1.8pt, fill: rgb("#0F766E")); content((M.at(0) - 0.35, M.at(1) + 0.2), $M$, size: 10pt, fill: rgb("#0F766E"))
      circle(N, radius: 1.8pt, fill: rgb("#0F766E")); content((N.at(0) + 0.35, N.at(1) + 0.2), $N$, size: 10pt, fill: rgb("#0F766E"))
    }),
    fig-pos: "center",
    loigiai: [
        Mặt phẳng $(M C D')$ chứa đường thẳng $C D'$.
        Ta có $C D' parallel B A'$ trong hình hộp.
        Mặt phẳng $(M C D')$ cắt mặt bên $(A B B' A')$ theo giao tuyến qua $M$.
        Do đó, giao tuyến $M N$ song song với $B A'$.
        Trong mặt bên $A B B' A'$, ta có $M N parallel B A'$.
        Theo định lý Thales trong hình bình hành:
        $ (B N) / (B B') = (A M) / (A A') = (1)/(3) $.
        Phân số tối giản là $(1)/(3)$, do đó $a = 1, b = 3 => a + b = 4$.
    ]
)

// TL 6
#lt-tln(num: 22, de: [Đề 1 (de04) — Mã 101], back-to: "sec-exercise-hub",[Một cột ăng-ten đứng thẳng trên mặt đất phẳng. Dưới bóng mặt trời chiếu chéo, bóng của cột trên mặt đất dài $30$ m. Cùng lúc đó, một cái cọc cao $2$ m dựng thẳng đứng trên mặt đất có bóng dài $1.5$ m. Tính chiều cao của cột ăng-ten (tính bằng mét).],
    [40],
    loigiai: [
        Tia nắng mặt trời chiếu song song tạo ra các tam giác đồng dạng giữa cột ăng-ten và cái cọc chôn trên mặt đất.
        Gọi $h$ là chiều cao cột ăng-ten.
        Ta có tỉ số đồng dạng:
        $ h / 2 = 30 / 1.5 => h = (30 dot 2) / (1.5) = 40 $ (m).
        Chiều cao cột ăng-ten là $40$ m.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH CHƯƠNG 4. QUAN HỆ SONG SONG (ĐỀ SỐ 04)!]      #v(0.6em)
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
