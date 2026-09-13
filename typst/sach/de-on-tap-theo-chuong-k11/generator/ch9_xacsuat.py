# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG IX: LA BÀN CỦA SỰ BẤT ĐỊNH — QUY TẮC TÍNH XÁC SUẤT & ĐỊNH LÝ BAYES

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 29, Bài 30, Bài 31 SGK Toán 11 cùng Chuyên đề Nghịch lý Xét nghiệm Y khoa rúng động và Bộ lọc Thư rác AI Naive Bayes của Google.
]

== BÀI 29 & 30: BIẾN CỐ ĐỘC LẬP, QUY TẮC NHÂN & CỘNG XÁC SUẤT

Ở lớp 10, học sinh mới chỉ làm quen với xác suất cổ điển của những trò chơi đơn giản: Tung một đồng xu, gieo một con xúc xắc. Nhưng cuộc đời thực tế không bao giờ là những hành động cô lập đơn lẻ!

Chúng ta đưa ra quyết định dựa trên *chuỗi các sự kiện nối tiếp nhau*: Nếu trời mưa THÌ đường trơn, NẾU đường trơn THÌ dễ kẹt xe, NẾU kẹt xe THÌ trễ giờ làm... Làm thế nào để toán học hóa sự đan xen phức tạp giữa các biến cố?

Đó chính là lúc *Quy tắc Nhân, Quy tắc Cộng và Khái niệm Biến cố Độc lập* bước lên vũ đài để giải phóng nhận thức của học sinh khỏi những chiếc bẫy trực giác chết người!

#story-box(
  title: "Đêm đen Monte Carlo 1913 & Chiếc bẫy tâm lý 'Sai lầm của Con bạc'",
  author: "Sự kiện lịch sử có thật tại Casino de Monte-Carlo (Monaco, 18/08/1913)",
)[
  Vào đêm ngày 18 tháng 8 năm 1913, tại sòng bạc xa hoa bậc nhất thế giới Monte Carlo ở xứ Monaco, một sự kiện hiếm thấy trong lịch sử xác suất đã xảy ra tại bàn quay Roulette:
  
  Quả bóng nhỏ rơi vào ô màu đen. 
  Lần quay thứ hai: Lại là ô đen! 
  Lần quay thứ ba, thứ tư, thứ năm... vẫn liên tục là ô đen!
  
  Đám đông người chơi bắt đầu tụ tập quanh bàn quay, mắt sáng rực. Họ thì thầm với nhau: *"Không thể nào! Đã ra đen 10 lần liên tiếp rồi, theo luật cân bằng của tự nhiên, lần tiếp theo CHẮC CHẮN PHẢI LÀ Ô ĐỎ!"* Hàng nghìn Franc được ném vào cửa đỏ. 
  
  Nhưng quả bóng lại rơi vào ô đen! Lần thứ 15: Vẫn đen! Đám đông càng điên cuồng vay mượn tiền bạc, ném toàn bộ gia tài vào ô đỏ vì tin rằng xác suất ra đỏ lúc này đã lên tới $99,999%$!
  
  Kết quả là: Bàn quay tiếp tục rơi vào ô đen đến lần thứ... 26 liên tiếp! Hàng trăm triệu Franc biến mất trong chớp mắt, nhiều quý tộc và thương gia phá sản ngay tại bàn chơi, thậm chí có người đã tự sát trong đêm đó!
  
  Họ đã phạm phải một sai lầm nhận thức kinh điển trong toán học gọi là *"Sai lầm của Con bạc" (Gambler's Fallacy)*: 
  Mỗi vòng quay Roulette là một *BIẾN CỐ HOÀN TOÀN ĐỘC LẬP*! Chiếc bàn quay vô tri không có bộ não, nó không nhớ được vòng trước vừa ra màu gì! Dù 25 lần trước đều là màu đen, thì ở lần quay thứ 26, xác suất rơi vào ô đen hay đỏ VẪN CHÍNH XÁC LÀ $1/2$! Khái niệm Biến cố độc lập của Toán 11 chính là liều thuốc giải độc duy nhất bảo vệ con người khỏi những ảo tưởng chết người của tâm lý học đám đông!
]

#hook-box(title: "Nghịch lý Xét nghiệm Y khoa: 99% chính xác sao tôi chỉ có 9% mắc bệnh?")[
  Thầy bước vào lớp, nét mặt nghiêm nghị kể một câu chuyện tình huống:
  *“Một căn bệnh truyền nhiễm hiếm gặp trong xã hội có tỷ lệ mắc bệnh là $1/1.000$ (tức chỉ có $0,1\%$ dân số mắc).*
  
  *Một viện nghiên cứu chế tạo ra một bộ Kit xét nghiệm rất tân tiến với độ chính xác $99\%$:*
  - Nếu một người THẬT SỰ CÓ BỆNH, bộ kit sẽ báo 'DƯƠNG TÍNH' với xác suất $99\%$.
  - Nếu một người HOÀN TOÀN KHỎE MẠNH, bộ kit sẽ báo 'ÂM TÍNH' với xác suất $99\%$ (chỉ có $1\%$ báo dương tính giả).
  
  *Giả sử một ngày đẹp trời, bạn Nam đi khám sức khỏe tổng quát và nhận được kết quả: 'DƯƠNG TÍNH'!*
  *Nam khóc nức nở, gọi điện cho người thân vì tin rằng mình có $99\%$ khả năng đã mắc căn bệnh nguy hiểm.*
  
  *Thầy hỏi cả lớp: Theo các em, xác suất thực sự để Nam mắc bệnh có phải là $99\%$ không?”*
  
  Toàn bộ học sinh đều đồng thanh: *"Dạ máy chính xác $99\%$ thì chắc chắn $99\%$ là dính bệnh rồi thầy ơi!"*
  
  Thầy mỉm cười:
  *“Hãy bình tĩnh! Hãy cùng thầy làm một phép toán của Lớp 11 cho một mẫu $100.000$ người dân:*
  - Trong $100.000$ người, vì tỷ lệ bệnh là $0,1\%$, nên chỉ có đúng $100$ người có bệnh, và có tới $99.900$ người khỏe mạnh!
  - Bây giờ đưa cả $100.000$ người đi xét nghiệm:
    * Nhóm $100$ người có bệnh: Máy báo đúng $99\%$, tức có $99$ người dương tính thật!
    * Nhóm $99.900$ người khỏe mạnh: Máy báo nhầm $1\%$, tức có:
    $ 99.900 times 1% = 999 "người dương tính GIẢ"! $
  - Tổng số người nhận kết quả 'DƯƠNG TÍNH' là:
  $ 99 + 999 = 1.098 "người"! $
  - Trong số $1.098$ người cầm tờ giấy dương tính đó, số người THỰC SỰ MẮC BỆNH chỉ là $99$ người!
  - Vậy xác suất để Nam thực sự mang mầm bệnh chỉ là:
  $ P = 99 / 1.098 approx 9,01%! $
  
  *Hơn $90\%$ những người nhận kết quả dương tính thực ra HOÀN TOÀN KHỎE MẠNH!*
  *Nam không hề phải tuyệt vọng! Đó chính là sức mạnh kỳ diệu của ĐỊNH LÝ BAYES: Nó lật ngược góc nhìn, tính toán xác suất nguyên nhân từ kết quả thực tế, cứu rỗi hàng triệu con người khỏi nỗi sợ hãi vô căn cứ!”*
]

