# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG IX: RANH GIỚI GIỮA MÊ TÍN & KHOA HỌC — TÍNH XÁC SUẤT CỔ ĐIỂN

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 27, Bài 28 SGK Toán 10 cùng Chuyên đề Nghịch lý Monty Hall, Nghịch lý Ngày sinh (Birthday Paradox), Định lý Bayes & Bản chất của Trí tuệ nhân tạo LLM (Bộ Kết Nối Tri Thức, Cánh Diều, Chân Trời Sáng Tạo).
]

== BÀI 27: BIẾN CỐ VÀ KHÔNG GIAN MẪU — VŨ TRỤ CỦA MỌI KỊCH BẢN KHẢ DĨ

Trước thế kỷ XVII, khi một người tung một con súc sắc hay đối mặt với một trận bão biển, họ tin rằng mọi thứ đều nằm trong tay của "Thần May Mắn" (Fortuna) hoặc định mệnh siêu nhiên. Nếu gặp rủi ro, họ cúng bái tế lễ; nếu may mắn, họ tạ ơn thần linh. Con người hoàn toàn bất lực trước sự ngẫu nhiên của cuộc đời.

Sự ra đời của *Khái niệm Phép thử ($T$), Không gian mẫu ($Omega$) và Biến cố ($A$)* chính là phát súng đầu tiên giải thoát nhân loại khỏi sự mê tín dị đoan!
- *Không gian mẫu ($Omega$)*: Là toàn bộ vũ trụ của MỌI KỊCH BẢN CÓ THỂ XẢY RA của một hiện tượng ngẫu nhiên.
- *Biến cố ($A subset.eq Omega$)*: Là một tập hợp con gồm những kết quả mà chúng ta quan tâm.

Bằng cách gom mọi sự ngẫu nhiên vào một tập hợp xác định $Omega$, con người đã lần đầu tiên "bắt nhốt" được sự bất định của số phận vào trong chiếc lồng của tư duy toán học!

#story-box(
  title: "Girolamo Cardano: Bác sĩ, Con bạc khét tiếng & Cuốn sách cờ bạc đầu tiên",
  author: "Girolamo Cardano (Ý, 1501 – 1576)",
)[
  Girolamo Cardano là một trong những nhân vật kỳ dị và màu sắc nhất của thời kỳ Phục hưng. Ông là một bác sĩ lừng danh từng chữa khỏi bệnh cho Tổng giám mục xứ Scotland, người phát minh ra trục truyền động các-đăng (Cardan shaft) dùng trên mọi ô tô ngày nay, và là người đầu tiên công bố công thức giải phương trình bậc ba.
  
  Nhưng Cardano có một điểm yếu chí mạng: ông là một *con bạc nghiện ngập điên cuồng*! Ông chơi súc sắc, đánh cược và bài tây thâu đêm suốt sáng tại các sòng bạc ngầm ở Milan và Bologna. Nhiều lần ông thua sạch đến chiếc áo khoác cuối cùng và phải cầm cố cả đồ trang sức của vợ.
  
  Tuy nhiên, với bộ óc toán học thiên tài, Cardano không cam chịu làm một kẻ cờ bạc u mê. Ông ngồi xuống, ghi chép lại hàng vạn lần tung súc sắc và viết nên cuốn sách *“Liber de Ludo Aleae”* (Cuốn sách về Trò chơi May rủi) vào năm 1564 — cuốn sách đầu tiên trong lịch sử nhân loại nghiên cứu về không gian mẫu của các trò chơi ngẫu nhiên! Cardano chỉ ra rằng: Nếu bạn gieo hai con súc sắc, có tất cả $6 times 6 = 36$ kịch bản trong không gian mẫu $Omega$. Tổng số chấm bằng 7 có tới 6 biến cố thuận lợi:
  $ (1, 6), (2, 5), (3, 4), (4, 3), (5, 2), (6, 1) $
  trong khi tổng số chấm bằng 2 chỉ có duy nhất 1 biến cố: $(1, 1)$!
  
  Cardano tuyên bố một chân lý cay đắng: *“Sòng bạc thắng không phải vì họ may mắn hơn bạn, mà vì toán học đứng về phía họ! Cách tốt nhất để không thua một canh bạc là KHÔNG BAO GIỜ BƯỚC CHÂN VÀO SÒNG BẠC!”*
]

