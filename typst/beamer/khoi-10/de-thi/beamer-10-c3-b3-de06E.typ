// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 6: TOÁN THỰC TẾ & ĐO ĐẠC HÌNH HỌC (ĐỀ E: HÀNG HẢI, HÀNG KHÔNG & RADAR)
// Lớp: Khối 10  ·  Mã đề: 108  ·  GV: Nguyễn Văn Sang
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

// HÀM VẼ CUNG GÓC CHUẨN XÁC TRONG CETZ
// (Khắc phục việc arc trong CeTZ nhận tọa độ điểm bắt đầu trên đường tròn)
#let draw_angle_arc(center, a1, a2, radius: 0.8, ..rest) = {
  let sx = center.at(0) + radius * calc.cos(a1)
  let sy = center.at(1) + radius * calc.sin(a1)
  cetz.draw.arc((sx, sy), start: a1, stop: a2, radius: radius, ..rest)
}

#show: lecture-theme.with(
  title: "BÀI 6: TOÁN THỰC TẾ & ĐO ĐẠC HÌNH HỌC (ĐỀ E: HÀNG HẢI, HÀNG KHÔNG & RADAR)",
  subtitle: "ÔN TẬP CHƯƠNG 3 — MÃ ĐỀ: 108",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 108]],
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

// TN 1: Hải trình đổi hướng vuông góc (Hình ngay ở đề bài kèm emoji 🚢)
#lt-tn(num: 1, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Từ cảng biển $O$, một tàu tuần tra biên phòng chạy theo hướng Đông một quãng đường $40$ hải lý đến vị trí $A$, sau đó rẽ vuông góc chạy thẳng về hướng Bắc một đoạn $30$ hải lý đến vị trí $B$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.08
    
    let pO = (0, 0)
    let pA = (40 * sc, 0)
    let pB = (40 * sc, 30 * sc)
    
    // Hải trình
    stroke(1.5pt + rgb("0d9488"))
    line(pO, pA)
    line(pA, pB)
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.5pt))
    line(pO, pB)
    
    content((-0.4, 0), [⚓ $O$])
    circle(pA, radius: 2pt, fill: black)
    content((pA.at(0) + 0.35, -0.2), text(weight: "bold")[$A$])
    content((pB.at(0), pB.at(1) + 0.35), [🚢 $B$])
    
    content((20 * sc, -0.35), text(fill: rgb("0d9488"), size: 8pt)[$40$ HL])
    content((40 * sc + 0.6, 15 * sc), text(fill: rgb("0d9488"), size: 8pt)[$30$ HL])
    content((20 * sc - 0.5, 15 * sc + 0.3), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$O B = ?$])
  })
]
Khoảng cách đường chim bay từ cảng $O$ đến vị trí $B$ bằng:],
    (
        [$70$ hải lý],
        [$60$ hải lý],
        True([$50$ hải lý]),
        [$35$ hải lý]
    ),
    loigiai: [
        Tam giác $O A B$ vuông tại $A$ có $O A = 40, A B = 30$:
        $ O B = sqrt(O A^2 + A B^2) = sqrt(40^2 + 30^2) = sqrt(1600 + 900) = sqrt(2500) = 50 text(" hải lý") $
    ]
)

// TN 2: Góc quét ngọn hải đăng nhìn hai tàu (Hình ngay ở đề bài kèm emoji 🗼, ⛵)
#lt-tn(num: 2, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một ngọn hải đăng $O$ quan sát thấy hai tàu hàng $A$ và $B$. Khoảng cách từ hải đăng đến tàu $A$ là $6" km"$, đến tàu $B$ là $8" km"$, và khoảng cách đo được giữa hai tàu là $10" km"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.35
    
    let pO = (0, 0)
    let pA = (6 * sc, 0)
    let pB = (0, 8 * sc)
    
    stroke(1.2pt + rgb("0284c7"))
    line(pO, pA)
    line(pO, pB)
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pA, pB)
    
    content((-0.45, -0.3), [🗼 $O$])
    content((pA.at(0) + 0.45, 0), [⛵ $A$])
    content((0, pB.at(1) + 0.35), [⛵ $B$])
    
    content((3 * sc, -0.3), text(size: 8pt)[$6" km"$])
    content((-0.6, 4 * sc), text(size: 8pt)[$8" km"$])
    content((3 * sc + 0.4, 4 * sc + 0.2), text(fill: rgb("dc2626"), size: 8pt)[$10" km"$])
    
    // Góc vuông tại O
    rect((0, 0), (0.3, 0.3), stroke: 0.8pt + rgb("d97706"))
  })
]
Góc quét giữa hai tia nhìn từ hải đăng tới hai tàu bằng:],
    (
        [$60^circ$],
        True([$90^circ$]),
        [$120^circ$],
        [$45^circ$]
    ),
    loigiai: [
        Xét tam giác $O A B$ có $O A = 6, O B = 8, A B = 10$.
        Vì $O A^2 + O B^2 = 6^2 + 8^2 = 36 + 64 = 100 = 10^2 = A B^2$, theo định lý Pytago đảo, tam giác vuông tại $O$, tức là $hat(A O B) = 90^circ$.
    ]
)

