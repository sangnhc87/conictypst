#import "../_theme.typ": *

= PHẦN I — KHAI MỞ: TỪ DỮ LIỆU THÔ ĐẾN TƯ DUY THỐNG KÊ

== 1. Vì Sao Thống Kê Không Phải Là “Phần Dễ” Của Toán?

#why-box[
  Nhiều người học cảm thấy thống kê là phần nhẹ nhất: nhìn bảng, bấm công thức, xong. Cảm giác ấy xuất hiện khi ta chỉ thấy bề mặt tính toán.

  Ở tầng sâu hơn, thống kê là nghệ thuật đưa ra một bức tranh đáng tin từ thông tin luôn luôn thiếu, luôn luôn nhiễu, và hầu như không bao giờ hoàn hảo. Ta không nhìn cả dân số thành phố, chỉ nhìn một mẫu. Ta không nhớ từng số trong một bảng dài, chỉ giữ lại vài đại lượng trung tâm. Ta không ôm trọn từng giá trị đo, mà thường phải nén chúng vào nhóm.

  Vì thế, thống kê không chỉ hỏi "tính ra bao nhiêu". Nó hỏi: *ta đang đo cái gì, ta đang bỏ quên cái gì, và con số cuối cùng có thực sự trung thực với dữ liệu không?*
]

#vd-box("1", "Hai lớp cùng điểm trung bình 7.0 nhưng là hai thế giới khác nhau")[
  Hãy tưởng tượng lớp A có điểm số gần như dồn quanh $7$, còn lớp B có một nửa học sinh quanh $4$ và nửa còn lại quanh $10$. Cả hai lớp đều có thể có điểm trung bình bằng $7$.

  Nếu chỉ nhìn một con số trung bình, ta sẽ tưởng hai lớp giống nhau. Nhưng trực giác giáo dục nói ngay rằng chúng rất khác: lớp A khá đồng đều, còn lớp B bị phân cực mạnh.

  Đây là bài học mở đầu của cả quyển: *một đại lượng tóm tắt hiếm khi đủ để kể hết câu chuyện dữ liệu.*
]

#core-box[
  Từ đây nảy ra ba câu hỏi xương sống của thống kê phổ thông:

  - giá trị nào là điển hình,
  - dữ liệu phân tán tới đâu,
  - và hình dáng chung của phân bố trông như thế nào.

  Các công thức trung bình, trung vị, tứ phân vị, phương sai hay độ lệch chuẩn chỉ là những câu trả lời nén cho ba câu hỏi đó.
]

== 2. Dữ Liệu Thô Không Nói Gì Nếu Chưa Được Tổ Chức

#eye-box[
  Một danh sách dài các số thường trông như tiếng ồn. Khi ta sắp xếp, đếm lại, lập bảng tần số hay vẽ biểu đồ, dữ liệu bắt đầu lộ hình.

  Đây là bước đầu tiên mà học sinh lớp 10 thường gặp: biến một đám ghi chép rời rạc thành cấu trúc đủ sáng để mắt nhìn thấy xu hướng.
]

#vd-box("2", "Từ 30 thời gian đi học tới một bảng tần số dễ đọc")[
  Giả sử ta ghi được thời gian đi học của 30 bạn: có bạn mất 8 phút, 10 phút, 12 phút, 13 phút, dots Nếu cứ giữ nguyên dạng danh sách, rất khó trả lời nhanh câu hỏi "đa số học sinh mất khoảng bao lâu để đến trường?"

  Nhưng khi ta gom thành các mức như 0 đến 10 phút, 10 đến 20 phút, 20 đến 30 phút, rồi đếm tần số mỗi mức, bức tranh lập tức hiện ra. Dữ liệu không đổi. Cách tổ chức đổi. Và chính cách tổ chức làm nảy sinh hiểu biết.
]