#hook-box(title: "Trò chơi Tung súc sắc tại Sòng bạc Las Vegas: Con số 7 Tử Thần")[
  Thầy cầm hai con súc sắc 6 mặt lắc đều trong chiếc cốc nhựa rồi đổ ra bàn:
  
  *“Khi các em bước chân vào các sòng bạc lớn nhất tại Las Vegas hay Ma Cao, bàn chơi lúc nào cũng đông nghẹt người gào thét cuồng nhiệt nhất chính là bàn trò chơi Craps (Đổ xí ngầu).*
  
  *Trong trò chơi đó, con số nào là con số đáng sợ nhất, chi phối toàn bộ luật chơi của sòng bạc? Đó chính là CON SỐ 7!*
  
  *Tại sao lại là số 7 mà không phải số 6 hay số 8?*
  - Tổng bằng 2: Chỉ có 1 cách: $1 + 1$.
  - Tổng bằng 12: Chỉ có 1 cách: $6 + 6$.
  - Nhưng Tổng bằng 7: Có tới 6 cách kết hợp!
  $arrow$ Xác suất xuất hiện số 7 là $6 / 36 = 1/6 approx 16,67\%$ — cao nhất trong mọi tổng số điểm!
  
  *Sòng bạc Las Vegas không hề dựa vào sự may rủi mơ hồ, họ thuê những tiến sĩ toán học giỏi nhất thế giới để thiết kế Không gian mẫu sao cho dù khách hàng có thắng một vài ván lẻ tẻ, thì về lâu dài, Định luật số lớn sẽ gom toàn bộ tiền của người chơi về két sắt của sòng bạc!”*
]

#tech-box(title: "Kiểm thử phần mềm tự động (Fuzz Testing) bằng Không gian mẫu")[
  - *Săn lùng lỗ hổng bảo mật cho hệ điều hành Windows & iOS*: Khi Microsoft hay Apple phát hành một bản cập nhật phần mềm, làm sao họ biết phần mềm không bị hacker tấn công tràn bộ nhớ (Buffer Overflow)? Họ sử dụng kỹ thuật *Fuzz Testing*: Máy tính tự động sinh ra hàng triệu chuỗi dữ liệu đầu vào ngẫu nhiên từ không gian mẫu $Omega$ của mọi ký tự khả dĩ để "bắn phá" vào phần mềm. Nếu có một kịch bản ngẫu nhiên làm sập hệ thống, các kỹ sư sẽ vá lỗ hổng ngay trước khi sản phẩm đến tay người tiêu dùng.
]

#misconception-box(
  title: "Cái bẫy Tâm lý Ngụy biện Con bạc (Gambler's Fallacy) & Ảo tưởng Tay đỏ (Hot Hand)",
  misconception: "Tung đồng xu 5 lần liên tiếp đều ra mặt Ngửa, vậy lần thứ 6 chắc chắn mặt Sấp sẽ có xác suất cao hơn để 'bù trừ lại cho cân bằng'!",
  correction: "Đồng xu là một vật thể vô tri vô giác, hoàn toàn KHÔNG CÓ TRÍ NHỚ! Mỗi lần tung là một phép thử độc lập tuyệt đối. Lần thứ 6 thì xác suất ra Ngửa hay Sấp vẫn đúng bằng 50%!"
)[
  *Thảm họa Monte Carlo ngày 18 tháng 8 năm 1913:*
  
  Tại sòng bạc xa hoa Monte Carlo ở Monaco, quả bóng roulette rơi vào ô màu Đen. Lần thứ hai: lại rơi vào ô Đen. Lần thứ ba, thứ tư... bóng liên tục rơi vào ô Đen!
  
  Đám đông con bạc bắt đầu phát cuồng. Họ tin rằng theo "luật bù trừ tự nhiên", ô Đỏ sắp phải xuất hiện. Họ bắt đầu dồn hàng triệu Franc vào ô Đỏ. Nhưng quả bóng tiếp tục rơi vào ô Đen lần thứ 10, 15, 20! Các con bạc lại càng điên cuồng vay mượn, cắm nhà cửa, gom hết tài sản đặt vào ô Đỏ vì nghĩ rằng "chuỗi đen không thể kéo dài mãi".
  
  Cuối cùng, quả bóng roulette đã rơi vào ô Đen liên tiếp *26 LẦN* trước khi rơi vào ô Đỏ ở lần thứ 27! Trong đêm kinh hoàng đó, sòng bạc Monte Carlo đã thu về hàng triệu Franc tiền cược, còn hàng chục con bạc giàu có nhất châu Âu đã nhảy cầu tự tử vì phá sản chỉ vì một ảo tưởng ngụy biện tâm lý!
  
  *Bài học cho học sinh:* Định luật Số lớn chỉ phát biểu rằng tần số tương đối sẽ hội tụ về xác suất lý thuyết khi số phép thử TIẾN ĐẾN VÔ CÙNG ($n arrow +infinity$), chứ KHÔNG HỀ có bất kỳ một cơ chế cơ học nào "bù trừ điểm" cho các biến cố trong quá khứ ở vài lần thử hữu hạn!
]

