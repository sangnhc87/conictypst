# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG V: VŨ KHÍ GIẢI MÃ THẾ GIỚI DỮ LIỆU — THỐNG KÊ & CÁC SỐ ĐẶC TRƯNG

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 12, Bài 13, Bài 14 SGK Toán 10 cùng Chuyên đề Khoa học Dữ liệu, Biểu đồ Coxcomb Nightingale, Tiêu chuẩn Six Sigma, Định lý Giới hạn Trung tâm & Nghịch lý Simpson (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 12: SỐ GẦN ĐÚNG VÀ SAI SỐ — BÀI HỌC VỀ GIỚI HẠN NHẬN THỨC CỦA LOÀI NGƯỜI

Trong mắt học sinh phổ thông, toán học là xứ sở của sự chính xác tuyệt đối: $1 + 1 = 2$, căn bậc hai của 4 bằng 2, một góc vuông đúng $90 degree$. Nhưng khi toán học bước ra khỏi trang giấy trắng để va chạm với thế giới vật lý thực tế, *sự chính xác tuyệt đối biến mất hoàn toàn!*
- Bạn không bao giờ có thể đo được chiều dài của một chiếc bàn chính xác đến từng nguyên tử.
- Một chiếc đồng hồ nguyên tử chính xác nhất thế giới cũng bị sai lệch một phần tỷ giây sau hàng triệu năm.
- Một con chip máy tính hiện đại nhất của Intel hay Apple cũng không thể lưu trữ được giá trị chính xác của con số $1/3$ hay số $pi$.

Bài học "Số gần đúng và Sai số" chính là bài học về sự khiêm nhường của trí tuệ con người: thừa nhận rằng mọi phép đo lường và tính toán trong đời thực đều đi kèm với *Sai số (Error)*. Người kỹ sư tài ba không phải là người ảo tưởng mình có độ chính xác $100\%$, mà là người biết khống chế sai số nằm trong *Phạm vi an toàn cho phép (Tolerance)* để không gây ra thảm kịch!

#story-box(
  title: "Thảm kịch Tên lửa Patriot 1991: Cái chết của 28 binh sĩ vì một lỗi làm tròn",
  author: "Hệ thống Phòng không Patriot — Chiến tranh Vùng Vịnh (25/02/1991)",
)[
  Đêm ngày 25 tháng 2 năm 1991, trong Chiến tranh Vùng Vịnh, một quả tên lửa đạn đạo Scud của quân đội Iraq được phóng đi với vận tốc siêu thanh lao thẳng về phía căn cứ quân sự Mỹ tại Dharan, Ả Rập Xê Út. Tại căn cứ, hệ thống phòng thủ tên lửa tối tân Patriot của Mỹ được trang bị radar hiện đại đã phát hiện ra mục tiêu đang bay đến. Thế nhưng, tên lửa Patriot đã hoàn toàn im lặng, không phóng đạn đánh chặn. Quả tên lửa Scud phát nổ trúng doanh trại quân đội, cướp đi sinh mạng của 28 binh sĩ và làm bị thương gần 100 người khác.
  
  Ủy ban điều tra của Quốc hội Mỹ đã vào cuộc và phát hiện ra một sự thật chấn động: *Nguyên nhân thảm kịch không phải do hỏng radar hay nổ động cơ, mà bắt nguồn từ một sai số làm tròn số học trong phần mềm máy tính!*
  
  Đồng hồ của hệ thống Patriot đo thời gian theo đơn vị $1/10$ giây ($0,1$ giây). Trong hệ nhị phân của máy tính số, con số $0,1$ là một số thập phân vô hạn tuần hoàn:
  $ (0,1)_(10) = (0,0001100110011001100110011...)_2 $
  Thanh ghi bộ nhớ của máy tính Patriot thời đó chỉ có độ dài 24-bit, nên máy tính buộc phải cắt cụt và làm tròn số, tạo ra một sai số cực kỳ nhỏ là $0,000000095$ giây cho mỗi $0,1$ giây trôi qua!
  
  Nếu hệ thống chỉ khởi động lại sau vài giờ như thiết kế ban đầu, sai số này là vô hại. Nhưng hệ thống Patriot tại Dharan đã được bật chạy liên tục suốt hơn $100$ giờ không tắt! Sai số tích lũy nhân lên sau 100 giờ:
  $ Delta t = 0,000000095 times (100 times 60 times 60 times 10) approx 0,3433 "giây"! $
  
  Với một quả tên lửa Scud đang bay với vận tốc $1.676$ mét/giây, sai số $0,34$ giây tương đương với việc radar tính toán vị trí quả tên lửa bị lệch đi hơn $575$ mét trong không gian! Hệ thống Patriot nhìn vào "vùng trời rỗng" và tưởng rằng tên lửa đã biến mất, hủy bỏ lệnh phóng đánh chặn. Một bài học xương máu đắt giá chứng minh rằng: Một hạt cát sai số nếu bị bỏ qua có thể trở thành một trận lở tuyết hủy diệt cả mạng sống con người!
]

