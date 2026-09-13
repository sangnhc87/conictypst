#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH ĐỊNH DẠNG TẬP TOÀN THƯ
// ══════════════════════════════════════════════════════════════
#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 2.0cm, right: 2.0cm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num > 2 [
      #grid(
        columns: (1fr, auto),
        align(left)[#text(size: 8.5pt, fill: rgb("64748B"), style: "italic")[Đại Toàn Thư Chuyên Đề VDC Toán Học 10 — Nguồn Gốc, Định Lý & Mở Rộng Cao Cấp]],
        align(right)[#text(size: 8.5pt, fill: rgb("64748B"), weight: "bold")[Trang #page-num]]
      )
      #v(-0.3em)
      #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
    ]
  },
  footer: context {
    let page-num = counter(page).get().first()
    if page-num > 2 [
      #align(center)[
        #text(size: 8pt, fill: rgb("94A3B8"))[Dự án Chuyên Khảo Toán Học Khối 10 · ConicTypst Master Monograph Series]
      ]
    ]
  }
)

#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.82em)

// Bảng màu nhận diện Hoàng gia (Royal Navy & Gold Palette)
#let c-royal = rgb("0F172A")
#let c-navy = rgb("1E3A8A")
#let c-blue = rgb("2563EB")
#let c-gold = rgb("D97706")
#let c-amber = rgb("F59E0B")
#let c-teal = rgb("0D9488")
#let c-dark = rgb("0F172A")
#let c-border = rgb("E2E8F0")

// ══════════════════════════════════════════════════════════════
// TRANG BÌA SÁCH NGHỆ THUẬT ĐỈNH CAO (CETZ VECTOR BOOK COVER)
// ══════════════════════════════════════════════════════════════

#align(center)[
  #block(
    width: 100%,
    height: 92%,
    fill: rgb("0B132B"),
    inset: (x: 20pt, y: 25pt),
    radius: 10pt,
    stroke: 3pt + c-gold,
  )[
    #v(1.0em)
    #text(size: 11pt, tracking: 0.25em, weight: "bold", fill: rgb("93C5FD"))[
      BỘ SÁCH CHUYÊN KHẢO TOÁN HỌC OLYMPIC & PHÂN HÓA CAO CẤP
    ]
    
    #v(1.2em)
    #text(size: 24pt, weight: "black", fill: rgb("F8FAFC"))[
      ĐẠI TOÀN THƯ CHUYÊN ĐỀ\
      VẬN DỤNG CAO TOÁN HỌC 10
    ]
    
    #v(0.6em)
    #text(size: 11.5pt, style: "italic", fill: rgb("FCD34D"))[
      Từ Khủng Hoảng Nền Tảng Lịch Sử, Định Lý Kinh Điển\
      Đến Các Hướng Mở Rộng Cao Cấp & Thách Thức Olympic
    ]

    #v(1.0em)
    
    // Đồ họa Vector CeTZ nghệ thuật trang bìa: Xoắn ốc Tỉ lệ vàng & Ba đường Conic
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      
      // Vòng tròn hào quang
      circle((0, 0), radius: 3.5, stroke: 0.8pt + rgb("1E293B"))
      circle((0, 0), radius: 2.8, stroke: (dash: "dotted", paint: rgb("3B82F6"), thickness: 1pt))
      circle((0, 0), radius: 2.0, stroke: 1.2pt + rgb("D97706"))

      // Đường Elip quỹ đạo Kepler
      line(
        (-2.3, -1.0), (-1.8, -1.3), (-0.8, -1.4), (0.4, -1.2), (1.6, -0.8),
        (2.3, 0.2), (2.4, 0.8), (1.8, 1.3), (0.8, 1.4), (-0.4, 1.2), (-1.6, 0.8), (-2.3, -0.2), (-2.3, -1.0),
        stroke: 1.5pt + rgb("60A5FA")
      )
      
      // Xoắn ốc Logarit tỉ lệ vàng (Golden Spiral)
      line(
        (0, 0), (0.2, 0.1), (0.3, 0.3), (0.2, 0.6), (-0.2, 0.8),
        (-0.7, 0.7), (-1.1, 0.2), (-1.2, -0.5), (-0.8, -1.3), (-0.1, -1.8),
        (0.9, -1.9), (1.9, -1.4), (2.5, -0.4), (2.6, 0.9), (2.0, 2.1), (0.8, 2.8),
        stroke: 2pt + rgb("F59E0B")
      )
      
      // Các đỉnh đa giác lồi mạng lưới
      let v1 = (0, 2.0)
      let v2 = (1.9, 0.6)
      let v3 = (1.2, -1.6)
      let v4 = (-1.2, -1.6)
      let v5 = (-1.9, 0.6)
      line(v1, v2, v3, v4, v5, close: true, stroke: 0.8pt + rgb("93C5FD"))
      
      // Tâm điểm phát sáng
      circle((0, 0), radius: 0.15, fill: rgb("FCD34D"))
    })

    #v(1.0em)
    #rect(fill: rgb("1E293B"), radius: 5pt, inset: (x: 15pt, y: 8pt))[
      #text(fill: white, size: 9.5pt)[
        *HỆ THỐNG 13 CHUYÊN ĐỀ ĐÀO SÂU HỌC THUẬT TOÀN DIỆN*\
        Logic · Tập hợp · Tối ưu Tuyến tính · Hệ thức lượng · Tâm tỉ cự · Thống kê Tukey\
        Parabol Chebyshev · Cực trị Oxy · Chia kẹo Euler · Xích Markov · Khử Gauss · Quy nạp Cauchy · Đường Conic
      ]
    ]

    #v(1.2em)
    #text(size: 10pt, weight: "bold", fill: rgb("E2E8F0"))[
      NHÓM BIÊN SOẠN CHUYÊN SÂU TOÁN HỌC KHỐI 10\
      #text(size: 9pt, style: "italic", fill: rgb("94A3B8"))[ConicTypst Scientific Monograph Series · Xuất bản năm 2026]
    ]
  ]
]

