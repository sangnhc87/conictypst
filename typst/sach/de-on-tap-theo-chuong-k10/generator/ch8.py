# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG VIII: SỨC MẠNH CỦA BÙNG NỔ TỔ HỢP — NGHỆ THUẬT ĐẾM & NHỊ THỨC NEWTON

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 24, Bài 25, Bài 26 SGK Toán 10 cùng Chuyên đề Mật mã học RSA, Siêu trí tuệ AlphaGo, Nguyên lý Chuồng bồ câu Dirichlet & Đường cong Bézier (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 24: QUY TẮC ĐẾM — NGHỆ THUẬT ĐẾM MÀ KHÔNG CẦN ĐẾM TỪNG VẬT

Đếm là một trong những hoạt động trí tuệ đầu tiên của loài người khi thoát khỏi thời kỳ ăn lông ở lỗ: người chăn cừu đếm từng con cừu bằng cách nhặt từng hòn sỏi bỏ vào túi. Nhưng khi số lượng đối tượng lên tới hàng triệu, hàng tỷ, thì việc "nhặt từng hòn sỏi" trở thành bất khả thi!

*Đại số tổ hợp* ra đời để dạy cho con người cách *Đếm thông minh*: đếm hàng tỷ khả năng mà không cần phải chạm tay vào từng vật thể! Hai quy tắc nền tảng: *Quy tắc Cộng* (chia để trị - các trường hợp xung khắc) và *Quy tắc Nhân* (các công đoạn liên hoàn) chính là hai viên gạch đầu tiên xây nên toàn bộ nền khoa học máy tính hiện đại!

#story-box(
  title: "Gottfried Wilhelm Leibniz & Giấc mơ tính toán mọi tư tưởng nhân loại",
  author: "Gottfried Wilhelm Leibniz (Đức, 1646 – 1716)",
)[
  Năm 1666, khi mới tròn 20 tuổi, chàng thanh niên thiên tài Gottfried Wilhelm Leibniz đã bảo vệ xuất sắc luận án tiến sĩ mang tên *“Dissertatio de Arte Combinatoria”* (Chuyên luận về Nghệ thuật Tổ hợp).
  
  Trong tác phẩm mang tính tiên tri này, Leibniz đã mơ ước một điều không tưởng: Ông cho rằng mọi tư tưởng, khái niệm phức tạp của con người thực chất chỉ là *sự kết hợp (Tổ hợp)* của một số lượng hữu hạn các ý niệm cơ bản — giống như bảng chữ cái 26 ký tự có thể ghép lại thành toàn bộ kho tàng văn học của nhân loại. 
  
  Leibniz đề xuất xây dựng một "Ngôn ngữ phổ quát" (Characteristica Universalis) và một cỗ máy tính toán tư duy. Khi hai nhà triết học tranh cãi gay gắt về một vấn đề chính trị hay đạo đức, thay vì cãi vã hay chém giết nhau trên chiến trường, họ chỉ cần mỉm cười ngồi xuống bàn và nói: *“Calculemus!" (Nào, chúng ta hãy tính toán!)*. Bằng các quy tắc đếm và tổ hợp logic, cỗ máy sẽ tự động chỉ ra kết luận đúng đắn! Giấc mơ 20 tuổi của Leibniz chính là hạt mầm đầu tiên của ngành Trí tuệ Nhân tạo (AI) và Khoa học Máy tính 300 năm sau!
]

