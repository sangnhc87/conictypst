#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 11: PHƯƠNG SAI VÀ ĐỘ LỆCH CHUẨN
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)


#show: lecture-theme.with(
  title:       "Bài 2: Phương sai và độ lệch chuẩn của mẫu số liệu ghép nhóm",
  subtitle:    "TOÁN 12 — Chương III: Các số đặc trưng đo mức độ phân tán của mẫu số liệu ghép nhóm",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

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

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd


// ==================== Đề 3 ====================




// ─── CÂU 1 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Số đặc trưng nào không sử dụng thông tin của nhóm số liệu đầu tiên và nhóm số liệu cuối cùng?],
  (
    [Khoảng biến thiên],
    True([Khoảng tứ phân vị]),
    [Phương sai],
    [Độ lệch chuẩn]
  ),
  loigiai: [
    #step[Khoảng biến thiên $R = u_k - u_0$ sử dụng trực tiếp đầu mút của nhóm cuối và nhóm đầu.]
    #step[Phương sai và độ lệch chuẩn tính toán dựa trên số trung bình, tức là dùng tất cả các nhóm (bao gồm nhóm đầu và nhóm cuối).]
    #step[Khoảng tứ phân vị $"IQR" = Q_3 - Q_1$ chỉ sử dụng thông tin của nhóm chứa $Q_1$ và $Q_3$, không phụ thuộc vào nhóm đầu tiên hay nhóm cuối cùng.]
    #step[Vậy đáp án là B.]
      ]
)// ─── CÂU 2 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Nếu thay tất cả các tần số trong mẫu số liệu ghép nhóm bằng $4$ thì số đặc trưng nào sau đây không thay đổi?],
  (
    True([Khoảng biến thiên]),
    [Khoảng tứ phân vị],
    [Phương sai],
    [Độ lệch chuẩn]
  ),
  loigiai: [
    #step[Khoảng biến thiên của mẫu số liệu ghép nhóm $R = u_k - u_0$ chỉ phụ thuộc vào đầu mút phải của nhóm cuối cùng và đầu mút trái của nhóm đầu tiên, hoàn toàn không phụ thuộc vào tần số của các nhóm.]
    #step[Vậy đáp án là A.]
      ]
)// ─── CÂU 3 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Trong các khẳng định sau, khẳng định nào *sai*?],
  (
    [Phương sai luôn luôn là số không âm],
    [Phương sai là bình phương của độ lệch chuẩn],
    [Phương sai càng lớn thì độ phân tán quanh số trung bình càng lớn],
    True([Phương sai luôn luôn lớn hơn độ lệch chuẩn])
  ),
  loigiai: [
    #step[Khẳng định D sai vì nếu phương sai $S^2 < 1$ thì độ lệch chuẩn $S = sqrt(S^2) > S^2$. Ví dụ, nếu $S^2 = 0.25$ thì $S = 0.5$, khi đó phương sai nhỏ hơn độ lệch chuẩn.]
    #step[Vậy đáp án là D.]
      ]
)// ─── CÂU 4 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Doanh thu bán hàng trong $20$ ngày được lựa chọn ngẫu nhiên của một cửa hàng được ghi lại ở bảng sau (đơn vị: triệu đồng):
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Doanh thu*], [$[5; 7)$], [$[7; 9)$], [$[9; 11)$], [$[11; 13)$], [$[13; 15)$],
        [*Số ngày*], [2], [7], [7], [3], [1]
      )
    ]
    Số trung bình của mẫu số liệu trên thuộc khoảng nào trong các khoảng dưới đây?],
  (
    [$[7; 9)$],
    True([$[9; 11)$]),
    [$[11; 13)$],
    [$[13; 15)$]
  ),
  loigiai: [
    #step[Ta tính giá trị đại diện (trung điểm) $x_i$ của từng nhóm:]
    #step[Nhóm $[5; 7)$: $x_1 = 6$]
    #step[Nhóm $[7; 9)$: $x_2 = 8$]
    #step[Nhóm $[9; 11)$: $x_3 = 10$]
    #step[Nhóm $[11; 13)$: $x_4 = 12$]
    #step[Nhóm $[13; 15)$: $x_5 = 14$]
    #step[Số trung bình cộng của mẫu số liệu:]
    #step[$ overline(x) = (2 dot 6 + 7 dot 8 + 7 dot 10 + 3 dot 12 + 1 dot 14) / 20 = (12 + 56 + 70 + 36 + 14) / 20 = 188/20 = 9.4 " (triệu đồng)" $]
    #step[Giá trị $9.4$ thuộc khoảng $[9; 11)$.]
    #step[Vậy đáp án là B.]
      ]
)// ─── CÂU 5 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Một siêu thị thống kê số tiền (đơn vị: chục nghìn đồng) mà $44$ khách hàng mua hàng ở siêu thị đó trong một ngày. Số liệu được ghi lại trong bảng dưới đây.
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Giá trị đại diện*], [*Tần số*],
        [$[40; 45)$], [42.5], [4],
        [$[45; 50)$], [47.5], [14],
        [$[50; 55)$], [52.5], [8],
        [$[55; 60)$], [57.5], [10],
        [$[60; 65)$], [62.5], [6],
        [$[65; 70)$], [67.5], [2],
        [*Cộng*], [], [$n = 44$]
      )
    ]
    Phương sai của mẫu số liệu ghép nhóm trên là:],
  (
    [$53.2$],
    True([$46.1$]),
    [$30$],
    [$11$]
  ),
  loigiai: [
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (4 dot 42.5 + 14 dot 47.5 + 8 dot 52.5 + 10 dot 57.5 + 6 dot 62.5 + 2 dot 67.5) / 44 = 2340/44 = 585/11 approx 53.18 $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 4 dot 42.5^2 + 14 dot 47.5^2 + 8 dot 52.5^2 + 10 dot 57.5^2 + 6 dot 62.5^2 + 2 dot 67.5^2 = 126475 $]
    #step[Phương sai:]
    #step[$ S^2 = 126475/44 - (585/11)^2 = 22325/484 approx 46.126 $]
    #step[Làm tròn kết quả đến hàng phần mười ta được $46.1$.]
    #step[Vậy đáp án là B.]
      ]
)// ─── CÂU 6 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Một nhà vườn thống kê khối lượng (đơn vị: kg) của $44$ giỏ trái cây được bán ra trong một ngày:
    #align(center)[
      #table(
        columns: (auto, auto),
        align: center + horizon,
        [*Khối lượng*], [*Số giỏ*],
        [$[40; 45)$], [4],
        [$[45; 50)$], [14],
        [$[50; 55)$], [8],
        [$[55; 60)$], [10],
        [$[60; 65)$], [6],
        [$[65; 70)$], [2]
      )
    ]
    Độ lệch chuẩn của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hàng phần mười) là:],
  (
    True([$6.8$]),
    [$7.3$],
    [$3.3$],
    [$46.1$]
  ),
  loigiai: [
    #step[Ta tính được phương sai $S^2 approx 46.126$.]
    #step[Độ lệch chuẩn là:]
    #step[$ S = sqrt(S^2) = sqrt(46.126) approx 6.79 " (kg)" $]
    #step[Làm tròn đến hàng phần mười ta được $6.8$.]
    #step[Vậy đáp án là A.]
      ]
)// ─── CÂU 7 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Mỗi ngày bác Hương đều đi bộ để rèn luyện sức khoẻ. Quãng đường đi bộ mỗi ngày (đơn vị: km) của bác Hương trong $20$ ngày được thống kê lại ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Quãng đường* (km)], [$[2.7; 3.0)$], [$[3.0; 3.3)$], [$[3.3; 3.6)$], [$[3.6; 3.9)$], [$[3.9; 4.2)$],
        [*Số ngày*], [3], [6], [5], [4], [2]
      )
    ]
    Phương sai của mẫu số liệu ghép nhóm là:],
  (
    [$3.39$],
    [$11.62$],
    True([$0.1314$]),
    [$0.36$]
  ),
  loigiai: [
    #step[Giá trị đại diện của các nhóm lần lượt là: $2.85; 3.15; 3.45; 3.75; 4.05$.]
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (3 dot 2.85 + 6 dot 3.15 + 5 dot 3.45 + 4 dot 3.75 + 2 dot 4.05) / 20 = 67.8/20 = 3.39 " (km)" $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 3 dot 2.85^2 + 6 dot 3.15^2 + 5 dot 3.45^2 + 4 dot 3.75^2 + 2 dot 4.05^2 = 232.47 $]
    #step[Phương sai:]
    #step[$ S^2 = 232.47/20 - 3.39^2 = 11.6235 - 11.4921 = 0.1314 $]
    #step[Vậy đáp án là C.]
      ]
)// ─── CÂU 8 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Một người chạy bộ ghi lại cự ly (đơn vị: km) của $20$ buổi tập trong tháng:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Cự ly* (km)], [$[2.7; 3.0)$], [$[3.0; 3.3)$], [$[3.3; 3.6)$], [$[3.6; 3.9)$], [$[3.9; 4.2)$],
        [*Số buổi*], [3], [6], [5], [4], [2]
      )
    ]
    Độ lệch chuẩn của mẫu số liệu ghép nhóm có giá trị gần nhất với giá trị nào dưới đây?],
  (
    [$3.41$],
    [$11.62$],
    [$0.017$],
    True([$0.36$])
  ),
  loigiai: [
    #step[Ta tính được phương sai $S^2 = 0.1314$.]
    #step[Độ lệch chuẩn là:]
    #step[$ S = sqrt(S^2) = sqrt(0.1314) approx 0.3625 " (km)" $]
    #step[Giá trị này gần nhất với $0.36$.]
    #step[Vậy đáp án là D.]
      ]
)// ─── CÂU 9 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Bạn Chi rất thích nhảy hiện đại. Thời gian tập nhảy mỗi ngày trong thời gian gần đây của bạn Chi được thống kê lại ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian* (phút)], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$], [$[35; 40)$], [$[40; 45)$],
        [*Số ngày*], [6], [6], [4], [1], [1]
      )
    ]
    Phương sai của mẫu số liệu ghép nhóm có giá trị gần nhất với giá trị nào dưới đây?],
  (
    [$31.77$],
    [$32$],
    True([$31.25$]),
    [$31.44$]
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $22.5; 27.5; 32.5; 37.5; 42.5$.]
    #step[Tổng số ngày $n = 18$.]
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (6 dot 22.5 + 6 dot 27.5 + 4 dot 32.5 + 1 dot 37.5 + 1 dot 42.5) / 18 = 510/18 = 85/3 approx 28.33 " (phút)" $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 6 dot 22.5^2 + 6 dot 27.5^2 + 4 dot 32.5^2 + 1 dot 37.5^2 + 1 dot 42.5^2 = 15012.5 $]
    #step[Phương sai:]
    #step[$ S^2 = 15012.5/18 - (85/3)^2 = 30025/36 - 7225/9 = 1125/36 = 31.25 $]
    #step[Vậy đáp án là C.]
      ]
)// ─── CÂU 10 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Dũng là học sinh rất giỏi chơi rubik, bạn có thể giải nhiều loại khối rubik khác nhau. Trong một lần tập luyện giải khối rubik $3 times 3$, bạn Dũng đã tự thống kê lại thời gian giải rubik trong $25$ lần giải liên tiếp ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian giải* (giây)], [$[8; 10)$], [$[10; 12)$], [$[12; 14)$], [$[14; 16)$], [$[16; 18)$],
        [*Số lần*], [4], [6], [8], [4], [3]
      )
    ]
    Độ lệch chuẩn của mẫu số liệu ghép nhóm có giá trị gần nhất với giá trị nào dưới đây?],
  (
    [$5.98$],
    [$6$],
    True([$2.44$]),
    [$2.5$]
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $9; 11; 13; 15; 17$.]
    #step[Tổng số lần giải $n = 25$.]
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (4 dot 9 + 6 dot 11 + 8 dot 13 + 4 dot 15 + 3 dot 17) / 25 = 317/25 = 12.68 " (giây)" $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 4 dot 9^2 + 6 dot 11^2 + 8 dot 13^2 + 4 dot 15^2 + 3 dot 17^2 = 4169 $]
    #step[Phương sai:]
    #step[$ S^2 = 4169/25 - 12.68^2 = 166.76 - 160.7824 = 5.9776 $]
    #step[Độ lệch chuẩn:]
    #step[$ S = sqrt(5.9776) approx 2.4449 " (giây)" $]
    #step[Giá trị này gần nhất với $2.44$.]
    #step[Vậy đáp án là C.]
      ]
)// ─── CÂU 11 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Để đánh giá chất lượng của một loại pin điện thoại mới, người ta ghi lại thời gian nghe nhạc liên tục của điện thoại được sạc đầy pin cho đến khi hết pin cho kết quả sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian* (giờ)], [$[5; 5.5)$], [$[5.5; 6)$], [$[6; 6.5)$], [$[6.5; 7)$], [$[7; 7.5)$],
        [*Số chiếc* (tần số)], [2], [8], [15], [10], [5]
      )
    ]
    Tính độ lệch chuẩn của mẫu số liệu ghép nhóm trên (làm tròn đến 4 chữ số thập phân).],
  (
    [$0.4252$],
    [$0.5314$],
    [$0.6214$],
    True([$0.5268$])
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $5.25; 5.75; 6.25; 6.75; 7.25$.]
    #step[Cỡ mẫu $n = 40$.]
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (2 dot 5.25 + 8 dot 5.75 + 15 dot 6.25 + 10 dot 6.75 + 5 dot 7.25) / 40 = 254/40 = 6.35 " (giờ)" $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 2 dot 5.25^2 + 8 dot 5.75^2 + 15 dot 6.25^2 + 10 dot 6.75^2 + 5 dot 7.25^2 = 1624 $]
    #step[Phương sai:]
    #step[$ S^2 = 1624/40 - 6.35^2 = 40.6 - 40.3225 = 0.2775 $]
    #step[Độ lệch chuẩn:]
    #step[$ S = sqrt(0.2775) approx 0.52678 " (giờ)" $]
    #step[Làm tròn đến 4 chữ số thập phân ta được $0.5268$.]
    #step[Vậy đáp án là D.]
      ]
)// ─── CÂU 12 ───
#my-tn(de: "Đề 3", 
  
  dir: "doc",lines: 0,
  [Người ta ghi lại tiền lãi (đơn vị: triệu đồng) của một số nhà đầu tư (với số tiền đầu tư như nhau) khi đầu tư vào hai lĩnh vực A, B cho kết quả như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Tiền lãi*], [$[5; 10)$], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$],
        [*Lĩnh vực A*], [2], [5], [8], [6], [4],
        [*Lĩnh vực B*], [8], [4], [2], [5], [6]
      )
    ]
    Tính độ lệch chuẩn cho các mẫu số liệu về tiền lãi của các nhà đầu tư ở lĩnh vực B.],
  (
    True([$8.039$]),
    [$8.5314$],
    [$8.6214$],
    [$8.5268$]
  ),
  loigiai: [
    #step[Giá trị đại diện của các nhóm lần lượt là: $7.5; 12.5; 17.5; 22.5; 27.5$.]
    #step[Xét lĩnh vực B: Cỡ mẫu $n = 8 + 4 + 2 + 5 + 6 = 25$.]
    #step[Số trung bình cộng của lĩnh vực B:]
    #step[$ overline(x)_B = (8 dot 7.5 + 4 dot 12.5 + 2 dot 17.5 + 5 dot 22.5 + 6 dot 27.5) / 25 = 422.5/25 = 16.9 " (triệu đồng)" $]
    #step[Tính $sum f_i x_i^2$ của lĩnh vực B:]
    #step[$ sum f_i x_i^2 = 8 dot 7.5^2 + 4 dot 12.5^2 + 2 dot 17.5^2 + 5 dot 22.5^2 + 6 dot 27.5^2 = 8756.25 $]
    #step[Phương sai của lĩnh vực B:]
    #step[$ S^2_B = 8756.25/25 - 16.9^2 = 350.25 - 285.61 = 64.64 $]
    #step[Độ lệch chuẩn của lĩnh vực B:]
    #step[$ S_B = sqrt(64.64) approx 8.0399 " (triệu đồng)" $]
    #step[Làm tròn kết quả ta được $8.039$.]
    #step[Vậy đáp án là A.]
      ]
)

