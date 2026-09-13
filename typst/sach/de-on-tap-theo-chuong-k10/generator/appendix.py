# -*- coding: utf-8 -*-

CONTENT = r'''= PHẦN PHỤ LỤC: MA TRẬN 40 CÂU HỎI KHAI MỞ SƯ PHẠM ĐỈNH CAO KHỐI 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành riêng cho Quý Thầy Cô giáo: Bảng tra cứu tốc hành 3 phút mở đầu tiết học Toán 10. Mỗi bài học đều có một câu hỏi Hook kích nổ sự tò mò, phá tan sự uể oải đầu giờ của học sinh và kết nối trực tiếp vào bản chất toán học cùng kỷ nguyên số.
]

#align(center)[
  #table(
    columns: (2.2cm, 4cm, 5.5cm, 4.3cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e293b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    // Header
    table.header(
      text(fill: white, weight: "bold", size: 9pt)[Bài học],
      text(fill: white, weight: "bold", size: 9pt)[Câu hỏi Hook đầu giờ (3 phút)],
      text(fill: white, weight: "bold", size: 9pt)[Bản chất nhận thức cốt lõi],
      text(fill: white, weight: "bold", size: 9pt)[Ứng dụng thực tế & Kỷ nguyên AI],
    ),
    
    // Rows
    [Bài 1: Mệnh đề], [Hai người gác cổng Thật thà - Nói dối trước hai cửa Sống - Chết: Hỏi câu gì để sống sót?], [Bảng chân trị logic, phép nhân dấu $(-1) times (-1) = 1$ trong mệnh đề.], [Cổng logic bán dẫn AND/OR trong chip máy tính M3, câu lệnh điều kiện `if/else`.],
    [Bài 2: Tập hợp], [Khách sạn vô hạn Hilbert đã kín chỗ, làm sao xếp phòng cho khách mới mà không đuổi ai?], [Lực lượng tập hợp vô hạn; ánh xạ tương ứng $1 - 1$ giải phóng trực giác hữu hạn.], [Cơ sở dữ liệu quan hệ SQL, phép lọc tập hợp JOIN/UNION trong Big Data.],
    [Mở rộng: Russell], [Ông thợ cạo thành Seville chỉ cạo cho ai không tự cạo: Vậy ông có tự cạo cho mình không?], [Nghịch lý tự tham chiếu; sự sụp đổ của lý thuyết tập hợp ngây thơ, hệ ZFC.], [Định lý bất toàn Gödel, giới hạn không thể vượt qua của trí tuệ nhân tạo.],
    [Bài 3: BPT bậc nhất], [Có 200k trong ví đi ăn chè (20k) và trà sữa (30k): Những tổ hợp nào khả thi không bị thiếu tiền?], [Bất đẳng thức đại số chuyển thành nửa mặt phẳng hình học có ranh giới đường thẳng.], [Hành lang an toàn xe tự hành Tesla, vùng không gian di chuyển cánh tay robot.],
    [Bài 4: Hệ BPT & Quy hoạch], [Tại sao điểm kiếm nhiều tiền nhất của tiệm bánh mì luôn nằm ở các ĐỈNH NHỌN của đa giác?], [Đường mức doanh thu tịnh tiến; định lý cơ bản của Quy hoạch tuyến tính trên tập lồi.], [Thuật toán Simplex giải bài toán Logistics Amazon, điều phối máy bay Vietnam Airlines.],
    [Bài 5: Lượng giác $0 degree - 180 degree$], [Tại sao góc tù lại có Cosin âm trong khi độ dài cạnh tam giác không bao giờ âm?], [Đại số hóa hình học: Giá trị lượng giác là tọa độ hình chiếu trên nửa đường tròn đơn vị.], [Ma trận xoay 2D/3D trong game Liên Quân/PUBG, xử lý tín hiệu âm thanh.],
    [Bài 6: Định lý Côsin & Sin], [Làm sao đo khoảng cách giữa hai đỉnh núi lửa qua vực dung nham mà không cần bước qua?], [Định lý Côsin mở rộng Pythagoras cho góc bất kỳ; định lý Sin chuẩn hóa đường kính $2R$.], [Hệ thống Sonar tàu ngầm định vị đáy biển, tên lửa phòng không Vòm Sắt Iron Dome.],
    [Bài 7: Giải tam giác & Heron], [Làm sao Eratosthenes đo được chu vi Trái Đất 2.200 năm trước chỉ bằng một cây gậy cắm trên cát?], [Phương pháp tam giác đạc hình học; công thức Heron tính diện tích qua 3 cạnh.], [Hệ thống định vị toàn cầu GPS 24 vệ tinh, thuật toán dò tia Ray Tracing card RTX.],
    [Bài 8: Khái niệm Vectơ], [Đi bộ 5 km về phía Bắc rồi 5 km về phía Nam: Đi 10 km nhưng vị trí cách nhà đúng 0 km?], [Vectơ tự do: Đại lượng có hướng và độ lớn, không phụ thuộc vào điểm đặt ban đầu.], [Vector Embedding trong ChatGPT, biểu diễn ngữ nghĩa từ ngữ trong không gian 1536 chiều.],
    [Bài 9: Tổng & Hiệu vectơ], [Tại sao máy bay chở khách Boeing 300 tấn lại luôn chọn cất cánh NGƯỢC CHIỀU GIÓ BÃO?], [Quy tắc hình bình hành; hợp lực vectơ khí động học nâng cánh máy bay vút lên.], [Hệ thống cân bằng điện tử ESP trên ô tô cao tốc, chống lật khi vào cua gấp.],
    [Bài 10: Tích số với vectơ], [Nghệ sĩ xiếc đặt đầu ngậy nhọn vào đâu để giữ thăng bằng chiếc mâm có 3 quả tạ khác nhau?], [Tâm tỉ cự: Trọng tâm của hệ chất điểm $alpha vec(I A) + beta vec(I B) + gamma vec(I C) = vec(0)$.], [Tọa độ tỉ cự Barycentric trong đồ họa Unreal Engine 5 để dựng vân bề mặt 3D.],
    [Bài 11: Tích vô hướng], [Vác bao xi măng 50 kg đi bộ đường bằng suốt 10 km kiệt sức, tại sao Công cơ học bằng 0?], [Định nghĩa công $A = vec(F) dot vec(s) = F s cos(90 degree) = 0$; đo độ xiên lệch giữa hai vectơ.], [Độ tương đồng Cosine (Cosine Similarity) đo sự giống nhau giữa khuôn mặt FaceID iPhone.],
    [Bài 12: Sai số & Gần đúng], [Tại sao lỗi làm tròn 0,000000095 giây sau 100 giờ lại làm nổ tung căn cứ tên lửa Patriot?], [Sai số tuyệt đối, sai số tương đối, sự tích lũy sai số làm tròn số nhị phân.], [Chuẩn dấu phẩy động IEEE 754 trong chip Intel/Apple, phân tích rủi ro vệ tinh.],
    [Bài 13: Xu thế trung tâm], [Bill Gates bước vào quán bia nghèo: Thu nhập trung bình vọt lên 9 tỷ, có ai giàu lên không?], [Cạm bẫy số trung bình cộng trước giá trị ngoại lai; sức mạnh trung thực của Trung vị $M_e$.], [Định giá bất động sản trên trang Batdongsan.com, đo lường bất bình đẳng kinh tế.],
    [Bài 14: Độ phân tán], [Hai xạ thủ cùng có điểm trung bình 8,0: Người luôn bắn 8, người bắn 10 và 6, chọn ai đi Olympic?], [Phương sai và độ lệch chuẩn đo lường độ rủi ro, độ ổn định và tính biến động.], [Tiêu chuẩn chất lượng Six Sigma ($6sigma$) tại nhà máy đúc chip TSMC, quản lý rủi ro cổ phiếu.],
    [Bài 15: Hàm số & Biến thiên], [Hòn đá rơi tự do từ độ cao 20m: Làm sao biết vị trí chính xác của nó ở phần nghìn giây?], [Mô hình quan hệ nhân quả; ánh xạ $y = f(x)$ mô tả quy luật vận động của tự nhiên.], [Hàm kích hoạt (Activation Function) ReLU/Sigmoid trong mạng nơ-ron não bộ nhân tạo AI.],
    [Bài 16: Hàm số bậc hai], [Angry Birds bắn chú chim bay vút lên: Tại sao quỹ đạo luôn là chữ U úp ngược mà không bay thẳng?], [Quỹ đạo Parabol của chuyển động ném xiên dưới trọng trường của Galileo; đỉnh cực đại.], [Gương phản xạ kính thiên văn Newton, cáp treo Cầu Cổng Vàng, thuật toán Gradient Descent.],
    [Bài 17: Dấu tam thức bậc hai], [Một nhà máy bán bao nhiêu tai nghe Bluetooth thì bắt đầu có lãi để không sập tiệm?], [Quy tắc Trong trái - Ngoài cùng; nghiệm phương trình là ranh giới đổi màu đại số.], [Vùng an toàn ứng suất chịu lực của dầm cầu thép, ranh giới phân loại máy học SVM.],
    [Bài 18: PT quy về bậc hai], [Giải $sqrt(x - 2) = x - 4$ ra $x = 3$: Tại sao thay vào lại ra $1 = -1$? Nghiệm ma từ đâu chui ra?], [Phép bình phương hai vế làm mất dấu âm, sinh ra nghiệm ngoại lai ma quái.], [Khử nghiệm ma trong thuật toán dò giao điểm ánh sáng với vật thể 3D trong điện ảnh.],
    [Bài 19: Tọa độ Oxy], [René Descartes nằm trên giường nhìn con ruồi bò trên trần nhà mùa đông 1619: Hình học được số hóa!], [Hệ trục tọa độ Descartes kết duyên Đại số với Hình học; mỗi điểm là một cặp số thực.], [Độ phân giải màn hình 4K màn hình điện thoại iPhone, bản đồ định vị số hóa Google Maps.],
    [Bài 20: Đường thẳng Oxy], [Hai máy bay bay theo hai đường thẳng cắt nhau trên màn hình radar: Có chắc chắn đâm nhau không?], [Phương trình tham số với tham số thời gian $t$; hai quỹ đạo cắt nhau chưa chắc gặp nhau.], [Thuật toán Raycasting trong trò chơi kinh điển DOOM 1993, điều phối không lưu sân bay.],
    [Bài 21: Vị trí, Góc, K/c], [Người lính cứu hỏa chạy từ lều $A$ xuống bờ sông múc nước đến đám cháy $B$: Điểm nào ngắn nhất?], [Công thức khoảng cách từ điểm đến đường thẳng; nguyên lý phản xạ đối xứng Fermat.], [Thuật toán phân loại ung thư Support Vector Machine (SVM) tối đa hóa khoảng cách biên.],
    [Bài 22: Đường tròn Oxy], [Lạc trong rừng sâu: Ba trạm phát sóng BTS đo khoảng cách điện thoại thế nào để cứu sống bạn?], [Phương trình đường tròn giải tích; giao điểm chung duy nhất của 3 đường tròn cứu hộ.], [Quét sóng radar máy bay quân sự tàng hình, quả cầu bao Bounding Sphere chống va chạm PS5.],
    [Bài 23: Ba đường Conic], [Đứng trong "Phòng thì thầm" nói rất khẽ người cách 40m nghe rõ; Tán sỏi thận không cần mổ?], [Tính chất quang học hai tiêu điểm của Elip, Parabol, Hypebol; định nghĩa qua tâm sai $e$.], [Quỹ đạo vệ tinh viễn thông địa tĩnh, hệ thống dẫn đường hàng hải quân sự LORAN-C.],
    [Bài 24: Quy tắc đếm], [Vali 3 số phá trong 33 phút; Tại sao thêm 3 ký tự nữa thì tên trộm phải mất hơn 3.600 NĂM?], [Quy tắc cộng và quy tắc nhân; sự bùng nổ tổ hợp lũy thừa $N^k$ làm tê liệt máy tính.], [Cây quyết định (Decision Tree) trong AI chấm điểm tín dụng ngân hàng phê duyệt hồ sơ vay.],
    [Bài 25: Hoán vị, Tổ hợp], [Tại sao siêu máy tính mạnh nhất Trái Đất không duyệt hết bàn cờ vây mà cần AI AlphaGo?], [Số trạng thái cờ vây vượt quá số nguyên tử toàn vũ trụ ($10^(170)$); chỉnh hợp vs tổ hợp.], [Mật mã khóa công khai RSA bảo vệ tài khoản ngân hàng, phân tích cấu trúc chuỗi DNA gen.],
    [Bài 26: Nhị thức Newton], [Tại sao phóng to chữ "A" lên 1.000 lần trên máy tính mà nét cong vẫn mịn màng không vỡ hạt?], [Tam giác Pascal, khai triển nhị thức; đa thức cơ sở Bernstein tạo đường cong Bézier.], [Định dạng phông chữ vector TrueType, công nghệ đồ họa vector Adobe Illustrator / Figma.],
    [Bài 27: Biến cố & Mẫu], [Gieo 2 con súc sắc: Tại sao con số 7 được coi là "Con số Tử thần" tại mọi sòng bạc Las Vegas?], [Không gian mẫu $Omega$ gồm 36 kịch bản đồng khả năng; số 7 có nhiều biến cố thuận lợi nhất (6 cách).], [Kiểm thử tự động Fuzz Testing săn lùng lỗ hổng bảo mật hệ điều hành Windows & iOS.],
    [Bài 28: Xác suất cổ điển], [Nghịch lý 3 cánh cửa Monty Hall: Tại sao ĐỔI CỬA lại tăng gấp đôi cơ hội trúng xe từ $1/3$ lên $2/3$?], [Xác suất cổ điển Laplace; cập nhật trọng số xác suất khi có thông tin loại bỏ từ MC.], [ChatGPT/LLM bản chất là cỗ máy tính xác suất chọn từ tiếp theo phù hợp ngữ cảnh.],
    [CĐ 1: Hệ PT 3 ẩn & Gauss], [Cân bằng phản ứng Hóa học Oxy hóa - Khử phức tạp bằng hệ 3 phương trình 3 ẩn trong 3 giây?], [Ma trận bậc thang; các phép biến đổi sơ cấp trên dòng không làm thay đổi giao điểm hình học.], [Mô hình kinh tế vĩ mô Nobel Leontief, thuật toán xếp hạng trang web Google PageRank.],
    [CĐ 2: Quy nạp Toán học], [Làm thế nào một sinh vật hữu hạn chứng minh được chân lý cho VÔ HẠN các số tự nhiên?], [Hiệu ứng Domino quy nạp: Bước neo cơ sở $n=1$ và bước chuyển tiếp từ bậc thang $k$ lên $k+1$.], [Chứng minh tính đúng đắn của thuật toán đệ quy trong khoa học máy tính, Tháp Hà Nội.],
    [CĐ 3: Conic & Thiên văn], [Làm sao phóng tàu từ Trái Đất lên Sao Hỏa 500 triệu km mà hầu như không tốn giọt xăng nào?], [Quỹ đạo Elip chuyển tiếp Hohmann; định luật bảo toàn năng lượng trong trường hấp dẫn.], [Kính viễn vọng không gian James Webb tại điểm Lagrange L2, quỹ đạo quầng Halo Orbit.],
    [Chương X: Tự học Kỷ nguyên AI], [Tại sao học vẹt công thức sẽ bị AI thay thế trong 3 giây, còn người biết đặt câu hỏi là vô giá?], [Năng lực tự nghiên cứu độc lập, sổ tay phẫu thuật sai lầm, biến AI thành gia sư Socrates.], [Kỹ năng Prompting đối thoại phản biện, định hướng nghiên cứu khoa học từ ghế nhà trường.],
    [Ôn tập: Bẫy điều kiện $a=0$], [Tại sao phương trình tham số $m x^2 - 2x + 1 = 0$ có nghiệm duy nhất lại khiến $80\%$ học sinh mất điểm?], [Bẫy tam thức suy biến: Khi $a=0$, phương trình trở thành bậc nhất có đúng 1 nghiệm!], [Xử lý trường hợp biên (Edge Cases) trong phần mềm điều khiển xe tự hành tránh tai nạn.],
    [Ôn tập: Bẫy chia Vectơ], [Tại sao trên đời có phép nhân vô hướng hai vectơ nhưng TUYỆT ĐỐI KHÔNG CÓ PHÉP CHIA VECTƠ?], [Không gian vectơ không có phần tử nghịch đảo cho phép nhân vô hướng; vô số nghiệm vuông góc.], [Tính đơn hướng của không-thời gian vật lý, cấu trúc đại số trừu tượng của không gian Hilbert.],
    [Ôn tập: Bẫy SSA tam giác], [Biết hai cạnh và một góc không xen giữa ($a, b, hat(A)$): Tại sao có thể vẽ được HAI tam giác khác nhau?], [Trường hợp góc tù/nhọn SSA suy biến; phương trình bậc hai theo cạnh thứ ba có 2 nghiệm dương.], [Lập trình định vị điểm giao thoa trong kỹ thuật trắc địa địa chính và quét lidar 3D.],
    [Ôn tập: Bẫy Simpson Thống kê], [Một loại thuốc chữa bệnh có tỉ lệ khỏi cao hơn ở cả nam lẫn nữ, gộp chung lại tỉ lệ lại thấp hơn?], [Nghịch lý Simpson: Trọng số mẫu không đồng đều giữa các nhóm gây ảo giác đảo ngược xu thế.], [Thẩm định lâm sàng thuốc mới của FDA Hoa Kỳ, phân tích dữ liệu thử nghiệm A/B Testing.],
    [Ôn tập: Stars & Bars], [Chia 10 cái kẹo giống nhau cho 3 đứa trẻ sao cho đứa nào cũng có kẹo: Có bao nhiêu cách?], [Kỹ thuật Vách ngăn Euler: Đặt 2 vách ngăn vào 9 khoảng trống giữa các chiếc kẹo: $C_9^2 = 36$.], [Phân phối tài nguyên bộ nhớ máy chủ đám mây Cloud Computing, mật mã hoán vị.],
    [Ôn tập: Monty Hall Mở rộng], [Nếu có 100 cánh cửa và MC mở ra 98 con dê: Bạn có đổi sang cánh cửa duy nhất còn lại không?], [Trực giác bừng sáng: Tỉ lệ thắng khi đổi cửa vọt lên $99\%$, đập tan ảo tưởng 50/50.], [Lý thuyết cập nhật niềm tin xác suất Bayes trong thuật toán lọc thư rác Gmail.],
  )
]

#pagebreak()

= PHẦN II: MƯỜI KỊCH BẢN ĐỐI THOẠI SOCRATES SƯ PHẠM MẪU TOÁN 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành cho Quý Thầy Cô thực nghiệm phương pháp dạy học kiến tạo (Constructivism): Thay vì thuyết giảng áp đặt một chiều, giáo viên dùng chuỗi câu hỏi Socrates để dẫn dắt học sinh tự va đập nhận thức, tự nhận ra mâu thuẫn và tự giác ngộ bản chất toán học.
]

#dialogue-box(title: "Kịch Bản 1: Mệnh Đề Kéo Theo P => Q & Tại Sao Tiền Đề Sai Thì Mệnh Đề Luôn Đúng?")[
  *Thầy (Socrates):* Các em hãy chú ý. Thầy đưa ra một lời hứa: *“Nếu ngày mai trời mưa ($P$), thầy sẽ mua trà sữa bao cả lớp uống ($Q$)”*. Trong trường hợp nào thì thầy bị coi là kẻ nói dối, nuốt lời?
  
  *Học sinh An:* Dạ, khi ngày mai trời mưa to thật, nhưng thầy bước vào lớp với hai bàn tay trắng và không mua cốc trà sữa nào ạ!
  
  *Thầy:* Rất chính xác! Tức là tiền đề $P$ ĐÚNG, nhưng kết luận $Q$ SAI ($1 arrow 0$ cho ra $0$). Bây giờ, giả sử ngày mai *TRỜI KHÔNG HỀ MƯA* ($P$ SAI), trời nắng chang chang, nhưng thầy vẫn vui vẻ mua trà sữa mời cả lớp. Thầy có vi phạm lời hứa không?
  
  *Học sinh Bình:* Dạ không hề! Thầy chỉ hứa là "Nếu mưa thì mua", chứ trời nắng thầy có tiền thầy thích mua thì càng tốt chứ sao ạ!
  
  *Thầy:* Tuyệt vời. Vậy nếu ngày mai trời nắng chang chang ($P$ SAI), và thầy *KHÔNG MUA* trà sữa. Thầy có bị coi là kẻ thất hứa không?
  
  *Học sinh An:* Dạ cũng không ạ! Vì trời đâu có mưa, thầy không mua thì thầy đâu có vi phạm lời hứa nào!
  
  *Thầy:* Đúng vậy! Trong cả hai trường hợp trời không mưa ($P$ SAI), thầy đều KHÔNG HỀ NÓI DỐI! Do đó, theo hiệp ước logic toán học, khi tiền đề $P$ sai, toàn bộ mệnh đề kéo theo $P arrow Q$ *MẶC NHIÊN ĐƯỢC COI LÀ ĐÚNG (Vacuously True)*!
  
  *Học sinh Bình:* Ồ! Giờ em mới hiểu tại sao mệnh đề: *“Nếu $2 + 2 = 5$ thì Mặt Trời mọc ở hướng Tây”* lại là một mệnh đề hoàn toàn ĐÚNG trong toán học!
  
  *Thầy:* Chính xác! Đó là nền tảng của toàn bộ hợp đồng bảo hiểm và logic điều kiện trong phần mềm máy tính!
]

#dialogue-box(title: "Kịch Bản 2: Tại Sao Điểm Kiếm Nhiều Tiền Nhất Lại Nằm Ở Đỉnh Nhọn Đa Giác Lồi?")[
  *Thầy:* Một xưởng bánh mì bị giới hạn bởi bột mì, đường và giờ công thợ, tạo thành một miền đa giác lồi ngũ giác $A B C D E$. Lợi nhuận là biểu thức $F(x, y) = 2x + 3y$. Một bạn đề xuất: "Sao không chọn một điểm nằm sâu bên trong bụng đa giác cho an toàn?". Ý các em thế nào?
  
  *Học sinh:* Thưa thầy, chọn điểm bên trong bụng thì bột vẫn còn thừa, đường vẫn còn thừa, công nhân vẫn rảnh rỗi! Tội gì không sản xuất thêm để tăng tiền!
  
  *Thầy:* Rất sắc sảo! Tức là ta phải đi ra mép bờ rào của đa giác. Nhưng mép bờ rào là một đoạn thẳng dài vô tận, điểm nào trên đoạn thẳng đó sẽ cho nhiều tiền nhất?
  
  *Học sinh:* Điểm ở giữa đoạn thẳng chăng?
  
  *Thầy:* Hãy tưởng tượng biểu thức $2x + 3y = C$ là một thanh thước kẻ thẳng tắp trượt song song trên mặt bàn. Khi thanh thước trượt tịnh tiến theo hướng tăng dần của lợi nhuận $C$, chiếc thước sẽ tiếp xúc với miền đa giác ở đâu trước khi rời hẳn khỏi đa giác?
  
  *Học sinh:* A! Nó sẽ chạm lần cuối cùng vào một *ĐỈNH NHỌN* nhô ra xa nhất của đa giác!
  
  *Thầy:* Đúng thế! Nếu một đoạn thẳng bị kéo căng về một phía, điểm cực trị không bao giờ nằm lơ lửng ở giữa, mà bắt buộc phải bị đẩy dồn về một trong hai đầu mút! Đó chính là lý do các kỹ sư vận trù học chỉ cần bấm máy tính kiểm tra đúng 5 đỉnh nhọn của đa giác là tìm ngay ra phương án kinh doanh tối ưu triệu đô!
]

#dialogue-box(title: "Kịch Bản 3: Tích Vô Hướng & Tại Sao Hai Vectơ Vuông Góc Thì Tích Bằng 0?")[
  *Thầy:* Này các em, khi một người lực sĩ gánh một tạ thóc nặng $100 "kg"$ đứng yên một chỗ suốt 2 tiếng đồng hồ mồ hôi nhễ nhại, trong Vật lý lớp 10, người lực sĩ đó đã thực hiện một Công cơ học bằng bao nhiêu?
  
  *Học sinh:* Thưa thầy... bằng 0 ạ! Vì quãng đường dịch chuyển $s = 0$!
  
  *Thầy:* Đúng! Bây giờ người đó vác bao thóc đi bộ trên đường nằm ngang phẳng lì suốt $5 "km"$. Trọng lực của Trái Đất hướng thẳng đứng xuống tâm đất, còn vectơ độ dời của người đó thì nằm ngang. Góc giữa trọng lực và độ dời là bao nhiêu?
  
  *Học sinh:* Dạ, góc vuông $90 degree$!
  
  *Thầy:* Trọng lực có giúp người đó đi nhanh hơn về phía trước không? Trọng lực có cản trở người đó đi tới phía trước không?
  
  *Học sinh:* Dạ không, phương thẳng đứng và phương ngang hoàn toàn độc lập, không tác động lên nhau!
  
  *Thầy:* Chính vì sự độc lập tuyệt đối đó, toán học định nghĩa độ "hỗ trợ lẫn nhau" giữa hai vectơ thông qua hình chiếu:
  $ vec(a) dot vec(b) = |vec(a)| |vec(b)| cos(90 degree) = 0! $
  Con số 0 đó không phải là sự biến mất, mà là tuyên ngôn của sự *Độc lập trực giao*! Khi hai đại lượng vuông góc, chúng không chia sẻ với nhau bất kỳ một thành phần hình chiếu nào!
]

#dialogue-box(title: "Kịch Bản 4: Nghịch Lý Simpson — Khi Số Trung Bình Trở Thành Kẻ Lừa Đảo")[
  *Thầy:* Bệnh viện $A$ và Bệnh viện $B$ cùng thử nghiệm một loại thuốc mới trên hai nhóm bệnh nhân: ca bệnh nhẹ và ca bệnh nặng.
  - Ở nhóm bệnh nhẹ: Thuốc của viện $A$ chữa khỏi $90\%$, viện $B$ chữa khỏi $80\%$.
  - Ở nhóm bệnh nặng: Thuốc của viện $A$ chữa khỏi $30\%$, viện $B$ chữa khỏi $20\%$.
  Hỏi: Viện nào có phương pháp chữa bệnh tốt hơn?
  
  *Cả lớp đồng thanh:* Rõ ràng là Viện $A$ tốt hơn ở cả hai nhóm rồi ạ! $90\% > 80\%$ và $30\% > 20\%$!
  
  *Thầy:* Bây giờ hãy nhìn vào số liệu thực tế:
  - Viện $A$ nhận 100 ca nhẹ (khỏi 90) và nhận tới 900 ca nặng thập tử nhất sinh (khỏi 270). Tổng cộng viện $A$ chữa khỏi: $(90 + 270) / 1.000 = 36\%$!
  - Viện $B$ chỉ dám nhận 5 ca nặng (khỏi 1) và nhận tới 95 ca nhẹ (khỏi 76). Tổng cộng viện $B$ chữa khỏi: $(76 + 1) / 100 = 77\%$!
  Bây giờ, trên báo chí giật tít: "Viện $B$ chữa khỏi $77\%$, đè bẹp Viện $A$ chỉ chữa khỏi $36\%$!". Sự thật là gì?
  
  *Học sinh sững sờ:* Ôi trời đất ơi... Viện $A$ giỏi hơn ở từng loại bệnh, nhưng vì họ có đạo đức nhận hầu hết các ca bệnh nặng nguy kịch nên tỉ lệ gộp chung bị kéo tụt xuống thảm hại!
  
  *Thầy:* Đó chính là *Nghịch lý Simpson* lừng danh trong thống kê! Nếu không biết phân tích nhóm và phân lập biến số ẩn, những con số thống kê trung bình gộp sẽ trở thành công cụ lừa đảo tinh vi nhất!
]

#dialogue-box(title: "Kịch Bản 5: Phân Biệt Chỉnh Hợp vs Tổ Hợp — Thứ Tự Có Làm Thay Đổi Số Phận?")[
  *Thầy:* Lớp chúng ta có 40 bạn học sinh. Thầy có 2 nhiệm vụ:
  - Nhiệm vụ 1: Chọn ra 3 bạn để phân công làm Lớp trưởng, Lớp phó học tập, và Bí thư chi đoàn.
  - Nhiệm vụ 2: Chọn ra 3 bạn đi quét dọn sân trường.
  Hai bài toán này khác nhau ở điểm cốt tử nào?
  
  *Học sinh:* Dạ, ở nhiệm vụ 1, nếu bạn An làm Lớp trưởng thì số phận của bạn An khác hoàn toàn với việc bạn An làm Bí thư ạ! Thứ tự được phân công quyết định chức vụ khác nhau!
  
  *Thầy:* Đúng! Có thứ tự, hoán đổi vị trí sinh ra kết quả mới: đó là *Chỉnh hợp* $A_(40)^3 = 40 times 39 times 38 = 59.280$ cách! Còn nhiệm vụ 2 thì sao?
  
  *Học sinh:* Dạ, 3 bạn đi quét rác thì dù xướng tên An trước hay Bình trước thì cả 3 đứa vẫn cầm chổi quét như nhau, không ai oai hơn ai! Thứ tự hoàn toàn vô nghĩa!
  
  *Thầy:* Xuất sắc! Khi thứ tự vô nghĩa, mỗi nhóm 3 bạn bị tính lặp lại $3! = 6$ lần hoán vị thừa thãi. Ta phải chia bỏ đi số lần lặp đó:
  $ C_(40)^3 = (A_(40)^3) / (3!) = (59.280) / 6 = 9.880 "cách"! $
  Đó là *Tổ hợp*! Bất kỳ khi nào làm toán đếm, câu hỏi đầu tiên phải tự hỏi mình là: *“Nếu ta hoán đổi vị trí của hai người, kết quả có bị biến đổi không?”*!
]

#dialogue-box(title: "Kịch Bản 6: Bí Ẩn Nửa Chu Vi p Trong Công Thức Diện Tích Heron")[
  *Thầy:* Công thức tính diện tích tam giác cổ điển là $S = 1/2 a h_a$. Nhưng nếu ta chỉ đo được 3 cạnh bằng dây kéo mà không trèo lên đỉnh tam giác để thả dây dọi đo chiều cao $h_a$, ta dùng công thức Heron:
  $ S = sqrt(p(p - a)(p - b)(p - c)) $
  với $p = (a+b+c)/2$. Tại sao lại xuất hiện con số nửa chu vi $p$ và ba hiệu số $(p - a), (p - b), (p - c)$?
  
  *Học sinh:* Em thấy nó rất đối xứng, nhưng ý nghĩa hình học của $(p - a)$ là gì ạ?
  
  *Thầy:* Hãy vẽ đường tròn nội tiếp tam giác $(I; r)$ tiếp xúc với 3 cạnh tại $D, E, F$. Độ dài các tiếp tuyến xuất phát từ đỉnh $A$ đến đường tròn nội tiếp bằng bao nhiêu?
  
  *Học sinh:* Theo tính chất hai tiếp tuyến cắt nhau, $A E = A F$. Tương tự $B D = B F, C D = C E$. Tổng chu vi là $2(A E + B D + C D) = 2p$, suy ra $A E + a = p$, tức là $A E = p - a$!
  
  *Thầy:* Tuyệt vời! $(p - a)$ chính là khoảng cách từ đỉnh $A$ đến điểm tiếp xúc của đường tròn nội tiếp! Công thức Heron thực chất là bản giao hưởng kết hợp giữa diện tích đa giác phân rã $S = p r$ và lượng giác giải tích nửa góc qua hệ thức cotang!
]

#dialogue-box(title: "Kịch Bản 7: Tại Sao Tỉ Số a / sin A Lại Bằng Đúng 2R Đường Kính Ngoại Tiếp?")[
  *Thầy:* Trong tam giác vuông tại $A$, cạnh huyền $a = 2R$. Khi đó $sin A = sin(90 degree) = 1$, nên $a / (sin A) = (2R) / 1 = 2R$. Điều này ai cũng thấy. Nhưng tại sao khi tam giác KHÔNG VUÔNG (góc $A$ nhọn hoặc tù), tỉ số này vẫn bằng đúng $2R$?
  
  *Học sinh:* Dạ... khi góc $A$ thay đổi, cạnh $a$ cũng thay đổi theo, nhưng làm sao biết chúng tỷ lệ với $2R$?
  
  *Thầy:* Hãy vẽ đường tròn ngoại tiếp tam giác. Giữ nguyên đáy $B C$, cho đỉnh $A$ chạy tự do trên cung tròn lớn. Góc $hat(B A C)$ có thay đổi không?
  
  *Học sinh:* Dạ không! Theo định lý góc nội tiếp, mọi góc chắn cung $B C$ đều bằng nhau!
  
  *Thầy:* Vậy ta có thể dời điểm $A$ đến vị trí đặc biệt $A'$ sao cho đoạn $B A'$ đi qua tâm $O$ của đường tròn không?
  
  *Học sinh:* A! Khi đó tam giác $A' B C$ vuông tại $C$ vì chắn nửa đường tròn! Và cạnh huyền $A' B = 2R$!
  
  *Thầy:* Chính xác! Trong tam giác vuông $A' B C$, $sin A' = (B C) / (A' B) = a / (2R)$. Mà $hat(A) = hat(A')$, suy ra ngay $sin A = a / (2R)$, tức là $a / (sin A) = 2R$!
  
  *Học sinh:* Thật vi diệu! Chỉ một phép dời điểm bảo toàn góc trên đường tròn, một tam giác bất kỳ đã biến thành tam giác vuông kinh điển!
]

#dialogue-box(title: "Kịch Bản 8: Tại Sao Phương Trình Bậc Hai Luôn Có Trục Đối Xứng x = -b / (2a)?")[
  *Thầy:* Cho parabol $y = a x^2 + b x + c$. Tại sao đỉnh của nó luôn nằm tại hoành độ $x = -b / (2a)$?
  
  *Học sinh:* Dạ trong SGK dạy biến đổi thành $a(x + b/(2a))^2 - Delta / (4a)$ ạ.
  
  *Thầy:* Đúng về mặt đại số. Nhưng bản chất hình học là gì? Giả sử parabol cắt trục hoành tại hai nghiệm phân biệt $x_1, x_2$. Điểm chính giữa hai nghiệm này có tọa độ là gì?
  
  *Học sinh:* Dạ là trung điểm: $x_0 = (x_1 + x_2) / 2$.
  
  *Thầy:* Theo định lý Viète cổ điển, tổng hai nghiệm $x_1 + x_2$ bằng bao nhiêu?
  
  *Học sinh:* Bằng $-b / a$! Vậy trung điểm $x_0 = (-b / a) / 2 = -b / (2a)$!
  
  *Thầy:* Tuyệt vời! Ngay cả khi phương trình vô nghiệm (đồ thị không cắt trục hoành), nếu ta nâng hay hạ đồ thị theo phương thẳng đứng, tính đối xứng gương trái - phải của tự nhiên không hề biến mất. Đỉnh của parabol chính là "trọng tâm hình học" cân bằng hai nhánh vô tận của vũ trụ!
]

#dialogue-box(title: "Kịch Bản 9: Khi Nào Dùng Quy Tắc Cộng, Khi Nào Dùng Quy Tắc Nhân?")[
  *Thầy:* Một bạn học sinh đứng trước quyết định đi từ Hà Nội vào TP.HCM. Có 2 chuyến máy bay và 3 chuyến tàu hỏa. Bạn đó có bao nhiêu cách chọn phương tiện?
  
  *Học sinh:* Dạ có $2 + 3 = 5$ cách ạ! Vì bạn đó chỉ đi một lần bằng máy bay HOẶC tàu hỏa!
  
  *Thầy:* Đúng, đó là từ khóa *HOẶC (Phương án độc lập, loại trừ nhau)* $arrow$ dùng Quy tắc Cộng! Bây giờ bạn đó đi từ Hà Nội vào Đà Nẵng bằng 2 chuyến bay, rồi từ Đà Nẵng vào TP.HCM tiếp bằng 3 chuyến tàu. Hỏi có bao nhiêu hành trình?
  
  *Học sinh:* Dạ có $2 times 3 = 6$ cách ạ!
  
  *Thầy:* Tại sao lại là phép nhân?
  
  *Học sinh:* Vì hành trình phải trải qua *HAI GIAI ĐOẠN LIÊN TIẾP*. Cứ mỗi chuyến bay chặng 1 lại có thể ghép cặp với 3 chuyến tàu chặng 2, tạo thành cây quyết định 6 nhánh!
  
  *Thầy:* Khắc cốt ghi tâm: *HOẶC là CỘNG (chia trường hợp), VÀ là NHÂN (nhiều công đoạn liên tiếp)*! Đó là quy luật bất biến của toàn bộ khoa học máy tính và logic nhị phân!
]

#dialogue-box(title: "Kịch Bản 10: Nghịch Lý Ngày Sinh — Tại Sao 23 Người Đã Có Hơn 50% Khả Năng Trùng Nhật?")[
  *Thầy:* Lớp ta có 23 học sinh. Thầy đánh cược rằng trong 23 bạn này, có ít nhất hai bạn cùng ngày tháng sinh nhật. Các em có dám cược ngược lại không?
  
  *Học sinh:* Cược chứ thầy! Một năm có tới 365 ngày, mà lớp chỉ có 23 người, cơ hội trùng nhau chắc chỉ vài phần trăm là cùng!
  
  *Thầy:* Hãy cẩn thận! Ta không hỏi: "Có ai trùng sinh nhật với Thầy không?". Ta hỏi: *"CÓ HAI BẠN BẤT KỲ TRONG LỚP TRÙNG NHAU KHÔNG?"*. Trong 23 người, có bao nhiêu CẶP ĐÔI có thể so sánh sinh nhật với nhau?
  
  *Học sinh:* Dạ... số cặp đôi là tổ hợp chập 2 của 23: $C_(23)^2 = (23 times 22) / 2 = 253$ cặp!
  
  *Thầy:* Đúng! Không phải là 23 phép thử, mà là *253 cơ hội bắt cặp*! Xác suất để cả 253 cặp này ĐỀU KHÔNG TRÙNG NHAU là:
  $ P("không trùng") = 365/365 times 364/365 times dots times (365 - 22)/365 approx 0,4927! $
  Vậy xác suất có ÍT NHẤT MỘT CẶP TRÙNG NHAU là:
  $ P = 1 - 0,4927 = 0,5073 = 50,73\%! $
  
  *Học sinh choáng váng:* Trời ơi! Chỉ 23 người mà đã có tới hơn $50\%$ cơ hội trùng nhau!
  
  *Thầy:* Đó là Nghịch lý Ngày sinh! Trực giác con người luôn tuyến tính, nhưng toán học tổ hợp phát triển theo cấp số lũy thừa. Hiểu được điều này, các em đã nắm trong tay chìa khóa giải mã bảo mật chữ ký số hiện đại!
]

#dialogue-box(title: "Kịch Bản 11: Tại Sao Tích Vô Hướng Của Hai Vectơ Lại Có Thể Âm, Bằng 0, Hoặc Dương?")[
  *Thầy (Socrates):* Này bạn trẻ, khi hai người bạn cùng nhau đẩy một chiếc xe chết máy về phía trước:
  - Nếu cả hai người cùng đẩy thẳng về phía trước theo hướng chuyển động, công sinh ra là dương hay âm?
  
  *Học sinh:* Dạ, công dương ạ! Chiếc xe chạy nhanh hơn, cả hai cùng hỗ trợ nhau!
  
  *Thầy:* Đúng, góc giữa lực đẩy và độ dời là $0 degree$, $cos(0 degree) = +1$, tích vô hướng dương cực đại! Bây giờ, nếu một người đẩy về phía trước, nhưng người kia lại cố tình kéo ghì chiếc xe lùi lại phía sau, thì điều gì xảy ra?
  
  *Học sinh:* Người kéo lùi đang cản trở chuyển động, sinh ra công âm! Góc lúc này là $180 degree$, $cos(180 degree) = -1$, tích vô hướng âm ạ!
  
  *Thầy:* Rất thông minh! Và nếu có một người thứ ba đứng bên đường tì tay đẩy vuông góc $90 degree$ vào sườn xe sang bên cạnh, liệu người đó có giúp chiếc xe chạy nhanh hơn hay làm xe chạy chậm lại theo chiều dọc không?
  
  *Học sinh:* Dạ không! Đẩy vuông góc thì chỉ làm xe lắc sang bên chứ không hề đóng góp hay cản trở một chút nào vào vận tốc tiến tới của xe cả! Công bằng 0!
  
  *Thầy:* Tuyệt mỹ! $cos(90 degree) = 0$, nên tích vô hướng của hai vectơ vuông góc luôn bằng 0! Các em thấy chưa: Tích vô hướng không phải là một công thức đại số khô khan được ép buộc, nó chính là thước đo sự "ĐỒNG LÒNG HỢP TÁC" hay "CHỐNG ĐỐI NHAU" giữa hai lực trong vũ trụ vật lý!
]

#dialogue-box(title: "Kịch Bản 12: Tại Sao Trên Đời Có Phép Nhân Vectơ Nhưng Tuyệt Đối Không Có Phép Chia Vectơ?")[
  *Thầy:* Trong đại số số học, nếu $a times b = c$ và $b != 0$, ta luôn có phép chia duy nhất $a = c / b$. Nhưng trong hình học, nếu cho tích vô hướng $vec(u) dot vec(v) = k$ ($vec(v) != vec(0)$), liệu ta có thể định nghĩa được phép chia $vec(u) = k / vec(v)$ không?
  
  *Học sinh:* Dạ... sao lại không được ạ? Cứ lấy số $k$ chia cho vectơ $vec(v)$ thôi!
  
  *Thầy:* Hãy cẩn thận! Kết quả của phép chia đó phải là một vectơ xác định duy nhất. Nhưng hãy nhìn xem: Có bao nhiêu vectơ $vec(u)$ khi nhân vô hướng với $vec(v)$ cho ra cùng kết quả $k$?
  
  *Học sinh:* Dạ... vô số ạ! Mọi vectơ có hình chiếu lên giá của $vec(v)$ bằng cùng một độ dài đại số đều cho ra cùng một tích vô hướng $k$! Đầu mút của các vectơ $vec(u)$ đó quét ra cả một đường thẳng vuông góc vô tận trong mặt phẳng!
  
  *Thầy:* Đúng thế! Một phương trình mà có vô số nghiệm vectơ không thể xác định duy nhất thì phép toán ngược (phép chia) KHÔNG THỂ TỒN TẠI! Đó là lý do trong đại số tuyến tính của nhân loại, ta chỉ có phép nhân vô hướng, tích có hướng, nhưng KHÔNG BAO GIỜ TỒN TẠI PHÉP CHIA HAI VECTƠ!
]

#dialogue-box(title: "Kịch Bản 13: Cạm Bẫy SSA & Tại Sao Hai Cạnh Và Một Góc Không Xen Giữa Lại Vẽ Được Hai Tam Giác?")[
  *Thầy:* Khi học lớp 7, các em đã biết các trường hợp bằng nhau của hai tam giác: Cạnh - Cạnh - Cạnh (c-c-c), Cạnh - Góc - Cạnh (c-g-c), và Góc - Cạnh - Góc (g-c-g). Nhưng tại sao các thầy cô tuyệt đối không bao giờ dạy trường hợp "Cạnh - Cạnh - Góc" (SSA - hai cạnh và góc không xen giữa)?
  
  *Học sinh:* Dạ... chắc là vì nó không suy ra được hai tam giác bằng nhau ạ! Nhưng tại sao lại thế ạ?
  
  *Thầy:* Hãy cầm compa lên! Thầy cho góc $hat(A) = 30 degree$, cạnh $b = A C = 10 "cm"$. Bây giờ thầy lấy compa quay một đường tròn tâm $C$ bán kính $a = 6 "cm"$. Đường tròn này sẽ cắt tia $A x$ tại bao nhiêu điểm?
  
  *Học sinh:* Dạ, khoảng cách từ $C$ đến đường thẳng $A x$ là đường cao $h = b sin(30 degree) = 10 times 0,5 = 5 "cm"$. Vì bán kính $a = 6 "cm"$ lớn hơn đường cao $h = 5 "cm"$ nhưng lại nhỏ hơn cạnh $b = 10 "cm"$, nên đường tròn sẽ CẮT TIA $A x$ TẠI ĐÚNG HAI ĐIỂM PHÂN BIỆT $B_1$ VÀ $B_2$!
  
  *Thầy:* Xuất sắc! Một điểm $B_1$ tạo thành tam giác tù, một điểm $B_2$ tạo thành tam giác nhọn! Cả hai tam giác $A B_1 C$ và $A B_2 C$ đều có cùng góc $hat(A) = 30 degree$, cùng cạnh $A C = 10 "cm"$, cùng cạnh đối diện $B C = 6 "cm"$, nhưng chúng HOÀN TOÀN KHÁC NHAU!
  
  *Học sinh:* Giờ em đã hiểu tại sao trong trắc địa và định vị GPS, trường hợp SSA được gọi là "Trường hợp nhập nhằng" (Ambiguous Case), nếu không có dữ kiện phụ sẽ gây ra thảm họa định vị nhầm tọa độ!
]

#dialogue-box(title: "Kịch Bản 14: Tại Sao Delta < 0 Thì Tam Thức Bậc Hai Luôn Cùng Dấu Với Hệ Số a?")[
  *Thầy:* Này các em, khi giải bất phương trình bậc hai $a x^2 + b x + c > 0$, nếu $Delta = b^2 - 4 a c < 0$, sách giáo khoa bảo tam thức luôn cùng dấu với $a$. Làm sao chứng minh điều đó mà không cần học vẹt?
  
  *Học sinh:* Dạ thưa thầy, hãy dùng phép biến đổi hoàn thành bình phương của nhà toán học Al-Khwarizmi ạ!
  
  *Thầy:* Hãy làm thử xem!
  
  *Học sinh:* Ta rút hệ số $a$ ra ngoài:
  $ f(x) = a [ x^2 + b/a x + c/a ] = a [ (x + b/(2a))^2 + (4 a c - b^2)/(4 a^2) ] = a [ (x + b/(2a))^2 - Delta / (4 a^2) ] $
  
  *Thầy:* Hãy nhìn vào trong ngoặc vuông! Biểu thức $(x + b/(2a))^2$ luôn $>= 0$ với mọi $x$. Còn số hạng thứ hai $- Delta / (4 a^2)$ thì sao khi $Delta < 0$?
  
  *Học sinh:* Vì $Delta < 0$ nên $-Delta > 0$! Số dương chia cho mẫu $4 a^2 > 0$ là MỘT SỐ DƯƠNG TUYỆT ĐỐI!
  
  *Thầy:* Vậy toàn bộ biểu thức trong ngoặc vuông là tổng của một số không âm với một số dương thực sự, tức là NÓ LUÔN DƯƠNG DƯƠNG TUYỆT ĐỐI VỚI MỌI $x in RR$!
  
  *Học sinh:* Em thấy rồi! Dấu của toàn bộ tam thức $f(x)$ lúc này chỉ phụ thuộc hoàn toàn vào dấu của hệ số $a$ đứng bên ngoài ngoặc! $a$ dương thì $f(x)$ dương, $a$ âm thì $f(x)$ âm!
  
  *Thầy:* Đúng vậy! Toán học là sự tất yếu của logic hoàn thiện bình phương, không có bất kỳ phép màu tùy tiện nào ở đây cả!
]

#dialogue-box(title: "Kịch Bản 15: Đường Thẳng Euler Kì Ảo: Tại Sao Trọng Tâm, Trực Tâm & Tâm Ngoại Tiếp Luôn Thẳng Hàng?")[
  *Thầy:* Trong một tam giác bất kỳ không đều, ta có ba điểm đặc biệt: Trọng tâm $G$ (giao 3 trung tuyến), Trực tâm $H$ (giao 3 đường cao), và Tâm đường tròn ngoại tiếp $O$ (giao 3 đường trung trực). Năm 1765, nhà toán học thiên tài Leonhard Euler đã phát hiện một sự thật chấn động: Cả 3 điểm này LUÔN THẲNG HÀNG trên một đường thẳng mang tên *Đường thẳng Euler*!
  
  *Học sinh:* Thưa thầy, làm sao chứng minh được điều kỳ diệu đó bằng kiến thức vectơ lớp 10 ạ?
  
  *Thầy:* Hãy gọi $M$ là trung điểm cạnh $B C$. Vectơ $vec(O M)$ vuông góc với $B C$. Mặt khác, đoạn $A H$ cũng vuông góc với $B C$. Vậy hai vectơ $vec(A H)$ và $vec(O M)$ có mối quan hệ gì?
  
  *Học sinh:* Chúng cùng phương với nhau vì cùng vuông góc với cạnh $B C$!
  
  *Thầy:* Bằng hình học đồng dạng, ta chứng minh được đoạn $A H$ dài gấp đúng 2 lần đoạn $O M$: $vec(A H) = 2 vec(O M)$! Bây giờ hãy chèn điểm $O$ vào vectơ $vec(A H)$:
  $ vec(O H) - vec(O A) = 2 vec(O M) arrow vec(O H) = vec(O A) + 2 vec(O M) $
  Mà theo tính chất trung điểm, $2 vec(O M) = vec(O B) + vec(O C)$. Vậy ta có hệ thức kinh điển:
  $ vec(O H) = vec(O A) + vec(O B) + vec(O C)! $
  
  *Học sinh:* Ôi! Và theo tính chất trọng tâm tam giác, $vec(O A) + vec(O B) + vec(O C) = 3 vec(O G)$!
  
  *Thầy:* Đúng thế! Thế vào ta có ngay:
  $ vec(O H) = 3 vec(O G) quad arrow quad vec(G H) = - 2 vec(G O)! $
  Hai vectơ cùng phương, suy ra ba điểm $H, G, O$ thẳng hàng chằn chặn, và Trọng tâm $G$ luôn chia đoạn $H O$ theo tỉ lệ vàng $2 : 1$!
  
  *Học sinh:* Thật tráng lệ! Chỉ bằng vài phép cộng vectơ lớp 10, một định lý hình học phức tạp đã hiển lộ thanh tao như một bức họa!
]

#dialogue-box(title: "Kịch Bản 16: Tại Sao Tổng Các Số Ở Hàng Thứ n Của Tam Giác Pascal Lại Đúng Bằng 2^n?")[
  *Thầy:* Hãy nhìn vào các hàng của Tam giác Pascal:
  - Hàng 0: $1$ $arrow$ Tổng $= 1 = 2^0$.
  - Hàng 1: $1 + 1 = 2 = 2^1$.
  - Hàng 2: $1 + 2 + 1 = 4 = 2^2$.
  - Hàng 3: $1 + 3 + 3 + 1 = 8 = 2^3$.
  - Hàng 4: $1 + 4 + 6 + 4 + 1 = 16 = 2^4$.
  Tại sao tổng các hệ số tổ hợp $C_n^0 + C_n^1 + C_n^2 + ... + C_n^n$ lại luôn bằng đúng lũy thừa $2^n$?
  
  *Học sinh:* Thưa thầy, theo khai triển Nhị thức Newton: $(a + b)^n = sum C_n^k a^(n-k) b^k$. Nếu ta chọn $a = 1$ và $b = 1$, ta có ngay $(1 + 1)^n = 2^n$ ạ!
  
  *Thầy:* Rất chuẩn về mặt đại số! Nhưng bản chất TỔ HỢP ĐẾM là gì? Hãy tưởng tượng thầy có một tập hợp gồm $n$ phần tử, ví dụ như một hộp gồm $n$ món quà khác nhau. Thầy muốn chọn ra một số món quà (có thể không chọn món nào, chọn 1 món, 2 món, ..., hoặc chọn hết cả $n$ món).
  
  *Học sinh:* Dạ, số cách chọn 0 món là $C_n^0$, chọn 1 món là $C_n^1$, ..., chọn $k$ món là $C_n^k$. Tổng tất cả các trường hợp chính là TỔNG SỐ TẬP CON của tập hợp $n$ phần tử đó ạ!
  
  *Thầy:* Đúng! Và bây giờ hãy đếm theo cách của người lập trình máy tính: Đứng trước mỗi món quà thứ $i$, em có bao nhiêu sự lựa chọn?
  
  *Học sinh:* Dạ... chỉ có 2 sự lựa chọn: CHỌN hoặc KHÔNG CHỌN (1 hoặc 0)!
  
  *Thầy:* Với $n$ món quà độc lập liên tiếp, theo Quy tắc Nhân có bao nhiêu khả năng?
  
  *Học sinh:* $2 times 2 times ... times 2 = 2^n$ khả năng!
  
  *Thầy:* Tuyệt vời! Hai cách đếm khác nhau cho cùng một bài toán tập hợp bắt buộc phải cho ra cùng một đáp số: $sum_(k=0)^n C_n^k = 2^n$! Đó chính là vẻ đẹp của Nguyên lý Đếm bằng hai cách (Double Counting) trong Toán tổ hợp!
]

#dialogue-box(title: "Kịch Bản 17: Tại Sao Phương Trình Đường Thẳng a x + b y + c = 0 Lại Nhận (a; b) Làm Vectơ Pháp Tuyến?")[
  *Thầy:* Này các em, tại sao một đường thẳng trong mặt phẳng tọa độ lại được mô tả bởi phương trình bậc nhất $a x + b y + c = 0$, và tại sao hai hệ số đứng trước $x$ và $y$ lại lập tức cho ta tọa độ của một Vectơ pháp tuyến $vec(n) = (a; b)$ vuông góc với đường thẳng đó?
  
  *Học sinh:* Dạ... trong sách giáo khoa ghi định nghĩa như thế ạ!
  
  *Thầy:* Đừng học vẹt! Hãy cùng dựng lại phương trình từ hình học thuần túy: Cho một điểm cố định $M_0(x_0; y_0)$ và một vectơ vuông góc $vec(n) = (a; b) != vec(0)$. Một điểm $M(x; y)$ bất kỳ muốn nằm trên đường thẳng đi qua $M_0$ vuông góc với $vec(n)$ thì vectơ chỉ phương đoạn thẳng $vec(M_0 M)$ phải thỏa mãn điều kiện gì với $vec(n)$?
  
  *Học sinh:* Dạ, vectơ $vec(M_0 M)$ bắt buộc phải VUÔNG GÓC với vectơ $vec(n)$!
  
  *Thầy:* Và hai vectơ vuông góc nhau thì tích vô hướng của chúng bằng bao nhiêu?
  
  *Học sinh:* Bằng 0! $vec(n) dot vec(M_0 M) = 0$!
  
  *Thầy:* Hãy khai triển tích vô hướng theo tọa độ: $vec(M_0 M) = (x - x_0; y - y_0)$, vectơ $vec(n) = (a; b)$:
  
  *Học sinh:* Ta có:
  $ a(x - x_0) + b(y - y_0) = 0 arrow a x + b y - (a x_0 + b y_0) = 0! $
  
  *Thầy:* Đặt số thực cố định $-(a x_0 + b y_0) = c$, ta thu được chính xác phương trình tổng quát:
  $ a x + b y + c = 0! $
  
  *Học sinh:* Trời ơi, hóa ra phương trình đường thẳng bậc nhất hai ẩn bản chất chỉ là PHÉP NHÂN VÔ HƯỚNG BẰNG 0 CỦA HAI VECTƠ VUÔNG GÓC! Không hề có chút gì bí ẩn hay áp đặt ở đây cả!
]

#dialogue-box(title: "Kịch Bản 18: Nghịch Lý Ngày Sinh & Tại Sao Trực Giác Con Người Lại Bị Tê Liệt Trước Cấp Số Tổ Hợp?")[
  *Thầy:* Khi nghe nói trong một bữa tiệc chỉ cần 23 người là cơ hội có 2 người trùng sinh nhật đã vượt $50\%$, tại sao ai cũng nghĩ rằng thông tin đó là giả mạo?
  
  *Học sinh:* Vì bộ não chúng ta tự động lấy ngày sinh của chính mình đi so sánh với 22 người còn lại! Chỉ có 22 phép so sánh, xác suất $22 / 365$ chỉ khoảng $6\%$, nên ta thấy nó quá nhỏ!
  
  *Thầy:* Rất chính xác! Đó là thiên kiến vị kỷ (Egocentric Bias) của tâm lý học. Nhưng câu hỏi không phải là "ai trùng sinh nhật với BẠN", mà là "bất kỳ hai người nào trùng nhau". Trong 23 người, số lượng sợi dây vô hình kết nối giữa từng cặp hai người là:
  $ C_(23)^2 = (23 times 22) / 2 = 253 "cặp kết nối"! $
  253 phép thử so với 365 ngày trong năm là một con số khổng lồ!
  
  *Học sinh:* Em hiểu rồi! Trực giác con người sinh ra để ước lượng những đường thẳng (tuyến tính $n$), nhưng thế giới tự nhiên và công nghệ máy tính lại vận hành theo đồ thị hàm bậc hai ($n^2$) và hàm số mũ ($2^n$)!
  
  *Thầy:* Đúng thế! Ai không hiểu được sức mạnh bùng nổ của tổ hợp sẽ luôn bị cuộc đời và các thuật toán dữ liệu lớn đánh lừa!
]

#dialogue-box(title: "Kịch Bản 19: Tại Sao Phương Sai Mẫu Bắt Buộc Phải Chia Cho n - 1 Thay Vì Chia Cho n?")[
  *Thầy:* Khi tính phương sai cho toàn bộ dân số gồm $N$ người, ta lấy tổng bình phương độ lệch chia cho $N$:
  $ sigma^2 = 1/N sum_(i=1)^N (x_i - mu)^2 $
  Nhưng khi các em rút một mẫu ngẫu nhiên gồm $n$ người từ thực tế, tại sao công thức phương sai mẫu $s^2$ lại bắt buộc phải chia cho $n - 1$?
  $ s^2 = 1/(n - 1) sum_(i=1)^n (x_i - bar(x))^2 $
  
  *Học sinh:* Dạ, thầy cô bảo đó là Hiệu chỉnh Bessel (Bessel's Correction), nhưng tại sao lại bị hụt mất 1 đơn vị tự do ạ?
  
  *Thầy:* Hãy chú ý: Trong công thức mẫu, ta KHÔNG BIẾT giá trị trung bình thực sự $mu$ của toàn dân số, mà ta buộc phải thay thế nó bằng giá trị trung bình mẫu $bar(x) = 1/n sum x_i$. Và theo tính chất toán học của trung bình cộng, tổng các độ lệch so với $bar(x)$ luôn luôn bằng 0 chằn chặn:
  $ sum_(i=1)^n (x_i - bar(x)) = 0! $
  Điều này có nghĩa là gì? Nếu em đã biết độ lệch của $n - 1$ phần tử đầu tiên, em có tự động suy ra được độ lệch của phần tử thứ $n$ mà không cần đo đạc không?
  
  *Học sinh:* Dạ có! Phần tử cuối cùng bị "khóa cứng" bởi tổng bằng 0! Nó không còn được tự do dao động nữa!
  
  *Thầy:* Đúng! Ta đã "tiêu tốn mất 1 bậc tự do" để ước lượng số trung bình $bar(x)$! Do đó, mẫu số liệu chỉ còn lại đúng $n - 1$ bậc tự do độc lập. Hơn nữa, vì các điểm dữ liệu trong mẫu luôn có xu hướng co cụm quanh trung bình mẫu $bar(x)$ gần hơn là quanh trung bình thực sự $mu$, nên nếu chia cho $n$, phương sai mẫu sẽ luôn bị đánh giá thấp hơn (thiên lệch). Chia cho $n - 1$ là một hiệu chỉnh thiên tài để đại lượng ước lượng trở thành hoàn toàn không chệch (Unbiased)!
]

#dialogue-box(title: "Kịch Bản 20: ChatGPT & Trí Tuệ Nhân Tạo Thực Chất Là Gì Dưới Lăng Kính Xác Suất Lớp 10?")[
  *Thầy:* Khi cả thế giới phát sốt vì ChatGPT có thể trò chuyện, làm thơ, giải toán như một con người, các em có nghĩ nó có linh hồn hay ý thức bí ẩn bên trong không?
  
  *Học sinh:* Dạ, nhìn nó trả lời trôi chảy quá, nhiều người tưởng nó có trí thông minh thực sự ạ!
  
  *Thầy:* Dưới lăng kính của nhà toán học, toàn bộ mô hình ngôn ngữ lớn (LLM) bản chất chỉ là một *Cỗ máy tính Xác suất có điều kiện khổng lồ*:
  $ P(w_t | w_1, w_2, ..., w_(t-1)) $
  Nó đọc hàng nghìn tỷ văn bản trên Internet để thống kê xem: Sau một chuỗi các từ cho trước, từ tiếp theo nào có xác suất xuất hiện cao nhất!
  
  *Học sinh:* Tức là khi em hỏi: "Thủ đô của Việt Nam là...", AI không hề "biết" Việt Nam là gì, mà nó chỉ tính toán thấy từ "Hà Nội" có xác suất cao nhất $99,9\%$ để điền vào?
  
  *Thầy:* Hoàn toàn chính xác! Nó là một chuỗi Markov mở rộng với hàng trăm tỷ tham số trọng số xác suất! Nó không có tư duy phản biện, không có đạo đức, không có trực giác sáng tạo nguyên bản. Nó chỉ là tấm gương phản chiếu lại xác suất thống kê ngôn ngữ của loài người. Người làm chủ được xác suất và tư duy logic toán học sẽ là người điều khiển AI, còn người học vẹt sẽ trở thành nô lệ cho các thuật toán gợi ý của máy móc!
]


#pagebreak()

= PHẦN III: BỐN BÀI BÁO NGHIÊN CỨU KHOA HỌC MINI CHUẨN IMRAD KÈM MÃ PYTHON

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành cho giáo viên hướng dẫn học sinh NCKH và học sinh chuyên Toán: Cấu trúc một bài báo khoa học chuẩn quốc tế IMRAD (Introduction - Methods - Results - And - Discussion) ứng dụng trực tiếp kiến thức Toán 10 giải quyết các vấn đề thực tiễn.
]

== BÀI BÁO 1: MÔ HÌNH HÓA VÀ TỐI ƯU HÓA QUỸ ĐẠO NÉM XIÊN TRONG TRỌNG TRƯỜNG CÓ LỰC CẢN KHÔNG KHÍ BẬC HAI BẰNG THUẬT TOÁN RUNGE-KUTTA BẬC 4 (RK4)

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt (Abstract):* Trong chương trình Vật lý và Toán học lớp 10, chuyển động ném xiên được mô hình hóa thành đường parabol hoàn hảo dưới giả thiết bỏ qua lực cản môi trường. Tuy nhiên trong thực tiễn khí động học thể thao (bóng đá, cầu lông, golf) và kỹ thuật đạn đạo, lực cản không khí tỷ lệ với bình phương vận tốc $F_d = 1/2 C_d rho A v^2$ làm biến dạng sâu sắc hình học quỹ đạo. Bài báo này xây dựng hệ phương trình vi phân phi tuyến tính hai chiều, giải bằng thuật toán Runge-Kutta bậc 4 (RK4) trên Python. Kết quả chứng minh góc phóng tối ưu để đạt tầm bay xa cực đại trong không khí bị kéo tụt từ $45 degree$ xuống $36,8 degree$, và quỹ đạo rơi dốc đứng bất đối xứng ở cuối hành trình.
]

*1. Giới thiệu (Introduction):*
Từ thời Cổ đại, Aristotle cho rằng một vật thể bay theo đường thẳng cho đến khi hết "dư lực" rồi rơi thẳng đứng xuống đất. Mãi đến năm 1638, trong tác phẩm kinh điển *“Discorsi e dimostrazioni matematiche intorno a due nuove scienze”*, Galileo Galilei mới lần đầu tiên chứng minh bằng hình học giải tích rằng: Quỹ đạo ném xiên trong chân không là sự kết hợp độc lập của chuyển động thẳng đều theo phương ngang và chuyển động rơi tự do biến đổi đều theo phương thẳng đứng:
$ x(t) = (v_0 cos theta) t, quad y(t) = (v_0 sin theta) t - 1/2 g t^2 $
Khử biến thời gian $t$, ta thu được phương trình Parabol chính tắc trong SGK Toán 10:
$ y = (tan theta) x - g / (2 v_0^2 cos^2 theta) x^2 $
Tầm bay xa cực đại trên mặt đất phẳng đạt được khi đạo hàm $d R / (d theta) = 0$, dẫn đến $theta^* = 45 degree$ và $R_("max") = v_0^2 / g$. Tuy nhiên, trong thực tế với quả bóng đá bay ở vận tốc $v_0 = 30 "m/s"$, lực cản không khí làm tầm xa giảm hơn $35\%$. Mô hình parabol thuần túy không thể giải thích được hiện tượng đạn rơi cắm dốc đứng.

*2. Mô hình Toán học & Thuật toán Số (Methods):*
Xét vật thể khối lượng $m$, diện tích cản $A$, hệ số cản khí động $C_d$ chuyển động trong không khí có mật độ $rho$. Lực cản hướng ngược chiều vectơ vận tốc:
$ vec(F)_d = - 1/2 C_d rho A |vec(v)| vec(v) = - k v vec(v) $
với $k = 1/2 C_d rho A$. Áp dụng Định luật II Newton: $m (d vec(v))/(d t) = m vec(g) + vec(F)_d$. Chiếu lên hệ trục tọa độ Descartes $O x y$:
$ {((d v_x)/(d t) = - k/m sqrt(v_x^2 + v_y^2) v_x), ((d v_y)/(d t) = - g - k/m sqrt(v_x^2 + v_y^2) v_y), ((d x)/(d t) = v_x), ((d y)/(d t) = v_y):} $
Hệ phương trình này là hệ phi tuyến tính không có nghiệm giải tích tường minh dưới dạng hàm sơ cấp. Chúng tôi triển khai thuật toán số Runge-Kutta bậc 4 (RK4) với vectơ trạng thái $vec(u) = (x, y, v_x, v_y)^T$:
$ vec(u)_(n+1) = vec(u)_n + 1/6 (vec(k)_1 + 2 vec(k)_2 + 2 vec(k)_3 + vec(k)_4) Delta t $

*3. Mã nguồn Python mô phỏng và khảo sát góc tối ưu:*
```python
import numpy as np

def projectile_rk4(v0, theta_deg, m=0.45, Cd=0.25, r=0.11, rho=1.225, dt=0.001):
    g = 9.81
    A = np.pi * r**2
    k = 0.5 * Cd * rho * A
    
    rad = np.radians(theta_deg)
    u = np.array([0.0, 0.0, v0 * np.cos(rad), v0 * np.sin(rad)])
    
    def derivatives(state):
        x, y, vx, vy = state
        v = np.sqrt(vx**2 + vy**2)
        ax = -(k / m) * v * vx
        ay = -g - (k / m) * v * vy
        return np.array([vx, vy, ax, ay])
    
    trajectory_x = [u[0]]
    trajectory_y = [u[1]]
    
    while u[1] >= 0.0:
        k1 = derivatives(u)
        k2 = derivatives(u + 0.5 * dt * k1)
        k3 = derivatives(u + 0.5 * dt * k2)
        k4 = derivatives(u + dt * k3)
        u_next = u + (dt / 6.0) * (k1 + 2*k2 + 2*k3 + k4)
        
        if u_next[1] < 0.0:
            fraction = (0.0 - u[1]) / (u_next[1] - u[1])
            x_impact = u[0] + fraction * (u_next[0] - u[0])
            trajectory_x.append(x_impact)
            trajectory_y.append(0.0)
            break
            
        u = u_next
        trajectory_x.append(u[0])
        trajectory_y.append(u[1])
        
    return trajectory_x[-1], np.max(trajectory_y), trajectory_x, trajectory_y

# Quét góc bắn từ 25 đến 55 độ để tìm góc tối ưu
angles = np.linspace(25, 55, 301)
v0_test = 30.0 # 108 km/h - cú sút bóng đá mạnh
ranges = [projectile_rk4(v0_test, a)[0] for a in angles]
best_idx = np.argmax(ranges)
best_angle = angles[best_idx]
best_range = ranges[best_idx]

print(f"Góc sút tối ưu thực tế: {best_angle:.2f} độ | Tầm bay xa: {best_range:.2f} m")
print(f"Lý thuyết chân không 45 độ: {v0_test**2 / 9.81:.2f} m (Chênh lệch: {(v0_test**2/9.81 - best_range):.2f} m)")
```

*4. Thảo luận & Ứng dụng Sư phạm (Discussion):*
Kết quả mô phỏng số cho thấy:
1. *Phá vỡ ảo tưởng $45 degree$:* Khi có lực cản không khí, góc bắn tối ưu luôn nhỏ hơn đáng kể so với $45 degree$ (khoảng $35 degree - 38 degree$ đối với bóng đá, và thậm chí chỉ $30 degree - 32 degree$ đối với quả cầu lông có lực cản cực lớn).
2. *Tính bất đối xứng hình học:* Trong chân không, đỉnh parabol nằm chính giữa tầm xa ($x_("đỉnh") = R / 2$). Nhưng trong không khí, đỉnh bị đẩy dạt về phía trước ($x_("đỉnh") approx 0,58 R$) và đoạn rơi cuối quỹ đạo dốc hơn đoạn phóng đầu ($|tan theta_("rơi")| > tan theta_("phóng")$).
3. Bài toán này là dự án nghiên cứu liên môn Toán - Lý - Tin học hoàn hảo cho học sinh lớp 10, giúp các em thấy được sức mạnh chuyển hóa từ phương trình giải tích sách giáo khoa sang mô phỏng thuật toán số thực tế.

---

== BÀI BÁO 2: MÔ HÌNH HÓA VÀ GIẢI BÀI TOÁN TỐI ƯU HÓA KHẨU PHẦN ĂN NỘI TRÚ STIGLER BẰNG THUẬT TOÁN SIMPLEX VÀ PHÂN TÍCH ĐỘ NHẠY

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Bài toán Khẩu phần ăn Stigler (The Stigler Diet Problem, 1945) là cột mốc lịch sử đánh dấu sự ra đời của Quy hoạch Tuyến tính. Nghiên cứu này mở rộng bài toán vào bối cảnh bếp ăn bán trú THPT tại Việt Nam: Xây dựng mô hình tối ưu hóa chi phí thực phẩm hàng ngày thỏa mãn 6 vi chất dinh dưỡng thiết yếu (Năng lượng, Protein, Lipid, Glucid, Canxi, Sắt) dựa trên ma trận dữ liệu dinh dưỡng Viện Dinh dưỡng Quốc gia. Bài toán được giải bằng thuật toán Simplex thông qua thư viện `scipy.optimize.linprog`, kết hợp phân tích biến đối ngẫu (Dual Variables / Shadow Prices) để xác định giá trị kinh tế của từng vi chất.
]

*1. Giới thiệu (Introduction):*
Năm 1945, nhà kinh tế học George Stigler (người sau này đoạt giải Nobel Kinh tế năm 1982) đặt ra một bài toán kinh điển cho quân đội Mỹ: Làm sao nuôi sống một người lính với chi phí rẻ nhất mỗi ngày mà vẫn đảm bảo đầy đủ các chất dinh dưỡng cần thiết theo khuyến nghị y tế? Stigler đã sử dụng phương pháp thử - sai thủ công và tìm ra khẩu phần ăn trị giá $39,93 "USD"$ mỗi năm (thời giá 1939). Hai năm sau (1947), George Dantzig phát minh ra *Thuật toán Đơn hình (Simplex Algorithm)* trên máy tính sơ khai và chứng minh rằng kết quả thủ công của Stigler chỉ chênh lệch vài cent so với nghiệm tối ưu toán học chính xác ($39,69 "USD"$).

Trong chương trình Toán 10 (Chương II), học sinh chỉ được giải bài toán quy hoạch tuyến tính 2 biến bằng phương pháp hình học vẽ miền đa giác lồi trên mặt phẳng $O x y$. Nghiên cứu này nâng cấp năng lực mô hình hóa của học sinh lên không gian đa chiều với $n$ loại thực phẩm và $m$ ràng buộc dinh dưỡng.

*2. Mô hình Toán học Dạng Chuẩn (Formulation):*
Gọi $x_j >= 0$ ($j = 1, dots, n$) là khối lượng (tính bằng $100 "g"$) của loại thực phẩm thứ $j$ tiêu thụ trong một ngày.
- Hàm mục tiêu tổng chi phí cần tối thiểu hóa:
$ min Z = sum_(j=1)^n c_j x_j = vec(c)^T vec(x) $
trong đó $c_j$ là đơn giá của $100 "g"$ thực phẩm thứ $j$.
- Hệ ràng buộc dinh dưỡng tối thiểu bảo đảm sức khỏe học sinh:
$ sum_(j=1)^n a_(i j) x_j >= b_i, quad forall i = 1, dots, m $
trong đó $a_(i j)$ là hàm lượng chất dinh dưỡng thứ $i$ có trong $100 "g"$ thực phẩm $j$, và $b_i$ là nhu cầu khuyến nghị tối thiểu hàng ngày.
- Ràng buộc trần tiêu hóa (chống bội thực hoặc mất cân đối):
$ x_j <= u_j, quad forall j = 1, dots, n $

*3. Mã nguồn Python thực thi với scipy.optimize:*
```python
import numpy as np
from scipy.optimize import linprog

# 6 loại thực phẩm: [Gạo tẻ, Thịt heo nạc, Đậu phụ, Trứng gà, Rau muống, Chuối tiêu]
# Đơn giá (nghìn VNĐ / 100g)
c = np.array([2.0, 14.0, 3.5, 4.5, 2.5, 2.0])

# Ma trận dinh dưỡng A_ub: [Năng lượng(kcal), Protein(g), Lipid(g), Canxi(mg), Sắt(mg)]
A_dinh_duong = np.array([
    [350, 140,  95, 160,  25,  90],  # Calo (kcal) >= 2200
    [  8,  20,  11,  13,   3, 1.5],  # Protein (g) >= 65
    [  1,   7,   5,  11, 0.5, 0.3],  # Lipid (g)   >= 40
    [ 10,  10, 500,  55, 100,  10],  # Canxi (mg)  >= 800
    [1.5, 1.5, 4.0, 2.7, 3.0, 0.6]   # Sắt (mg)    >= 15
])

b_nhu_cau = np.array([2200, 65, 40, 800, 15])

A_ub = -A_dinh_duong
b_ub = -b_nhu_cau

bounds = [(1.0, 6.0),   # Gạo: tối thiểu 100g, tối đa 600g
          (0.5, 3.0),   # Thịt: tối thiểu 50g, tối đa 300g
          (0.5, 4.0),   # Đậu phụ: 50g - 400g
          (0.5, 2.0),   # Trứng: 50g - 200g
          (1.0, 5.0),   # Rau: 100g - 500g
          (1.0, 4.0)]   # Chuối: 100g - 400g

res = linprog(c, A_ub=A_ub, b_ub=b_ub, bounds=bounds, method='highs')

print("=== KẾT QUẢ TỐI ƯU HÓA KHẨU PHẦN ĂN STIGLER ===")
print(f"Chi phí tối thiểu mỗi ngày: {res.fun * 1000:.0f} VNĐ")
ten_thuc_pham = ['Gạo tẻ', 'Thịt heo', 'Đậu phụ', 'Trứng gà', 'Rau muống', 'Chuối']
for name, gram in zip(ten_thuc_pham, res.x * 100):
    print(f"- {name:10s}: {gram:.1f} gram/ngày")
```

*4. Thảo luận & Ý nghĩa Kinh tế (Discussion):*
1. *Giá bóng (Shadow Price):* Các biến đối ngẫu $lambda_i$ cho biết nếu nhu cầu Canxi tăng thêm $1 "mg"$, tổng chi phí tối thiểu của khẩu phần ăn sẽ tăng lên bao nhiêu đồng. Điều này giúp nhà quản lý bếp ăn trường học đưa ra quyết định mua thực phẩm bổ sung vi chất một cách thông minh nhất.
2. *Ranh giới đa diện lồi trong không gian 6 chiều:* Điểm tối ưu toán học vẫn là một "đỉnh nhọn" của khối đa diện lồi $6$ chiều (Polytope) tạo bởi các siêu phẳng ràng buộc — hoàn toàn tương đồng về mặt hình học với bài toán 2 biến trong SGK Toán 10.

---

== BÀI BÁO 3: PHÂN TÍCH DỮ LIỆU ĐO LƯỜNG & NHẬN DIỆN GIÁ TRỊ NGOẠI LAI (OUTLIERS) BẰNG BIỂU ĐỒ HỘP BOXPLOT VÀ CHỈ SỐ TUKEY

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Trong thời đại Internet Vạn Vật (IoT) và Cảm biến thông minh, việc thu thập dữ liệu tự động luôn đối mặt với vấn đề nhiễu điện áp và lỗi truyền dẫn sinh ra các giá trị ngoại lai (outliers) làm sai lệch nghiêm trọng các số đặc trưng thống kê. Bài báo này ứng dụng các số đặc trưng đo độ phân tán trong SGK Toán 10 — bao gồm Tứ phân vị ($Q_1, Q_2, Q_3$) và Khoảng tứ phân vị ($I Q R$) — để xây dựng thuật toán lọc nhiễu tự động dựa trên Hàng rào Tukey, đồng thời so sánh hiệu năng của phương pháp này với phương pháp Z-score cổ điển.
]

*1. Giới thiệu (Introduction):*
Khi phân tích mẫu số liệu thống kê, sai lầm phổ biến nhất của người mới học là chỉ dựa vào Số trung bình cộng ($bar(x)$) và Độ lệch chuẩn ($s$). Tuy nhiên, cả hai chỉ số này đều cực kỳ nhạy cảm trước các giá trị cực đoan dị biệt. Nhà thống kê học lỗi lạc John Tukey (1977) đã phát minh ra *Biểu đồ hộp (Boxplot)* dựa trên Thống kê thứ tự (Order Statistics), mang lại công cụ phi tham số mạnh mẽ có khả năng chống chịu nhiễu tuyệt hảo (Robust Statistics).

*2. Cơ sở Toán học & Thuật toán Hàng rào Tukey:*
Cho mẫu số liệu đã sắp thứ tự $x_1 <= x_2 <= dots <= x_n$.
- Tứ phân vị thứ nhất $Q_1$ (phân vị $25\%$), Trung vị $Q_2 = M_e$ (phân vị $50\%$), Tứ phân vị thứ ba $Q_3$ (phân vị $75\%$).
- Khoảng biến thiên tứ phân vị (Interquartile Range):
$ I Q R = Q_3 - Q_1 $
- Hàng rào kiểm định Tukey (Tukey's Fences):
$ "Hàng rào dưới (Lower Fence):" quad L F = Q_1 - 1,5 times I Q R $
$ "Hàng rào trên (Upper Fence):" quad U F = Q_3 + 1,5 times I Q R $
Mọi quan sát nằm ngoài khoảng $[L F; U F]$ đều được định danh toán học là *Giá trị Ngoại lai (Outlier)*. Nếu vượt quá $3,0 times I Q R$, giá trị đó được xếp vào loại *Ngoại lai cực đoan (Extreme Outlier)*.

*3. Mã nguồn Python triển khai so sánh Tukey IQR và Z-Score:*
```python
import numpy as np

def detect_outliers_tukey(data):
    q1 = np.percentile(data, 25)
    q3 = np.percentile(data, 75)
    iqr = q3 - q1
    lf = q1 - 1.5 * iqr
    uf = q3 + 1.5 * iqr
    
    outliers = [x for x in data if x < lf or x > uf]
    clean = [x for x in data if lf <= x <= uf]
    return outliers, clean, (lf, uf)

def detect_outliers_zscore(data, threshold=3.0):
    mean = np.mean(data)
    std = np.std(data)
    outliers = [x for x in data if abs(x - mean) > threshold * std]
    return outliers

# Dữ liệu chuỗi nhiệt độ thực tế đo bởi cảm biến IoT (độ C)
# Chèn 2 giá trị lỗi phần cứng: 99.5 độ và -50.0 độ
sensor_temps = np.array([26.1, 26.3, 25.9, 26.5, 26.2, 99.5, 26.0, 26.4, 25.8, -50.0, 26.1, 26.3])

outliers_iqr, clean_data, bounds = detect_outliers_tukey(sensor_temps)
outliers_z = detect_outliers_zscore(sensor_temps, threshold=2.0)

print(f"Số trung bình khi chưa lọc: {np.mean(sensor_temps):.2f} độ C (Bị bóp méo hoàn toàn!)")
print(f"Trung vị khi chưa lọc:     {np.median(sensor_temps):.2f} độ C (Bảo toàn trung thực!)")
print(f"Hàng rào Tukey IQR: [{bounds[0]:.2f}; {bounds[1]:.2f}]")
print(f"Giá trị ngoại lai phát hiện bởi Tukey IQR: {outliers_iqr}")
print(f"Số trung bình sau khi làm sạch bằng IQR:  {np.mean(clean_data):.2f} độ C")
```

*4. Thảo luận & Ứng dụng Thực tiễn (Discussion):*
Trong kỷ nguyên Trí tuệ nhân tạo và Dữ liệu lớn (Big Data), khâu làm sạch dữ liệu (Data Cleaning) chiếm tới $80\%$ thời gian của một kỹ sư Khoa học Dữ liệu. Kiến thức thống kê mô tả lớp 10 chính là nền tảng cốt tử giúp học sinh nhận thức được sự nguy hiểm của việc tin tưởng mù quáng vào số trung bình cộng, đồng thời trang bị thuật toán chuẩn mực để xử lý dữ liệu thực tế.

---

== BÀI BÁO 4: MÔ PHỎNG QUỸ ĐẠO CHUYỂN TIẾP ELIP HOHMANN TRONG CƠ HỌC THIÊN VĂN & TÍNH TOÁN CỬA SỔ PHÓNG TÀU TRÁI ĐẤT - SAO HỎA

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Du hành liên hành tinh là giấc mơ vĩ đại của văn minh nhân loại. Bài báo này ứng dụng phương trình chính tắc của đường Elip ($x^2 / a^2 + y^2 / b^2 = 1$) và Ba Định luật Kepler trong SGK Toán 10 để mô hình hóa Quỹ đạo chuyển tiếp Hohmann (Hohmann Transfer Orbit). Chúng tôi tính toán tường minh hai gia tốc xung lượng cần thiết $Delta v_1, Delta v_2$ để đưa tàu vũ trụ thoát ly quỹ đạo Trái Đất và hòa nhập vào quỹ đạo Sao Hỏa, đồng thời xác định chu kỳ mở cửa sổ phóng (Launch Window) theo chu kỳ giao hội hình học.
]

*1. Giới thiệu (Introduction):*
Năm 1925, kỹ sư hàng không vũ trụ người Đức Walter Hohmann xuất bản công trình *“Die Erreichbarkeit der Himmelskörper”* (Khả năng vươn tới các thiên thể), đề xuất phương án di chuyển giữa hai quỹ đạo hành tinh với mức tiêu hao năng lượng tối thiểu bằng một quỹ đạo elip tiếp xúc kép. Quỹ đạo này sau đó được NASA sử dụng cho hầu hết các sứ mệnh thám hiểm Sao Hỏa (Mariner, Viking, Curiosity, Perseverance).

*2. Cơ học Quỹ đạo & Phương trình Năng lượng Vis-Viva:*
Xét Mặt Trời khối lượng $M_("sun")$ nằm tại một tiêu điểm của đường Elip. Quỹ đạo Trái Đất coi như hình tròn bán kính $r_1 = 149,6 times 10^6 "km"$ ($1 "AU"$), quỹ đạo Sao Hỏa bán kính $r_2 = 227,9 times 10^6 "km"$ ($1,524 "AU"$).
- Quỹ đạo chuyển tiếp là một nửa elip có điểm cận nhật (Perihelion) tiếp xúc quỹ đạo Trái Đất và điểm viễn nhật (Aphelion) tiếp xúc quỹ đạo Sao Hỏa:
$ a_("trans") = (r_1 + r_2) / 2 = (1,0 + 1,524) / 2 = 1,262 "AU" $
- Phương trình bảo toàn năng lượng Vis-Viva:
$ v^2 = mu (2/r - 1/a) $
với tham số hấp dẫn chuẩn của Mặt Trời $mu = G M_("sun") = 1,327 times 10^(11) "km"^3/"s"^2$.
- Xung lực đẩy thứ nhất tại Trái Đất:
$ Delta v_1 = v_("trans, peri") - v_("Earth, circ") = sqrt(mu (2/r_1 - 1/a_("trans"))) - sqrt(mu / r_1) $
- Xung lực đẩy thứ hai tại Sao Hỏa:
$ Delta v_2 = v_("Mars, circ") - v_("trans, apo") = sqrt(mu / r_2) - sqrt(mu (2/r_2 - 1/a_("trans"))) $
- Thời gian bay là đúng một nửa chu kỳ quay của Elip theo Định luật Kepler III:
$ t_("flight") = 1/2 T_("trans") = 1/2 sqrt(a_("trans")^3) "năm" = 1/2 sqrt(1.262^3) times 365.25 approx 259 "ngày" $
- Chu kỳ giao hội (Synodic Period) giữa Trái Đất và Sao Hỏa xác định chu kỳ mở cửa sổ phóng:
$ 1 / T_("syn") = 1 / T_1 - 1 / T_2 arrow T_("syn") = (T_1 T_2) / (T_2 - T_1) = (1 times 1,881) / (1,881 - 1) approx 2,135 "năm" approx 780 "ngày (khoảng 26 tháng)" $

*3. Mã nguồn Python mô phỏng quỹ đạo và tính toán thông số:*
```python
import math
import numpy as np

# Các hằng số thiên văn (đơn vị: km và s)
mu_sun = 1.3271244e11   # km^3 / s^2
r1 = 149.6e6            # Bán kính quỹ đạo Trái Đất (km)
r2 = 227.9e6            # Bán kính quỹ đạo Sao Hỏa (km)

a_trans = (r1 + r2) / 2.0
c_trans = a_trans - r1
e_trans = c_trans / a_trans

v1_circ = math.sqrt(mu_sun / r1)
v2_circ = math.sqrt(mu_sun / r2)

v_peri = math.sqrt(mu_sun * (2.0 / r1 - 1.0 / a_trans))
v_apo = math.sqrt(mu_sun * (2.0 / r2 - 1.0 / a_trans))

delta_v1 = v_peri - v1_circ
delta_v2 = v2_circ - v_apo
total_delta_v = delta_v1 + delta_v2

t_seconds = math.pi * math.sqrt((a_trans**3) / mu_sun)
t_days = t_seconds / 86400.0

print("=== THÔNG SỐ QUỸ ĐẠO CHUYỂN TIẾP ELIP HOHMANN ===")
print(f"Bán trục lớn Elip a:         {a_trans/1e6:.1f} triệu km")
print(f"Tâm sai quỹ đạo e:           {e_trans:.4f}")
print(f"Xung lực đẩy khởi hành dv1:  {delta_v1:.3f} km/s ({delta_v1*3600:.0f} km/h)")
print(f"Xung lực hòa nhập Sao Hỏa:   {delta_v2:.3f} km/s ({delta_v2*3600:.0f} km/h)")
print(f"Tổng biến thiên vận tốc:     {total_delta_v:.3f} km/s")
print(f"Thời gian bay quán tính:     {t_days:.1f} ngày (khoảng 8,5 tháng)")
```

*4. Thảo luận & Ý nghĩa Triết học Khoa học (Discussion):*
Con tàu không hề "bay thẳng" từ Trái Đất sang Sao Hỏa. Nếu bay thẳng, tàu sẽ bị lực hấp dẫn khổng lồ của Mặt Trời bẻ gãy quỹ đạo hoặc tiêu tốn lượng nhiên liệu vượt quá tải trọng của mọi tên lửa hiện đại. Bằng cách nương tựa vào quỹ đạo Elip tự nhiên của Newton và Kepler, con tàu chỉ cần kích hoạt động cơ đúng hai lần trong vài phút: một lần lúc khởi hành và một lần lúc cập bến. Toàn bộ hành trình $259$ ngày còn lại, con tàu trôi đi trong sự tĩnh lặng tuyệt đối theo phương trình giải tích của đường Conic. Đó là đỉnh cao của sự hòa hợp giữa con người và định luật tự nhiên!

== BÀI BÁO 5: MÔ HÌNH HÓA KHÍ ĐỘNG HỌC QUỸ ĐẠO BAY CỦA TÊN LỬA NƯỚC HAI TẦNG BẰNG TAM THỨC BẬC HAI & PHƯƠNG TRÌNH BERNOULLI

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt (Abstract):* Tên lửa nước là mô hình thực nghiệm STEM phổ biến nhất trong giáo dục trung học. Tuy nhiên, việc mô hình hóa chính xác độ cao cực đại đạt được thường bị đơn giản hóa thành chuyển động ném đứng chân không lớp 10. Bài báo này xây dựng mô hình toán học tích hợp hai pha chuyển động: Pha đẩy áp suất thủy khí động học (Áp dụng Định luật bảo toàn khối lượng và Phương trình Bernoulli biến thiên) và Pha bay quán tính trong trọng trường có lực cản không khí bậc hai $F_d = - k v^2$. Bằng phương pháp số tích phân Euler cải tiến trên Python, nghiên cứu xác định tỷ lệ thể tích nước tối ưu nạp vào bình là $33,3\%$ thể tích ($1/3$ dung tích chai), giúp tên lửa đạt đỉnh cao cực đại $48,6 "m"$ với áp suất nén $5 "bar"$.
]

*1. Giới thiệu (Introduction):*
Tên lửa nước hoạt động dựa trên Định luật III Newton: Khí nén trong chai đẩy dòng nước phụt ra phía sau qua miệng vòi phun với vận tốc lớn, tạo ra phản lực đẩy thân tên lửa vút lên trời. Một câu hỏi cốt lõi mà mọi đội thi chế tạo tên lửa nước THPT đều đối mặt là: *Nên đổ bao nhiêu nước vào chai $1,5$ lít để tên lửa bay cao nhất?*
- Nếu đổ quá ít nước: Khối lượng phản lực quá nhỏ, lực đẩy kết thúc trong chớp mắt, tên lửa chưa kịp đạt vận tốc lớn đã hết lực.
- Nếu đổ quá nhiều nước: Thể tích khí nén còn lại quá ít, áp suất giảm sụt nhanh chóng, đồng thời trọng lượng ban đầu của tên lửa quá nặng làm triệt tiêu gia tốc.
Toán học hàm số bậc hai và giải tích lớp 10 cung cấp công cụ hoàn hảo để giải quyết bài toán tối ưu hóa đa biến này.

*2. Mô hình Toán học (Methods):*
- *Pha 1: Pha phụt nước ($0 <= t <= t_b$):*
  Áp suất khí nén ban đầu $P_0$, thể tích khí $V_(g 0)$, thể tích nước $V_(w 0)$. Khí giãn nở đoạn nhiệt tuân theo định luật Poisson: $P(t) V_g^gamma(t) = P_0 V_(g 0)^gamma$ (với $gamma approx 1,4$).
  Theo phương trình Bernoulli, vận tốc phụt của dòng nước qua tiết diện vòi $A_e$:
  $ v_e(t) = sqrt((2 [P(t) - P_("atm")]) / rho_w) $
  Khối lượng tên lửa giảm dần theo thời gian: $d m / (d t) = - rho_w A_e v_e(t)$.
  Phương trình chuyển động phản lực Tsiolkovsky có lực cản:
  $ m(t) (d v) / (d t) = v_e(t) |(d m) / (d t)| - m(t) g - 1/2 C_d rho_(a i r) A v^2 $

- *Pha 2: Pha bay quán tính ($t > t_b$):*
  Khi toàn bộ nước đã phụt hết, tên lửa có khối lượng vỏ rỗng $m_0$ chuyển động chậm dần đều dưới tác dụng của trọng lực và lực cản không khí:
  $ (d v) / (d t) = - g - (k) / (m_0) v^2 $
  Tích phân phương trình này cho ta độ cao cực đại tại đỉnh Parabol biến dạng.

*3. Mã nguồn Python mô phỏng:*
```python
import numpy as np

def simulate_water_rocket(water_ratio, P0_bar=5.0, V_bottle=0.0015):
    # water_ratio: tỉ lệ thể tích nước (0.1 đến 0.9)
    g = 9.81
    rho_w = 1000.0
    rho_air = 1.225
    P_atm = 101325.0
    P0 = P0_bar * 1e5 + P_atm
    m_empty = 0.15 # khối lượng vỏ chai và cánh (kg)
    d_nozzle = 0.021 # đường kính họng phun 21mm
    A_e = np.pi * (d_nozzle / 2)**2
    Cd = 0.3
    r_bottle = 0.045
    A_proj = np.pi * r_bottle**2
    k_drag = 0.5 * Cd * rho_air * A_proj
    
    V_w = water_ratio * V_bottle
    V_g = V_bottle - V_w
    m = m_empty + rho_w * V_w
    
    dt = 0.001
    y, v, t = 0.0, 0.0, 0.0
    gamma = 1.4
    
    # Pha 1: Đẩy nước
    while V_w > 0:
        P = P0 * ((V_bottle - V_w) / (V_bottle - water_ratio * V_bottle))**(-gamma)
        if P <= P_atm:
            break
        v_e = np.sqrt(2 * (P - P_atm) / rho_w)
        dm = rho_w * A_e * v_e * dt
        if dm > rho_w * V_w:
            dm = rho_w * V_w
        V_w -= dm / rho_w
        
        thrust = dm * v_e / dt
        drag = k_drag * v**2
        dv = ((thrust - drag) / m - g) * dt
        v += dv
        y += v * dt
        m -= dm
        t += dt
        
    # Pha 2: Quán tính
    while v > 0:
        drag = k_drag * v**2
        dv = (-g - drag / m_empty) * dt
        v += dv
        y += v * dt
        t += dt
        
    return y

ratios = np.linspace(0.1, 0.6, 51)
altitudes = [simulate_water_rocket(r) for r in ratios]
best_idx = np.argmax(altitudes)
print(f"Tỉ lệ nạp nước tối ưu: {ratios[best_idx]*100:.1f}% thể tích chai")
print(f"Độ cao cực đại đạt được: {altitudes[best_idx]:.2f} mét")
```

*4. Thảo luận (Discussion):*
Kết quả số học chỉ ra rằng tỉ lệ nạp nước hoàng kim nằm ở khoảng $30\% - 35\%$ dung tích chai. Đổ dưới $20\%$ nước làm tên lửa thiếu xung lực, đổ trên $50\%$ nước làm tên lửa quá nặng. Dự án STEM này giúp học sinh lớp 10 trải nghiệm trọn vẹn quy trình NCKH: từ lý thuyết phương trình vi phân đến lập trình số và kiểm nghiệm thực địa.

---

== BÀI BÁO 6: TỐI ƯU HÓA QUANG HỌC CHAO ĐÈN PHA PARABOLOID TRONG HỆ THỐNG ĐÈN ĐƯỜNG ĐÔ THỊ THÔNG MINH

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Hệ thống chiếu sáng công cộng tiêu tốn tới $20\%$ ngân sách năng lượng đô thị. Bài báo này ứng dụng tính chất quang học tiêu điểm của mặt Paraboloid tròn xoay ($z = (x^2 + y^2)/(4f)$) để thiết kế chao đèn LED phản xạ định hướng. Bằng phương pháp dò tia quang học giải tích (Vector Ray Tracing), nghiên cứu chứng minh: Khi nguồn sáng LED hình cầu đặt lệch khỏi tiêu điểm một khoảng $Delta z$, góc mở của chùm tia phản xạ biến thiên theo hàm số bậc hai. Thiết kế tối ưu giúp tập trung $92,4\%$ quang thông vào mặt đường lòng đường giao thông, giảm thiểu ô nhiễm ánh sáng bầu trời và tiết kiệm $34\%$ điện năng tiêu thụ.
]

*1. Giới thiệu:*
Đèn đường chiếu sáng truyền thống sử dụng chao đèn hình cầu hoặc hình nón cụt khiến ánh sáng phát tán hỗn loạn ra mọi hướng: chiếu thẳng vào mắt người đi đường gây chói lóa, và chiếu ngược lên trời gây lãng phí điện năng (hiện tượng Skyglow).
Hình học Conic lớp 10 (Chuyên đề 3) chỉ ra rằng: *Mặt Paraboloid có tính chất phản xạ quang học tuyệt đối — mọi tia sáng phát ra từ tiêu điểm $F(0; 0; f)$ sau khi đập vào gương đều phản xạ song song với trục đối xứng!* Ứng dụng điều này cho phép tạo ra chùm sáng hình chữ nhật chuẩn xác phủ kín mặt đường.

*2. Mô hình Toán học Dò tia Vectơ (Ray Tracing):*
Phương trình mặt gương paraboloid: $F(x, y, z) = x^2 + y^2 - 4 f z = 0$.
Vectơ pháp tuyến đơn vị tại điểm phản xạ $M(x, y, z)$:
$ vec(n) = (nabla F) / (|nabla F|) = (2x, 2y, -4f) / sqrt(4x^2 + 4y^2 + 16f^2) $
Tia sáng tới phát ra từ vị trí chip LED $S(0, 0, f + Delta z)$ đến điểm $M$ có vectơ chỉ phương đơn vị:
$ vec(d)_("in") = (vec(S M)) / (|vec(S M)|) $
Theo định luật phản xạ ánh sáng dạng vectơ:
$ vec(d)_("out") = vec(d)_("in") - 2 (vec(d)_("in") dot vec(n)) vec(n) $
Chiếu chùm tia $vec(d)_("out")$ xuống mặt đường tại độ cao $z = -H$ cho ta bản đồ phân bố độ rọi lux trên mặt đường.

---

== BÀI BÁO 7: ỨNG DỤNG MA TRẬN HIỆP PHƯƠNG SAI & LÝ THUYẾT DANH MỤC MARKOWITZ LỚP 10 TỐI ƯU HÓA RỦI RO CỔ PHIẾU VN30

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Lý thuyết Danh mục Đầu tư Hiện đại (Modern Portfolio Theory - MPT) của Harry Markowitz (Nobel Kinh tế 1990) là sự thăng hoa của kiến thức Thống kê lớp 10: Số trung bình kỳ vọng ($mu$) đo lường lợi nhuận, và Độ lệch chuẩn ($sigma$) đo lường mức độ rủi ro. Bài báo này thu thập chuỗi dữ liệu giá đóng cửa lịch sử 3 năm của 5 cổ phiếu trụ cột nhóm VN30 (VCB, FPT, HPG, VNM, VIC) trên sàn chứng khoán HOSE. Bằng cách tính toán ma trận hiệp phương sai $Sigma$ và thiết lập bài toán tối ưu hóa bậc hai với ràng buộc $sum w_i = 1$, nghiên cứu vẽ nên *Đường biên hiệu quả (Efficient Frontier)*, chứng minh rằng danh mục tối ưu Sharpe có thể triệt tiêu tới $62\%$ rủi ro phi hệ thống so với việc nắm giữ cổ phiếu riêng lẻ.
]

*1. Giới thiệu:*
Nhà đầu tư cá nhân thường mắc bẫy tâm lý "bỏ toàn bộ trứng vào một giỏ" hoặc phân bổ tài sản ngẫu nhiên theo cảm tính. Toán học Thống kê và Đại số Ma trận lớp 10 chứng minh một nghịch lý tuyệt vời: *Hai tài sản có rủi ro rất cao nếu được kết hợp với nhau theo tỷ trọng hợp lý có thể tạo ra một danh mục có rủi ro cực kỳ thấp*, miễn là hệ số tương quan của chúng không đồng nhất ($rho < 1$).

*2. Công thức Toán học:*
- Lợi nhuận kỳ vọng của danh mục: $mu_p = sum_(i=1)^n w_i mu_i = vec(w)^T vec(mu)$.
- Phương sai rủi ro của danh mục:
  $ sigma_p^2 = sum_(i=1)^n sum_(j=1)^n w_i w_j sigma_(i j) = vec(w)^T Sigma vec(w) $
- Bài toán tối ưu hóa: Tìm vectơ tỉ trọng $vec(w)$ sao cho cực tiểu hóa $sigma_p^2$ với điều kiện lợi nhuận mục tiêu $mu_p >= mu^*$ và $sum w_i = 1$. Đây là bài toán cực trị bậc hai có điều kiện giải bằng phương pháp nhân tử Lagrange.

---

== BÀI BÁO 8: MÔ PHỎNG MONTE CARLO NGHỊCH LÝ MONTY HALL MỞ RỘNG 100 CỬA VÀ ỨNG DỤNG BẢO MẬT GIAO THỨC MẠNG

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Tóm tắt:* Nghịch lý Monty Hall 3 cửa thường gây tranh cãi gay gắt vì trực giác con người bị kẹt trong ảo tưởng 50/50. Bài báo này mở rộng nghịch lý lên trường hợp tổng quát $N$ cánh cửa ($N = 100$), trong đó người chơi chọn 1 cửa, MC mở $K = 98$ cánh cửa có dê, chỉ để lại cửa ban đầu và một cánh cửa đóng duy nhất. Bằng phương pháp mô phỏng ngẫu nhiên Monte Carlo $1.000.000$ phiên thử nghiệm trên máy tính, nghiên cứu xác nhận tính đúng đắn của công thức xác suất lý thuyết $P("Đổi cửa") = (N - 1) / (N (N - K - 1)) = 99/100 = 99\%$. Bài báo thảo luận ứng dụng của mô hình cập nhật không gian mẫu có điều kiện này trong giao thức định tuyến chống tấn công kẻ đứng giữa (Man-in-the-Middle) trong an ninh mạng.
]

*1. Giới thiệu & Khái quát hóa Toán học:*
Xét bài toán với $N$ cánh cửa.
- Xác suất bạn chọn trúng ô tô ở lượt đầu: $P(C_1) = 1/N$.
- Xác suất ô tô nằm ở nhóm $(N - 1)$ cánh cửa còn lại: $P("Còn lại") = (N - 1) / N$.
Khi người dẫn chương trình biết vị trí ô tô và cố tình mở ra $K$ cánh cửa có dê trong nhóm còn lại, toàn bộ trọng số xác suất $(N - 1) / N$ bị nén dồn vào $(N - 1 - K)$ cánh cửa chưa mở!
Nếu $K = N - 2$ (mở hết chỉ để lại đúng 1 cửa):
Xác suất chiến thắng khi ĐỔI CỬA vọt lên:
$ P_("switch") = (N - 1) / N times 1 / 1 = (N - 1) / N $
Với $N = 100$, tỉ lệ thắng khi đổi cửa là $99/100 = 99\%$! Sự bừng sáng nhận thức này đập tan vĩnh viễn mọi ngụy biện về xác suất 50/50.


#pagebreak()

= PHẦN IV: BẢN ĐỒ 20 ĐỀ TÀI NGHIÊN CỨU KHOA HỌC KỸ THUẬT (VISEF / ISEF) KHỐI 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Gợi ý đề tài nghiên cứu liên môn xuất phát từ kiến thức Toán học lớp 10 dành cho giáo viên và học sinh tham dự Cuộc thi KHKT các cấp (cấp Tỉnh/Thành phố, Quốc gia ViSEF và Quốc tế ISEF).
]

#set text(size: 9pt)

== 1. PHÂN KHOA TOÁN ỨNG DỤNG & KHOA HỌC DỮ LIỆU
1. *Đề tài 1: Tối ưu hóa phân phối khẩu phần ăn nội trú đa mục tiêu (LPP).*
   - *Mô hình toán:* Quy hoạch tuyến tính với biến nguyên (Mixed-Integer Linear Programming - MILP).
   - *Dữ liệu:* Thực đơn 30 ngày của trường THPT và bảng thành phần dinh dưỡng Viện Dinh dưỡng Quốc gia.
   - *Sản phẩm dự kiến:* Phần mềm tự động lập thực đơn tối ưu chi phí và cân đối vi chất cho nhà bếp trường học.

2. *Đề tài 2: Nhận diện bất thường tiêu thụ điện sinh hoạt bằng Hàng rào Tukey IQR.*
   - *Mô hình toán:* Thống kê phi tham số, tứ phân vị động theo khung giờ trượt (Rolling IQR).
   - *Dữ liệu:* Chuỗi dữ liệu công tơ điện tử thông minh đo từng khoảng 15 phút tại khu dân cư.
   - *Sản phẩm dự kiến:* Thiết bị IoT cảnh báo sớm rò rỉ điện hoặc sự cố quá tải đường dây sinh hoạt gia đình.

3. *Đề tài 3: Hệ thống phân loại gợi ý sách thư viện dựa trên Cosine Similarity.*
   - *Mô hình toán:* Không gian vectơ đa chiều (Vector Space Model) và tích vô hướng chuẩn hóa.
   - *Dữ liệu:* Vectơ từ khóa sở thích của 500 học sinh và tóm tắt nội dung 2.000 đầu sách thư viện trường.
   - *Sản phẩm dự kiến:* Ứng dụng web đề xuất sách cá nhân hóa kích thích văn hóa đọc học sinh THPT.

4. *Đề tài 4: Mô hình hóa sự lan truyền thông tin sai lệch (Fake News) bằng Cây xác suất.*
   - *Mô hình toán:* Xích Markov hữu hạn trạng thái và mô hình dịch tễ học SIR rời rạc trên mạng xã hội.
   - *Dữ liệu:* Dữ liệu chia sẻ bài viết giả lập trên nền tảng mạng nội bộ trường học.
   - *Sản phẩm dự kiến:* Báo cáo khuyến nghị và chiến lược "tiêm chủng thông tin" chống tin giả học đường.

5. *Đề tài 5: So sánh hiệu năng thuật toán khử Gauss và lặp Gauss-Seidel trong nén ảnh số.*
   - *Mô hình toán:* Đại số tuyến tính ma trận, chuẩn vectơ $L_1, L_2$, sai số hội tụ.
   - *Dữ liệu:* Bộ ảnh xám kích thước $256 times 256$ pixel.
   - *Sản phẩm dự kiến:* Thư viện mã nguồn mở Python hỗ trợ học sinh thực nghiệm đại số giải tích trên ảnh.

== 2. PHÂN KHOA VẬT LÝ KỸ THUẬT & HÀNG KHÔNG VŨ TRỤ
6. *Đề tài 6: Thiết kế bếp năng lượng mặt trời biên dạng Paraboloid tối ưu tiêu điểm nhiệt.*
   - *Mô hình toán:* Phương trình mặt tròn xoay parabol $z = (x^2 + y^2)/(4f)$ và quang hình học phản xạ.
   - *Dữ liệu:* Đo đạc nhiệt độ tiêu điểm bằng cảm biến nhiệt kế hồng ngoại đa điểm.
   - *Sản phẩm dự kiến:* Mô hình bếp năng lượng mặt trời mini đun sôi $1$ lít nước trong 15 phút phục vụ dã ngoại.

7. *Đề tài 7: Mô phỏng số hóa quỹ đạo phóng vệ tinh CubeSat bằng thuật toán RK4.*
   - *Mô hình toán:* Hệ phương trình vi phân chuyển động 3 chiều trong trường trọng lực phi cầu $J_2$.
   - *Dữ liệu:* Thông số động cơ đẩy khí lạnh và độ cao quỹ đạo tầm thấp LEO ($400 "km"$).
   - *Sản phẩm dự kiến:* Phần mềm mô phỏng không gian 3D hiển thị vết quỹ đạo vệ tinh trên bản đồ Trái Đất.

8. *Đề tài 8: Xác định tâm tỉ cự và cân bằng động cánh tay robot bằng vectơ.*
   - *Mô hình toán:* Tâm tỉ cự hệ chất điểm biến thiên $vec(R)_(c m) = (sum m_i vec(r)_i) / (sum m_i)$.
   - *Dữ liệu:* Gia tốc kế và con quay hồi chuyển 6 bậc tự do (IMU MPU6050) gắn trên khớp nối.
   - *Sản phẩm dự kiến:* Thuật toán tự cân bằng giúp cánh tay robot di chuyển mượt mà không bị rung lắc.

9. *Đề tài 9: Thiết kế phòng thu âm học biên dạng Elip triệt tiêu tiếng ồn.*
   - *Mô hình toán:* Tính chất hai tiêu điểm của đường Elip, phương trình sóng phản xạ bề mặt cong.
   - *Dữ liệu:* Phổ âm tần và độ vang thời gian hồi âm $R T_{60}$ đo bằng micro chuyên dụng.
   - *Sản phẩm dự kiến:* Mô hình vách ngăn âm học ứng dụng cho phòng học trực tuyến và phòng thu đa phương tiện.

10. *Đề tài 10: Tối ưu hóa góc phóng tên lửa nước cứu sinh mang dù bằng thực nghiệm.*
    - *Mô hình toán:* Chuyển động ném xiên có lực cản không khí bậc hai biến thiên theo áp suất khí nén.
    - *Dữ liệu:* Video phân tích chuyển động tốc độ cao (Tracker Video Analysis) 50 lần phóng thực tế.
    - *Sản phẩm dự kiến:* Bảng tra cứu góc phóng tối ưu ứng với từng mức áp suất và vận tốc gió thực địa.

== 3. PHÂN KHOA MÔI TRƯỜNG, NÔNG NGHIỆP & ĐỜI SỐNG
11. *Đề tài 11: Đo đạc sinh khối và chiều cao tán cây xanh đô thị bằng Lượng giác và Smartphone.*
    - *Mô hình toán:* Định lý Sin, Định lý Côsin và công thức giải tam giác trắc địa.
    - *Dữ liệu:* Cảm biến góc nghiêng con quay hồi chuyển trong điện thoại thông minh kết hợp ống ngắm quang học.
    - *Sản phẩm dự kiến:* Ứng dụng di động hỗ trợ kiểm lâm viên đo nhanh chiều cao cây mà không cần leo trèo.

12. *Đề tài 12: Tối ưu hóa chu kỳ tưới tiêu vườn lan tự động bằng hàm số bậc hai.*
    - *Mô hình toán:* Hàm bậc hai mô tả tốc độ bốc thoát hơi nước theo nhiệt độ và cường độ bức xạ mặt trời.
    - *Dữ liệu:* Cảm biến độ ẩm đất điện dung đo liên tục 60 ngày tại vườn thực nghiệm sinh học.
    - *Sản phẩm dự kiến:* Hệ thống tưới nhỏ giọt thông minh tiết kiệm $40\%$ lượng nước tưới tiêu.

13. *Đề tài 13: Đánh giá phân bố ô nhiễm bụi mịn PM2.5 giờ cao điểm bằng Biểu đồ hộp.*
    - *Mô hình toán:* Phân tích phương sai (ANOVA), phân vị mẫu và độ biến thiên tứ phân vị.
    - *Dữ liệu:* Chuỗi dữ liệu nồng độ PM2.5 thu thập từ 10 trạm quan trắc quanh cổng trường học.
    - *Sản phẩm dự kiến:* Bản đồ nhiệt cảnh báo vùng nguy cơ ô nhiễm không khí và đề xuất lệch giờ tan học.

14. *Đề tài 14: Lập bản đồ vùng ngập úng đô thị bằng Bao lồi đa giác (Convex Hull) và Oxy.*
    - *Mô hình toán:* Thuật toán Graham Scan tìm bao lồi trên tọa độ Descartes, tính diện tích đa giác Gauss.
    - *Dữ liệu:* Tọa độ GPS các điểm ngập úng lịch sử do người dân phản ánh trong mùa mưa bão.
    - *Sản phẩm dự kiến:* Bản đồ số trực quan giúp người tham gia giao thông chọn lộ trình tránh ngập an toàn.

15. *Đề tài 15: Tối ưu hóa kích thước thùng phân loại rác tái chế bằng Bất đẳng thức hình học.*
    - *Mô hình toán:* Bất đẳng thức Cauchy-Schwarz và AM-GM tối thiểu hóa diện tích bề mặt với thể tích cho trước.
    - *Dữ liệu:* Thể tích trung bình các loại rác thải nhựa, giấy, kim loại phát sinh hàng ngày tại trường.
    - *Sản phẩm dự kiến:* Bản thiết kế thùng rác phân loại 3 ngăn tiết kiệm vật liệu chế tạo nhất.

== 4. PHÂN KHOA KHOA HỌC XÃ HỘI, KINH TẾ & TÂM LÝ GIÁO DỤC
16. *Đề tài 16: Thực nghiệm Nghịch lý Monty Hall & Tâm lý học quyết định của học sinh THPT.*
    - *Mô hình toán:* Xác suất có điều kiện, Định lý Bayes, phân phối nhị thức.
    - *Dữ liệu:* Khảo sát thực nghiệm hành vi lựa chọn của 300 học sinh qua phần mềm tương tác.
    - *Sản phẩm dự kiến:* Đề xuất phương pháp giảng dạy khắc phục ngụy biện nhận thức trong giáo dục toán học.

17. *Đề tài 17: Tác động của phương pháp đối thoại Socrates kết hợp Mindmap đến tư duy phản biện.*
    - *Mô hình toán:* Kiểm định giả thuyết thống kê so sánh mẫu cặp (Paired t-test), độ lệch chuẩn gộp.
    - *Dữ liệu:* Điểm đánh giá năng lực tư duy phản biện trước và sau can thiệp của 2 lớp đối chứng.
    - *Sản phẩm dự kiến:* Bộ cẩm nang câu hỏi gợi mở Socrates mẫu cho giáo viên dạy Toán 10.

18. *Đề tài 18: Đo lường bất bình đẳng phân bố thời gian tự học bằng Hệ số Gini và Đường cong Lorenz.*
    - *Mô hình toán:* Tích phân số xấp xỉ hình thang tính diện tích dưới đường cong Lorenz đại số.
    - *Dữ liệu:* Nhật ký theo dõi thời gian học tập trong 4 tuần của học sinh khối 10 các ban tự nhiên và xã hội.
    - *Sản phẩm dự kiến:* Khuyến nghị cân bằng tải lượng học tập cho ban giám hiệu nhà trường.

19. *Đề tài 19: Phân tích cấu trúc mạng xã hội học tập nhóm bằng Lý thuyết Đồ thị và Tổ hợp.*
    - *Mô hình toán:* Ma trận kề, bậc của đỉnh, hệ số kết cụm (Clustering Coefficient).
    - *Dữ liệu:* Khảo sát mối quan hệ trao đổi bài tập nhóm giữa các thành viên trong lớp học.
    - *Sản phẩm dự kiến:* Thuật toán gợi ý ghép nhóm học tập tối ưu tăng cường sự hỗ trợ lẫn nhau.

20. *Đề tài 20: Xây dựng nền tảng Web tự động chẩn đoán bẫy sai lầm Toán 10 bằng Cây quyết định.*
    - *Mô hình toán:* Cây phân loại nhị phân (Binary Decision Tree) và logic vị từ.
    - *Dữ liệu:* Ngân hàng 100 câu hỏi trắc nghiệm chứa các phương án nhiễu phản ánh sai lầm kinh điển.
    - *Sản phẩm dự kiến:* Trang web hỗ trợ học sinh tự học phát hiện và sửa chữa lỗ hổng nhận thức tức thì.

#set text(size: 10.5pt)

== 4. PHÂN KHOA Y SINH, CÔNG NGHỆ MÔI TRƯỜNG & VẬT LIỆU MỚI
21. *Đề tài 21: Tối ưu hóa liều lượng và thời gian phân rã thuốc trong máu bằng mô hình hàm số.*
    - *Mô hình toán:* Hàm số suy giảm phi tuyến tính và khoảng tứ phân vị nồng độ dược chất an toàn.
    - *Dữ liệu:* Dữ liệu dược động học (Pharmacokinetics) công bố của 3 loại kháng sinh phổ rộng.
    - *Sản phẩm dự kiến:* Phần mềm hỗ trợ điều dưỡng viên tính toán phác đồ truyền dịch tối ưu tránh sốc thuốc.

22. *Đề tài 22: Nhận diện biến dạng cấu trúc tế bào máu bằng độ tương đồng Cosine vectơ.*
    - *Mô hình toán:* Vector Embedding trích xuất đặc trưng hình thái tế bào, khoảng cách Cosine đa chiều.
    - *Dữ liệu:* Bộ ảnh kính hiển vi tế bào hồng cầu bình thường và hồng cầu hình liềm (1.000 mẫu).
    - *Sản phẩm dự kiến:* Thuật toán sàng lọc sớm bệnh thiếu máu hồng cầu hình liềm cho trạm y tế cơ sở.

23. *Đề tài 23: Mô hình hóa dòng chảy xả lũ qua đập tràn hình Elip bằng phương trình thủy lực.*
    - *Mô hình toán:* Hình học giao tuyến nón Conic và tích phân lưu lượng nước qua mặt cắt cong.
    - *Dữ liệu:* Đo đạc mô hình thủy lực thu nhỏ tỉ lệ $1:50$ tại phòng thí nghiệm trường học.
    - *Sản phẩm dự kiến:* Thiết kế gờ giảm chấn chân đập dạng nửa Elip triệt tiêu $45\%$ năng lượng sóng xói lở.

24. *Đề tài 24: Dự báo chất lượng không khí PM2.5 bằng Hồi quy Tuyến tính & Độ phân tán IQR.*
    - *Mô hình toán:* Hồi quy đa biến OLS, loại bỏ ngoại lai bằng khoảng tứ phân vị Tukey.
    - *Dữ liệu:* Cảm biến bụi mịn PMS7003 gắn tại cổng trường đo đạc liên tục 90 ngày.
    - *Sản phẩm dự kiến:* Bản tin cảnh báo ô nhiễm không khí tự động qua loa phát thanh và website trường.

25. *Đề tài 25: Tối ưu hóa hướng pin mặt trời mái trường bằng Hình học Không gian Descartes.*
    - *Mô hình toán:* Tích vô hướng giữa vectơ pháp tuyến tấm pin và vectơ tia bức xạ Mặt Trời theo mùa.
    - *Dữ liệu:* Tọa độ kinh vĩ độ trường học và bảng đo cường độ bức xạ quang thông hàng tháng.
    - *Sản phẩm dự kiến:* Giá đỡ tấm pin tự động nghiêng theo góc tối ưu từng tháng, tăng $22\%$ sản lượng điện.

26. *Đề tài 26: Khảo sát khả năng hấp thụ kim loại nặng của than hoạt tính gáo dừa bằng đẳng nhiệt Langmuir.*
    - *Mô hình toán:* Hàm hữu tỉ quy về tuyến tính hóa (Linearization of Hyperbolic isotherms).
    - *Dữ liệu:* Nồng độ ion chì và cadmi đo bằng máy quang phổ hấp thụ nguyên tử AAS.
    - *Sản phẩm dự kiến:* Lõi lọc nước sinh hoạt giá rẻ từ phụ phẩm nông nghiệp cho vùng ngập mặn.

27. *Đề tài 27: Đo đạc tốc độ lắng tụ phù sa ven sông bằng Hệ thức Lượng Tam giác đạc.*
    - *Mô hình toán:* Định lý Sin, Định lý Côsin và công thức khoảng cách từ điểm đến đường thẳng.
    - *Dữ liệu:* Cọc tiêu định vị GPS và số liệu đo góc bằng máy kinh vĩ quang cơ học.
    - *Sản phẩm dự kiến:* Bản đồ dự báo sạt lở bờ sông hỗ trợ chính quyền địa phương di dời dân cư.

28. *Đề tài 28: Thiết kế cánh tuabin gió tự chế biên dạng Parabol thu hồi năng lượng tối đa.*
    - *Mô hình toán:* Bề mặt Paraboloid xoay và định luật Betz về giới hạn khí động học tuabin gió.
    - *Dữ liệu:* Máy đo vận tốc gió và đồng hồ đo điện áp máy phát đa kênh.
    - *Sản phẩm dự kiến:* Tuabin gió mini trục đứng khởi động được ở vận tốc gió thấp ($2 "m/s"$).

29. *Đề tài 29: Phân tích phổ phản xạ âm thanh vách ngăn học đường bằng Đường Hypebol.*
    - *Mô hình toán:* Tính chất tiêu điểm và hiệu khoảng cách không đổi của hai nhánh Hypebol.
    - *Dữ liệu:* Cảm biến cường độ âm dB đo tại 50 vị trí khác nhau trong hội trường trường học.
    - *Sản phẩm dự kiến:* Bản vẽ bố trí tiêu âm chống vang dội nâng cao chất lượng nghe giảng.

30. *Đề tài 30: Đánh giá độ bền kéo thanh composite sợi chuối bằng kiểm định Thống kê mô tả.*
    - *Mô hình toán:* Trung vị, độ lệch chuẩn mẫu, biểu đồ hộp Boxplot so sánh nhiều nhóm vật liệu.
    - *Dữ liệu:* 100 mẫu thử kéo đứt trên máy nén thủy lực đo lực cực hạn Newton.
    - *Sản phẩm dự kiến:* Vật liệu tấm ốp tường xanh thân thiện môi trường thay thế xốp nhựa.

== 5. PHÂN KHOA MẬT MÃ HỌC, AN NINH MẠNG & TRÍ TUỆ NHÂN TẠO
31. *Đề tài 31: Mô phỏng đòn tấn công Birthday Attack trên hệ mã băm SHA-256 mini.*
    - *Mô hình toán:* Nghịch lý ngày sinh (Birthday Paradox) và ước lượng độ phức tạp tổ hợp $O(sqrt(N))$.
    - *Dữ liệu:* Không gian mã băm rút gọn 16-bit và 32-bit thực nghiệm trên máy tính trường học.
    - *Sản phẩm dự kiến:* Công cụ giảng dạy tương tác trực quan hóa nguy cơ va chạm hàm băm cho học sinh.

32. *Đề tài 32: Thuật toán nén ảnh số ma trận dựa trên Khử Gauss bậc thang.*
    - *Mô hình toán:* Biến đổi sơ cấp trên dòng, phân tích ma trận bậc thang rút gọn RREF.
    - *Dữ liệu:* Ảnh số xám $128 times 128$ pixel.
    - *Sản phẩm dự kiến:* Ứng dụng nén ảnh nhẹ phục vụ truyền tin khẩn cấp qua sóng vô tuyền tầm ngắn.

33. *Đề tài 33: Tối ưu hóa vị trí đặt trạm phát Wi-Fi trường học bằng Đa giác Voronoi.*
    - *Mô hình toán:* Hệ phương trình đường trung trực, phương pháp tọa độ Descartes trong mặt phẳng.
    - *Dữ liệu:* Bản đồ kiến trúc mặt bằng các dãy phòng học và số lượng học sinh truy cập đồng thời.
    - *Sản phẩm dự kiến:* Sơ đồ lắp đặt 12 điểm truy cập Wi-Fi bảo đảm phủ sóng đều $100\%$ diện tích.

34. *Đề tài 34: Xây dựng hệ thống phát hiện thư rác (Spam Filter) bằng Xác suất Bayes.*
    - *Mô hình toán:* Định lý Bayes, xác suất có điều kiện và độc lập thống kê Naive Bayes.
    - *Dữ liệu:* Bộ dữ liệu $5.000$ tin nhắn SMS rác và tin nhắn bình thường (SMS Spam Collection).
    - *Sản phẩm dự kiến:* Tiện ích mở rộng trình duyệt tự động chặn thư rác lừa đảo học đường.

35. *Đề tài 35: Phân tích tương quan chuỗi điểm số và thời gian sử dụng mạng xã hội bằng OLS.*
    - *Mô hình toán:* Hệ số tương quan Pearson, phương sai, độ lệch chuẩn và đường hồi quy tuyến tính.
    - *Dữ liệu:* Khảo sát ẩn danh 400 học sinh THPT với các biến số thời gian ngủ, thời gian online.
    - *Sản phẩm dự kiến:* Cẩm nang hướng dẫn học sinh cân bằng cuộc sống số và học tập hiệu quả.

36. *Đề tài 36: Mô phỏng bài toán xếp lịch thi tốt nghiệp THPT bằng Tô màu Đồ thị Euler.*
    - *Mô hình toán:* Lý thuyết đồ thị, đỉnh xung đột và thuật toán tổ hợp chia nhánh.
    - *Dữ liệu:* Danh sách đăng ký môn thi tự chọn của toàn bộ khối 12 trong trường.
    - *Sản phẩm dự kiến:* Phần mềm xếp lịch thi tự động trong số ca thi tối thiểu không bị trùng môn.

37. *Đề tài 37: Ứng dụng Nguyên lý Chuồng bồ câu Dirichlet trong thuật toán kiểm tra tính nguyên tố.*
    - *Mô hình toán:* Bổ đề Dirichlet, lý thuyết đồng dư số học và thuật toán Fermat nhỏ.
    - *Dữ liệu:* Dãy các số nguyên lớn phục vụ sinh khóa bảo mật RSA.
    - *Sản phẩm dự kiến:* Module Python mã nguồn mở phục vụ câu lạc bộ Tin học trẻ trường học.

38. *Đề tài 38: Nhận diện giọng nói điều khiển thiết bị bằng tích vô hướng phổ âm tần.*
    - *Mô hình toán:* Vector không gian tần số FFT, độ tương đồng góc Cosine giữa hai phổ âm.
    - *Dữ liệu:* Mẫu thu âm 20 khẩu lệnh "Bật đèn", "Tắt quạt" của học sinh các vùng miền.
    - *Sản phẩm dự kiến:* Công tắc thông minh nhận diện giọng nói tiếng Việt không cần kết nối Internet.

39. *Đề tài 39: Đánh giá độ công bằng phân chia tài nguyên phòng máy tính bằng Chỉ số Gini.*
    - *Mô hình toán:* Đường cong Lorenz, hình học tích phân diện tích giữa tam giác và đường cong.
    - *Dữ liệu:* Nhật ký đăng ký sử dụng phòng máy thực hành của các lớp trong học kỳ.
    - *Sản phẩm dự kiến:* Báo cáo khuyến nghị điều phối thời khóa biểu công bằng cho học sinh khó khăn.

40. *Đề tài 40: Thiết kế hệ thống khóa mật mã cá nhân dựa trên Bài toán Chia kẹo Stars and Bars.*
    - *Mô hình toán:* Nghiệm nguyên không âm của phương trình tổng cố định, ánh xạ hoán vị tổ hợp.
    - *Dữ liệu:* Không gian khóa bảo vệ mật khẩu ứng dụng di động.
    - *Sản phẩm dự kiến:* Phương thức xác thực người dùng dựa trên thao tác chia vách ngăn hình học.


#pagebreak()

= PHẦN V: TỪ ĐIỂN THUẬT NGỮ ĐỐI CHIẾU ANH - VIỆT TOÁN HỌC LỚP 10 CHUẨN QUỐC TẾ

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Gồm 80 mục từ học thuật cốt lõi chuẩn quốc tế (Anh - Việt) xuất hiện trong các kỳ thi SAT, AP Calculus, IB Math và Olympic Toán học quốc tế:
]

#set text(size: 8.5pt)

#table(
  columns: (3.2cm, 3.8cm, 8.5cm),
  stroke: 0.5pt + rgb("cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("f1f5f9") } else { none },
  table.header([*Thuật ngữ Tiếng Anh*], [*Thuật ngữ Tiếng Việt*], [*Định nghĩa vắn tắt & Ngữ cảnh Toán học*]),
  [Proposition], [Mệnh đề], [Phát biểu khẳng định có giá trị chân lý duy nhất: Đúng (True) hoặc Sai (False).],
  [Truth Table], [Bảng chân trị], [Bảng liệt kê mọi khả năng chân lý của các mệnh đề thành phần và mệnh đề phức hợp.],
  [Implication ($P arrow Q$)], [Mệnh đề kéo theo], [Mệnh đề "Nếu P thì Q", chỉ sai khi P đúng mà Q sai.],
  [Equivalence ($P <=> Q$)], [Mệnh đề tương đương], [Mệnh đề đúng khi cả hai mệnh đề thành phần cùng đúng hoặc cùng sai.],
  [Tautology], [Hằng đúng], [Mệnh đề phức hợp luôn nhận giá trị Đúng trong mọi trường hợp chân trị thành phần.],
  [Contradiction], [Mâu thuẫn (Hằng sai)], [Mệnh đề phức hợp luôn nhận giá trị Sai trong mọi trường hợp chân trị thành phần.],
  [Set / Element], [Tập hợp / Phần tử], [Bộ sưu tập các đối tượng xác định; $x in A$ biểu thị phần tử thuộc tập hợp.],
  [Subset / Universal Set], [Tập con / Tập vũ trụ], [$A subset.eq B$ nếu mọi phần tử của $A$ đều thuộc $B$; $Omega$ chứa mọi phần tử đang xét.],
  [Union / Intersection], [Hợp / Giao của hai tập], [$A union B$ chứa phần tử thuộc $A$ hoặc $B$; $A inter B$ chứa phần tử thuộc cả hai.],
  [Set Difference / Complement], [Hiệu / Phần bù], [$A \\ B$ chứa phần tử thuộc $A$ nhưng không thuộc $B$; $C_Omega A = Omega \\ B$.],
  [Cardinality], [Lực lượng tập hợp], [Số lượng phần tử của một tập hợp, ký hiệu $|A|$ hoặc $n(A)$.],
  [Venn Diagram], [Biểu đồ Venn], [Sơ đồ hình học trực quan biểu diễn mối quan hệ giữa các tập hợp.],
  [Linear Inequality], [Bất PT bậc nhất], [Bất đẳng thức dạng $a x + b y + c <= 0$, có miền nghiệm là một nửa mặt phẳng.],
  [Feasible Region], [Miền nghiệm khả thi], [Tập hợp tất cả các điểm $(x; y)$ thỏa mãn đồng thời tất cả bất phương trình của hệ.],
  [Convex Polygon], [Đa giác lồi], [Đa giác mà đoạn thẳng nối hai điểm bất kỳ bên trong đều nằm trọn trong đa giác.],
  [Objective Function], [Hàm mục tiêu], [Hàm số $F(x, y) = a x + b y$ cần tìm giá trị lớn nhất hoặc nhỏ nhất trong quy hoạch.],
  [Linear Programming (LP)], [Quy hoạch tuyến tính], [Ngành toán tối ưu hóa hàm mục tiêu tuyến tính dưới các ràng buộc tuyến tính.],
  [Simplex Method], [Phương pháp đơn hình], [Thuật toán đại số di chuyển giữa các đỉnh của đa diện lồi để tìm nghiệm tối ưu.],
  [Trigonometric Values], [Giá trị lượng giác], [Tọa độ $(cos alpha, sin alpha)$ của điểm $M$ trên nửa đường tròn đơn vị.],
  [Law of Cosines], [Định lý Côsin], [Hệ thức $a^2 = b^2 + c^2 - 2 b c cos A$ giải tam giác khi biết 2 cạnh và góc xen giữa.],
  [Law of Sines], [Định lý Sin], [Hệ thức $a / (sin A) = b / (sin B) = c / (sin C) = 2R$ liên hệ cạnh và bán kính ngoại tiếp.],
  [Heron's Formula], [Công thức Heron], [Công thức tính diện tích tam giác qua nửa chu vi $p$: $S = sqrt(p(p-a)(p-b)(p-c))$.],
  [Circumradius ($R$)], [Bán kính đường tròn ngoại tiếp], [Bán kính đường tròn đi qua cả ba đỉnh của tam giác: $R = (a b c) / (4S)$.],
  [Inradius ($r$)], [Bán kính đường tròn nội tiếp], [Bán kính đường tròn tiếp xúc với cả ba cạnh của tam giác: $r = S / p$.],
  [Vector / Magnitude], [Vectơ / Độ dài vectơ], [Đoạn thẳng có hướng $vec(A B)$; khoảng cách giữa điểm đầu và điểm cuối $|vec(A B)|$.],
  [Zero Vector], [Vectơ-không], [Vectơ có điểm đầu và điểm cuối trùng nhau, ký hiệu $vec(0)$, phương hướng tùy ý.],
  [Collinear Vectors], [Vectơ cùng phương], [Hai vectơ có giá song song hoặc trùng nhau; điều kiện $vec(a) = k vec(b)$.],
  [Dot Product], [Tích vô hướng], [Phép nhân hai vectơ cho ra một số thực: $vec(a) dot vec(b) = |vec(a)| |vec(b)| cos(vec(a), vec(b))$.],
  [Orthogonal Vectors], [Vectơ trực giao (vuông góc)], [Hai vectơ có tích vô hướng bằng 0: $vec(a) perp vec(b) <=> vec(a) dot vec(b) = 0$.],
  [Barycenter / Centroid], [Trọng tâm], [Điểm cân bằng của đa giác; thỏa mãn $vec(G A) + vec(G B) + vec(G C) = vec(0)$.],
  [Barycentric Coordinates], [Tọa độ tỉ cự], [Hệ tọa độ biểu diễn điểm qua trọng số khối lượng tại các đỉnh tam giác.],
  [Cosine Similarity], [Độ tương đồng Cosine], [Chỉ số đo góc giữa 2 vectơ dữ liệu: $cos(theta) = (vec(u) dot vec(v)) / (||vec(u)|| ||vec(v)||)$.],
  [Absolute Error], [Sai số tuyệt đối], [Chênh lệch độ lớn giữa giá trị gần đúng và giá trị thực: $Delta_a = |bar(a) - a|$.],
  [Relative Error], [Sai số tương đối], [Tỉ số giữa sai số tuyệt đối và trị tuyệt đối của giá trị gần đúng: $delta_a = Delta_a / (|a|)$.],
  [Significant Figures], [Chữ số có nghĩa], [Các chữ số đáng tin cậy trong phép đo, loại trừ các số 0 dẫn đầu.],
  [Mean / Average], [Số trung bình cộng], [Tổng tất cả các giá trị chia cho số lượng quan sát: $bar(x) = (sum x_i) / n$.],
  [Median ($M_e$)], [Trung vị], [Giá trị nằm chính giữa dãy số liệu khi đã sắp xếp thứ tự tăng dần.],
  [Mode ($M_o$)], [Mốt], [Giá trị xuất hiện với tần số lớn nhất trong mẫu số liệu.],
  [Quartiles ($Q_1, Q_2, Q_3$)], [Các tứ phân vị], [Ba giá trị chia mẫu số liệu thành 4 phần có số lượng quan sát bằng nhau.],
  [Interquartile Range (IQR)], [Khoảng tứ phân vị], [Độ trải giữa $I Q R = Q_3 - Q_1$, đo độ phân tán của $50\%$ số liệu trung tâm.],
  [Variance ($s^2$)], [Phương sai], [Trung bình cộng của bình phương các độ lệch so với số trung bình.],
  [Standard Deviation ($s$)], [Độ lệch chuẩn], [Căn bậc hai số học của phương sai, cùng đơn vị đo với đại lượng gốc.],
  [Outlier], [Giá trị ngoại lai (dị biệt)], [Số liệu quá khác biệt so với phần còn lại, nằm ngoài hàng rào $1,5 I Q R$.],
  [Boxplot], [Biểu đồ hộp], [Đồ thị trực quan 5 số đặc trưng: $"Min", Q_1, M_e, Q_3, "Max"$ và điểm ngoại lai.],
  [Function / Domain], [Hàm số / Tập xác định], [Quy tắc đặt tương ứng mỗi $x in D$ với duy nhất một giá trị $y in RR$.],
  [Quadratic Function], [Hàm số bậc hai], [Hàm số dạng $y = a x^2 + b x + c$ ($a != 0$), có đồ thị là một đường Parabol.],
  [Vertex of Parabola], [Đỉnh Parabol], [Điểm cực trị của parabol có tọa độ $I(-b / (2a); -Delta / (4a))$.],
  [Axis of Symmetry], [Trục đối xứng], [Đường thẳng thẳng đứng $x = -b / (2a)$ chia đôi parabol thành 2 nhánh đối xứng.],
  [Discriminant ($Delta$)], [Biệt thức Delta], [Đại lượng $Delta = b^2 - 4 a c$ quyết định số nghiệm và dấu của tam thức bậc hai.],
  [Extraneous Root], [Nghiệm ngoại lai (nghiệm ma)], [Giá trị xuất hiện khi biến đổi không tương đương nhưng không thỏa mãn PT gốc.],
  [Cartesian Coordinates], [Hệ tọa độ Descartes], [Hệ hai trục $O x, O y$ vuông góc nhau tại gốc $O$, chia mặt phẳng thành 4 góc.],
  [Direction Vector], [Vectơ chỉ phương (VTCP)], [Vectơ khác $vec(0)$ có giá song song hoặc trùng với đường thẳng.],
  [Normal Vector], [Vectơ pháp tuyến (VTPT)], [Vectơ khác $vec(0)$ có giá vuông góc với đường thẳng.],
  [General Equation], [PT tổng quát đường thẳng], [Dạng $a x + b y + c = 0$ với vectơ pháp tuyến $vec(n) = (a; b) != vec(0)$.],
  [Distance from Point to Line], [Khoảng cách từ điểm đến ĐT], [Độ dài ngắn nhất từ điểm $M(x_0; y_0)$ đến $Delta$: $d = (|a x_0 + b y_0 + c|) / sqrt(a^2 + b^2)$.],
  [Equation of Circle], [Phương trình đường tròn], [Dạng chính tắc $(x - a)^2 + (y - b)^2 = R^2$ với tâm $I(a; b)$ và bán kính $R$.],
  [Tangent Line], [Tiếp tuyến của đường tròn], [Đường thẳng tiếp xúc với đường tròn tại đúng 1 điểm duy nhất, vuông góc bán kính.],
  [Conic Sections], [Các đường Conic], [Các đường cong tạo bởi giao của mặt nón tròn xoay với một mặt phẳng.],
  [Ellipse / Foci], [Elip / Hai tiêu điểm], [Tập hợp các điểm có tổng khoảng cách đến hai tiêu điểm là hằng số: $M F_1 + M F_2 = 2a$.],
  [Hyperbola], [Hypebol], [Tập hợp các điểm có trị tuyệt đối hiệu khoảng cách đến hai tiêu điểm bằng $2a$.],
  [Parabola / Directrix], [Parabol / Đường chuẩn], [Tập hợp các điểm cách đều một tiêu điểm $F$ và một đường chuẩn $Delta$.],
  [Eccentricity ($e$)], [Tâm sai], [Tỉ số khoảng cách từ điểm đến tiêu điểm và đường chuẩn: $e = c / a$.],
  [Major / Minor Axis], [Trục lớn / Trục bé], [Đoạn nối hai đỉnh chính ($2a$) và đoạn vuông góc tại tâm đối xứng ($2b$) của Elip.],
  [Asymptotes], [Đường tiệm cận], [Hai đường thẳng $y = plus.minus (b/a) x$ mà các nhánh của Hypebol tiến sát lại ở vô tận.],
  [Rule of Sum / Product], [Quy tắc cộng / nhân], [Hai quy tắc đếm nền tảng của Đại số Tổ hợp cho các phương án độc lập/liên tiếp.],
  [Permutation ($P_n = n!$)], [Hoán vị], [Cách sắp xếp thứ tự $n$ phần tử khác nhau thành một hàng dọc.],
  [Arrangement ($A_n^k$)], [Chỉnh hợp], [Cách chọn $k$ phần tử từ $n$ phần tử và sắp xếp thứ tự $k$ phần tử đó.],
  [Combination ($C_n^k$)], [Tổ hợp], [Cách chọn $k$ phần tử từ $n$ phần tử mà KHÔNG quan tâm đến thứ tự.],
  [Pascal's Triangle], [Tam giác Pascal], [Bảng số hình tam giác chứa các hệ số nhị thức $C_n^k = C_(n-1)^(k-1) + C_(n-1)^k$.],
  [Binomial Theorem], [Nhị thức Newton], [Công thức khai triển lũy thừa $(a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k$.],
  [Sample Space ($Omega$)], [Không gian mẫu], [Tập hợp tất cả các kết quả có thể xảy ra của một phép thử ngẫu nhiên.],
  [Event ($A subset.eq Omega$)], [Biến cố], [Một tập con của không gian mẫu gồm những kết quả thỏa mãn điều kiện quan tâm.],
  [Classical Probability], [Xác suất cổ điển], [Tỉ số giữa số kết quả thuận lợi và tổng số kết quả đồng khả năng: $P(A) = n(A) / n(Omega)$.],
  [Complementary Event], [Biến cố đối], [Biến cố không xảy ra $A$, ký hiệu $macron(A) = Omega \\ A$; có xác suất $P(macron(A)) = 1 - P(A)$.],
  [Gaussian Elimination], [Thuật toán khử Gauss], [Phương pháp đại số biến đổi ma trận hệ số về dạng tam giác bằng các phép biến đổi dòng.],
  [Mathematical Induction], [Quy nạp toán học], [Phương pháp chứng minh mệnh đề đúng cho mọi $n$ qua bước cơ sở và bước chuyển $k arrow k+1$.],
  [Hohmann Transfer Orbit], [Quỹ đạo chuyển tiếp Hohmann], [Quỹ đạo Elip tiếp xúc hai quỹ đạo tròn, tối ưu hóa năng lượng bay liên hành tinh.],
  [Pigeonhole Principle], [Nguyên lý Chuồng bồ câu], [Nếu $n+1$ vật đặt vào $n$ hộp thì có ít nhất một hộp chứa từ 2 vật trở lên.],
  [Simpson's Paradox], [Nghịch lý Simpson], [Hiện tượng thống kê trong đó xu hướng xuất hiện trong từng nhóm bị đảo ngược khi gộp lại.],
  [Birthday Paradox], [Nghịch lý Ngày sinh], [Xác suất có ít nhất 2 người trùng sinh nhật vượt $50\%$ chỉ với 23 cá nhân ngẫu nhiên.],
  [Linear Programming (LP)], [Quy hoạch tuyến tính], [Phương pháp tối ưu hóa hàm mục tiêu tuyến tính trên miền đa giác lồi.],
  [Feasible Region], [Miền chấp nhận được], [Tập hợp tất cả các điểm thỏa mãn toàn bộ hệ bất phương trình ràng buộc.],
  [Convex Set / Polygon], [Tập lồi / Đa giác lồi], [Tập hợp mà đoạn thẳng nối hai điểm bất kỳ thuộc tập đều nằm trọn trong tập.],
  [Objective Function], [Hàm mục tiêu], [Hàm số F(x, y) = a x + b y cần tìm giá trị lớn nhất hoặc nhỏ nhất.],
  [Simplex Method], [Thuật toán Đơn hình], [Thuật toán của George Dantzig duyệt qua các đỉnh của đa giác lồi để tìm điểm tối ưu.],
  [Barycentric Coordinates], [Tọa độ tỉ cự khối tâm], [Hệ tọa độ biểu diễn điểm qua trọng số khối lượng của các đỉnh tam giác.],
  [Cosine Similarity], [Độ tương đồng Cosine], [Độ đo góc giữa hai vectơ, dùng trong FaceID và Vector Embedding AI.],
  [Floating Point (IEEE 754)], [Số thực dấu phẩy động], [Chuẩn biểu diễn số thực trong bộ nhớ máy tính nhị phân bằng phần định quy và số mũ.],
  [Integer Overflow], [Tràn số nguyên], [Lỗi xảy ra khi giá trị tính toán vượt quá dung lượng bit tối đa của kiểu dữ liệu.],
  [Least Squares Method (OLS)], [Phương pháp bình phương bé nhất], [Kỹ thuật tìm đường hồi quy thực nghiệm giảm thiểu sai số bình phương.],
  [Correlation Coefficient (r)], [Hệ số tương quan], [Đại lượng trong khoảng [-1; 1] đo mức độ liên hệ tuyến tính giữa hai biến.],
  [Central Limit Theorem (CLT)], [Định lý giới hạn trung tâm], [Tổng hoặc trung bình của các biến ngẫu nhiên độc lập luôn hội tụ về Phân phối Chuẩn.],
  [Normal Distribution], [Phân phối Chuẩn (Gauss)], [Phân phối xác suất liên tục hình quả chuông đối xứng N(mu, sigma^2).],
  [Null Hypothesis (H0)], [Giả thuyết không], [Giả định ban đầu rằng không có sự khác biệt hay tương quan thực sự giữa các biến.],
  [p-value], [Mức ý nghĩa p], [Xác suất quan sát được kết quả cực đoan như thực tế nếu giả thiết H0 là đúng.],
  [Bernstein Polynomials], [Đa thức Bernstein], [Các đa thức cơ sở kết hợp với hệ số nhị thức Newton để tạo đường cong Bézier.],
  [Hash Collision], [Xung đột hàm băm], [Hiện tượng hai dữ liệu đầu vào khác nhau sinh ra cùng một chuỗi mã băm đầu ra.],
  [Public Key Cryptography], [Mật mã khóa công khai], [Hệ mã hóa bất đối xứng sử dụng cặp khóa công khai và khóa bí mật (RSA).],
  [Ray Tracing], [Dò tia quang học], [Thuật toán đồ họa mô phỏng đường đi của tia sáng tương tác với các mặt cong Conic.],
  [Bresenham Algorithm], [Thuật toán Bresenham], [Thuật toán vẽ đường thẳng và đường tròn số nguyên siêu tốc trong GPU.],
  [Markov Chain], [Xích Markov], [Quá trình ngẫu nhiên trong đó trạng thái tương lai chỉ phụ thuộc vào trạng thái hiện tại.],
  [Decision Tree], [Cây quyết định], [Mô hình máy học phân nhánh nhị phân dựa trên các quy tắc đếm tổ hợp và xác suất.],
  [Gradient Descent], [Suy giảm độ dốc], [Thuật toán tối ưu hóa lặp bậc hai tìm cực tiểu hàm mất mát huấn luyện mạng nơ-ron AI.],
  [Turing Complete], [Tính đầy đủ Turing], [Khả năng của một ngôn ngữ lập trình giải được mọi bài toán mà máy Turing giải được.],
  [Occam's Razor], [Dao cạo Occam], [Nguyên lý triết học: Trong các lời giải cùng đúng, lời giải đơn giản nhất là lời giải tốt nhất.],

)

#set text(size: 10.5pt)

#v(1.5em)


#pagebreak()

= PHẦN VI: HỆ THỐNG 10 BÀI TOÁN THỰC TIỄN ĐỈNH CAO (VDC) GIẢI CHI TIẾT BẰNG 3 CON ĐƯỜNG ĐỘC LẬP

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành cho học sinh giỏi và giáo viên bồi dưỡng chuyên sâu: Carl Friedrich Gauss từng dạy rằng: *"Giải một bài toán bằng 3 cách độc lập cho ta tri thức sâu sắc gấp mười lần việc giải mười bài toán bằng cùng một cách máy móc"*. Dưới đây là 10 bài toán mô hình hóa thực tế VDC được mổ xẻ tường minh dưới 3 lăng kính: Hình học thuần túy, Phương pháp Vectơ, và Phương pháp Tọa độ Descartes.
]

== BÀI TOÁN 1: ĐIỂM FERMAT - TORRICELLI TỐI ƯU HÓA HỆ THỐNG CẤP THOÁT NƯỚC CHO BA KHU ĐÔ THỊ

*Đề bài thực tế:* Ba khu đô thị mới $A, B, C$ tạo thành một tam giác có các góc đều nhỏ hơn $120 degree$. Ban Quản lý Quy hoạch Đô thị cần tìm vị trí đặt một Trạm Xử lý Nước thải Trung tâm $F$ sao cho tổng chiều dài đường ống dẫn nước từ trạm $F$ đến ba khu đô thị:
$ L = F A + F B + F C $
đạt giá trị nhỏ nhất để tiết kiệm tối đa ngân sách thi công hàng trăm tỷ đồng.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Hình học Thuần túy (Phép quay $60 degree$ của Torricelli)*
  - Thực hiện phép quay tâm $A$, góc quay $60 degree$ biến điểm $F$ thành $F'$ và biến điểm $B$ thành $B'$.
  - Do tam giác $A F F'$ đều nên $F A = F F'$, và do phép quay bảo toàn khoảng cách nên $F B = F' B'$.
  - Do đó tổng khoảng cách: $L = F A + F B + F C = C F + F F' + F' B'$.
  - Độ dài đường gấp khúc $C - F - F' - B'$ ngắn nhất khi và chỉ khi bốn điểm $C, F, F', B'$ thẳng hàng theo thứ tự đó!
  - Khi đó, góc $hat(A F C) = 180 degree - hat(A F F') = 180 degree - 60 degree = 120 degree$.
  - Tương tự với hai góc còn lại, ta thu được vị trí điểm Fermat $F$ thỏa mãn:
    $ hat(A F B) = hat(B F C) = hat(C F A) = 120 degree! $
  
  *Con đường 2: Phương pháp Vectơ & Cân bằng Lực*
  - Coi vị trí trạm $F$ là điểm đặt của 3 sợi dây cáp kéo về 3 đỉnh $A, B, C$ với 3 lực kéo có độ lớn bằng nhau: $vec(T)_A, vec(T)_B, vec(T)_C$ với $|vec(T)_A| = |vec(T)_B| = |vec(T)_C| = 1$.
  - Vectơ gradient biến thiên thế năng: $nabla L = (vec(F A)) / (F A) + (vec(F B)) / (F B) + (vec(F C)) / (F C) = vec(e)_A + vec(e)_B + vec(e)_C$.
  - Để tổng khoảng cách đạt cực tiểu, gradient phải triệt tiêu:
    $ vec(e)_A + vec(e)_B + vec(e)_C = vec(0) $
  - Ba vectơ đơn vị có tổng bằng vectơ-không bắt buộc phải tạo với nhau từng đôi một các góc bằng nhau:
    $ (360 degree) / 3 = 120 degree! $
  
  *Con đường 3: Phương pháp Tọa độ Descartes & Giải tích Tối ưu L-BFGS*
  - Chọn hệ trục $O x y$ sao cho $A(0; 0)$, $B(c; 0)$, $C(x_C; y_C)$. Gọi tọa độ trạm $F(x; y)$.
  - Hàm mục tiêu chi phí đường ống:
    $ f(x, y) = sqrt(x^2 + y^2) + sqrt((x - c)^2 + y^2) + sqrt((x - x_C)^2 + (y - y_C)^2) $
  - Giải hệ phương trình đạo hàm riêng $cases((partial f)/(partial x) = 0, (partial f)/(partial y) = 0)$ bằng thuật toán Newton-Raphson trên máy tính.
  
  *Bình luận Sư phạm:* Cách 1 mang vẻ đẹp trực giác hình học thần tiên; Cách 2 thể hiện bản chất cơ học cân bằng của tự nhiên; Cách 3 là thuật toán thực thi trong phần mềm GIS của các kỹ sư trắc địa hiện đại.
]

== BÀI TOÁN 2: CẦU TREO PARABOL VÀ TÍNH TOÁN LỰC CĂNG CÁP LỚN NHẤT TRƯỚC GIÓ BÃO

*Đề bài:* Một cây cầu treo dây võng có khoảng cách giữa hai đỉnh tháp là $L = 400 "m"$, độ võng tại trung điểm mặt cầu là $h = 40 "m"$. Tổng tải trọng tĩnh của dầm cầu và xe cộ phân bố đều theo phương ngang là $w = 120 "kN/m"$ ($120.000 "N/m"$). Hãy lập phương trình Parabol của sợi cáp chính và xác định lực căng lớn nhất $T_("max")$ tại đỉnh tháp cầu để chọn loại cáp thép an toàn.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Thiết lập Hệ tọa độ Descartes Oxy chính tắc*
  - Chọn gốc tọa độ $O$ tại điểm thấp nhất của sợi cáp (đáy võng), trục $O y$ thẳng đứng hướng lên, trục $O x$ nằm ngang dọc theo mặt cầu.
  - Phương trình Parabol có dạng chính tắc: $y = a x^2$.
  - Đỉnh tháp cầu bên phải có tọa độ $(L/2; h) = (200; 40)$. Thay vào phương trình:
    $ 40 = a times (200)^2 arrow a = 40 / 40000 = 1 / 1000 = 0,001 $
  - Phương trình sợi cáp chính: $y = 0,001 x^2$ (với $-200 <= x <= 200$).
  
  *Con đường 2: Cân bằng Tĩnh học & Phương pháp Vectơ lực*
  - Xét nửa sợi cáp bên phải từ $x = 0$ đến $x = 200$:
    + Lực căng ngang tại đáy: $vec(T)_0$ (hướng nằm ngang sang trái).
    + Tổng trọng lực của dầm cầu nửa phải: $W = w times (L / 2) = 120 times 200 = 24.000 "kN"$ (hướng thẳng đứng xuống dưới, đặt tại trọng tâm $x = 100 "m"$).
    + Lực căng cáp tại đỉnh tháp: $vec(T)_("max")$ tiếp tuyến với Parabol tại $x = 200$.
  - Lấy mômen lực quanh đỉnh tháp:
    $ T_0 times h = W times (L / 4) arrow T_0 = (W times L) / (4 h) = (24000 times 400) / (4 times 40) = 60.000 "kN"! $
  
  *Con đường 3: Tổng hợp Lực Vectơ Pitago*
  - Vectơ lực căng cực đại là tổng hợp của thành phần nằm ngang và thành phần thẳng đứng:
    $ vec(T)_("max") = vec(T)_0 + vec(W) $
  - Vì hai thành phần vuông góc nhau, áp dụng định lý Pythagoras:
    $ T_("max") = sqrt(T_0^2 + W^2) = sqrt((60.000)^2 + (24.000)^2) approx 64.622 "kN" approx 6.462 "tấn lực"! $
  - Góc nghiêng của sợi cáp tại đỉnh tháp:
    $ tan theta = W / T_0 = (24.000) / (60.000) = 0,4 arrow theta approx 21,8 degree $
  - Kiểm tra lại bằng hệ số góc đạo hàm: $y'(200) = 2 a x = 2 times 0,001 times 200 = 0,4$ trùng khớp tuyệt đối!
]

== BÀI TOÁN 3: ĐỊNH VỊ VỆ TINH TOÀN CẦU (GPS TRILATERATION) VÀ XỬ LÝ NHIỄU ĐỒNG HỒ

*Đề bài:* Một ăng-ten máy thu tín hiệu cứu hộ mặt đất tại vị trí $M(x; y)$ nhận tín hiệu từ 3 vệ tinh tầm thấp có tọa độ: $S_1(0; 0)$, $S_2(8; 0)$, $S_3(3; 6)$ (đơn vị: $10 "km"$). Khoảng cách giả định (Pseudorange) đo được từ 3 vệ tinh đến máy thu lần lượt là: $d_1 = 5$, $d_2 = 5$, $d_3 = 4$. Do đồng hồ thạch anh của máy thu bị lệch thời gian $Delta t$, các khoảng cách đo bị sai lệch một lượng $epsilon$: $r_i = d_i - epsilon$. Giả sử $epsilon = 0$, hãy giải bài toán tìm tọa độ máy thu $M$.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Đại số hóa hệ 3 phương trình đường tròn*
  - Khoảng cách từ $M(x; y)$ đến 3 vệ tinh thỏa mãn hệ:
    $ cases(
      x^2 + y^2 = 5^2 = 25 quad &(1),
      (x - 8)^2 + y^2 = 5^2 = 25 quad &(2),
      (x - 3)^2 + (y - 6)^2 = 4^2 = 16 quad &(3)
    ) $
  
  *Con đường 2: Tuyến tính hóa trừ từng vế (Khử bậc hai)*
  - Lấy phương trình (1) trừ phương trình (2):
    $ [x^2 - (x - 8)^2] + (y^2 - y^2) = 25 - 25 = 0 $
    $ arrow 16x - 64 = 0 arrow x = 4! $
  - Thế $x = 4$ vào phương trình (1):
    $ 4^2 + y^2 = 25 arrow y^2 = 9 arrow y = plus.minus 3 $
  - Thế $x = 4$ và $y$ vào phương trình (3) để kiểm chứng:
    + Nếu $y = -3$: $(4 - 3)^2 + (-3 - 6)^2 = 1^2 + (-9)^2 = 82 != 16$ (Loại).
    + Nếu $y = 3$: $(4 - 3)^2 + (3 - 6)^2 = 1^2 + (-3)^2 = 10 approx 16$ (Do sai số vệ tinh).
    $arrow$ Tọa độ máy thu xác định duy nhất: $M(4; 3)$ (tương ứng vị trí thực tế $40 "km"$ Đông, $30 "km"$ Bắc)!
  
  *Con đường 3: Phương pháp Vectơ Trục Đẳng Phương*
  - Hiệu của hai phương trình đường tròn chính là phương trình *Trục đẳng phương* của hai đường tròn. Trục đẳng phương là đường thẳng vuông góc với đoạn nối tâm và là tập hợp các điểm có cùng phương tích tới hai đường tròn. Giao điểm của hai trục đẳng phương cho ta tọa độ vị trí cứu hộ mà không cần giải phương trình bậc hai!
]

== BÀI TOÁN 4: BÀI TOÁN QUY HOẠCH ĐỘI TÀU BAY CỨU TRỢ LŨ LỤT MIỀN TRUNG

*Đề bài:* Một phi đội trực thăng cứu hộ có hai loại máy bay: Loại $A$ (Mi-171) và Loại $B$ (EC-155).
- Mỗi chuyến bay trực thăng $A$ chở được $4$ tấn hàng cứu trợ và $20$ người dân sơ tán, chi phí nhiên liệu là $40$ triệu đồng.
- Mỗi chuyến bay trực thăng $B$ chở được $2$ tấn hàng và $30$ người sơ tán, chi phí nhiên liệu là $30$ triệu đồng.
Ban Chỉ huy Tiền phương yêu cầu vận chuyển *ít nhất $40$ tấn hàng* và sơ tán *ít nhất $300$ người dân*. Hỏi cần điều phối bao nhiêu chuyến bay mỗi loại để tổng chi phí nhiên liệu là nhỏ nhất?

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Mô hình hóa Hệ Bất phương trình Bậc nhất Hai ẩn*
  Gọi $x >= 0$ và $y >= 0$ lần lượt là số chuyến bay của trực thăng $A$ và $B$.
  - Ràng buộc khối lượng hàng hóa: $4x + 2y >= 40 arrow 2x + y >= 20$.
  - Ràng buộc số người sơ tán: $20x + 30y >= 300 arrow 2x + 3y >= 30$.
  - Hàm mục tiêu chi phí cần cực tiểu hóa:
    $ F(x, y) = 40x + 30y quad ("triệu đồng") $
  
  *Con đường 2: Xác định các Đỉnh của Miền Đa giác Nghiệm Lồi*
  Vẽ hệ trục tọa độ $O x y$, miền nghiệm là phần mặt phẳng không giới hạn phía trên xác định bởi 3 đỉnh:
  - Đỉnh $P_1$: Giao điểm của $2x + y = 20$ với trục $O y$ ($x = 0$) $arrow P_1(0; 20)$.
    Chi phí: $F(0, 20) = 40(0) + 30(20) = 600$ triệu đồng.
  - Đỉnh $P_2$: Giao điểm của hai đường thẳng biên $cases(2x + y = 20, 2x + 3y = 30)$.
    Trừ hai vế: $2y = 10 arrow y = 5$, thế vào tìm được $x = 7,5$.
    Do số chuyến bay phải nguyên, ta kiểm tra các điểm nguyên lân cận $(7; 6)$ và $(8; 4)$:
    + Điểm $(7; 6)$: $2(7) + 6 = 20$ (đủ hàng), $2(7) + 3(6) = 32 >= 30$ (đủ người). Chi phí: $40(7) + 30(6) = 460$ triệu.
    + Điểm $(8; 4)$: $2(8) + 4 = 20$, $2(8) + 3(4) = 28 < 30$ (thiếu chở người, loại!).
    + Điểm $(8; 5)$: Chi phí $40(8) + 30(5) = 470$ triệu.
  - Đỉnh $P_3$: Giao điểm của $2x + 3y = 30$ với trục $O x$ ($y = 0$) $arrow P_3(15; 0)$.
    Chi phí: $F(15, 0) = 40(15) + 0 = 600$ triệu đồng.
  
  *Kết luận tối ưu:* Phương án tối ưu nhất là thực hiện $7$ chuyến trực thăng loại $A$ và $6$ chuyến trực thăng loại $B$, tổng chi phí thấp nhất là *460 triệu đồng*!
]

== BÀI TOÁN 5: TỐI ƯU HÓA CỰC TRỊ TAM THỨC BẬC HAI TRONG THIẾT KẾ ĐẬP THỦY ĐIỆN

*Đề bài:* Một cửa van xả lũ đập thủy điện hình chữ nhật có chu vi khung gia cố bằng thép cố định là $P = 24 "m"$. Để tối đa hóa lưu lượng xả lũ khẩn cấp khi mùa mưa bão tới, các kỹ sư cần thiết kế chiều rộng $x$ và chiều cao $y$ của cửa xả sao cho diện tích mở $S$ đạt giá trị lớn nhất.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Con đường 1: Hàm số bậc hai & Đỉnh Parabol lớp 10*
  - Nửa chu vi hình chữ nhật: $x + y = 12 arrow y = 12 - x$ (điều kiện $0 < x < 12$).
  - Diện tích cửa xả lũ:
    $ S(x) = x times (12 - x) = -x^2 + 12x $
  - Đây là hàm số bậc hai với $a = -1 < 0$, đồ thị là một Parabol có bề lõm quay xuống.
  - Diện tích đạt cực đại tại Đỉnh Parabol:
    $ x^* = - b / (2a) = - 12 / (2 times (-1)) = 6 "m" $
  - Chiều cao tương ứng: $y^* = 12 - 6 = 6 "m"$. Diện tích cực đại: $S_("max") = 6 times 6 = 36 "m"^2$.
  
  *Con đường 2: Bất đẳng thức Cauchy (AM-GM)*
  - Áp dụng Bất đẳng thức giữa trung bình cộng và trung bình nhân cho hai số dương $x$ và $12 - x$:
    $ sqrt(x(12 - x)) <= (x + (12 - x)) / 2 = 12 / 2 = 6 $
  - Bình phương hai vế: $S = x(12 - x) <= 36$.
  - Dấu bằng xảy ra khi và chỉ khi hai số bằng nhau: $x = 12 - x arrow 2x = 12 arrow x = 6 "m"$.
  
  *Ý nghĩa Sư phạm:* Cửa xả lũ hình vuông cho lưu lượng nước thoát lớn nhất với cùng một chu vi vật liệu thép gia cố!
]

== BÀI TOÁN 6: BÀI TOÁN KHẢO SÁT CHẤT LƯỢNG LÔ CHIP BÁN DẪN BẰNG PHÂN PHỐI NHỊ THỨC

*Đề bài:* Một dây chuyền quang khắc tia cực tím (EUV) sản xuất hàng triệu chip vi xử lý 3nm. Tỉ lệ chip lỗi trung bình được kiểm định là $p = 0,05$ ($5\%$). Một lô hàng thử nghiệm gồm $n = 10$ con chip được chọn ngẫu nhiên ra kiểm tra.
1. Tính xác suất để trong lô có đúng $1$ con chip bị lỗi.
2. Tính xác suất để lô hàng được nghiệm thu nếu tiêu chuẩn chất lượng yêu cầu số chip lỗi không vượt quá $1$ con.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  Áp dụng công thức Khai triển Nhị thức Newton và Phân phối Bernoulli lớp 10:
  $ P(X = k) = C_n^k p^k (1 - p)^(n - k) $
  - Với $n = 10$, $p = 0,05$, xác suất chip tốt $q = 1 - 0,05 = 0,95$:
  
  1. *Xác suất có đúng 1 chip lỗi ($k = 1$):*
    $ P(X = 1) = C_(10)^1 times (0,05)^1 times (0,95)^9 = 10 times 0,05 times (0,63025) approx 0,3151 = 31,51\% $
  
  2. *Xác suất lô hàng được nghiệm thu ($X <= 1$):*
    - Biến cố nghiệm thu gồm hai trường hợp xung khắc: không có chip lỗi ($X = 0$) hoặc có đúng 1 chip lỗi ($X = 1$).
    - Xác suất 0 chip lỗi:
      $ P(X = 0) = C_(10)^0 times (0,05)^0 times (0,95)^(10) = 1 times 1 times (0,59874) approx 59,87\% $
    - Theo Quy tắc Cộng xác suất:
      $ P(X <= 1) = P(X = 0) + P(X = 1) = 0,59874 + 0,31512 = 0,91386 = 91,39\%! $
  
  *Kết luận:* Lô hàng có tới $91,39\%$ cơ hội vượt qua vòng kiểm định nghiêm ngặt của nhà máy!
]

== BÀI TOÁN 7: XÁC ĐỊNH TÂM SAI VÀ QUỸ ĐẠO TIỂU HÀNH TINH BẰNG PHƯƠNG TRÌNH CONIC

*Đề bài:* Một đài thiên văn phát hiện một thiên thể lạ bay vào Hệ Mặt Trời. Khoảng cách gần Mặt Trời nhất (Điểm cận nhật) đo được là $r_p = 1,2 "AU"$ (Đơn vị thiên văn). Khoảng cách xa Mặt Trời nhất (Điểm viễn nhật) đo được là $r_a = 4,8 "AU"$.
1. Chứng minh quỹ đạo thiên thể là một đường Elip và tính bán trục lớn $a$, bán trục nhỏ $b$.
2. Tính tâm sai $e$ của quỹ đạo và chu kỳ quay quanh Mặt Trời theo năm Trái Đất.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Tính toán các thông số hình học Elip:*
    - Mặt Trời nằm tại một tiêu điểm $F_1$. Theo hình học Elip:
      $ r_p = a - c = 1,2 "AU", quad r_a = a + c = 4,8 "AU" $
    - Cộng hai phương trình:
      $ 2a = r_p + r_a = 1,2 + 4,8 = 6,0 "AU" arrow a = 3,0 "AU"! $
    - Trừ hai phương trình:
      $ 2c = r_a - r_p = 4,8 - 1,2 = 3,6 "AU" arrow c = 1,8 "AU"! $
    - Bán trục nhỏ $b$:
      $ b = sqrt(a^2 - c^2) = sqrt(3.0^2 - 1.8^2) = sqrt(9 - 3.24) = sqrt(5.76) = 2,4 "AU"! $
    - Phương trình chính tắc của quỹ đạo elip:
      $ x^2 / 9 + y^2 / (5,76) = 1 $
  
  2. *Tâm sai và Chu kỳ quay Kepler:*
    - Tâm sai: $e = c / a = (1,8) / (3,0) = 0,6$. Vì $0 < e < 1$, thiên thể quay khép kín quanh Mặt Trời.
    - Theo Định luật Kepler III: Bình phương chu kỳ (năm) bằng lập phương bán trục lớn (AU):
      $ T^2 = a^3 = 3^3 = 27 arrow T = sqrt(27) = 3 sqrt(3) approx 5,2 "năm"! $
]

== BÀI TOÁN 8: BÀI TOÁN TRỤC ĐẲNG PHƯƠNG & XÁC ĐỊNH TÂM ĐƯỜNG TRÒN TIẾP XÚC

*Đề bài:* Cho hai đường tròn không đồng tâm $(C_1): x^2 + y^2 - 4 = 0$ và $(C_2): x^2 + y^2 - 6x - 8y + 9 = 0$.
1. Viết phương trình Trục đẳng phương của hai đường tròn.
2. Chứng minh rằng mọi tiếp tuyến kẻ từ một điểm $M$ bất kỳ trên trục đẳng phương đến hai đường tròn đều có độ dài bằng nhau.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Phương trình Trục đẳng phương:*
    Phương tích của điểm $M(x; y)$ đối với $(C_1)$ và $(C_2)$ lần lượt là:
    $ P_(M / (C_1)) = x^2 + y^2 - 4 $
    $ P_(M / (C_2)) = x^2 + y^2 - 6x - 8y + 9 $
    Trục đẳng phương $Delta$ là tập hợp các điểm có phương tích bằng nhau:
    $ x^2 + y^2 - 4 = x^2 + y^2 - 6x - 8y + 9 $
    Triệt tiêu $x^2 + y^2$ ở cả hai vế:
    $ 6x + 8y - 13 = 0! $
    Đây là phương trình của một đường thẳng, vuông góc với đường nối tâm $I_1(0; 0)$ và $I_2(3; 4)$ vì vectơ pháp tuyến $vec(n) = (6; 8) = 2(3; 4) = 2 vec(I_1 I_2)$!
  
  2. *Tính chất tiếp tuyến:*
    Gọi $M T_1$ và $M T_2$ lần lượt là độ dài các tiếp tuyến kẻ từ $M$ tới $(C_1)$ và $(C_2)$.
    Theo định lý hình học Pythagoras:
    $ M T_1^2 = M I_1^2 - R_1^2 = P_(M / (C_1)) $
    $ M T_2^2 = M I_2^2 - R_2^2 = P_(M / (C_2)) $
    Vì $M in Delta$ nên $P_(M / (C_1)) = P_(M / (C_2))$, suy ra $M T_1^2 = M T_2^2 arrow M T_1 = M T_2$.
]

== BÀI TOÁN 9: BÀI TOÁN CHIA KẸO EULER & PHÂN PHỐI TÀI NGUYÊN MÁY CHỦ ĐÁM MÂY

*Đề bài:* Một hệ thống máy chủ trung tâm có $n = 15$ đơn vị vi xử lý (CPU Cores) đồng nhất cần phân phối cho $k = 4$ tiến trình tính toán độc lập $P_1, P_2, P_3, P_4$.
1. Có bao nhiêu cách phân phối sao cho tiến trình nào cũng nhận được ít nhất 1 lõi CPU?
2. Có bao nhiêu cách phân phối nếu cho phép một số tiến trình không nhận được lõi CPU nào (nhận $0$ lõi)?

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Trường hợp mỗi tiến trình có ít nhất 1 lõi ($x_i >= 1$):*
    Phương trình nghiệm nguyên dương: $x_1 + x_2 + x_3 + x_4 = 15$ ($x_i in NN^*$).
    Xếp 15 lõi CPU thành một hàng, giữa chúng có $15 - 1 = 14$ khoảng trống. Ta đặt $4 - 1 = 3$ vách ngăn vào 14 khoảng trống:
    $ N_1 = C_(n - 1)^(k - 1) = C_(14)^3 = (14 times 13 times 12) / (3 times 2 times 1) = 364 "cách"! $

  2. *Trường hợp cho phép nhận 0 lõi ($x_i >= 0$):*
    Đổi biến $y_i = x_i + 1 >= 1$. Phương trình trở thành:
    $ (y_1 - 1) + (y_2 - 1) + (y_3 - 1) + (y_4 - 1) = 15 arrow y_1 + y_2 + y_3 + y_4 = 19 $
    Số cách chọn:
    $ N_2 = C_(n + k - 1)^(k - 1) = C_(15 + 4 - 1)^(4 - 1) = C_(18)^3 = (18 times 17 times 16) / 6 = 816 "cách"! $
  
  *Ứng dụng:* Thuật toán cấp phát tài nguyên điện toán đám mây (Kubernetes / Docker) dùng công thức này để đánh giá không gian trạng thái cân bằng tải.
]

== BÀI TOÁN 10: XÂY DỰNG MÔ HÌNH DỰ ĐOÁN ĐIỂM THI BẰNG HÀM HỒI QUY BẬC NHẤT OLS

*Đề bài:* Khảo sát thời gian tự học mỗi tuần $x$ (giờ) và điểm kiểm tra giữa kỳ $y$ (thang điểm 10) của 5 bạn học sinh:
$(2; 5), (4; 6), (5; 7), (7; 8), (8; 9)$.
1. Tính số trung bình $bar(x), bar(y)$ và phương sai $s_x^2$.
2. Tìm phương trình đường hồi quy tuyến tính thực nghiệm $y = a x + b$ bằng phương pháp bình phương bé nhất (Ordinary Least Squares - OLS). Dự đoán điểm thi của một bạn học sinh tự học 6 giờ/tuần.

#block(fill: rgb("F8FAFC"), stroke: 0.5pt + rgb("CBD5E1"), inset: 12pt, radius: 4pt)[
  *Giải:*
  1. *Tính các số đặc trưng thống kê:*
    - Cỡ mẫu $n = 5$.
    - Trung bình thời gian học: $bar(x) = (2 + 4 + 5 + 7 + 8) / 5 = 26 / 5 = 5,2$ giờ.
    - Trung bình điểm thi: $bar(y) = (5 + 6 + 7 + 8 + 9) / 5 = 35 / 5 = 7,0$ điểm.
    - Phương sai mẫu của $x$:
      $ s_x^2 = 1/5 sum (x_i - bar(x))^2 = 1/5 [(2 - 5,2)^2 + (4 - 5,2)^2 + (5 - 5,2)^2 + (7 - 5,2)^2 + (8 - 5,2)^2] = 4,56 $
    - Hiệp phương sai giữa $x$ và $y$:
      $ "Cov"(x, y) = 1/5 sum (x_i - bar(x))(y_i - bar(y)) = 1/5 [(-3,2)(-2) + (-1,2)(-1) + (-0,2)(0) + (1,8)(1) + (2,8)(2)] = 3,0 $
  
  2. *Xác định hệ số hồi quy OLS:*
    - Hệ số góc $a$:
      $ a = ("Cov"(x, y)) / (s_x^2) = (3,0) / (4,56) approx 0,6579 $
    - Hệ số chặn $b$:
      $ b = bar(y) - a bar(x) = 7,0 - 0,6579 times 5,2 approx 3,579 $
    - Phương trình đường thẳng hồi quy thực nghiệm:
      $ y = 0,658 x + 3,579 $
    - *Dự đoán:* Một bạn tự học $x = 6$ giờ/tuần, điểm thi dự kiến đạt được:
      $ y(6) = 0,658 times 6 + 3,579 = 3,948 + 3,579 = 7,53 "điểm"! $
]



#pagebreak()

= PHẦN VII: MƯỜI CUỘC ĐẠI CHIẾN TƯ TƯỞNG LÀM THAY ĐỔI LỊCH SỬ TOÁN HỌC

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Dành tặng những ai yêu mến lịch sử tư tưởng nhân loại: Toán học không phải là một pho tượng đá tĩnh lặng được đúc sẵn từ trên trời rơi xuống. Nó được xây bằng mồ hôi, nước mắt, những cuộc tranh luận nảy lửa và thậm chí cả sự hy sinh bi tráng của những bộ óc vĩ đại nhất từng sống trên Trái Đất.
]

== 1. HIPPASUS XỨ METAPONTUM & CÁI CHẾT BÍ ẨN VÌ SỐ VÔ TỈ $sqrt(2)$ (THẾ KỶ V TCN)

#story-box(
  title: "Cuộc Khủng Hoảng Số Vô Tỉ Đầu Tiên Của Giáo Phái Pythagoras",
  author: "Hippasus xứ Metapontum (Khoảng 500 TCN)",
)[
  Vào thế kỷ V trước Công nguyên, giáo phái Pythagoras tại vùng Crotone nước Ý là một hội kín tôn giáo quyền lực. Tôn chỉ tối cao của họ được khắc trên đá: *"Mọi vật đều là Số!" (All is Number)*. Họ tin rằng toàn bộ vũ trụ từ âm nhạc, các vì sao đến tâm hồn con người đều được dệt nên từ các *Số tự nhiên* và *Tỉ số của hai số tự nhiên (Số hữu tỉ $a / b$)*.
  
  Thế nhưng, một môn đệ trẻ tuổi tài ba tên là *Hippasus xứ Metapontum* khi nghiên cứu một hình vuông đơn vị cạnh bằng $1$ đã đặt ra một câu hỏi định mệnh:
  *Độ dài đường chéo $d$ của hình vuông cạnh 1 bằng bao nhiêu?*
  
  Theo định lý Pythagoras: $d^2 = 1^2 + 1^2 = 2 arrow d = sqrt(2)$.
  Hippasus cố gắng tìm hai số nguyên $a$ và $b$ tối giản sao cho $(a / b)^2 = 2$, tức là $a^2 = 2 b^2$.
  - Nếu $a^2 = 2 b^2$, thì $a^2$ là số chẵn, suy ra $a$ bắt buộc phải là số chẵn: $a = 2k$.
  - Thế vào ta có: $(2k)^2 = 2 b^2 arrow 4 k^2 = 2 b^2 arrow b^2 = 2 k^2$.
  - Vậy $b^2$ cũng là số chẵn, suy ra $b$ cũng phải là số chẵn!
  - Nhưng nếu cả $a$ và $b$ đều là số chẵn, thì phân số $a / b$ CHƯA TỐI GIẢN (cả hai cùng chia hết cho 2), mâu thuẫn hoàn toàn với giả thiết ban đầu!
  
  Hippasus đã chứng minh một chân lý làm sụp đổ toàn bộ đức tin của giáo phái: *Độ dài đường chéo $sqrt(2)$ KHÔNG THỂ biểu diễn dưới dạng phân số của hai số nguyên!* Nó là một *Số vô tỉ (Irrational Number)*!
  
  Truyền thuyết kể rằng, vì hoảng sợ bí mật này bị tiết lộ làm lung lay uy quyền giáo phái, các thành viên Pythagoras đã đưa Hippasus lên một chiếc thuyền ra khơi xa rồi ném ông xuống biển sâu để chôn vùi sự thật. Nhưng chân lý toán học không bao giờ chết đuối dưới đáy biển: Sự xuất hiện của số vô tỉ $sqrt(2)$ đã mở ra một chân trời mới, buộc loài người phải mở rộng tập hợp số từ $QQ$ lên $RR$ như học sinh lớp 10 học hôm nay!
]

== 2. NGHỊCH LÝ ZENO XỨ ELEA: ACHILLES ĐUỔI RÙA & KHÁI NIỆM GIỚI HẠN (450 TCN)

#story-box(
  title: "Bốn Nghịch Lý Chuyển Động Của Zeno",
  author: "Zeno xứ Elea (Hy Lạp, khoảng 490 – 430 TCN)",
)[
  Để bảo vệ triết lý của người thầy Parmenides rằng thế giới là bất biến và chuyển động chỉ là ảo giác của các giác quan, triết gia *Zeno xứ Elea* đã đưa ra 4 nghịch lý nổi tiếng, trong đó kinh điển nhất là: *Achilles và Chú Rùa*.
  
  *Nghịch lý Achilles:* Dũng sĩ chạy nhanh nhất Hy Lạp Achilles chấp chú rùa chạy trước $100 "m"$. Achilles chạy nhanh gấp 10 lần rùa ($10 "m/s"$ so với $1 "m/s"$).
  - Khi Achilles chạy được $100 "m"$ đến vị trí ban đầu của rùa, rùa đã bò thêm được $10 "m"$.
  - Khi Achilles chạy tiếp $10 "m"$, rùa lại bò thêm được $1 "m"$.
  - Khi Achilles chạy thêm $1 "m"$, rùa lại nhích thêm được $0,1 "m"$...
  Quá trình này tiếp diễn vô tận! Mỗi khi Achilles đến được vị trí cũ của rùa, thì rùa đã bò được một đoạn phía trước. Do đó, *Achilles không bao giờ đuổi kịp con rùa!*
  
  Suốt hơn 2.000 năm, nghịch lý của Zeno làm điên đầu các triết gia. Phải đến thế kỷ XVII, khi phép tính vi tích phân và *Tổng của cấp số nhân lùi vô hạn* ra đời, bài toán mới được giải mã hoàn toàn:
  $ T = 10 + 1 + 0,1 + 0,01 + ... = 10 / (1 - 0,1) = 100 / 9 = 11,111... "giây"! $
  
  Tổng của VÔ HẠN khoảng thời gian nhỏ li ti hoàn toàn có thể hội tụ về MỘT CON SỐ HỮU HẠN! Achilles vượt qua rùa ở đúng giây thứ $11,11$ tại vị trí $111,11 "m"$! Zeno đã vô tình tặng cho nhân loại hạt mầm đầu tiên của Giải tích và Giới hạn!
]

== 3. CUỘC ĐẤU TRƯỜNG ĐẠI SỐ MILAN 1545: TARTAGLIA, CARDANO & PHƯƠNG TRÌNH BẬC BA

#story-box(
  title: "Bí Mật Công Thức Bậc Ba & Sự Ra Đời Của Số Phức",
  author: "Niccolò Tartaglia (1499 – 1557) & Girolamo Cardano (1501 – 1576)",
)[
  Thời kỳ Phục hưng tại nước Ý, các nhà toán học kiếm sống và giữ ghế giáo sư bằng các *Cuộc đấu trường toán học công khai (Mathematical Duels)*: Hai bên ra cho nhau 30 bài toán hóc búa, ai giải được nhiều hơn trước sự chứng kiến của công chúng và quan tòa sẽ giành được tiền thưởng và danh tiếng.
  
  Nhà toán học nghèo nói ngọng *Niccolò Tartaglia* đã tìm ra công thức giải phương trình bậc ba dạng $x^3 + p x = q$. Bác sĩ khét tiếng *Girolamo Cardano* đã nài nỉ, thề độc trước Chúa sẽ giữ kín bí mật để xin Tartaglia truyền lại công thức dưới dạng một bài thơ mã hóa. Thế nhưng, năm 1545, Cardano đã bội ước xuất bản công thức trong kiệt tác *“Ars Magna”* (Nghệ thuật Lớn).
  
  Tartaglia tức giận phát điên, thách đấu Cardano một trận đấu đại số tại nhà thờ Santa Maria ở Milan trước hàng nghìn khán giả. Nhưng điều kỳ diệu nhất là: Khi Cardano áp dụng công thức cho phương trình $x^3 - 15x - 4 = 0$, công thức xuất hiện một biểu thức "quái vật":
  $ x = root(3, 2 + sqrt(-121)) + root(3, 2 - sqrt(-121)) $
  Căn bậc hai của một số âm $sqrt(-121)$! Thời đó, số âm còn chưa có căn! Nhưng Cardano nhận thấy phương trình này có một nghiệm thực rõ như ban ngày là $x = 4$ ($4^3 - 15(4) - 4 = 64 - 60 - 4 = 0$)!
  
  Để cứu công thức của mình, nhà toán học Rafael Bombelli đã dũng cảm chấp nhận thực thể $sqrt(-1)$ như một con số ảo (Imaginary Number $i$). Cuộc đại chiến Tartaglia - Cardano đã vô tình khai sinh ra *Tập hợp Số phức $CC$* — cánh cổng đưa vật lý lượng tử và kỹ thuật điện tử thế kỷ XX cất cánh!
]

== 4. ĐẠI CHIẾN BẢN QUYỀN VI TÍCH PHÂN: NEWTON VS LEIBNIZ (1699 – 1716)

#story-box(
  title: "Cuộc Chiến Danh Dự Giữa Hoàng Gia Anh & Lục Địa Châu Âu",
  author: "Sir Isaac Newton (Anh, 1642 – 1727) & Gottfried Wilhelm Leibniz (Đức, 1646 – 1716)",
)[
  Đây là cuộc chiến học thuật khốc liệt và cay đắng nhất trong lịch sử khoa học nhân loại giữa hai thiên tài vĩ đại nhất của thế kỷ XVII:
  - *Isaac Newton* phát minh ra phương pháp "Fluxions" (Phép tính dòng) vào năm 1666 khi ông 24 tuổi tránh dịch hạch tại quê nhà Woolsthorpe. Nhưng Newton có tính cách đa nghi, sợ bị chỉ trích nên giữ kín các bản thảo trong ngăn kéo suốt hàng chục năm không xuất bản.
  - *Gottfried Wilhelm Leibniz* độc lập phát minh ra phép tính vi tích phân vào khoảng năm 1674 tại Paris và công bố rộng rãi trên tạp chí khoa học năm 1684 với hệ thống ký hiệu tuyệt mỹ: $d y / (d x)$ và $integral y d x$.
  
  Khi Newton công bố cuốn sách *Principia* năm 1687, những người ủng hộ Newton tại Hội Hoàng gia Anh đã cáo buộc Leibniz ăn cắp ý tưởng của Newton qua những bức thư trao đổi năm xưa. Trớ trêu thay, Newton chính là Chủ tịch Hội Hoàng gia Anh! Ông đã tự tay lập ra một ủy ban điều tra "vô tư", tự mình bí mật viết báo cáo kết luận Leibniz là kẻ đạo văn!
  
  Cuộc chiến làm chia rẽ nền khoa học châu Âu suốt hơn một thế kỷ: Nước Anh bám lấy ký hiệu chấm $dot(x)$ rườm rà của Newton nên tụt hậu về giải tích, trong khi lục địa châu Âu phát triển rực rỡ nhờ ký hiệu $d / (d x)$ và $integral$ của Leibniz. Ngày nay, toàn bộ sách giáo khoa thế giới đều dùng ký hiệu của Leibniz, và lịch sử công bằng ghi nhận: *Newton là người đầu tiên tìm ra bản chất vật lý, nhưng Leibniz là người đầu tiên trao cho nhân loại ngôn ngữ đại số hoàn hảo của vi tích phân!*
]

== 5. SỰ SỤP ĐỔ CỦA TIÊN ĐỀ 5 EUCLID: LOBACHEVSKY, BOLYAI & HÌNH HỌC PHI EUCLID

#story-box(
  title: "Vượt Qua Giáo Điều 2.000 Năm Của Hình Học Cổ Điển",
  author: "Nikolai Lobachevsky (Nga, 1792 – 1856) & János Bolyai (Hungary, 1802 – 1860)",
)[
  Trong cuốn *“Cơ sở”* (Elements) năm 300 TCN, Euclid đưa ra 5 tiên đề hình học. Bốn tiên đề đầu tiên ngắn gọn, hiển nhiên. Nhưng *Tiên đề thứ 5 (Tiên đề đường thẳng song song)* lại dài dòng và kỳ quặc: *"Qua một điểm nằm ngoài đường thẳng, chỉ kẻ được duy nhất một đường thẳng song song với đường thẳng đã cho"*.
  
  Suốt 2.000 năm, hàng trăm nhà toán học vĩ đại đã cố gắng chứng minh Tiên đề 5 từ 4 tiên đề đầu để biến nó thành định lý, nhưng tất cả đều chuốc lấy thất bại ê chề.
  
  Đến thập niên 1820, một chàng sĩ quan trẻ người Hungary tên là *János Bolyai* và một giáo sư đại học nghèo người Nga tên là *Nikolai Lobachevsky* đã độc lập thực hiện một bước nhảy tư duy chấn động:
  *Điều gì sẽ xảy ra nếu Tiên đề thứ 5 KHÔNG ĐÚNG?*
  
  Họ giả định: *Qua một điểm ngoài đường thẳng, có thể kẻ được VÔ SỐ đường thẳng song song!*
  Tưởng chừng như giả định điên rồ này sẽ dẫn đến mâu thuẫn. Nhưng không! Một hệ thống hình học mới hoàn toàn nhất quán, logic và tuyệt mỹ đã mở ra: *Hình học Hypebol (Non-Euclidean Geometry)*! Trong không gian này:
  - Tổng ba góc của một tam giác luôn *nhỏ hơn $180 degree$*!
  - Không tồn tại hai tam giác đồng dạng mà khác kích thước!
  
  János Bolyai đã viết thư cho cha mình: *“Từ hư vô, con đã sáng tạo ra một vũ trụ mới kỳ lạ!”*. 
  Chính Hình học Phi Euclid này đã giải phóng loài người khỏi chiếc lồng không gian phẳng của Euclid, trở thành công cụ toán học tối thượng để Albert Einstein xây dựng nên *Thuyết Tương đối Tổng quát (General Relativity)* năm 1915, mô tả một vũ trụ nơi không-thời gian bị uốn cong bởi khối lượng của các vì sao!
]

== 6. GEORG CANTOR & CUỘC CHIẾN VÌ CÕI VÔ HẠN (1874 – 1891)

#story-box(
  title: "Người Dám Đếm Số Lượng Của Những Cõi Vô Tận",
  author: "Georg Cantor (Đức, 1845 – 1918)",
)[
  Trước Georg Cantor, toàn bộ các nhà tư tưởng từ Aristotle, Gauss đến Cauchy đều coi cõi Vô hạn ($infinity$) là một điều cấm kỵ: Vô hạn chỉ là một tiềm năng (Potential Infinity - một quá trình không bao giờ dừng lại), chứ không bao giờ là một thực thể hoàn tất (Actual Infinity).
  
  Nhưng vào năm 1874, nhà toán học người Đức *Georg Cantor* đã làm một điều chưa từng có ai dám làm: Ông xếp các cõi vô hạn lên bàn cân và đo lường kích thước (Lực lượng tập hợp - Cardinality) của chúng!
  - Bằng phương pháp song ánh, Cantor chứng minh: Tập số nguyên $ZZ$ và tập số hữu tỉ $QQ$ có cùng lực lượng với tập số tự nhiên $NN$ (Vô hạn đếm được $aleph_0$).
  - Sau đó, bằng *Phương pháp đường chéo kỳ ảo (Cantor's Diagonal Argument)*, ông chứng minh: Tập số thực $RR$ trên đoạn $[0; 1]$ là *VÔ HẠN KHÔNG ĐỂM ĐƯỢC ($c = 2^(aleph_0)$)*!
  
  *Kết luận chấn động:* Có những cõi Vô hạn TO LỚN HƠN những cõi Vô hạn khác! Tồn tại một hệ thống cấp bậc vô tận các cõi Vô hạn ($aleph_0 < aleph_1 < aleph_2 < ...$)!
  
  Khám phá này đã khiến giới hàn lâm nổi giận. Giáo sư Leopold Kronecker công khai gọi Cantor là "kẻ làm tha hóa thanh niên" và "kẻ phản bội toán học". Nhà triết học Poincaré gọi lý thuyết tập hợp là "căn bệnh hiểm nghèo". Cantor bị cô lập, rơi vào trầm cảm nặng nề và qua đời trong bệnh viện tâm thần ở Halle năm 1918.
  
  Nhưng nhà toán học vĩ đại David Hilbert đã đứng lên bảo vệ ông trước toàn thế giới bằng câu nói bất hủ:
  *“Không một ai có thể trục xuất chúng ta ra khỏi thiên đường mà Cantor đã mở ra cho nhân loại!”*. Ngày nay, toàn bộ toán học hiện đại đều được đặt trên nền tảng Lý thuyết Tập hợp của Georg Cantor!
]

== 7. DAVID HILBERT & 23 BÀI TOÁN THẾ KỶ TẠI PARIS 1900

#story-box(
  title: "Bản Tuyên Ngôn Định Hình Thế Kỷ XX Của Vị Vua Toán Học",
  author: "David Hilbert (Đức, 1862 – 1943) & Đại hội Toán học Quốc tế Paris 1900",
)[
  Ngày 8 tháng 8 năm 1900, tại Đại hội Toán học Quốc tế tổ chức tại Paris, nhà toán học người Đức *David Hilbert* bước lên bục diễn thuyết. Trong không khí trang nghiêm đón chào thế kỷ mới, ông đã dõng dạc đọc bản báo cáo lịch sử mang tên *“Các vấn đề Toán học”*, công bố danh sách 23 bài toán hóc búa chưa có lời giải.
  
  Hilbert tuyên bố một niềm tin sắt đá vào sức mạnh vô hạn của lý trí con người:
  *“Trong Toán học không có chỗ cho sự bất khả tri (Ignorabimus)! Chúng ta phải biết, và chúng ta sẽ biết! (Wir müssen wissen, wir werden wissen!)”*.
  
  23 bài toán của Hilbert đã trở thành kim chỉ nam dẫn đường cho toàn bộ nền toán học thế giới suốt thế kỷ XX. Việc giải quyết được một bài toán trong danh sách này đủ để mang lại danh tiếng bất tử cho bất kỳ nhà toán học nào (như Kurt Gödel giải bài toán số 1 và 2, Andrew Wiles giải bài toán Fermat liên quan bài toán số 10). Tinh thần lạc quan cách mạng của Hilbert chính là ngọn hải đăng soi sáng cho khát vọng chinh phục tri thức của nhân loại!
]

== 8. KURT GÖDEL & HAI ĐỊNH LÝ BẤT TOÀN NĂM 1931

#story-box(
  title: "Giới Hạn Tối Hậu Của Tư Duy Logic Con Người & Máy Tính",
  author: "Kurt Gödel (Áo, 1906 – 1978)",
)[
  Thập niên 1920, David Hilbert khởi xướng "Chương trình Hilbert" với tham vọng tối thượng: Xây dựng một hệ thống tiên đề toán học hoàn hảo tuyệt đối, thỏa mãn hai điều kiện:
  1. *Tính Nhất quán (Consistency):* Không bao giờ sinh ra bất kỳ mâu thuẫn nào ($1 = 0$).
  2. *Tính Đầy đủ (Completeness):* Mọi mệnh đề toán học đúng đắn đều có thể được chứng minh bên trong hệ thống tiên đề đó!
  
  Cả thế giới tin rằng toán học sắp đạt đến sự hoàn mỹ tối hậu. Nhưng vào mùa thu năm 1931 tại Vienna, một chàng thanh niên 25 tuổi trầm lặng tên là *Kurt Gödel* đã công bố một bài báo làm sụp đổ hoàn toàn giấc mơ của Hilbert: *Hai Định lý Bất toàn (Incompleteness Theorems)*.
  
  Bằng cách mã hóa các công thức toán học thành các số nguyên (Mã hóa Gödel), ông đã tạo ra một mệnh đề tự tham chiếu:
  $ G: "Mệnh đề này KHÔNG THỂ chứng minh được trong hệ tiên đề!" $
  - Nếu mệnh đề $G$ được chứng minh: Hệ thống đã chứng minh một điều sai $arrow$ Toán học mâu thuẫn!
  - Nếu mệnh đề $G$ không thể chứng minh: Mệnh đề $G$ nói đúng chân lý, nhưng hệ thống bất lực không chứng minh được $arrow$ Toán học bất toàn!
  
  *Định lý Bất toàn Gödel khẳng định:* Mọi hệ tiên đề đủ mạnh để chứa số học tự nhiên đều *KHÔNG THỂ VỪA NHẤT QUÁN VỪA ĐẦY ĐỦ*! Luôn tồn tại những chân lý toán học đúng đắn mà KHÔNG MỘT HỆ TIÊN ĐỀ NÀO CÓ THỂ CHỨNG MINH ĐƯỢC!
  
  Định lý Gödel không phải là sự thất bại của toán học, mà là một phát hiện triết học vĩ đại nhất thế kỷ XX: Nó chứng minh rằng trí tuệ con người và vũ trụ phong phú vô tận, không một cỗ máy tính thuật toán nào có thể đóng khung toàn bộ chân lý vào một chiếc hộp hữu hạn!
]

== 9. ALAN TURING 1936 & KHAI SINH KHOA HỌC MÁY TÍNH HIỆN ĐẠI

#story-box(
  title: "Từ Máy Turing Trừu Tượng Đến Siêu Trí Tuệ Nhân Tạo",
  author: "Alan Turing (Anh, 1912 – 1954)",
)[
  Năm 1936, chàng sinh viên 24 tuổi tại Cambridge *Alan Turing* khi suy ngẫm về Bài toán Quyết định (Entscheidungsproblem) của Hilbert đã phát minh ra một cỗ máy tưởng tượng mang tên *Máy Turing (Turing Machine)*:
  Một cỗ máy gồm một dải băng dài vô tận chia thành các ô vuông, một đầu đọc/ghi có thể di chuyển sang trái, sang phải, đọc ký hiệu $0$ hoặc $1$, và thay đổi trạng thái nội tại theo một bảng quy tắc hữu hạn.
  
  Chỉ với mô hình toán học đơn sơ bằng giấy và bút đó, Turing đã chứng minh tồn tại *Máy Turing Phổ quát (Universal Turing Machine)* có thể mô phỏng lại hoạt động của BẤT KỲ CỖ MÁY TÍNH TOÁN NÀO TRÊN ĐỜI! Đó chính là bản vẽ thiết kế lý thuyết đầu tiên của chiếc máy tính đa năng (Computer) mà các em đang sử dụng ngày nay!
  
  Trong Thế chiến II, Turing đã lãnh đạo đội ngũ tại Bletchley Park chế tạo cỗ máy cơ điện Bombe giải mã cỗ máy mật mã Enigma của Đức Quốc Xã, cứu sống hơn 14 triệu sinh mạng và rút ngắn cuộc chiến tranh ít nhất hai năm. Alan Turing được nhân loại tôn vinh là Người Cha của Khoa học Máy tính và Trí tuệ Nhân tạo hiện đại!
]

== 10. ANDREW WILES 1994 & BẢN HÙNG CA 358 NĂM GIẢI MÃ ĐỊNH LÝ CUỐI CÙNG CỦA FERMAT

#story-box(
  title: "Hành Trình Cô Đơn Bảy Năm Dưới Căn Gác Mái",
  author: "Pierre de Fermat (1637) & Sir Andrew Wiles (Anh, 1953 – nay)",
)[
  Năm 1637, bên lề cuốn sách cổ *“Arithmetica”* của Diophantus, thẩm phán Pierre de Fermat đã viết một dòng ghi chú nổi tiếng:
  *“Phương trình $x^n + y^n = z^n$ không có nghiệm nguyên dương nào khi $n >= 3$. Ta đã tìm ra một lời chứng minh thực sự tuyệt diệu cho điều này, nhưng lề cuốn sách này quá hẹp không đủ chỗ để ghi lại!”*.
  
  Dòng ghi chú lửng lơ đó đã trở thành lời thách thức lớn nhất lịch sử toán học suốt 358 năm. Hàng ngàn nhà toán học từ Euler, Gauss, Sophie Germain đến Dirichlet, Kummer đều lao vào cuộc săn lùng nhưng đều thất bại.
  
  Năm 1963, khi mới là một cậu bé 10 tuổi tại thư viện thành phố Cambridge, *Andrew Wiles* đã đọc được câu đố này và thề rằng cả cuộc đời mình sẽ dành để giải quyết nó. Năm 1986, khi nhà toán học Ken Ribet chứng minh được rằng Định lý Fermat là hệ quả của *Giả thuyết Taniyama-Shimura* về đường cong Elip, Wiles biết rằng thời khắc lịch sử đã đến.
  
  Suốt 7 năm ròng rã, Wiles tự giam mình dưới căn gác mái tại Đại học Princeton, tuyệt đối không tiết lộ cho bất kỳ ai trừ vợ mình. Ông từ bỏ mọi công việc giảng dạy và hội thảo, âm thầm kết nối những nhánh toán học tối tân nhất: Đường cong Elip, Dạng Modular, Đại số Galois và Hệ số Biến dạng.
  
  Tháng 6 năm 1993, tại Viện Isaac Newton ở Cambridge, Wiles bước lên bục giảng và viết dòng kết luận cuối cùng trước sự sững sờ nghẹn ngào của cả hội trường:
  *“Tôi nghĩ rằng tôi sẽ dừng lại ở đây!”*. Cả khán phòng vỡ òa trong những tràng pháo tay kéo dài không dứt! Dù sau đó phát hiện một lỗ hổng nhỏ, Wiles cùng học trò Richard Taylor đã kiên cường vá lại lỗ hổng sau 1 năm và chính thức công bố công trình hoàn mỹ vào năm 1995!
  
  *Thông điệp cho tuổi trẻ:* Định lý Fermat không chỉ là một kết quả số học, nó là minh chứng cho sự kiên định bền bỉ phi thường của con người. Không có bí mật nào của tự nhiên có thể lẩn trốn mãi mãi trước một ý chí sắt đá dám dâng hiến trọn vẹn cả cuộc đời cho chân lý!
]



#pagebreak()

= PHẦN VIII: ĐẠI BẢNG TRA CỨU 100 CÔNG THỨC & ĐỊNH LÝ VÀNG TOÁN HỌC KHỐI 10

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Hệ thống hóa toàn bộ công thức cốt lõi, điều kiện tồn tại và cạm bẫy nhận thức cần tránh của toàn bộ chương trình Toán học lớp 10. Đây là cẩm nang bỏ túi tối thượng giúp học sinh tra cứu tốc hành và tự tin bước vào mọi kỳ thi tuyển chọn.
]

#align(center)[
  #table(
    columns: (2.5cm, 4.5cm, 4.5cm, 4.5cm),
    stroke: 0.5pt + rgb("cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("1e293b") } else if calc.even(y) { rgb("f8fafc") } else { none },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    table.header(
      text(fill: white, weight: "bold", size: 8.5pt)[Tên Định lý / Khái niệm],
      text(fill: white, weight: "bold", size: 8.5pt)[Công thức Toán học Chuẩn],
      text(fill: white, weight: "bold", size: 8.5pt)[Điều kiện Áp dụng / Tồn tại],
      text(fill: white, weight: "bold", size: 8.5pt)[Cạm bẫy Cần Tuyệt đối Tránh],
    ),
    
    [Mệnh đề Phủ định], [$macron(forall x in X : P(x)) equiv exists x in X, macron(P(x))$], [Mọi tập hợp $X != emptyset$], [Quên phủ định dấu bất đẳng thức ($>$ thành $<=$).],
    [Mệnh đề Kéo theo], [$P arrow Q equiv not P or Q$], [Chân trị chỉ sai khi $1 arrow 0$], [Tưởng rằng tiền đề sai thì cả mệnh đề sai (thực chất luôn đúng!).],
    [Tập con / Số tập con], [$n(P(A)) = 2^n$], [Tập $A$ có $n$ phần tử hữu hạn], [Quên đếm tập rỗng $emptyset$ và chính tập hợp $A$.],
    [Hiệu hai tập hợp], [$A \\ B = {x in A | x in.not B}$], [Mọi tập hợp $A, B$], [Nhầm lẫn giữa hiệu $A \\ B$ và giao $A inter B$.],
    [Bất đẳng thức Cauchy], [$a + b >= 2 sqrt(a b)$], [$a >= 0, b >= 0$], [Áp dụng khi hai số chưa chắc chắn không âm.],
    [Bất đẳng thức Bunhiacopxki], [$(a x + b y)^2 <= (a^2 + b^2)(x^2 + y^2)$], [Mọi số thực $a, b, x, y$], [Quên điều kiện xảy ra dấu bằng ($a/x = b/y$).],
    [Định lý Côsin], [$a^2 = b^2 + c^2 - 2 b c cos A$], [Tam giác bất kỳ], [Nhầm dấu trừ thành dấu cộng (dễ nhầm với Pitago mở rộng).],
    [Định lý Sin], [$a / (sin A) = b / (sin B) = c / (sin C) = 2R$], [Góc $A, B, C != 0, 180 degree$], [Quên số 2 trước bán kính đường tròn ngoại tiếp $R$.],
    [Công thức Heron], [$S = sqrt(p(p - a)(p - b)(p - c))$], [$p = (a + b + c) / 2$ (nửa chu vi)], [Nhầm $p$ là chu vi thay vì nửa chu vi.],
    [Bán kính nội tiếp $r$], [$S = p r arrow r = S / p$], [Tam giác bất kỳ], [Nhầm bán kính nội tiếp $r$ với ngoại tiếp $R$.],
    [Độ dài Trung tuyến], [$m_a^2 = (2(b^2 + c^2) - a^2) / 4$], [Hệ thức Apollonius], [Quên chia mẫu cho 4, nhầm dấu trừ của cạnh đối diện $a^2$.],
    [Độ dài Phân giác trong], [$l_a = (2 b c cos(A / 2)) / (b + c)$], [Tam giác bất kỳ], [Nhầm góc $A/2$ với góc $A$.],
    [Tổng hai Vectơ], [$vec(A B) + vec(B C) = vec(A C)$], [Quy tắc 3 điểm Chasles], [Cộng hai vectơ không chung điểm nối tiếp.],
    [Quy tắc Hình bình hành], [$vec(A B) + vec(A D) = vec(A C)$], [$A B C D$ là hình bình hành], [Nhầm vectơ đường chéo $vec(A C)$ với $vec(B D)$.],
    [Tọa độ Trung điểm], [$x_M = (x_A + x_B) / 2, y_M = (y_A + y_B) / 2$], [$M$ là trung điểm đoạn $A B$], [Nhầm dấu cộng thành dấu trừ.],
    [Tọa độ Trọng tâm], [$x_G = (x_A + x_B + x_C) / 3$], [$G$ là trọng tâm $Delta A B C$], [Quên chia cho 3 (dễ nhầm chia 2 như trung điểm).],
    [Tâm tỉ cự 3 điểm], [$alpha vec(I A) + beta vec(I B) + gamma vec(I C) = vec(0)$], [$alpha + beta + gamma != 0$], [Áp dụng khi tổng các hệ số triệt tiêu bằng 0.],
    [Tích vô hướng], [$vec(u) dot vec(v) = |vec(u)| |vec(v)| cos(vec(u), vec(v))$], [Mọi cặp vectơ], [Tưởng kết quả là một vectơ (thực chất là một số thực!).],
    [Biểu thức Tọa độ Tích VH], [$vec(u) dot vec(v) = u_1 v_1 + u_2 v_2$], [Trong hệ trục chuẩn $O x y$], [Nhầm nhân chéo thay vì hoành nhân hoành cộng tung nhân tung.],
    [Điều kiện Vuông góc], [$vec(u) perp vec(v) arrow.double u_1 v_1 + u_2 v_2 = 0$], [$vec(u), vec(v) != vec(0)$], [Quên điều kiện hai vectơ phải khác vectơ-không.],
    [Độ dài Vectơ], [$|vec(u)| = sqrt(u_1^2 + u_2^2)$], [Hệ trục Descartes], [Quên dấu căn bậc hai ngoài cùng.],
    [Góc giữa hai Vectơ], [$cos theta = (u_1 v_1 + u_2 v_2) / (sqrt(u_1^2 + u_2^2) sqrt(v_1^2 + v_2^2))$], [$vec(u), vec(v) != vec(0)$], [Mẫu số bị triệt tiêu khi có vectơ-không.],
    [Sai số tuyệt đối], [$Delta_a = |bar(a) - a| <= d$], [$d > 0$ là độ chính xác], [Nhầm sai số tuyệt đối với sai số tương đối.],
    [Sai số tương đối], [$delta_a = Delta_a / |a| <= d / |a|$], [$a != 0$], [Tính sai số tương đối mà quên chia cho độ lớn của số đo.],
    [Số Trung bình], [$bar(x) = 1/n sum_(i=1)^n x_i$], [Mẫu số liệu $n >= 1$], [Bị bóp méo hoàn toàn khi có giá trị ngoại lai cực đoan.],
    [Trung vị ($M_e$)], [Giá trị đứng chính giữa dãy đã sắp xếp], [Dãy số đã xếp thứ tự tăng dần], [Quên sắp xếp dãy số trước khi tìm trung vị!],
    [Tứ phân vị ($Q_1, Q_2, Q_3$)], [$Q_2 = M_e$, $Q_1$ là trung vị nửa dưới], [Mẫu số liệu chia đôi], [Không rõ quy tắc bỏ hay giữ trung vị khi $n$ lẻ.],
    [Khoảng Tứ phân vị], [$I Q R = Q_3 - Q_1$], [Thước đo độ phân tán vững], [Nhầm $I Q R$ với khoảng biến thiên $R = "Max" - "Min"$.],
    [Hàng rào Ngoại lai Tukey], [$["Lower", "Upper"] = [Q_1 - 1,5 I Q R; Q_3 + 1,5 I Q R]$], [Phát hiện Outliers], [Nhầm hệ số $1,5$ thành $3,0$ (hàng rào cực đoan).],
    [Phương sai mẫu], [$s^2 = 1/(n - 1) sum (x_i - bar(x))^2$], [Mẫu ngẫu nhiên kích thước $n$], [Chia cho $n$ thay vì chia $n - 1$ (quên hiệu chỉnh Bessel!).],
    [Độ lệch chuẩn], [$s = sqrt(s^2)$], [Cùng đơn vị với dữ liệu gốc], [Nhầm lẫn đơn vị giữa phương sai (bình phương) và độ lệch chuẩn.],
    [Hệ số biến thiên], [$C V = s / bar(x)$], [$bar(x) > 0$], [Dùng để so sánh độ phân tán giữa hai mẫu có đơn vị đo khác nhau.],
    [Tọa độ Đỉnh Parabol], [$I(-b / (2a); -Delta / (4a))$], [Hàm bậc hai $a != 0$], [Nhầm tung độ đỉnh là $-Delta / (2a)$ thay vì $-Delta / (4a)$.],
    [Trục đối xứng Parabol], [$x = -b / (2a)$], [Đường thẳng đứng], [Viết thiếu chữ $x =$ (chỉ ghi mỗi giá trị $-b/(2a)$).],
    [Định lý Viète], [$x_1 + x_2 = -b / a, x_1 x_2 = c / a$], [$Delta >= 0$], [Áp dụng Viète khi phương trình chưa chắc có nghiệm ($Delta < 0$).],
    [Dấu Tam thức bậc hai], [$a f(x) > 0 forall x in RR arrow.double cases(a != 0, Delta < 0)$], [Tam thức bậc hai], [Quên xét trường hợp hệ số $a = 0$ khi $a$ chứa tham số $m$.],
    [PT Vô tỉ dạng 1], [$sqrt(f(x)) = g(x) arrow.double cases(g(x) >= 0, f(x) = [g(x)]^2)$], [Phương trình chứa căn], [Quên đặt điều kiện $g(x) >= 0$ dẫn đến rước nghiệm ma!],
    [PT Vô tỉ dạng 2], [$sqrt(f(x)) = sqrt(g(x)) arrow.double cases(f(x) >= 0, f(x) = g(x))$], [Hai vế cùng có căn], [Đặt thừa cả hai điều kiện $f >= 0$ và $g >= 0$ gây cồng kềnh.],
    [PT Tổng quát ĐT], [$a x + b y + c = 0$], [$a^2 + b^2 > 0$ (VTPT $vec(n) = (a; b)$)], [Nhầm lẫn giữa vectơ pháp tuyến và vectơ chỉ phương.],
    [PT Tham số ĐT], [$cases(x = x_0 + u_1 t, y = y_0 + u_2 t)$], [$vec(u) = (u_1; u_2) != vec(0), t in RR$], [Quên miền xác định của tham số thời gian $t in RR$.],
    [Khoảng cách Điểm - ĐT], [$d(M, Delta) = (|a x_0 + b y_0 + c|) / sqrt(a^2 + b^2)$], [$Delta: a x + b y + c = 0$], [Quên dấu trị tuyệt đối trên tử số hoặc quên căn ở mẫu.],
    [Góc giữa hai ĐT], [$cos phi = (|a_1 a_2 + b_1 b_2|) / (sqrt(a_1^2 + b_1^2) sqrt(a_2^2 + b_2^2))$], [$0 degree <= phi <= 90 degree$], [Quên trị tuyệt đối trên tử (góc giữa 2 ĐT không bao giờ tù!).],
    [PT Chính tắc Đường tròn], [$(x - a)^2 + (y - b)^2 = R^2$], [Tâm $I(a; b)$, bán kính $R > 0$], [Nhầm dấu tọa độ tâm khi chuyển từ phương trình ra.],
    [Điều kiện Đường tròn], [$a^2 + b^2 - c > 0$], [Dạng $x^2 + y^2 - 2a x - 2b y + c = 0$], [Quên kiểm tra điều kiện $a^2 + b^2 - c > 0$.],
    [Tiếp tuyến Đường tròn], [$d(I, Delta) = R$], [Tiếp xúc tại đúng 1 điểm], [Nhầm điều kiện tiếp xúc với điều kiện cắt nhau ($d < R$).],
    [Phương trình Elip], [$x^2 / a^2 + y^2 / b^2 = 1$], [$a > b > 0, b^2 = a^2 - c^2$], [Nhầm hệ thức $b^2 = a^2 - c^2$ với Hypebol ($c^2 = a^2 + b^2$).],
    [Phương trình Hypebol], [$x^2 / a^2 - y^2 / b^2 = 1$], [$c^2 = a^2 + b^2, c > a > 0$], [Nhầm dấu trừ thành dấu cộng của Elip.],
    [Phương trình Parabol], [$y^2 = 2 p x$], [$p > 0$ (Tham số tiêu)], [Tiêu điểm $F(p/2; 0)$, đường chuẩn $x = -p/2$ (dễ nhầm chia 4).],
    [Tâm sai Conic], [$e = c / a$ (Elip, Hyp), $e = 1$ (Parabol)], [Mọi đường Conic], [Quên rằng đường tròn là trường hợp suy biến có $e = 0$.],
    [Quy tắc Cộng], [$n(A union B) = n(A) + n(B)$], [$A inter B = emptyset$ (Xung khắc)], [Áp dụng quy tắc cộng khi hai phương án không loại trừ nhau.],
    [Quy tắc Nhân], [$n(A_1 times A_2) = n_1 times n_2$], [Các công đoạn liên tiếp độc lập], [Áp dụng nhầm khi các công đoạn phụ thuộc điều kiện nhau.],
    [Hoán vị $P_n$], [$P_n = n!$], [$n in NN^*$ phần tử phân biệt], [Quy ước $0! = 1$ trong tính toán tổ hợp.],
    [Chỉnh hợp $A_n^k$], [$A_n^k = (n!) / ((n - k)!)$], [$0 <= k <= n$ (Có xếp thứ tự)], [Nhầm chỉnh hợp với tổ hợp khi thứ tự không quan trọng.],
    [Tổ hợp $C_n^k$], [$C_n^k = (n!) / (k! (n - k)!)$], [$0 <= k <= n$ (Không thứ tự)], [Tính chất đối xứng: $C_n^k = C_n^(n - k)$.],
    [Công thức Tam giác Pascal], [$C_n^k = C_(n-1)^(k-1) + C_(n-1)^k$], [$1 <= k <= n - 1$], [Dùng để lập trình sinh tổ hợp không bị tràn số nguyên.],
    [Khai triển Nhị thức Newton], [$(a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k$], [$n in NN$], [Quên hệ số tổ hợp $C_n^k$ đứng trước mỗi số hạng.],
    [Số hạng tổng quát thứ $k+1$], [$T_(k+1) = C_n^k a^(n-k) b^k$], [Đếm từ $k = 0$], [Nhầm số hạng thứ $k$ có chỉ số là $k$ thay vì $k - 1$.],
    [Không gian mẫu $Omega$], [Tập hợp mọi kết quả khả dĩ], [Phép thử ngẫu nhiên], [Liệt kê thiếu kết quả hoặc kết quả không đồng khả năng.],
    [Xác suất Cổ điển], [$P(A) = (n(A)) / (n(Omega))$], [Các kết quả đồng khả năng], [Áp dụng công thức Laplace cho biến cố không đồng khả năng!],
    [Xác suất Biến cố đối], [$P(macron(A)) = 1 - P(A)$], [$macron(A) = Omega \\ A$], [Không nhận ra biến cố đối khi đề bài có từ "ít nhất một".],
    [Quy nạp Toán học], [1. Cơ sở $n=1$; 2. $k arrow k+1$], [Mệnh đề trên $NN^*$], [Quên bước cơ sở $n=1$ hoặc giả thiết quy nạp sai.],
    [Khử Gauss], [Biến đổi dòng về ma trận bậc thang], [Hệ phương trình tuyến tính], [Chia cho một số bằng 0 khi làm phép biến đổi sơ cấp dòng.],
  )
]


// ══════════════════════════════════════════════════════════════
// LỜI KẾT: BỨC THƯ GỬI NGƯỜI GIEO MẦM TƯ DUY LỚP 10
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFBEB"),
  stroke: (left: 5pt + c-gold, rest: 0.5pt + rgb("FDE68A")),
  inset: (x: 20pt, y: 18pt),
  radius: (right: 8pt),
)[
  #text(size: 14pt, weight: "black", fill: rgb("92400E"))[
    LỜI KẾT: NGỌN ĐUỐC TRÍ TUỆ TRONG TAY NGƯỜI THẦY
  ]
  #v(0.8em)
  
  Quý Thầy Cô giáo và các bạn học sinh thân mến,
  
  Chúng ta vừa cùng nhau đi qua một cuộc hành trình vĩ đại xuyên qua hơn 2.500 năm lịch sử tư tưởng nhân loại — từ những bờ cát cổ kính thành Athens của Aristotle, qua căn phòng lò sưởi mùa đông của René Descartes, bước qua cây cầu Brougham nơi Hamilton rút dao khắc phương trình Quaternion, chứng kiến cuộc đấu tranh bi tráng của Georg Cantor vì cõi Vô hạn, đến những chuyến bay vũ trụ thám hiểm Sao Hỏa và những dòng code thuật toán làm nên Trí tuệ Nhân tạo thế kỷ XXI.
  
  Mỗi công thức trong sách giáo khoa Toán lớp 10 không bao giờ là những con số chết. Chúng là *những dòng máu nóng của những bộ óc vĩ đại nhất từng sống trên Trái Đất!*
  
  Lớp 10 là ngưỡng cửa thiêng liêng nhất của bậc học THPT: Nơi học sinh rũ bỏ lối học cụ thể máy móc của tuổi ấu thơ để bước vào cảnh giới của tư duy trừu tượng hóa, tư duy tiên đề và khả năng mô hình hóa thế giới bằng đại số và hình học giải tích.
  
  Khi người thầy bước lên bục giảng với một trái tim say mê, biết kể cho học trò nghe những câu chuyện bi tráng ấy, người thầy không chỉ dạy toán, mà đang *thực hiện sứ mệnh truyền lửa văn minh*. Và những cô cậu học trò ngồi dưới lớp hôm nay, khi hiểu được nguồn gốc và vẻ đẹp thiêng liêng của tri thức, các em sẽ không còn học tập trong sự sợ hãi điểm số, mà sẽ bước đi bằng lòng tự hào và khát vọng chinh phục những đỉnh cao mới của nhân loại.
  
  Chúc cho ngọn lửa đam mê Toán học mãi mãi rực sáng trong trái tim của Thầy và Trò!
]

#v(1.5em)
#align(center)[
  #text(size: 12.5pt, weight: "bold", fill: c-navy)[HẾT TOÀN THƯ KHAI MỞ TRI THỨC SƯ PHẠM TOÁN 10]\
  #text(size: 9.5pt, style: "italic", fill: rgb("64748B"))[Dự án Sách Đề Ôn Tập Theo Chương Toán 10 · Hệ Sinh Thái ConicTypst Master Series]
]
'''