== BÀI 31: XÁC SUẤT CÓ ĐIỀU KIỆN, CÔNG THỨC XÁC SUẤT TOÀN PHẦN & ĐỊNH LÝ BAYES

Công thức Bayes là một trong những công thức toán học có sức ảnh hưởng lớn nhất mọi thời đại:
$ P(A | B) = (P(B | A) dot P(A)) / (P(B)) $

Nó đại diện cho một *triết lý học hỏi liên tục*: Niềm tin ban đầu của chúng ta về một sự việc là $P(A)$ (Xác suất tiên nghiệm - Prior). Khi có một bằng chứng mới $B$ xuất hiện, chúng ta cập nhật lại niềm tin của mình thành $P(A | B)$ (Xác suất hậu nghiệm - Posterior). Người thông minh không phải là người cố chấp với quan điểm cũ, mà là người liên tục cập nhật xác suất tư duy theo định lý Bayes!

#story-box(
  title: "Mục sư Thomas Bayes & Bức thư tuyệt mệnh làm rung chuyển khoa học",
  author: "Mục sư Thomas Bayes (1701 – 1761) & Richard Price (1723 – 1791)",
)[
  *Thomas Bayes* là một mục sư người Anh sống một cuộc đời vô cùng kín tiếng. Ông không phải là một giáo sư đại học danh tiếng, mà dành phần lớn thời gian rảnh rỗi tại ngôi làng Tunbridge Wells để suy ngẫm về bài toán: Làm thế nào để suy đoán nguyên nhân từ những hệ quả quan sát được?
  
  Năm 1761, khi Bayes qua đời, người bạn thân của ông là nhà triết học Richard Price đã tìm thấy trong tập tài liệu để lại một bài luận chưa xuất bản. Price nhận ra ngay giá trị thiên tài của tư tưởng này: Bayes đã tìm ra cách đảo ngược xác suất! Năm 1763, Price đã đọc bài luận này trước Hội Hoàng gia London.
  
  Hơn 10 năm sau, nhà toán học Pháp lừng danh *Pierre-Simon Laplace* đã độc lập tái khám phá và phát biểu nó dưới dạng công thức toán học hoàn chỉnh mà chúng ta dùng ngày nay. Trong Thế chiến II, thiên tài *Alan Turing* đã dùng chính phương pháp xác suất Bayes này để giải mã cỗ máy mật mã Enigma của Đức Quốc xã, cứu sống hàng triệu sinh mạng và rút ngắn cuộc chiến tranh đẫm máu tới 2 năm!
]