// ─── CÂU 1 ───
#my-ds(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Kết quả $40$ lần nhảy xa của hai vận động viên Dũng và Huy được lần lượt thống kê trong bảng bên dưới (đơn vị: mét):
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Dũng*], [*Huy*],
        [$[6.22; 6.46)$], [3], [2],
        [$[6.46; 6.70)$], [7], [5],
        [$[6.70; 6.94)$], [5], [8],
        [$[6.94; 7.18)$], [20], [19],
        [$[7.18; 7.42)$], [5], [6],
        [*Cộng*], [$n = 40$], [$n = 40$]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Số trung bình cộng của mẫu số liệu ghép nhóm biểu diễn kết quả $40$ lần nhảy xa của vận động viên Dũng (làm tròn kết quả đến hàng phần trăm) là $6.92$ m]),
    [Độ lệch chuẩn của mẫu số liệu ghép nhóm biểu diễn kết quả $40$ lần nhảy xa của vận động viên Dũng (làm tròn kết quả đến hàng phần trăm) là $0.26$ m],
    [Phương sai của mẫu số liệu ghép nhóm biểu diễn kết quả $40$ lần nhảy xa của vận động viên Huy (làm tròn kết quả đến hàng phần trăm) là $0.16$],
    [Kết quả nhảy xa của vận động viên Dũng đồng đều hơn kết quả nhảy xa của vận động viên Huy]
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $6.34; 6.58; 6.82; 7.06; 7.30$.]
    #step[a) Đúng. Số trung bình cộng của Dũng:]
    #step[$ overline(x)_D = (3 dot 6.34 + 7 dot 6.58 + 5 dot 6.82 + 20 dot 7.06 + 5 dot 7.30) / 40 = 276.88/40 = 6.922 " (m)" $]
    #step[Làm tròn đến hàng phần trăm ta được $6.92$ m.]
    #step[b) Sai. Tính phương sai của Dũng:]
    #step[$ sum f_i x_i^2 = 3 dot 6.34^2 + 7 dot 6.58^2 + 5 dot 6.82^2 + 20 dot 7.06^2 + 5 dot 7.30^2 = 1919.5456 $]
    #step[$ S^2_D = 1919.5456/40 - 6.922^2 = 47.98864 - 47.914084 = 0.074556 $]
    #step[$ S_D = sqrt(0.074556) approx 0.273 " (m)" $]
    #step[Làm tròn kết quả đến hàng phần trăm ta được $0.27$ m (không phải $0.26$ m).]
    #step[c) Sai. Tính số trung bình của Huy:]
    #step[$ overline(x)_H = (2 dot 6.34 + 5 dot 6.58 + 8 dot 6.82 + 19 dot 7.06 + 6 dot 7.30) / 40 = 278.08/40 = 6.952 " (m)" $]
    #step[Phương sai của Huy:]
    #step[$ sum f_i x_i^2 = 2 dot 6.34^2 + 5 dot 6.58^2 + 8 dot 6.82^2 + 19 dot 7.06^2 + 6 dot 7.30^2 = 1935.7408 $]
    #step[$ S^2_H = 1935.7408/40 - 6.952^2 = 48.39352 - 48.330304 = 0.063216 $]
    #step[Làm tròn kết quả đến hàng phần trăm ta được $0.06$ (không phải $0.16$).]
    #step[d) Sai. Vì $S^2_D approx 0.075 > S^2_H approx 0.063$, độ phân tán của Dũng lớn hơn Huy nên kết quả nhảy xa của Huy đồng đều hơn của Dũng.]
      ]
)// ─── CÂU 2 ───
#my-ds(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Mẫu số liệu ghép nhóm thống kê mức lương của hai công ty A, B (đơn vị: triệu đồng) được thể hiện như bảng dưới đây:
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Công ty A*], [*Công ty B*],
        [$[10; 15)$], [15], [25],
        [$[15; 20)$], [18], [15],
        [$[20; 25)$], [10], [7],
        [$[25; 30)$], [10], [5],
        [$[30; 35)$], [5], [5],
        [$[35; 40)$], [2], [3],
        [*Cộng*], [$n = 60$], [$n = 60$]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Số trung bình cộng của mẫu số liệu ghép nhóm của công ty A là $62/3$]),
    [Độ lệch chuẩn của mẫu số liệu ghép nhóm của công ty A là $5$],
    [Phương sai của mẫu số liệu ghép nhóm của công ty B (làm tròn kết quả đến hàng phần trưng) là $52.91$],
    True([Nhận thấy độ lệch chuẩn của công ty A nhỏ hơn công ty B nên mức lương của công ty A đồng đều hơn])
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $12.5; 17.5; 22.5; 27.5; 32.5; 37.5$.]
    #step[a) Đúng. Số trung bình cộng của công ty A:]
    #step[$ overline(x)_A = (15 dot 12.5 + 18 dot 17.5 + 10 dot 22.5 + 10 dot 27.5 + 5 dot 32.5 + 2 dot 37.5) / 60 = 1240/60 = 62/3 $]
    #step[b) Sai. Tính phương sai và độ lệch chuẩn của công ty A:]
    #step[$ sum f_i x_i^2 = 15 dot 12.5^2 + 18 dot 17.5^2 + 10 dot 22.5^2 + 10 dot 27.5^2 + 5 dot 32.5^2 + 2 dot 37.5^2 = 28575 $]
    #step[$ S^2_A = 28575/60 - (62/3)^2 = 476.25 - 3844/9 = 442.25/9 approx 49.14 $]
    #step[$ S_A = sqrt(442.25/9) approx 7.01 $ (không phải $5$).]
    #step[c) Sai. Tính số trung bình của công ty B:]
    #step[$ overline(x)_B = (25 dot 12.5 + 15 dot 17.5 + 7 dot 22.5 + 5 dot 27.5 + 5 dot 32.5 + 3 dot 37.5) / 60 = 1145/60 = 229/12 $]
    #step[Phương sai của công ty B:]
    #step[$ sum f_i x_i^2 = 25 dot 12.5^2 + 15 dot 17.5^2 + 7 dot 22.5^2 + 5 dot 27.5^2 + 5 dot 32.5^2 + 3 dot 37.5^2 = 25325 $]
    #step[$ S^2_B = 25325/60 - (229/12)^2 = 5065/12 - 52441/144 = 8339/144 approx 57.91 $ (không phải $52.91$).]
    #step[d) Đúng. Độ lệch chuẩn của B: $S_B = sqrt(8339/144) approx 7.61$.]
    #step[Vì $S_A approx 7.01 < S_B approx 7.61$ nên mức lương công ty A đồng đều hơn công ty B.]
      ]
)// ─── CÂU 3 ───
#my-ds(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Khảo sát điểm thi môn Toán của 60 thí sinh thu được bảng số liệu ghép nhóm:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm*], [$[0; 9.5)$], [$[9.5; 19.5)$], [$[19.5; 29.5)$], [$[29.5; 39.5)$], [$[39.5; 49.5)$],
        [*Số thí sinh*], [1], [2], [4], [6], [15],
        [*Điểm*], [$[49.5; 59.5)$], [$[59.5; 69.5)$], [$[69.5; 79.5)$], [$[79.5; 89.5)$], [$[89.5; 99.5)$],
        [*Số thí sinh*], [12], [10], [6], [3], [1]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Điểm thi môn Toán trung bình của 60 thí sinh là $51.5$ điểm]),
    True([Phương sai điểm thi môn Toán xấp xỉ bằng $290.75$]),
    True([Độ lệch chuẩn điểm thi môn Toán xấp xỉ bằng $17.05$ điểm]),
    [Nếu thang điểm thi được nhân đôi từ hệ 100 sang hệ 200 điểm thì phương sai điểm thi mới cũng nhân đôi]
  ),
  loigiai: [
    #step[a) Đúng. Số trung bình cộng của mẫu: $overline(x) approx 51.5$ điểm.]
    #step[b) Đúng. Tính phương sai: $S^2 approx 290.75$.]
    #step[c) Đúng. Độ lệch chuẩn $S = sqrt(290.75) approx 17.05$ điểm.]
    #step[d) Sai. Khi nhân tất cả các giá trị số liệu với hằng số $c = 2$ thì phương sai mới bằng $c^2 = 4$ lần phương sai cũ (tức là nhân bốn chứ không phải nhân đôi).]
      ]
)// ─── CÂU 4 ───
#my-ds(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Thống kê lượng nước tiêu thụ trong tháng của 160 hộ gia đình:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Lượng nước tiêu thụ* ($m^3$)], [$[3; 6)$], [$[6; 9)$], [$[9; 12)$], [$[12; 15)$], [$[15; 18)$],
        [*Số hộ gia đình*], [24], [57], [42], [29], [8]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Lượng nước tiêu thụ trung bình của mỗi hộ gia đình là $9.375$ $m^3$]),
    True([Phương sai lượng nước tiêu thụ của mẫu xấp xỉ bằng $11.83$]),
    True([Độ lệch chuẩn lượng nước tiêu thụ của mẫu xấp xỉ bằng $3.44$ $m^3$]),
    True([Số hộ gia đình tiêu thụ nước từ 9 $m^3$ trở lên chiếm $49.375\%$ tổng số hộ gia đình])
  ),
  loigiai: [
    #step[a) Đúng. Số trung bình cộng: $overline(x) = 9.375$ $m^3$.]
    #step[b) Đúng. Tính phương sai: $S^2 approx 11.828$.]
    #step[c) Đúng. Độ lệch chuẩn $S = sqrt(11.828) approx 3.44$ $m^3$.]
    #step[d) Đúng. Số hộ gia đình tiêu thụ từ 9 $m^3$ trở lên là $79$ hộ.]
    #step[Tỷ lệ: $79/160 = 49.375\%$.]
      ]
)

