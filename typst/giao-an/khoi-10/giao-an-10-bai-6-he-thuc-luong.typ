// ════════════════════════════════════════════════════════════════════════
// Giáo án Toán 10 — Bài 6. Hệ thức lượng trong tam giác
// Trường PT DTNT THCS&THPT TÂN LẠC  ·  Tổ KHTN  ·  GV: Trần Khắc Tư
// ════════════════════════════════════════════════════════════════════════

#import "../modules/giao-an.typ": *
#import "@preview/cetz:0.3.3"

#show: giao-an.with(
  truong:    "THPT NGUYỄN HỮU CẢNH",
  to:        "TỔ TOÁN",
  giao-vien: "Nguyễn Văn Sang",
  ten-bai:   "BÀI 6. HỆ THỨC LƯỢNG TRONG TAM GIÁC (ACTIVE LEARNING & CETZ)",
  thoi-gian: "4 tiết",
)

#phan("I", "MỤC TIÊU")
#muc("1", "kiến thức")
- Nêu được *Định lí Côsin*, *Định lí Sin*, công thức độ dài đường trung tuyến.
- Giải thích được công thức tính *diện tích tam giác*: $S = 1/2 b c sin A = (a b c)/(4R) = p r = sqrt(p(p-a)(p-b)(p-c))$.
- Vận dụng linh hoạt để đo đạc khoảng cách thực tế không thể tiếp cận.

#muc("2", "năng lực")
*Năng lực đặc thù:*
#nl("Mô hình hoá toán học")[Thiết lập mô hình tam giác (chuyển bài toán đo qua sông, đo tháp thành mô hình Toán học).]
#nl("Giải quyết vấn đề")[Sử dụng hệ thức lượng giải các yếu tố chưa biết.]

*Năng lực số:*
#nls("Sử dụng phần mềm")[Học sinh dùng GeoGebra kiểm chứng số liệu, dùng Quizizz chơi game khởi động.]

#muc("3", "phẩm chất")
#pc("Trách nhiệm")[Hợp tác nghiêm túc khi làm việc nhóm, chia sẻ giải pháp đo đạc.]

#phan("II", "THIẾT BỊ VÀ HỌC LIỆU")
- Bảng phụ, thước kẻ, máy chiếu, máy tính Casio.

#phan("III", "TIẾN TRÌNH DẠY HỌC")

#hd("1", "Xác định vấn đề", "15")
#ten-hd[Khởi động: "Nhiệm vụ bất khả thi" đo qua sông]
#mt-hd[Kích thích sự tò mò của HS về cách đo khoảng cách mà không cần căng dây.]
#nd-hd[
  - *Tình huống:* Một đội khảo sát cần đo khoảng cách giữa hai điểm A và B ở hai bên bờ sông (không thể bơi qua). Họ chọn điểm C bên này bờ sông cùng với A và đo được: $A C = 50"m"$, $angle(C A B) = 80^degree$, $angle(A C B) = 65^degree$. Hỏi độ dài $A B$ là bao nhiêu?
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let c = 7.9
      let A = (0,0)
      let C = (5,0)
      let B = (c * calc.cos(80deg), c * calc.sin(80deg))
      
      // Sông
      content((2, 4), text(blue)[*Khúc sông*])
      
      // Tam giác
      line(A, B, C, close: true, fill: none, stroke: (dash: "dashed", paint: red))
      content(A, [A], anchor: "north-east", padding: 0.1)
      content(B, [B], anchor: "south", padding: 0.1)
      content(C, [C], anchor: "north-west", padding: 0.1)
      
      // Dữ kiện
      content((2, -1), [50m])
      content((1, 0), [$80^degree$])
      content((4, 0), [$65^degree$])
    })
  ]
]
#sp-hd[Học sinh thấy bế tắc vì tam giác này không vuông, các công cụ THCS (sin, cos, tan) bị vô hiệu hoá. Nảy sinh nhu cầu học công cụ mới.]
#tc-hd[
  #buoc("1", "Giao việc", "2")[Chiếu hình ảnh khúc sông và tam giác, yêu cầu HS thảo luận nhanh xem dùng công thức THCS giải được không.]
  #buoc("2", "Chốt vấn đề", "3")[Giáo viên dẫn dắt: "Chính vì công cụ cũ đã hết xài được, nên Toán học mới phát minh ra Định lý Sin và Côsin mà ta sẽ học hôm nay".]
]