// TN 3: Góc hạ tiếp cận đường băng (Hình ngay ở đề bài kèm emoji ✈️)
#lt-tn(num: 3, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một máy bay phản lực đang ở độ cao $1200" m"$, khoảng cách theo phương nằm ngang từ máy bay đến đầu đường băng là $15" km"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.25
    
    // Mặt đất
    line((-0.5, 0), (16 * sc, 0), stroke: 1pt + luma(100))
    line((0, 0), (3 * sc, 0), stroke: 2.5pt + rgb("1e293b"))
    
    let pRunway = (0, 0)
    let pPlane = (15 * sc, 1.2 * 2.5 * sc)
    
    stroke(1.5pt + rgb("0d9488"))
    line(pPlane, pRunway)
    
    // Đường gióng đứng độ cao
    stroke((paint: luma(120), dash: "dashed", thickness: 0.6pt))
    line(pPlane, (15 * sc, 0))
    content((15 * sc + 0.65, pPlane.at(1)/2), text(size: 7.5pt)[$1200" m"$])
    
    // Đường nằm ngang tầm bay
    line(pPlane, (pPlane.at(0) - 3 * sc, pPlane.at(1)), stroke: (paint: luma(140), dash: "dotted", thickness: 0.6pt))
    
    content((0, -0.35), text(weight: "bold")[🛬 Đường băng])
    content((pPlane.at(0) + 0.5, pPlane.at(1) + 0.2), [✈️])
    
    content((7.5 * sc, -0.3), text(size: 8pt)[$15" km"$])
    draw_angle_arc(pPlane, 180deg, 184.57deg, radius: 1.0, stroke: 0.8pt + rgb("d97706"))
  })
]
Góc hạ tiếp cận hạ cánh của máy bay so với phương ngang xấp xỉ bằng:],
    (
        [$2.85^circ$],
        [$3.50^circ$],
        True([$4.57^circ$]),
        [$5.24^circ$]
    ),
    loigiai: [
        Đổi $15" km" = 15000" m"$. Gọi góc hạ tiếp cận là $alpha$:
        $ tan alpha = 1200 / 15000 = 0.08 => alpha approx 4.57^circ $
    ]
)

// TN 4: Tam giác định vị ba trạm sóng
#lt-tn(num: 4, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một thiết bị thu phát tín hiệu di động $M$ nhận tín hiệu từ hai trạm viễn thông $A$ và $B$ cách nhau $10" km"$. Thiết bị xác định khoảng cách đến trạm $A$ là $6" km"$ và đến trạm $B$ là $8" km"$. Góc nhìn $hat(A M B)$ từ thiết bị đến hai trạm bằng:],
    (
        [$60^circ$],
        [$120^circ$],
        True([$90^circ$]),
        [$45^circ$]
    ),
    loigiai: [
        Vì $M A^2 + M B^2 = 6^2 + 8^2 = 100 = A B^2$, tam giác $M A B$ vuông tại $M$. Do đó góc $hat(A M B) = 90^circ$.
    ]
)

// TN 5: Tàu ngầm lặn nghiêng (Hình ngay ở đề bài kèm emoji 🌊)
#lt-tn(num: 5, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một tàu ngầm lặn xuống biển theo đường thẳng tạo với mặt nước một góc nghiêng $15^circ$. Sau khi di chuyển được quãng đường dài $800" m"$ theo phương lặn.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.005
    
    // Mặt biển
    line((-0.5, 0), (850 * sc, 0), stroke: 1pt + rgb("0284c7"))
    content((400 * sc, 0.3), text(fill: rgb("0284c7"), size: 8pt)[🌊 Mặt biển])
    
    let pStart = (0, 0)
    let pSub = (800 * 0.966 * sc, -800 * 0.259 * sc)
    
    stroke(1.8pt + rgb("0f766e"))
    line(pStart, pSub)
    content((pSub.at(0) + 0.35, pSub.at(1)), [🚢])
    
    // Đường gióng độ sâu
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 0.8pt))
    line(pSub, (pSub.at(0), 0))
    content((pSub.at(0) + 0.65, pSub.at(1)/2), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$h = ?$])
    
    content((400 * 0.966 * sc - 0.5, -400 * 0.259 * sc - 0.2), text(fill: rgb("0f766e"), size: 8pt)[$800" m"$])
    
    draw_angle_arc(pStart, -15deg, 0deg, radius: 1.0, stroke: 0.8pt + rgb("d97706"))
    content((1.3, -0.2), text(fill: rgb("d97706"), size: 7.5pt)[$15^circ$])
  })
]
Độ sâu của tàu ngầm so với mặt nước biển xấp xỉ bằng:],
    (
        [$185" m"$],
        True([$207" m"$]),
        [$245" m"$],
        [$155" m"$]
    ),
    loigiai: [
        Độ sâu đạt được là:
        $ h = 800 dot sin 15^circ approx 800 dot 0.25882 = 207.06" m" approx 207" m" $
    ]
)

// TN 6: Tầm nhìn phi công tới đèn sân bay
#lt-tn(num: 6, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Khi máy bay ở độ cao $300" m"$, phi công nhìn thấy cụm đèn hiệu ở đầu đường băng dưới góc hạ $3^circ$. Khoảng cách đường chim bay trực tiếp từ máy bay đến cụm đèn hiệu xấp xỉ bằng:],
    (
        [$4500" m"$],
        [$5000" m"$],
        True([$5732" m"$]),
        [$6120" m"$]
    ),
    loigiai: [
        Gọi khoảng cách đường chim bay là $L$:
        $ L = 300 / (sin 3^circ) approx 300 / 0.052336 = 5732.2" m" approx 5732" m" $
    ]
)