#hook-box(title: "Chiếc khóa số vali & Vụ trộm thế kỷ")[
  Thầy cầm một chiếc khóa vali 3 vòng số (từ 000 đến 999) giơ lên trước lớp:
  
  *“Chiếc khóa vali này có bao nhiêu mật mã khả dĩ?*
  - Vòng 1 có 10 cách chọn ($0 -> 9$).
  - Vòng 2 có 10 cách chọn.
  - Vòng 3 có 10 cách chọn.
  $arrow$ Theo Quy tắc Nhân lớp 10: Có $10 times 10 times 10 = 1.000$ mật mã khả dĩ!
  
  *Nếu một tên trộm thử mỗi mã mất đúng 2 giây, hắn chỉ mất tối đa $2.000$ giây — tức là khoảng 33 phút là mở toang chiếc vali của các em! Quá nguy hiểm!*
  
  *Nhưng bây giờ, nếu thầy nâng cấp chiếc vali lên 6 vòng số, và mỗi vòng có thêm 26 chữ cái tiếng Anh in hoa và 26 chữ thường (tổng cộng 62 ký tự mỗi vòng). Hỏi tên trộm sẽ mất bao lâu để thử hết các mã?”*
  
  Học sinh bấm máy tính: $62^6 approx 56,8$ tỷ mật mã!
  Nếu thử mỗi mã mất 2 giây:
  $ T = (56,8 times 10^9 times 2) / (60 times 60 times 24 times 365) approx 3.600 "NĂM"! $
  
  *Lời bình của Thầy:* "Chỉ cần tăng độ dài từ 3 vòng số lên 6 vòng ký tự, thời gian phá khóa đã nhảy vọt từ 33 phút lên hơn 3.600 NĂM — lâu hơn cả lịch sử từ thời Vua Hùng dựng nước đến nay! Đó chính là sức mạnh khủng khiếp của Quy tắc nhân: Sự bùng nổ tổ hợp bảo vệ mọi tài sản và bí mật quốc gia!"
]

#tech-box(title: "Cây quyết định (Decision Trees) trong Trí tuệ Nhân tạo")[
  - *Sơ đồ hình cây (Tree Diagram) trong AI*: Sơ đồ cây mà các em vẽ trong bài học Quy tắc đếm chính là tổ tiên trực tiếp của thuật toán *Cây quyết định (Decision Tree)* và *Rừng ngẫu nhiên (Random Forest)* trong Machine Learning. 
  - Khi ngân hàng quyết định có cho một khách hàng vay 1 tỷ đồng hay không, AI chạy dữ liệu khách hàng qua một cây quyết định phân nhánh: Thu nhập có lớn hơn 20 triệu không? (Có/Không) $arrow$ Có nợ xấu không? (Có/Không) $arrow$ Có tài sản thế chấp không? (Có/Không). Hàng triệu nhánh cây đếm tổ hợp này giúp ngân hàng ra quyết định chỉ trong vài giây với độ chính xác cực cao.
]

#story-box(
  title: "Nguyên Lý Chuồng Bồ Câu Dirichlet: Chân Lý Đơn Sơ Làm Rung Chuyển Toán Học",
  author: "Peter Gustav Lejeune Dirichlet (Đức, 1805 – 1859)",
)[
  Năm 1834, nhà toán học người Đức Peter Gustav Lejeune Dirichlet đã phát biểu một nguyên lý đơn giản đến mức một đứa trẻ lên năm cũng hiểu được:
  *“Nếu đem nhốt $n + 1$ con bồ câu vào $n$ chiếc chuồng, thì chắc chắn có ít nhất một chiếc chuồng chứa từ hai con bồ câu trở lên!”*
  
  Tưởng chừng như một câu nói hiển nhiên tầm thường, nhưng Nguyên lý Chuồng bồ câu (Pigeonhole Principle) đã trở thành một trong những công cụ chứng minh sắc bén và huyền diệu nhất của nhân loại:
  1. *Hai người cùng số sợi tóc:* Trong thành phố Hà Nội hay TP. Hồ Chí Minh với hơn 10 triệu dân, một cái đầu người có tối đa khoảng $150.000$ sợi tóc. Coi 10 triệu người là "bồ câu" và $150.000$ mức số lượng sợi tóc là "chuồng". Theo Dirichlet, chắc chắn có hàng chục người có số sợi tóc trên đầu bằng nhau chằn chặn đến từng sợi!
  2. *Định lý Ramsey trong mạng xã hội ($R(3,3) = 6$):* Tại bất kỳ một bữa tiệc nào có từ 6 người trở lên, luôn luôn tồn tại ít nhất 3 người quen nhau từng đôi một, hoặc có ít nhất 3 người hoàn toàn xa lạ nhau từng đôi một!
  3. *Giới hạn của thuật toán nén dữ liệu:* Không bao giờ tồn tại một phần mềm nén dữ liệu nào (như ZIP, RAR) có thể nén nhỏ *mọi* tệp tin trên máy tính! Vì nếu nén được mọi tệp tin, số lượng tệp đầu ra sẽ ít hơn số lượng tệp đầu vào, theo Dirichlet ắt có hai tệp tin khác nhau bị nén thành cùng một chuỗi bit giống nhau, dẫn đến không thể giải nén nguyên vẹn!
]