#story-box(
  title: "Vụ nổ Tên lửa Ariane 5 năm 1996: Vụ nổ đắt giá nhất trong lịch sử vũ trụ",
  author: "Cơ quan Vũ trụ Châu Âu (ESA) — Ngày 04/06/1996",
)[
  Chỉ 37 giây sau khi rời bệ phóng tại Kourou (Guiana thuộc Pháp), con tàu vũ trụ Ariane 5 trị giá 500 triệu USD mang theo 4 vệ tinh khoa học vô giá đã bỗng nhiên quay ngoắt $90 degree$, gãy đôi và nổ tung thành một quả cầu lửa khổng lồ trên bầu trời Đại Tây Dương.
  
  Nguyên nhân được phát hiện chỉ sau vài tuần điều tra: Phần mềm điều khiển của Ariane 5 đã bê nguyên đoạn mã nguồn của tên lửa đời trước (Ariane 4). Trong đó, vận tốc ngang của tên lửa được lưu trữ dưới dạng số thực dấu phẩy động 64-bit (Floating point). Nhưng khi nạp vào hệ thống dẫn đường quán tính, máy tính đã cố gắng ép kiểu (convert) con số 64-bit này thành một số nguyên có dấu 16-bit (Signed Integer) — vốn chỉ chứa được giá trị tối đa là $32.767$!
  
  Tên lửa Ariane 5 mạnh hơn nhiều so với Ariane 4, vận tốc ngang vượt qua ngưỡng $32.767$, dẫn đến hiện tượng *Tràn số nguyên (Integer Overflow)*. Máy tính phát sinh mã lỗi, động cơ đẩy hiểu nhầm đó là lệnh quay ngoắt sang một bên và tự bẻ gãy thân tên lửa! Nửa tỷ USD tan thành tro bụi chỉ vì một sai số kiểu dữ liệu số học mà học sinh lớp 10 học hôm nay!
]

#story-box(
  title: "Thước Mét Tại Sèvres & Cuộc Cách Mạng Định Nghĩa Lại Hệ Đo Lường Quốc Tế SI 2019",
  author: "Viện Đo lường Quốc tế (BIPM) — Paris, Pháp",
)[
  Năm 1799, sau Cách mạng Pháp, các nhà khoa học đã nỗ lực tạo ra một hệ thống đo lường phổ quát cho toàn nhân loại: "Dành cho mọi thời đại, cho mọi dân tộc". Họ chế tạo ra *Thanh mét chuẩn (Prototype Metre)* bằng hợp kim $90\%$ Platinum và $10\%$ Iridium, cất giữ nghiêm ngặt trong hầm ngầm dưới lòng đất tại Sèvres ngoại ô Paris, được bảo vệ bởi ba lớp chuông thủy tinh hút chân không.
  
  Tuy nhiên, qua hơn một thế kỷ, các nhà vật lý nhận ra một vấn đề chí mạng: Ngay cả thanh kim loại quý giá nhất cũng bị co giãn theo nhiệt độ, áp suất, và thậm chí mất đi vài microgram nguyên tử qua thời gian! Nếu "vật chuẩn" tự nó thay đổi, thì toàn bộ các phép đo trên thế giới đều bị lung lay!
  
  Năm 2019, Đại hội Cân Đo Quốc tế (CGPM) đã quyết định một bước chuyển lịch sử: *Xóa bỏ vĩnh viễn mọi hiện vật vật lý làm chuẩn!* Ngày nay:
  - Một mét không còn được định nghĩa bằng thanh kim loại ở Paris, mà là *quãng đường ánh sáng truyền trong chân không trong khoảng thời gian đúng $1 / 299.792.458$ giây!*
  - Một kilôgam không còn là quả cân "Le Grand K", mà được định nghĩa thông qua hằng số lượng tử Planck $h = 6,62607015 times 10^(-34) "J" dot "s"$.
  
  Khoa học hiện đại đã neo giữ độ chính xác của nhân loại vào các *Hằng số bất biến của Vũ trụ*, biến sai số đo lường trở thành một đại lượng được kiểm soát đến cấp độ hạ nguyên tử!
]