#bridge-box("Từ bảng sang biểu đồ")[
  Bảng tần số là bước nén đầu tiên. Biểu đồ là bước chuyển từ con số sang hình ảnh. Một khi mắt nhìn thấy cột nào cao, vùng nào dày, lệch trái hay lệch phải, suy nghĩ thống kê bắt đầu bớt cơ học.
]

== 3. Trung Bình, Trung Vị, Mốt: Ba Tâm Điểm, Ba Câu Hỏi

#why-box[
  Thống kê phổ thông thường giới thiệu số trung bình, trung vị và mốt như ba công thức. Nhưng chúng đẹp hơn nhiều nếu ta xem chúng là ba cách trả lời ba câu hỏi hơi khác nhau về cái "điển hình".
]

#vd-box("3", "Một nhóm lương có một quản lý lương rất cao")[
  Hãy xét một nhóm 9 nhân viên nhận lương quanh 9 đến 12 triệu, và một quản lý nhận 80 triệu. Khi đó số trung bình bị kéo lên mạnh, còn trung vị gần như vẫn giữ nguyên ở vùng 10 đến 11 triệu.

  Nếu mục tiêu là mô tả "một nhân viên điển hình" trong nhóm ấy, trung vị trung thực hơn trung bình. Nếu mục tiêu là tính tổng quỹ lương bình quân trên đầu người, trung bình lại hữu ích hơn.

  Vậy không có con số nào "luôn đúng nhất". Có đại lượng phù hợp với câu hỏi ta đang hỏi.
]

#history-box("Quetelet và ý tưởng ‘con người trung bình’")[
  Adolphe Quetelet là một trong những người đầu tiên cố dùng ý tưởng trung bình để mô tả hiện tượng xã hội. Điều ông để lại không chỉ là một kỹ thuật tính, mà là một câu hỏi lớn: *một con số trung bình có thể đại diện cho con người thật đến mức nào?*
]

#essay-box("Một người học tốt thống kê phải luôn hỏi ngược")[
  Mỗi khi thấy ai đó nêu một số trung bình, ta nên hỏi tiếp: trung bình của cái gì, tính trên ai, có bị vài giá trị cực đoan kéo lệch không, và liệu trung vị hay mốt có kể câu chuyện khác không.
]

== 4. Tứ Phân Vị Và Boxplot: Hình Dáng Dữ Liệu Quan Trọng Không Kém Tâm

#eye-box[
  Nếu trung bình và trung vị cho ta biết dữ liệu tập quanh đâu, thì tứ phân vị và boxplot cho ta biết dữ liệu trải rộng như thế nào, phần giữa có chặt hay không, và có điểm bất thường ở biên hay không.
]

#vd-box("4", "Hai lớp cùng trung vị 6 giờ học nhưng độ ổn định khác nhau")[
  Giả sử cả lớp A và lớp B đều có trung vị thời gian tự học là 6 giờ mỗi tuần. Nhưng lớp A có phần giữa dữ liệu tập trung từ 5 đến 7 giờ, còn lớp B kéo dài từ 3 đến 9 giờ.

  Trung vị giống nhau, nhưng khoảng tứ phân vị khác nhau rất mạnh. Điều đó nói rằng 50% học sinh ở giữa của lớp A đồng đều hơn nhiều so với lớp B.
]

#core-box[
  Tư duy ở đây là:

  - trung vị cho vị trí trung tâm,
  - tứ phân vị cho cấu trúc phần giữa,
  - boxplot cho ta một ảnh chụp nhanh của tâm, độ trải, và ngoại lệ.

  Đó là lý do boxplot là một trong những biểu diễn thống kê gọn mà giàu thông tin nhất ở phổ thông.
]

== 5. Từ Lớp 10 Sang 11: Học Cách So Sánh, Không Chỉ Tính

#why-box[
  Một bước trưởng thành tự nhiên của người học là đi từ việc đọc một bảng số liệu sang so sánh hai bảng số liệu. Lúc này, thống kê thôi không còn là chuyện tính một đại lượng, mà là chuyện ra quyết định giữa hai nhóm, hai lớp, hai phương án.
]