---

== BÀI 25: HOÁN VỊ, CHỈNH HỢP VÀ TỔ HỢP — BÙNG NỔ TỔ HỢP & SIÊU TRÍ TUỆ ALPHAGO

Ba khái niệm $P_n, A_n^k, C_n^k$ là ba cỗ máy biến hóa kỳ ảo của Đại số tổ hợp:
- *Hoán vị ($P_n = n!$)*: Xáo trộn vị trí của $n$ phần tử khác nhau thành một hàng dọc.
- *Chỉnh hợp ($A_n^k$)*: Chọn ra $k$ phần tử từ $n$ phần tử và CÓ XẾP THỨ TỰ (Ai làm Lớp trưởng, ai làm Bí thư).
- *Tổ hợp ($C_n^k$)*: Chọn ra $k$ phần tử mà KHÔNG QUAN TÂM THỨ TỰ (Chọn một đội gồm 3 bạn đi thi văn nghệ).

#story-box(
  title: "AlphaGo 2016: Khi Siêu Máy Tính Chinh Phục Không Gian Trạng Thái Cờ Vây Khổng Lồ",
  author: "Demis Hassabis (DeepMind, Google) & Lee Sedol (Hàn Quốc, 2016)",
)[
  Tháng 3 năm 2016 tại Seoul, hàng trăm triệu người trên khắp hành tinh nín thở theo dõi trận đấu lịch sử giữa đại kiện tướng cờ vây thế giới *Lee Sedol* và chương trình trí tuệ nhân tạo *AlphaGo* của Google DeepMind.
  
  Trước đó, vào năm 1997, siêu máy tính Deep Blue của IBM đã đánh bại vua cờ vua Garry Kasparov bằng phương pháp "duyệt vét cạn" (Brute-force): thử hàng triệu nước đi mỗi giây. Nhưng đối với cờ vây, phương pháp duyệt cạn của máy tính đã bị đè bẹp hoàn toàn bởi *Sự bùng nổ tổ hợp*:
  - Bàn cờ vây có $19 times 19 = 361$ giao điểm.
  - Số lượng trạng thái nước đi khả dĩ của một ván cờ vây ước tính lên tới $10^(170)$!
  - Con số $10^(170)$ này lớn khủng khiếp đến mức: Toàn bộ số lượng nguyên tử trong toàn bộ Vũ trụ quan sát được của chúng ta hiện nay mới chỉ có khoảng $10^(80)$ nguyên tử!
  
  Dù có gom toàn bộ siêu máy tính mạnh nhất Trái Đất chạy liên tục từ vụ nổ Big Bang cách đây 13,8 tỷ năm đến nay cũng không thể nào tính hết được $1/1.000.000$ số nhánh cây tổ hợp của bàn cờ vây!
  
  Các kỹ sư DeepMind đã kết hợp Lý thuyết Tổ hợp với Mạng nơ-ron học sâu (Deep Neural Networks) và thuật toán Tìm kiếm Cây Monte Carlo (MCTS) để mô phỏng "trực giác" của con người. Chiến thắng $4 - 1$ của AlphaGo trước Lee Sedol đã chứng minh rằng: Khi con người biết làm chủ sự bùng nổ tổ hợp, chúng ta có thể tạo ra những siêu trí tuệ vượt qua cả những giới hạn tự nhiên của chính mình!
]