// TN 7: Hai tàu nằm trên biên phủ sóng radar (Hình ngay ở đề bài kèm emoji 📡, 🚢)
#lt-tn(num: 7, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Trạm radar hàng hải ven bờ $O$ có bán kính phát hiện mục tiêu là $50" km"$. Hai tàu biển $A$ và $B$ cùng di chuyển trên đường biên của vùng quét sóng ($O A = O B = 50" km"$), góc giữa hai tàu nhìn từ trạm radar là $hat(A O B) = 60^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.04
    
    let pO = (0, 0)
    let pA = (50 * 0.5 * sc, 50 * 0.866 * sc)
    let pB = (50 * sc, 0)
    
    // Cung tròn vùng radar
    draw_angle_arc(pO, -10deg, 70deg, radius: 50 * sc, stroke: (paint: rgb("99f6e4"), thickness: 1.2pt))
    
    stroke(1.2pt + rgb("0d9488"))
    line(pO, pA)
    line(pO, pB)
    stroke(1.8pt + rgb("dc2626"))
    line(pA, pB)
    
    content((-0.4, 0), [📡 $O$])
    content((pA.at(0), pA.at(1) + 0.35), [🚢 $A$])
    content((pB.at(0) + 0.4, 0), [🚢 $B$])
    
    content((pA.at(0)/2 - 0.45, pA.at(1)/2 + 0.2), text(fill: rgb("0d9488"), size: 8pt)[$50" km"$])
    content((25 * sc, -0.35), text(fill: rgb("0d9488"), size: 8pt)[$50" km"$])
    content(((pA.at(0)+pB.at(0))/2 + 0.5, pA.at(1)/2), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$A B = ?$])
    
    draw_angle_arc(pO, 0deg, 60deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((0.8, 0.4), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
  })
]
Khoảng cách giữa hai tàu $A$ và $B$ bằng:],
    (
        [$25" km"$],
        [$50 sqrt(3)" m"$],
        True([$50" km"$]),
        [$100" km"$]
    ),
    loigiai: [
        Tam giác $O A B$ cân tại $O$ và có góc $hat(A O B) = 60^circ$ nên là tam giác đều. Do đó $A B = O A = 50" km"$.
    ]
)

// TN 8: Chuyến bay đổi hướng tránh giông bão
#lt-tn(num: 8, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một máy bay xuất phát từ $A$ bay đến $B$. Do gặp vùng giông sét, máy bay bay lệch một góc $20^circ$ so với lộ trình thẳng một đoạn $A C = 350" km"$. Khi góc $hat(A B C) = 30^circ$, khoảng cách $B C$ từ máy bay đến đích $B$ xấp xỉ bằng:],
    (
        [$210.5" km"$],
        True([$239.4" km"$]),
        [$265.8" km"$],
        [$280.2" km"$]
    ),
    loigiai: [
        Áp dụng định lý sin trong tam giác $A B C$:
        $ (B C) / (sin 20^circ) = (A C) / (sin 30^circ) => B C = (350 dot sin 20^circ) / (sin 30^circ) approx (350 dot 0.34202) / 0.5 = 239.41" km" approx 239.4" km" $
    ]
)

// TN 9: Diện tích vùng biển tìm kiếm cứu nạn
#lt-tn(num: 9, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một đội cứu hộ trên biển khoanh vùng khu vực tìm kiếm là một tam giác $A B C$ có hai cạnh $A B = 20" km", A C = 30" km"$ và góc xen giữa $hat(A) = 30^circ$. Diện tích vùng biển tìm kiếm bằng:],
    (
        [$300" km"^2$],
        True([$150" km"^2$]),
        [$150 sqrt(3)" km"^2$],
        [$200" km"^2$]
    ),
    loigiai: [
        Diện tích vùng biển tìm kiếm:
        $ S = 1/2 A B dot A C sin A = 1/2 dot 20 dot 30 dot sin 30^circ = 300 dot (1/2) = 150" km"^2 $
    ]
)

// TN 10: Khoảng cách giữa hai cano xuất phát cùng lúc
#lt-tn(num: 10, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Hai cano cùng rời bến $O$ vào cùng một thời điểm. Cano thứ nhất chạy về hướng Đông với vận tốc $30" km/h"$, cano thứ hai chạy về hướng Đông Bắc (lệch $60^circ$ so với hướng Đông) với vận tốc $50" km/h"$. Sau $1$ giờ, khoảng cách giữa hai cano bằng:],
    (
        [$40" km"$],
        [$60" km"$],
        True([$43.6" km"$]),
        [$55.2" km"$]
    ),
    loigiai: [
        Sau 1 giờ: $O A = 30" km", O B = 50" km"$, góc $hat(A O B) = 60^circ$.
        Áp dụng định lý côsin:
        $ A B^2 = 30^2 + 50^2 - 2(30)(50) cos 60^circ = 900 + 2500 - 1500 = 1900 => A B = sqrt(1900) approx 43.59" km" approx 43.6" km" $
    ]
)

// TN 11: Tầm nhìn chân trời từ đài chỉ huy tàu
#lt-tn(num: 11, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Từ đài chỉ huy của một tàu sân bay có độ cao $36" m"$ so với mặt nước biển, tầm nhìn tối đa ra đường chân trời (bỏ qua khúc xạ ánh sáng, bán kính Trái Đất $R approx 6400" km"$) xấp xỉ bằng:],
    (
        [$15.5" km"$],
        True([$21.5" km"$]),
        [$28.2" km"$],
        [$36.0" km"$]
    ),
    loigiai: [
        Khoảng cách tầm nhìn chân trời được tính theo công thức tiếp tuyến:
        $ d approx sqrt(2 R h) = sqrt(2 dot 6400000 dot 36) = sqrt(460800000) approx 21466" m" approx 21.5" km" $
    ]
)

