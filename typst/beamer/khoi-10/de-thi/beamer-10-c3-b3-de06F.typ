// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 6: TOÁN THỰC TẾ & ĐO ĐẠC HÌNH HỌC (ĐỀ F: NĂNG LƯỢNG TÁI TẠO, QUANG HỌC & TỐI ƯU HÓA)
// Lớp: Khối 10  ·  Mã đề: 109  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 6: TOÁN THỰC TẾ & ĐO ĐẠC HÌNH HỌC (ĐỀ F: NĂNG LƯỢNG TÁI TẠO, QUANG HỌC & TỐI ƯU HÓA)",
  subtitle: "ÔN TẬP CHƯƠNG 3 — MÃ ĐỀ: 109",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 109]],
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

// TN 1: Chiều dài bóng nắng tòa nhà (Hình ngay ở đề bài kèm emoji ☀️, 🏢)
#lt-tn(num: 1, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Vào một thời điểm trong ngày, các tia nắng mặt trời chiếu xuống mặt đất tạo với phương nằm ngang một góc $60^circ$. Một tòa nhà cao tầng có chiều cao thẳng đứng $H = 45" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.07
    
    // Mặt đất
    line((-0.5, 0), (35 * sc, 0), stroke: 1pt + luma(100))
    
    let pBuilding = (0, 0)
    let pTop = (0, 45 * sc)
    let pShadow = (45 * 0.577 * sc, 0)
    
    // Tòa nhà
    rect((-6 * sc, 0), (0, 45 * sc), fill: rgb("f8fafc"), stroke: 1.2pt + rgb("1e293b"))
    content((-3 * sc, 22.5 * sc), text(size: 8pt, weight: "bold")[🏢])
    
    // Mặt trời emoji
    content((pShadow.at(0) + 1.2, pTop.at(1) + 0.6), [☀️])
    
    // Tia nắng chiếu xiên từ đỉnh xuống mặt đất
    stroke(1.5pt + rgb("d97706"))
    line(pTop, pShadow)
    
    // Đoạn bóng râm trên mặt đất
    stroke(2.5pt + rgb("475569"))
    line(pBuilding, pShadow)
    content((pShadow.at(0)/2, -0.35), text(fill: rgb("475569"), weight: "bold", size: 8pt)[Bóng $L = ?$])
    content((-0.7, 22.5 * sc), text(size: 8pt)[$45" m"$])
    
    // Cung góc 60 độ của tia nắng tại đầu bóng râm
    draw_angle_arc(pShadow, 120deg, 180deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((pShadow.at(0) - 1.1, 0.35), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
  })
]
Chiều dài bóng râm của tòa nhà in trên mặt đất xấp xỉ bằng:],
    (
        [$22.5" m"$],
        True([$26.0" m"$]),
        [$31.8" m"$],
        [$39.0" m"$]
    ),
    loigiai: [
        Tam giác vuông tạo bởi chiều cao tòa nhà và bóng râm:
        $ L = 45 / (tan 60^circ) = 45 / sqrt(3) = 15 sqrt(3) approx 25.98" m" approx 26.0" m" $
    ]
)

// TN 2: Góc nghiêng tấm pin năng lượng mặt trời (Hình ngay ở đề bài kèm emoji ☀️, 🔆)
#lt-tn(num: 2, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Để tấm pin năng lượng mặt trời đón ánh sáng mặt trời đạt hiệu suất cao nhất, mặt phẳng tấm pin cần vuông góc với tia sáng tới. Tại một địa phương vào giữa trưa, tia nắng hợp với phương thẳng đứng một góc $35^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.8
    
    // Mặt sàn ngang
    line((-0.5, 0), (3.5 * sc, 0), stroke: 1pt + luma(100))
    
    let pGround = (0, 0)
    let pPanel = (2.5 * calc.cos(35deg) * sc, 2.5 * calc.sin(35deg) * sc)
    
    // Tấm pin nghiêng
    stroke(3pt + rgb("0284c7"))
    line(pGround, pPanel)
    content((pPanel.at(0)/2 + 0.3, pPanel.at(1)/2 + 0.3), text(fill: rgb("0284c7"), weight: "bold", size: 8pt)[🔆 Tấm pin])
    
    // Tia sáng mặt trời vuông góc tấm pin
    let pSun = (pPanel.at(0) + 1.2 * calc.cos(125deg), pPanel.at(1) + 1.2 * calc.sin(125deg))
    stroke(1.5pt + rgb("d97706"))
    line(pSun, (pPanel.at(0)/2, pPanel.at(1)/2))
    content((pSun.at(0) - 0.2, pSun.at(1) + 0.2), [☀️])
    
    // Cung góc nghiêng alpha
    draw_angle_arc(pGround, 0deg, 35deg, radius: 0.9, stroke: 0.8pt + rgb("d97706"))
    content((1.2, 0.3), text(fill: rgb("d97706"), size: 8pt)[$alpha = 35^circ$])
  })
]
Góc nghiêng $alpha$ của tấm pin so với mặt sàn nằm ngang phải bằng:],
    (
        [$55^circ$],
        [$45^circ$],
        True([$35^circ$]),
        [$25^circ$]
    ),
    loigiai: [
        Vì mặt phẳng tấm pin vuông góc với tia nắng tới, góc nghiêng của tấm pin so với mặt phẳng nằm ngang bằng đúng góc của tia nắng so với phương thẳng đứng:
        $ alpha = 35^circ $
    ]
)