#vd-box("5", "Lớp A hay lớp B dùng điện thoại ổn định hơn?")[
  Giả sử hai lớp đều có thời gian dùng điện thoại trung bình gần 2 giờ mỗi ngày. Nhưng lớp A có dữ liệu dồn khá gọn, còn lớp B có nhiều bạn gần như không dùng và nhiều bạn dùng quá 5 giờ.

  Nếu muốn hỏi lớp nào ổn định hơn, trung bình không còn là thước đo quyết định. Ta cần nhìn thêm khoảng tứ phân vị hay độ lệch chuẩn. Đây là chỗ học sinh bắt đầu cảm được rằng thống kê không phải “thêm công thức”, mà là chọn đúng công cụ cho đúng loại câu hỏi.
]

#meta-box[
  Chính ở bước so sánh này, tư duy thống kê bắt đầu giống tư duy thực tế hơn: không ai ra quyết định chỉ dựa vào một con số cô lập. Ta cần nhìn cả mức điển hình lẫn mức dao động.
]

== 6. Khi Dữ Liệu Quá Dày, Ta Bắt Đầu Ghép Nhóm

#why-box[
  Với một mẫu nhỏ, ta còn có thể nhìn từng giá trị. Nhưng khi dữ liệu gồm hàng chục, hàng trăm phép đo như chiều cao, cân nặng, điểm số, thời gian chờ, việc giữ nguyên từng số bắt đầu làm ta mù đi thay vì sáng ra.

  Đó là lý do thống kê lớp 12 đi vào *mẫu số liệu ghép nhóm*: thay vì mang từng giá trị, ta mang các khoảng và tần số của chúng.
]

#vd-box("6", "200 chiều cao học sinh không thể đọc từng số")[
  Nếu đo chiều cao của 200 học sinh, một danh sách 200 số sẽ rất khó nhớ. Nhưng khi gom thành các nhóm như $[150;155)$, $[155;160)$, $[160;165)$, dots rồi ghi tần số, ta đã đổi một đám dữ liệu rời rạc thành hình dáng chung của cả mẫu.

  Cái được là bức tranh lớn trở nên nhìn thấy. Cái mất là chi tiết từng cá thể biến mất. Tư duy thống kê trưởng thành chính là ý thức được cả *món lợi* lẫn *cái giá* của sự nén này.
]

#history-box("Galton, Pearson và sự ra đời của histogram")[
  Francis Galton và Karl Pearson giúp đưa nhiều ý tưởng thống kê hiện đại vào hình thức có thể đo, so sánh và trực quan hóa. Histogram, về tinh thần, là một trong những công cụ cho phép mắt người nhìn thấy cấu trúc của một phân bố lớn mà không cần ôm trọn từng điểm dữ liệu.
]

== 7. Giá Trị Đại Diện: Cái Giá Của Sự Nén

#vd-box("7", "Nhóm $[160;165)$ được thay bằng $162.5$ nghĩa là gì?")[
  Khi làm thống kê ghép nhóm, ta thường thay cả nhóm $[160;165)$ bằng trung điểm $162.5$ để tính trung bình hay phương sai. Điều này không có nghĩa mọi học sinh trong nhóm đều cao đúng $162.5$ cm.

  Nó chỉ có nghĩa: *nếu buộc phải thay cả một đoạn bằng một đại diện duy nhất để tính nhanh*, thì trung điểm là lựa chọn cân bằng nhất trong nhiều tình huống phổ thông.
]

#essay-box("Đây là một phép xấp xỉ có kiểm soát")[
  Học sinh thường bị cuốn vào công thức mà quên rằng thống kê ghép nhóm là thống kê *xấp xỉ*. Mỗi lần dùng giá trị đại diện, ta đang đổi độ chính xác vi mô lấy cái nhìn vĩ mô. Điều đó không sai. Nhưng phải luôn nhớ mình đang làm gì.
]

