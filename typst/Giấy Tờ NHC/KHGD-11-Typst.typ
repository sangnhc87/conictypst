// ==============================================================================
// KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN — MÔN TOÁN 11
// TRƯỜNG THPT NGUYỄN HỮU CẢNH — NĂM HỌC 2025 - 2026
// GV: Nguyễn Văn Sang | Lớp giảng dạy: 11B5, 11B15, 12C1, 12C9
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
        [Kế hoạch giáo dục cá nhân - Năm học 2025-2026],
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
  #text(weight: "bold", size: 13.5pt)[KẾ HOẠCH GIÁO DỤC CỦA GIÁO VIÊN, LỚP 11 - 12\
  MÔN: TOÁN HỌC] \
  
  #v(0.2em)
  #text(weight: "bold", size: 12pt)[(Năm học 2025 - 2026)]
]

#v(0.8em)

// --- I. THÔNG TIN CÁ NHÂN ---
#text(weight: "bold", size: 12pt)[I. THÔNG TIN CÁ NHÂN]
#list(
  [Họ và tên: Nguyễn Văn Sang],
  [Năm sinh: 1987 #h(2em) | #h(2em) Năm vào ngành: 2010],
  [Chức vụ: Giáo viên #h(2em) | #h(2em) Giảng dạy: Toán],
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

// --- III. PHÂN PHỐI CHƯƠNG TRÌNH ---
#text(weight: "bold", size: 12.5pt)[III. PHÂN PHỐI CHƯƠNG TRÌNH LỚP 11 - HỌC KỲ I]
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
  [*Tiết*],
  [*ĐS-GT-TK*],
  [*Tiết*],
  [*HHKG*],
  [*Tiết*],
  [*Chuyên đề*],

  // Row 2
  table.cell(rowspan: 2)[*1* \ (8/9-- \ 14/9)],
  [1],
  [*Góc lượng giác. Giá trị lượng giác của một góc lượng giác.* \ *Yêu cầu cần đạt:* \ - Nhận biết được các khái niệm cơ bản về góc lượng giác; số đo của góc lượng giác; hệ thức Chasles cho các góc lượng giác; đường tròn lượng giác; khái niệm giá trị lượng giác của một góc lượng giác. \ - Mô tả bảng giá trị lượng giác của một số góc lượng giác thường gặp; hệ thức cơ bản giữa các giá trị lượng giác của một góc lượng giác; quan hệ giữa các giá trị lượng giác của các góc lượng giác có liên quan đặc biệt: bù nhau, phụ nhau, đối nhau, hơn kém nhau $pi$. \ - Sử dụng được máy tính cầm tay để tính giá trị lượng giác của một góc lượng giác khi biết số đo của góc đó.],
  table.cell(rowspan: 2)[1],
  table.cell(rowspan: 2)[*Điểm, đường thẳng và mặt phẳng trong không gian.* \ *Yêu cầu cần đạt:* \ - Nhận biết được các quan hệ liên thuộc cơ bản giữa điểm, đường thẳng, mặt phẳng trong không gian. \ - Mô tả được ba cách xác định mặt phẳng (qua ba điểm không thẳng hàng; qua một đường thẳng và một điểm không thuộc đường thẳng đó; qua hai đường thẳng cắt nhau). \ - Xác định được giao tuyến của hai mặt phẳng; giao điểm của đường thẳng và mặt phẳng. \ - Vận dụng được các tính chất về giao tuyến của hai đường thẳng và mặt phẳng vào giải bài tập. \ - Nhận biết được hình chóp, hình tứ diện. \ - Vận dụng được kiến thức trong không gian để mô tả một số hình ảnh trong thực tiễn.],
  table.cell(rowspan: 2)[1],
  table.cell(rowspan: 2)[*Phép biến hình và Phép dời hình.* \ *Yêu cầu cần đạt:* \ - Nhận biết được khái niệm phép dời hình. \ - Nhận biết được tính chất của phép đối xứng trục, phép đối xứng tâm, phép tịnh tiến và phép quay. \ - Xác định được ảnh của điểm, đoạn thẳng, tam giác, đường tròn qua phép đối xứng trục, phép đối xứng tâm, phép tịnh tiến và phép quay. \ - Vận dụng được các phép dời hình nói trên trong đồ họa và trong một số vấn đề thực tiễn (ví dụ: tạo các hoa văn, hình khối...).],

  // Row 3
  [2],
  [Giá trị lượng giác của một góc lượng giác (tiếp theo).],

  // Row 4
  table.cell(rowspan: 2)[*2* \ (15/9-- \ 21/9)],
  [3],
  [*Công thức lượng giác.* \ *Yêu cầu cần đạt:* \ - Mô tả được các phép biến đổi lượng giác cơ bản: công thức cộng; công thức nhân đôi; công thức biến đổi tích thành tổng và công thức biến đổi tổng thành tích. \ - Giải quyết được một số vấn đề thực tiễn gắn với giá trị lượng giác của góc.],
  table.cell(rowspan: 2)[2],
  table.cell(rowspan: 2)[Điểm, đường thẳng và mặt phẳng trong không gian.],
  table.cell(rowspan: 2)[2],
  table.cell(rowspan: 2)[Phép biến hình và Phép dời hình.],

  // Row 5
  [4],
  [Công thức lượng giác (tiếp theo).],

  // Row 6
  table.cell(rowspan: 2)[*3* \ (22/9-- \ 28/9)],
  [5],
  [*Hàm số lượng giác và đồ thị.* \ *Yêu cầu cần đạt:* \ - Nhận biết được các khái niệm về hàm số chẵn, hàm số lẻ, hàm số tuần hoàn. \ - Nhận biết được các đặc trưng hình học của đồ thị hàm số chẵn, hàm số lẻ, hàm số tuần hoàn. \ - Nhận biết được định nghĩa các hàm lượng giác $y = sin x, y = cos x, y = tan x, y = cot x$ thông qua đường tròn lượng giác. \ - Mô tả bảng giá trị của bốn hàm số lượng giác đó trên một chu kì. \ - Vẽ được đồ thị của các hàm số $y = sin x, y = cos x, y = tan x, y = cot x$. \ - Giải thích được: tập xác định; tập giá trị; tính chất chẵn, lẻ; tính tuần hoàn; chu kì; khoảng đồng biến, nghịch biến của các hàm số $y = sin x, y = cos x, y = tan x, y = cot x$ dựa vào đồ thị. \ - Giải quyết được một số vấn đề thực tiễn gắn với hàm số lượng giác.],
  table.cell(rowspan: 2)[3],
  table.cell(rowspan: 2)[Điểm, đường thẳng và mặt phẳng trong không gian.],
  table.cell(rowspan: 2)[3],
  table.cell(rowspan: 2)[Phép tịnh tiến.],

  // Row 7
  [6],
  [Hàm số lượng giác và đồ thị (tiếp theo).],

  // Row 8
  table.cell(rowspan: 2)[*4* \ (29/9-- \ 5/10)],
  [7],
  [*Phương trình lượng giác cơ bản.* \ *Yêu cầu cần đạt:* \ - Nhận biết được công thức nghiệm của phương trình lượng giác cơ bản: $sin x = m; cos x = m; tan x = m; cot x = m$ bằng cách vận dụng đồ thị hàm số lượng giác tương ứng. \ - Tính được nghiệm gần đúng của phương trình lượng giác cơ bản bằng máy tính cầm tay. \ - Giải được phương trình lượng giác ở dạng vận dụng trực tiếp phương trình lượng giác cơ bản. \ - Giải quyết được một số vấn đề thực tiễn gắn với phương trình lượng giác.],
  table.cell(rowspan: 2)[4],
  table.cell(rowspan: 2)[Điểm, đường thẳng và mặt phẳng trong không gian.],
  table.cell(rowspan: 2)[4],
  table.cell(rowspan: 2)[Phép tịnh tiến.],

  // Row 9
  [8],
  [Phương trình lượng giác cơ bản (tiếp theo).],

  // Row 10
  table.cell(rowspan: 2)[*5* \ (6/10-- \ 12/10)],
  [9],
  [*Bài tập cuối chương I. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX1]* \ *Yêu cầu cần đạt:* \ - Giải quyết được các yêu cầu cần đạt của chương I.],
  table.cell(rowspan: 2)[5],
  table.cell(rowspan: 2)[*Hai đường thẳng song song.* \ *Yêu cầu cần đạt:* \ - Nhận biết được vị trí tương đối của hai đường thẳng trong không gian: hai đường thẳng trùng nhau, song song, cắt nhau, chéo nhau trong không gian. \ - Giải thích được tính chất cơ bản về hai đường thẳng song song trong không gian. \ - Vận dụng được kiến thức về hai đường thẳng song song để mô tả một số hình ảnh trong thực tiễn.],
  table.cell(rowspan: 2)[5],
  table.cell(rowspan: 2)[Phép đối xứng trục.],

  // Row 11
  [10],
  [Bài tập cuối chương I (tiếp theo).],

  // Row 12
  table.cell(rowspan: 2)[*6* \ (13/10-- \ 19/10)],
  [11],
  [*Dãy số. Cấp số cộng.* \ *Yêu cầu cần đạt (Dãy số):* \ - Nhận biết được dãy số hữu hạn, dãy số vô hạn. \ - Thể hiện được cách cho dãy số bằng liệt kê các số hạng; bằng công thức tổng quát; bằng hệ thức truy hồi; bằng cách mô tả. \ - Nhận biết được tính chất tăng, giảm, bị chặn của dãy số trong những trường hợp đơn giản. \ *Yêu cầu cần đạt (CSC):* \ - Nhận biết được một dãy số là cấp số cộng. \ - Giải thích được công thức xác định số hạng tổng quát của cấp số cộng. \ - Tính được tổng của $n$ số hạng đầu tiên của cấp số cộng. \ - Giải quyết được một số vấn đề thực tiễn gắn với cấp số cộng để giải một số bài toán liên quan đến thực tiễn.],
  table.cell(rowspan: 2)[6],
  table.cell(rowspan: 2)[*Đường thẳng và mặt phẳng song song.* \ *Yêu cầu cần đạt:* \ - Nhận biết được đường thẳng song song với mặt phẳng. \ - Giải thích được điều kiện để đường thẳng song song với mặt phẳng. \ - Giải thích được tính chất cơ bản về đường thẳng song song với mặt phẳng. \ - Vận dụng được kiến thức về đường thẳng song song với mặt phẳng để mô tả một số hình ảnh trong thực tiễn.],
  table.cell(rowspan: 2)[6],
  table.cell(rowspan: 2)[Phép đối xứng trục.],

  // Row 13
  [12],
  [Cấp số cộng (tiếp theo).],

  // Row 14
  table.cell(rowspan: 2)[*7* \ (20/10-- \ 26/10)],
  [13],
  [*Cấp số nhân.* \ *Yêu cầu cần đạt (CSN):* \ - Nhận biết được một dãy số là cấp số nhân. \ - Giải thích được công thức xác định số hạng tổng quát của cấp số nhân. \ - Tính được tổng của $n$ số hạng đầu tiên của cấp số nhân. \ - Giải quyết được một số vấn đề thực tiễn gắn với cấp số nhân để giải một số bài toán liên quan đến thực tiễn.],
  table.cell(rowspan: 2)[7],
  table.cell(rowspan: 2)[Đường thẳng và mặt phẳng song song. \ #text(fill: rgb("#dc2626"), weight: "bold")[KTTX2]],
  table.cell(rowspan: 2)[7],
  table.cell(rowspan: 2)[Phép đối xứng tâm.],

  // Row 15
  [14],
  [Cấp số nhân (tiếp theo).],

  // Row 16
  table.cell(rowspan: 2)[*8* \ (27/10-- \ 2/11)],
  [15],
  [Ôn tập kiểm tra giữa học kỳ I.],
  table.cell(rowspan: 2)[8],
  table.cell(rowspan: 2)[Đường thẳng và mặt phẳng song song.],
  table.cell(rowspan: 2)[8],
  table.cell(rowspan: 2)[Phép đối xứng tâm.],

  // Row 17
  [16],
  [Ôn tập kiểm tra giữa học kỳ I.],

  // Row 18
  table.cell(colspan: 7, fill: rgb("#fef3c7"), align: center)[#text(weight: "bold")[Kiểm tra giữa học kỳ 1 (TẠI LỚP)] \ Hình thức kiểm tra theo CTM của BGD. Thời lượng làm bài: 90 phút.],

  // Row 19
  table.cell(rowspan: 2)[*9* \ (3/11-- \ 9/11)],
  [17],
  [*Giới hạn của dãy số.* \ *Yêu cầu cần đạt:* \ - Nhận biết được khái niệm giới hạn của dãy số. \ - Giải thích được một số giới hạn cơ bản như: $lim 1/n^k = 0$; $lim q^n = 0 space (|q|<1)$; $lim c = c$. \ - Vận dụng được các phép toán giới hạn dãy số để tìm giới hạn của một số dãy số đơn giản. \ - Tính được tổng của một cấp số nhân lùi vô hạn. \ - Giải quyết được một số tình huống thực tiễn.],
  table.cell(rowspan: 2)[9],
  table.cell(rowspan: 2)[*Hai mặt phẳng song song.* \ *Yêu cầu cần đạt:* \ - Nhận biết được hai mặt phẳng song song trong không gian. \ - Giải thích được điều kiện để hai mặt phẳng song song. \ - Giải thích được tính chất cơ bản về hai mặt phẳng song song. \ - Giải thích được định lí Thalès trong không gian. \ - Giải thích được tính chất cơ bản của hình lăng trụ và hình hộp. \ - Vận dụng được kiến thức về quan hệ song song để mô tả một số hình ảnh trong thực tiễn.],
  table.cell(rowspan: 2)[9],
  table.cell(rowspan: 2)[Phép quay.],

  // Row 20
  [18],
  [Giới hạn của dãy số (tiếp theo).],

  // Row 21
  table.cell(rowspan: 2)[*10* \ (10/11-- \ 16/11)],
  [19],
  [*Giới hạn của hàm số.* \ *Yêu cầu cần đạt:* \ - Nhận biết được khái niệm giới hạn hữu hạn của hàm số, giới hạn hữu hạn một phía của hàm số tại một điểm. \ - Nhận biết được khái niệm giới hạn hữu hạn của hàm số tại vô cực và mô tả được một số giới hạn cơ bản. \ - Nhận biết được khái niệm giới hạn vô cực (một phía) của hàm số tại một điểm và hiểu được một số giới hạn cơ bản. \ - Tính được một số giới hạn hàm số bằng cách vận dụng các phép toán trên giới hạn hàm số. \ - Giải quyết được một số vấn đề thực tiễn gắn với giới hạn hàm số.],
  table.cell(rowspan: 2)[10],
  table.cell(rowspan: 2)[Hai mặt phẳng song song.],
  table.cell(rowspan: 2)[10],
  table.cell(rowspan: 2)[Phép quay.],

  // Row 22
  [20],
  [Giới hạn của hàm số (tiếp theo).],

  // Row 23
  table.cell(rowspan: 2)[*11* \ (17/11-- \ 23/11)],
  [21],
  [*Hàm số liên tục. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX3]* \ *Yêu cầu cần đạt:* \ - Nhận dạng được hàm số liên tục tại một điểm, hoặc trên một khoảng, hoặc trên một đoạn. \ - Nhận dạng được tính liên tục của tổng, hiệu, tích, thương của hai hàm số liên tục. \ - Nhận biết được tính liên tục của một số hàm sơ cấp cơ bản (như hàm đa thức, hàm phân thức, hàm căn thức, hàm lượng giác) trên tập xác định của chúng.],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[*Phép chiếu song song.* \ *Yêu cầu cần đạt:* \ - Nhận biết được khái niệm và các tính chất cơ bản về phép chiếu song song. \ - Xác định được ảnh của một điểm, một đoạn thẳng, một tam giác, một đường tròn qua một phép chiếu song song. \ - Vẽ được hình biểu diễn của một số hình khối đơn giản. \ - Sử dụng được kiến thức về phép chiếu song song để mô tả một số hình ảnh trong thực tiễn.],
  table.cell(rowspan: 2)[11],
  table.cell(rowspan: 2)[*Phép vị tự.* \ *Yêu cầu cần đạt:* \ - Nhận biết được khái niệm phép vị tự. \ - Nhận biết được tính chất của phép vị tự. \ - Xác định được ảnh của điểm, đoạn thẳng, tam giác, đường tròn qua phép vị tự. \ - Vận dụng được phép vị tự trong một số vấn đề thực tiễn.],

  // Row 24
  [22],
  [Hàm số liên tục (tiếp theo).],

  // Row 25
  table.cell(rowspan: 2)[*12* \ (24/11-- \ 30/11)],
  [23],
  [Bài tập cuối chương III.],
  table.cell(rowspan: 2)[12],
  table.cell(rowspan: 2)[Bài tập cuối chương IV.],
  table.cell(rowspan: 2)[12],
  table.cell(rowspan: 2)[Phép vị tự.],

  // Row 26
  [24],
  [Bài tập cuối chương III (tiếp theo).],

  // Row 27
  table.cell(rowspan: 2)[*13* \ (1/12-- \ 7/12)],
  [25],
  [Ôn thi cuối học kỳ 1.],
  table.cell(rowspan: 2)[13],
  table.cell(rowspan: 2)[Ôn thi cuối học kỳ 1.],
  table.cell(rowspan: 2)[13],
  table.cell(rowspan: 2)[Phép đồng dạng.],

  // Row 28
  [26],
  [Ôn thi cuối học kỳ 1.],

  // Row 29
  table.cell(rowspan: 2)[*14* \ (8/12-- \ 14/12)],
  [27],
  [Ôn thi cuối học kỳ 1.],
  table.cell(rowspan: 2)[14],
  table.cell(rowspan: 2)[Ôn thi cuối học kỳ 1.],
  table.cell(rowspan: 2)[14],
  table.cell(rowspan: 2)[Phép đồng dạng.],

  // Row 30
  [28],
  [Ôn thi cuối học kỳ 1.],

  // Row 31
  table.cell(colspan: 7, fill: rgb("#fef3c7"), align: center)[#text(weight: "bold")[Kiểm tra cuối học kỳ 1 (TẬP TRUNG)] \ Hình thức kiểm tra theo CTM của BGD. Thời lượng làm bài: 90 phút.],

  // Row 32
  [*15--16* \ (15/12-- \ 28/12)],
  table.cell(colspan: 6)[*Chấm bài và sửa bài kiểm tra học kỳ 1.*],

  // Row 33
  table.cell(rowspan: 2)[*17* \ (30/12-- \ 4/1)],
  [29],
  [*Số trung bình và mốt của mẫu số liệu ghép nhóm.* \ *Yêu cầu cần đạt:* \ - Tính được các số đặc trưng đo xu thế trung tâm: số trung bình, trung vị, tứ phân vị, mốt. \ - Hiểu được ý nghĩa và vai trò của các số đặc trưng. \ - Rút ra kết luận. \ - Nhận biết mối liên hệ giữa thống kê với kiến thức các môn học khác.],
  table.cell(rowspan: 2)[31],
  table.cell(rowspan: 2)[*Trung vị và tứ phân vị của mẫu số liệu ghép nhóm.*],
  table.cell(rowspan: 2)[15],
  table.cell(rowspan: 2)[*Bài tập cuối chuyên đề 1.*],

  // Row 34
  [30],
  [Số trung bình và mốt của mẫu số liệu ghép nhóm (tiếp theo).],

  // Row 35
  table.cell(rowspan: 2)[*18* \ (5/1-- \ 11/1)],
  [32],
  [*Trung vị và tứ phân vị của mẫu số liệu ghép nhóm (tiếp theo).*],
  [34],
  [*Tìm hiểu hàm số lượng giác bằng phần mềm GeoGebra.*],
  table.cell(rowspan: 2)[16],
  table.cell(rowspan: 2)[*Bài tập cuối chuyên đề 1. #text(fill: rgb("#dc2626"), weight: "bold")[KTTX5]*],

  // Row 36
  [33],
  [*Bài tập cuối chương V.*],
  [35],
  [*Dùng công thức cấp số nhân để dự báo dân số.*],
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
    #text(weight: "bold", size: 11pt)[\ Nguyễn Văn Sang]
  ],
  [
    #text(weight: "bold", size: 11pt)[TỔ TRƯỞNG] \
    #text(style: "italic", size: 9.5pt)[(Ký, ghi rõ họ tên)]
    #v(3.8em)
    #text(weight: "bold", size: 11pt)[\ Đỗ Thị Bạch Lan]
  ],
  [
    #text(style: "italic", size: 9.5pt)[Tp. HCM, ngày 05 tháng 09 năm 2025] \
    #text(weight: "bold", size: 11pt)[KT HIỆU TRƯỞNG] \
    #text(weight: "bold", size: 11pt)[(P. HIỆU TRƯỞNG)]
    #v(3.8em)
    #text(weight: "bold", size: 11pt)[Phan Ngọc Tường Vi]
  ]
)