---

== BÀI 28: XÁC SUẤT CỦA BIẾN CỐ — BỨC THƯ 1654 & NGHỊCH LÝ MONTY HALL

Định nghĩa cổ điển của Laplace về Xác suất:
$ P(A) = (n(A)) / (n(Omega)) = ("Số kết quả thuận lợi cho A") / ("Tổng số kết quả có thể xảy ra") $
là một trong những định nghĩa thanh nhã và quyền năng nhất của khoa học. Nó biến một dự cảm mơ hồ ("Khả năng trời mưa hôm nay cao đấy") thành một thước đo định lượng chính xác bằng một con số thực nằm trong đoạn $[0; 1]$!

#story-box(
  title: "Bức thư định mệnh năm 1654 giữa Pascal và Fermat: Khai sinh Lý thuyết Xác suất",
  author: "Blaise Pascal (1623 – 1662) & Pierre de Fermat (1607 – 1665)",
)[
  Mùa hè năm 1654, một nhà quý tộc người Pháp mê cờ bạc tên là *Chevalier de Méré* (Hiệp sĩ de Méré) đã gửi cho nhà bác học trẻ Blaise Pascal một câu hỏi hóc búa mang tên *“Bài toán chia tiền cược”* (The Problem of Points):
  
  *“Hai người chơi cùng đặt cược một số tiền bằng nhau vào một trò chơi tung đồng xu: Ai thắng đủ 3 ván trước thì sẽ giành trọn vẹn toàn bộ số tiền thưởng. Nhưng khi người thứ nhất đã thắng 2 ván, người thứ hai mới thắng 1 ván, thì trò chơi buộc phải dừng lại đột ngột vì cảnh sát ập vào bắt giữ! Hỏi: Phải chia số tiền thưởng như thế nào cho công bằng và đúng đạo lý toán học?”*
  
  Nhiều người đương thời đề xuất chia theo tỉ lệ $2 : 1$ (theo số ván đã thắng). Nhưng Pascal linh cảm thấy điều đó là sai lầm, vì người đã thắng 2 ván chỉ cần thắng thêm DUY NHẤT 1 VÁN NỮA là giành toàn bộ giải thưởng!
  
  Pascal lập tức viết thư trao đổi với nhà toán học vĩ đại Pierre de Fermat ở Toulouse. Cuộc trao đổi thư từ định mệnh giữa hai bộ óc thiên tài suốt mùa hè năm 1654 đã làm nên lịch sử:
  - Fermat dùng phương pháp tổ hợp liệt kê mọi kịch bản tương lai có thể xảy ra nếu trò chơi tiếp tục thêm 2 ván nữa.
  - Pascal dùng Tam giác số học của mình để tính toán xác suất kỳ vọng.
  
  Cả hai thiên tài, đi theo hai con đường độc lập, đều đi đến cùng một kết luận bất hủ: Người thứ nhất có xác suất thắng là $3/4$ ($75\%$), người thứ hai chỉ có $1/4$ ($25\%$). Tiền thưởng phải chia theo tỉ lệ $3 : 1$!
  
  Từ bài toán chia tiền cược của một canh bạc dang dở, *Lý thuyết Xác suất hiện đại đã chính thức cất tiếng khóc chào đời*, mở ra kỷ nguyên định lượng rủi ro cho toàn bộ ngành bảo hiểm, tài chính và khoa học thế giới!
]