#tech-box(title: "Thuật toán Lọc Thư rác Naive Bayes của Gmail & AI Chuẩn đoán Y khoa")[
  1. *Bộ lọc Spam Naive Bayes của Google Gmail:*
  Mỗi ngày có hàng tỷ email được gửi đi trên toàn cầu. Làm sao hòm thư Gmail biết được một email nào đó là "Spam" để ném vào thùng rác mà không cần người đọc trộm thư của bạn?
  
  Gmail sử dụng *Bộ phân loại Naive Bayes (Naive Bayes Classifier)*:
  - Máy tính phân tích tần suất xuất hiện của các từ khóa nhạy cảm: "Trúng thưởng", "Chuyển khoản ngay", "Tỷ phú", "Xổ số"...
  - Với mỗi email mới đến, thuật toán tính xác suất:
  $ P("Spam" | "Từ ngữ trong thư") = (P("Từ ngữ" | "Spam") dot P("Spam")) / (P("Từ ngữ")) $
  - Nếu xác suất này vượt quá $95\%$, bức thư sẽ tự động bị chuyển vào thư mục Spam!
  
  2. *Xe tự hành Tesla & Trí tuệ Nhân tạo:*
  Khi xe tự hành di chuyển trong trời mưa tầm tã, camera bị mờ, radar bị nhiễu sóng. Xe nhìn thấy một bóng đen mờ ảo phía trước. Nó có phải là người đi bộ sang đường không?
  Xe tự hành liên tục dùng Định lý Bayes để cập nhật: Xác suất đây là người đi bộ dựa trên tốc độ di chuyển, hình dạng và phản xạ cảm biến. Định lý Bayes lớp 11 chính là bộ não định hướng sự an toàn của các phương tiện tự hành tương lai!
]

#misconception-box(title: "Cái bẫy Xung khắc vs Độc lập & 'Nghịch lý Công tố viên'")[
  1. *Nhầm lẫn tai hại giữa Biến cố Xung khắc và Biến cố Độc lập:*
  Có tới hơn một nửa học sinh nghĩ rằng: "Hai biến cố độc lập thì không liên quan gì đến nhau, tức là chúng xung khắc nhau ($A inter B = emptyset$)!".
  
  Sự thật hoàn toàn ngược lại:
    - Hai biến cố *Xung khắc* ($A inter B = emptyset$) là hai biến cố PHỤ THUỘC NHAU CHẶT CHẼ NHẤT! Nếu biến cố $A$ đã xảy ra thì biến cố $B$ CHẮC CHẮN KHÔNG THỂ XẢY RA ($P(B|A) = 0$)!
    - Hai biến cố *Độc lập* là việc $A$ xảy ra hay không HOÀN TOÀN KHÔNG ẢNH HƯỞNG gì đến xác suất của $B$ ($P(B|A) = P(B)$)!
  
  2. *Nghịch lý Công tố viên (Prosecutor's Fallacy):*
  Trong một vụ án hình sự, công tố viên lập luận trước tòa: "Mẫu ADN tại hiện trường trùng khớp với bị cáo. Xác suất một người ngẫu nhiên trùng ADN chỉ là 1 phần 1 triệu ($0,0001\%$). Do đó, có $99,9999\%$ khả năng bị cáo là kẻ giết người!".
  - Công tố viên đã đánh tráo khái niệm: Đánh đồng $P("Trùng ADN" | "Vô tội")$ với $P("Vô tội" | "Trùng ADN")$! Trong một thành phố 10 triệu dân, có tới 10 người có ADN trùng khớp! Nếu không có chứng cứ ngoại phạm khác, xác suất bị cáo là hung thủ chỉ là $1/10 = 10\%$, còn $90\%$ khả năng là người vô tội bị oan sai!
]

