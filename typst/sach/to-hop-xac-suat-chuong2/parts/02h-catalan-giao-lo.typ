#import "../_theme.typ": *

== Xưởng H — Catalan: Nơi Nhiều Thế Giới Đếm Được Đột Ngột Gặp Nhau

#why-box[
  Có những dãy số đẹp vì công thức gọn. Có những dãy số đẹp hơn vì chúng xuất hiện ở nhiều nơi không ngờ tới. Số Catalan thuộc loại thứ hai.

  Chúng xuất hiện trong:

  - dãy ngoặc hợp lệ,
  - đường đi không vượt đường chéo,
  - tam giác hóa đa giác lồi,
  - cây nhị phân đầy đủ,
  - ghép cặp không cắt nhau,
  - và vô số cấu trúc khác.

  Vì vậy Catalan là một xưởng lý tưởng cho Phần II: nó dạy rằng nhiều bài toán khác mặt nhau thật ra là cùng một linh hồn tổ hợp.
]

#history-box("Euler, Segner, Catalan, Dyck: một dãy số có nhiều đời sống")[
  Dãy số này mang tên Eugene Catalan, nhưng lịch sử của nó rộng hơn thế.

  Leonhard Euler và Johann Segner đã chạm tới các công thức liên quan khi nghiên cứu tam giác hóa đa giác và các truy hồi kiểu cây. Eugene Catalan đưa ra những biểu thức và quan tâm hệ thống hơn. Về sau, Walther von Dyck gắn tên mình với Dyck path, một trong những mô hình đẹp nhất của họ Catalan.

  Lịch sử ấy nhắc một điều rất quan trọng: đôi khi một dãy số không phải là kết quả của *một* bài toán, mà là giao lộ nơi nhiều bài toán khác nhau cùng đổ về.
]

=== H1. Dãy Ngoặc Hợp Lệ: Cấu Trúc Đơn Giản Nhưng Rất Sâu

#vd-box("27", "Ngoặc hợp lệ không phải bài trẻ con")[
  Một dãy ngoặc hợp lệ với $n$ cặp ngoặc là một chuỗi gồm $n$ dấu mở và $n$ dấu đóng sao cho khi đọc từ trái sang phải, tại mọi thời điểm số dấu đóng chưa bao giờ vượt số dấu mở, và cuối cùng hai số này bằng nhau.

  Điều kiện ấy nghe rất ngôn ngữ. Nhưng ở tầng sâu hơn, nó là điều kiện về *cân bằng cục bộ* trong suốt cả quá trình đọc. Chính vì thế nó sẽ gặp đường đi lưới, cây nhị phân, và nhiều cấu trúc đệ quy khác.
]

#workshop-box("Từ ngoặc tới đường đi")[
  Hãy mã hóa:

  - dấu mở ngoặc bằng một bước đi lên,
  - dấu đóng ngoặc bằng một bước sang phải.

  Khi đó một dãy ngoặc hợp lệ với $n$ cặp ngoặc trở thành một đường đi từ $(0,0)$ tới $(n,n)$ không bao giờ đi xuống dưới đường chéo.

  Bỗng nhiên một bài toán ngôn ngữ được chuyển thành một bài toán hình học rời rạc. Đây là vẻ đẹp điển hình của song ánh: điều kiện cú pháp biến thành điều kiện vị trí.
]

=== H2. Một Đối Tượng, Nhiều Khuôn Mặt

#vd-box("28", "Cùng là Catalan, nhưng có thể đang đeo mặt nạ nào?")[
  Với cùng số Catalan thứ $n$, ta có thể đang đếm:

  - số dãy ngoặc hợp lệ có $n$ cặp ngoặc,
  - số đường đi Dyck độ dài $2n$,
  - số cây nhị phân đầy đủ có $n$ nút trong,
  - số cách tam giác hóa một đa giác lồi có $n+2$ cạnh,
  - số ghép cặp không cắt nhau của $2n$ điểm trên một đường tròn.

  Mỗi avatar này làm nổi bật một mặt khác nhau của cùng một hiện tượng: cấu trúc tự lồng vào nhau mà vẫn giữ cân bằng toàn cục.
]

#essay-box("Điều người học nên cảm được")[
  Khi một dãy số xuất hiện ở nhiều nơi như vậy, điều đáng học không phải chỉ là thuộc vài mô hình chuẩn. Điều đáng học là bắt đầu đặt câu hỏi:

  "Những mô hình này có chung cơ chế sinh nào?"

  Với Catalan, câu trả lời thường xoay quanh hai ý:

  - một ràng buộc cân bằng xuyên suốt,
  - và một cấu trúc đệ quy kiểu "tách phần đầu rồi để phần còn lại tự sao chép cùng quy luật".
]