// TN 3: Vùng rọi sáng của cột đèn cao áp (Hình ngay ở đề bài kèm emoji 💡)
#lt-tn(num: 3, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một cột đèn cao áp chiếu sáng quảng trường có chiều cao $12" m"$. Đèn phát ra chùm sáng hình nón có góc mở $2 theta = 60^circ$ hướng đối xứng thẳng đứng xuống mặt đất.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.25
    
    // Mặt đất
    line((-10 * sc, 0), (10 * sc, 0), stroke: 1pt + luma(100))
    
    let pLight = (0, 12 * sc)
    let pGroundLeft = (-12 * 0.577 * sc, 0)
    let pGroundRight = (12 * 0.577 * sc, 0)
    
    // Vùng chiếu sáng hình nón
    fill(rgb("fef9c3"))
    stroke(none)
    line(pLight, pGroundLeft)
    line(pGroundLeft, pGroundRight)
    line(pGroundRight, pLight)
    
    // Cột đèn
    stroke(2pt + luma(80))
    line((0, 0), pLight)
    content((0, pLight.at(1) + 0.35), [💡])
    content((-0.6, 6 * sc), text(size: 8pt)[$12" m"$])
    
    // Tia biên ánh sáng
    stroke(1.2pt + rgb("d97706"))
    line(pLight, pGroundLeft)
    line(pLight, pGroundRight)
    
    content((0, -0.35), text(fill: rgb("b45309"), weight: "bold", size: 8pt)[Vùng rọi sáng $2 R$])
    
    draw_angle_arc(pLight, -120deg, -60deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((0, pLight.at(1) - 1.1), text(fill: rgb("d97706"), size: 7.5pt)[$60^circ$])
  })
]
Bán kính hình tròn được rọi sáng trực tiếp trên mặt đất xấp xỉ bằng:],
    (
        [$6.0" m"$],
        True([$6.9" m"$]),
        [$8.5" m"$],
        [$10.4" m"$]
    ),
    loigiai: [
        Góc nghiêng của tia biên so với phương thẳng đứng: $theta = 60^circ / 2 = 30^circ$.
        Bán kính vùng sáng trên mặt đất:
        $ R = 12 dot tan 30^circ = 12 dot (sqrt(3)/3) = 4 sqrt(3) approx 6.93" m" approx 6.9" m" $
    ]
)

// TN 4: Góc quét quan sát của camera an ninh (Hình ngay ở đề bài kèm emoji 📹)
#lt-tn(num: 4, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một camera an ninh góc rộng được gắn trên trần nhà cao $3" m"$ ngay trên mép cửa ra vào. Camera bao quát một dải sàn nhà phía trước từ vị trí $A$ (cách chân tường $2" m"$) đến vị trí $B$ (cách chân tường $8" m"$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.5
    
    // Tường và sàn
    line((0, 0), (0, 3 * sc), stroke: 2pt + luma(80))
    line((0, 0), (9 * sc, 0), stroke: 1pt + luma(100))
    
    let pCam = (0, 3 * sc)
    let pA = (2 * sc, 0)
    let pB = (8 * sc, 0)
    
    stroke(1.2pt + rgb("0284c7"))
    line(pCam, pA)
    stroke(1.2pt + rgb("2563eb"))
    line(pCam, pB)
    
    content((0, 3 * sc + 0.35), [📹 Camera])
    content((2 * sc, -0.3), text(weight: "bold")[$A (2" m")$])
    content((8 * sc, -0.3), text(weight: "bold")[$B (8" m")$])
    
    draw_angle_arc(pCam, -69.4deg, -20.5deg, radius: 0.9, stroke: 0.8pt + rgb("d97706"))
    content((0.7, 3 * sc - 0.7), text(fill: rgb("d97706"), size: 8pt)[$beta$])
  })
]
Góc quét $beta = hat(A C B)$ của camera bao quát khoảng sàn $A B$ xấp xỉ bằng:],
    (
        [$28.5^circ$],
        True([$35.8^circ$]),
        [$38.7^circ$],
        [$42.0^circ$]
    ),
    loigiai: [
        Gọi $O$ là gốc chân tường dưới camera.
        $tan hat(B O C) = 8 / 3 => hat(B O C) approx 69.44^circ$.
        $tan hat(A O C) = 2 / 3 => hat(A O C) approx 33.69^circ$.
        Góc mở bao quát của camera:
        $ beta = 69.44^circ - 33.69^circ approx 35.75^circ approx 35.8^circ $
        Hoặc tính theo tang hiệu:
        $ tan beta = (8/3 - 2/3) / (1 + (8/3)(2/3)) = 2 / (1 + 16/9) = 18 / 25 = 0.72 => beta approx 35.75^circ approx 35.8^circ $
    ]
)