#story-box(
  title: "Nghịch lý Monty Hall 1990: Khi 1.000 Tiến sĩ Toán học bị một phụ nữ đánh bại",
  author: "Marilyn vos Savant & Gameshow 'Let's Make a Deal'",
)[
  Năm 1990, trong chuyên mục "Ask Marilyn" của tạp chí Parade, một độc giả đã gửi câu hỏi về gameshow truyền hình nổi tiếng *“Let's Make a Deal”* do MC Monty Hall dẫn chương trình:
  
  *“Bạn đang đứng trên sân khấu trước 3 cánh cửa đóng kín: Đằng sau một cánh cửa là một chiếc ô tô thể thao sang trọng, đằng sau hai cánh cửa còn lại là hai con dê hôi hám. Bạn chọn cánh Cửa số 1.*
  *MC Monty Hall — người biết rõ ô tô nằm ở đâu — bước đến mở cánh Cửa số 3 ra, và một con dê xuất hiện kêu be be.*
  *Lúc này, chỉ còn Cửa số 1 và Cửa số 2 đóng kín. Monty Hall quay sang bạn và hỏi: ‘Bạn có muốn THAY ĐỔI lựa chọn sang Cửa số 2 không?’*
  *Hỏi: Bạn nên giữ nguyên Cửa số 1 hay nên ĐỔI sang Cửa số 2 để có cơ hội trúng ô tô cao hơn?”*
  
  Bà *Marilyn vos Savant* (người từng được sách Kỷ lục Guinness ghi nhận là người có chỉ số IQ cao nhất thế giới: 228) đã trả lời dứt khoát trên báo: *“BẠN BẮT BUỘC PHẢI ĐỔI SANG CỬA SỐ 2! Việc đổi cửa sẽ tăng gấp đôi xác suất thắng của bạn từ $1/3$ lên $2/3$!”*
  
  Ngay lập tức, một cơn bão thịnh nộ chưa từng có trong lịch sử học thuật Mỹ bùng nổ! Hơn $10.000$ bức thư phản đối giận dữ từ khắp nơi gửi về tòa soạn, trong đó có thư của gần *1.000 Giáo sư và Tiến sĩ Toán học* từ các trường đại học danh giá như Harvard, MIT, Viện Nghiên cứu Quốc gia! Nhiều giáo sư viết thư thóa mạ công khai: *“Bà là kẻ dốt nát! Chỉ còn 2 cánh cửa thì xác suất bắt buộc phải là 50/50! Hãy xin lỗi công chúng và đừng làm xấu mặt phụ nữ nữa!”*.
  
  Marilyn vos Savant vẫn bình tĩnh mỉm cười. Bà mời toàn bộ các trường trung học và các nhà khoa học trên toàn nước Mỹ thực hiện một cuộc mô phỏng thực tế bằng máy tính và chơi thử hàng chục nghìn lần trên lớp học. Kết quả chấn động: *Những người ĐỔI CỬA thắng đúng xấp xỉ $66,7\%$ ($2/3$), còn những người GIỮ NGUYÊN chỉ thắng $33,3\%$ ($1/3$)!*
  
  *Phân tích bảng Không gian mẫu sáng tỏ 3 kịch bản:*
  Giả sử bạn luôn chọn Cửa số 1 ban đầu:
  #align(center)[
    #table(
      columns: (2.5cm, 2.5cm, 2.5cm, 3.5cm, 3.5cm),
      stroke: 0.5pt + rgb("cbd5e1"),
      fill: (x, y) => if y == 0 { rgb("f1f5f9") } else { none },
      [Vị trí Ô tô], [Cửa bạn chọn], [MC mở cửa dê], [Nếu GIỮ NGUYÊN (Cửa 1)], [Nếu ĐỔI CỬA (Cửa còn lại)],
      [Cửa 1], [Cửa 1], [Cửa 2 hoặc 3], [#text(fill: rgb("16a34a"), weight: "bold")[THẮNG XE]], [#text(fill: rgb("dc2626"))[THUA (Trúng Dê)]],
      [Cửa 2], [Cửa 1], [Bắt buộc Cửa 3], [#text(fill: rgb("dc2626"))[THUA (Trúng Dê)]], [#text(fill: rgb("16a34a"), weight: "bold")[THẮNG XE (Cửa 2)]],
      [Cửa 3], [Cửa 1], [Bắt buộc Cửa 2], [#text(fill: rgb("dc2626"))[THUA (Trúng Dê)]], [#text(fill: rgb("16a34a"), weight: "bold")[THẮNG XE (Cửa 3)]],
    )
  ]
  - Chiến lược GIỮ NGUYÊN chỉ thắng khi ô tô nằm ở Cửa 1 ban đầu: Xác suất là $1/3$ ($33,3\%$).
  - Chiến lược ĐỔI CỬA sẽ thắng trong cả 2 trường hợp ô tô nằm ở Cửa 2 hoặc Cửa 3: Xác suất là $2/3$ ($66,7\%$)!
  
  Hàng trăm giáo sư toán học sau đó đã phải muối mặt viết thư xin lỗi công khai bà Marilyn vos Savant trên báo chí. Nghịch lý Monty Hall là bài học chấn động nhất chứng minh rằng: *Trực giác con người rất kém cỏi trước xác suất! Chỉ có tính toán toán học lạnh lùng mới bảo vệ chúng ta khỏi những sai lầm ngớ ngẩn nhất!*
]

#story-box(
  title: "Nghịch Lý Ngày Sinh (Birthday Paradox) & Đòn Tấn Công Mã Hóa SHA",
  author: "Richard von Mises (Áo, 1883 – 1953) & Mật mã học Hiện đại",
)[
  Hãy tưởng tượng một lớp học có $n$ bạn học sinh. Cần có bao nhiêu học sinh trong lớp để xác suất có *ÍT NHẤT HAI BẠN CÙNG NGÀY SINH NHẬT* (ngày và tháng) vượt quá $50\%$?
  
  Hầu hết mọi người khi nghe câu hỏi này đều nhẩm tính: Một năm có 365 ngày, muốn có xác suất trên $50\%$ thì chắc phải cần ít nhất một nửa số ngày trong năm: $365 / 2 approx 183$ người!
  
  Nhưng Toán học lớp 10 với phương pháp tính xác suất của *Biến cố đối* cho ta một con số gây sốc hoàn toàn: *CHỈ CẦN ĐÚNG 23 NGƯỜI TRONG PHÒNG LÀ XÁC SUẤT ĐÃ VƯỢT QUÁ 50,7%!* Và nếu lớp học có 75 người, xác suất này vọt lên tới *99,9%* gần như chắc chắn tuyệt đối!
  
  *Chứng minh kỳ ảo bằng Biến cố đối $bar(A)$ (Không ai có cùng ngày sinh):*
  - Người 1: Có 365 ngày khả dĩ.
  - Người 2: Có 364 ngày còn lại ($364 / 365$).
  - Người thứ $n$: Có $365 - n + 1$ ngày còn lại.
  $ P(bar(A)) = 365 / 365 times 364 / 365 times ... times (365 - n + 1) / 365 $
  Với $n = 23$: $P(bar(A)) approx 0,4927$.
  $arrow P(A) = 1 - P(bar(A)) = 1 - 0,4927 = 0,5073 = 50,73\%! $
  
  *Tại sao trực giác lại bị đánh lừa thê thảm?*
  Vì bạn đang so sánh ngày sinh của bạn với từng người khác (chỉ có 22 cặp so sánh). Nhưng bài toán hỏi: *BẤT KỲ CẶP HAI NGƯỜI NÀO*. Trong 23 người, số lượng cặp đôi so sánh tổ hợp lên tới:
  $ C_(23)^2 = (23 times 22) / 2 = 253 "cặp đôi so sánh"! $
  Với 253 cặp so sánh, cơ hội trùng nhau lớn hơn $50\%$ là điều hoàn toàn tự nhiên!
  
  *Ứng dụng trong An ninh Mạng (Birthday Attack):*
  Các hacker sử dụng Nghịch lý Ngày sinh để tấn công các hàm băm mật mã (Hash Function MD5, SHA-1). Thay vì phải đoán thử $2^n$ lần để tìm một mã khóa định trước, hacker chỉ cần sinh ngẫu nhiên khoảng $sqrt(2^n) = 2^(n/2)$ chuỗi là có thể tìm ra hai tài liệu khác nhau có cùng mã băm (Xung đột băm - Hash Collision), làm sụp đổ các chứng chỉ bảo mật số toàn cầu!
]