// TN 12: Góc nghiêng cánh máy bay khi lượn vòng
#lt-tn(num: 12, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Khi một máy bay thực hiện động tác nghiêng cánh lượn vòng cung tròn với vận tốc không đổi, lực nâng tạo với phương thẳng đứng góc nghiêng $theta = 30^circ$. Tỷ số giữa thành phần lực hướng tâm nằm ngang và trọng lượng máy bay bằng:],
    (
        [$1$],
        [$sqrt(3)$],
        True([$sqrt(3)/3$]),
        [$1/2$]
    ),
    loigiai: [
        Tỷ số lực hướng tâm trên trọng lượng bằng:
        $ tan theta = tan 30^circ = sqrt(3)/3 approx 0.577 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Hải trình tàu cảnh sát biển tuần tra vòng tránh bão (Hình ngay ở đề bài kèm emoji 🚢, 🌪️)
#lt-ds(num: 13, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một tàu cảnh sát biển xuất phát từ căn cứ $A$, nhận nhiệm vụ di chuyển đến điểm đảo $C$. Do có vùng áp thấp nguy hiểm nằm trên đường thẳng nối $A$ và $C$, thuyền trưởng quyết định chuyển hướng hải trình theo hai chặng: chặng 1 từ $A$ đi theo hướng lệch Bắc $30^circ$ so với hướng Đông một quãng đường $A B = 60$ hải lý đến điểm đổi hướng $B$; tại $B$ tàu chuyển hướng đi lệch Nam $45^circ$ so với hướng Đông một đoạn $B C = 80$ hải lý để cập cảng đảo $C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.04
    
    // Trục hướng Đông
    line((-1, 0), (140 * sc, 0), stroke: 0.4pt + luma(160))
    
    let pA = (0, 0)
    let pB = (60 * 0.866 * sc, 60 * 0.5 * sc)
    let pC = (pB.at(0) + 80 * 0.707 * sc, pB.at(1) - 80 * 0.707 * sc)
    
    // Vùng bão tròn màu đỏ nhạt ở giữa kèm emoji 🌪️
    fill(rgb("fef2f2"))
    stroke((paint: rgb("ef4444"), dash: "dotted", thickness: 1pt))
    circle((55 * sc, 5 * sc), radius: 1.2)
    content((55 * sc, 5 * sc), [🌪️])
    content((55 * sc, 5 * sc - 0.4), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[Tâm bão])
    
    // Hải trình hai chặng AB và BC
    stroke(1.8pt + rgb("0d9488"))
    line(pA, pB)
    stroke(1.8pt + rgb("0284c7"))
    line(pB, pC)
    
    // Tuyến đường thẳng AC nét đứt
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pA, pC)
    
    // Đường gióng hướng Đông tại B
    stroke((paint: luma(120), dash: "dotted", thickness: 0.8pt))
    line(pB, (pB.at(0) + 30 * sc, pB.at(1)))
    
    // Các điểm và emoji
    content((pA.at(0) - 0.4, 0), [⚓ $A$])
    content((pB.at(0), pB.at(1) + 0.4), [🚢 $B$])
    content((pC.at(0) + 0.45, pC.at(1)), [🏝️ $C$])
    
    // Nhãn chiều dài
    content((pB.at(0)/2 - 0.5, pB.at(1)/2 + 0.3), text(fill: rgb("0d9488"), size: 8.5pt)[$60$ HL])
    content(((pB.at(0)+pC.at(0))/2 + 0.6, (pB.at(1)+pC.at(1))/2 + 0.3), text(fill: rgb("0284c7"), size: 8.5pt)[$80$ HL])
    content(((pA.at(0)+pC.at(0))/2, pC.at(1) - 0.4), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$A C = ?$])
    
    // Cung góc chuẩn xác qua draw_angle_arc
    draw_angle_arc(pA, 0deg, 30deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.0, 0.2), text(fill: rgb("d97706"), size: 7.5pt)[$30^circ$])
  })
]
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Góc giữa hướng đi của chặng 1 và hướng đi của chặng 2 là $30^circ + 45^circ = 75^circ$.]),
    True([Góc trong của tam giác $A B C$ tại đỉnh đổi hướng $B$ là $hat(A B C) = 105^circ$.]),
    True([Khoảng cách đường thẳng từ căn cứ $A$ đến đảo $C$ xấp xỉ bằng $111.7$ hải lý.]),
    [Nếu tàu chạy thẳng trực tiếp từ $A$ đến $C$ thì quãng đường tiết kiệm được so với lộ trình tránh bão ít hơn $20$ hải lý.]
  ),
  loigiai: [
    #step([Xác định góc B trong tam giác ABC])
    Góc lệch giữa hai hướng đi là $30^circ + 45^circ = 75^circ$. Do đó a) Đúng.
    Góc trong kề bù của tam giác $A B C$ tại đỉnh $B$:
    $ hat(A B C) = 180^circ - 75^circ = 105^circ $. Do đó b) Đúng.

    #step([Áp dụng định lý côsin tính AC])
    $ A C^2 = A B^2 + B C^2 - 2 A B dot B C cos 105^circ = 60^2 + 80^2 - 2(60)(80) cos 105^circ $
    $ A C^2 = 3600 + 6400 - 9600(- 0.25882) = 10000 + 2484.67 = 12484.67 $
    $ => A C approx sqrt(12484.67) approx 111.73 text(" hải lý") approx 111.7 text(" hải lý") $. Do đó c) Đúng.

    #step([Tính quãng đường tiết kiệm])
    Tổng lộ trình qua $B$: $s_1 = 60 + 80 = 140$ hải lý.
    Độ lệch quãng đường: $Delta s = 140 - 111.73 = 28.27 text(" hải lý") > 20 text(" hải lý")$.
    Khẳng định tiết kiệm ít hơn 20 hải lý là Sai. Do đó d) Sai.
  ]
)