#pagebreak()

// ══════════════════════════════════════════════════════════════
// LỜI TỰA TRIẾT LÝ HỌC TOÁN (FOREWORD)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-navy),
  inset: (x: 16pt, y: 14pt),
  radius: 4pt,
  width: 100%,
)[
  #text(size: 14pt, weight: "black", fill: c-navy)[LỜI NÓI ĐẦU: TỪ TRỰC CẢM HÌNH HỌC ĐẾN BẢN CHẤT HÌNH THỨC HIỆN ĐẠI]
  
  #v(0.6em)
  #text(style: "italic", fill: rgb("334155"))[
    "Toán học không chỉ là việc áp dụng các công thức tính toán cơ học để giải quyết các bài kiểm tra điểm số; Toán học là một bảo tàng tư tưởng sống động, nơi mỗi định lý, mỗi bất đẳng thức đều phản ánh một cuộc khủng hoảng nhận thức hoặc một bước ngoặt cách mạng trong lịch sử trí tuệ nhân loại."
  ]
]

#v(0.8em)

Chương trình Giáo dục Phổ thông 2018 mang đến một làn gió mới khi tích hợp sâu sắc Toán học với thực tiễn: từ *Mô hình kinh tế Leontief, Thuật toán đơn hình quy hoạch tuyến tính*, đến *Hàng rào phát hiện bất thường Tukey trong Khoa học dữ liệu, và Định lý quang học của ba đường Conic*. Tuy nhiên, trong thực tế giảng dạy và ôn luyện học sinh giỏi (HSG) hay mục tiêu điểm 9+, tài liệu hiện nay thường rơi vào hai thái cực:
1. Hoặc quá cơ bản, chỉ dừng lại ở các bài toán áp dụng công thức thuần túy, thiếu đi chiều sâu bản chất.
2. Hoặc quá nặng về kỹ xảo mẹo mực rời rạc, làm cho người học "thấy cây mà không thấy rừng", không hiểu vì sao bài toán lại ra đời và công cụ toán học đó kết nối với thế giới hiện đại ra sao.

Bộ sách *ĐẠI TOÀN THƯ CHUYÊN ĐỀ VẬN DỤNG CAO TOÁN HỌC 10* này được biên soạn với sứ mệnh phá vỡ hai rào cản trên. Mỗi chuyên đề trong 13 chuyên đề được thiết kế chuẩn mực theo mô hình *Cấu trúc 5 Tầng Học thuật*:

- *Tầng 1: Lý thuyết Cốt lõi & Bản chất Toán học:* Rà soát các tiên đề, điều kiện tồn tại, phân tích từng chi tiết kỹ thuật như quản lý điểm mút khoảng đoạn hay điều kiện biên.
- *Tầng 2: Nguồn gốc Lịch sử & Khủng hoảng Nhận thức (Historical Epistemology):* Kể lại câu chuyện lịch sử của các vĩ nhân: từ *Nghịch lý Russell* làm sụp đổ lý thuyết tập hợp ngây thơ, *Định lý Bất toàn Gödel*, đến bức thư định mệnh *Pascal -- Fermat 1654* khai sinh xác suất học, bài toán *Regiomontanus 1471*, và sứ mệnh tìm lại tiểu hành tinh Ceres của *Carl Friedrich Gauss 1801*.
- *Tầng 3: Các Hướng Mở rộng Cao cấp (Higher Mathematics & AI Horizons):* Xây dựng cây cầu nối vững chắc lên Toán học hiện đại: *Bất đẳng thức Bonferroni*, *Điều kiện tối ưu KKT*, *Tọa độ tỉ cự trong đồ họa GPU 3D*, *Khoảng cách Mahalanobis trong AI*, *Đa thức trực giao Chebyshev*, *Hàm sinh Euler*, và *Thuật toán PageRank của Google*.
- *Tầng 4: Hệ thống Bài tập Phân hóa 4 Dạng thức Mới:* Chuẩn cấu trúc đề thi mới nhất (Trắc nghiệm nhiều lựa chọn, Đúng/Sai, Trả lời ngắn, và Tự luận sâu sắc) có 100% hình vẽ CeTZ vector trực quan.
- *Tầng 5: Bài toán Thách thức Trí tuệ Đỉnh cao (Olympic & Grand Challenges):* Đưa người học chạm đến tầm vóc Olympic VMO, IMO, Putnam và mô hình vật lý/cơ học thiên thể vũ trụ (Quỹ đạo Elip Hohmann tới Sao Hỏa, Bất đẳng thức Erdős--Mordell, Bài toán phá sản con bạc Huygens, Quy nạp Cauchy xuôi--ngược).

Chúng tôi tin tưởng rằng cuốn toàn thư này sẽ là người bạn đồng hành vô giá cho các thầy cô giáo bồi dưỡng học sinh giỏi, các em học sinh chuyên toán khao khát chinh phục đỉnh cao, và bất kỳ ai say mê vẻ đẹp thuần khiết của tư duy toán học.

#v(0.6em)
#align(right)[
  #text(weight: "bold", fill: c-navy)[Ban Chủ Biên Chuyên Đề ConicTypst]\
  #text(size: 9pt, style: "italic", fill: rgb("64748B"))[Mùa thu năm 2026]
]

#pagebreak()