#hook-box(title: "Bạn có bao giờ biết chính xác chiều cao của mình?")[
  Thầy bước vào lớp, cầm chiếc thước dây và gọi một bạn học sinh lên đo chiều cao:
  
  *“Em cao bao nhiêu?”* — Học sinh đáp: *“Thưa thầy, em cao $1$m$70$ ạ!”*
  
  Thầy nhìn cả lớp mỉm cười:
  
  *“Thầy khẳng định với các em: Bạn ấy KHÔNG BAO GIỜ cao đúng $1,7000000...$ mét!*
  - Nếu đo bằng thước dây nhựa ngoài chợ: Bạn cao $1,70$ m $plus.minus 0,5$ cm.
  - Nếu vào bệnh viện dùng thước kẹp y tế: Bạn cao $1,703$ m $plus.minus 1$ mm.
  - Nếu dùng máy đo laser trong phòng thí nghiệm: Bạn cao $1,70342$ m $plus.minus 0,01$ mm.
  - Và ngay cả khi có máy đo nguyên tử, chiều cao của các em buổi sáng khi vừa ngủ dậy bao giờ cũng dài hơn buổi tối từ 1 đến 2 cm do các đĩa đệm cột sống bị trọng lực nén lại trong suốt cả ngày!
  
  *Bài học rút ra:* Mọi con số trong đời thực đều đi kèm với một khoảng sai số $[a - d; a + d]$. Sự thông minh của người làm khoa học không phải là tự lừa dối mình về sự chính xác tuyệt đối, mà là biết rõ sai số của mình là bao nhiêu để kiểm soát rủi ro!"
]

#tech-box(title: "Sai số Tuyệt đối vs Sai số Tương đối: Tầm vóc của Bối cảnh")[
  - *Sai số tuyệt đối ($Delta_a <= d$)*: Cho biết độ lệch tối đa giữa số gần đúng và giá trị chân xác.
  - *Sai số tương đối ($delta_a = Delta_a / |a| <= d / |a| = delta$)*: Cho biết sai số chiếm bao nhiêu phần trăm so với quy mô của đối tượng được đo.
  
  *Ví dụ so sánh sống động:*
  - Một kỹ sư đo chiều dài cây cầu dây văng dài $1.000$ m với sai số $d = 1$ cm ($0,01$ m). Sai số tương đối là:
    $ delta_1 = (0,01) / 1000 = 0,00001 = 0,001\% $ $arrow$ Độ chính xác thần kỳ, đẳng cấp thế giới!
  - Một dược sĩ đong liều lượng độc chất trong viên thuốc trợ tim nặng $10$ mg với sai số $d = 1$ mg. Sai số tương đối là:
    $ delta_2 = 1 / 10 = 10\% $ $arrow$ Sai số kinh hoàng, có thể khiến bệnh nhân ngừng tim tử vong ngay lập tức!
  
  Cùng là sai số $1$ đơn vị, nhưng trong xây dựng cầu thì tuyệt hảo, còn trong sản xuất thuốc thì giết người! *Sai số tương đối chính là thước đo chất lượng thực sự của phép đo lường!*
]

---

== BÀI 13: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM — TRUNG BÌNH CỘNG CÓ PHẢI KẺ NÓI DỐI?

Khi đứng trước một tập dữ liệu khổng lồ gồm hàng triệu con số, bộ não con người không thể nhớ hết từng giá trị riêng lẻ. Chúng ta cần những "đại sứ đại diện" để tóm tắt bức tranh toàn cảnh: *Số trung bình ($bar(x)$), Trung vị ($M_e$), Mốt ($M_o$) và Tứ phân vị ($Q_1, Q_2, Q_3$)*.

Nhưng nếu chỉ biết dùng duy nhất một con số trung bình cộng, con người sẽ rơi vào những ảo giác thống kê vô cùng tai hại!