#dialogue-box(title: "Cập nhật Niềm tin: Bài toán Hai Chiếc Hộp Bí ẩn")[
  *Thầy:* “Trên bàn thầy có 2 chiếc hộp giống hệt nhau:\
  - Hộp 1: Chứa 9 viên bi ĐỎ và 1 viên bi XANH.\
  - Hộp 2: Chứa 1 viên bi ĐỎ và 9 viên bi XANH.\
  Thầy bịt mắt chọn ngẫu nhiên 1 chiếc hộp. Xác suất thầy chọn trúng Hộp 1 là bao nhiêu?”\
  *Học sinh:* “Dạ 50/50 ạ ($P(H_1) = 0,5$)!”\
  *Thầy:* “Bây giờ, từ chiếc hộp đã chọn, thầy thò tay bốc ra được một viên bi ĐỎ!\
  Thầy hỏi: Sau khi nhìn thấy viên bi đỏ, xác suất chiếc hộp thầy đang cầm là Hộp 1 tăng lên hay giảm đi?”\
  *Học sinh:* “Dạ chắc chắn tăng vọt lên ạ, vì Hộp 1 có nhiều bi đỏ hơn!”\
  *Thầy:* “Tăng lên bao nhiêu? Hãy dùng Công thức Bayes:\
  $ P(H_1 | "Đỏ") = (P("Đỏ" | H_1) dot P(H_1)) / (P("Đỏ")) = (0.9 times 0.5) / (0.9 times 0.5 + 0.1 times 0.5) = 0.45 / 0.50 = 90%! $\
  Xác suất đã tăng từ $50%$ ban đầu lên tới $90%$!\
  Đó chính là tư duy Bayes: Chúng ta bắt đầu bằng một niềm tin ban đầu ($50%$), nhưng khi bằng chứng mới xuất hiện (viên bi đỏ), chúng ta không cố chấp mà lập tức cập nhật lại niềm tin của mình thành $90%$!”
]

#deep-dive-box(title: "Xác suất Bayes vs Xác suất Tần suất: Cuộc chiến Triết học Lớn nhất")[
  Trong giới Toán học và Khoa học Dữ liệu, có hai trường phái tư tưởng xác suất đối đầu nhau suốt hơn một thế kỷ:
  
  1. *Trường phái Tần suất (Frequentist):*
  Coi xác suất là tần số xuất hiện của một sự kiện khi làm thí nghiệm lặp đi lặp lại vô hạn lần (như tung đồng xu hàng triệu lần). Hạn chế: Nó không thể tính xác suất cho những sự kiện chỉ xảy ra một lần trong đời (như: "Xác suất ngày mai Trái Đất bị thiên thạch đâm trúng là bao nhiêu?").
  
  2. *Trường phái Bayes (Bayesian):*
  Coi xác suất là *Mức độ tin tưởng (Degree of Belief)* của con người dựa trên thông tin hiện có. Khi có thông tin mới, ta cập nhật lại niềm tin!
  
  Ngày nay, trường phái Bayes đã hoàn toàn thắng thế trong cuộc cách mạng Trí tuệ Nhân tạo (Machine Learning, Deep Learning, Mạng Bayes). Khái niệm Xác suất có điều kiện và Công thức Bayes lớp 11 chính là nền tảng triết học sâu xa nhất của toàn bộ nền khoa học nhận thức thế kỷ XXI!
]