// ══════════════════════════════════════════════════════════════
// CHƯƠNG DẪN NHẬP SƯ PHẠM: TẠI SAO HỌC BÀI NÀY & BẢN ĐỒ TƯ TƯỞNG
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-gold),
  inset: (x: 16pt, y: 14pt),
  radius: 4pt,
  width: 100%,
)[
  #text(size: 13.5pt, weight: "black", fill: c-navy)[BẢN ĐỒ TƯ TƯỞNG TOÁN HỌC KHỐI 10: TẠI SAO CHÚNG TA CẦN HỌC & HỌC ĐỂ LÀM GÌ?]
  
  #v(0.6em)
  #text(style: "italic", fill: rgb("334155"))[
    "Cái hay lớn nhất của người đi dạy không nằm ở việc giải nhanh một bài toán khó, mà là trả lời trọn vẹn cho học trò: Tại sao phải học bài này? Ai đã phát minh ra nó và trong bối cảnh lịch sử nào? Công cụ này dùng để làm gì trong thế giới thực? Khi hiểu được nguồn gốc và sự cần thiết sống còn của tri thức, học sinh sẽ chuyển hóa từ sự sợ hãi thụ động sang niềm say mê khám phá bất tận."
  ]
]

#v(0.8em)

== I. TRIẾT LÝ SƯ PHẠM: TỪ "THỢ GIẢI TOÁN" ĐẾN "NHÀ TƯ TƯỞNG TOÁN HỌC"

Khi bước chân vào cánh cửa THPT, học sinh thường cảm thấy choáng ngợp trước tính trừu tượng của Toán học lớp 10. Các em thường tự hỏi: _"Học mệnh đề, kéo theo chân không để làm gì?", "Tại sao phải chia kẹo Euler hay xoay quanh các khoảng đoạn chứa tham số $m$?", "Ba đường Conic có ích gì ngoài những bài toán tham số phức tạp?"_

Nếu người thầy chỉ dạy công thức và ép học sinh giải hàng trăm bài tập lặp lại, học sinh sẽ trở thành những "người thợ giải toán cơ học" và sớm kiệt sức. Ngược lại, khi bài giảng được khai mở bằng *Câu chuyện Khởi nguyên Lịch sử* và *Sứ mệnh Thực tiễn Đương đại*:
- Học sinh hiểu rằng *Mệnh đề Logic* của George Boole chính là linh hồn của từng chiếc vi xử lý trong máy tính và điện thoại các em dùng mỗi ngày.
- Học sinh nhận ra *Quy hoạch tuyến tính* của Kantorovich và Dantzig đang điều phối hàng triệu container hàng hóa của Amazon và chuỗi cung ứng toàn cầu.
- Học sinh thấy được *Ba đường Conic* của Apollonius và Kepler chính là con đường duy nhất dẫn lối các phi thuyền không gian từ Trái Đất vươn tới Sao Hỏa.

== II. MA TRẬN TRI THỨC TOÀN THƯ: 13 CHUYÊN ĐỀ VDC DƯỚI LĂNG KÍNH SƯ PHẠM

Dưới đây là bảng định vị tri thức toàn thư giúp thầy cô và học sinh nắm vững căn nguyên của toàn bộ 13 chuyên đề VDC:

