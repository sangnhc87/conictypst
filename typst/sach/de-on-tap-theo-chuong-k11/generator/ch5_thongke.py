# -*- coding: utf-8 -*-

CONTENT = r'''= ĐẠI CHƯƠNG V: KHOA HỌC DỮ LIỆU & BỨC TRANH XÃ HỘI — THỐNG KÊ MẪU SỐ LIỆU GHÉP NHÓM

#text(size: 9.5pt, style: "italic", fill: rgb("475569"))[
  Nội dung tương ứng: Toàn bộ Bài 15, Bài 16 SGK Toán 11 cùng Chuyên đề Vén màn sự thật dữ liệu: Cuộc đối đầu giữa Số trung bình và Trung vị trong Khoa học Dữ liệu (Data Science).
]

== BÀI 15 & 16: MẪU SỐ LIỆU GHÉP NHÓM, TRUNG VỊ & TỨ PHÂN VỊ

Trong thời đại số hóa, chúng ta không còn làm việc với vài chục con số đơn lẻ của một lớp học 40 học sinh nữa! Một trang thương mại điện tử như Shopee hay Amazon có hàng trăm triệu giao dịch mỗi ngày; Tổng cục Thống kê phải thu thập dữ liệu thu nhập của 100 triệu dân Việt Nam.

Làm thế nào để xử lý một biển dữ liệu khổng lồ như vậy? Không ai có thể liệt kê từng con số riêng rẽ ra giấy! Nhân loại buộc phải gom chúng lại thành từng khoảng, từng nhóm — đó chính là sự ra đời tất yếu của *Mẫu số liệu ghép nhóm (Grouped Data)*! 

Và ở đây, một bài toán triết học sâu sắc xuất hiện: *Con số nào mới thực sự đại diện cho tiếng nói trung thực của cả một tập thể?*

#story-box(
  title: "Florence Nightingale, Karl Pearson & Biểu đồ thống kê cứu sống hàng vạn sinh mạng",
  author: "Florence Nightingale (1820 – 1910) & Karl Pearson (1857 – 1936)",
)[
  Nhiều người chỉ biết đến *Florence Nightingale* như một nữ y tá giàu lòng nhân ái với biệt danh "Người phụ nữ với cây đèn". Nhưng trong lịch sử khoa học, bà là một trong những nhà Thống kê học vĩ đại nhất của nhân loại, người phụ nữ đầu tiên được bầu vào Viện Thống kê Hoàng gia Anh!
  
  Năm 1854, khi sang chiến trường Crimea để chăm sóc thương binh Anh, bà chứng kiến các chiến sĩ tử vong hàng loạt trong các bệnh viện dã chiến. Các tướng lĩnh quân đội khăng khăng cho rằng binh sĩ chết vì đạn pháo và vết thương ngoài mặt trận. Nhưng Nightingale linh cảm có điều gì đó không đúng!
  
  Bà đã tỉ mỉ thu thập dữ liệu tử vong của hàng vạn binh sĩ, ghép nhóm dữ liệu theo từng tháng và theo từng nguyên nhân tử vong: Chết vì vết thương chiến đấu, chết vì bệnh truyền nhiễm do môi trường ô nhiễm, và các nguyên nhân khác. 
  
  Để thuyết phục Quốc hội và Nữ hoàng Anh — những người không rành về toán học — bà đã sáng tạo ra một loại biểu đồ ghép nhóm độc nhất vô nhị mang tên *Biểu đồ Hoa hồng (Rose Diagram / Polar Area Diagram)*. Khi nhìn vào biểu đồ, người ta giật mình kinh hoàng: Các cánh hoa màu xanh đại diện cho số người chết vì dịch bệnh truyền nhiễm (thương hàn, dịch tả, kiết lỵ) TO GẤP MƯỜI LẦN các cánh hoa màu đỏ đại diện cho người chết vì bom đạn ngoài mặt trận!
  
  Biểu đồ thống kê của bà đã đánh sụp hoàn toàn sự bảo thủ của giới tướng lĩnh, buộc chính phủ Anh phải cải tổ toàn bộ hệ thống thoát nước, khử trùng và thông gió bệnh viện. Nhờ đó, tỷ lệ tử vong giảm từ $42%$ xuống chỉ còn $2%$, cứu sống hàng vạn binh lính! 
  
  Vài thập kỷ sau, *Karl Pearson* — cha đẻ của ngành thống kê toán hiện đại — đã chuẩn hóa việc biểu diễn dữ liệu ghép nhóm bằng phát minh ra *Biểu đồ cột tần số (Histogram)*, đặt nền móng cho toàn bộ môn Khoa học Dữ liệu (Data Science) và Học máy (Machine Learning) ngày nay!
]

#hook-box(title: "Khi tỷ phú Bill Gates bước vào quán bar: Kẻ nói dối Số Trung Bình")[
  Thầy bắt đầu tiết học bằng một câu chuyện giả định hài hước:
  *“Hãy tưởng tượng trong một quán bia ven đường có 10 người khách đang ngồi uống nước. Họ là những người lao động bình thường, mỗi người có thu nhập khoảng 10 triệu đồng/tháng.*
  
  - Thu nhập trung bình của quán bia lúc này là bao nhiêu?
  $ bar(x) = (10 times 10) / 10 = 10 "triệu đồng/tháng"! $
  
  *Đột nhiên, cửa quán mở toang: Tỷ phú Bill Gates bước vào quán uống một lon nước ngọt! Thu nhập của Bill Gates là khoảng 100 TỶ ĐỒNG mỗi tháng.*
  
  *Bây giờ, hãy tính lại thu nhập trung bình của 11 người trong quán:*
  $ bar(x)_(m o i) = (10 times 10 "triệu" + 100.000 "triệu") / 11 approx 9.091 "triệu đồng" approx 9,1 "TỶ ĐỒNG/THÁNG"! $
  
  Thầy nhìn cả lớp:
  *“Nếu một phóng viên báo chí bước vào quán và giật tít: 'Thu nhập bình quân của người dân trong quán bia này đạt mức 9 tỷ đồng mỗi tháng', điều đó có đúng về mặt toán học không?”*
  Học sinh: *"Dạ đúng theo công thức số trung bình thầy ạ!"*
  
  Thầy: *“Nhưng điều đó có phản ánh đúng thực tế đời sống của 10 người khách kia không? Họ có giàu lên thành tỷ phú không, hay họ vẫn phải chắt chiu từng đồng trả tiền bia?”*
  Học sinh: *"Dạ không hề, họ vẫn nghèo như cũ ạ!"*
  
  Thầy: *“Chính xác! Đó là lý do tại sao các nhà khoa học dữ liệu gọi Số Trung Bình ($bar(x)$) là 'KẺ NÓI DÕI SIÊU HẠNG' khi dữ liệu có chứa các giá trị ngoại lai (Outliers) cực lớn hoặc cực nhỏ!*
  
  *Để biết mức thu nhập thực sự của đa số người dân, chúng ta KHÔNG ĐƯỢC DÙNG SỐ TRUNG BÌNH, mà phải dùng TRUNG VỊ ($M_e$) và TỨ PHÂN VỊ ($Q_1, Q_2, Q_3$)!*
  - Trung vị của quán bia vẫn là 10 triệu đồng/tháng — không hề bị Bill Gates làm lung lay!
  *Học thống kê lớp 11 không phải để cộng trừ nhân chia những con số vô hồn, mà là để trang bị tấm khiên tư duy phản biện, giúp các em không bao giờ bị các con số thống kê giả dối trên mạng xã hội hay truyền thông dắt mũi!”*
]

#tech-box(title: "Thuật toán Đo lường Bất bình đẳng (Chỉ số Gini) & Phân khúc Khách hàng AI")[
  Trong kinh tế học vĩ mô và Khoa học Dữ liệu, các số đặc trưng của mẫu ghép nhóm lớp 11 là công cụ định lượng cốt lõi:
  
  1. *Chỉ số Gini & Đường cong Lorenz (Ngân hàng Thế giới - World Bank):*
  Để đánh giá khoảng cách giàu nghèo của một quốc gia, người ta chia toàn bộ dân số thành các nhóm thu nhập từ thấp đến cao (thường dùng Ngũ phân vị hoặc Thập phân vị). Tỷ lệ diện tích giữa *Đường cong Lorenz* và đường bình đẳng tuyệt đối chính là *Hệ số Gini* ($G in [0; 1]$). Nếu $G > 0,4$, quốc gia đó đang ở ngưỡng báo động về bất bình đẳng xã hội!
  
  2. *Phân khúc Người dùng (Customer Segmentation) trong E-commerce:*
  Các thuật toán AI của Shopee, TikTok, Netflix không bao giờ đối xử với mọi khách hàng như nhau. Chúng chia hành vi người dùng (thời gian xem video, số tiền chi tiêu) thành các nhóm ghép nhóm. 
  - Người dùng thuộc nhóm dưới $Q_1$ (nhóm chi tiêu thấp): AI sẽ gửi mã giảm giá Free-ship để kích cầu.
  - Người dùng thuộc nhóm trên $Q_3$ (khách hàng VIP): AI sẽ ưu tiên gợi ý các mặt hàng cao cấp, dịch vụ chăm sóc riêng biệt.
  
  Toàn bộ các chiến lược kinh doanh nghìn tỷ USD đó đều vận hành trên nền tảng của các ngưỡng Tứ phân vị mà các em đang học trong trang sách này!
]

#misconception-box(title: "Nghịch lý Simpson: Khi các con số thống kê 'nói dối trâng tráo'")[
  Một trong những nghịch lý rúng động nhất của Thống kê học là *Nghịch lý Simpson (Simpson's Paradox)*:
  - Một phương pháp điều trị $A$ có tỷ lệ khỏi bệnh cao hơn phương pháp $B$ trong nhóm bệnh nhân nặng.
  - Phương pháp $A$ CŨNG CÓ tỷ lệ khỏi bệnh cao hơn phương pháp $B$ trong nhóm bệnh nhân nhẹ.
  - Nhưng khi gộp chung toàn bộ bệnh nhân lại, tỷ lệ khỏi bệnh của phương pháp $A$ lại... THẤP HƠN phương pháp $B$!
  
  *Nguyên nhân:* Do sự phân bổ số lượng mẫu ghép nhóm không đồng đều giữa hai nhóm! Bác sĩ thường ưu tiên dùng phương pháp $A$ cho những ca bệnh thập tử nhất sinh, khiến tỷ lệ tử vong tổng thể của $A$ bị kéo tụt xuống!
  
  *Bài học sư phạm sống còn:* Dữ liệu không bao giờ tự nói lên sự thật; chỉ có người hiểu rõ phương pháp ghép nhóm thống kê mới có thể giải mã được bức tranh thật đằng sau những báo cáo số liệu bề nổi!
]

#dialogue-box(title: "Tại sao hãng Zara sản xuất áo size M nhiều nhất mà không dùng Số Trung bình?")[
  *Thầy:* “Các em có bao giờ thắc mắc: Khi các hãng thời trang như Uniqlo, Zara, Nike may hàng triệu chiếc áo thun để bán cho người dân Việt Nam, họ dùng Số Trung bình hay dùng Mốt ($M_o$) của mẫu số liệu ghép nhóm chiều cao?”\
  *Học sinh:* “Dạ chắc tính chiều cao trung bình của người Việt rồi may áo theo chiều cao đó ạ!”\
  *Thầy:* “Nếu chiều cao trung bình của nam giới Việt Nam là $168$ cm. Một người cao $150$ cm và một người cao $186$ cm có chiều cao trung bình đúng bằng $168$ cm. Nếu hãng chỉ may áo size vừa khít $168$ cm, thì cả người $150$ cm lẫn người $186$ cm đều KHÔNG THỂ MẶC ĐƯỢC chiếc áo đó — hàng triệu chiếc áo sẽ bị ế mốc trong kho!”\
  *Học sinh:* “Ồ, vậy họ phải làm sao ạ?”\
  *Thầy:* “Họ chia dân số thành các nhóm ghép nhóm kích cỡ: Nhóm $S$, nhóm $M$, nhóm $L$, nhóm $X L$. Sau đó họ tìm MỐT ($M_o$) — nhóm kích cỡ có số lượng người mua đông đảo nhất (thường là size $M$) — để tập trung $60\%$ công suất nhà máy sản xuất size $M$! Mốt chính là vị vua định đoạt doanh số bán hàng trong ngành công nghiệp may mặc toàn cầu!”
]

#deep-dive-box(title: "Từ Mẫu Ghép nhóm đến Thuật toán Phân cụm K-Means trong Big Data")[
  Trong kỷ nguyên dữ liệu lớn (Big Data), mẫu số liệu ghép nhóm không chỉ dừng lại ở 1 chiều (một biến số $x$). Các thuật toán AI phải phân nhóm dữ liệu trên không gian hàng trăm chiều:
  - *Thuật toán K-Means Clustering:*
  Tự động tìm ra $k$ điểm trung tâm (Centroids) để gom hàng triệu khách hàng vào $k$ nhóm có khoảng cách phương sai nội nhóm nhỏ nhất:
  $ arg min_(bold(S)) sum_(i=1)^k sum_(bold(x) in S_i) ||bold(x) - bold(mu)_i||^2 $
  
  Ý tưởng chia khoảng ghép nhóm của lớp 11 chính là tiền thân trực tiếp của toàn bộ các hệ thống phân loại dữ liệu tự động trong các siêu máy chủ Google, Facebook và Amazon ngày nay!
]

#inquiry-box(title: "Dự Án Khảo Sát Thời Gian Dùng Màn Hình & Trực Quan Hóa Bằng Biểu Đồ Hộp")[
  Dành cho các em học sinh yêu thích Khoa học Dữ liệu (Data Science) và Xã hội học:
  
  1. *Dự án Nghiên cứu Thực địa: Khảo sát Thời gian Sử dụng Smartphone của Học sinh:*
  - Hãy tạo một biểu mẫu Google Forms khảo sát ẩn danh 40 - 50 bạn học trong trường về *Số giờ bật màn hình điện thoại (Screen Time)* trong ngày hôm qua.
  - Thu thập dữ liệu thô và chia thành 5 nhóm ghép nhóm: $[0; 2)$, $[2; 4)$, $[4; 6)$, $[6; 8)$, $[8; 12)$ (đơn vị: giờ).
  - Áp dụng công thức Thống kê lớp 11 để tính:
    + Số trung bình ghép nhóm $bar(x)$.
    + Trung vị ghép nhóm $M_e$.
    + Mốt ghép nhóm $M_o$.
    + Tứ phân vị $Q_1, Q_3$ và khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$.
  - *So sánh và đối chiếu:* Tính trực tiếp các giá trị này từ tập dữ liệu thô ban đầu (chưa ghép nhóm) và xem sai số giữa phương pháp ghép nhóm và dữ liệu thô là bao nhiêu phần trăm. Các em sẽ hiểu sâu sắc tại sao gom nhóm dữ liệu lớn lại là một bước đánh đổi thông minh giữa tốc độ và độ chính xác!
  
  2. *Thử thách Lập trình Python Data Science: Vẽ Biểu Đồ Hộp (Boxplot):*
  - Chỉ với 5 dòng mã Python sử dụng thư viện `seaborn` và `matplotlib`:
  ```python
  import seaborn as sns
  import matplotlib.pyplot as plt
  data = [1.5, 2.0, 3.2, 4.5, 5.0, 6.2, 7.8, 11.5] # Dữ liệu khảo sát
  sns.boxplot(y=data, color="skyblue")
  plt.title("Biểu đồ Hộp Tứ phân vị Screen Time")
  plt.show()
  ```
  - Biểu đồ hộp sẽ trực quan hóa ngay lập tức: Chiếc hộp thể hiện khoảng $50\%$ số học sinh ở vùng giữa ($Q_1$ đến $Q_3$), đường vạch ngang giữa hộp là Trung vị $M_e$, và những dấu chấm đơn lẻ nằm tít trên cao chính là *Điểm ngoại lai (Outliers)* — những bạn "nghiện điện thoại" bất thường cần được cảnh báo!
  
  3. *Sách kinh điển gợi ý tìm đọc:*
  - *"How to Lie with Statistics"* (Cách bóp méo sự thật bằng Thống kê) — Darrell Huff (Cuốn sách kinh điển giúp học sinh rèn luyện tư duy phản biện sắc bén, không bao giờ bị các biểu đồ lừa bịp trên mạng xã hội dắt mũi).
  - *"Naked Statistics: Stripping the Dread from the Data"* — Charles Wheelan.
]

#story-box(
  title: "Abraham Wald & Thiên Kiến Sống Sót: Bài Học Thống Kê Vĩ Đại Giải Cứu Phi Đội Ném Bom Thế Chiến II",
  author: "Abraham Wald (1902 – 1950), Nhóm Nghiên Cứu Thống Kê Quân Sự (SRG) Đại Học Columbia",
)[
  Trong Thế chiến II, quân đội Đồng Minh chịu tổn thất nặng nề khi hàng trăm máy bay ném bom B-17 Flying Fortress bị pháo phòng không Đức bắn hạ trên bầu trời châu Âu. Bộ Chỉ huy Quân sự Mỹ quyết định phải bọc thêm giáp thép cho máy bay. Nhưng bọc giáp quá nặng sẽ khiến máy bay tốn nhiên liệu và không chở được bom, vì vậy họ chỉ có thể bọc giáp ở một vài vị trí trọng yếu nhất.
  
  Các sĩ quan quân đội đã thu thập dữ liệu thống kê của hàng trăm chiếc máy bay may mắn sống sót trở về căn cứ. Kết quả ghép nhóm vị trí lỗ đạn cho thấy:
  - Cánh máy bay: Trung bình $1.30$ vết đạn trên mỗi feet vuông.
  - Thân máy bay: $1.73$ vết đạn.
  - Đuôi máy bay: $1.55$ vết đạn.
  - Động cơ máy bay: Chỉ có $0.50$ vết đạn!
  
  Các tướng lĩnh lập tức kết luận: *"Cánh và thân máy bay là nơi hứng chịu nhiều đạn nhất, vì vậy chúng ta phải bọc giáp dày nhất vào cánh và thân!"*.
  
  Nhưng nhà toán học và thống kê học gốc Do Thái *Abraham Wald* đã bước ra và tuyên bố dứt khoát:
  *“Không! Các ngài hoàn toàn sai lầm! Chỗ mà các ngài bắt buộc phải bọc giáp dày nhất chính là ĐỘNG CƠ — nơi hầu như KHÔNG CÓ VẾT ĐẠN NÀO TRONG BẢNG THỐNG KÊ!”*
  
  Các tướng lĩnh sững sờ: *"Tại sao lại bọc giáp vào nơi không bị bắn?"*.
  
  Wald mỉm cười cay đắng chỉ ra lỗ hổng tư duy chết người:
  *“Các ngài chỉ đang thống kê trên NHỮNG CHIẾC MÁY BAY SỐNG SÓT TRỞ VỀ!*
  - Đạn pháo phòng không bắn ngẫu nhiên lên toàn bộ máy bay.
  - Máy bay bị bắn vào cánh và thân vẫn có thể lết về được căn cứ để các ngài đếm lỗ đạn.
  - Còn những chiếc máy bay không may bị bắn trúng ĐỘNG CƠ thì đã NỔ TUNG VÀ RƠI XUỐNG BIỂN, chúng không bao giờ có cơ hội trở về để lọt vào mẫu dữ liệu thống kê của các ngài!”
  
  Phát hiện thiên tài của Wald về *Thiên Kiến Sống Sót (Survivorship Bias)* đã cứu mạng hàng vạn phi công Mỹ. Đó là lời nhắc nhở sâu sắc nhất về Thống kê: *Mẫu số liệu mà bạn đang nhìn thấy chưa chắc đã là toàn bộ sự thật — hãy luôn tự hỏi những dữ liệu nào đã bị biến mất trước khi được đưa vào bảng thống kê!*
]

#tech-box(title: "John Tukey & Biểu Đồ Hộp (Boxplot): Công Cụ Vàng Phát Hiện Gian Lận Thẻ Tín Dụng AI")[
  - Năm 1977, nhà thống kê học huyền thoại John Tukey (người phát minh ra thuật toán FFT và từ "Bit") đã sáng tạo ra *Biểu đồ Hộp (Boxplot / Box-and-Whisker Plot)* dựa trên Tứ phân vị lớp 11:
  - Chiếc hộp trung tâm chứa $50\%$ dữ liệu ở giữa, từ $Q_1$ đến $Q_3$. Khoảng trải dài của hộp gọi là *Khoảng tứ phân vị*:
  $ "IQR" = Q_3 - Q_1 $
  - Tukey đưa ra "Hàng rào thép" để nhận diện gian lận: Bất kỳ giao dịch tài chính nào nằm ngoài khoảng $[Q_1 - 1.5 times "IQR", space Q_3 + 1.5 times "IQR"]$ đều bị gắn cờ là *Điểm Ngoại Lai (Outlier)*!
  - Ngày nay, các hệ thống phòng chống gian lận của Visa, Mastercard và Momo xử lý hàng triệu giao dịch mỗi giây bằng thuật toán Boxplot: Nếu bạn thường chi tiêu từ 50.000đ ($Q_1$) đến 500.000đ ($Q_3$), đột nhiên có một giao dịch 50 triệu đồng vào lúc 3 giờ sáng, AI sẽ lập tức chặn giao dịch và gửi tin nhắn cảnh báo vì vượt ngưỡng ngoại lai Tukey!
]

#story-box(
  title: "Bẫy Ngụy Biện Nguy Hiểm: 'Tương Quan Không Đồng Nghĩa Với Nhân Quả' (Correlation != Causation)",
  author: "Karl Pearson (1857 – 1936) & Những Bài Học Cảnh Giác Với Dữ Liệu",
)[
  Một tờ báo lớn giật tít trang nhất: *“Nghiên cứu chấn động: Ăn kem làm tăng nguy cơ chết đuối!”*.
  Tác giả bài báo đưa ra một biểu đồ thống kê thu thập từ 100 thành phố ven biển: Khi doanh số bán kem que tăng lên, số người tử vong vì đuối nước cũng tăng vọt theo một đường thẳng tắp với hệ số tương quan $r = 0.98$!
  
  Rất nhiều người hoang mang vứt bỏ kem que và cấm con cái ăn kem. Nhưng đó là một trò cười ngụy biện thống kê ngớ ngẩn nhất lịch sử!
  
  Cả hai biến số "doanh số bán kem" và "số vụ chết đuối" đều chịu sự chi phối của một *Biến Ẩn Thứ Ba (Confounding Variable)*: Đó chính là *THỜI TIẾT MÙA HÈ NẮNG NÓNG*!
  - Khi trời nắng nóng $arrow$ Người dân đi ăn kem nhiều hơn.
  - Khi trời nắng nóng $arrow$ Người dân đổ xô ra biển, sông hồ bơi lội nhiều hơn $arrow$ Số vụ đuối nước tăng lên!
  
  Hai hiện tượng cùng xảy ra không có nghĩa là cái này sinh ra cái kia! Một nhà khoa học dữ liệu đích thực luôn phải đặt câu hỏi phản biện: *Liệu có một biến số thứ ba nào đang đứng trong bóng tối giật dây cả hai hiện tượng này hay không?*
]

#hook-box(title: "Nghịch Lý P-Hacking: Khi Các Nhà Khoa Học 'Tra Tấn' Dữ Liệu Đến Khi Nó Khai Ra Điều Họ Muốn")[
  Thầy bước vào lớp, cầm một tờ báo y khoa giật gân:
  *“Các em có tin rằng: Ăn kẹo dẻo màu xanh lá cây gây ra bệnh mụn trứng cá với độ tin cậy $95\%$?”*
  
  Năm 2010, một tác giả webcomic nổi tiếng (xkcd) đã vẽ một bức tranh châm biếm kinh điển:
  - Một nhóm nghiên cứu thử nghiệm xem ăn kẹo dẻo jelly bean có gây mụn không. Kết quả: Không tìm thấy mối liên hệ nào ($p > 0.05$).
  - Thay vì dừng lại, họ bắt đầu thử nghiệm *từng màu sắc riêng biệt*: Kẹo màu đỏ, màu xanh dương, màu vàng, màu tím... tổng cộng 20 màu sắc khác nhau!
  - Theo lý thuyết xác suất, khi bạn kiểm định 20 giả thuyết độc lập ở ngưỡng ý nghĩa $5\%$ ($alpha = 0.05$), xác suất có *ít nhất một kết quả dương tính giả ngẫu nhiên* là:
  $ P = 1 - (1 - 0.05)^(20) = 1 - (0.95)^(20) approx 64.15\%! $
  - Đúng như dự đoán toán học: Kẹo màu xanh lá cây ngẫu nhiên rơi vào ngưỡng $p < 0.05$!
  - Ngay hôm sau, báo chí giật tít: *“Khoa học đã chứng minh: Kẹo dẻo xanh lá cây gây mụn trứng cá!”*.
  
  Hiện tượng này trong Khoa học Dữ liệu gọi là *P-Hacking (Thao túng giá trị p)* hoặc *Data Dredging (Nạo vét dữ liệu)*: Nếu bạn tra tấn dữ liệu đủ lâu, nó sẽ thú nhận bất kỳ điều gì bạn muốn nghe! Thống kê lớp 11 dạy chúng ta lòng trung thực khoa học tối thượng trước những cám dỗ ngụy tạo kết quả!
]

#deep-dive-box(title: "Vụ Kiện Kỳ Lạ Của ĐH UC Berkeley 1973: Đỉnh Cao Của Nghịch Lý Simpson")[
  Mùa thu năm 1973, Trường Đại học California tại Berkeley (UC Berkeley) — một trong những viện đại học danh tiếng nhất nước Mỹ — đối mặt với một vụ kiện tụng chấn động: Tỷ lệ trúng tuyển sau đại học của nam giới ($44\%$) cao hơn đáng kể so với nữ giới ($35\%$). Ban giám hiệu bị cáo buộc phân biệt đối xử giới tính một cách có hệ thống!
  
  Lo sợ bị cắt ngân sách liên bang, trường đại học đã mời nhà thống kê học lỗi lạc *Peter Bickel* vào cuộc thanh tra từng khoa đào tạo. Khi Bickel phân rã mẫu dữ liệu thành các nhóm khoa độc lập (ghép nhóm theo chuyên ngành), một sự thật kinh ngạc phơi bày:
  - Ở hầu hết các khoa lớn (Khoa A, B, C, D), tỷ lệ trúng tuyển của NỮ GIỚI đều CAO HƠN hoặc TƯƠNG ĐƯƠNG nam giới!
  - Không có bất kỳ khoa nào thể hiện sự thiên vị nam giới!
  
  *Tại sao khi gộp toàn bộ trường lại thì nam giới lại có tỷ lệ trúng tuyển vượt trội?*
  
  Bickel phát hiện ra "Biến ẩn ghép nhóm":
  - Nữ giới có xu hướng nộp đơn ồ ạt vào các ngành thuộc khối Khoa học Xã hội và Nhân văn (như Văn học, Tâm lý học, Lịch sử) — những ngành có chỉ tiêu tuyển sinh cực kỳ hạn hẹp và tỷ lệ chọi khốc liệt (tỷ lệ trúng tuyển chung chỉ dưới $10\%$).
  - Trong khi đó, nam giới lại nộp đơn áp đảo vào các ngành Kỹ thuật, Hóa học và Máy tính — những ngành được đầu tư ngân sách khổng lồ với chỉ tiêu tuyển sinh rộng mở (tỷ lệ trúng tuyển chung lên tới $60\% - 80\%$)!
  
  *Kết luận của Tòa án:* Trường đại học không hề phân biệt giới tính trong tuyển sinh. Nghịch lý Simpson xuất hiện đơn thuần vì sự phân bổ không đồng đều về quy mô giữa các nhóm ghép nhóm. Bài học rút ra cho mọi nhà nghiên cứu dữ liệu: Trước khi kết luận một xu hướng tổng thể, bắt buộc phải phân rã dữ liệu thành các phân tầng (Stratified Groups) để tránh rơi vào cạm bẫy thiên lệch!
]

#tech-box(title: "Thuật Toán T-Digest & HyperLogLog: Tính Phân Vị Cho Hàng Tỷ Người Dùng Thời Gian Thực")[
  Khi bạn gõ một từ khóa tìm kiếm trên Google, hệ thống phải trả về kết quả trong vòng 0.2 giây. Để đảm bảo chất lượng dịch vụ (SLA), các kỹ sư giám sát phân vị thứ 99 ($P_(99)$) và phân vị thứ 99.9 ($P_(99.9)$) của độ trễ (latency). 
  
  Nếu độ trễ trung bình là 50 mili-giây nhưng $P_(99)$ vọt lên 3 giây, nghĩa là cứ 100 người dùng thì có 1 người phải chờ đợi trong ức chế!
  
  Nhưng với 10 tỷ lượt truy vấn mỗi ngày, làm sao máy chủ có thể sắp xếp 10 tỷ con số để tìm Tứ phân vị hay Phân vị? Bộ nhớ RAM sẽ cạn kiệt ngay lập tức!
  
  - *Thuật toán T-Digest (Ted Dunning):*
    Thay vì lưu trữ toàn bộ dữ liệu, thuật toán nén dòng dữ liệu liên tục thành một tập hợp vài trăm cụm (Centroids) ghép nhóm động. Các cụm ở hai đầu biên (phần trăm rất thấp hoặc rất cao như $P_(0.1)$ và $P_(99.9)$) được co lại cực kỳ tinh mịn, cho phép ước lượng chính xác phân vị với sai số dưới $0.01\%$ mà chỉ tốn vài kilobyte bộ nhớ!
  - *Ứng dụng thực tế:* Toàn bộ các nền tảng công nghệ xử lý dữ liệu lớn như ElasticSearch, Prometheus, ClickHouse và Apache Pinot đều sử dụng T-Digest để tính toán Tứ phân vị lớp 11 trong từng phần nghìn giây!
]

#inquiry-box(title: "Dự Án Nghiên Cứu: Giải Mã Phổ Điểm Thi THPT & Phát Hiện Gian Lận Điểm Bằng Thống Kê")[
  Dành cho học sinh đam mê Khoa học Dữ liệu Xã hội và Trí tuệ Nhân tạo:
  
  1. *Phân tích phổ điểm thi chuẩn:*
  Điểm thi của một kỳ thi quy mô 1 triệu thí sinh (như kỳ thi Tốt nghiệp THPT Quốc gia) trong điều kiện tự nhiên luôn tuân theo *Phân phối chuẩn hình chuông (Gaussian Normal Distribution)*. 
  - Đỉnh của chuông tập trung quanh điểm Trung vị ($M_e$) và Số trung bình ($bar(x)$) trong khoảng từ 5.5 đến 6.5 điểm.
  - Số lượng thí sinh đạt điểm cao suy giảm mượt mà theo hàm mũ khi tiến về điểm 9 và điểm 10 (thuộc nhóm trên $Q_3 + 1.5 times "IQR"$).
  
  2. *Vén màn bí mật gian lận thi cử năm 2018 dưới lăng kính Thống kê:*
  Năm 2018, các chuyên gia dữ liệu độc lập phát hiện ra sự bất thường chấn động tại phổ điểm thi môn Toán và Vật lý của một số địa phương:
  - Trong khi cả nước có tỷ lệ thí sinh đạt điểm từ 9 trở lên chỉ là $0.1\%$, thì tại một tỉnh miền núi, tỷ lệ này vọt lên cao gấp hàng chục lần một cách phi lý!
  - Biểu đồ cột tần số (Histogram) của tỉnh này không có dạng hình chuông liên tục, mà xuất hiện một *khối u nhọn kỳ dị (Bimodal Distribution)* ở dải điểm từ 8.5 đến 9.8 điểm!
  - Sự đứt gãy đột ngột của quy luật phân vị và khoảng tứ phân vị là bằng chứng toán học đanh thép đầu tiên kích hoạt cuộc điều tra của Bộ Giáo dục và Bộ Công an, đưa những kẻ sửa điểm vào vòng lao lý!
  
  3. *Thử thách thực nghiệm Python:*
  Tải dữ liệu điểm thi công khai (được ẩn danh) về máy tính, viết chương trình tính $Q_1, M_e, Q_3, "IQR"$, vẽ biểu đồ Boxplot bằng thư viện `matplotlib` và `seaborn`, phát hiện các giá trị ngoại lai ở từng môn học. Toán học không nằm trên trang giấy vô tri — nó là ngọn đuốc công lý soi sáng sự minh bạch của xã hội!
]

#story-box(
  title: "Ronald Fisher & 'Người Phụ Nữ Nếm Trà': Khởi Nguồn Của Phép Thử Thống Kê Giả Thuyết",
  author: "Sir Ronald Aylmer Fisher (1890 – 1962), Cha Đẻ Ngành Thống Kê Hiện Đại",
)[
  Vào một buổi chiều mùa hè thập niên 1920 tại trạm nghiên cứu nông nghiệp Rothamsted (Anh), các nhà khoa học ngồi uống trà chiều thư giãn. Nữ tiến sĩ tảo học Muriel Bristol bỗng từ chối tách trà vừa được rót và nói:
  *“Tôi chỉ thích uống trà nếu sữa được rót vào tách trước rồi mới đổ trà vào sau. Tôi có thể nếm và nhận ra ngay sự khác biệt!”*
  
  Mọi người trong phòng đều cười ồ lên và cho rằng điều đó hoàn toàn vô lý: Trà và sữa khi đã hòa tan vào nhau thì thành phần hóa học y hệt nhau, làm sao lưỡi người phân biệt được thứ tự rót!
  
  Nhưng nhà thống kê học trẻ tuổi *Ronald Fisher* không cười. Ông nhìn thấy trong lời tuyên bố ấy một *Bài toán Kiểm định Thống kê Tuyệt mỹ*:
  - Làm thế nào để chứng minh bằng toán học rằng người phụ nữ này thực sự có vị giác siêu phàm chứ không phải đoán mò may rủi?
  
  Fisher chuẩn bị đúng 8 tách trà hoàn toàn giống nhau về hình thức:
  - 4 tách được rót *sữa trước, trà sau*.
  - 4 tách được rót *trà trước, sữa sau*.
  - 8 tách được đánh số ngẫu nhiên và đưa cho bà Bristol nếm thử. Nhiệm vụ của bà là chọn ra đúng 4 tách được rót sữa trước.
  
  *Phân tích tổ hợp và xác suất lớp 11:*
  - Số cách chọn 4 tách từ 8 tách là tổ hợp: $C_8^4 = (8 times 7 times 6 times 5) / (4 times 3 times 2 times 1) = 70$ CÁCH!
  - Nếu bà Bristol chỉ đoán mò ngẫu nhiên (Giả thuyết không $H_0$), thì xác suất để bà đoán trúng toàn bộ 4 tách chỉ là:
  $ P = 1 / 70 approx 0.0143 approx 1.43\%! $
  
  Bà Bristol nếm từng tách trà một cách từ tốn... và trước sự sững sờ nghẹt thở của tất cả các giáo sư có mặt trong phòng, BÀ ĐÃ ĐOÁN ĐÚNG TUYỆT ĐỐI CẢ 4 TÁCH TRÀ!
  
  Vì xác suất đoán mò chỉ là $1.43\%$ (nhỏ hơn ngưỡng ý nghĩa $5\%$), Fisher tuyên bố bác bỏ giả thuyết đoán mò: Bà Bristol thực sự có khả năng phân biệt thứ tự rót trà!
  Từ buổi tiệc trà chiều lịch sử đó, Fisher đã xây dựng nên toàn bộ *Lý thuyết Kiểm định Giả thuyết (Hypothesis Testing)* và khái niệm *p-value* — công cụ đang thẩm định mọi loại vắc-xin y tế và thuật toán AI trên toàn thế giới ngày nay!
]

#tech-box(title: "Thuật Toán Bootstrapping (Bradley Efron 1979): Phép Màu Tái Sinh Dữ Liệu AI")[
  Trong thực tế, việc thu thập dữ liệu ghép nhóm vô cùng tốn kém và mất thời gian: Bạn chỉ có một mẫu khảo sát nhỏ gồm 50 bệnh nhân hoặc 100 giao dịch. Làm thế nào để ước lượng độ tin cậy của Trung vị hay Phân vị mà không cần phải tốn thêm hàng tỷ đồng đi thu thập thêm dữ liệu?
  
  Năm 1979, nhà thống kê học Đại học Stanford *Bradley Efron* đã phát minh ra *Phương pháp Bootstrapping (Tự kéo quai ủng)*:
  1. Coi mẫu dữ liệu gồm $N$ phần tử ban đầu như một "vũ trụ thu nhỏ".
  2. Máy tính thực hiện *Lấy mẫu có hoàn lại (Resampling with replacement)* $N$ lần từ tập dữ liệu đó để tạo ra một "mẫu giả lập mới" (Pseudo-sample).
  3. Lặp lại quá trình lấy mẫu ngẫu nhiên này $B = 10.000$ lần trên máy tính!
  4. Trên mỗi mẫu giả lập, tính Trung vị $M_e^*$ và Khoảng tứ phân vị $"IQR"^*$.
  
  Nhờ tốc độ siêu tốc của máy tính, từ một mẫu nhỏ đơn độc ban đầu, Bootstrapping tạo ra phân phối mẫu của trung vị với độ chính xác kinh ngạc mà không cần bất kỳ giả định toán học cứng nhắc nào! Thuật toán này là nền tảng của các mô hình học máy Ensemble đỉnh cao như *Random Forest* và *XGBoost* thống trị các cuộc thi AI Kaggle toàn cầu!
]

#pagebreak()
'''