// TN 5: Chiều rộng rèm chắn nắng
#lt-tn(num: 5, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một cửa sổ kính cao $2" m"$. Để ngăn ánh nắng trưa chiếu trực tiếp vào phòng khi góc nâng của mặt trời là $60^circ$, người ta làm một mái đua che nắng nhô ra nằm ngang từ mép trên của cửa sổ. Chiều dài nhô ra tối thiểu của mái che xấp xỉ bằng:],
    (
        [$0.85" m"$],
        True([$1.15" m"$]),
        [$1.45" m"$],
        [$1.73" m"$]
    ),
    loigiai: [
        Độ vươn ra của mái che cần thiết:
        $ d = 2 / (tan 60^circ) = 2 / sqrt(3) approx 1.1547" m" approx 1.15" m" $
    ]
)

// TN 6: Diện tích mặt pin tam giác cân
#lt-tn(num: 6, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một tấm pin năng lượng mặt trời chuyên dụng có dạng tam giác cân $A B C$ với hai cạnh bên $A B = A C = 2" m"$ và góc ở đỉnh $hat(A) = 120^circ$. Diện tích mặt thu nhiệt của tấm pin bằng:],
    (
        [$2" m"^2$],
        [$2 sqrt(3)" m"^2$],
        True([$sqrt(3)" m"^2$]),
        [$1" m"^2$]
    ),
    loigiai: [
        Diện tích tam giác:
        $ S = 1/2 A B dot A C sin A = 1/2 dot 2 dot 2 dot sin 120^circ = 2 dot (sqrt(3)/2) = sqrt(3)" m"^2 $
    ]
)

// TN 7: Khoảng cách giữa hai trụ tuabin gió
#lt-tn(num: 7, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Từ đài kiểm soát $C$ của một nông trại điện gió, người ta đo được khoảng cách đến hai trụ tuabin $A$ và $B$ lần lượt là $C A = 300" m", C B = 500" m"$ và góc $hat(A C B) = 60^circ$. Khoảng cách giữa hai trụ tuabin gió $A$ và $B$ xấp xỉ bằng:],
    (
        [$400.0" m"$],
        True([$435.9" m"$]),
        [$465.2" m"$],
        [$512.4" m"$]
    ),
    loigiai: [
        Áp dụng định lý côsin trong tam giác $A B C$:
        $ A B^2 = 300^2 + 500^2 - 2(300)(500) cos 60^circ = 90000 + 250000 - 150000 = 190000 $
        $ => A B = sqrt(190000) = 100 sqrt(19) approx 435.89" m" approx 435.9" m" $
    ]
)

// TN 8: Bán kính cung gương parabol gom nhiệt
#lt-tn(num: 8, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một gương cầu gom nhiệt mặt trời có mặt cắt là một cung tròn ngoại tiếp tam giác $A B C$ tạo bởi ba chốt gắn khung. Biết khoảng cách $A B = 3" m"$ và góc đối diện $hat(A C B) = 30^circ$. Bán kính mặt cong $R$ của gương bằng:],
    (
        [$1.5" m"$],
        True([$3.0" m"$]),
        [$6.0" m"$],
        [$3 sqrt(3)" m"$]
    ),
    loigiai: [
        Theo định lý sin:
        $ R = (A B) / (2 sin hat(A C B)) = 3 / (2 sin 30^circ) = 3 / (2 dot 1/2) = 3" m" $
    ]
)

// TN 9: Chiều cao cột đo gió trạm khí tượng
#lt-tn(num: 9, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một cột đo gió của trạm điện gió cao $40" m"$. Người ta kéo một sợi dây thép neo giữ từ đỉnh cột xuống một mốc cố định trên mặt đất cách chân cột $30" m"$. Chiều dài sợi dây thép neo bằng:],
    (
        [$45" m"$],
        True([$50" m"$]),
        [$60" m"$],
        [$35 sqrt(2)" m"$]
    ),
    loigiai: [
        Tam giác vuông tạo bởi cột, mặt đất và dây neo:
        $ L = sqrt(40^2 + 30^2) = sqrt(1600 + 900) = sqrt(2500) = 50" m" $
    ]
)

// TN 10: Tỷ số năng lượng hấp thụ theo góc tới
#lt-tn(num: 10, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Cường độ bức xạ mặt trời chiếu vuông góc vào mặt đất là $I_0 = 1000" W/m"^2$. Khi tia nắng tạo với mặt đất một góc nghiêng $30^circ$, cường độ bức xạ mặt trời hấp thụ trên mỗi mét vuông mặt đất bằng:],
    (
        [$1000" W/m"^2$],
        [$866" W/m"^2$],
        True([$500" W/m"^2$]),
        [$707" W/m"^2$]
    ),
    loigiai: [
        Cường độ hấp thụ trên mặt phẳng ngang:
        $ I = I_0 dot sin 30^circ = 1000 dot (1/2) = 500" W/m"^2 $
    ]
)

// TN 11: Cáp neo tuabin gió góc 60 độ
#lt-tn(num: 11, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một trụ tuabin gió được giữ thăng bằng nhờ các sợi cáp thép tạo với mặt đất một góc $60^circ$. Vị trí cọc neo dưới đất cách chân trụ $25" m"$. Chiều dài mỗi sợi dây cáp néo bằng:],
    (
        [$25 sqrt(3)" m"$],
        [$35" m"$],
        True([$50" m"$]),
        [$40" m"$]
    ),
    loigiai: [
        Độ dài dây cáp:
        $ L = 25 / (cos 60^circ) = 25 / (1/2) = 50" m" $
    ]
)