// DS 2: Trạm Radar duyên hải quét hai mục tiêu (Hình ngay ở đề bài kèm emoji 📡, 🚢)
#lt-ds(num: 14, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Trạm radar ven biển $O$ phát hiện hai tàu chở hàng $A$ và $B$ trong vùng quét sóng của mình. Khoảng cách đo được từ trạm đến tàu $A$ là $O A = 30" km"$, đến tàu $B$ là $O B = 50" km"$. Góc ngắm radar giữa hai tàu là $hat(A O B) = 120^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.05
    
    // Đường bờ biển
    line((0, -20 * sc), (0, 60 * sc), stroke: 1.5pt + rgb("0d9488"))
    content((-0.6, 20 * sc), text(fill: rgb("0d9488"), weight: "bold")[Bờ biển])
    
    let pO = (0, 0)
    let pA = (30 * 0.5 * sc, 30 * 0.866 * sc)
    let pB = (50 * 0.866 * sc, -50 * 0.5 * sc)
    
    // Tia ngắm OA và OB
    stroke(1.2pt + rgb("0284c7"))
    line(pO, pA)
    line(pO, pB)
    
    // Đoạn thẳng nối hai tàu AB
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.5pt))
    line(pA, pB)
    
    // Điểm và emoji
    content((-0.45, 0), [📡 $O$])
    content((pA.at(0) + 0.45, pA.at(1)), [🚢 $A$])
    content((pB.at(0) + 0.45, pB.at(1)), [🚢 $B$])
    
    // Nhãn khoảng cách
    content((pA.at(0)/2 - 0.4, pA.at(1)/2 + 0.2), text(fill: rgb("0284c7"), size: 8.5pt)[$30" km"$])
    content((pB.at(0)/2 + 0.4, pB.at(1)/2 - 0.3), text(fill: rgb("0284c7"), size: 8.5pt)[$50" km"$])
    content(((pA.at(0)+pB.at(0))/2 + 0.5, (pA.at(1)+pB.at(1))/2), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[$A B = ?$])
    
    // Cung góc 120 độ chuẩn qua draw_angle_arc
    draw_angle_arc(pO, -30deg, 60deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((0.9, 0.2), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[$120^circ$])
  })
]
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Góc ngắm giữa hai mục tiêu từ trạm radar là góc tù $hat(A O B) = 120^circ$.]),
    True([Khoảng cách giữa hai tàu được tính theo định lý côsin: $A B^2 = O A^2 + O B^2 - 2 O A dot O B cos 120^circ$.]),
    True([Khoảng cách thực tế giữa hai tàu $A$ và $B$ bằng đúng $70" km"$.]),
    True([Diện tích mặt biển tam giác $O A B$ giới hạn bởi hai tia sóng radar bằng $375 sqrt(3)" km"^2$.])
  ),
  loigiai: [
    #step([Xác định góc nhìn])
    Theo giả thiết, góc nhìn $hat(A O B) = 120^circ$ là góc tù. Do đó a) Đúng.

    #step([Áp dụng định lý côsin])
    $ A B^2 = O A^2 + O B^2 - 2 O A dot O B cos 120^circ $. Do đó b) Đúng.

    #step([Tính khoảng cách AB])
    $ A B^2 = 30^2 + 50^2 - 2(30)(50) cos 120^circ = 900 + 2500 - 3000(- 1/2) = 3400 + 1500 = 4900 $
    $ => A B = sqrt(4900) = 70" km" $. Do đó c) Đúng.

    #step([Tính diện tích tam giác OAB])
    $ S = 1/2 O A dot O B sin 120^circ = 1/2 dot 30 dot 50 dot sqrt(3)/2 = 750 dot sqrt(3)/2 = 375 sqrt(3)" km"^2 $. Do đó d) Đúng.
  ]
)

// DS 3: Máy bay hạ cánh tiếp cận đường băng (Hình ngay ở đề bài kèm emoji 🛬)
#lt-ds(num: 15, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một chiếc máy bay phản lực thương mại bắt đầu giai đoạn tiếp cận hạ cánh (Glide path) thẳng đều về phía ngưỡng đường băng $T$. Khi máy bay ở vị trí $P$, thiết bị dẫn đường báo độ cao là $600" m"$ và góc hạ nhìn về đầu đường băng $T$ là $3^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.00035
    
    // Mặt đất và đường băng
    line((-500 * sc, 0), (13000 * sc, 0), stroke: 0.8pt + luma(100))
    line((0, 0), (3000 * sc, 0), stroke: 2.5pt + rgb("1e293b"))
    content((1500 * sc, -0.35), text(weight: "bold")[🛬 Đường băng])
    
    let pT = (0, 0)
    let pP = (11450 * sc, 600 * 3.5 * sc)
    
    // Đường bay hạ cánh PT
    stroke(1.5pt + rgb("0d9488"))
    line(pP, pT)
    
    // Đường gióng độ cao thẳng đứng
    stroke((paint: luma(120), dash: "dashed", thickness: 0.8pt))
    line(pP, (pP.at(0), 0))
    content((pP.at(0) + 0.5, pP.at(1)/2), text(size: 8.5pt)[$600" m"$])
    
    // Đường nằm ngang tầm bay
    line(pP, (pP.at(0) - 4000 * sc, pP.at(1)), stroke: (paint: luma(140), dash: "dotted", thickness: 0.6pt))
    
    content((pT.at(0) - 0.35, 0), text(weight: "bold")[$T$])
    content((pP.at(0) + 0.45, pP.at(1) + 0.2), [✈️ $P$])
    
    // Góc tiếp cận 3 độ chuẩn qua draw_angle_arc
    draw_angle_arc(pP, 180deg, 183deg, radius: 1.2, stroke: 0.8pt + rgb("d97706"))
    content((pP.at(0) - 1.5, pP.at(1) - 0.25), text(fill: rgb("d97706"), size: 8pt)[$3^circ$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng cách theo phương nằm ngang từ máy bay đến đầu đường băng là $d = 600 / (tan 3^circ) approx 11449" m"$.]),
    True([Khoảng cách đường bay thẳng từ vị trí máy bay $P$ đến điểm chạm bánh $T$ là $L = 600 / (sin 3^circ) approx 11465" m"$.]),
    True([Nếu máy bay duy trì vận tốc tiếp cận $250" km/h"$ ($approx 69.4" m/s"$) thì thời gian bay thẳng từ $P$ đến $T$ xấp xỉ bằng $165$ giây.]),
    [Nếu góc hạ cánh tăng lên thành $4^circ$ thì khoảng cách nằm ngang cần thiết để hạ từ độ cao $600" m"$ sẽ dài hơn so với góc $3^circ$.]
  ),
  loigiai: [
    #step([Tính khoảng cách theo phương nằm ngang])
    $ d = 600 / (tan 3^circ) approx 600 / 0.052408 approx 11448.6" m" approx 11449" m" $. Do đó a) Đúng.

    #step([Tính cự ly bay thẳng PT])
    $ L = 600 / (sin 3^circ) approx 600 / 0.052336 approx 11464.4" m" approx 11465" m" $. Do đó b) Đúng.

    #step([Tính thời gian bay tiếp cận])
    Vận tốc tiếp cận: $v = 250" km/h" = 250 / 3.6 approx 69.44" m/s"$.
    Thời gian bay:
    $ t = L / v approx 11464.4 / 69.44 approx 165.1" giây" approx 165" giây" $. Do đó c) Đúng.

    #step([Đánh giá góc hạ cánh dốc hơn])
    Khi góc hạ tiếp cận tăng lên ($4^circ > 3^circ$), độ dốc lớn hơn nên khoảng cách nằm ngang $d = 600 / (tan 4^circ) approx 8580" m"$ sẽ ngắn hơn chứ không thể dài hơn. Khẳng định d) Sai.
  ]
)