#table(
  columns: (1.2fr, 1.8fr, 2.8fr, 3.2fr),
  stroke: 0.5pt + rgb("CBD5E1"),
  fill: (x, y) => if y == 0 { rgb("F1F5F9") } else if calc.even(y) { rgb("F8FAFC") } else { none },
  inset: (x: 6pt, y: 6pt),
  align: (center + horizon, left + horizon, left + horizon, left + horizon),
  
  [*Chuyên đề*], [*Ai phát minh / Niên đại*], [*Tại sao cần học? (Bản chất tư duy)*], [*Học để làm gì? (Kỷ nguyên AI & Thực tiễn)*],
  
  [*CD00: Logic Mệnh đề*],
  [Aristotle (~350 TCN)\ George Boole (1854)\ Kurt Gödel (1931)],
  [Phân định chân lý khách quan với ngụy biện cảm tính; rèn luyện tư duy phản biện sắc bén không lỗ hổng lập luận.],
  [Thiết kế vi mạch số bán dẫn (AND/OR/NOT); Thuật toán 2-SAT kiểm thử phần mềm an toàn hạt nhân; Logic suy luận trong mô hình AI/LLM.],

  [*CD01: Tập hợp & Tham số*],
  [Georg Cantor (1874)\ Richard Dedekind\ Henri Poincaré],
  [Khái niệm "Tập hợp" là bảng chữ cái xây dựng toàn bộ Toán học; rèn luyện năng lực phân loại, bao quát điều kiện biên và không gian mẫu.],
  [Đại số quan hệ CSDL SQL toàn cầu; Hệ thống kiểu (Type Systems) trong mọi ngôn ngữ lập trình; Xử lý ảnh số; Số học khoảng cho tàu vũ trụ.],

  [*CD02: Quy hoạch Tuyến tính*],
  [Leonid Kantorovich (Nobel 1975)\ George Dantzig (1947)\ John von Neumann],
  [Mọi tài nguyên thực tế đều hữu hạn (tiền, thời gian, đất đai). Dạy tư duy ra quyết định tối ưu dưới các ràng buộc khắt khe.],
  [Tối ưu chuỗi cung ứng logistics (Amazon, FedEx); Phân bổ phụ tải lưới điện thông minh; Tối ưu hóa hàm mất mát (Loss function) trong Deep Learning.],

  [*CD03: Hệ thức lượng Tam giác*],
  [Hipparchus (~150 TCN)\ Claudius Ptolemy (150)\ Regiomontanus (1471)],
  [Vượt qua giới hạn đo đạc trực tiếp: Con người đứng trên mặt đất nhưng tính được bán kính Trái Đất và khoảng cách tới Mặt Trời, đỉnh Everest.],
  [Hệ thống định vị toàn cầu GPS (Triangulation vệ tinh); Đo đạc viễn thám; Thiết kế kết cấu vòm chịu lực giàn không gian kiến trúc; Đồ họa game 3D.],

  [*CD04: Vector & Tâm tỉ cự*],
  [Giusto Bellavitis (1835)\ H. Grassmann (1844)\ A. F. Möbius (1827)],
  [Giải phóng hình học khỏi hệ trục tọa độ cứng nhắc. Vector là ngôn ngữ tự nhiên duy nhất mô tả lực, vận tốc và chuyển động vũ trụ.],
  [Đồ họa máy tính GPU (Barycentric coordinates kết xuất điểm ảnh 3D); Điều khiển cân bằng robot và xe tự hành; Động lực học máy bay; Cơ học lượng tử.],

  [*CD05: Thống kê & Hộp Tukey*],
  [Adolphe Quetelet\ Karl Pearson (1900)\ John Tukey (1977)],
  ["Không có dữ liệu, bạn chỉ có ý kiến cá nhân" (Deming). Thống kê giúp nhìn thấu quy luật sau sự hỗn loạn ngẫu nhiên, loại bỏ số liệu ảo.],
  [Khoa học dữ liệu (Data Science); Phát hiện gian lận tài chính/ngân hàng (Outlier Detection); Thử nghiệm lâm sàng vắc-xin; Dự báo kinh tế vĩ mô.],

  [*CD06: Parabol & Bậc hai*],
  [Menaechmus\ Galileo Galilei (1638)\ Pafnuty Chebyshev],
  [Đường cong phi tuyến bậc thấp nhất và đẹp nhất của tự nhiên; bước nhảy vọt từ thế giới tuyến tính sang thế giới có gia tốc và cực trị.],
  [Chảo vệ tinh thu phát sóng; Đèn pha ô tô gom chùm sáng; Kính thiên văn James Webb; Quỹ đạo tên lửa đạn đạo; Đa thức Chebyshev xấp xỉ thuật toán.],

  [*CD07: Tọa độ Oxy Phẳng*],
  [René Descartes (1637)\ Pierre de Fermat],
  [Cuộc cách mạng vĩ đại: Biến hình học vô hình thành đại số hữu hình! Giải quyết mọi bế tắc hình học bằng thuật toán phương trình đại số.],
  [Bản đồ số Google Maps, hệ thống GIS; Thiết kế cơ khí tự động hóa CAD/CAM; Thị giác máy tính nhận diện vật thể (Bounding box AI); Robot path planning.],

  [*CD08: Đại số Tổ hợp & Euler*],
  [Blaise Pascal (1654)\ Isaac Newton (1665)\ Leonhard Euler (1748)],
  [Nghệ thuật đếm trong không gian hàng tỉ khả năng mà không cần liệt kê; rèn luyện tư duy cấu trúc, giải mã và quy hoạch trạng thái.],
  [Mật mã học khóa công khai RSA bảo mật thanh toán ngân hàng; Phân tích độ phức tạp thuật toán; Giải mã trình tự ADN di truyền; Thiết kế viễn thông.],

  [*CD09: Xác suất & Trò chơi*],
  [Gerolamo Cardano\ Pascal & Fermat (1654)\ Andrey Kolmogorov (1933)],
  [Tương lai vốn bất định. Người có tư duy xác suất không mê tín, không sa đà cờ bạc, biết tính toán rủi ro và ra quyết định sáng suốt.],
  [Ngành định phí bảo hiểm (Actuary); Quản trị rủi ro đầu tư; Trí tuệ nhân tạo học tăng cường (Reinforcement Learning - AlphaGo); Chuẩn đoán y khoa Bayes.],

  [*CD10: Khử Gauss & Leontief*],
  [Cửu chương toán thuật\ C. F. Gauss (1801)\ Wassily Leontief (Nobel 1973)],
  [Thế giới thực là mạng lưới tương hỗ đa biến chằng chịt. Cung cấp thuật toán ma trận hệ thống để máy tính giải quyết hàng triệu phương trình.],
  [Thuật toán Google PageRank xếp hạng hàng tỉ website; Mô hình cân bằng kinh tế vĩ mô quốc gia; Lưới điện xoay chiều; Cân bằng hóa học đa tâm.],

  [*CD11: Quy nạp & BĐT Cauchy*],
  [Francesco Maurolico\ Blaise Pascal\ Cauchy (1821) & Schwarz],
  [Con người hữu hạn, số tự nhiên vô hạn. Quy nạp là cây cầu kỳ diệu bắc qua sự vô tận bằng nguyên lý Domino. BĐT dạy nghệ thuật tìm điểm cân bằng tối ưu.],
  [Kiểm chứng phần mềm hình thức (Formal Verification) cho tàu vũ trụ NASA và hàng không; Cơ học lượng tử (Nguyên lý Heisenberg); Xử lý tín hiệu số.],

  [*CD12: Ba đường Conic*],
  [Apollonius của Perga\ Johannes Kepler (1609)\ Isaac Newton (1687)],
  [Chữ ký hình học của Vũ trụ: Bất kỳ thiên thể hay vật thể nào bay trong trường trọng lực đều vạch nên một đường elip, parabol hoặc hyperbol.],
  [Quỹ đạo chuyển tiếp Hohmann đưa phi thuyền lên Sao Hỏa; Kính thiên văn viễn vọng không gian; Tán sỏi thận không phẫu thuật bằng tiêu điểm elip; Sóng LORAN.]
)

#v(0.8em)