// TN 12: Diện tích quạt gió 3 cánh
#lt-tn(num: 12, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một tuabin gió ba cánh đang quay, tại một thời điểm hai cánh quạt liên tiếp tạo với tâm trục quay một góc $120^circ$. Biết chiều dài mỗi cánh quạt là $30" m"$. Diện tích hình tam giác tạo bởi tâm quay và hai đầu mút cánh quạt bằng:],
    (
        [$450" m"^2$],
        True([$225 sqrt(3)" m"^2$]),
        [$450 sqrt(3)" m"^2$],
        [$300" m"^2$]
    ),
    loigiai: [
        Diện tích tam giác:
        $ S = 1/2 dot 30 dot 30 dot sin 120^circ = 450 dot (sqrt(3)/2) = 225 sqrt(3)" m"^2 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Mảng pin mặt trời Solar Rooftop trên mái dốc (Hình ngay ở đề bài kèm emoji ☀️, 🏠)
#lt-ds(num: 13, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một hệ thống pin quang điện mặt trời được lắp đặt trên một mái nhà dốc nghiêng $25^circ$ so với phương nằm ngang. Tại thời điểm nắng đỉnh điểm trong ngày, các tia nắng mặt trời chiếu xiên tạo với phương nằm ngang một góc $55^circ$. Mảng pin mặt trời có chiều dài theo mặt dốc là $L = 6" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.6
    
    // Mặt ngang
    line((-0.5, 0), (6.5 * sc, 0), stroke: 0.8pt + luma(120))
    
    let pO = (0, 0)
    let pRoof = (6 * calc.cos(25deg) * sc, 6 * calc.sin(25deg) * sc)
    
    // Mái dốc nhà
    stroke(3pt + rgb("0284c7"))
    line(pO, pRoof)
    content((pRoof.at(0)/2, pRoof.at(1)/2 + 0.35), text(fill: rgb("0284c7"), weight: "bold", size: 8pt)[🔆 Mảng pin $6" m"$])
    
    // Tia nắng chiếu xiên 55 độ
    let pSun = (pRoof.at(0) + 1.5, pRoof.at(1) + 2.0)
    stroke(1.5pt + rgb("d97706"))
    line(pSun, pRoof)
    content((pSun.at(0) + 0.2, pSun.at(1) + 0.2), [☀️])
    
    // Cung góc mái dốc 25 độ
    draw_angle_arc(pO, 0deg, 25deg, radius: 1.0, stroke: 0.8pt + rgb("059669"))
    content((1.3, 0.25), text(fill: rgb("059669"), size: 7.5pt)[$25^circ$])
    
    // Cung góc tia nắng 55 độ
    line(pRoof, (pRoof.at(0) + 1.2, pRoof.at(1)), stroke: (paint: luma(140), dash: "dotted", thickness: 0.6pt))
    draw_angle_arc(pRoof, 0deg, 55deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((pRoof.at(0) + 1.1, pRoof.at(1) + 0.35), text(fill: rgb("d97706"), size: 7.5pt)[$55^circ$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Góc tạo bởi tia nắng mặt trời và mặt dốc của tấm pin là $55^circ - 25^circ = 30^circ$.]),
    True([Chiều rộng hữu dụng của chùm sáng chiếu lên mảng pin là $h = 6 dot sin 30^circ = 3" m"$.]),
    True([Nếu bề ngang của mảng pin là $4" m"$ thì diện tích hấp thụ ánh sáng hiệu dụng của mảng pin là $12" m"^2$.]),
    [Nếu góc chiếu của tia nắng mặt trời tăng lên thành $70^circ$ thì góc giữa tia nắng và tấm pin sẽ nhỏ hơn $30^circ$.]
  ),
  loigiai: [
    #step([Xác định góc tới giữa tia nắng và tấm pin])
    Vì tia nắng hợp với phương ngang $55^circ$ và mái dốc nghiêng $25^circ$ so với phương ngang:
    $ gamma = 55^circ - 25^circ = 30^circ $. Do đó a) Đúng.

    #step([Tính chiều rộng hiệu dụng])
    Chiều rộng hiệu dụng của chùm ánh sáng mặt trời chiếu tới:
    $ h = L dot sin gamma = 6 dot sin 30^circ = 6 dot (1/2) = 3" m" $. Do đó b) Đúng.

    #step([Tính diện tích hiệu dụng])
    Diện tích hữu dụng: $S = 3 dot 4 = 12" m"^2$. Do đó c) Đúng.

    #step([Đánh giá khi góc chiếu tăng])
    Khi góc chiếu của tia nắng tăng lên $70^circ$, góc hợp giữa tia nắng và tấm pin là $70^circ - 25^circ = 45^circ > 30^circ$. Nhận định nhỏ hơn $30^circ$ là Sai. Do đó d) Sai.
  ]
)

