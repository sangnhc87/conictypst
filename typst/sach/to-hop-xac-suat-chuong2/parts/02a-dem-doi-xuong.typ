#import "../_theme.typ": *

== Xưởng A — Đếm Đôi Như Một Cỗ Máy Phát Hiện Cấu Trúc

#why-box[
  Đếm đôi là nơi tổ hợp lần đầu buộc người học đi xa hơn phản xạ "đếm cho ra số". Khi đã quen với nó, em bắt đầu hỏi một kiểu câu khác hẳn:

  - đại lượng trung gian nào đáng đếm,
  - cùng đại lượng ấy có thể được nhìn từ mấy phía,
  - và đẳng thức nào sẽ rơi ra khi hai góc nhìn gặp nhau.

  Chính sự dịch chuyển đó làm đếm đôi trở thành một xưởng tuyệt vời để luyện bản lĩnh toán học sâu.
]

#history-box("Từ Euler đến Rota: đếm đôi như một phong cách")[
  Dù không ai sở hữu riêng đếm đôi, nhiều mốc lịch sử cho thấy kỹ thuật này đã đi cùng sự trưởng thành của tổ hợp.

  - Leonhard Euler, trong thế kỷ mười tám, liên tục dùng các cách đếm hai phía khi nghiên cứu đồ thị, phân hoạch và các tổng hữu hạn.
  - James Joseph Sylvester và sau đó là nhiều nhà tổ hợp thế kỷ mười chín xem những đẳng thức như vậy là dấu hiệu của cấu trúc ẩn chứ không chỉ là mẹo biến đổi.
  - Sang thế kỷ hai mươi, Gian-Carlo Rota góp phần đưa tổ hợp lên vị thế của một ngôn ngữ tư duy trung tâm; trong tinh thần ấy, đếm đôi không còn là trò vặt mà là một phương pháp nhìn thế giới hữu hạn.

  Điều đáng nhớ không phải chỉ là tên tuổi. Điều đáng nhớ là: càng đi sâu, toán học càng ít hỏi "em bấm ra số gì" và càng hỏi "em đã chọn đúng đại lượng để nhìn chưa".
]

=== A1. Cái Bắt Tay Và Sự Ra Đời Của Một Định Lý

#vd-box("17", "Bổ đề bắt tay được sinh ra như thế nào?")[
  Hãy bắt đầu bằng bức tranh đơn giản nhất. Một buổi họp có nhiều người, vài cặp người bắt tay với nhau. Hãy hỏi: tổng số cái bắt tay liên quan đến từng người là bao nhiêu?

  Có hai con đường tự nhiên.

  *Cách nhìn thứ nhất: nhìn theo cạnh.*
  Mỗi cái bắt tay nối đúng hai người, nên mỗi cái bắt tay góp $2$ vào tổng số lần chạm tay.

  *Cách nhìn thứ hai: nhìn theo đỉnh.*
  Mỗi người góp vào tổng này đúng bằng số người mà mình bắt tay, tức là bậc của đỉnh tương ứng trong đồ thị.

  Vì hai cách đều đếm cùng một đại lượng, ta có:
  $ sum "bậc các đỉnh" = 2 " số cạnh" $

  Ở đây không có mẹo thần bí nào cả. Chỉ có một quyết định rất khôn: thay vì đếm trực tiếp cái gì mơ hồ, ta dựng một đại lượng mà cả hai phía đều chạm tới được.
]

#workshop-box("Bóc lớp tư duy trong bổ đề bắt tay")[
  Bài học sâu không nằm ở công thức cuối cùng. Nó nằm ở chuỗi quyết định trước đó.

  1. Ta chọn đúng đại lượng trung gian: tổng số đầu mút cạnh.
  2. Ta nhận ra đại lượng ấy có hai cách chia lát tự nhiên.
  3. Ta chấp nhận rằng một đẳng thức đẹp có thể là bóng đổ của hai mô tả khác nhau về cùng một hiện tượng.

  Chính ba bước này về sau sẽ tái xuất trong đếm ma trận $0$-$1$, trong đồ thị hai phía, trong xác suất rời rạc, và cả trong bất đẳng thức trung bình.
]

#pivot-box("Vì sao số đỉnh bậc lẻ luôn chẵn?")[
  Từ công thức trên, tổng bậc mọi đỉnh là một số chẵn. Nhưng tổng các số nguyên chỉ có thể là chẵn nếu số lượng số hạng lẻ trong đó là chẵn.

  Vậy số đỉnh bậc lẻ phải là một số chẵn.

  Đây là một bài toán bản lề vì nó cho thấy: đếm đôi không chỉ sinh ra một đẳng thức. Nó còn mở ra những hệ quả cấu trúc không hề hiển nhiên khi nhìn vào bài toán gốc.
]

=== A2. Đếm Quan Hệ Giữa Hai Lớp Đối Tượng

#eye-box[
  Một trong những nơi đếm đôi mạnh nhất là khi ta có hai lớp đối tượng khác loại, ví dụ:

  - học sinh và câu lạc bộ,
  - đỉnh và cạnh,
  - tập con và phần tử,
  - hàng và cột trong một bảng nhị phân.

  Khi ấy, ta có thể đếm cùng một tập *quan hệ* từ phía trái hoặc từ phía phải.
]

