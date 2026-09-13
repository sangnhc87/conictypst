# -*- coding: utf-8 -*-
import sys
import os

target_path = "/Users/admin/conictypst/typst/sach/de-on-tap-theo-chuong-k10/generator/appendix.py"

# Đọc file appendix.py hiện tại
with open(target_path, "r", encoding="utf-8") as f:
    orig = f.read()

# 1. Đoạn bổ sung 10 Kịch bản Socrates mới (Kịch bản 11 đến 20)
socrates_extra = r'''
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
'''

# 2. Đoạn bổ sung 4 Bài báo IMRAD mới (Bài báo 5 đến 8)
imrad_extra = r'''
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
'''

# Thay thế Phần II để chèn thêm 10 Kịch bản Socrates
part2_target = "#dialogue-box(title: \"Kịch Bản 10: Nghịch Lý Ngày Sinh — Tại Sao 23 Người Đã Có Hơn 50% Khả Năng Trùng Nhật?\")["
if part2_target in orig:
    # Tìm vị trí kết thúc của Kịch bản 10
    idx = orig.find(part2_target)
    end_box = orig.find("]\n\n#pagebreak()\n\n= PHẦN III:", idx)
    if end_box != -1:
        orig = orig[:end_box+1] + "\n" + socrates_extra + orig[end_box+1:]
        print("Inserted 10 extra Socrates dialogues successfully!")

# Thay thế Phần III để chèn thêm 4 Bài báo IMRAD mới
part3_target = "*4. Thảo luận & Ý nghĩa Triết học Khoa học (Discussion):*"
if part3_target in orig:
    idx2 = orig.find(part3_target)
    end_art4 = orig.find("\n\n#pagebreak()\n\n= PHẦN IV:", idx2)
    if end_art4 != -1:
        orig = orig[:end_art4] + "\n" + imrad_extra + orig[end_art4:]
        print("Inserted 4 extra IMRAD articles successfully!")

with open(target_path, "w", encoding="utf-8") as f:
    f.write(orig)

print(f"Update completed -> {target_path}")