#inquiry-box(title: "Mô Phỏng Luật Số Lớn Bằng 100.000 Đồng Xu Ảo & Tư Duy Phản Biện Kahneman")[
  Dành cho các em học sinh đam mê Tâm lý học Nhận thức, Trí tuệ Nhân tạo và Khoa học Quyết định:
  
  1. *Thử thách Lập trình: Kiểm chứng Luật Số Lớn (Law of Large Numbers) với 100.000 Phép thử:*
  - Tại sao các sòng bạc lớn ở Las Vegas hay Macau không bao giờ sợ bị phá sản, dù thỉnh thoảng vẫn có người chơi trúng độc đắc hàng triệu USD?
  - Hãy kiểm chứng bí mật này bằng 6 dòng mã Python:
  ```python
  import random
  for N in [10, 100, 1000, 100000]:
      heads = sum(random.choice([0, 1]) for _ in range(N))
      print(f"Số lần tung N = {N:6d} | Tỷ lệ mặt ngửa: {heads/N:.4f}")
  ```
  - *Kết quả quan sát:* Khi $N = 10$, tỷ lệ ngửa có thể là $0.7000$ hoặc $0.3000$ (chao đảo dữ dội). Nhưng khi $N = 100.000$, tỷ lệ lập tức ghìm chặt về $0.5002$! Với hàng triệu lượt chơi mỗi năm, sòng bạc chắc chắn nắm chắc phần thắng hàng tỷ USD trong tay nhờ Định lý Bernoulli!
  
  2. *Dự án Tư duy: Vẽ Cây Xác suất Bẻ gãy Bẫy Dương tính Giả (False Positive):*
  - Một bệnh hiếm gặp có tỷ lệ mắc $1/1.000$ ($0.1\%$). Một xét nghiệm có độ chính xác $99\%$.
  - Nếu một người nhận kết quả DƯƠNG TÍNH, xác suất thực sự bị bệnh của người đó là bao nhiêu?
  - Hãy vẽ một sơ đồ cây với mẫu $100.000$ người:
    + Người có bệnh: $100$ người $arrow$ Xét nghiệm dương tính: $99$ người.
    + Người khỏe mạnh: $99.900$ người $arrow$ Xét nghiệm dương tính giả ($1\%$): $999$ người!
    + Tổng số người dương tính: $99 + 999 = 1.098$ người.
    + Xác suất thực tế bị bệnh: $P = 99 / 1.098 approx 9\%$!
  - Hơn $90\%$ người nhận kết quả dương tính thực chất HOÀN TOÀN KHỎE MẠNH! Tư duy xác suất Bayes giúp chúng ta giữ vững sự bình tĩnh và đưa ra quyết định sáng suốt trước những tin tức gây hoảng loạn!
  
  3. *Sách kinh điển gợi ý tìm đọc:*
  - *"Thinking, Fast and Slow"* (Tư duy Nhanh và Chậm) — GS. Daniel Kahneman (Giải Nobel Kinh tế 2002 — Cuốn sách vạch trần mọi ảo giác nhận thức của trực giác con người).
  - *"The Signal and the Noise: Why So Many Predictions Fail — but Some Don't"* — Nate Silver.
]

#story-box(
  title: "Nghịch Lý Ngày Sinh Nhật (Birthday Paradox): Cú Lừa Trực Giác Lớn Nhất Của Bộ Não",
  author: "Richard von Mises (Áo, 1883 – 1953) & Ứng Dụng Mật Mã Học Hiện Đại",
)[
  Thầy giáo bước vào một lớp học có 30 học sinh và tuyên bố: *“Thầy cá cược 1 triệu đồng rằng trong lớp chúng ta, có ít nhất hai bạn sinh cùng ngày cùng tháng!”*.
  
  Cả lớp reo hò nhận cược vì ai cũng nghĩ: Một năm có tới 365 ngày, lớp chỉ có 30 bạn, xác suất trùng chắc chỉ được vài phần trăm ($30 / 365 approx 8\%$), thầy chắc chắn thua trắng tay!
  
  Nhưng khi kiểm tra ngày sinh, cả lớp sững sờ: Có đúng hai bạn cùng sinh ngày 15 tháng 10!
  
  *Giải mã toán học bằng Xác suất biến cố đối lớp 11:*
  - Bộ não con người nhầm lẫn vì so sánh ngày sinh của một người với 29 người còn lại. Nhưng bài toán hỏi: *CÓ BẤT KỲ CẶP NÀO TRÙNG NHAU KHÔNG!*
  - Số cặp đối sánh giữa 30 học sinh là tổ hợp: $C_(30)^2 = (30 times 29) / 2 = 435$ CẶP ĐỐI SÁNH!
  - Xác suất để 30 bạn hoàn toàn KHÁNG NHAU (không ai trùng ngày sinh với ai) là:
  $ P(bar(A)) = 365/365 times 364/365 times 363/365 times ... times (365 - 29)/365 approx 0.2937 $
  - Xác suất có ít nhất 2 bạn trùng ngày sinh là biến cố đối:
  $ P(A) = 1 - P(bar(A)) = 1 - 0.2937 = 0.7063 approx 70.63\%! $
  
  Chỉ cần một lớp có *23 HỌC SINH* là xác suất trùng ngày sinh đã vượt quá $50\%$ ($50.7\%$), và với 30 học sinh xác suất lên tới hơn $70\%$! Ngày nay, nghịch lý này là nguyên lý cốt lõi của *Tấn công Sinh nhật (Birthday Attack)* mà các hacker sử dụng để tìm kiếm xung đột mã băm trong an ninh mạng và tiền mã hóa Blockchain!
]

