// ==============================================================================
// KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN — MÔN TOÁN 11 (CẢ NĂM HK1 & HK2)
// TRƯỜNG THPT NGUYỄN HỮU CẢNH — NĂM HỌC 2025 - 2026
// GV: Nguyễn Văn Sang | Lớp giảng dạy: 11B5, 11B15
// ==============================================================================

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 1.8cm, bottom: 1.8cm, left: 1.5cm, right: 1.2cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: gray.darken(30%), style: "italic")
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [Kế hoạch giáo dục 2025-2026 - Môn Toán 11],
        [GV: Nguyễn Văn Sang]
      )
      #v(-0.5em)#line(length: 100%, stroke: 0.4pt + gray)
    ]
  },
  footer: context [
    #set text(size: 10pt)
    #align(center)[#counter(page).display("1")]
  ]
)

#set text(
  font: ("Times New Roman"),
  size: 11.5pt,
  lang: "vi",
)

#set par(leading: 0.55em, justify: false)

// --- PHẦN TIÊU NGỮ ---
#grid(
  columns: (1.1fr, 1fr),
  align: (left, center),
  [
    #text(weight: "bold")[TRƯỜNG: THPT NGUYỄN HỮU CẢNH] \
    #text(weight: "bold")[TỔ: Toán] \
    #text(style: "italic")[Họ và tên giáo viên: Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold")[CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM] \
    #text(weight: "bold")[Độc lập - Tự do - Hạnh phúc] \
    #v(-0.4em)#line(length: 135pt, stroke: 0.8pt)
  ]
)

#v(1.0em)

#align(center)[
  #text(weight: "bold", size: 13.5pt)[KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN] \
  #v(0.2em)
  #text(weight: "bold", size: 12pt)[(Năm học 2025 - 2026)]
]

#v(0.8em)