== III. HƯỚNG DẪN SƯ PHẠM CHO NGƯỜI THẦY: 4 BƯỚC KHƠI DẬY NGỌN LỬA HỌC TẬP

Để học sinh cảm thấy mỗi bài học là thực sự thiết yếu, người thầy nên áp dụng quy trình 4 bước khởi động bài giảng:
1. *Bước 1: Khởi động bằng Câu hỏi Nghịch lý hoặc Khủng hoảng lịch sử:* Thay vì viết ngay định nghĩa lên bảng, hãy kể câu chuyện về sự bế tắc của các vĩ nhân trước khi định lý ra đời (ví dụ: Gauss tìm tiểu hành tinh Ceres bị mất tích ra sao, hay Russell làm lung lay toán học thế nào).
2. *Bước 2: Kết nối với Kỷ nguyên Số và Trí tuệ Nhân tạo:* Chỉ ra công thức này đang chạy ở dòng lệnh nào trong Google Maps, con chip Snapdragon/Apple, thuật toán nhận diện khuôn mặt hay mạng xã hội.
3. *Bước 3: Mổ xẻ Bản chất Toán học qua Hình học Trực quan:* Tận dụng các hình vẽ vector CeTZ trực quan để học sinh "nhìn thấy" tư duy thay vì tưởng tượng trừu tượng.
4. *Bước 4: Chinh phục Thách thức Đỉnh cao:* Dẫn dắt học sinh giải quyết các bài toán VDC mang tính khám phá, qua đó bồi đắp lòng tự tin và bản lĩnh trí tuệ.

#pagebreak()

