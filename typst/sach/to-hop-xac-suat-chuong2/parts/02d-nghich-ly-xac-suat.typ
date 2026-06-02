#import "../_theme.typ": *

== Xưởng D — Nghịch Lý Xác Suất: Nơi Trực Giác Bị Kiểm Định

#why-box[
  Nghịch lý xác suất không quan trọng vì chúng làm người học bối rối. Chúng quan trọng vì chúng chỉ ra rất chính xác *trực giác đang mơ hồ ở đâu*.

  Mỗi nghịch lý tốt đều buộc ta sửa một thói quen xấu:

  - nói về xác suất mà không chốt không gian mẫu,
  - cập nhật thông tin mà không ghi rõ cơ chế tiết lộ,
  - hoặc ngộ nhận hai tình huống là đối xứng dù thực ra không đối xứng.
]

#history-box("de Mere, Pascal, Bayes, Bertrand, Selvin")[
  Lịch sử xác suất đầy những cú vấp trực giác.

  - Chevalier de Mere nêu ra các câu hỏi cờ bạc khiến Pascal và Fermat phải phát minh những mảnh đầu tiên của lý thuyết xác suất hiện đại.
  - Thomas Bayes và Laplace biến việc cập nhật thông tin thành một ngôn ngữ toán học rõ ràng.
  - Joseph Bertrand nêu ra các nghịch lý hình học cho thấy khái niệm "chọn ngẫu nhiên" không hề ngây thơ.
  - Trong thế kỷ hai mươi, Steve Selvin rồi sau này cuộc tranh luận quanh Monty Hall cho thấy ngay cả người rất thông minh cũng dễ trượt nếu mô tả không gian mẫu sai đi một chút.
]

=== D1. Birthday Paradox: Đông Người Hơn Ta Tưởng

#workshop-box("Bài toán dài: vì sao $23$ người đã đủ vượt quá $1/2$?")[
  Trực giác thô thường nghĩ phải gần $365$ người mới đáng lo trùng sinh nhật. Sai lầm nằm ở chỗ trực giác ấy chỉ nhìn một người đối chiếu với người khác, thay vì nhìn *mọi cặp* có thể hình thành trong nhóm.

  Với $n$ người, xác suất *không* có ngày sinh trùng nhau là:
  $ frac(365, 365) dot frac(364, 365) dot frac(363, 365) dots frac(365-n+1, 365) $

  Khi $n=23$, tích này đã nhỏ hơn $1/2$, nên xác suất có ít nhất một cặp trùng sinh nhật đã vượt $1/2$.

  Điều cốt lõi không phải con số $23$. Điều cốt lõi là: số cặp người tăng theo cấp bậc hai. Chính các cặp ấy mới là nơi va chạm có thể xảy ra.
]

#essay-box("Trực giác sai vì nhìn nhầm đơn vị")[
  Birthday paradox dạy một bài học lớn: khi phân tích một hiện tượng xác suất, đơn vị đúng để quan sát đôi khi không phải là cá nhân, mà là *cặp*, *bộ ba*, hay một cấu hình con nào đó.

  Nói cách khác, nhiều nghịch lý chỉ là hậu quả của việc ta chọn sai hạt cơ bản của vấn đề.
]

=== D2. Monty Hall: Thông Tin Không Trung Tính

#vd-box("24", "Tại sao đổi cửa lại thắng với xác suất $2/3$?")[
  Ban đầu, cửa em chọn có xác suất đúng là $1/3$, còn hai cửa còn lại gộp chung có xác suất $2/3$.

  Người dẫn chương trình biết nơi giấu phần thưởng và luôn mở một cửa thua trong hai cửa còn lại. Hành động ấy không chia đều lại xác suất. Nó chỉ *nén* toàn bộ khối xác suất $2/3$ vào cánh cửa chưa mở còn lại.

  Vì thế:
  - giữ nguyên cửa: xác suất thắng $1/3$,
  - đổi cửa: xác suất thắng $2/3$.

  Bài học sâu ở đây là thông tin không hề trung tính. Giá trị của nó phụ thuộc vào cơ chế tạo ra nó.
]

#bridge-box("Từ Monty Hall tới martingale và Bayes")[
  Sang các phần sau, nhất là khi gặp Bayes và martingale sơ cấp, em sẽ gặp lại đúng câu chuyện này dưới ngôn ngữ chặt hơn: thông tin mới làm thay đổi phân phối, nhưng cách nó thay đổi phụ thuộc vào *luật tiết lộ thông tin*.
]

=== D3. Hai Đứa Trẻ: Một Câu Nói, Hai Không Gian Mẫu

#pivot-box("Khác nhau giữa 'ít nhất một bé trai' và 'bé lớn là trai'")[
  Xét một gia đình có hai con, giả sử trai và gái là đồng khả năng.

  - Nếu biết *bé lớn là trai*, các khả năng còn lại là: trai-trai, trai-gái. Xác suất cả hai là trai bằng $1/2$.
  - Nếu biết *ít nhất một bé là trai*, các khả năng còn lại là: trai-trai, trai-gái, gái-trai. Xác suất cả hai là trai bằng $1/3$.

  Hai câu nghe rất gần nhau trong ngôn ngữ đời thường. Nhưng về xác suất, chúng là hai bộ lọc thông tin khác nhau, nên dẫn tới hai không gian mẫu khác nhau.
]

=== D4. Bertrand Và Câu Hỏi 'Chọn Ngẫu Nhiên' Nghĩa Là Gì?

#vd-box("25", "Nghịch lý Bertrand")[
  Hỏi: chọn ngẫu nhiên một dây cung của đường tròn. Xác suất để dây ấy dài hơn cạnh tam giác đều nội tiếp là bao nhiêu?

  Điều gây sốc là đáp án thay đổi tùy cách em hiểu từ "chọn ngẫu nhiên":

  - chọn ngẫu nhiên hai đầu mút,
  - chọn ngẫu nhiên trung điểm của dây,
  - hay chọn ngẫu nhiên khoảng cách từ tâm.

  Nghịch lý không nói rằng xác suất mâu thuẫn. Nó nói rằng mô tả bài toán chưa đủ chính xác. Trước khi tính xác suất, ta phải định nghĩa quy trình sinh ngẫu nhiên.
]

#essay-box("Xác suất là ngôn ngữ của quy trình, không chỉ của kết quả")[
  Đây là điều người học dễ quên nhất. Một mô tả kết quả cuối cùng chưa đủ để xác định một mô hình xác suất. Cần cả quy trình sinh ra kết quả ấy.

  Vì thế, trong xác suất trưởng thành, câu hỏi "cái gì có thể xảy ra" luôn đi kèm câu hỏi "nó được sinh ra như thế nào".
]

#open-q[
  Khi trực giác hét lên rằng một đáp án xác suất là 'vô lý', em có kiểm tra lại xem mình đã chốt đúng không gian mẫu và đúng luật tiết lộ thông tin hay chưa?
]