// DS 2: Thiết kế hệ thống đèn cao áp đường cao tốc (Hình ngay ở đề bài kèm emoji 💡, 🛣️)
#lt-ds(num: 14, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Trên dải phân cách của một đoạn đường cao tốc, người ta dựng hai cột đèn cao áp $A$ và $B$ cách nhau $A B = 40" m"$, mỗi cột có chiều cao $H = 15" m"$. Đèn phát chùm sáng hình nón rộng rọi đều về hai phía.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.12
    
    // Mặt đường
    line((-5 * sc, 0), (45 * sc, 0), stroke: 1.5pt + luma(100))
    content((20 * sc, -0.7), text(weight: "bold")[🛣️ Mặt đường cao tốc])
    
    let pA = (0, 15 * sc)
    let pB = (40 * sc, 15 * sc)
    let pMid = (20 * sc, 0)
    
    // Hai cột đèn
    stroke(2.2pt + luma(80))
    line((0, 0), pA)
    line((40 * sc, 0), pB)
    content((0, pA.at(1) + 0.35), [💡 $A$])
    content((40 * sc, pB.at(1) + 0.35), [💡 $B$])
    
    // Tia sáng tới điểm giữa M
    stroke(1.2pt + rgb("d97706"))
    line(pA, pMid)
    line(pB, pMid)
    
    circle(pMid, radius: 2pt, fill: rgb("dc2626"))
    content((20 * sc, 0.35), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$M$ (Điểm giữa)])
    
    content((0, 7.5 * sc - 0.2), text(size: 7.5pt)[$15" m"$])
    content((40 * sc + 0.5, 7.5 * sc - 0.2), text(size: 7.5pt)[$15" m"$])
    content((20 * sc, -0.35), text(size: 8pt)[$A B = 40" m"$])
  })
]
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Điểm $M$ trên mặt đường nằm chính giữa hai chân cột đèn cách mỗi chân cột một khoảng $20" m"$.]),
    True([Khoảng cách từ mỗi bóng đèn trên đỉnh cột đến điểm $M$ là $d = sqrt(15^2 + 20^2) = 25" m"$.]),
    True([Góc chiếu sáng từ đỉnh cột $A$ rọi xuống điểm $M$ so với phương thẳng đứng có $cos theta = 15/25 = 0.6$.]),
    [Khoảng cách từ đèn $A$ đến điểm $M$ lớn hơn $30" m"$.]
  ),
  loigiai: [
    #step([Xác định vị trí điểm M])
    $M$ là trung điểm nên khoảng cách đến mỗi chân cột là $40 / 2 = 20" m"$. Do đó a) Đúng.

    #step([Tính khoảng cách từ đỉnh cột đến M])
    Áp dụng định lý Pytago:
    $ d = sqrt(15^2 + 20^2) = sqrt(225 + 400) = sqrt(625) = 25" m" $. Do đó b) Đúng.

    #step([Tính góc chiếu rọi])
    Gọi góc chiếu so với phương thẳng đứng là $theta$:
    $ cos theta = 15 / 25 = 3 / 5 = 0.6 $. Do đó c) Đúng.

    #step([Đánh giá khoảng cách])
    Khoảng cách $d = 25" m" < 30" m"$. Khẳng định lớn hơn 30 m là Sai. Do đó d) Sai.
  ]
)

// DS 3: Khảo sát quy hoạch nút giao thông hình tam giác (Hình ngay ở đề bài kèm emoji 🚗, 📐)
#lt-ds(num: 15, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một nút giao thông mở rộng có hình dạng tam giác $A B C$ với độ dài ba cạnh biên lần lượt là $a = B C = 70" m", b = C A = 80" m", c = A B = 50" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.05
    
    let pA = (0, 0)
    let pB = (50 * sc, 0)
    let pC = (50 * 0.5 * sc, 80 * 0.866 * 0.8 * sc)
    
    stroke(1.8pt + rgb("0d9488"))
    line(pA, pB)
    line(pB, pC)
    line(pC, pA)
    
    circle(pA, radius: 2pt, fill: black)
    content((0, -0.35), text(weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((50 * sc, -0.35), text(weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((pC.at(0), pC.at(1) + 0.35), text(weight: "bold")[$C$])
    
    content((25 * sc, 15 * sc), [🚗])
    content((25 * sc, -0.35), text(size: 8pt)[$50" m"$])
    content((pC.at(0)/2 - 0.4, pC.at(1)/2 + 0.2), text(size: 8pt)[$80" m"$])
    content(((pB.at(0)+pC.at(0))/2 + 0.4, pC.at(1)/2), text(size: 8pt)[$70" m"$])
  })
]
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Nửa chu vi của nút giao thông tam giác là $p = 100" m"$.]),
    True([Diện tích mặt đất của nút giao thông là $S = sqrt(100 dot 30 dot 20 dot 50) = 1000 sqrt(3)" m"^2$.]),
    True([Góc mở lớn nhất của nút giao thông là góc $hat(B)$ có $cos B = 1/7$.]),
    [Bán kính vòng xoay tròn lớn nhất có thể nội tiếp trong nút giao thông lớn hơn $20" m"$.]
  ),
  loigiai: [
    #step([Tính nửa chu vi p])
    $ p = (50 + 70 + 80) / 2 = 200 / 2 = 100" m" $. Do đó a) Đúng.

    #step([Tính diện tích theo công thức Hê-rông])
    $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(100(100 - 70)(100 - 80)(100 - 50)) = sqrt(100 dot 30 dot 20 dot 50) = sqrt(3000000) = 1000 sqrt(3)" m"^2 $. Do đó b) Đúng.

    #step([Tính góc B lớn thứ nhì hay góc A lớn nhất])
    Cạnh đối diện lớn nhất là $b = 80" m"$, góc lớn nhất là $hat(B)$ (đối diện cạnh $b$ là góc $hat(B)$):
    $ cos B = (a^2 + c^2 - b^2) / (2 a c) = (70^2 + 50^2 - 80^2) / (2 dot 70 dot 50) = (4900 + 2500 - 6400) / 7000 = 1000 / 7000 = 1/7 $. Do đó c) Đúng.

    #step([Tính bán kính đường tròn nội tiếp r])
    $ r = S / p = (1000 sqrt(3)) / 100 = 10 sqrt(3) approx 17.32" m" < 20" m" $.
    Khẳng định bán kính lớn hơn $20" m"$ là Sai. Do đó d) Sai.
  ]
)