#story-box(
  title: "Leonhard Euler 1736 & Bài Toán Bảy Cây Cầu Königsberg",
  author: "Leonhard Euler (Thụy Sĩ, 1707 – 1783)",
)[
  Năm 1736, người dân thành phố Königsberg (nay là Kaliningrad) thích đi dạo vào chiều Chủ nhật và tự đố nhau một câu đố: Thành phố có một con sông Pregel chảy qua với hai hòn đảo ở giữa, được nối với đất liền bằng đúng *7 cây cầu*. Liệu một người có thể bắt đầu từ một điểm bất kỳ trong thành phố, đi dạo qua TẤT CẢ 7 CÂY CẦU ĐÚNG MỘT LẦN DUY NHẤT rồi quay trở về điểm xuất phát được không?
  
  Mọi người thử đi hàng nghìn lần đều thất bại nhưng không ai giải thích được vì sao. Thiên tài *Leonhard Euler* đã ngồi xuống và giải quyết bài toán bằng một bước nhảy tư duy làm thay đổi lịch sử:
  - Euler gạt bỏ toàn bộ những chi tiết rườm rà: độ dài cây cầu, màu sắc dòng nước, kiến trúc ngôi nhà.
  - Ông trừu tượng hóa 4 vùng đất thành *4 Đỉnh (Vertices)*.
  - Ông trừu tượng hóa 7 cây cầu thành *7 Cạnh nối (Edges)*.
  
  Euler chỉ ra rằng: Mỗi lần đi vào một vùng đất rồi đi ra, người đó phải dùng đúng một cặp 2 cây cầu. Do đó, muốn đi hết các cầu đúng một lần thì *Số bậc của các đỉnh (số cây cầu nối vào vùng đất đó) bắt buộc phải là số chẵn*! Nhưng ở Königsberg, cả 4 vùng đất đều có số cầu nối vào là số lẻ ($3, 3, 3, 5$)! Do đó, hành trình dạo chơi là BẤT KHẢ THI TUYỆT ĐỐI!
  
  Bằng cách trừu tượng hóa hình học thành tổ hợp các đỉnh và cạnh, Euler đã khai sinh ra hai nhánh toán học khổng lồ định hình thế giới hiện đại: *Lý thuyết Đồ thị (Graph Theory)* và *Tô-pô học (Topology)* — nền tảng của bản đồ Google Maps tìm đường đi ngắn nhất và mạng xã hội Facebook hôm nay!
]

#hook-box(title: "Bài toán Chia kẹo của Euler (Stars and Bars): Đặt Vách Ngăn Phép Thuật")[
  Thầy cầm một túi kẹo 10 chiếc kẹo mút giống hệt nhau giơ lên:
  
  *“Thầy có 10 chiếc kẹo mút giống nhau, muốn chia cho 3 bạn An, Bình, Cúc sao cho BẠN NÀO CŨNG CÓ ÍT NHẤT 1 CHIẾC KẸO. Hỏi có bao nhiêu cách chia?”*
  
  Nhiều học sinh bắt đầu ngồi liệt kê: An 1, Bình 1, Cúc 8; An 1, Bình 2, Cúc 7... rất dễ sót và mất thời gian. Thầy mỉm cười vẽ 10 ngôi sao thẳng hàng lên bảng:
  $ star quad star quad star quad star quad star quad star quad star quad star quad star quad star $
  
  *“Giữa 10 ngôi sao có tất cả $9$ khoảng trống. Để chia 10 ngôi sao thành 3 phần cho 3 bạn, chúng ta chỉ cần ĐẶT ĐÚNG 2 CHIẾC VÁCH NGĂN ($|$) vào 9 khoảng trống ấy!*
  $ star quad star | star quad star quad star | star quad star quad star quad star quad star $
  *(Phần 1: 2 kẹo; Phần 2: 3 kẹo; Phần 3: 5 kẹo).*
  
  *Vì mỗi khoảng trống chỉ được đặt tối đa 1 vách ngăn (để không ai nhận 0 kẹo), số cách chia kẹo đơn giản là SỐ CÁCH CHỌN 2 KHOẢNG TRỐNG TỪ 9 KHOẢNG TRỐNG:*
  $ C_9^2 = (9 times 8) / 2 = 36 "cách"! $
  
  *Cả lớp ồ lên kinh ngạc trước sự ảo diệu của tư duy tổ hợp: Thay vì chia vật thể, ta chỉ cần chọn vị trí vách ngăn! Đó chính là Phương pháp Vách ngăn (Stars and Bars) bất hủ của Leonhard Euler!”*
]