#story-box(
  title: "Chevalier de Méré & Lá Thư Mùa Hè 1654 Khai Sinh Lý Thuyết Xác Suất",
  author: "Chevalier de Méré (1607 – 1684), Blaise Pascal (1623 – 1662) & Pierre de Fermat (1607 – 1665)",
)[
  Mùa hè năm 1654, một quý tộc kiêm tay cờ bạc lão luyện người Pháp tên là *Chevalier de Méré* đã gửi một bức thư cầu cứu tới nhà toán học thiên tài *Blaise Pascal* về một bế tắc cờ bạc:
  *Bài toán Chia tiền cược (Problem of Points):*
  - Hai đấu thủ $A$ và $B$ mỗi người góp 32 đồng tiền vàng vào một ván cờ cược, ai thắng trước 3 ván sẽ giành toàn bộ 64 đồng tiền vàng.
  - Khi đấu thủ $A$ đã thắng 2 ván, đấu thủ $B$ mới thắng 1 ván, thì trò chơi buộc phải dừng lại đột ngột vì lệnh cấm cờ bạc của nhà vua!
  - Câu hỏi nhức nhối: *Làm thế nào để chia 64 đồng tiền vàng một cách công bằng nhất giữa hai đấu thủ?*
  
  Nhiều người đề xuất chia theo tỷ số $2:1$ (dựa trên quá khứ). Nhưng Pascal và Pierre de Fermat trao đổi thư từ đã nhận ra một chân lý vĩ đại:
  *Tiền cược phải được chia dựa trên XÁC SUẤT CHIẾN THẮNG TRONG TƯƠNG LAI, chứ không phải quá khứ!*
  - Nếu chơi tiếp tối đa 2 ván nữa, không gian mẫu có 4 khả năng bình đẳng: $(A, A), (A, B), (B, A), (B, B)$.
  - Đấu thủ $A$ chỉ cần thắng 1 ván nữa là ẵm giải $arrow$ Thắng trong 3 trường hợp đầu! Xác suất thắng là $3/4$.
  - Đấu thủ $B$ phải thắng liên tiếp cả 2 ván $arrow$ Chỉ thắng trong 1 trường hợp cuối $(B, B)$! Xác suất thắng là $1/4$.
  - Do đó, số tiền phải chia công bằng tuyệt đối: Đấu thủ $A$ nhận $64 times 3/4 = 48$ đồng vàng, đấu thủ $B$ nhận $64 times 1/4 = 16$ đồng vàng!
  
  Những lá thư qua lại giữa Pascal và Fermat trong mùa hè năm 1654 đó đã chính thức đưa Lý thuyết Xác suất từ những sòng bạc đen tối bước lên vũ đài của nền khoa học nhân loại!
]

#story-box(
  title: "Nghịch Lý Bertrand (1889): Ba Đáp Số Khác Nhau Cho Cùng Một Bài Toán Xác Suất",
  author: "Joseph Bertrand (Pháp, 1822 – 1900), Viện Hàn Lâm Khoa Học Pháp",
)[
  Năm 1889, nhà toán học Pháp Joseph Bertrand đã công bố một nghịch lý làm chấn động toàn bộ giới giải tích xác suất:
  *“Cho một đường tròn tâm O và một tam giác đều nội tiếp. Nếu ta vẽ NGẪU NHIÊN một dây cung của đường tròn, hỏi xác suất để dây cung đó DÀI HƠN CẠNH CỦA TAM GIÁC ĐỀU là bao nhiêu?”*
  
  Bertrand đưa ra 3 cách suy luận hình học hoàn toàn chuẩn xác nhưng lại cho ra 3 ĐÁP SỐ KHÁC NHAU HOÀN TOÀN:
  
  1. *Phương pháp 1 (Chọn ngẫu nhiên 2 đầu mút trên đường tròn):*
  Cố định một đầu mút tại một đỉnh tam giác đều. Đầu mút thứ hai rơi ngẫu nhiên trên chu vi. Dây cung sẽ dài hơn cạnh tam giác đều nếu đầu mút thứ hai rơi vào cung đối diện (chiếm $1/3$ chu vi).
  $ P_1 = 1/3! $
  
  2. *Phương pháp 2 (Chọn ngẫu nhiên bán kính và khoảng cách từ tâm):*
  Dây cung vuông góc với bán kính sẽ dài hơn cạnh tam giác đều nếu khoảng cách từ tâm đến dây cung nhỏ hơn $R/2$. Vì khoảng cách chọn ngẫu nhiên trong đoạn $[0, R]$, nên:
  $ P_2 = (R/2) / R = 1/2! $
  
  3. *Phương pháp 3 (Chọn ngẫu nhiên trung điểm dây cung bên trong hình tròn):*
  Dây cung dài hơn cạnh tam giác đều khi và chỉ khi trung điểm của nó nằm bên trong đường tròn đồng tâm bán kính $R/2$. Tỷ số diện tích là:
  $ P_3 = (pi (R/2)^2) / (pi R^2) = 1/4! $
  
  *Ba đáp số $1/3, 1/2, 1/4$ — đâu là sự thật?*
  Bertrand đã dạy cho nhân loại một bài học nhận thức tối thượng: Khái niệm *"chọn ngẫu nhiên"* là hoàn toàn vô nghĩa nếu ta không định nghĩa chính xác và minh bạch *Không gian mẫu và Phép đo xác suất*! Đây chính là động lực thúc đẩy Andrey Kolmogorov xây dựng hệ tiên đề xác suất hiện đại năm 1933!
]