// ─── CÂU 1 ───
#my-tln(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Khảo sát mức lương (đơn vị: triệu đồng) của 60 nhân viên ở công ty A, ta thu được bảng số liệu ghép nhóm:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Mức lương*], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$], [$[35; 40)$],
        [*Số nhân viên*], [15], [18], [10], [10], [5], [2]
      )
    ]
    Hãy tính số trung bình cộng của mức lương công ty A (làm tròn kết quả đến hàng phần trăm).],
  [$20.67$],
  loigiai: [
    #step[Số trung bình cộng của mức lương:]
    #step[$ overline(x) = (15 dot 12.5 + 18 dot 17.5 + 10 dot 22.5 + 10 dot 27.5 + 5 dot 32.5 + 2 dot 37.5) / 60 = 1240/60 = 62/3 approx 20.67 " (triệu đồng)" $]
    #step[Đáp số: $20.67$.]
      ]
)// ─── CÂU 2 ───
#my-tln(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Khảo sát doanh thu bán hàng mỗi ngày (đơn vị: triệu đồng) của 60 cửa hàng tiện lợi, ta thu được bảng số liệu:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Doanh thu*], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$], [$[35; 40)$],
        [*Số cửa hàng*], [15], [18], [10], [10], [5], [2]
      )
    ]
    Hãy tính phương sai của mẫu số liệu ghép nhóm này (làm tròn kết quả đến hàng phần trăm).],
  [$49.14$],
  loigiai: [
    #step[Phương sai của mẫu số liệu:]
    #step[$ S^2 = 28575/60 - (62/3)^2 = 476.25 - 3844/9 = 442.25/9 approx 49.14 $]
    #step[Đáp số: $49.14$.]
      ]
)// ─── CÂU 3 ───
#my-tln(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Thống kê chi phí sinh hoạt (đơn vị: triệu đồng/tháng) của 60 hộ gia đình, ta thu được bảng số liệu sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Chi phí*], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$], [$[35; 40)$],
        [*Số hộ*], [15], [18], [10], [10], [5], [2]
      )
    ]
    Hãy tính độ lệch chuẩn của mẫu số liệu trên (triệu đồng, làm tròn kết quả đến hàng phần trăm).],
  [$7.01$],
  loigiai: [
    #step[Từ phương sai đã tính là $442.25/9$, độ lệch chuẩn là:]
    #step[$ S = sqrt(442.25/9) approx 7.01 " (triệu đồng)" $]
    #step[Đáp số: $7.01$.]
      ]
)// ─── CÂU 4 ───
#my-tln(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Khảo sát điểm thi môn Tiếng Anh (thang điểm 100) của 60 sinh viên, ta thu được bảng số liệu ghép nhóm:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm*], [$[0; 9.5)$], [$[9.5; 19.5)$], [$[19.5; 29.5)$], [$[29.5; 39.5)$], [$[39.5; 49.5)$],
        [*Số sinh viên*], [1], [2], [4], [6], [15],
        [*Điểm*], [$[49.5; 59.5)$], [$[59.5; 69.5)$], [$[69.5; 79.5)$], [$[79.5; 89.5)$], [$[89.5; 99.5)$],
        [*Số sinh viên*], [12], [10], [6], [3], [1]
      )
    ]
    Hãy tính phương sai của mẫu số liệu ghép nhóm này (làm tròn kết quả đến hàng phần trăm).],
  [$290.75$],
  loigiai: [
    #step[Tính phương sai của điểm thi:]
    #step[$ S^2 = 290.75 $]
    #step[Đáp số: $290.75$.]
      ]
)// ─── CÂU 5 ───
#my-tln(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Một cuộc thi đánh giá năng lực có điểm số từ 0 đến 100. Điểm của 60 ứng viên được ghi lại trong bảng:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm*], [$[0; 9.5)$], [$[9.5; 19.5)$], [$[19.5; 29.5)$], [$[29.5; 39.5)$], [$[39.5; 49.5)$],
        [*Số ứng viên*], [1], [2], [4], [6], [15],
        [*Điểm*], [$[49.5; 59.5)$], [$[59.5; 69.5)$], [$[69.5; 79.5)$], [$[79.5; 89.5)$], [$[89.5; 99.5)$],
        [*Số ứng viên*], [12], [10], [6], [3], [1]
      )
    ]
    Hãy tính độ lệch chuẩn của mẫu số liệu ghép nhóm này (điểm, làm tròn kết quả đến hàng phần trăm).],
  [$17.05$],
  loigiai: [
    #step[Độ lệch chuẩn của mẫu số liệu:]
    #step[$ S = sqrt(290.75) approx 17.05 $]
    #step[Đáp số: $17.05$.]
      ]
)// ─── CÂU 6 ───
#my-tln(de: "Đề 3", 
  
  dir: "doc",lines: 2,
  [Khối lượng hàng hóa (đơn vị: tấn) của 160 chuyến xe tải được ghi nhận lại trong bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Khối lượng* (tấn)], [$[3; 6)$], [$[6; 9)$], [$[9; 12)$], [$[12; 15)$], [$[15; 18)$],
        [*Số chuyến xe*], [24], [57], [42], [29], [8]
      )
    ]
    Hãy tính phương sai của mẫu số liệu ghép nhóm này (làm tròn kết quả đến hàng phần trăm).],
  [$11.83$],
  loigiai: [
    #step[Phương sai khối lượng hàng hóa:]
    #step[$ S^2 approx 11.828 approx 11.83 $]
    #step[Đáp số: $11.83$.]
      ]
)
// ==================== Đề 4 (Nâng cao) ====================