#link-box[
  Cùng một tinh thần này xuất hiện ở nhiều nơi khác của toán học: thay tổng vô cùng bằng tích phân, thay dữ liệu hỗn loạn bằng mô hình, thay vô số chi tiết bằng vài tham số. Thống kê là một trường học rất tốt để luyện năng lực nén thông tin mà không quên giá của sự nén.
]

== 8. Thống Kê Ghép Nhóm Lớp 12: Cùng Câu Hỏi Cũ, Nhưng Trên Dữ Liệu Đã Nén

#why-box[
  Điểm đẹp của thống kê ghép nhóm là: bản chất câu hỏi không đổi. Ta vẫn hỏi giá trị điển hình là gì, dữ liệu phân tán ra sao, có đồng đều hay không. Chỉ khác ở chỗ dữ liệu nay đã được nén thành các khoảng.
]

#workshop-box("Bốn câu hỏi cốt lõi khi gặp bảng ghép nhóm")[
  - Nhóm nào là vùng tập trung rõ nhất của dữ liệu?
  - Nếu muốn tìm giá trị điển hình, ta nên đi qua trung bình, trung vị hay mốt?
  - Nếu muốn so sánh độ ổn định, ta nhìn khoảng biến thiên, khoảng tứ phân vị hay độ lệch chuẩn?
  - Việc ghép nhóm đang giúp gì cho ta, và đang che mất chi tiết nào?
]

#vd-box("8", "Tìm nhanh lớp chứa trung vị trước khi bấm công thức")[
  Giả sử một bảng ghép nhóm có tần số tích lũy lần lượt là $6, 14, 27, 40, 50$. Nếu cỡ mẫu là $50$, thì vị trí trung vị nằm quanh $n/2 = 25$.

  Thay vì lao ngay vào công thức, điều đầu tiên cần làm là đọc bảng: giá trị $25$ rơi vào đâu trong dãy tần số tích lũy? Vì $14 < 25 <= 27$, nhóm thứ ba là nhóm chứa trung vị.

  Công thức chỉ đến *sau khi* trực giác đọc đúng bảng.
]

#core-box[
  Đây là một nguyên tắc cực quan trọng cho toàn bộ phần lớp 12: *mọi công thức nội suy đều phải được đặt sau một bước đọc cấu trúc*. Nếu đọc sai nhóm chứa đại lượng cần tìm, mọi phép tính phía sau sẽ trật ngay từ gốc.
]

== 9. Độ Phân Tán: Không Phải Chỉ Có Một Thước Đo

#why-box[
  Khi người học gặp khoảng biến thiên, khoảng tứ phân vị, phương sai và độ lệch chuẩn, cảm giác thường là: sao lại nhiều thước đo thế? Câu trả lời là vì chúng đo những khía cạnh khác nhau của cùng một ý tưởng: độ rộng của dữ liệu.
]

#vd-box("9", "Hai lớp cùng trung bình 7.0 nhưng độ lệch chuẩn khác nhau")[
  Hãy tưởng tượng lớp A có điểm chủ yếu từ 6 đến 8, còn lớp B trải từ 2 đến 10. Cả hai có thể vẫn cùng trung bình 7.0.

  Lúc này khoảng biến thiên của lớp B lớn hơn, độ lệch chuẩn của lớp B cũng lớn hơn, và boxplot của lớp B sẽ loang rộng hơn rõ rệt. Các thước đo ấy cùng chỉ về một trực giác chung: dữ liệu lớp B kém ổn định hơn.
]

#tech-box[
  Có thể đọc các thước đo phân tán như sau:

  - *Khoảng biến thiên* nhìn hai đầu biên.
  - *Khoảng tứ phân vị* nhìn 50% dữ liệu ở giữa.
  - *Phương sai* và *độ lệch chuẩn* nhìn toàn bộ mức lệch quanh trung bình.

  Không có thước đo nào luôn vô địch. Ta chọn theo câu hỏi và kiểu dữ liệu đang có.
]