#story-box(
  title: "Alan Turing, Bletchley Park & Thuật Toán Banburismus Bẻ Khóa Enigma",
  author: "Alan Turing (1912 – 1954) & Các Nhà Mật Mã Học Bletchley Park",
)[
  Trong những năm đen tối nhất của Thế chiến II (1940 – 1941), các biên đội tàu ngầm U-boat của Đức Quốc Xã hoành hành khắp Đại Tây Dương, đánh chìm hàng triệu tấn tàu hàng tiếp tế của phe Đồng minh. Mọi mệnh lệnh tác chiến của Hải quân Đức đều được mã hóa bằng cỗ máy *Enigma* tối mật có $158$ tỷ tỷ khả năng cấu hình!
  
  Tại khu căn cứ bí mật Bletchley Park ở miền quê nước Anh, nhà toán học thiên tài *Alan Turing* không cố gắng giải mã theo kiểu "thử và sai" vô vọng. Ông đã phát minh ra một kỹ thuật mang tên *Banburismus*, vận hành hoàn toàn dựa trên *Xác suất có điều kiện Bayes*:
  
  - Turing so sánh hai chuỗi ký tự mật mã và đếm số lượng ký tự trùng nhau tại các khoảng trễ khác nhau.
  - Ông phát minh ra đơn vị thông tin *Ban* và *Deciban* (dựa trên Logarit cơ số 10 của tỷ số xác suất có điều kiện Bayes) để đo lường *Trọng số bằng chứng (Weight of Evidence)*:
  $ W = log_(10) (P("Dữ liệu" | "Giả thuyết đúng") / P("Dữ liệu" | "Giả thuyết sai")) $
  - Mỗi khi một bức điện mới xuất hiện, Turing cộng dồn các giá trị Deciban vào giả thuyết. Khi tổng số Deciban vượt qua ngưỡng an toàn, cỗ máy giải mã điện cơ *Bombe* sẽ lập tức khóa chặt vị trí các trục quay Enigma!
  
  Chiến công bẻ khóa Enigma bằng Xác suất Bayes của Alan Turing được các sử gia quân sự đánh giá là đã rút ngắn Thế chiến II ít nhất 2 năm và cứu sống hơn *14 TRIỆU SINH MẠNG* con người! Xác suất có điều kiện không phải là một bài toán chia phân số vô cảm — nó là vũ khí trí tuệ đã giải cứu nền văn minh nhân loại thoát khỏi thảm họa diệt chủng phát xít!
]

#tech-box(title: "Bộ Lọc Thư Rác Naive Bayes Trong Hộp Thư Gmail & Outlook")[
  Mỗi ngày có hơn 300 tỷ email được gửi đi trên toàn cầu, trong đó gần $50\%$ là thư rác lừa đảo (Spam/Phishing). Làm thế nào các kỹ sư Google có thể tự động chặn $99.9\%$ thư rác trước khi chúng lọt vào mắt bạn?
  
  Họ sử dụng *Thuật toán Phân loại Naive Bayes (Thơ ngây)*:
  - Cho một email chứa tập hợp các từ khóa $W = {w_1, w_2, dots, w_n}$ (như "trúng thưởng", "viagra", "chuyển khoản", "bấm vào đây").
  - Xác suất email là thư rác ($S$) có điều kiện xuất hiện các từ $W$ được tính theo Định lý Bayes:
  $ P(S | w_1, dots, w_n) = (P(S) dot P(w_1, dots, w_n | S)) / (P(w_1, dots, w_n)) $
  - Giả định "thơ ngây" (Naive): Các từ xuất hiện độc lập có điều kiện với nhau:
  $ P(w_1, dots, w_n | S) = P(w_1 | S) dot P(w_2 | S) dots P(w_n | S) $
  
  Mỗi khi người dùng bấm nút "Báo cáo thư rác", AI sẽ lập tức cập nhật lại các xác suất có điều kiện $P(w_i | S)$. Chỉ bằng công thức nhân xác suất độc lập và xác suất có điều kiện lớp 11, một cỗ máy đã có thể tự động nhận biết đâu là bức thư tình cảm động và đâu là trò lừa đảo tinh vi!
]