#hd("2", "Hình thành kiến thức", "110")

#hd-tp("2.1", "Định lí Côsin (Game: Giải mật mã tam giác)", "30")
#mt-hd[Khám phá Định lý Côsin qua hình ảnh trực quan.]
#nd-hd[
  - Cho $triangle A B C$ có $A B = 5$, $A C = 8$, $angle(A) = 60^degree$. Tính $B C$.
  #align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let A = (0,0)
      let C = (8,0)
      let B = (5 * calc.cos(60deg), 5 * calc.sin(60deg))
      line(A, B, C, close: true, fill: none, stroke: blue)
      content(A, [A], anchor: "north-east", padding: 0.1)
      content(B, [B], anchor: "south", padding: 0.1)
      content(C, [C], anchor: "north-west", padding: 0.1)
      content((4, -1), [8])
      content((1, 2), [5])
      content((1, 0), [$60^degree$])
    })
  ]
  - GV giới thiệu công thức: $a^2 = b^2 + c^2 - 2 b c cos A$
]
#sp-hd[
  HS tính được $B C^2 = 8^2 + 5^2 - 2.8.5.cos 60^degree = 49 => B C = 7$.
]
#tc-hd[
  #buoc("1", "Trình bày", "10")[GV đưa công thức, vẽ hình bằng GeoGebra trên máy chiếu, cho điểm B chạy để HS thấy cạnh BC thay đổi theo góc A.]
  #buoc("2", "Thực hành", "15")[HS tính toán thủ công và ráp lại kết quả kiểm tra.]
]

#hd-tp("2.2", "Định lí Sin", "25")
#mt-hd[Áp dụng Định lí Sin để giải cứu đội khảo sát sông.]
#nd-hd[
  - Định lý Sin: $a/(sin A) = b/(sin B) = c/(sin C) = 2R$.
  - Trở lại bài toán Mở đầu: $A=80^degree, C=65^degree => B=35^degree$. Áp dụng tính $A B$.
]
#sp-hd[
  $A B / (sin 65^degree) = 50 / (sin 35^degree) => A B = (50. sin 65^degree)/(sin 35^degree) approx 79"m"$. Đội khảo sát đã tìm được khoảng cách!
]
#tc-hd[
  #buoc("1", "Gỡ nút thắt", "15")[Yêu cầu học sinh quay lại bài toán đầu giờ, áp dụng Định lý Sin vừa học để giải cứu đội khảo sát.]
]

#hd-tp("2.3", "Công thức diện tích (Xây tháp)", "25")
#mt-hd[Tính diện tích bằng nhiều góc nhìn khác nhau.]
#nd-hd[
  - GV tóm tắt các công thức diện tích (Heron, $1/2 a b sin C$, ...).
]
#sp-hd[HS ghi chép sổ tay các công thức.]
#tc-hd[
  #buoc("1", "Thuyết giảng", "15")[GV hệ thống hoá 4 công thức diện tích chính, mỗi công thức gắn với 1 trường hợp dữ kiện đề bài.]
]

#hd("3", "Luyện tập (Kahoot!)", "40")
#ten-hd[Trò chơi: "Vua giải tam giác"]
#mt-hd[Tăng tốc độ bấm máy và phản xạ tư duy.]
#nd-hd[
  - 4 câu hỏi trắc nghiệm chia theo từng mức độ (Cosin, Sin, Diện tích).
]
#sp-hd[Điểm số xếp hạng trên Kahoot!.]
#tc-hd[
  #buoc("1", "Chơi game", "15")[HS lấy điện thoại hoặc máy tính bảng đăng nhập mã PIN để chơi. Ai phản xạ nhanh nhất tính điểm cao nhất.]
]

#hd("4", "Vận dụng", "15")
#ten-hd[Dự án: "Đo chiều cao cột cờ trường"]
#mt-hd[Mang Toán học ra sân trường.]
#nd-hd[
  - *Nhiệm vụ:* Đo chiều cao cột cờ sân trường bằng giác kế và thước dây (không trèo lên cột). 
  - HS sử dụng 2 điểm ngắm A và B trên mặt đất để lập mô hình tam giác.
]
#sp-hd[Bản vẽ CetZ hoặc mô hình giấy của các nhóm nộp vào tiết sau.]
#tc-hd[
  #buoc("1", "Giao việc", "5")[Chia lớp thành 4 nhóm, phát giác kế, yêu cầu có quay video làm minh chứng.]
]