#dialogue-box(title: "Đối thoại Socrates: MC Monty Hall Đã Làm Gì Với Không Gian Mẫu?")[
  *Socrates:* Này Theaetetus, khi ngươi chọn Cửa 1 lúc đầu, xác suất có xe ở Cửa 1 là bao nhiêu?
  
  *Học trò:* Thưa thầy, có 3 cánh cửa bình đẳng, nên xác suất là $1/3$.
  
  *Socrates:* Vậy xác suất xe nằm ở một trong hai cánh cửa còn lại (Cửa 2 hoặc Cửa 3) là bao nhiêu?
  
  *Học trò:* Thưa thầy, hiển nhiên là $2/3$.
  
  *Socrates:* Hay lắm. Bây giờ hãy quan sát hành vi của MC Monty Hall. Ông ta có mở ngẫu nhiên một cánh cửa như một kẻ mù quáng không?
  
  *Học trò:* Không ạ! Ông ta biết chính xác xe ở đâu, và ông ta *bắt buộc phải tìm một cánh cửa có dê* trong hai cánh cửa còn lại để mở ra!
  
  *Socrates:* Đúng thế! Nếu xe nằm ở Cửa 2, ông ta bị buộc phải mở Cửa 3. Nếu xe nằm ở Cửa 3, ông ta bị buộc phải mở Cửa 2. Vậy hành động mở cửa của ông ta có làm thay đổi việc lựa chọn ban đầu của ngươi không?
  
  *Học trò:* Dạ không, Cửa 1 vẫn chỉ có xác suất $1/3$ như cũ.
  
  *Socrates:* Vậy toàn bộ xác suất $2/3$ của nhóm hai cánh cửa $\{2; 3\}$ ban đầu giờ đã dồn hết về đâu khi Cửa 3 đã bị lộ tẩy là con dê?
  
  *Học trò:* Ối! Toàn bộ trọng số xác suất $2/3$ đã bị "ép" dồn hết sang Cửa 2!
  
  *Socrates:* Ngươi đã thấy ánh sáng rồi đó! Kẻ dốt nát nhìn thấy 2 cánh cửa còn lại liền tưởng là 50/50 vì họ quên mất thông tin quá khứ. Người có tư duy xác suất hiểu rằng: Hành động loại bỏ có chủ đích của MC là một món quà thông tin miễn phí làm tăng gấp đôi cơ hội thắng nếu ta biết đổi cửa!
]