// ─── CÂU 1 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Khi cộng tất cả các giá trị của một mẫu số liệu ghép nhóm với cùng một hằng số dương $a$, thì khẳng định nào sau đây là **đúng**?],
  (
    [Phương sai của mẫu số liệu tăng thêm $a$],
    True([Độ lệch chuẩn của mẫu số liệu không thay đổi]),
    [Khoảng tứ phân vị của mẫu số liệu tăng thêm $a$],
    [Khoảng biến thiên của mẫu số liệu tăng thêm $a$]
  ),
  loigiai: [
    #step[Khi cộng mọi giá trị với hằng số $a$, số trung bình cũng tăng thêm $a$.]
    #step[Do đó, độ lệch so với trung bình $(x_i - overline(x))$ không đổi, dẫn đến phương sai và độ lệch chuẩn không thay đổi.]
    #step[Khoảng biến thiên và khoảng tứ phân vị dựa trên hiệu của hai giá trị, nên $(x_1 + a) - (x_2 + a) = x_1 - x_2$, cũng không thay đổi.]
    #step[Vậy đáp án là B.]
      ]
)

// ─── CÂU 2 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Một mẫu số liệu ghép nhóm có tứ phân vị thứ nhất $Q_1 = 5$ và tứ phân vị thứ ba $Q_3 = 12$. Nếu ta nhân tất cả các giá trị của mẫu số liệu với $2$, khoảng tứ phân vị mới của mẫu số liệu là:],
  (
    [$7$],
    True([$14$]),
    [$17$],
    [$24$]
  ),
  loigiai: [
    #step[Khoảng tứ phân vị ban đầu là $"IQR" = Q_3 - Q_1 = 12 - 5 = 7$.]
    #step[Khi nhân tất cả các giá trị với $2$, các tứ phân vị cũng được nhân $2$, tức là $Q'_1 = 10$ và $Q'_3 = 24$.]
    #step[Khoảng tứ phân vị mới là $"IQR"' = 24 - 10 = 14$. (Hoặc $"IQR"' = 2 dot "IQR" = 14$).]
    #step[Vậy đáp án là B.]
      ]
)

