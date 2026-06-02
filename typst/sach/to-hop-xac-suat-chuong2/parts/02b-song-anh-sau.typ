#import "../_theme.typ": *

== Xưởng B — Song Ánh Sâu: Thay Áo Mà Không Đổi Linh Hồn

#why-box[
  Song ánh là một trong những động tác thanh lịch nhất của tổ hợp. Khi nó hoạt động, bài toán không còn được giải bằng cách tính chăm chỉ hơn, mà bằng cách đi sang một thế giới khác nơi cấu trúc trở nên trong suốt.

  Nhưng muốn dùng song ánh sâu, ta phải vượt qua hiểu lầm phổ biến rằng "song ánh chỉ là ghép cặp một-một". Đúng hơn, song ánh là nghệ thuật chọn đúng biểu diễn của một cấu trúc.
]

#history-box("Cantor, Euler, Andre: từ so sánh kích thước tới biến hình cấu trúc")[
  Georg Cantor đưa song ánh thành trung tâm của cách hiểu về kích thước tập hợp. Nhưng trong tổ hợp hữu hạn, tinh thần song ánh còn gần gũi hơn nhiều.

  Euler dùng các mã hóa cấu trúc dưới nhiều lớp áo khác nhau khi nghiên cứu phân hoạch và chuỗi hình thức. Về sau, Desire Andre làm nổi bật reflection principle, một kiểu song ánh rất mạnh giữa các đường đi "xấu" và những đường đi dễ đếm hơn. Chính từ các truyền thống ấy mà song ánh trở thành một thói quen suy nghĩ: muốn đếm tốt hơn, hãy thay hình dạng của vấn đề.
]

=== B1. Song Ánh Bắt Đầu Từ Những Bản Đồ Hiền Lành

#vd-box("20", "Vì sao $C_n^k = C_n^(n-k)$ không chỉ là một đẳng thức?")[
  Nếu chọn $k$ người trong một nhóm $n$ người, ta cũng đồng thời chọn ra một nhóm còn lại gồm $n-k$ người.

  Ánh xạ "lấy phần bù" biến mỗi nhóm $k$ phần tử thành duy nhất một nhóm $n-k$ phần tử, và ngược lại. Đây là một song ánh thật sự.

  Vì vậy công thức
  $ C_n^k = C_n^(n-k) $
  không phải chỉ là hệ quả đại số của giai thừa. Nó là một sự thật cấu trúc: *chọn và bỏ lại là hai mặt của cùng một hành động*.
]

#workshop-box("Bản chất của song ánh ở ví dụ phần bù")[
  Điều đẹp là đại lượng cần đếm không thay đổi. Cái thay đổi chỉ là biểu diễn của nó. Một nhóm được chọn và phần còn lại của vũ trụ là hai mô tả của cùng một quyết định.

  Một khi đã nhìn ra điều này, em sẽ bắt đầu săn các phép biến đổi khác: đổi tập con thành xâu nhị phân, đổi nghiệm nguyên thành các dấu ngăn, đổi đường đi thành chuỗi ký tự, đổi cấu hình ghế thành loại cột.
]

=== B2. Mã Hóa Bằng Dấu Ngăn: Song Ánh Với Nghiệm Nguyên Không Âm

#vd-box("21", "Stars and bars thực chất là một song ánh")[
  Bài toán: đếm số nghiệm nguyên không âm của
  $ x_1 + x_2 + dots + x_k = n $

  Nếu chỉ nhìn như phương trình, bài toán có vẻ thuần đại số. Nhưng tổ hợp nhìn nó khác: hãy viết ra $n$ ngôi sao và chèn vào đó $k-1$ thanh ngăn để chia chúng thành $k$ đoạn. Độ dài đoạn thứ $i$ chính là $x_i$.

  Như vậy, mỗi nghiệm tương ứng duy nhất với một dãy gồm $n$ ngôi sao và $k-1$ thanh ngăn. Tổng số ký hiệu là $n+k-1$, chỉ cần chọn vị trí của $k-1$ thanh ngăn:
  $ C_(n+k-1)^(k-1) $

  Đây không phải mẹo hình ảnh. Đây là một song ánh trọn vẹn giữa hai thế giới:

  - một thế giới đại số: nghiệm của phương trình,
  - một thế giới tổ hợp: xâu ký hiệu.
]