#deep-dive-box(title: "Định Lý Bayes & Cạm Bẫy Bỏ Quên Tỷ Lệ Nền Trong Y Tế (Base Rate Fallacy)")[
  Một căn bệnh hiếm gặp chỉ ảnh hưởng tới $1$ trong $10.000$ người dân trong cộng đồng (Tỉ lệ nền $P(B) = 0,0001$).
  Một công ty y tế phát minh ra một bộ xét nghiệm máu siêu hiện đại có độ chính xác $99\%$:
  - Nếu người bị bệnh: $99\%$ trường hợp xét nghiệm cho kết quả Dương tính.
  - Nếu người không bị bệnh: $99\%$ trường hợp xét nghiệm cho kết quả Âm tính ($1\%$ dương tính giả).
  
  *Một bạn học sinh đi xét nghiệm sức khỏe và nhận kết quả: DƯƠNG TÍNH! Bác sĩ bảo: "Cháu hãy chuẩn bị tâm lý, độ chính xác máy là 99%!" Bạn học sinh suy sụp ngất xỉu.*
  
  Hỏi: Xác suất bạn học sinh đó THỰC SỰ MẮC BỆNH là bao nhiêu?
  
  Hãy dùng Toán học Xác suất phân tích trong một quần thể $1.000.000$ người dân:
  - Số người thực sự mắc bệnh: $1.000.000 times 0,0001 = 100$ người. Trong đó máy phát hiện đúng $99\%$ $arrow$ *99 người Dương tính thật*.
  - Số người khỏe mạnh bình thường: $999.900$ người. Máy báo sai $1\%$ $arrow$ *9.999 người Dương tính giả*!
  - Tổng số người nhận kết quả Dương tính trong phòng khám:
    $ n("Dương tính") = 99 + 9.999 = 10.098 "người"! $
  
  Xác suất bạn học sinh thực sự mắc bệnh khi đã có kết quả Dương tính:
  $ P("Bệnh" | "Dương tính") = 99 / (10.098) approx 0,0098 = 0,98\%! $
  
  *KẾT QUẢ CHẤN ĐỘNG:* Xác suất mắc bệnh thực sự của bạn học sinh *CHƯA TỚI 1%*! $99\%$ những người nhận kết quả dương tính thực chất là người khỏe mạnh bị chẩn đoán sai! Cái bẫy tâm lý bỏ quên tỉ lệ nền (Base Rate Fallacy) đã khiến hàng triệu người trên thế giới hoảng loạn vô cớ. Đó là lý do trong y khoa, các bác sĩ luôn yêu cầu làm thêm xét nghiệm lần 2 để kiểm chứng chéo!
]