// DS 4: Giàn mái không gian tam giác đỡ bồn nhiệt mặt trời (Hình ngay ở đề bài kèm emoji 🏗️, ☀️)
#lt-ds(num: 16, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một giàn thép không gian dạng tam giác cân $A B C$ có đáy $B C = 8" m"$ và hai thanh chống nghiêng $A B = A C = 5" m"$. Tại đỉnh $A$ đặt bồn nước nóng năng lượng mặt trời. Để gia cố chịu lực, kỹ sư lắp thêm một thanh giằng ngang $M N$ nối trung điểm $M$ của $A B$ và trung điểm $N$ của $A C$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.6
    
    let pB = (0, 0)
    let pC = (8 * sc, 0)
    let pH = (4 * sc, 0)
    let pA = (4 * sc, 3 * sc)
    let pM = (2 * sc, 1.5 * sc)
    let pN = (6 * sc, 1.5 * sc)
    
    stroke(2pt + rgb("1e293b"))
    line(pB, pA)
    line(pA, pC)
    line(pB, pC)
    
    // Thanh giằng MN
    stroke(1.8pt + rgb("dc2626"))
    line(pM, pN)
    content((4 * sc, 1.5 * sc + 0.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[Thanh giằng $M N$])
    
    // Bồn nước mặt trời emoji
    content((4 * sc, 3 * sc + 0.45), [☀️ 🛢️])
    
    circle(pB, radius: 2pt, fill: black)
    content((0, -0.3), text(weight: "bold")[$B$])
    circle(pC, radius: 2pt, fill: black)
    content((8 * sc, -0.3), text(weight: "bold")[$C$])
    circle(pA, radius: 2.5pt, fill: black)
    content((4 * sc + 0.35, 3 * sc), text(weight: "bold")[$A$])
    
    content((2 * sc - 0.4, 1.5 * sc + 0.2), text(size: 8pt)[$5" m"$])
    content((4 * sc, -0.3), text(size: 8pt)[$8" m"$])
  })
]
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Chiều cao từ đỉnh $A$ xuống thanh đáy $B C$ là $h = sqrt(5^2 - 4^2) = 3" m"$.]),
    True([Chiều dài thanh giằng gia cố là $M N = (B C) / 2 = 4" m"$.]),
    True([Diện tích khung tam giác $A B C$ là $S = 1/2 dot 8 dot 3 = 12" m"^2$.]),
    [Độ dốc của thanh giằng nghiêng $A B$ so với mặt đáy $B C$ lớn hơn $45^circ$.]
  ),
  loigiai: [
    #step([Tính chiều cao giàn tam giác])
    Gọi $H$ là trung điểm đáy $B C$, $B H = 4" m"$:
    $ A H = sqrt(A B^2 - B H^2) = sqrt(5^2 - 4^2) = 3" m" $. Do đó a) Đúng.

    #step([Tính độ dài thanh giằng MN])
    $M N$ là đường trung bình của tam giác $A B C$ nên $M N = (B C) / 2 = 4" m"$. Do đó b) Đúng.

    #step([Tính diện tích khung tam giác])
    $ S = 1/2 B C dot A H = 1/2 dot 8 dot 3 = 12" m"^2 $. Do đó c) Đúng.

    #step([Tính góc dốc thanh giằng nghiêng])
    $tan hat(B) = (A H) / (B H) = 3 / 4 = 0.75 < 1 = tan 45^circ => hat(B) approx 36.87^circ < 45^circ$.
    Nhận định góc dốc lớn hơn $45^circ$ là Sai. Do đó d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1: Chiều cao cột thu lôi qua bóng nắng (Hình ngay ở đề bài kèm emoji ☀️)