#story-box(
  title: "Bill Gates Bước Vào Quán Bia Nghèo: Khi Số Trung Bình Cộng Trở Thành Kẻ Lừa Đảo",
  author: "Nghịch lý Thu nhập Trung bình & Khái niệm Trung vị (Median)",
)[
  Hãy tưởng tượng một quán bia bình dân ở ngoại ô thành phố Seattle, nơi có 10 người lao động nghèo đang ngồi uống bia. Thu nhập hàng tháng của mỗi người dao động từ 10 đến 16 triệu đồng:
  $ 10, 11, 12, 12, 13, 13, 14, 14, 15, 16 "(triệu đồng)" $
  - Thu nhập trung bình của quán bia là: $bar(x) = (10 + 11 + ... + 16) / 10 = 13$ triệu đồng/tháng. Con số này phản ánh rất trung thực đời sống của những người trong quán.
  
  Đột nhiên, cánh cửa quán bia mở ra, và tỷ phú *Bill Gates* bước vào ngồi uống một chai nước suối! Thu nhập hàng tháng của Bill Gates ước tính khoảng *100 tỷ đồng* ($100.000$ triệu đồng).
  
  Lúc này, hãy tính lại thu nhập trung bình của 11 người trong quán:
  $ bar(x)_("mới") = (130 + 100.000) / 11 approx 9.102 "triệu đồng (hơn 9,1 TỶ ĐỒNG/NGƯỜI/THÁNG)!" $
  
  Nếu một tờ báo giật tít: *“Kỳ tích kinh tế: Thu nhập trung bình của người dân trong quán bia ngoại ô đã vọt lên hơn 9 tỷ đồng mỗi tháng!”*, thì đó là một trò hề lố bịch! Mười người lao động kia không hề giàu thêm một xu nào, túi tiền của họ vẫn xẹp lép như cũ! Con số trung bình cộng đã bị bóp méo hoàn toàn bởi một *Giá trị ngoại lai cực đoan (Extreme Outlier)* là Bill Gates!
  
  *Sự cứu rỗi của Trung vị ($M_e$):*
  Sắp xếp lại 11 người theo thứ tự thu nhập tăng dần và lấy người đứng chính giữa (người thứ 6):
  $ M_e = 13 "triệu đồng"! $
  Dù Bill Gates có kiếm được 100 tỷ hay 1.000 tỷ đồng, số Trung vị $M_e$ vẫn đứng sừng sững ở mức 13 triệu đồng, phản ánh trung thực mức sống của đại đa số người dân! Đó là lý do tại sao các tổ chức quốc tế như Ngân hàng Thế giới (World Bank) luôn dùng Thu nhập Trung vị thay vì Thu nhập Trung bình để đo lường mức sống thực sự của một quốc gia!
]

#tech-box(title: "Mốt (Mode) & Thuật toán Đề xuất Thời trang Uniqlo, Zara")[
  - *Mốt trong sản xuất dây chuyền công nghiệp*: Nếu một hãng giày thể thao Nike sản xuất giày theo "cỡ giày trung bình" là $40,35$, họ sẽ phá sản ngay lập tức vì không ai có bàn chân cỡ $40,35$ cả! Họ phải sử dụng *Mốt ($M_o$)* — cỡ giày có số lượng người mua nhiều nhất (ví dụ cỡ 40 và cỡ 41) — để phân bổ $70\%$ công suất nhà máy vào các cỡ này, tối ưu hóa hàng tồn kho và chi phí lưu kho.
  - *Mốt trong đề xuất thuật toán Spotify, Netflix*: Danh sách bài hát "Top Hits" hay phim "Trending No. 1" chính là giá trị Mốt của hành vi người dùng trong 24 giờ qua!
]