#tech-box(title: "Mô hình Ngôn ngữ Lớn (ChatGPT, Claude) bản chất là Cỗ máy Xác suất")[
  - *Bản chất thực sự của Trí tuệ Nhân tạo hiện đại*: Khi các em nhắn tin cho ChatGPT hay Claude và thấy nó trả lời thông minh như một con người thực sự, các em có biết đằng sau bức màn nhung của AI là gì không? Nó hoàn toàn không có cảm xúc hay ý thức bí ẩn nào cả! 
  - *Bản chất của mọi mô hình LLM chính là một cỗ máy tính Xác suất có điều kiện khổng lồ*:
    $ P(w_t | w_1, w_2, ..., w_(t-1)) $
    Khi các em gõ cụm từ *“Học sinh đi...”*, AI tính xác suất của hàng vạn từ tiếp theo trong từ điển: từ *“học”* có xác suất $70\%$, từ *“chơi”* có xác suất $20\%$, từ *“ngủ”* có xác suất $5\%$... AI chỉ việc chọn từ có xác suất cao nhất phù hợp với ngữ cảnh! Toàn bộ cuộc cách mạng Trí tuệ Nhân tạo làm rung chuyển thế giới hôm nay đều được xây dựng từ định nghĩa xác suất mà các em đang học trong SGK Toán 10!
]

#inquiry-box(title: "Nhiệm vụ Nghiên cứu: Lập trình Mô phỏng Monty Hall & Birthday Paradox")[
  ```python
  import random

  # 1. Mô phỏng Nghịch lý Monty Hall:
  def simulate_monty_hall(trials=100000):
      stay_wins, switch_wins = 0, 0
      for _ in range(trials):
          car = random.randint(1, 3)
          guess = random.randint(1, 3)
          if guess == car:
              stay_wins += 1
          else:
              switch_wins += 1
      print(f"Monty Hall 100.000 ván: Giữ nguyên thắng {stay_wins/trials*100:.2f}% | Đổi cửa thắng {switch_wins/trials*100:.2f}%")

  # 2. Mô phỏng Nghịch lý Ngày sinh (23 người):
  def simulate_birthday(n_people=23, trials=50000):
      matches = 0
      for _ in range(trials):
          birthdays = [random.randint(1, 365) for _ in range(n_people)]
          if len(birthdays) != len(set(birthdays)):
              matches += 1
      print(f"Xác suất có 2 người cùng sinh nhật trong 23 người: {matches/trials*100:.2f}% (Lý thuyết: 50.73%)")

  simulate_monty_hall()
  simulate_birthday()
  ```
]

#pagebreak()
'''