#bridge-box("Từ stars and bars tới hàm sinh")[
  Ở Phần VIII, hàm sinh sẽ đại số hóa chính hiện tượng này. Mỗi biến $x_i$ không âm tương ứng với một chuỗi hình thức $1 + x + x^2 + dots$.

  Nếu em thấy stars and bars là song ánh giữa nghiệm và xâu ký hiệu, thì hàm sinh sẽ hiện ra như chiếc bóng đại số của cùng một song ánh.
]

=== B3. Ví Dụ Dài — Reflection Principle Và Sự Sinh Ra Của Catalan

#workshop-box("Bài toán dài: đếm số đường đi không vượt đường chéo")[
  Xét các đường đi từ $(0,0)$ tới $(n,n)$ chỉ bằng hai bước:

  - bước sang phải,
  - bước đi lên.

  Tổng số đường đi là
  $ C_(2n)^n $
  vì ta chỉ cần chọn $n$ trong $2n$ vị trí để đặt bước đi lên.

  Bây giờ thêm điều kiện khó hơn: đường đi không bao giờ vượt lên trên đường chéo $y=x$.

  Thay vì đếm thẳng các đường đi "tốt", ta đếm đường đi "xấu" rồi trừ đi. Một đường đi xấu là đường có lúc đầu tiên vượt qua đường chéo. Tại thời điểm đầu tiên ấy, ta phản xạ phần đầu của đường đi qua đường thẳng $y=x+1$.

  Phép phản xạ này tạo ra một song ánh giữa:

  - các đường đi xấu từ $(0,0)$ tới $(n,n)$,
  - và các đường đi từ $( -1, 1 )$ tới $(n,n)$.

  Số đường đi loại sau là
  $ C_(2n)^(n+1) $
  vì ta cần nhiều hơn một bước sang phải so với bước đi lên trong giai đoạn đã phản xạ.

  Vậy số đường đi tốt là:
  $ C_(2n)^n - C_(2n)^(n+1) = frac(1, n+1) C_(2n)^n $

  Đó chính là số Catalan thứ $n$.
]

#history-box("Andre và reflection principle")[
  Desire Andre là một trong những người làm cho phương pháp phản xạ trở nên nổi bật trong thế kỷ mười chín, đặc biệt qua bài toán bỏ phiếu và các đường đi lưới.

  Sức mạnh của phương pháp này nằm ở chỗ rất đặc trưng cho song ánh sâu: thay vì vật lộn với lớp đối tượng tốt, ta biến lớp đối tượng xấu thành một lớp khác dễ đếm hơn. Cấu trúc không biến mất; nó chỉ bị quay sang một góc nhìn mới.
]

#pivot-box("Chọn $k$ số không kề nhau từ $1$ tới $n$")[
  Hãy đếm số cách chọn $k$ số từ dãy $1,2,dots,n$ sao cho không có hai số liên tiếp.

  Đây là bài toán bản lề rất đẹp. Nếu dãy được chọn là
  $ a_1 < a_2 < dots < a_k $
  thì điều kiện không kề nhau nói rằng
  $ a_(i+1) >= a_i + 2 $

  Bây giờ đặt
  $ b_i = a_i - (i-1) $
  Khi đó dãy $b_1 < b_2 < dots < b_k$ chỉ còn là một lựa chọn $k$ số bất kỳ từ $1$ tới $n-k+1$.

  Vậy số cách cần tìm là
  $ C_(n-k+1)^k $

  Đây là song ánh kiểu "nén khoảng trống". Nó cực quan trọng vì nó xuất hiện lại trong bài toán ghế, bài toán chữ không kề nhau, và nhiều chuyên đề Catalan.
]

#essay-box("Song ánh sâu là tìm tọa độ đúng")[
  Một bài toán khó đôi khi không phải vì nó có quá nhiều đối tượng, mà vì ta đang nhìn các đối tượng ấy bằng tọa độ dở. Song ánh là nghệ thuật thay hệ tọa độ.

  Người học trưởng thành không sợ đổi biểu diễn. Họ biết rằng cùng một cấu trúc có thể sống tốt hơn trong một ngôn ngữ khác.
]

#open-q[
  Mỗi khi một bài toán trông rối vì quá nhiều ràng buộc, em có thử hỏi: nếu đổi cách mã hóa cấu hình, liệu các ràng buộc có trở nên tuyến tính hay không?
]