== 10. Một Lịch Sử Nhỏ Của Việc Đọc Dữ Liệu

#history-box("John Graunt, Florence Nightingale, Galton, Pearson, Tukey")[
  John Graunt là một trong những người đầu tiên cho thấy từ sổ ghi chép dân số và tử vong có thể rút ra những quy luật xã hội lớn. Florence Nightingale dùng bảng và biểu đồ để thay đổi cách người ta quản lý bệnh viện quân đội. Galton và Pearson giúp mở rộng thống kê sang việc mô tả phân bố, biến thiên và tương quan. John Tukey, ở thế kỷ hai mươi, thúc đẩy một tinh thần rất hiện đại: *hãy để dữ liệu được nhìn thấy trước khi bị nhốt trong công thức*.
]

#vd-box("10", "Nightingale đã thắng bằng biểu đồ như thế nào?")[
  Nightingale không chỉ nói suông rằng nhiều binh sĩ chết vì điều kiện vệ sinh tệ hơn là vì vết thương. Bà tổ chức dữ liệu và biểu diễn nó thành hình, khiến vấn đề lộ ra một cách không thể làm ngơ.

  Đây là một ví dụ lớn của thống kê phổ thông ở phiên bản trưởng thành: không phải chỉ để thi, mà để biến dữ liệu thành lập luận đủ mạnh để thay đổi quyết định thực tế.
]

#essay-box("Thống kê tốt là thống kê biết kể chuyện mà không phản bội dữ liệu")[
  Nếu chỉ kể chuyện mà không trung thực với dữ liệu, đó là tuyên truyền. Nếu chỉ ném dữ liệu mà không tổ chức thành câu chuyện, đó là hỗn loạn. Thống kê nằm giữa hai cực ấy: trung thực nhưng có cấu trúc.
]

== 11. Bản Đồ Của Quyển Thống Kê Này

#core-box[
  Nếu phải nén cả quyển vào vài mệnh đề, ta có thể nén như sau:

  - Dữ liệu thô phải được tổ chức mới thành tri thức.
  - Trung bình, trung vị và mốt trả lời các câu hỏi khác nhau về cái điển hình.
  - Tứ phân vị và boxplot cho thấy hình dáng phần giữa của dữ liệu.
  - So sánh hai mẫu luôn giàu hơn mô tả một mẫu.
  - Ghép nhóm là một cách nén dữ liệu lớn để thấy được cấu trúc chung.
  - Giá trị đại diện là một phép xấp xỉ chứ không phải chân dung chính xác của từng điểm.
  - Khoảng biến thiên, khoảng tứ phân vị, phương sai và độ lệch chuẩn là các thước đo khác nhau của sự phân tán.
  - Muốn dùng công thức ghép nhóm đúng, trước hết phải đọc đúng bảng và đúng nhóm chứa đại lượng cần tìm.
]

#bridge-box("Từ phần khai mở sang xưởng lớp 12")[
  Phần tiếp theo của quyển này đi thẳng vào phần kỹ thuật sâu của thống kê ghép nhóm lớp 12:

  - đọc bảng ghép nhóm một cách có cấu trúc,
  - tính khoảng biến thiên và khoảng tứ phân vị,
  - tính số trung bình, phương sai và độ lệch chuẩn,
  - rồi dùng chúng để so sánh mức độ đồng đều và ổn định của dữ liệu thực tế.

  Nếu phần khai mở ở trên làm đúng việc của nó, thì sang phần xưởng, em sẽ không còn thấy mình đang học một loạt công thức rời. Em sẽ thấy mình chỉ đang tiếp tục cùng một câu chuyện: *làm thế nào để đọc một đám dữ liệu như một cấu trúc có nghĩa*.
]

#open-q[
  Khi một bộ dữ liệu được thay bằng chỉ vài đại lượng tóm tắt, em đang thu được cái nhìn lớn hơn hay đang đánh mất điều quan trọng? Câu trả lời đúng thường là: cả hai.
]