#story-box(
  title: "Định Lý Giới Hạn Trung Tâm (CLT) & Bàn Cờ Đinh Galton Kỳ Ảo",
  author: "Sir Francis Galton (Anh, 1822 – 1911) & Carl Friedrich Gauss (1777 – 1855)",
)[
  Năm 1889, nhà bác học người Anh Sir Francis Galton đã sáng chế ra một cỗ máy kỳ diệu gọi là *Galton Board (Bàn cờ đinh)*: Một hộp kính thẳng đứng bên trong có hàng trăm chiếc đinh được đóng so le hình tam giác. Từ trên đỉnh, hàng vạn viên bi chì nhỏ được thả rơi tự do.
  
  Mỗi khi viên bi va vào một chiếc đinh, nó chỉ có hai lựa chọn ngẫu nhiên $50/50$: nảy sang trái hoặc nảy sang phải. Tưởng chừng như sự rơi hỗn loạn của hàng vạn viên bi sẽ tạo ra một đống bừa bãi vô trật tự dưới đáy hộp kính. Thế nhưng, một phép màu đã hiện ra: *Các viên bi dưới đáy luôn luôn tích tụ lại thành một đường cong hình quả chuông đối xứng hoàn hảo — Đường cong Phân phối Chuẩn Gauss (Normal Curve)!*
  
  Galton đã thốt lên đầy xúc động:
  *“Nếu người Hy Lạp cổ đại biết đến Phân phối Chuẩn, chắc chắn họ đã tôn thờ nó như một vị thần tối cao cai quản trật tự từ cõi hỗn mang!”*
  
  Đó chính là minh chứng trực quan của *Định lý Giới hạn Trung tâm (Central Limit Theorem)*: Dù các biến số ngẫu nhiên ban đầu có kỳ quặc thế nào, thì tổng hoặc trung bình của một lượng lớn các biến số độc lập luôn luôn hội tụ về Phân phối Chuẩn! Chiều cao con người, chỉ số IQ, huyết áp, điểm thi tốt nghiệp THPT toàn quốc đều là sự tích lũy của hàng ngàn yếu tố vi mô độc lập, nên tất cả đều tự động xếp hàng thành hình quả chuông Gauss tuyệt mỹ!
]

---

== BÀI 14: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN — SỨC MẠNH CỦA ĐỘ LỆCH CHUẨN

Biết số trung bình thôi là chưa đủ, ta cần phải biết: *Các con số dữ liệu đang co cụm sít sao quanh số trung bình hay đang tản mác hỗn loạn ra xa?* Thước đo mức độ rủi ro và biến động đó chính là: *Khoảng biến thiên ($R$), Khoảng tứ phân vị ($I Q R$), Phương sai ($s^2$) và Độ lệch chuẩn ($s$)*.

#story-box(
  title: "Florence Nightingale & Biểu đồ Hoa hồng Cứu Sống Hàng Vạn Binh Sĩ Năm 1854",
  author: "Florence Nightingale (Anh, 1820 – 1910) — Người Mẹ Của Ngành Y Tế Hiện Đại",
)[
  Năm 1854, cuộc Chiến tranh Crimea bùng nổ. Nữ y tá quý tộc người Anh *Florence Nightingale* tình nguyện dẫn đầu đoàn 38 nữ y tá đến bệnh viện dã chiến quân đội tại Scutari (Thổ Nhĩ Kỳ). Khi bước chân vào bệnh viện, bà kinh hoàng chứng kiến cảnh tượng địa ngục: Binh sĩ nằm la liệt trên sàn nhà đầy rác rưởi, cống rãnh bốc mùi hôi thối, chuột bọ chạy lăng xăng, nước uống bị ô nhiễm và thiếu thốn thuốc men trầm trọng.
  
  Tỉ lệ tử vong của thương binh tại bệnh viện lên tới *42%*! Nhưng các tướng lĩnh quân đội chỉ coi đó là "tổn thất bình thường trên chiến trường do đạn pháo của quân Nga".
  
  Florence Nightingale không chỉ là một y tá có trái tim nhân hậu, bà còn là một *nhà thống kê học thiên tài*! Bà bắt đầu ghi chép tỉ mỉ từng ca tử vong mỗi ngày thành một bộ dữ liệu khổng lồ. Để thuyết phục Quốc hội Anh và Nữ hoàng Victoria đang thờ ơ, bà đã phát minh ra một loại biểu đồ thống kê trực quan mang tính cách mạng: *Biểu đồ Hoa hồng (Rose Diagram / Polar Area Diagram / Coxcomb)*!
  
  Trên biểu đồ hình cánh quạt hoa hồng của Nightingale, mỗi cánh hoa đại diện cho một tháng:
  - Phần màu đỏ nhỏ xíu đại diện cho số binh sĩ chết vì vết thương đạn bắn ngoài mặt trận.
  - Phần màu xanh lam khổng lồ chiếm tới $85\%$ diện tích đại diện cho số binh sĩ chết vì *BỆNH TRUYỀN NHIỄM VÀ ĐIỀU KIỆN VỆ SINH BẨN THỈU TRONG BỆNH VIỆN* (thương hàn, tả, kiết lỵ)!
  
  Bằng sức mạnh của dữ liệu thống kê trực quan, Nightingale đã chứng minh hùng hồn trước Quốc hội: *Quân đội Anh không chết vì súng đạn kẻ thù, họ đang bị giết chết bởi sự dơ bẩn và thiếu vệ sinh của chính bệnh viện quân y!*
  
  Chính phủ Anh lập tức cho cải tạo toàn bộ hệ thống thoát nước, thông gió, giặt sạch chăn màn và đun sôi nước uống. Chỉ trong vòng 6 tháng, tỉ lệ tử vong tại bệnh viện đã rơi thẳng đứng từ *42% xuống chỉ còn 2%!*
  
  Florence Nightingale trở thành người phụ nữ đầu tiên được bầu vào Viện Thống kê Hoàng gia Anh. Bà đã dùng các con số thống kê và độ phân tán như một vũ khí thiêng liêng cứu sống hàng triệu sinh mạng con người trên khắp thế giới!
]