// ══════════════════════════════════════════════════════════════
// BIÊN NIÊN SỬ DÒNG CHẢY TƯ TƯỞNG TOÁN HỌC KHỐI 10 (TIMELINE)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (bottom: 2pt + c-gold),
  inset: (bottom: 8pt),
  width: 100%,
)[
  #text(size: 13pt, weight: "black", fill: c-royal)[BIÊN NIÊN SỬ DÒNG CHẢY TƯ TƯỞNG TOÁN HỌC (THE MATHEMATICAL TIMELINE)]\
  #text(size: 9pt, style: "italic", fill: rgb("64748B"))[Các cột mốc tư tưởng vĩ đại kiến tạo nên 13 Chuyên đề VDC Khối 10]
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trục thời gian đứng từ trên xuống dưới
    line((0, 6), (0, -13.5), stroke: 2.5pt + rgb("CBD5E1"))
    
    // Mốc 1: Thế kỷ III TCN (Apollonius & Archimedes)
    circle((0, 5.0), radius: 0.18, fill: rgb("2563EB"))
    rect((-6.5, 4.3), (-0.8, 5.7), fill: rgb("EFF6FF"), stroke: 1pt + rgb("2563EB"), radius: 3pt)
    content((-3.65, 5.0), text(size: 7.5pt)[*~250 TCN: Apollonius & Archimedes*\
    Khảo sát ba đường Conic, Tiêu điểm\
    và Định luật đòn bẩy tâm tỉ cự])
    content((0.6, 5.0), text(fill: rgb("2563EB"), weight: "bold", size: 8pt)[Cổ đại], anchor: "west")

    // Mốc 2: Năm 1471 (Regiomontanus)
    circle((0, 3.2), radius: 0.18, fill: rgb("D97706"))
    rect((0.8, 2.5), (6.5, 3.9), fill: rgb("FFFDF5"), stroke: 1pt + rgb("D97706"), radius: 3pt)
    content((3.65, 3.2), text(size: 7.5pt)[*1471: Regiomontanus*\
    Bài toán góc ngắm cực đại bức tranh\
    Khởi sinh cực trị hình học không đạo hàm])
    content((-0.6, 3.2), text(fill: rgb("D97706"), weight: "bold", size: 8pt)[1471], anchor: "east")

    // Mốc 3: Năm 1609 & 1637 (Kepler, Descartes & Fermat)
    circle((0, 1.4), radius: 0.18, fill: rgb("16A34A"))
    rect((-6.5, 0.7), (-0.8, 2.1), fill: rgb("F0FDF4"), stroke: 1pt + rgb("16A34A"), radius: 3pt)
    content((-3.65, 1.4), text(size: 7.5pt)[*1609--1637: Kepler, Descartes, Fermat*\
    Quỹ đạo Elip thiên văn, Hình học giải tích Oxy\
    và Nguyên lý thời gian cực tiểu ánh sáng])
    content((0.6, 1.4), text(fill: rgb("16A34A"), weight: "bold", size: 8pt)[Thế kỷ 17], anchor: "west")

    // Mốc 4: Năm 1654 (Pascal - Fermat & Huygens 1657)
    circle((0, -0.4), radius: 0.18, fill: rgb("DC2626"))
    rect((0.8, -1.1), (6.5, 0.3), fill: rgb("FEF2F2"), stroke: 1pt + rgb("DC2626"), radius: 3pt)
    content((3.65, -0.4), text(size: 7.5pt)[*1654--1657: Pascal, Fermat, Huygens*\
    Khai sinh Lý thuyết Xác suất từ bài toán cờ bạc\
    và Bài toán phá sản của con bạc])
    content((-0.6, -0.4), text(fill: rgb("DC2626"), weight: "bold", size: 8pt)[1654], anchor: "east")

    // Mốc 5: Năm 1748 (Leonhard Euler)
    circle((0, -2.2), radius: 0.18, fill: rgb("7C3AED"))
    rect((-6.5, -2.9), (-0.8, -1.5), fill: rgb("F5F3FF"), stroke: 1pt + rgb("7C3AED"), radius: 3pt)
    content((-3.65, -2.2), text(size: 7.5pt)[*1748: Leonhard Euler*\
    Lý thuyết Phân hoạch số nguyên, Hàm sinh\
    và Mô hình chia kẹo Stars & Bars])
    content((0.6, -2.2), text(fill: rgb("7C3AED"), weight: "bold", size: 8pt)[1748], anchor: "west")

    // Mốc 6: Năm 1801--1821 (Gauss, Cauchy & Möbius)
    circle((0, -4.0), radius: 0.18, fill: rgb("2563EB"))
    rect((0.8, -4.7), (6.5, -3.3), fill: rgb("EFF6FF"), stroke: 1pt + rgb("2563EB"), radius: 3pt)
    content((3.65, -4.0), text(size: 7.5pt)[*1801--1827: Gauss, Cauchy, Möbius*\
    Thuật toán Khử Gauss tìm tiểu hành tinh Ceres,\
    Quy nạp xuôi-ngược AM-GM & Tọa độ tỉ cự])
    content((-0.6, -4.0), text(fill: rgb("2563EB"), weight: "bold", size: 8pt)[Đầu TK 19], anchor: "east")

    // Mốc 7: Năm 1854--1874 (Boole, Chebyshev & Cantor)
    circle((0, -5.8), radius: 0.18, fill: rgb("D97706"))
    rect((-6.5, -6.5), (-0.8, -5.1), fill: rgb("FFFDF5"), stroke: 1pt + rgb("D97706"), radius: 3pt)
    content((-3.65, -5.8), text(size: 7.5pt)[*1854--1874: Boole, Chebyshev, Cantor*\
    Đại số Logic Boole, Đa thức trực giao Minimax,\
    Khai sinh Lý thuyết Tập hợp ngây thơ])
    content((0.6, -5.8), text(fill: rgb("D97706"), weight: "bold", size: 8pt)[Giữa TK 19], anchor: "west")

    // Mốc 8: Năm 1901--1931 (Russell & Gödel)
    circle((0, -7.6), radius: 0.18, fill: rgb("DC2626"))
    rect((0.8, -8.3), (6.5, -6.9), fill: rgb("FEF2F2"), stroke: 1pt + rgb("DC2626"), radius: 3pt)
    content((3.65, -7.6), text(size: 7.5pt)[*1901--1931: Russell & Gödel*\
    Khủng hoảng nền tảng toán học lần 3\
    Hai định lý Bất toàn phá vỡ tiên đề hóa Hilbert])
    content((-0.6, -7.6), text(fill: rgb("DC2626"), weight: "bold", size: 8pt)[1901--1931], anchor: "east")

    // Mốc 9: Năm 1939--1947 (Kantorovich & Dantzig)
    circle((0, -9.4), radius: 0.18, fill: rgb("16A34A"))
    rect((-6.5, -10.1), (-0.8, -8.7), fill: rgb("F0FDF4"), stroke: 1pt + rgb("16A34A"), radius: 3pt)
    content((-3.65, -9.4), text(size: 7.5pt)[*1939--1947: Kantorovich & Dantzig*\
    Quy hoạch tuyến tính, Thuật toán Đơn hình\
    và Lý thuyết Đối ngẫu Giá bóng kinh tế])
    content((0.6, -9.4), text(fill: rgb("16A34A"), weight: "bold", size: 8pt)[1939--1947], anchor: "west")

    // Mốc 10: Năm 1977--1998 (Tukey & Google PageRank)
    circle((0, -11.2), radius: 0.18, fill: rgb("7C3AED"))
    rect((0.8, -11.9), (6.5, -10.5), fill: rgb("F5F3FF"), stroke: 1pt + rgb("7C3AED"), radius: 3pt)
    content((3.65, -11.2), text(size: 7.5pt)[*1977--1998: John Tukey & Page/Brin*\
    Cách mạng EDA Box-Plot phát hiện Outlier\
    và Thuật toán Google PageRank ma trận lớn])
    content((-0.6, -11.2), text(fill: rgb("7C3AED"), weight: "bold", size: 8pt)[Hiện đại], anchor: "east")
    
    // Mốc 11: Thế kỷ 21 (Học máy, AI & Vũ trụ)
    circle((0, -13.0), radius: 0.22, fill: rgb("0F172A"), stroke: 1.5pt + rgb("F59E0B"))
    content((0, -13.6), text(fill: rgb("0F172A"), weight: "bold", size: 8.5pt)[Thế Kỷ 21: Trí Tuệ Nhân Tạo (AI) & Kính Không Gian JWST])
  })
]

#pagebreak()

// ══════════════════════════════════════════════════════════════
// MỤC LỤC TOÀN THƯ (MASTER TABLE OF CONTENTS)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-navy),
  inset: (x: 14pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(size: 13pt, weight: "black", fill: c-navy)[MỤC LỤC ĐẠI TOÀN THƯ CHUYÊN ĐỀ VDC TOÁN 10]
]

#v(0.8em)