#lt-tln(num: 17, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một cột thu lôi chống sét được dựng thẳng đứng trên mặt đất. Khi mặt trời tạo với mặt đất một góc nâng $30^circ$, cột thu lôi đổ bóng râm dài $52" m"$ trên mặt đất nằm ngang.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.08
    
    line((-1, 0), (60 * sc, 0), stroke: 1pt + luma(100))
    
    let pPole = (0, 0)
    let pTop = (0, 30 * sc)
    let pShadow = (52 * sc, 0)
    
    stroke(2.5pt + rgb("1e293b"))
    line(pPole, pTop)
    content((0, pTop.at(1) + 0.35), text(weight: "bold")[Cột thu lôi])
    
    stroke(1.5pt + rgb("d97706"))
    line(pTop, pShadow)
    content((pShadow.at(0) + 0.5, pTop.at(1)), [☀️])
    
    stroke(2.5pt + rgb("475569"))
    line(pPole, pShadow)
    content((26 * sc, -0.35), text(size: 8pt)[Bóng $52" m"$])
    content((-0.6, 15 * sc), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$h = ?$])
    
    draw_angle_arc(pShadow, 150deg, 180deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((52 * sc - 1.1, 0.3), text(fill: rgb("d97706"), size: 7.5pt)[$30^circ$])
  })
]
Tính chiều cao của cột thu lôi (làm tròn đến hàng đơn vị theo mét).],
    [30],
    loigiai: [
        #step([Áp dụng hệ thức lượng tam giác vuông])
        Gọi chiều cao cột thu lôi là $h$:
        $ h = 52 dot tan 30^circ = 52 dot (sqrt(3)/3) approx 52 dot 0.57735 = 30.02" m" $
        Làm tròn đến hàng đơn vị ta được $30" m"$.
    ]
)

// TLN 2: Diện tích trang trại điện mặt trời
#lt-tln(num: 18, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một khu đất xây dựng trang trại điện mặt trời có dạng hình tam giác $A B C$ với hai cạnh biên $A B = 300" m", A C = 400" m"$ và góc xen giữa $hat(A) = 30^circ$. Tính diện tích khu đất trang trại này theo đơn vị hécta (biết $1" ha" = 10000" m"^2$).],
    [3],
    loigiai: [
        #step([Tính diện tích theo mét vuông])
        $ S = 1/2 A B dot A C sin A = 1/2 dot 300 dot 400 dot sin 30^circ = 60000 dot (1/2) = 30000" m"^2 $
        
        #step([Đổi sang hecta])
        $ S = 30000 / 10000 = 3" ha" $
        Vậy diện tích là $3" ha"$.
    ]
)

// TLN 3: Khoảng cách giữa hai trụ tuabin gió
#lt-tln(num: 19, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Hai trụ tuabin gió $A$ và $B$ được quan sát từ trung tâm điều hành $O$. Đo được $O A = 500" m", O B = 700" m"$ và góc ngắm $hat(A O B) = 60^circ$. Tính khoảng cách giữa hai trụ tuabin gió (làm tròn đến hàng đơn vị theo mét).],
    [624],
    loigiai: [
        #step([Áp dụng định lý côsin])
        $ A B^2 = O A^2 + O B^2 - 2 O A dot O B cos 60^circ = 500^2 + 700^2 - 2(500)(700)(1/2) $
        $ A B^2 = 250000 + 490000 - 350000 = 390000 $
        $ => A B = sqrt(390000) = 100 sqrt(39) approx 100 dot 6.244998 = 624.5" m" approx 624" m" $
        (Chính xác: $624.4998 approx 624" m"$).
    ]
)

// TLN 4: Chiều cao ngọn đồi đặt pin mặt trời
#lt-tln(num: 20, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Để lắp đặt tấm pin mặt trời trên đỉnh đồi, kỹ sư đo góc nâng từ chân đồi $A$ lên đỉnh đồi $D$ được $30^circ$. Sau khi tiến lại gần chân đồi một khoảng $60" m"$ đến vị trí $B$, góc nâng đo được là $45^circ$. Tính chiều cao của ngọn đồi so với mặt bằng đo (làm tròn đến hàng đơn vị theo mét).],
    [82],
    loigiai: [
        #step([Lập phương trình chiều cao])
        Gọi chiều cao ngọn đồi là $h > 0$.
        Khoảng cách từ $A$ đến chân đường cao: $d_A = h / (tan 30^circ) = h sqrt(3)$.
        Khoảng cách từ $B$ đến chân đường cao: $d_B = h / (tan 45^circ) = h$.
        
        #step([Giải tìm h])
        $ d_A - d_B = 60 <=> h(sqrt(3) - 1) = 60 => h = 60 / (sqrt(3) - 1) = 30(sqrt(3) + 1) approx 30(2.73205) = 81.96" m" $
        Làm tròn đến hàng đơn vị ta được $82" m"$.
    ]
)

// TLN 5: Chiều dài cánh quạt tuabin gió
#lt-tln(num: 21, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một cánh quạt tuabin gió $O A$ đang quay tròn tạo với mặt ngang một góc $45^circ$. Khoảng cách từ đầu mút cánh quạt $A$ đến trục quay $O$ theo phương thẳng đứng là $28" m"$. Tính chiều dài của cánh quạt $O A$ (làm tròn đến hàng đơn vị theo mét).],
    [40],
    loigiai: [
        #step([Áp dụng hệ thức lượng])
        Gọi $L$ là chiều dài cánh quạt:
        $ L = 28 / (sin 45^circ) = 28 / (sqrt(2)/2) = 28 sqrt(2) approx 39.598" m" $
        Làm tròn đến hàng đơn vị ta được $40" m"$.
    ]
)