// ─── CÂU 3 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Cho mẫu số liệu ghép nhóm về thời gian hoàn thành một sản phẩm (phút) của một nhóm công nhân:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian*], [$[0; 2)$], [$[2; 4)$], [$[4; 6)$], [$[6; 8)$], [$[8; 10)$],
        [*Số công nhân*], [2], [$m$], [6], [4], [2]
      )
    ]
    Biết rằng thời gian hoàn thành trung bình của cả nhóm là $4.5$ phút. Phương sai của mẫu số liệu trên bằng:],
  (
    [$3.25$],
    True([$4.75$]),
    [$5.5$],
    [$6.25$]
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $1, 3, 5, 7, 9$.]
    #step[Trung bình: $overline(x) = (2 dot 1 + m dot 3 + 6 dot 5 + 4 dot 7 + 2 dot 9) / (2 + m + 6 + 4 + 2) = (78 + 3m)/(14 + m)$.]
    #step[Ta có: $(78 + 3m)/(14 + m) = 4.5 arrow.r.double 78 + 3m = 63 + 4.5m arrow.r.double 1.5m = 15 arrow.r.double m = 10$.]
    #step[Với $m = 10$, cỡ mẫu $n = 24$. Tính $sum f_i x_i^2 = 2 dot 1^2 + 10 dot 3^2 + 6 dot 5^2 + 4 dot 7^2 + 2 dot 9^2 = 2 + 90 + 150 + 196 + 162 = 600$.]
    #step[Phương sai: $S^2 = 600/24 - 4.5^2 = 25 - 20.25 = 4.75$.]
    #step[Vậy đáp án là B.]
      ]
)

// ─── CÂU 4 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Một mẫu số liệu ghép nhóm có tần số phụ thuộc vào số thực dương $x$ như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [$[10; 20)$], [$[20; 30)$], [$[30; 40)$], [$[40; 50)$], [$[50; 60)$],
        [*Tần số*], [$x$], [$2x$], [$5x$], [$3x$], [$x$]
      )
    ]
    Nhóm chứa tứ phân vị thứ ba $Q_3$ của mẫu số liệu là:],
  (
    [$[20; 30)$],
    [$[30; 40)$],
    True([$[40; 50)$]),
    [Không xác định được vì chưa biết $x$]
  ),
  loigiai: [
    #step[Cỡ mẫu $n = x + 2x + 5x + 3x + x = 12x$.]
    #step[Vị trí tứ phân vị thứ ba ứng với tần số tích lũy: $3n/4 = 3 dot 12x / 4 = 9x$.]
    #step[Tần số tích lũy đến hết nhóm 3 là $x + 2x + 5x = 8x$.]
    #step[Tần số tích lũy đến hết nhóm 4 là $8x + 3x = 11x$.]
    #step[Vì $8x < 9x <= 11x$ nên tứ phân vị thứ ba $Q_3$ rơi vào nhóm 4 là $[40; 50)$.]
    #step[Vậy đáp án là C.]
      ]
)

// ─── CÂU 5 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Cho mẫu số liệu ghép nhóm có cỡ mẫu $n = 50$, các nhóm có giá trị đại diện là $x_i$ và tần số tương ứng là $f_i$. Biết rằng $sum_{i=1}^k f_i x_i = 150$ và $sum_{i=1}^k f_i x_i^2 = 500$. Độ lệch chuẩn của mẫu số liệu này là:],
  (
    [$10$],
    [$3$],
    True([$1$]),
    [$1.41$]
  ),
  loigiai: [
    #step[Số trung bình cộng: $overline(x) = (sum f_i x_i) / n = 150 / 50 = 3$.]
    #step[Phương sai: $S^2 = (sum f_i x_i^2) / n - overline(x)^2 = 500 / 50 - 3^2 = 10 - 9 = 1$.]
    #step[Độ lệch chuẩn: $S = sqrt(S^2) = sqrt(1) = 1$.]
    #step[Vậy đáp án là C.]
      ]
)

// ─── CÂU 6 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Cho hai mẫu số liệu ghép nhóm biểu diễn điểm kiểm tra của lớp A và lớp B. Biết số lượng học sinh hai lớp bằng nhau, cùng có điểm trung bình là $7.0$ và độ lệch chuẩn lần lượt là $S_A = 2.0, S_B = 3.0$. Nếu gộp điểm của hai lớp lại thành một mẫu số liệu duy nhất thì phương sai gộp bằng bao nhiêu?],
  (
    [$5.0$],
    True([$6.5$]),
    [$13.0$],
    [$2.5$]
  ),
  loigiai: [
    #step[Gọi cỡ mẫu mỗi lớp là $n$. Tổng dữ liệu bình phương của lớp A là $sum_{A} x^2 = n(S_A^2 + overline(x)^2) = n(4 + 49) = 53n$.]
    #step[Tổng dữ liệu bình phương của lớp B là $sum_{B} x^2 = n(S_B^2 + overline(x)^2) = n(9 + 49) = 58n$.]
    #step[Trung bình mẫu gộp vẫn là $7.0$. Cỡ mẫu gộp là $2n$.]
    #step[Phương sai gộp: $S^2_text("gộp") = (sum_{A} x^2 + sum_{B} x^2) / (2n) - 7^2 = (53n + 58n)/(2n) - 49 = 111/2 - 49 = 55.5 - 49 = 6.5$.]
    #step[Lưu ý: Vì trung bình bằng nhau nên $S^2_text("gộp") = (S_A^2 + S_B^2)/2 = (4+9)/2 = 6.5$.]
    #step[Vậy đáp án là B.]
      ]
)