// DS 4: Tam giác trinh sát ba đỉnh
#lt-ds(num: 16, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Ba máy bay trinh sát không người lái (UAV) bay ở cùng một độ cao tạo thành đội hình tam giác $A B C$ có các cạnh $a = 15" km", b = 24" km", c = 21" km"$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Nửa chu vi của đội hình tam giác là $p = 30" km"$.]),
    True([Diện tích vùng trời được bao phủ bởi đội hình tam giác là $S = 54 sqrt(6)" km"^2$.]),
    True([Côsin của góc lớn nhất trong đội hình bằng $cos B = 1/5$.]),
    [Góc lớn nhất trong đội hình tam giác là một góc tù.]
  ),
  loigiai: [
    #step([Tính nửa chu vi p])
    $ p = (a + b + c) / 2 = (15 + 24 + 21) / 2 = 60 / 2 = 30" km" $. Do đó a) Đúng.

    #step([Tính diện tích theo Hê-rông])
    $ S = sqrt(30(30 - 15)(30 - 24)(30 - 21)) = sqrt(30 dot 15 dot 6 dot 9) = sqrt(450 dot 54) = sqrt(24300) = 54 sqrt(6)" km"^2 $. Do đó b) Đúng.

    #step([Tìm góc lớn nhất])
    Cạnh lớn nhất là $b = 24$, góc lớn nhất là góc $hat(B)$.
    Theo hệ quả định lý côsin:
    $ cos B = (a^2 + c^2 - b^2) / (2a c) = (15^2 + 21^2 - 24^2) / (2 dot 15 dot 21) = (225 + 441 - 576) / 630 = 90 / 630 = 1/5 $. Do đó c) Đúng.

    #step([Đánh giá tính chất góc])
    Vì $cos B = 1/5 > 0$, góc $hat(B)$ là góc nhọn ($hat(B) approx 78.46^circ$). Nhận định góc lớn nhất là góc tù là Sai. Do đó d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1: Khoảng cách hai tàu sau 2 giờ vuông góc
#lt-tln(num: 17, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Hai chiếc tàu rời cảng $O$ cùng lúc, tàu thứ nhất chạy về hướng Đông với vận tốc $15" km/h"$, tàu thứ hai chạy về hướng Nam với vận tốc $20" km/h"$. Tính khoảng cách giữa hai tàu sau $2$ giờ hành trình (đơn vị: km).],
    [50],
    loigiai: [
        #step([Tính quãng đường hai tàu sau 2 giờ])
        - Tàu thứ nhất: $O A = 15 dot 2 = 30" km"$.
        - Tàu thứ hai: $O B = 20 dot 2 = 40" km"$.
        
        #step([Tính khoảng cách AB])
        Vì hướng Đông và hướng Nam vuông góc nhau:
        $ A B = sqrt(O A^2 + O B^2) = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50" km" $
        Vậy khoảng cách giữa hai tàu là $50" km"$.
    ]
)

// TLN 2: Diện tích vùng tuần tra tam giác
#lt-tln(num: 18, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một đội tàu tuần duyên kiểm soát một ngư trường hình tam giác $A B C$ có hai cạnh $a = 15" km", b = 20" km"$ và góc $hat(C) = 30^circ$. Tính diện tích của vùng ngư trường đó (đơn vị: $"km"^2$).],
    [75],
    loigiai: [
        #step([Áp dụng công thức tính diện tích])
        $ S = 1/2 a b sin C = 1/2 dot 15 dot 20 dot sin 30^circ = 150 dot (1/2) = 75" km"^2 $
        Vậy diện tích vùng kiểm soát là $75" km"^2$.
    ]
)