#hook-box(title: "Chọn Xạ thủ đi Olympic: Điểm 8 An Toàn hay Điểm 10 Đau Tim?")[
  Thầy viết kết quả bắn 10 viên đạn của hai xạ thủ lên bảng:
  - Xạ thủ An: $8, 8, 8, 8, 8, 8, 8, 8, 8, 8$ $arrow$ Điểm trung bình: $bar(x)_A = 8,0$.
  - Xạ thủ Bình: $10, 6, 10, 6, 10, 6, 10, 6, 10, 6$ $arrow$ Điểm trung bình: $bar(x)_B = 8,0$.
  
  *“Cả hai xạ thủ đều có điểm trung bình 8,0 bằng nhau chằn chặn. Nếu là Huấn luyện viên trưởng đội tuyển bắn súng Quốc gia đi thi đấu Olympic, các em sẽ chọn ai?”*
  
  Cả lớp sẽ chia làm hai phe tranh luận sôi nổi. Thầy bấm máy tính tính Độ lệch chuẩn:
  - Độ lệch chuẩn của An: $s_A = 0$! An bắn ổn định tuyệt đối như một cỗ máy, không hề có rủi ro!
  - Độ lệch chuẩn của Bình: $s_B = 2,0$! Bình có độ biến động rất lớn, lúc thăng hoa bắn 10, lúc run tay rớt xuống 6 điểm!
  
  *Thông điệp của Thầy:* "Trong tài chính đầu tư phố Wall hay chọn phi công tiêm kích: Điểm trung bình chỉ là một nửa sự thật. ĐỘ LỆCH CHUẨN chính là thước đo RỦI RO! Người thành công bền vững không phải là người thỉnh thoảng có một ngày bùng nổ rồi lụn bại, mà là người có độ lệch chuẩn nhỏ nhất: giữ vững kỷ luật và phong độ đỉnh cao qua từng ngày!"
]

#misconception-box(
  title: "Cạm bẫy Chia n hay Chia n - 1: Hiệu chỉnh Bessel (Bessel's Correction)",
  misconception: "Phương sai lúc nào cũng lấy tổng bình phương độ lệch chia cho tổng số quan sát n!",
  correction: "Nếu tính phương sai cho TOÀN BỘ TẬP DÂN SỐ (Population) thì chia cho N. Nhưng khi ta chỉ lấy MẪU NGẪU NHIÊN (Sample) gồm n phần tử từ thực tế, ta BẮT BUỘC PHẢI CHIA CHO n - 1 để bù trừ sai số ước lượng (Hiệu chỉnh Bessel)!"
)[
  Khi chỉ lấy mẫu nhỏ $n$, các phần tử trong mẫu có xu hướng gần với số trung bình mẫu $bar(x)$ hơn là gần với số trung bình thực sự $mu$ của toàn bộ dân số. Do đó, nếu chia cho $n$, phương sai mẫu sẽ luôn luôn *bị đánh giá thấp hơn (Underestimate)* so với thực tế!
  
  Chia cho $n - 1$ là một hiệu chỉnh toán học thiên tài giúp phương sai mẫu trở thành một *Ước lượng không chệch (Unbiased Estimator)*. Đó là lý do trên máy tính Casio luôn có hai phím riêng biệt: $sigma_x$ (chia $n$) và $s_x$ (chia $n-1$)!
]