// ─── CÂU 7 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Số đặc trưng nào sau đây đo lường mức độ phân tán của số liệu mà ít bị ảnh hưởng nhất bởi các giá trị bất thường (outliers)?],
  (
    [Khoảng biến thiên],
    [Phương sai],
    [Độ lệch chuẩn],
    True([Khoảng tứ phân vị])
  ),
  loigiai: [
    #step[Khoảng biến thiên, phương sai và độ lệch chuẩn đều phụ thuộc vào tất cả các giá trị của mẫu số liệu, đặc biệt rất nhạy cảm với đầu mút nên dễ bị nhiễu bởi các giá trị bất thường (outlier).]
    #step[Khoảng tứ phân vị $"IQR" = Q_3 - Q_1$ chỉ tập trung vào $50%$ dữ liệu ở giữa, do đó ít bị ảnh hưởng bởi các giá trị quá lớn hoặc quá nhỏ nằm ở hai biên.]
    #step[Vậy đáp án là D.]
      ]
)

// ─── CÂU 8 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Cho mẫu số liệu ghép nhóm về khối lượng với các nhóm được phân chia như sau: $[a; a+2), [a+2; a+4), [a+4; a+6), [a+6; a+8), [a+8; a+10)$ (trong đó $a > 0$). Khoảng biến thiên của mẫu số liệu này là:],
  (
    [$a+10$],
    True([$10$]),
    [$8$],
    [Không xác định được]
  ),
  loigiai: [
    #step[Nhóm đầu tiên là $[a; a+2)$ có đầu mút trái là $a$.]
    #step[Nhóm cuối cùng là $[a+8; a+10)$ có đầu mút phải là $a+10$.]
    #step[Khoảng biến thiên của mẫu số liệu ghép nhóm là $R = (a+10) - a = 10$.]
    #step[Vậy đáp án là B.]
      ]
)

// ─── CÂU 9 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Có mẫu số liệu ghép nhóm với tần số chứa tham số $m (m in ZZ^+)$ như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [$[0; 10)$], [$[10; 20)$], [$[20; 30)$], [$[30; 40)$], [$[40; 50)$],
        [*Tần số*], [5], [$m$], [12], [8], [5]
      )
    ]
    Tìm giá trị lớn nhất của $m$ để trung vị của mẫu số liệu rơi vào nhóm $[20; 30)$.],
  (
    [$18$],
    True([$19$]),
    [$20$],
    [$21$]
  ),
  loigiai: [
    #step[Tổng tần số (cỡ mẫu) là $n = 5 + m + 12 + 8 + 5 = 30 + m$.]
    #step[Trung vị ứng với giá trị tích lũy ở vị trí $(30+m)/2$.]
    #step[Tần số tích lũy đến hết nhóm 2 (trước nhóm 3) là $5 + m$.]
    #step[Để nhóm 3 là nhóm chứa trung vị thì tần số tích lũy trước nhóm 3 phải nhỏ hơn vị trí trung vị:]
    #step[$ 5 + m < (30+m)/2 arrow.r.double 10 + 2m < 30 + m arrow.r.double m < 20 $]
    #step[Đồng thời tần số tích lũy đến hết nhóm 3 phải lớn hơn hoặc bằng vị trí trung vị: $17 + m >= 15 + 0.5m$ (luôn đúng với $m > 0$).]
    #step[Vì $m$ là số nguyên dương lớn nhất thoả mãn $m < 20$ nên $m = 19$.]
    #step[Vậy đáp án là B.]
      ]
)

// ─── CÂU 10 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Cho mẫu số liệu $X$ có phương sai $S_x^2 = 4$. Lập mẫu số liệu mới $Y$ bằng cách biến đổi mỗi phần tử $x_i$ theo công thức $y_i = 3x_i - 5$. Độ lệch chuẩn $S_y$ của mẫu số liệu $Y$ là:],
  (
    [$4$],
    True([$6$]),
    [$7$],
    [$12$]
  ),
  loigiai: [
    #step[Ta có phương sai của $Y$ liên hệ với $X$ qua công thức $S_y^2 = a^2 S_x^2$ (khi $y_i = a x_i + b$).]
    #step[Ở đây $a = 3$, do đó $S_y^2 = 3^2 dot 4 = 36$.]
    #step[Độ lệch chuẩn của $Y$ là $S_y = sqrt(36) = 6$.]
    #step[Hoặc dùng công thức $S_y = |a| S_x = 3 dot 2 = 6$.]
    #step[Vậy đáp án là B.]
      ]
)

// ─── CÂU 11 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Một công ty có 100 nhân viên với số ngày nghỉ phép trung bình trong năm là $5$ ngày và phương sai là $4$. Cuối năm, có 2 nhân viên chuyển công tác, đặc biệt là cả 2 nhân viên này đều đã nghỉ đúng $5$ ngày phép trong năm qua. Phát biểu nào sau đây đúng về phương sai mới của 98 nhân viên còn lại?],
  (
    [Phương sai giảm],
    [Phương sai không đổi],
    True([Phương sai tăng lên]),
    [Không đủ dữ kiện để kết luận]
  ),
  loigiai: [
    #step[Số ngày nghỉ của 2 người bị loại bỏ bằng đúng số trung bình $5$, do đó tổng bình phương độ lệch của toàn mẫu $sum (x_i - overline(x))^2$ không thay đổi vì hai người này đóng góp $(5-5)^2 = 0$.]
    #step[Tuy nhiên, cỡ mẫu bị giảm từ $n=100$ xuống $n=98$.]
    #step[Phương sai được tính bằng cách chia tổng bình phương độ lệch cho cỡ mẫu. Vì mẫu số giảm nên phân số tăng lên, tức là phương sai tăng lên.]
    #step[Vậy đáp án là C.]
      ]
)

// ─── CÂU 12 ───
#my-tn(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 0,
  [Một trung tâm phân phối hàng hoá nhận thấy thời gian giao hàng có phương sai khá lớn. Họ quyết định loại bỏ toàn bộ dữ liệu của nhóm có thời gian giao hàng lâu nhất (nhóm cuối cùng). Việc làm này chắc chắn sẽ dẫn đến:],
  (
    [Tăng khoảng biến thiên],
    [Không thay đổi tứ phân vị thứ nhất $Q_1$],
    True([Làm giảm khoảng biến thiên]),
    [Tăng độ lệch chuẩn]
  ),
  loigiai: [
    #step[Việc loại bỏ nhóm có thời gian giao hàng lâu nhất tức là loại bỏ hoàn toàn đầu mút phải của tập dữ liệu.]
    #step[Điều này sẽ làm điểm lớn nhất của dữ liệu dịch chuyển sang bên trái, trong khi điểm nhỏ nhất không đổi. Do đó khoảng biến thiên chắc chắn giảm.]
    #step[Các giá trị khác như $Q_1$ hay độ lệch chuẩn có thể thay đổi nhưng khoảng biến thiên là thay đổi hiển nhiên và chắc chắn giảm.]
    #step[Vậy đáp án là C.]
      ]
)


// ─── CÂU 1 ───
#my-ds(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Thống kê thời gian hoàn thành một bài khảo sát (đơn vị: phút) của $100$ nhân viên trong công ty, ta có bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian*], [$[10; 20)$], [$[20; 30)$], [$[30; 40)$], [$[40; 50)$], [$[50; 60)$],
        [*Số nhân viên*], [5], [15], [40], [30], [10]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    [Tứ phân vị thứ nhất $Q_1$ nằm trong nhóm $[20; 30)$],
    [Thời gian hoàn thành trung bình của các nhân viên trong công ty là $34$ phút],
    [Khoảng tứ phân vị của mẫu số liệu ghép nhóm này lớn hơn $15$],
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm là $50$ phút])
  ),
  loigiai: [
    #step[Cỡ mẫu $n = 100$.]
    #step[a) Sai. $Q_1$ ứng với vị trí $n/4 = 25$. Tần số tích lũy của nhóm 1 là $5$, nhóm 2 là $20$, nhóm 3 là $60$. Vì $20 < 25 <= 60$ nên nhóm chứa $Q_1$ là $[30; 40)$.]
    #step[b) Sai. Số trung bình: $overline(x) = (5 dot 15 + 15 dot 25 + 40 dot 35 + 30 dot 45 + 10 dot 55)/100 = (75 + 375 + 1400 + 1350 + 550)/100 = 3750/100 = 37.5$ phút.]
    #step[c) Sai. $Q_1 = 30 + (25 - 20)/40 dot 10 = 31.25$. $Q_3$ ứng với vị trí $3n/4 = 75$. Tần số tích lũy đến nhóm 3 là $60$, đến nhóm 4 là $90$. Nhóm chứa $Q_3$ là $[40; 50)$. $Q_3 = 40 + (75 - 60)/30 dot 10 = 40 + 5 = 45$.]
    #step[Khoảng tứ phân vị $"IQR" = Q_3 - Q_1 = 45 - 31.25 = 13.75 < 15$.]
    #step[d) Đúng. Khoảng biến thiên là $R = 60 - 10 = 50$ phút.]
      ]
)