#misconception-box(
  title: "Cạm bẫy Kinh điển: Phân biệt Chỉnh hợp A(n, k) vs Tổ hợp C(n, k)",
  misconception: "Học sinh thường bối rối không biết khi nào dùng Chỉnh hợp (phím nPr trên Casio) và khi nào dùng Tổ hợp (phím nCr trên Casio)!",
  correction: "Quy tắc vàng: HÃY TỰ HỎI BẢN THÂN: 'NẾU TA HOÁN ĐỔI VỊ TRÍ CỦA HAI PHẦN TỬ ĐƯỢC CHỌN, KẾT QUẢ CÓ THAY ĐỔI KHÔNG?'"
)[
  - *Nếu CÓ thay đổi:* Thứ tự có ý nghĩa $arrow$ DÙNG CHỈNH HỢP $A_n^k$!
    + Ví dụ: Chọn 2 bạn trong 10 bạn làm Lớp trưởng và Lớp phó. Đổi chỗ An và Bình: An làm lớp trưởng khác hoàn toàn với Bình làm lớp trưởng! Số cách là $A_(10)^2 = 90$.
  - *Nếu KHÔNG thay đổi:* Thứ tự hoàn toàn vô nghĩa $arrow$ DÙNG TỔ HỢP $C_n^k$!
    + Ví dụ: Chọn 2 bạn trong 10 bạn đi nhổ cỏ vườn trường. Đổi chỗ An và Bình: hai bạn vẫn cùng đi nhổ cỏ, nhiệm vụ không hề đổi khác! Số cách là $C_(10)^2 = 45$.
]

---

== BÀI 26: NHỊ THỨC NEWTON — TỪ TAM GIÁC PASCAL ĐẾN ĐỒ HỌA VECTOR BÉZIER

Khai triển nhị thức $(a + b)^n$:
$ (a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k $
là một trong những cây cầu vĩ đại nhất nối liền Đại số với Giải tích và Hình học máy tính.

#story-box(
  title: "Pierre Bézier & Cuộc Cách Mạng Đường Cong Trong Thiết Kế Ô Tô Renault",
  author: "Pierre Bézier (Pháp, 1910 – 1999) & Hãng xe Renault",
)[
  Vào những năm 1960, kỹ sư trưởng của hãng xe hơi Pháp Renault — ông *Pierre Bézier* — đau đầu với một vấn đề: Làm sao để các nhà thiết kế ô tô có thể vẽ được những đường cong thân xe mượt mà, khí động học trên màn hình máy tính sơ khai mà không cần phải nặn hàng tấn đất sét thủ công?
  
  Bézier đã ứng dụng các hệ số của *Nhị thức Newton và Tam giác Pascal* để phát minh ra *Đường cong Bézier (Bézier Curves)* dựa trên các đa thức cơ sở Bernstein:
  $ B(t) = sum_(i=0)^n C_n^i (1 - t)^(n - i) t^i P_i quad (t in [0; 1]) $
  
  Chỉ với 4 điểm điều khiển trên màn hình, các hệ số nhị thức $C_3^0, C_3^1, C_3^2, C_3^3$ ($1, 3, 3, 1$) sẽ kéo căng đường cong mềm mại như một dải lụa! Ngày nay, mọi phông chữ hiển thị trên màn hình máy tính (TrueType, OpenType), mọi hình vẽ vector trong Adobe Illustrator, Photoshop, Figma hay kỹ xảo hoạt hình 3D Pixar đều được uốn lượn theo đúng các hệ số Nhị thức Newton lớp 10!
]