#story-box(
  title: "Siméon Poisson & Binh Lính Phổ Bị Ngựa Đá: Quy Luật Thần Kỳ Của Các Biến Cố Cực Hiếm",
  author: "Siméon Denis Poisson (1781 – 1840) & Ladislaus Bortkiewicz (1898)",
)[
  Năm 1898, nhà kinh tế học kiêm thống kê học Ladislaus Bortkiewicz đã thu thập một bảng dữ liệu kỳ lạ kéo dài suốt 20 năm (1875 – 1894) của 14 quân đoàn kỵ binh tinh nhuệ Phổ: Số lượng binh lính tử vong hàng năm do... bị ngựa đá vào đầu!
  
  Mỗi năm, trong một quân đoàn có hàng nghìn binh lính và hàng nghìn con ngựa, nhưng tai nạn ngựa đá chết người chỉ xảy ra 0, 1, 2 hoặc hiếm hoi là 3 ca. Đây là một *Biến Cố Cực Hiếm*: Số phép thử $n$ rất lớn, nhưng xác suất xảy ra $p$ lại cực kỳ nhỏ!
  
  Khi áp dụng *Phân Phối Poisson* — giới hạn của phân phối nhị thức khi $n arrow infinity$ và $p arrow 0$ sao cho tích số $lambda = n p$ không đổi:
  $ P(X = k) = (lambda^k e^(-lambda)) / (k!) $
  Bortkiewicz kinh ngạc phát hiện ra rằng số ca tử vong thực tế khớp chính xác đến từng số thập phân với dự báo lý thuyết của Poisson!
  
  Ngày nay, phân phối Poisson và xác suất biến cố hiếm là công cụ sống còn để:
  - Các kỹ sư nhà máy điện hạt nhân tính toán xác suất xảy ra sự cố rò rỉ phóng xạ ($< 10^(-6)$).
  - Các nhà mạng viễn thông Viettel, Vinaphone tính toán số lượng cuộc gọi đồng thời đến tổng đài để không bị nghẽn mạng vào đêm Giao thừa.
  - Các hãng hàng không Boeing và Airbus kiểm soát nguy cơ hỏng hóc động cơ máy bay trên mỗi triệu giờ bay an toàn!
]

#tech-box(title: "Mạng Niềm Tin Bayes (Bayesian Belief Networks): Bộ Não Suy Luận Của Xe Tự Lái")[
  Trong thế giới thực, một biến cố không chỉ đứng đơn độc. Khi một chiếc xe tự hành Tesla đang chạy trên đường cao tốc lúc trời mưa:
  - Radar báo có vật cản phía trước (độ tin cậy $92\%$).
  - Camera thị giác máy tính lại báo đường thông thoáng (độ tin cậy $85\%$).
  - Cảm biến LiDAR báo có chướng ngại vật mờ ảo (độ tin cậy $60\%$).
  
  Chiếc xe phải phanh gấp hay tiếp tục phóng đi? Nếu phanh gấp nhầm, xe phía sau sẽ đâm vào đuôi; nếu không phanh mà có chướng ngại vật thật, tai nạn thảm khốc sẽ xảy ra!
  
  Hệ thống lái tự động dùng *Mạng Niềm Tin Bayes (Bayesian Belief Network - BBN)*:
  - Mô hình hóa mối quan hệ nhân quả giữa các biến số dưới dạng một Đồ thị có hướng phi chu trình (DAG).
  - Áp dụng Định lý Bayes nhiều chiều để liên tục tổng hợp các nguồn thông tin bất định, cập nhật phân phối xác suất hậu nghiệm của biến cố: "Có chướng ngại vật thực sự trên đường hay không?".
  - Khi xác suất vượt qua ngưỡng rủi ro an toàn ($> 75\%$), máy tính sẽ kích hoạt phanh khẩn cấp trong vòng 0.05 giây!
  
  Toàn bộ cuộc cách mạng xe tự hành thế giới đang vận hành dựa trên công thức xác suất Bayes lớp 11 mà các em đang học ngày hôm nay!
]

#pagebreak()
'''


