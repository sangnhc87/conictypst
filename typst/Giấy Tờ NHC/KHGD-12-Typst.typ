// ==============================================================================
// KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN — MÔN TOÁN 12
// TRƯỜNG THPT NGUYỄN HỮU CẢNH — NĂM HỌC 2025 - 2026
// GV: Nguyễn Văn Sang | Lớp: 12C1, 12C9
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
        [Kế hoạch giáo dục 2025-2026 - Môn Toán 12],
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
    #text(weight: "bold")[Họ và tên giáo viên: Nguyễn Văn Sang]
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
Giảng dạy môn Toán các lớp: *12C1, 12C9*.

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
  [*Giải tích*],
  [*T*],
  [*HH và Đo lường*],
  [*T*],
  [*Chuyên đề*],

  // Row 2
  table.cell(rowspan: 2)[*1* \ (8/9-- \ 14/9)],
  [1],
  [*Tính đơn điệu và cực trị của hàm số.* \ _Yêu cầu:_ Nhận biết tính đơn điệu dựa vào đạo hàm; thể hiện qua BBT; nhận biết điểm cực trị; ứng dụng tối ưu hóa lợi nhuận, quỹ đạo bay.],
  table.cell(rowspan: 2)[1],
  table.cell(rowspan: 2)[*Vectơ và các phép toán trong không gian.* \ _Yêu cầu:_ Nhận biết vectơ, các phép toán (tổng, hiệu, tích vô hướng). Tính và chứng minh đẳng thức.],
  table.cell(rowspan: 2)[1],
  table.cell(rowspan: 2)[*Bài toán quy hoạch tuyến tính.* \ _Yêu cầu:_ Giải bài toán quy hoạch tuyến tính bằng hệ BPT bậc nhất.],

  // Row 3
  [2],
  [Tính đơn điệu và cực trị (tiếp).],

  // Row 4
  table.cell(rowspan: 2)[*2* \ (15/9-- \ 21/9)],
  [3],
  [*Tính đơn điệu và cực trị (tiếp).* \ _Yêu cầu:_ Vận dụng giải các bài toán liên quan.],
  table.cell(rowspan: 2)[2],
  table.cell(rowspan: 2)[Vectơ và các phép toán (tiếp).],
  table.cell(rowspan: 2)[2],
  table.cell(rowspan: 2)[Bài toán quy hoạch tuyến tính (tiếp).],

  // Row 5
  [4],
  [Tính đơn điệu và cực trị (tiếp).],

  // Row 6
  table.cell(rowspan: 2)[*3* \ (22/9-- \ 28/9)],
  [5],
  [*Tính đơn điệu và cực trị (tiếp).* \ *GTLN & GTNN của hàm số.* \ _Yêu cầu:_ Xác định GTLN, GTNN trên tập cho trước bằng đạo hàm. Ứng dụng thực tiễn.],
  table.cell(rowspan: 2)[3],
  table.cell(rowspan: 2)[Vectơ và các phép toán (tiếp).],
  table.cell(rowspan: 2)[3],
  table.cell(rowspan: 2)[Bài toán quy hoạch tuyến tính (tiếp).],

  // Row 7
  [6],
  [GTLN & GTNN (tiếp).],

  // Row 8
  table.cell(rowspan: 2)[*4* \ (29/9-- \ 5/10)],
  [7],
  [*GTLN & GTNN của hàm số. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX1]* \ _Yêu cầu:_ Giải bài tập vận dụng.],
  table.cell(rowspan: 2)[4],
  table.cell(rowspan: 2)[Vectơ và các phép toán (tiếp).],
  table.cell(rowspan: 2)[4],
  table.cell(rowspan: 2)[*Vận dụng đạo hàm giải bài toán tối ưu.* \ _Yêu cầu:_ Giải bài toán thực tế (khoảng cách, thời gian, kinh tế).],

  // Row 9
  [8],
  [GTLN & GTNN (tiếp).],

  // Row 10
  table.cell(rowspan: 2)[*5* \ (6/10-- \ 12/10)],
  [9],
  [*Đường tiệm cận của đồ thị hàm số.* \ _Yêu cầu:_ Nhận biết hình ảnh tiệm cận ngang, đứng, xiên. Biết cách tìm tiệm cận. Giải quyết bài toán thực tế.],
  table.cell(rowspan: 2)[5],
  table.cell(rowspan: 2)[*Tọa độ của vectơ trong không gian.* \ _Yêu cầu:_ Nhận biết tọa độ vectơ đối với hệ trục tọa độ. Xác định độ dài vectơ; biểu thức tọa độ các phép toán. Vận dụng vào thực tiễn.],
  table.cell(rowspan: 2)[5],
  table.cell(rowspan: 2)[*Vận dụng đạo hàm giải bài toán tối ưu.* \ _Yêu cầu:_ Giải bài toán thực tế tìm GTLN, GTNN trong kinh tế, kỹ thuật.],

  // Row 11
  [10],
  [Đường tiệm cận (tiếp).],

  // Row 12
  table.cell(rowspan: 2)[*6* \ (13/10-- \ 19/10)],
  [11],
  [*Khảo sát và vẽ đồ thị hàm số cơ bản.* \ _Yêu cầu:_ Mô tả sơ đồ tổng quát khảo sát hàm số. Khảo sát các hàm $y=a x^3+b x^2+c x+d$, $y=(a x+b)/(c x+d)$, $y=(a x^2+b x+c)/(m x+n)$. Nhận biết tính đối xứng.],
  table.cell(rowspan: 2)[6],
  table.cell(rowspan: 2)[Tọa độ của vectơ trong không gian. \ _Yêu cầu:_ Vận dụng định nghĩa tọa độ vectơ để giải các bài toán hình học cơ bản.],
  table.cell(rowspan: 2)[6],
  table.cell(rowspan: 2)[Vận dụng đạo hàm giải bài toán tối ưu. \ _Yêu cầu:_ Giải bài toán thực tế liên quan đến chi phí, doanh thu.],

  // Row 13
  [12],
  [Khảo sát và vẽ đồ thị (tiếp).],

  // Row 14
  table.cell(rowspan: 2)[*7* \ (20/10-- \ 26/10)],
  [13],
  [Khảo sát và vẽ đồ thị (tiếp). \ _Yêu cầu:_ Rèn luyện kỹ năng vẽ đồ thị và nhận dạng đồ thị hàm số.],
  table.cell(rowspan: 2)[7],
  table.cell(rowspan: 2)[Tọa độ của vectơ trong không gian. \ _Yêu cầu:_ Tính khoảng cách, góc trong không gian bằng tọa độ.],
  table.cell(rowspan: 2)[7],
  table.cell(rowspan: 2)[Vận dụng đạo hàm giải bài toán tối ưu. \ _Yêu cầu:_ Tổng hợp các bài toán vận dụng cao về cực trị thực tế.],

  // Row 15
  [14],
  [Khảo sát và vẽ đồ thị (tiếp).],

  // Row 16
  table.cell(rowspan: 2)[*8* \ (27/10-- \ 2/11)],
  [15],
  [*Bài tập cuối chương I.*],
  table.cell(rowspan: 2)[8],
  table.cell(rowspan: 2)[Tọa độ của vectơ trong không gian. \ #text(fill: rgb("#dc2626"), weight: "bold")[KTTX2]],
  table.cell(rowspan: 2)[8],
  table.cell(rowspan: 2)[*Bài tập cuối chuyên đề 1.*],

  // Row 17
  [16],
  [Bài tập cuối chương I (tiếp).],

  // Row 18
  table.cell(colspan: 7, fill: rgb("#fef3c7"), align: center)[#text(weight: "bold")[Kiểm tra giữa học kỳ 1 (TẠI LỚP)] \ #text(weight: "bold")[Điểm KT GHK1: HS2]. Hình thức: 3 dạng (CTM). Thời lượng: 90 phút.],

  // Row 19
  table.cell(rowspan: 2)[*9* \ (3/11-- \ 9/11)],
  [17],
  [*Khoảng biến thiên và khoảng tứ phân vị mẫu ghép nhóm.* \ _Yêu cầu:_ Nhận biết định nghĩa, cách tính $R$, $"IQR"$. Hiểu ý nghĩa độ phân tán. So sánh mức độ phân tán. Giải thích mối quan hệ.],
  table.cell(rowspan: 2)[9],
  table.cell(rowspan: 2)[*Biểu thức tọa độ của các phép toán vectơ.* \ _Yêu cầu:_ Nhận biết các công thức. Xác định biểu thức tọa độ. Vận dụng giải toán liên quan thực tiễn.],
  table.cell(rowspan: 2)[9],
  table.cell(rowspan: 2)[Bài tập cuối chuyên đề 1. \ _Yêu cầu:_ Củng cố kỹ năng giải bài toán quy hoạch tuyến tính và tối ưu hóa.],

  // Row 20
  [18],
  [Khoảng biến thiên và khoảng tứ phân vị (tiếp).],

  // Row 21
  table.cell(rowspan: 2)[*10* \ (10/11-- \ 16/11)],
  [19],
  [Khoảng biến thiên và khoảng tứ phân vị (tiếp). \ *Phương sai và độ lệch chuẩn mẫu ghép nhóm.* \ _Yêu cầu:_ Nhận biết định nghĩa, cách tính $S^2, S$.],
  table.cell(rowspan: 2)[10],
  table.cell(rowspan: 2)[*Biểu thức tọa độ các phép toán vectơ (tiếp).* \ _Yêu cầu:_ Vận dụng biểu thức tọa độ tích vô hướng giải bài toán góc và khoảng cách.],
  table.cell(rowspan: 2)[10],
  table.cell(rowspan: 2)[*Tiền tệ. Lãi suất.* \ _Yêu cầu:_ Nhận biết một số vấn đề tiền tệ. Thiết lập kế hoạch tài chính cá nhân.],

  // Row 22
  [20],
  [Phương sai và độ lệch chuẩn (tiếp).],

  // Row 23
  table.cell(rowspan: 2)[*11* \ (17/11-- \ 23/11)],
  [21],
  [Phương sai và độ lệch chuẩn mẫu ghép nhóm (tiếp).],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[Biểu thức tọa độ của các phép toán vectơ. \ _Yêu cầu:_ Vận dụng định lý cosin và biểu thức tọa độ để tính góc giữa hai vectơ.],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[Tiền tệ. Lãi suất. \ _Yêu cầu:_ Giải bài toán lãi đơn, lãi kép trong các tình huống gửi tiết kiệm.],

  // Row 24
  [22],
  [Phương sai và độ lệch chuẩn mẫu ghép nhóm (tiếp). \ _Yêu cầu:_ Tổng hợp và giải quyết các bài tập về các đặc trưng đo độ phân tán.],

  // Row 25
  table.cell(rowspan: 2)[*12* \ (24/11-- \ 30/11)],
  [23],
  [Bài tập cuối chương III. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX3] \ _Yêu cầu:_ Củng cố kiến thức về thống kê mẫu ghép nhóm qua bài tập thực hành.],
  [12],
  [Biểu thức tọa độ các phép toán vectơ (tiếp).],
  table.cell(rowspan: 2)[12],
  table.cell(rowspan: 2)[Tiền tệ. Lãi suất (tiếp). \ _Yêu cầu:_ Tìm hiểu về tỷ lệ lạm phát và ảnh hưởng đến giá trị tiền tệ.],

  // Row 26
  table.cell(colspan: 2)[],
  [13],
  [Bài tập cuối chương II. \ _Yêu cầu:_ Hệ thống hóa kiến thức về vectơ và tọa độ trong không gian.],

  // Row 27
  table.cell(rowspan: 2)[*13* \ (1/12-- \ 7/12)],
  [24],
  [Ôn tập kiểm tra cuối học kỳ 1.],
  table.cell(rowspan: 2)[14],
  table.cell(rowspan: 2)[Ôn tập kiểm tra cuối học kỳ 1. \ _Yêu cầu:_ Thống nhất theo ma trận đề.],
  table.cell(rowspan: 2)[13],
  table.cell(rowspan: 2)[Tiền tệ. Lãi suất (tiếp). \ _Yêu cầu:_ -nt],

  // Row 28
  [25],
  [Ôn tập kiểm tra cuối học kỳ 1. \ _Yêu cầu:_ Thống nhất theo ma trận đề.],

  // Row 29
  table.cell(rowspan: 2)[*14* \ (8/12-- \ 14/12)],
  [26],
  [Ôn tập kiểm tra cuối học kỳ 1.],
  table.cell(rowspan: 2)[15],
  table.cell(rowspan: 2)[Ôn tập kiểm tra cuối học kỳ 1. \ _Yêu cầu:_ Tái hiện các công thức hình học tọa độ quan trọng.],
  table.cell(rowspan: 2)[14],
  table.cell(rowspan: 2)[*Tín dụng. Vay nợ.* \ _Yêu cầu:_ Nhận biết kết quả trả nợ đúng hạn; hồ sơ tín dụng và giá trị tín dụng. Vận dụng tính toán kế hoạch trả nợ.],

  // Row 30
  [27],
  [Ôn tập kiểm tra cuối học kỳ 1. \ _Yêu cầu:_ Giải các dạng toán trắc nghiệm tổng hợp theo đề minh họa.],

  // Row 31
  table.cell(colspan: 7, fill: rgb("#fef3c7"), align: center)[#text(weight: "bold")[Kiểm tra cuối học kỳ 1 (TẬP TRUNG)] \ Hình thức: 3 dạng (CTM). Thời lượng làm bài: 90 phút.],

  // Row 32
  [*15--16* \ (15/12-- \ 28/12)],
  table.cell(colspan: 6)[*Chấm bài và sửa bài kiểm tra cuối học kỳ 1.*],
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
  [*Giải tích*],
  [*T*],
  [*HH và Đo lường*],
  [*T*],
  [*Chuyên đề*],

  // Row 2
  table.cell(rowspan: 2)[*1* \ (19/01-- \ 25/01)],
  [3],
  [*Nguyên hàm (tiếp).* \ _Yêu cầu:_ Nhận biết khái niệm, tính chất cơ bản; xác định nguyên hàm một số hàm sơ cấp. Tính nguyên hàm trong trường hợp đơn giản.],
  table.cell(rowspan: 2)[2],
  table.cell(rowspan: 2)[*Phương trình mặt phẳng (tiếp).* \ _Yêu cầu:_ Nhận biết PT tổng quát; thiết lập PT mặt phẳng; tính khoảng cách từ điểm đến mặt phẳng.],
  table.cell(rowspan: 2)[17],
  table.cell(rowspan: 2)[*Đầu tư tài chính. Lập kế hoạch tài chính cá nhân.* \ _Yêu cầu:_ Nhận biết vấn đề đầu tư; vận dụng kiến thức giải quyết vấn đề.],

  // Row 3
  [4],
  [Nguyên hàm (tiếp).],

  // Row 4
  table.cell(rowspan: 2)[*2* \ (26/01-- \ 01/02)],
  [5],
  [Nguyên hàm (tiếp).],
  table.cell(rowspan: 2)[3],
  table.cell(rowspan: 2)[Phương trình mặt phẳng (tiếp). \ _Yêu cầu:_ Vận dụng điều kiện song song, vuông góc của hai mặt phẳng.],
  table.cell(rowspan: 2)[18],
  table.cell(rowspan: 2)[Đầu tư tài chính (tiếp). \ _Yêu cầu:_ Phân tích rủi ro và lợi nhuận của các danh mục đầu tư.],

  // Row 5
  [6],
  [*Tích phân.* \ _Yêu cầu:_ Nhận biết định nghĩa và tính chất của tích phân. Giải quyết bài toán liên quan thực tiễn.],

  // Row 6
  table.cell(rowspan: 2)[*3* \ (02/02-- \ 08/02)],
  [7],
  [*Tích phân (tiếp).* \ _Yêu cầu:_ Sử dụng các phương pháp tính tích phân cơ bản (đổi biến, từng phần đơn giản).],
  table.cell(rowspan: 2)[4],
  table.cell(rowspan: 2)[*Phương trình đường thẳng.* \ _Yêu cầu:_ Nhận biết phương trình chính tắc, tham số, vectơ chỉ phương của đường thẳng trong không gian.],
  table.cell(rowspan: 2)[19],
  table.cell(rowspan: 2)[Đầu tư tài chính (tiếp). \ _Yêu cầu:_ Xây dựng mô hình bài toán đầu tư đơn giản.],

  // Row 7
  [8],
  [Tích phân (tiếp).],

  // Row 8
  table.cell(rowspan: 2)[*4* \ (09/02-- \ 15/02)],
  [9],
  [Tích phân (tiếp). \ #text(fill: rgb("#dc2626"), weight: "bold")[KTTX1] \ _Yêu cầu:_ Kiểm tra khả năng vận dụng tính chất tích phân giải bài tập.],
  table.cell(rowspan: 2)[5],
  table.cell(rowspan: 2)[Phương trình đường thẳng (tiếp). \ _Yêu cầu:_ Thiết lập PT đường thẳng; xác định góc giữa hai đường thẳng, đường thẳng và mặt phẳng.],
  table.cell(rowspan: 2)[20],
  table.cell(rowspan: 2)[*Bài tập cuối chuyên đề 2.* \ _Yêu cầu:_ Hệ thống hóa kiến thức về toán học trong tài chính.],

  // Row 9
  [10],
  [Tích phân (tiếp).],

  // Row 10
  table.cell(rowspan: 2)[*5* \ (23/02-- \ 01/03)],
  [11],
  [*Ứng dụng hình học của tích phân.* \ _Yêu cầu:_ Tính diện tích hình phẳng, thể tích khối tròn xoay. Vận dụng giải bài toán thực tiễn.],
  table.cell(rowspan: 2)[6],
  table.cell(rowspan: 2)[Phương trình đường thẳng (tiếp). \ _Yêu cầu:_ Tính khoảng cách giữa hai đường thẳng chéo nhau.],
  table.cell(rowspan: 2)[21],
  table.cell(rowspan: 2)[Bài tập cuối chuyên đề 2 (tiếp). \ _Yêu cầu:_ Giải bài toán ứng dụng chuyên đề tài chính.],

  // Row 11
  [12],
  [Ứng dụng hình học của tích phân (tiếp).],

  // Row 12
  table.cell(rowspan: 2)[*6* \ (02/03-- \ 08/03)],
  [13],
  [Ứng dụng hình học của tích phân (tiếp). \ _Yêu cầu:_ Giải quyết bài tập về thể tích các vật thể trong thực tế.],
  table.cell(rowspan: 2)[7],
  table.cell(rowspan: 2)[*Phương trình mặt cầu. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX2]* \ _Yêu cầu:_ Nhận biết PT mặt cầu; xác định tâm, bán kính; thiết lập PT mặt cầu khi biết tâm và bán kính.],
  table.cell(rowspan: 2)[22],
  table.cell(rowspan: 2)[*Biến ngẫu nhiên rời rạc.* \ _Yêu cầu:_ Nhận biết khái niệm; tính kì vọng, phương sai, độ lệch chuẩn.],

  // Row 13
  [14],
  [Ứng dụng hình học của tích phân (tiếp).],

  // Row 14
  table.cell(rowspan: 2)[*7* \ (09/03-- \ 15/03)],
  [15],
  [*Bài tập cuối chương IV.* \ _Yêu cầu:_ Củng cố kiến thức về nguyên hàm, tích phân và ứng dụng.],
  table.cell(rowspan: 2)[8],
  table.cell(rowspan: 2)[Phương trình mặt cầu (tiếp). \ _Yêu cầu:_ Vận dụng phương trình mặt cầu vào các bài toán cực trị.],
  table.cell(rowspan: 2)[23],
  table.cell(rowspan: 2)[Biến ngẫu nhiên rời rạc (tiếp). \ _Yêu cầu:_ Ý nghĩa và ứng dụng của kỳ vọng trong thực tế.],

  // Row 15
  [16],
  [],

  // Row 16
  table.cell(colspan: 7, fill: rgb("#fef3c7"), align: center)[#text(weight: "bold")[Kiểm tra giữa học kỳ 2 (TẠI LỚP)] \ Hình thức: 3 dạng (CTM). Thời lượng làm bài: 90 phút.],

  // Row 17
  table.cell(rowspan: 2)[*8* \ (16/03-- \ 22/03)],
  [17],
  [*Xác suất có điều kiện.* \ _Yêu cầu:_ Nhận biết khái niệm; ý nghĩa của xác suất có điều kiện trong tình huống thực tiễn.],
  table.cell(rowspan: 2)[10],
  table.cell(rowspan: 2)[*Bài tập cuối chương V.* \ _Yêu cầu:_ Hệ thống hóa kiến thức hình học tọa độ trong không gian.],
  table.cell(rowspan: 2)[24],
  table.cell(rowspan: 2)[*#text(fill: rgb("#dc2626"), weight: "bold")[KTTX3]* \ *Phép thử lặp và công thức Bernoulli.* \ _Yêu cầu:_ Nhận biết khái niệm; vận dụng giải bài toán thực tiễn.],

  // Row 18
  [18],
  [Xác suất có điều kiện (tiếp).],

  // Row 19
  table.cell(rowspan: 2)[*9* \ (23/03-- \ 29/03)],
  [19],
  [*Công thức xác suất toàn phần và công thức Bayes.* \ _Yêu cầu:_ Mô tả công thức thông qua bảng dữ liệu thống kê 2x2 và sơ đồ hình cây.],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[*Luyện tập hình học Oxyz.* \ _Yêu cầu:_ Tổng ôn phương trình mặt phẳng, đường thẳng, mặt cầu.],
  table.cell(rowspan: 2)[25],
  table.cell(rowspan: 2)[*Phân bố Bernoulli và phân bố nhị thức.* \ _Yêu cầu:_ Nhận biết khái niệm; vận dụng giải toán.],

  // Row 20
  [20],
  [Công thức xác suất toàn phần và Bayes (tiếp).],

  // Row 21
  table.cell(rowspan: 2)[*10* \ (30/03-- \ 05/04)],
  [21],
  [*Bài tập cuối chương VI.* \ *Tính giá trị gần đúng tích phân bằng máy tính cầm tay.* \ _Yêu cầu:_ Sử dụng máy tính hỗ trợ kiểm tra kết quả.],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[*Sử dụng phần mềm GeoGebra để biểu diễn hình học tọa độ trong không gian.* \ _Yêu cầu:_ Nhận biết và vẽ các đối tượng Oxyz.],
  table.cell(rowspan: 2)[26],
  table.cell(rowspan: 2)[*Phân bố Bernoulli và phân bố nhị thức (tiếp).* \ _Yêu cầu:_ Vận dụng tính xác suất trong các bài toán thực tế phức tạp.],

  // Row 22
  [22],
  [(Tiếp theo) \ #text(fill: rgb("#dc2626"), weight: "bold")[KTTX3]],

  // Row 23
  table.cell(rowspan: 2)[*11* \ (06/04-- \ 12/04)],
  [23],
  [*Minh họa và tính tích phân bằng phần mềm GeoGebra.* \ _Yêu cầu:_ Trực quan hóa phần hình phẳng và vật thể tròn xoay.],
  table.cell(rowspan: 2)[12],
  table.cell(rowspan: 2)[*Ôn thi cuối học kỳ 2.* \ _Yêu cầu:_ Thống nhất theo ma trận đề.],
  table.cell(rowspan: 2)[26],
  table.cell(rowspan: 2)[Phân bố Bernoulli và nhị thức (tiếp). \ _Yêu cầu:_ Củng cố kiến thức xác suất chương IV.],

  // Row 24
  [24],
  [*Ôn thi cuối học kỳ 2.* \ _Yêu cầu:_ Luyện đề trắc nghiệm tổng hợp.],

  // Row 25
  table.cell(rowspan: 2)[*12* \ (13/04-- \ 19/04)],
  [25],
  [*Ôn thi cuối học kỳ 2.*],
  table.cell(rowspan: 2)[13],
  table.cell(rowspan: 2)[*Ôn thi cuối học kỳ 2 (tiếp).* \ _Yêu cầu:_ Giải quyết các câu hỏi vận dụng và vận dụng cao.],
  table.cell(rowspan: 2)[27],
  table.cell(rowspan: 2)[*Bài tập cuối chuyên đề 3.* \ _Yêu cầu:_ Hệ thống hóa kiến thức xác suất nhị thức và ứng dụng.],

  // Row 26
  [26],
  [*Ôn thi cuối học kỳ 2 (tiếp).* \ _Yêu cầu:_ Hoàn thiện kỹ năng trình bày và làm bài.],

  // Row 27
  table.cell(colspan: 7, fill: rgb("#fef3c7"), align: center)[#text(weight: "bold")[KIỂM TRA CUỐI HỌC KỲ 2 (TẬP TRUNG)] \ Hình thức: 3 dạng (CTM). Thời lượng làm bài: 90 phút.],

  // Row 28
  table.cell(colspan: 7, fill: rgb("#f1f5f9"), align: center)[#text(weight: "bold")[CHẤM BÀI VÀ SỬA BÀI KIỂM TRA CUỐI HỌC KỲ 2]],

  // Row 29
  [*15--17*],
  table.cell(colspan: 6)[*Ôn tập cuối năm, ôn thi tốt nghiệp THPT.*],
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