// TLN 3: Khoảng cách giữa hai cano
#lt-tln(num: 19, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Hai cano tuần tra xuất phát từ trạm $O$, cano $A$ chạy được $10$ hải lý, cano $B$ chạy được $16$ hải lý. Góc tạo bởi hai hướng chạy của hai cano là $60^circ$. Tính khoảng cách giữa hai cano (đơn vị: hải lý).],
    [14],
    loigiai: [
        #step([Áp dụng định lý côsin])
        $ A B^2 = O A^2 + O B^2 - 2 O A dot O B cos 60^circ $
        $ A B^2 = 10^2 + 16^2 - 2 dot 10 dot 16 dot (1/2) = 100 + 256 - 160 = 196 $
        $ => A B = sqrt(196) = 14 text(" hải lý") $
        Vậy khoảng cách giữa hai cano là $14$ hải lý.
    ]
)

// TLN 4: Khoảng cách trạm B đến phao SOS (Hình ngay ở đề bài kèm emoji 🛟)
#lt-tln(num: 20, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Hai trạm hải đăng ven bờ $A$ và $B$ cách nhau $12" km"$ cùng nhận được tín hiệu cấp cứu $S O S$ phát ra từ một chiếc phao $C$. Trạm $A$ đo được góc $hat(C A B) = 60^circ$, trạm $B$ đo được góc $hat(C B A) = 45^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.35
    
    let pA = (0, 0)
    let pB = (12 * sc, 0)
    let pC = (12 * 0.366 * sc, 12 * 0.634 * sc)
    
    // Đường bờ biển AB
    stroke(1.2pt + rgb("0d9488"))
    line(pA, pB)
    
    // Tia ngắm từ 2 trạm tới phao C
    stroke(1.2pt + rgb("0284c7"))
    line(pA, pC)
    stroke(1.2pt + rgb("2563eb"))
    line(pB, pC)
    
    content((-0.4, 0), [🗼 $A$])
    content((12 * sc + 0.4, 0), [🗼 $B$])
    content((pC.at(0), pC.at(1) + 0.45), [🛟 $C$ (Phao SOS)])
    
    content((6 * sc, -0.3), text(size: 8pt)[$12" km"$])
    content(((pB.at(0)+pC.at(0))/2 + 0.6, pC.at(1)/2), text(fill: rgb("2563eb"), weight: "bold", size: 8.5pt)[$B C = ?$])
    
    draw_angle_arc(pA, 0deg, 60deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.0, 0.4), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
    
    draw_angle_arc(pB, 135deg, 180deg, radius: 0.8, stroke: 0.8pt + rgb("059669"))
    content((12 * sc - 1.1, 0.35), text(fill: rgb("059669"), size: 7.5pt)[$45^circ$])
  })
]
Tính khoảng cách từ trạm $B$ đến phao cứu sinh $C$ (làm tròn đến hàng đơn vị theo km).],
    [11],
    loigiai: [
        #step([Tính góc C trong tam giác ABC])
        $ hat(A C B) = 180^circ - (60^circ + 45^circ) = 75^circ $
        
        #step([Áp dụng định lý sin tính khoảng cách BC])
        $ (B C) / (sin 60^circ) = (A B) / (sin 75^circ) => B C = (12 dot sin 60^circ) / (sin 75^circ) = (12 dot (sqrt(3)/2)) / ((sqrt(6) + sqrt(2))/4) = (24 sqrt(3)) / (sqrt(6) + sqrt(2)) $
        $ B C = 6(3 sqrt(2) - sqrt(6)) approx 6(4.2426 - 2.4495) = 6(1.7931) approx 10.76" km" $
        Làm tròn đến hàng đơn vị ta được $11" km"$.
    ]
)

// TLN 5: Độ cao máy bay trinh sát từ 2 trạm radar (Hình ngay ở đề bài kèm emoji 📡, ✈️)
#lt-tln(num: 21, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Hai trạm radar $A$ và $B$ trên mặt bằng ven biển cách nhau $20" km"$ cùng phát hiện một máy bay không người lái $M$ đang bay trên biển (trong cùng mặt phẳng thẳng đứng đi qua $A B$, máy bay nằm giữa $A$ và $B$). Góc nâng nhìn lên máy bay tại trạm $A$ là $30^circ$, tại trạm $B$ là $60^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.2
    
    // Mặt đất
    line((-0.5, 0), (22 * sc, 0), stroke: 1pt + luma(100))
    
    let pA = (0, 0)
    let pB = (20 * sc, 0)
    let pH = (15 * sc, 0)
    let pM = (15 * sc, 8.66 * sc)
    
    stroke(1.2pt + rgb("0284c7"))
    line(pA, pM)
    stroke(1.2pt + rgb("2563eb"))
    line(pB, pM)
    
    // Đường cao h
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 1.2pt))
    line(pM, pH)
    content((15 * sc + 0.6, pM.at(1)/2), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$h = ?$])
    
    content((-0.4, 0), [📡 $A$])
    content((20 * sc + 0.4, 0), [📡 $B$])
    content((pM.at(0), pM.at(1) + 0.45), [✈️ $M$])
    
    content((10 * sc, -0.3), text(size: 8pt)[$20" km"$])
    
    draw_angle_arc(pA, 0deg, 30deg, radius: 0.8, stroke: 0.8pt + rgb("059669"))
    content((1.1, 0.25), text(fill: rgb("059669"), size: 7.5pt)[$30^circ$])
    
    draw_angle_arc(pB, 120deg, 180deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((20 * sc - 0.9, 0.35), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
  })
]
Tính độ cao bay $h$ của máy bay (làm tròn đến hàng đơn vị theo km).],
    [9],
    loigiai: [
        #step([Lập hệ thức liên hệ khoảng cách qua độ cao])
        Gọi $H$ là hình chiếu của máy bay $M$ lên đoạn thẳng $A B$. Độ cao máy bay là $h = M H > 0$.
        - Tam giác $M H A$ vuông tại $H$ có $hat(M A H) = 30^circ$: $A H = h / (tan 30^circ) = h sqrt(3)$.
        - Tam giác $M H B$ vuông tại $H$ có $hat(M B H) = 60^circ$: $B H = h / (tan 60^circ) = h / sqrt(3)$.
        
        #step([Giải phương trình tìm h])
        Vì $H$ nằm giữa $A$ và $B$, ta có $A H + B H = A B = 20" km"$:
        $ h sqrt(3) + h / sqrt(3) = 20 <=> h( (3 + 1)/sqrt(3) ) = 20 <=> (4 h) / sqrt(3) = 20 => h = 5 sqrt(3) approx 8.66" km" $
        Làm tròn đến hàng đơn vị ta được $9" km"$.
    ]
)