#misconception-box(
  title: "Nhầm lẫn Tai hại giữa Độ lệch chuẩn (s) và Sai số chuẩn (SE)",
  misconception: "Độ lệch chuẩn s và Sai số chuẩn SE = s / sqrt(n) là cùng một đại lượng, dùng thay thế cho nhau được!",
  correction: "Độ lệch chuẩn s đo lường ĐỘ PHÂN TÁN CỦA CÁC CÁ THỂ trong mẫu (ví dụ: chiều cao giữa các học sinh). Còn Sai số chuẩn SE đo lường ĐỘ KHÔNG CHẮC CHẮN CỦA GIÁ TRỊ TRUNG BÌNH MẪU khi ta lặp lại khảo sát nhiều lần!"
)[
  - Khi cỡ mẫu $n$ tăng lên từ $100$ lên $10.000$: Độ lệch chuẩn $s$ của chiều cao học sinh *hầu như không đổi* (vì người thấp người cao vẫn thế).
  - Nhưng Sai số chuẩn $S E = s / sqrt(n)$ sẽ *co cụm giảm đi 10 lần*! Điều này phản ánh niềm tin vững chắc: Khảo sát 10.000 người cho ta giá trị trung bình chính xác gấp 10 lần so với chỉ khảo sát 100 người!
]

#dialogue-box(title: "Đối thoại Socrates: Nghịch lý Simpson trong Thử nghiệm Thuốc")[
  *Socrates:* Này bạn trẻ, một loại thuốc điều trị sỏi thận được thử nghiệm trên 800 bệnh nhân:
  - Ở nhóm sỏi nhỏ: Thuốc $A$ chữa khỏi $93\%$, thuốc $B$ chữa khỏi $87\%$.
  - Ở nhóm sỏi lớn: Thuốc $A$ chữa khỏi $73\%$, thuốc $B$ chữa khỏi $69\%$.
  Hỏi: Bác sĩ nên kê đơn thuốc nào cho bệnh nhân?
  
  *Học trò:* Thưa thầy, hiển nhiên là thuốc $A$ tốt hơn thuốc $B$ ở cả hai trường hợp sỏi nhỏ và sỏi lớn!
  
  *Socrates:* Thế nhưng khi Giám đốc bệnh viện tổng kết dữ liệu chung cuộc của cả 800 ca: Thuốc $B$ chữa khỏi $83\%$, trong khi thuốc $A$ chỉ chữa khỏi $78\%$! Báo chí lên án thuốc $A$ kém cỏi. Ai đúng ai sai?
  
  *Học trò:* Ôi trời đất ơi! Sao gộp lại thuốc $A$ lại thua được ạ?
  
  *Socrates:* Hãy nhìn vào số ca bệnh! Bác sĩ thử thuốc $A$ chủ yếu trên các ca sỏi lớn nguy kịch (chiếm $75\%$ số ca của thuốc $A$), trong khi thuốc $B$ được ưu ái thử trên các ca sỏi nhỏ nhẹ tênh (chiếm $75\%$ số ca của thuốc $B$)! Biến số ẩn "Mức độ nặng nhẹ của bệnh" đã bóp méo toàn bộ tỉ lệ trung bình gộp chung!
  
  *Học trò:* Em hiểu rồi! Số liệu trung bình gộp nếu không chia theo phân lớp sẽ trở thành chiếc bẫy tinh vi nhất đánh lừa công chúng!
]

#deep-dive-box(title: "Tiêu chuẩn Six Sigma (6 Sigma) Tại Nhà Máy Đúc Chip Bán Dẫn TSMC")[
  Tại các nhà máy đúc chip bán dẫn tối tân nhất của TSMC ở Đài Loan sản xuất chip 3-nanomet cho iPhone, hàng tỷ bóng bán dẫn được khắc trên một tấm bán dẫn silicon (Wafer) bằng tia siêu cực tím (EUV).
  
  Làm thế nào để đảm bảo hàng triệu con chip xuất xưởng không bị lỗi hỏng? Họ áp dụng *Quy tắc Six Sigma ($6sigma$)* của nhà toán học Carl Friedrich Gauss:
  - Khoảng dung sai thiết kế cho phép phải bao trùm tới $6$ lần độ lệch chuẩn ($mu plus.minus 6sigma$).
  - Tỉ lệ sản phẩm hoàn hảo đạt tới *99,99966%*!
  - Nghĩa là trong $1.000.000$ bóng bán dẫn được sản xuất ra, chỉ được phép có tối đa *3,4 hạt lỗi*!
  
  Toán học độ lệch chuẩn lớp 10 chính là thước đo chất lượng vàng bảo đảm cho toàn bộ nền công nghiệp bán dẫn trị giá 600 tỷ USD của nhân loại vận hành trơn tru!
]