// ─── CÂU 2 ───
#my-ds(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Cho mẫu số liệu ghép nhóm về năng suất lao động của một bộ phận trong nhà máy có tần số phụ thuộc vào số nguyên dương $m$ như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Năng suất*], [$[0; 4)$], [$[4; 8)$], [$[8; 12)$], [$[12; 16)$], [$[16; 20)$],
        [*Tần số*], [$m$], [$2m$], [$4m$], [$2m$], [$m$]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Cỡ mẫu của số liệu này là $10m$]),
    True([Số trung bình cộng của mẫu số liệu hoàn toàn không phụ thuộc vào giá trị của tham số $m$]),
    [Nếu tham số $m$ tăng lên gấp đôi thì phương sai của mẫu số liệu cũng tăng lên gấp đôi],
    True([Độ lệch chuẩn của mẫu số liệu ghép nhóm trên lớn hơn $4.0$])
  ),
  loigiai: [
    #step[a) Đúng. Tổng tần số là cỡ mẫu $n = m + 2m + 4m + 2m + m = 10m$.]
    #step[b) Đúng. Số trung bình $overline(x) = (m dot 2 + 2m dot 6 + 4m dot 10 + 2m dot 14 + m dot 18)/(10m) = (100m)/(10m) = 10$. Biểu thức triệt tiêu $m$ nên không phụ thuộc vào $m$.]
    #step[c) Sai. Ta tính tổng bình phương: $sum f_i x_i^2 = m dot 4 + 2m dot 36 + 4m dot 100 + 2m dot 196 + m dot 324 = 1192m$.]
    #step[Phương sai: $S^2 = (1192m)/(10m) - 10^2 = 119.2 - 100 = 19.2$.]
    #step[Như vậy phương sai $S^2 = 19.2$ là một hằng số cố định, độc lập với $m$. Do đó $m$ có thay đổi thế nào thì phương sai vẫn không đổi.]
    #step[d) Đúng. Độ lệch chuẩn $S = sqrt(19.2) approx 4.38 > 4.0$.]
      ]
)

// ─── CÂU 3 ───
#my-ds(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Thống kê điểm bài kiểm tra giữa kì (thang điểm 15) của môn Toán và môn Tiếng Anh của cùng một lớp học ($40$ học sinh) thu được kết quả dạng bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm*], [$[0; 2)$], [$[2; 4)$], [$[4; 6)$], [$[6; 8)$], [$[8; 10)$],
        [*Môn Toán*], [2], [8], [20], [8], [2],
        [*Môn Tiếng Anh*], [10], [5], [10], [5], [10]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Độ lệch chuẩn điểm kiểm tra môn Tiếng Anh lớn hơn độ lệch chuẩn điểm môn Toán]),
    [Môn Tiếng Anh có mốt $M_o$ nằm trong nhóm $[4; 6)$],
    True([Khoảng tứ phân vị của điểm môn Tiếng Anh lớn hơn điểm môn Toán]),
    [Phương sai điểm môn Toán là $2.8$]
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm là $1, 3, 5, 7, 9$. Cả 2 môn đều có phân bố đối xứng và cỡ mẫu $n=40$ nên trung bình đều bằng $5$.]
    #step[a) Đúng. Biểu đồ tần số của Toán tập trung phần lớn ở giữa (nhóm $[4; 6)$), còn Tiếng Anh lại phân tán cực mạnh về hai đầu (nhóm điểm thấp và nhóm điểm cao). Do đó độ lệch chuẩn của môn Tiếng Anh chắc chắn lớn hơn.]
    #step[b) Sai. Môn Tiếng Anh có các nhóm chứa tần số cực đại là nhóm $[0; 2)$, $[4; 6)$ và $[8; 10)$ với cùng tần số là $10$. Mốt không duy nhất và có cả ở hai biên.]
    #step[c) Đúng. Ở môn Toán, đa số dữ liệu tụ ở khoảng giữa nên $Q_1, Q_3$ nằm sát nhau. Ở môn Tiếng Anh, phân tán xa nên $Q_1$ và $Q_3$ xa nhau, tạo ra khoảng tứ phân vị (IQR) rộng hơn.]
    #step[d) Sai. Phương sai môn Toán: $S^2 = (2(1) + 8(9) + 20(25) + 8(49) + 2(81))/40 - 5^2 = (2 + 72 + 500 + 392 + 162)/40 - 25 = 1128/40 - 25 = 28.2 - 25 = 3.2$. Không phải $2.8$.]
      ]
)

// ─── CÂU 4 ───
#my-ds(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Nhà quản lý muốn đánh giá độ tuổi của $50$ nhân viên. Tuy nhiên, có một lỗi ghi chép: một nhân viên được ghi nhầm từ tuổi thực là $25$ tuổi thành $55$ tuổi. Biết số trung bình tuổi sau khi đã sửa lỗi là $30$. Đánh giá ảnh hưởng của việc sửa lỗi này đến các đại lượng thống kê:],
  (
    True([Số trung bình của mẫu số liệu trước khi sửa lỗi lớn hơn số trung bình sau khi sửa lỗi]),
    True([Trước khi sửa lỗi, số trung bình của các nhân viên lớn hơn $30$]),
    [Việc sửa lỗi này chắc chắn làm giảm khoảng biến thiên của mẫu số liệu],
    [Việc sửa lỗi làm tăng phương sai của mẫu số liệu]
  ),
  loigiai: [
    #step[a) Đúng. Số liệu bị ghi nhầm là $55$ lớn hơn số liệu thực $25$. Do đó, số trung bình bị kéo cao lên một cách giả tạo, nên số trung bình trước khi sửa lỗi phải lớn hơn số trung bình sau khi sửa lỗi.]
    #step[b) Đúng. Gọi tổng tuổi đúng là $T$, ta có $T / 50 = 30 => T = 1500$. Tổng tuổi trước khi sửa lỗi là $T_"sai" = 1500 - 25 + 55 = 1530$. Trung bình trước sửa lỗi là $1530/50 = 30.6 > 30$.]
    #step[c) Sai. Chưa có đủ dữ kiện để khẳng định khoảng biến thiên giảm. Mặc dù $55$ lớn hơn $25$, nhưng nếu trong công ty có những người $60$ tuổi (đóng vai trò là Max thật sự), thì việc sửa từ $55$ về $25$ không làm đổi giá trị Max, và chưa chắc chạm ngưỡng Min.]
    #step[d) Sai. Việc có một điểm dữ liệu là $55$ (rất xa so với trung bình $30$) đóng góp một bình phương sai số cực kì lớn $(55-30.6)^2$. Khi trả nó về giá trị đúng $25$, nó gần trung bình hơn, làm giảm đi phương sai. Do đó việc sửa lỗi làm *giảm* phương sai, không phải làm tăng.]
      ]
)