// TLN 6: Vận dụng cao - Tối ưu hóa góc đón chùm sóng radar (Hình ngay ở đề bài kèm emoji 📡, 🚢)
#lt-tln(num: 22, de: [Đề 2 (E) — Mã 108], back-to: "sec-exercise-hub",[Một trạm radar cảnh báo bờ biển phát chùm sóng thẳng đứng có cửa sổ phát sóng từ độ cao $9" m"$ (điểm $B$) đến độ cao $25" m"$ (điểm $A$) so với mặt biển. Một tàu tuần tra cao tốc di chuyển trên mặt nước.
#align(center)[
    #cetz.canvas({
        import cetz.draw: *
        set-style(stroke: 0.8pt)
        let sc = 0.15
        
        // Trục tháp radar thẳng đứng
        line((18 * sc, 0), (18 * sc, 30 * sc), stroke: 2.2pt + luma(100))
        content((18 * sc, 30 * sc + 0.45), [📡])
        content((18 * sc + 1.8, 28 * sc), text(weight: "bold")[Tháp radar])
        
        // Mặt biển nằm ngang
        line((-2 * sc, 0), (20 * sc, 0), stroke: 1pt + rgb("0284c7"))
        content((9 * sc, -1.0), text(fill: rgb("0284c7"), size: 8.5pt)[🌊 Mặt biển ($x = O M$)])
        
        let pM = (0, 0)
        let pO = (18 * sc, 0)
        let pB = (18 * sc, 9 * sc)
        let pA = (18 * sc, 25 * sc)
        
        // Cửa sổ phát sóng AB tô màu xanh lam nổi bật
        line(pB, pA, stroke: 4.5pt + rgb("0d9488"))
        content((18 * sc + 2.4, 17 * sc), text(fill: rgb("0d9488"), weight: "bold")[Cửa sóng ($16" m"$)])
        
        // Tia sóng radar tới tàu
        line(pM, pB, stroke: 1pt + rgb("0284c7"))
        line(pM, pA, stroke: 1.2pt + rgb("2563eb"))
        
        content((-0.8, 0), [🚢 $M$])
        circle(pO, radius: 2pt, fill: black)
        content((18 * sc + 0.35, -0.3), text(weight: "bold")[$O$])
        circle(pB, radius: 2.5pt, fill: rgb("0d9488"))
        content((18 * sc + 0.4, 9 * sc), text(weight: "bold")[$B (9" m")$])
        circle(pA, radius: 2.5pt, fill: rgb("0d9488"))
        content((18 * sc + 0.4, 25 * sc), text(weight: "bold")[$A (25" m")$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 26.5deg, 54.2deg, radius: 1.5, stroke: 1pt + rgb("d97706"))
        content((1.4, 1.2), text(fill: rgb("d97706"), weight: "bold")[$alpha$])
    })
]
Hỏi tàu tuần tra cần duy trì khoảng cách $x$ bằng bao nhiêu mét so với trục chân tháp radar để góc đón chùm sóng radar $hat(A M B)$ đạt giá trị lớn nhất?],
    [15],
    loigiai: [
        #step([Mô hình hóa hình học và biểu diễn góc đón sóng])
        Gọi $O$ là điểm chân trục đài radar tại mực nước biển, $M$ là vị trí tàu trên mặt biển cách trục đài một khoảng cách $x = O M > 0$.
        Tam giác $M O A$ vuông tại $O$ có $tan hat(A M O) = (O A) / x = 25 / x$.
        Tam giác $M O B$ vuông tại $O$ có $tan hat(B M O) = (O B) / x = 9 / x$.
        
        Góc đón chùm sóng radar là $alpha = hat(A M B) = hat(A M O) - hat(B M O)$.

        #step([Biến đổi lượng giác])
        $ tan alpha = tan(hat(A M O) - hat(B M O)) = (tan hat(A M O) - tan hat(B M O)) / (1 + tan hat(A M O) dot tan hat(B M O)) $
        $ tan alpha = (25/x - 9/x) / (1 + (25/x)(9/x)) = (16/x) / (1 + 225 / x^2) = 16 / (x + 225 / x) $
        
        #step([Áp dụng bất đẳng thức Cauchy tìm giá trị lớn nhất])
        Vì $x > 0$, áp dụng bất đẳng thức Cauchy cho hai số dương $x$ và $225 / x$:
        $ x + 225 / x >= 2 sqrt(x dot 225 / x) = 2 sqrt(225) = 2 dot 15 = 30 $
        Suy ra:
        $ tan alpha <= 16 / 30 = 8 / 15 $
        Góc $alpha$ đạt giá trị lớn nhất khi và chỉ khi:
        $ x = 225 / x <=> x^2 = 225 <=> x = sqrt(225) = 15" m" quad (text("do ") x > 0) $
        Vậy tàu tuần tra cần duy trì khoảng cách $15" m"$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 6: TOÁN THỰC TẾ & ĐO ĐẠC HÌNH HỌC (ĐỀ E: HÀNG HẢI, HÀNG KHÔNG & RADAR)!]      #v(0.6em)
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