#deep-dive-box(title: "Lý Thuyết Danh Mục Đầu Tư Markowitz (Nobel Kinh Tế 1990) & Triệt Tiêu Rủi Ro")[
  Tại sao các nhà tài chính phố Wall không bao giờ dồn toàn bộ tiền vào một cổ phiếu duy nhất dù cổ phiếu đó có lợi nhuận cao đến mấy?
  
  Năm 1952, chàng nghiên cứu sinh 25 tuổi *Harry Markowitz* đã công bố một mô hình toán học đoạt giải Nobel Kinh tế năm 1990: *Modern Portfolio Theory (MPT)*.
  
  Giả sử ta đầu tư vào hai tài sản $A$ và $B$ với tỉ trọng $w_A$ và $w_B$ ($w_A + w_B = 1$). Phương sai rủi ro của toàn bộ danh mục đầu tư là:
  $ sigma_p^2 = w_A^2 sigma_A^2 + w_B^2 sigma_B^2 + 2 w_A w_B rho_(A B) sigma_A sigma_B $
  trong đó $rho_(A B)$ là hệ số tương quan giữa hai tài sản (chạy từ $-1$ đến $+1$).
  
  *Điều kỳ diệu xảy ra khi $rho_(A B) = -1$ (hai tài sản biến động ngược chiều nhau):*
  $ sigma_p^2 = (w_A sigma_A - w_B sigma_B)^2 $
  Nếu chọn tỉ trọng $w_A = sigma_B / (sigma_A + sigma_B)$ và $w_B = sigma_A / (sigma_A + sigma_B)$, ta có:
  $ sigma_p^2 = 0 quad arrow quad sigma_p = 0! $
  
  *Kết luận chấn động:* Bằng cách phối hợp hai cổ phiếu có độ rủi ro rất cao nhưng biến động ngược chiều nhau (ví dụ: công ty sản xuất kem chống nắng và công ty sản xuất ô dù đi mưa), nhà đầu tư có thể *TRIỆT TIÊU HOÀN TOÀN RỦI RO ($sigma_p = 0$)* mà vẫn duy trì được mức lợi nhuận dương kỳ vọng! Đó chính là sức mạnh tối thượng của Toán học Thống kê trong tài chính định lượng!
]

#inquiry-box(title: "Nhiệm vụ Python: Vẽ Biểu Đồ Hộp Boxplot, Lọc Nhiễu & Mô Phỏng CLT")[
  ```python
  import numpy as np

  # 1. Phát hiện Outlier bằng Hàng rào Tukey (IQR):
  data = np.array([12, 13, 14, 14, 15, 15, 16, 17, 18, 19, 45, 2])
  q1, q2, q3 = np.percentile(data, [25, 50, 75])
  iqr = q3 - q1
  lower_fence = q1 - 1.5 * iqr
  upper_fence = q3 + 1.5 * iqr
  outliers = data[(data < lower_fence) | (data > upper_fence)]
  print(f"IQR: {iqr} | Fences: [{lower_fence}; {upper_fence}] | Dị biệt: {outliers}")

  # 2. Mô phỏng Định lý Giới hạn Trung tâm (CLT) bằng Monte Carlo:
  # Gieo 100 con xúc xắc ngẫu nhiên (phân phối đều), lặp lại 10.000 lần
  np.random.seed(42)
  dice_rolls = np.random.randint(1, 7, size=(10000, 100))
  sample_means = dice_rolls.mean(axis=1)
  print(f"Trung bình các mẫu: {sample_means.mean():.4f} (Lý thuyết: 3.5000)")
  print(f"Độ lệch chuẩn của trung bình mẫu: {sample_means.std():.4f} (Lý thuyết: {np.sqrt(35/12)/10:.4f})")
  ```
]

#pagebreak()
'''