=== H3. Ví Dụ Dài — Từ Cây Nhị Phân Tới Truy Hồi Catalan

#workshop-box("Bài toán dài: vì sao Catalan thỏa truy hồi tích chập?")[
  Xét cây nhị phân đầy đủ: mỗi nút trong có đúng hai con. Gọi $C_n$ là số cây như vậy với $n$ nút trong.

  Hãy nhìn vào gốc cây. Gốc chia cây thành:

  - cây con trái,
  - cây con phải.

  Nếu cây con trái có $k$ nút trong, thì cây con phải phải có $n-1-k$ nút trong. Với mỗi lựa chọn của $k$, số cây có thể tạo ra là:
  $ C_k C_(n-1-k) $

  Cộng trên mọi $k$, ta được:
  $ C_n = sum_(k=0)^(n-1) C_k C_(n-1-k) $

  Đây là khoảnh khắc rất đẹp. Một cấu trúc hình học đột nhiên nói bằng ngôn ngữ truy hồi. Đến Phần VIII, chính truy hồi này sẽ được dịch tiếp sang hàm sinh.
]

#bridge-box("Từ truy hồi sang hàm sinh")[
  Truy hồi tích chập ở trên không chỉ là một quan hệ đếm. Nó là cửa vào tự nhiên của phương trình hàm sinh:
  $ C(x) = 1 + x C(x)^2 $

  Nghĩa là Phần VIII không hề mở ra một công cụ xa lạ. Nó chỉ tiếp tục cuộc đối thoại mà cấu trúc Catalan đã bắt đầu ở đây.
]

=== H4. Reflection Principle Và Ballot Problem

#vd-box("29", "Một phiếu bầu có thể biến thành một đường đi")[
  Giả sử trong một cuộc kiểm phiếu, ứng viên A luôn dẫn hoặc ít nhất không thua ứng viên B ở mọi thời điểm kiểm đếm, và cuối cùng A có nhiều phiếu hơn B. Nếu mã hóa mỗi phiếu cho A là một bước lên và mỗi phiếu cho B là một bước sang phải, ta nhận được một đường đi bị chặn bởi một điều kiện hình học.

  Từ đây, phương pháp phản xạ của Andre cho phép đếm các đường đi xấu rồi trừ đi. Ballot problem vì thế trở thành một người anh em trực tiếp của Dyck path và Catalan.
]

#history-box("Catalan như một nút giao lịch sử")[
  Rất ít dãy số cho thấy rõ điều này như Catalan: hình học đa giác, ngoặc hợp lệ, cây, đường đi, và kiểm phiếu đều gặp nhau ở cùng một họ công thức.

  Đó là lý do Catalan nên được học trong Part II bằng con mắt khai mở, trước khi gặp phiên bản đại số hóa ở Part VIII. Nếu chỉ gặp công thức $frac(1, n+1) C_(2n)^n$ mà chưa thấy các avatar của nó, người học sẽ bỏ lỡ phần đẹp nhất.
]

=== H5. Bài Toán Bản Lề — Tam Giác Hóa Đa Giác

#pivot-box("Một đa giác lồi có bao nhiêu cách tam giác hóa?")[
  Với đa giác lồi có $n+2$ cạnh, số cách tam giác hóa là số Catalan thứ $n$.

  Cách nhìn sâu là chọn một cạnh gốc, rồi nhìn tam giác chứa cạnh ấy. Tam giác này chia đa giác ban đầu thành hai đa giác nhỏ hơn. Bài toán lớn tự tách thành hai bài toán con độc lập, đúng kiểu truy hồi Catalan.

  Đây là bài toán bản lề vì nó cho người học cảm rất rõ thế nào là "cấu trúc tự phân rã". Một khi đã thấy kiểu phân rã này vài lần, em sẽ bắt đầu nhận diện họ Catalan ở những ngữ cảnh mới.
]

#essay-box("Catalan như một phép thử trưởng thành")[
  Khi một người học bắt đầu hỏi không phải "đáp số có phải Catalan không", mà là "cấu trúc này có tự tách thành hai nửa độc lập quanh một hạt nhân trung tâm hay không", ta biết trực giác tổ hợp của người ấy đã lớn lên.
]

#open-q[
  Mỗi khi nhiều mô hình khác nhau cho ra cùng một dãy số, em có xem đó là sự trùng hợp, hay là tín hiệu rằng phía sau chúng có một bộ xương chung đang chờ được gọi tên?
]