// --- I. THÔNG TIN CÁ NHÂN ---
#text(weight: "bold", size: 12pt)[I. THÔNG TIN CÁ NHÂN]
#list(
  [Họ và tên: Nguyễn Văn Sang #h(2em) | #h(2em) Năm sinh: 1987],
  [Năm vào ngành: 2010 #h(2em) | #h(2em) Chức vụ: Giáo viên],
  [Giảng dạy: Toán #h(2em) | #h(2em) Công tác kiêm nhiệm: Không],
  [Lớp giảng dạy: *11B5, 11B15, 12C1, 12C9*.],
)

#v(0.4em)

// --- II. KẾ HOẠCH CÁ NHÂN ---
#text(weight: "bold", size: 12pt)[II. KẾ HOẠCH CÁ NHÂN] \
#v(0.2em)
#text(weight: "bold")[1. Những căn cứ xây dựng kế hoạch]
#list(
  marker: "-",
  [Công văn 4612/BGDĐT-GDTrH ngày 03/10/2017 về hướng dẫn chương trình GDPT.],
  [Quyết định số 3089/QĐ-UBND ngày 08/8/2025 của UBND TP. Hồ Chí Minh.],
  [Văn bản số 4977/SGDĐT-GDTrH ngày 13/8/2025 của Sở Giáo dục và Đào tạo TP. HCM.],
  [Kế hoạch số 4818/KH-SGDĐT ngày 07/8/2025 về bồi dưỡng thường xuyên.],
  [Căn cứ vào năng lực cá nhân và yêu cầu nhiệm vụ được giao.],
)

#text(weight: "bold")[2. Mục tiêu chung] \
- Hoàn thành tốt nhiệm vụ được giao. Đáp ứng Chuẩn nghề nghiệp, phát triển bản thân.

#v(0.3em)
#text(weight: "bold")[3. Nội dung] \
*3.1. Đặc điểm tình hình:* \
- _Thuận lợi:_ Có tinh thần trách nhiệm cao, nhiệt tình. Trình độ chuyên môn vững vàng, ứng dụng tốt CNTT. \
- _Khó khăn:_ CSVC còn thiếu thốn. Cả 3 khối 10, 11, 12 đều học chương trình mới nên nhiều thứ cần chuẩn bị.

*3.1.2 Công việc được giao:* \
Giảng dạy môn Toán các lớp: *11B5, 11B15*.

*3.2.2 Giáo dục đạo đức, tư tưởng:* \
Giáo dục HS lòng yêu nước, tôn trọng pháp luật, nhân ái và tự trọng.

#pagebreak()

// --- III. PHÂN PHỐI CHƯƠNG TRÌNH CHI TIẾT ---
#text(weight: "bold", size: 12.5pt)[III. KẾ HOẠCH DẠY HỌC (PHÂN PHỐI CHƯƠNG TRÌNH)] \
#v(0.2em)
#text(weight: "bold", size: 12pt)[HỌC KỲ I]
#v(0.4em)

#table(
  columns: (1.3cm, 0.6cm, 1.8fr, 0.6cm, 1.8fr, 0.6cm, 1.2fr),
  stroke: 0.5pt + black,
  inset: (x: 4.5pt, y: 5.5pt),
  align: (
    center + horizon,
    center + horizon,
    left + top,
    center + horizon,
    left + top,
    center + horizon,
    left + top,
  ),
  fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else { none },

  // Row 1
  [*Tuần*],
  [*T*],
  [*ĐS-GT-TK*],
  [*T*],
  [*HHKG*],
  [*T*],
  [*Chuyên đề*],

  // Row 2
  table.cell(rowspan: 2)[*1* \ (8/9-- \ 14/9)],
  [1],
  [*Góc lượng giác. Giá trị lượng giác.* \ _Yêu cầu:_ Nhận biết khái niệm góc LG, số đo, hệ thức Chasles, đường tròn LG. Sử dụng Casio tính giá trị LG.],
  table.cell(rowspan: 2)[1],
  table.cell(rowspan: 2)[*Điểm, đường thẳng, mặt phẳng.* \ _Yêu cầu:_ Nhận biết quan hệ liên thuộc; 3 cách xác định mặt phẳng; tìm giao tuyến, giao điểm.],
  table.cell(rowspan: 2)[1],
  table.cell(rowspan: 2)[*Phép biến hình và dời hình.* \ _Yêu cầu:_ Nhận biết khái niệm phép dời hình, tính chất các phép đối xứng, tịnh tiến.],

  // Row 3
  [2],
  [(Tiếp theo)],

  // Row 4
  table.cell(rowspan: 2)[*2* \ (15/9-- \ 21/9)],
  [3],
  [*Công thức lượng giác.* \ _Yêu cầu:_ Mô tả CT cộng, nhân đôi, biến đổi tích thành tổng, tổng thành tích. Giải quyết vấn đề thực tiễn.],
  table.cell(rowspan: 2)[2],
  table.cell(rowspan: 2)[Điểm, đường thẳng và mặt phẳng (tiếp).],
  table.cell(rowspan: 2)[2],
  table.cell(rowspan: 2)[Phép biến hình và dời hình (tiếp).],

  // Row 5
  [4],
  [(Tiếp theo)],

  // Row 6
  table.cell(rowspan: 2)[*3* \ (22/9-- \ 28/9)],
  [5],
  [*Hàm số lượng giác và đồ thị.* \ _Yêu cầu:_ Nhận biết hàm chẵn, lẻ, tuần hoàn. Vẽ đồ thị $sin, cos, tan, cot$. Giải thích tập xác định, tập giá trị, chu kỳ.],
  table.cell(rowspan: 2)[3],
  table.cell(rowspan: 2)[Điểm, đường thẳng và mặt phẳng (tiếp).],
  table.cell(rowspan: 2)[3],
  table.cell(rowspan: 2)[Phép tịnh tiến.],

  // Row 7
  [6],
  [(Tiếp theo)],

  // Row 8
  table.cell(rowspan: 2)[*4* \ (29/9-- \ 5/10)],
  [7],
  [*Phương trình lượng giác cơ bản.* \ _Yêu cầu:_ Nhận biết CT nghiệm $sin x = m, cos x = m...$ Tính nghiệm gần đúng bằng máy tính.],
  table.cell(rowspan: 2)[4],
  table.cell(rowspan: 2)[Điểm, đường thẳng và mặt phẳng (tiếp).],
  table.cell(rowspan: 2)[4],
  table.cell(rowspan: 2)[Phép tịnh tiến.],

  // Row 9
  [8],
  [(Tiếp theo)],

  // Row 10
  table.cell(rowspan: 2)[*5* \ (6/10-- \ 12/10)],
  [9],
  [Bài tập cuối chương I. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX1]],
  table.cell(rowspan: 2)[5],
  table.cell(rowspan: 2)[*Hai đường thẳng song song.* \ _Yêu cầu:_ Nhận biết vị trí tương đối (trùng, song song, cắt, chéo).],
  table.cell(rowspan: 2)[5],
  table.cell(rowspan: 2)[Phép đối xứng trục.],

  // Row 11
  [10],
  [],

  // Row 12
  table.cell(rowspan: 2)[*9* \ (3/11-- \ 9/11)],
  [17],
  [*Giới hạn của dãy số.* \ _Yêu cầu:_ Nhận biết khái niệm giới hạn. Giải thích giới hạn cơ bản: $lim 1/n^k, lim q^n$. Tính tổng CSN lùi vô hạn.],
  table.cell(rowspan: 2)[9],
  table.cell(rowspan: 2)[*Hai mặt phẳng song song.* \ _Yêu cầu:_ Điều kiện 2 mặt phẳng song song, định lý Thalès không gian, hình lăng trụ, hình hộp.],
  table.cell(rowspan: 2)[9],
  table.cell(rowspan: 2)[Phép quay.],

  // Row 13
  [18],
  [(Tiếp theo)],

  // Row 14
  table.cell(rowspan: 2)[*11* \ (17/11-- \ 23/11)],
  [21],
  [*Hàm số liên tục.* #text(fill: rgb("#dc2626"), weight: "bold")[KTTX3] \ _Yêu cầu:_ Nhận dạng hàm số liên tục tại điểm, trên khoảng. Xét tính liên tục của hàm sơ cấp.],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[*Phép chiếu song song.* \ _Yêu cầu:_ Nhận biết khái niệm, tính chất phép chiếu. Vẽ hình biểu diễn khối đơn giản.],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[Phép vị tự.],

  // Row 15
  [22],
  [(Tiếp theo)],

  // Row 16
  table.cell(rowspan: 2)[*17* \ (30/12-- \ 4/1)],
  [29],
  [*Số trung bình và mốt mẫu ghép nhóm.* \ _Yêu cầu:_ Tính trung bình, trung vị, tứ phân vị, mốt. Hiểu ý nghĩa đặc trưng đo xu thế trung tâm.],
  table.cell(rowspan: 2)[31],
  table.cell(rowspan: 2)[Trung vị và tứ phân vị của mẫu số liệu ghép nhóm.],
  table.cell(rowspan: 2)[15],
  table.cell(rowspan: 2)[Bài tập cuối chuyên đề 1.],

  // Row 17
  [30],
  [(Tiếp theo)],

  // Row 18
  table.cell(rowspan: 2)[*18* \ (5/1-- \ 11/1)],
  [32],
  [Trung vị và tứ phân vị (tiếp).],
  [34],
  [Thực hành Geogebra.],
  table.cell(rowspan: 2)[16],
  table.cell(rowspan: 2)[#text(fill: rgb("#dc2626"), weight: "bold")[KTTX5] \ BT cuối chuyên đề 1.],

  // Row 19
  [33],
  [Bài tập cuối chương V.],
  [35],
  [Dự báo dân số bằng CSN.],
)

#v(1.0em)
#text(weight: "bold", size: 12pt)[HỌC KỲ II]
#v(0.4em)

#table(
  columns: (1.3cm, 0.6cm, 1.8fr, 0.6cm, 1.8fr, 0.6cm, 1.2fr),
  stroke: 0.5pt + black,
  inset: (x: 4.5pt, y: 5.5pt),
  align: (
    center + horizon,
    center + horizon,
    left + top,
    center + horizon,
    left + top,
    center + horizon,
    left + top,
  ),
  fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else { none },

  // Row 1
  [*Tuần*],
  [*T*],
  [*ĐS-GT*],
  [*T*],
  [*HHKG*],
  [*T*],
  [*Chuyên đề*],

  // Row 2
  table.cell(rowspan: 2)[*1* \ (19/1-- \ 25/1)],
  [1],
  [*Phép tính lũy thừa.* \ _Yêu cầu:_ Nhận biết lũy thừa với số mũ nguyên, hữu tỉ, thực. Giải thích các tính chất và tính giá trị biểu thức.],
  table.cell(rowspan: 2)[1],
  table.cell(rowspan: 2)[*Hai đường thẳng vuông góc.* \ _Yêu cầu:_ Nhận biết góc giữa hai đường thẳng; chứng minh hai đường thẳng vuông góc.],
  table.cell(rowspan: 2)[1],
  table.cell(rowspan: 2)[*Đồ thị.* \ _Yêu cầu:_ Nhận biết đường đi Euler, Hamilton.],

  // Row 3
  [2],
  [(Tiếp theo)],

  // Row 4
  table.cell(rowspan: 2)[*2* \ (26/1-- \ 1/2)],
  [3],
  [*Phép tính logarit.* \ _Yêu cầu:_ Nhận biết logarit cơ số $a$. Sử dụng tính chất logarit để rút gọn biểu thức và tính bằng máy tính.],
  table.cell(rowspan: 2)[2],
  table.cell(rowspan: 2)[*Đường thẳng vuông góc mặt phẳng.* \ _Yêu cầu:_ Xác định điều kiện vuông góc. Tính thể tích hình chóp, lăng trụ.],
  table.cell(rowspan: 2)[2],
  table.cell(rowspan: 2)[Đồ thị (tiếp).],

  // Row 5
  [4],
  [(Tiếp theo)],

  // Row 6
  table.cell(rowspan: 2)[*3* \ (2/2-- \ 8/2)],
  [5],
  [*Hàm số mũ - Hàm số logarit.* \ _Yêu cầu:_ Nhận dạng và vẽ đồ thị hàm số mũ, logarit. Giải quyết bài toán thực tế.],
  table.cell(rowspan: 2)[3],
  table.cell(rowspan: 2)[Đường thẳng vuông góc mặt phẳng (tiếp).],
  table.cell(rowspan: 2)[3],
  table.cell(rowspan: 2)[Đường đi Euler và Hamilton.],

  // Row 7
  [6],
  [(Tiếp theo)],

  // Row 8
  table.cell(rowspan: 2)[*4* \ (9/2-- \ 15/2)],
  [7],
  [*PT, bất PT mũ và logarit. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX1]* \ _Yêu cầu:_ Giải các phương trình, bất phương trình ở dạng đơn giản.],
  table.cell(rowspan: 2)[4],
  table.cell(rowspan: 2)[Đường thẳng vuông góc mặt phẳng (tiếp).],
  table.cell(rowspan: 2)[4],
  table.cell(rowspan: 2)[Đường đi Euler và Hamilton (tiếp).],

  // Row 9
  [8],
  [(Tiếp theo)],

  // Row 10
  table.cell(rowspan: 2)[*5* \ (23/2-- \ 1/3)],
  [9],
  [*Ôn tập chương 6.* \ _Yêu cầu:_ Tổng hợp kiến thức về mũ, logarit. Giải bài toán độ pH, độ rung chấn.],
  table.cell(rowspan: 2)[5],
  table.cell(rowspan: 2)[*Hai mặt phẳng vuông góc.* \ _Yêu cầu:_ Nhận biết 2 mặt phẳng vuông góc; tính chất lăng trụ đứng, hình hộp.],
  table.cell(rowspan: 2)[5],
  table.cell(rowspan: 2)[Bài toán tìm đường đi ngắn nhất.],

  // Row 11
  [10],
  [(Tiếp theo)],

  // Row 12
  table.cell(rowspan: 2)[*6* \ (2/3-- \ 8/3)],
  [11],
  [*Đạo hàm. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX2]* \ _Yêu cầu:_ Định nghĩa đạo hàm, ý nghĩa hình học (tiếp tuyến), vận dụng tính vận tốc, gia tốc.],
  table.cell(rowspan: 2)[6],
  table.cell(rowspan: 2)[Hai mặt phẳng vuông góc (tiếp).],
  table.cell(rowspan: 2)[6],
  table.cell(rowspan: 2)[Bài toán tìm đường đi ngắn nhất (tiếp).],

  // Row 13
  [12],
  [(Tiếp theo)],

  // Row 14
  table.cell(colspan: 7, fill: rgb("#fef3c7"), align: center)[#text(weight: "bold")[KIỂM TRA GIỮA HỌC KỲ 2 (90 phút)]],

  // Row 15
  table.cell(rowspan: 2)[*8* \ (16/3-- \ 22/3)],
  [15],
  [*Các quy tắc đạo hàm.* \ _Yêu cầu:_ Tính đạo hàm của tổng, hiệu, tích, thương, hàm hợp. Đạo hàm cấp hai.],
  table.cell(rowspan: 2)[8],
  table.cell(rowspan: 2)[*Khoảng cách trong không gian.* \ _Yêu cầu:_ Khoảng cách từ điểm đến đường, mặt; khoảng cách giữa 2 đường chéo nhau.],
  table.cell(rowspan: 2)[8],
  table.cell(rowspan: 2)[BT cuối chuyên đề 2. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX5]],

  // Row 16
  [16],
  [(Tiếp theo)],

  // Row 17
  table.cell(rowspan: 2)[*10* \ (31/3-- \ 5/4)],
  [19],
  [*Bài tập chương 7. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX3]*],
  table.cell(rowspan: 2)[10],
  table.cell(rowspan: 2)[*Góc giữa đường và mặt; Góc nhị diện.* \ _Yêu cầu:_ Xác định góc, số đo góc nhị diện đơn giản.],
  table.cell(rowspan: 2)[10],
  table.cell(rowspan: 2)[Hình biểu diễn của một hình, khối.],

  // Row 18
  [20],
  [(Tiếp theo)],

  // Row 19
  table.cell(rowspan: 2)[*11* \ (6/4-- \ 12/4)],
  [21],
  [*Biến cố giao và quy tắc nhân xác suất.* \ _Yêu cầu:_ Quy tắc cộng, nhân xác suất cho biến cố độc lập.],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[Ôn tập học kỳ 2.],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[Bản vẽ kỹ thuật.],

  // Row 20
  [22],
  [(Tiếp theo)],

  // Row 21
  table.cell(colspan: 7, fill: rgb("#fef3c7"), align: center)[#text(weight: "bold")[KIỂM TRA CUỐI HỌC KỲ 2 (TẬP TRUNG) - 90 phút]],

  // Row 22
  table.cell(rowspan: 2)[*15* \ (5/5-- \ 10/5)],
  table.cell(rowspan: 2)[23],
  table.cell(rowspan: 2)[*Ứng dụng logarit đo độ pH của dung dịch.*],
  [13],
  [Vẽ hình khối bằng phần mềm Geogebra.],
  table.cell(rowspan: 2)[13],
  table.cell(rowspan: 2)[BT cuối chuyên đề 3.],

  // Row 23
  [14],
  [Làm kính 3D để quan sát.],

  // Row 24
  table.cell(rowspan: 2)[*16* \ (11/5-- \ 17/5)],
  table.cell(rowspan: 2)[24],
  table.cell(rowspan: 2)[(Tiếp theo thực hành pH)],
  [15],
  [Vẽ hình khối bằng Geogebra (tiếp).],
  table.cell(rowspan: 2)[14],
  table.cell(rowspan: 2)[BT cuối chuyên đề 3 (tiếp).],

  // Row 25
  [16],
  [],

  // Row 26
  [*17*],
  [[\*]],
  [*Luyện tập tổng hợp*],
  [[\*]],
  [*Luyện tập tổng hợp*],
  [[\*]],
  [*Luyện tập tổng hợp*],
)

#v(1.5em)
// --- CHỮ KÝ ---
#grid(
  columns: (1fr, 1fr, 1.2fr),
  align: (center, center, center),
  [
    #text(weight: "bold", size: 11pt)[GIÁO VIÊN] \
    #text(style: "italic", size: 9.5pt)[(Ký, ghi rõ họ tên)]
    
    #v(3.8em)
    #text(weight: "bold", size: 11pt)[Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold", size: 11pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 9.5pt)[(Ký, ghi rõ họ tên)]
    #v(3.8em)
    #text(weight: "bold", size: 11pt)[Đỗ Thị Bạch Lan]
  ],
  [
    #text(style: "italic", size: 9.5pt)[Tp. HCM, ngày 05 tháng 09 năm 2025] \
    #text(weight: "bold", size: 11pt)[P. HIỆU TRƯỞNG] \
    #text(style: "italic", size: 9.5pt)[(Ký, ghi rõ họ tên)]
    #v(3.8em)
    #text(weight: "bold", size: 11pt)[...........................................]
  ]
)