#vd-box("18", "Một lớp học, nhiều câu lạc bộ")[
  Giả sử có $n$ học sinh và $m$ câu lạc bộ. Mỗi học sinh tham gia đúng $r$ câu lạc bộ, còn mỗi câu lạc bộ có đúng $k$ học sinh.

  Hỏi các đại lượng này phải liên hệ thế nào?

  Ta đếm số cặp $(h, c)$ sao cho học sinh $h$ thuộc câu lạc bộ $c$.

  - Nhìn từ phía học sinh: có $n$ học sinh, mỗi em đóng góp $r$ cặp, nên tổng là $n r$.
  - Nhìn từ phía câu lạc bộ: có $m$ câu lạc bộ, mỗi câu lạc bộ đóng góp $k$ cặp, nên tổng là $m k$.

  Suy ra:
  $ n r = m k $

  Đẳng thức này nghe hiền. Nhưng nó là mẫu nguyên bản của rất nhiều công thức cân bằng trong đồ thị hai phía, thiết kế thí nghiệm, hệ phân bố, và ma trận kề.
]

#history-box("Từ thiết kế tổ hợp tới đồ thị hai phía")[
  Những công thức cân bằng kiểu $n r = m k$ xuất hiện dày đặc trong thiết kế khối cân bằng, trong thống kê tổ hợp và trong lý thuyết đồ thị hai phía ở thế kỷ hai mươi.

  Khi các nhà toán học như Fisher, Hall, Kőnig và nhiều người khác nghiên cứu ghép cặp, phân bố và thiết kế thí nghiệm, họ liên tục dùng kiểu đếm này: đếm một quan hệ bằng cách đứng từ hai bờ khác nhau của cùng một chiếc cầu.
]

=== A3. Ví Dụ Dài — Đếm Số Cặp Gồm Một Phần Tử Và Một Tập Con

#workshop-box("Bài toán dài: vì sao $sum_(k=0)^n k C_n^k = n 2^(n-1)$?")[
  Đây là một trong những công thức đẹp nhất để học đếm đôi đúng nghĩa.

  Ta muốn tính tổng:
  $ sum_(k=0)^n k C_n^k $

  Nếu nhìn máy móc, em có thể thử biến đổi đại số. Nhưng ta sẽ không làm thế trước. Ta sẽ đi tìm một đại lượng tổ hợp mà tổng trên đang đếm.

  Hãy xét tất cả các cặp $(x, A)$ trong đó:

  - $A$ là một tập con của $\{1,2,dots,n\}$,
  - và $x$ là một phần tử nằm trong $A$.

  *Đếm theo tập con.*
  Nếu $A$ có đúng $k$ phần tử, thì có đúng $k$ cách chọn $x$ trong $A$. Với mỗi $k$, có $C_n^k$ tập con như vậy. Nên tổng số cặp bằng:
  $ sum_(k=0)^n k C_n^k $

  *Đếm theo phần tử được đánh dấu.*
  Trước tiên chọn phần tử $x$: có $n$ cách.
  Sau đó xây tập con $A$ sao cho chắc chắn chứa $x$. Mỗi phần tử còn lại trong $n-1$ phần tử có hai lựa chọn: vào hoặc không vào $A$. Vậy có $2^(n-1)$ cách.

  Tổng số cặp cũng bằng:
  $ n 2^(n-1) $

  Hai cách nhìn gặp nhau, và công thức xuất hiện.
]

#essay-box("Điều gì xảy ra trong đầu người giải tốt?")[
  Họ không hỏi ngay "làm sao biến tổng này". Họ hỏi:

  "Có thể hiểu $k C_n^k$ như đang đếm cái gì?"

  Câu hỏi ấy chính là khoảnh khắc tổ hợp trở thành ngôn ngữ của cấu trúc chứ không còn là nghệ thuật bấm biểu thức.
]

=== A4. Đếm Đôi Và Tư Duy Cột Đặc Trưng

#vd-box("19", "Một cầu nối từ đếm đôi sang bài toán ghế đối diện")[
  Trong các bài toán ghế đối diện kiểu hai hàng song song, ta thường đặt ẩn cho số cột thuộc từng loại: cột $\{A,B\}$, cột $\{A,C\}$, cột $\{A,E\}$, dots

  Thoạt nhìn, đó giống một hệ phương trình bảo toàn. Nhưng ở tầng sâu hơn, ta đang làm một việc họ hàng với đếm đôi.

  Ta đang đếm cùng một kho tài nguyên theo hai hướng:

  - theo *cột*, mỗi cột đóng góp những chữ cái gì,
  - theo *lớp người*, mỗi lớp phải xuất hiện đúng số lần cho trước.

  Hệ bảo toàn số lượng thực ra là một hóa thân của đếm đôi: tổng đóng góp theo cột phải khớp tổng nhu cầu theo loại đối tượng.
]

#bridge-box("Từ đếm đôi tới Phần VIII")[
  Khi sang Phần VIII, em sẽ gặp những nơi cùng một nguyên lý được viết bằng ngôn ngữ kỹ thuật hơn:

  - hệ số của hàm sinh đếm một cấu trúc từ phía đại số,
  - EGF đếm từ phía nhãn,
  - xác suất đếm gián tiếp qua trung bình,
  - PIE đếm phần hợp qua các tầng giao.

  Nếu ngay ở đây em quen với việc dựng một đại lượng trung gian và đếm nó từ hai phía, thì khi gặp những cỗ máy sâu hơn ở Phần VIII, em sẽ không còn thấy chúng xa lạ. Chúng chỉ là đếm đôi được thay áo.
]

#open-q[
  Khi gặp một tổng hay một hệ thức khó, em có dừng lại đủ lâu để hỏi: mình có đang đứng sai phía của cùng một đại lượng không?
]