#dialogue-box(title: "Đối thoại Socrates: Bản chất của Tam giác Pascal")[
  *Socrates:* Này bạn trẻ, nhìn vào Tam giác Pascal: Hàng 0 là $1$; Hàng 1 là $1, 1$; Hàng 2 là $1, 2, 1$; Hàng 3 là $1, 3, 3, 1$; Hàng 4 là $1, 4, 6, 4, 1$... Tại sao mỗi con số ở hàng dưới lại bằng tổng hai số đứng ngay trên nó?
  
  *Học trò:* Thưa thầy, công thức sách giáo khoa là: $C_n^k = C_(n-1)^(k-1) + C_(n-1)^k$ ạ!
  
  *Socrates:* Ta không hỏi công thức ký hiệu, ta hỏi BẢN CHẤT TƯ DUY! Hãy tưởng tượng trong một lớp có $n$ bạn học sinh, có bạn An là bạn thân của ngươi. Ta muốn chọn ra một nhóm gồm $k$ bạn. Có hai khả năng xảy ra:
  - Khả năng 1: Nhóm được chọn BẮT BUỘC CÓ BẠN AN. Ta đã chọn An rồi, vậy cần chọn thêm bao nhiêu bạn nữa trong số những bạn còn lại?
  
  *Học trò:* Dạ, cần chọn thêm $k - 1$ bạn từ $n - 1$ bạn còn lại, tức là có $C_(n-1)^(k-1)$ cách!
  
  *Socrates:* Khả năng 2: Nhóm được chọn TUYỆT ĐỐI KHÔNG CÓ BẠN AN (bạn An bị ốm). Ta phải chọn đủ $k$ bạn từ những bạn còn lại. Có bao nhiêu cách?
  
  *Học trò:* Dạ, chọn đủ $k$ bạn từ $n - 1$ bạn còn lại, tức là $C_(n-1)^k$ cách!
  
  *Socrates:* Và hai khả năng này xung khắc nhau, tổng của chúng chính là số cách chọn nhóm $k$ bạn từ $n$ bạn ban đầu! Ngươi thấy chưa: Tam giác Pascal không phải là trò chơi cộng số của trẻ con, nó là sự phân nhánh tất yếu của logic nhị phân cuộc sống!
]

#deep-dive-box(title: "Nhị Thức Newton & Phân Phối Nhị Thức Trong Kiểm Thử Chip Bán Dẫn")[
  Trong xác suất thống kê, khi một nhà máy đúc chip sản xuất $n$ con chip, mỗi con chip có xác suất đạt chuẩn là $p$ và xác suất lỗi là $q = 1 - p$.
  Khai triển nhị thức:
  $ 1 = (p + q)^n = sum_(k=0)^n C_n^k p^k q^(n-k) $
  Số hạng thứ $k$ chính là *Xác suất để trong lô $n$ chip có đúng $k$ chip đạt chuẩn chất lượng!* Phân phối nhị thức Bernoulli sinh ra từ Nhị thức Newton lớp 10 chính là công cụ sống còn giúp các hãng công nghệ Apple và Samsung nghiệm thu hàng triệu linh kiện điện tử mỗi ngày!
]

#inquiry-box(title: "Thực hành Python: In Tam Giác Pascal & Tính Hệ Số Nhị Thức")[
  ```python
  def pascal_triangle(rows=7):
      triangle = []
      for n in range(rows):
          row = [1] * (n + 1)
          for k in range(1, n):
              row[k] = triangle[n-1][k-1] + triangle[n-1][k]
          triangle.append(row)
          # In canh giữa tam giác
          spacing = " " * (rows - n) * 2
          print(spacing + "   ".join(f"{x:2d}" for x in row))

  pascal_triangle(8)
  ```
]

#pagebreak()
'''