// ─── CÂU 1 ───
#my-tln(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Khảo sát độ pH của các mẫu đất, người ta phân loại thành các nhóm theo bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Khoảng pH*], [$[0; 2)$], [$[2; 4)$], [$[4; 6)$], [$[6; 8)$], [$[8; 10)$],
        [*Số mẫu*], [$x$], [$8$], [$15$], [$12$], [$5$]
      )
    ]
    Biết độ pH trung bình của các mẫu đất là $5$. Tìm số lượng mẫu đất có độ pH thuộc nhóm $[0; 2)$.],
  [$7$],
  loigiai: [
    #step[Giá trị đại diện của các nhóm lần lượt là: $1, 3, 5, 7, 9$.]
    #step[Tổng tần số (cỡ mẫu): $n = x + 8 + 15 + 12 + 5 = x + 40$.]
    #step[Phương trình số trung bình cộng: $(x dot 1 + 8 dot 3 + 15 dot 5 + 12 dot 7 + 5 dot 9)/(x + 40) = 5$.]
    #step[Ta có: $x + 24 + 75 + 84 + 45 = 5(x + 40)$.]
    #step[$x + 228 = 5x + 200 => 4x = 28 => x = 7$.]
    #step[Đáp số: $7$.]
      ]
)

// ─── CÂU 2 ───
#my-tln(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Để nghiên cứu chất lượng sống của cư dân, người ta đo lường một chỉ số hạnh phúc ghép nhóm trên một mẫu có $n=40$. Qua các phép thống kê, người ta tổng hợp được hai đại lượng quan trọng: $sum_{i=1}^k f_i x_i = 200$ và tổng các bình phương độ lệch $sum_{i=1}^k f_i (x_i - overline(x))^2 = 380$. Hãy tính độ lệch chuẩn của mẫu số liệu ghép nhóm này (làm tròn kết quả đến hàng phần mười).],
  [$3.1$],
  loigiai: [
    #step[Phương sai được định nghĩa là trung bình cộng của bình phương các độ lệch so với trung bình.]
    #step[Tức là $S^2 = 1/n sum_{i=1}^k f_i (x_i - overline(x))^2 = 380/40 = 9.5$.]
    #step[Độ lệch chuẩn: $S = sqrt(9.5) approx 3.082$.]
    #step[Làm tròn đến hàng phần mười, ta được $3.1$.]
    #step[Đáp số: $3.1$.]
      ]
)

// ─── CÂU 3 ───
#my-tln(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Cho một mẫu số liệu ghép nhóm có tổng cỡ mẫu $n = 100$. Biết rằng tứ phân vị thứ ba $Q_3$ rơi vào nhóm $[10; 15)$ và tần số của riêng nhóm này là $40$. Tần số tích lũy của nhóm liền trước nhóm chứa $Q_3$ bằng $50$. Tính tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hai chữ số thập phân).],
  [$13.13$],
  loigiai: [
    #step[Vị trí của tứ phân vị thứ ba là: $(3n)/4 = (3 dot 100)/4 = 75$.]
    #step[Áp dụng công thức tứ phân vị thứ ba vào nhóm $[10; 15)$ có đầu mút trái $u_j = 10$, độ dài $h = 5$, tần số $f_j = 40$ và tần số tích lũy trước đó là $c f_{j-1} = 50$.]
    #step[$Q_3 = u_j + ((3n)/4 - c f_{j-1})/f_j dot h = 10 + (75 - 50)/40 dot 5 = 10 + 25/40 dot 5 = 10 + 3.125 = 13.125$.]
    #step[Làm tròn đến 2 chữ số thập phân ta được $13.13$.]
    #step[Đáp số: $13.13$.]
      ]
)

// ─── CÂU 4 ───
#my-tln(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Giám đốc của một tập đoàn có hai chi nhánh độc lập A và B muốn báo cáo tổng hợp. Chi nhánh A có $40$ nhân viên với năng suất trung bình $overline(x)_A = 10$ và phương sai $S_A^2 = 5$. Chi nhánh B có $60$ nhân viên với năng suất trung bình $overline(x)_B = 15$ và phương sai $S_B^2 = 8$. Nếu tập hợp toàn bộ dữ liệu của $100$ nhân viên từ hai chi nhánh, hãy tính phương sai của mẫu dữ liệu gộp chung này.],
  [$12.8$],
  loigiai: [
    #step[Số trung bình cộng chung: $overline(x)_"gộp" = (40 dot 10 + 60 dot 15)/100 = (400 + 900)/100 = 13$.]
    #step[Từ phương sai nhóm A: $S_A^2 = (sum x_A^2)/40 - overline(x)_A^2 => 5 = (sum x_A^2)/40 - 100 => sum x_A^2 = 40 dot 105 = 4200$.]
    #step[Từ phương sai nhóm B: $S_B^2 = (sum x_B^2)/60 - overline(x)_B^2 => 8 = (sum x_B^2)/60 - 225 => sum x_B^2 = 60 dot 233 = 13980$.]
    #step[Tổng bình phương toàn mẫu: $sum x_"gộp"^2 = 4200 + 13980 = 18180$.]
    #step[Phương sai gộp: $S_"gộp"^2 = 18180/100 - 13^2 = 181.8 - 169 = 12.8$.]
    #step[Đáp số: $12.8$.]
      ]
)

// ─── CÂU 5 ───
#my-tln(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Bảng phân bố tần số ghép nhóm thống kê số đơn hàng được giao thành công trong ngày của một số nhân viên giao hàng:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Số đơn hàng*], [$[0; 4)$], [$[4; 8)$], [$[8; 12)$], [$[12; 16)$], [$[16; 20)$],
        [*Số nhân viên*], [1], [2], [4], [2], [1]
      )
    ]
    Hãy tính chính xác phương sai của mẫu số liệu ghép nhóm này.],
  [$19.2$],
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $x_1=2, x_2=6, x_3=10, x_4=14, x_5=18$. Tần số $f_1=1, f_2=2, f_3=4, f_4=2, f_5=1$. Tổng $n=10$.]
    #step[Trung bình cộng: $overline(x) = (1 dot 2 + 2 dot 6 + 4 dot 10 + 2 dot 14 + 1 dot 18)/10 = (2 + 12 + 40 + 28 + 18)/10 = 100/10 = 10$.]
    #step[Tổng bình phương: $sum f_i x_i^2 = 1 dot 4 + 2 dot 36 + 4 dot 100 + 2 dot 196 + 1 dot 324 = 4 + 72 + 400 + 392 + 324 = 1192$.]
    #step[Phương sai: $S^2 = 1192/10 - 10^2 = 119.2 - 100 = 19.2$.]
    #step[Đáp số: $19.2$.]
      ]
)

// ─── CÂU 6 ───
#my-tln(de: "Đề 4 (Nâng cao)", 
  
  dir: "doc",lines: 2,
  [Tần số của một bảng số liệu ghép nhóm được biểu diễn qua tham số $a (a > 0)$ như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [$[0; 5)$], [$[5; 10)$], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$],
        [*Tần số*], [$a$], [$2a$], [$4a$], [$2a$], [$a$]
      )
    ]
    Bằng mọi giá trị dương của $a$, hãy tính khoảng tứ phân vị của mẫu số liệu ghép nhóm này.],
  [$7.5$],
  loigiai: [
    #step[Cỡ mẫu $n = a + 2a + 4a + 2a + a = 10a$.]
    #step[Vị trí $Q_1$ là $n/4 = 2.5a$. Tần số tích lũy của nhóm 1 là $a$, nhóm 2 là $3a$. Vì $a < 2.5a <= 3a$ nên $Q_1$ thuộc nhóm $[5; 10)$.]
    #step[Ta có: $Q_1 = 5 + (2.5a - a)/(2a) dot 5 = 5 + 1.5/2 dot 5 = 8.75$.]
    #step[Vị trí $Q_3$ là $3n/4 = 7.5a$. Tần số tích lũy đến nhóm 3 là $7a$, đến nhóm 4 là $9a$. Vì $7a < 7.5a <= 9a$ nên $Q_3$ thuộc nhóm $[15; 20)$.]
    #step[Ta có: $Q_3 = 15 + (7.5a - 7a)/(2a) dot 5 = 15 + 0.5/2 dot 5 = 16.25$.]
    #step[Khoảng tứ phân vị $"IQR" = Q_3 - Q_1 = 16.25 - 8.75 = 7.5$. Kết quả hoàn toàn độc lập với $a$.]
    #step[Đáp số: $7.5$.]
      ]
)