// TLN 6: Vận dụng cao - Tối ưu hóa góc nhìn màn hình LED năng lượng mặt trời (Hình ngay ở đề bài kèm emoji 📺, 🚗)
#lt-tln(num: 22, de: [Đề 3 (F) — Mã 109], back-to: "sec-exercise-hub",[Một màn hình quảng cáo điện tử $A B$ sử dụng năng lượng mặt trời cao $10" m"$ ($A$ là mép trên, $B$ là mép dưới) được gắn trên trụ cao dọc theo đường cao tốc. Mép dưới của màn hình cách tầm mắt của người lái xe một khoảng thẳng đứng $O B = 8" m"$, và mép trên cách tầm mắt $O A = 18" m"$ (với $O$ là giao điểm của đường gióng tầm mắt nằm ngang với trục thẳng đứng của trụ màn hình).
#align(center)[
    #cetz.canvas({
        import cetz.draw: *
        set-style(stroke: 0.8pt)
        let sc = 0.18
        
        // Trục biển quảng cáo thẳng đứng
        line((14 * sc, 0), (14 * sc, 22 * sc), stroke: 2.2pt + luma(100))
        content((14 * sc + 2.2, 21 * sc), text(weight: "bold")[Trụ màn hình ☀️])
        
        // Đường gióng ngang tầm mắt
        line((0, 0), (14 * sc, 0), stroke: (paint: luma(120), dash: "dashed", thickness: 0.8pt))
        content((7 * sc, -0.6), text(size: 8.5pt)[$x = O M$])
        
        let pM = (0, 0)
        let pO = (14 * sc, 0)
        let pB = (14 * sc, 8 * sc)
        let pA = (14 * sc, 18 * sc)
        
        // Màn hình LED AB tô màu cam đỏ nổi bật
        line(pB, pA, stroke: 5.5pt + rgb("ea580c"))
        content((14 * sc + 2.6, 13 * sc), text(fill: rgb("ea580c"), weight: "bold")[📺 Màn hình ($10" m"$)])
        
        // Tia nhìn tới mép trên và dưới
        line(pM, pB, stroke: 1pt + rgb("0284c7"))
        line(pM, pA, stroke: 1.2pt + rgb("2563eb"))
        
        content((-0.8, 0), [🚗 $M$ (Tài xế)])
        circle(pO, radius: 2pt, fill: black)
        content((14 * sc + 0.35, -0.3), text(weight: "bold")[$O$])
        circle(pB, radius: 2.5pt, fill: rgb("ea580c"))
        content((14 * sc + 0.4, 8 * sc), text(weight: "bold")[$B (8" m")$])
        circle(pA, radius: 2.5pt, fill: rgb("ea580c"))
        content((14 * sc + 0.4, 18 * sc), text(weight: "bold")[$A (18" m")$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 33.7deg, 56.3deg, radius: 1.5, stroke: 1pt + rgb("dc2626"))
        content((1.4, 1.2), text(fill: rgb("dc2626"), weight: "bold")[$alpha$])
    })
]
Hỏi tài xế xe ô tô cần ở cách trục thẳng đứng của biển quảng cáo một khoảng cách nằm ngang $x = O M$ bằng bao nhiêu mét để góc nhìn $alpha = hat(A M B)$ bao quát trọn vẹn màn hình đạt giá trị lớn nhất?],
    [12],
    loigiai: [
        #step([Mô hình hóa hình học và biểu diễn góc nhìn])
        Gọi khoảng cách từ tài xế $M$ đến trục màn hình là $x = O M > 0$.
        Tam giác $M O A$ vuông tại $O$ có $tan hat(A M O) = (O A) / x = 18 / x$.
        Tam giác $M O B$ vuông tại $O$ có $tan hat(B M O) = (O B) / x = 8 / x$.
        
        Góc nhìn bao quát toàn bộ màn hình LED là $alpha = hat(A M B) = hat(A M O) - hat(B M O)$.

        #step([Biến đổi lượng giác])
        $ tan alpha = tan(hat(A M O) - hat(B M O)) = (tan hat(A M O) - tan hat(B M O)) / (1 + tan hat(A M O) dot tan hat(B M O)) $
        $ tan alpha = (18/x - 8/x) / (1 + (18/x)(8/x)) = (10/x) / (1 + 144 / x^2) = 10 / (x + 144 / x) $
        
        #step([Áp dụng bất đẳng thức Cauchy tìm giá trị lớn nhất])
        Vì $x > 0$, áp dụng bất đẳng thức Cauchy cho hai số dương $x$ và $144 / x$:
        $ x + 144 / x >= 2 sqrt(x dot 144 / x) = 2 sqrt(144) = 2 dot 12 = 24 $
        Suy ra:
        $ tan alpha <= 10 / 24 = 5 / 12 $
        Góc $alpha$ đạt giá trị lớn nhất khi và chỉ khi:
        $ x = 144 / x <=> x^2 = 144 <=> x = sqrt(144) = 12" m" quad (text("do ") x > 0) $
        Vậy khoảng cách tối ưu để góc nhìn lớn nhất là $12" m"$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 6: TOÁN THỰC TẾ & ĐO ĐẠC HÌNH HỌC (ĐỀ F: NĂNG LƯỢNG TÁI TẠO, QUANG HỌC & TỐI ƯU HÓA)!]      #v(0.6em)
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