#table(
  columns: (auto, 1fr, auto),
  align: (center + horizon, left + horizon, center + horizon),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + c-navy) } else { 0.5pt + rgb("E2E8F0") },
  fill: (x, y) => if y == 0 { rgb("F1F5F9") } else if calc.even(y) { rgb("F8FAFC") } else { none },
  inset: (x: 10pt, y: 7pt),
  
  [*Mã CD*], [*Tên Chuyên Đề & Trọng Tâm Học Thuật VDC*], [*Tệp PDF Độc Lập*],

  // PHẦN 1
  table.cell(colspan: 3, fill: rgb("EFF6FF"))[#text(weight: "bold", fill: c-navy)[PHẦN I: MỆNH ĐỀ, TẬP HỢP & QUY HOẠCH TUYẾN TÍNH TỐI ƯU]],
  [#strong[CD00]], [
    *Logic Mệnh Đề, Suy Luận Chân Trị & Nghịch Lý Gödel*\
    _Đại số Boole · Mạch Shannon · 3-SAT Cook-Levin · Thách thức George Boolos 1996_
  ], [`CD00-Logic-*.pdf` (12 trang)],

  [#strong[CD01]], [
    *Tập Hợp Chứa Tham Số $m$ & Nguyên Lý Bù Trừ Olympic*\
    _Nghịch lý Russell ZFC · BĐT Bonferroni · Hoán vị Derangements · Hàm toàn ánh Stirling_
  ], [`CD01-TapHop-*.pdf` (18 trang)],

  [#strong[CD02]], [
    *Bất Phương Trình Bậc Nhất & Quy Hoạch Tuyến Tính VDC*\
    _Miền lồi · Dantzig Simplex · Đối ngẫu von Neumann · Giá bóng Kantorovich Nobel 1975_
  ], [`CD02-QuyHoach-*.pdf` (15 trang)],

  // PHẦN 2
  table.cell(colspan: 3, fill: rgb("F0FDF4"))[#text(weight: "bold", fill: rgb("166534"))[PHẦN II: HỆ THỨC LƯỢNG, TÂM TỈ CỰ & HÌNH HỌC TỌA ĐỘ PHẲNG]],
  [#strong[CD03]], [
    *Hệ Thức Lượng Tam Giác, Nhận Dạng & Cực Trị Lượng Giác*\
    _Bài toán Regiomontanus 1471 · Định lý Stewart · BĐT Erdős--Mordell & Euler $R ge 2r$_
  ], [`CD03-HeThucLuong-*.pdf` (11 trang)],

  [#strong[CD04]], [
    *Tâm Tỉ Cự & Cực Trị Vectơ — Cân Bằng Lực Thực Tế*\
    _Tọa độ Möbius 1827 · Đồ họa GPU · Định lý Leibniz tổng quát · Cực trị trên đường tròn_
  ], [`CD04-TamTiCu-*.pdf` (12 trang)],

  [#strong[CD07]], [
    *Phương Pháp Tọa Độ Oxy: Cực Trị Đoạn Thẳng & Đường Tròn*\
    _Đường tròn Apollonius · Phản xạ Fermat · Trục đẳng phương · Tâm đẳng phương Monge_
  ], [`CD07-Oxy-CucTri-*.pdf` (11 trang)],

  // PHẦN 3
  table.cell(colspan: 3, fill: rgb("FFFDF5"))[#text(weight: "bold", fill: rgb("9A3412"))[PHẦN III: HÀM SỐ BẬC HAI & BA ĐƯỜNG CONIC THIÊN VĂN]],
  [#strong[CD06]], [
    *Hàm Số Bậc Hai, Parabol & Dấu Tam Thức VDC*\
    _Quỹ đạo ném xiên Galileo · Danh mục Markowitz · Đa thức trực giao Chebyshev Minimax_
  ], [`CD06-Parabol-*.pdf` (11 trang)],

  [#strong[CD12]], [
    *Ba Đường Conic, Tính Chất Quang Học & Kính Thiên Văn*\
    _Định luật Kepler · Thấu kính Einstein · Kính JWST · Quỹ đạo chuyển tiếp Hohmann Sao Hỏa_
  ], [`CD12-CDHT3-Conic-*.pdf` (13 trang)],

  // PHẦN 4
  table.cell(colspan: 3, fill: rgb("FDF2F8"))[#text(weight: "bold", fill: rgb("9D174D"))[PHẦN IV: ĐẠI SỐ TỔ HỢP, XÁC SUẤT & THỐNG KÊ DỮ LIỆU]],
  [#strong[CD08]], [
    *Kỹ Thuật Chia Kẹo Euler & Automata Hữu Hạn (FSM) Đếm Tổ Hợp*\
    _Giản đồ Ferrers · Dãy Tribonacci · Hàm sinh đại số Euler có chặn trên chặt_
  ], [`CD08-ChiaKeoEuler-*.pdf` (10 trang)],

  [#strong[CD09]], [
    *Tính Xác Suất Cổ Điển, Chia Nhóm & Mô Hình Trò Chơi*\
    _Thư tín Pascal--Fermat 1654 · Tiên đề Kolmogorov · Bài toán Phá sản con bạc Huygens_
  ], [`CD09-XacSuat-*.pdf` (11 trang)],

  [#strong[CD05]], [
    *Thống Kê Hiện Đại: Tứ Phân Vị, Outlier Tukey & Phương Sai*\
    _Khám phá dữ liệu EDA Tukey · Biểu đồ Hộp Box-plot · BĐT Chebyshev & Dị biệt Mahalanobis_
  ], [`CD05-ThongKe-*.pdf` (11 trang)],

  // PHẦN 5
  table.cell(colspan: 3, fill: rgb("F5F3FF"))[#text(weight: "bold", fill: rgb("5B21B6"))[PHẦN V: CÁC CHUYÊN ĐỀ HỌC TẬP CHUYÊN SÂU NÂNG CAO]],
  [#strong[CD10]], [
    *Hệ Ba Phương Trình, Thuật Toán Khử Gauss & Mô Hình Leontief*\
    _Mạch điện Kirchhoff · Cân bằng kinh tế Leontief · Thuật toán Google PageRank ma trận_
  ], [`CD10-CDHT1-HePT-*.pdf` (14 trang)],

  [#strong[CD11]], [
    *Phương Pháp Quy Nạp Toán Học & Bất Đẳng Thức Đại Số*\
    _Quy nạp siêu hạn · BĐT Karamata · Tuyệt kỹ Quy nạp xuôi--ngược Cauchy Cours d'Analyse_
  ], [`CD11-CDHT2-QuyNap-*.pdf` (13 trang)],
)

#v(0.8em)
#align(center)[
  #text(weight: "bold", size: 10pt, fill: c-navy)[TỔNG QUY MÔ CÔNG TRÌNH: 13 CHUYÊN ĐỀ · 162 TRANG TÀI LIỆU CHUYÊN SÂU · 100% HÌNH VẼ CETZ]
]

#pagebreak()

// ══════════════════════════════════════════════════════════════
// BẢNG KÝ HIỆU & HỆ TIÊN ĐỀ TOÁN HỌC QUỐC TẾ (NOMENCLATURE)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-teal),
  inset: (x: 14pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(size: 13pt, weight: "black", fill: c-teal)[BẢNG KÝ HIỆU & CHUẨN MỰC HÌNH THỨC TOÁN HỌC QUỐC TẾ (AMS / ISO)]
]

#v(0.6em)

Dưới đây là quy chuẩn ký hiệu được sử dụng nhất quán trong toàn bộ 13 Chuyên đề VDC:

#table(
  columns: (1.5fr, 2.5fr, 3fr),
  stroke: 0.5pt + rgb("E2E8F0"),
  fill: (x, y) => if y == 0 { rgb("F0FDFA") } else if calc.even(y) { rgb("F8FAFC") } else { none },
  inset: 7pt,
  align: (center + horizon, left + horizon, left + horizon),
  
  [*Ký hiệu Toán học*], [*Tên gọi chuẩn mực*], [*Quy ước & Ý nghĩa bản chất*],
  [$P => Q$], [Mệnh đề kéo theo], [Chỉ sai khi $P$ Đúng mà $Q$ Sai; tương đương $not P or Q$.],
  [$R = {X mid(|) X in.not X}$], [Nghịch lý Russell (1901)], [Chứng minh không tồn tại "Tập hợp của mọi tập hợp" trong ZFC.],
  [$|union.big_(i=1)^n A_i|$], [Nguyên lý Bù trừ (PIE)], [Tổng đan dấu $S_1 - S_2 + S_3 - dots + (-1)^(n-1) S_n$.],
  [$S(n, k)$], [Số Stirling loại hai], [Số cách phân hoạch tập $n$ phần tử thành $k$ khối khác rỗng.],
  [$max c^T x = min b^T y$], [Định lý Đối ngẫu Mạnh], [Lợi nhuận cực đại của bài toán gốc bằng chi phí thuê tài nguyên tối thiểu.],
  [$y_i^*$], [Giá bóng (Shadow Price)], [Đạo hàm biên của lợi nhuận theo nguồn tài nguyên thứ $i$.],
  [$vec(a) dot vec(b) = |vec(a)| |vec(b)| cos theta$], [Tích vô hướng Euclid], [Đo lường độ tương quan góc; bằng $0$ khi và chỉ khi hai vectơ trực giao.],
  [$G: sum alpha_i vec(G A_i) = vec(0)$], [Tâm tỉ cự (Möbius 1827)], [Điểm cân bằng thế năng duy nhất của hệ chất điểm có trọng số $sum alpha_i eq.not 0$.],
  [$Delta_Q = Q_3 - Q_1$], [Khoảng tứ phân vị ($I Q R$)], [Độ trải giữa $50\%$ dữ liệu trung tâm, bất biến trước các giá trị ngoại lai.],
  [$[Q_1 - "1,5" Delta_Q; Q_3 + "1,5" Delta_Q]$], [Hàng rào Tukey (1977)], [Vùng chấp nhận dữ liệu thông thường; nằm ngoài khoảng này là Outlier.],
  [$D_M(vec(x), vec(mu))$], [Khoảng cách Mahalanobis], [Khoảng cách thống kê chuẩn hóa ma trận hiệp phương sai $Sigma^(-1)$ triệt tiêu tương quan.],
  [$T_n(x) = cos(n arccos x)$], [Đa thức Chebyshev], [Đa thức monic có độ lệch cực đại nhỏ nhất trên $[-1; 1]$ bằng $1/2^(n-1)$.],
  [$G(x) = sum a_n x^n$], [Hàm sinh đại số Euler], [Biến phép cộng chỉ số thành phép nhân lũy thừa đa thức giải tích.],
  [$M vec(r) = vec(r)$], [Phương trình PageRank], [Vector riêng ứng với giá trị riêng $lambda = 1$ của ma trận ngẫu nhiên Markov.],
  [$r_1 + r_2 = 2a$], [Quỹ đạo Elip Hohmann], [Quỹ đạo tiêu hao năng lượng tối thiểu giữa hai hành tinh trong cơ học thiên thể.]
)

#v(1.0em)

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 3pt + c-gold),
  inset: (x: 14pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"), size: 10pt)[HƯỚNG DẪN TRA CỨU & KHAI THÁC TẬP TOÀN THƯ:] \
  - Người học có thể mở trực tiếp từng tệp PDF chuyên đề độc lập trong thư mục `typst/exams/CD-K10-NC/` để in ấn hoặc học tập theo từng chủ đề riêng biệt.
  - Mỗi chuyên đề đều chứa đầy đủ 5 phần khép kín: Lý thuyết $\to$ Nguồn gốc lịch sử $\to$ Mở rộng cao cấp $\to$ Đề bài 4 dạng thức $\to$ Bài toán Thách thức Olympic.
  - Toàn bộ lời giải được biên soạn chuẩn mực theo thẻ `#step[...]` giúp học sinh nắm bắt tường minh từng bước lập luận, không đốt cháy giai đoạn tư duy.
]
