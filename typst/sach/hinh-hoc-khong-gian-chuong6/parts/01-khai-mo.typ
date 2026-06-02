#import "../_theme.typ": *

= PHẦN I — KHAI MỞ: TỪ TRỰC GIÁC HÌNH KHỐI TỚI VECTƠ VÀ OXYZ

== 1. Vì Sao 3D Không Thể Chỉ Học Như Phiên Bản Khó Hơn Của 2D?

#why-box[
  Trong mặt phẳng, mắt còn khá dễ theo dõi hình. Trong không gian, chỉ cần thêm vài đường thẳng và một mặt phẳng là trực giác đã bắt đầu mờ. Vì vậy 3D không chỉ là 2D cộng thêm một trục. Nó đòi những thiết bị tư duy mới: hình chiếu, vectơ, tọa độ, mặt phẳng phụ, thiết diện.
]

#vd-box("1", "Hai đường thẳng ‘trông như cắt nhau’ nhưng thực ra chéo nhau")[
  Một hình vẽ phối cảnh trên giấy rất dễ làm người học tưởng hai đường trong không gian giao nhau. Nhưng chỉ cần kiểm tra chúng không đồng phẳng, ta biết ngay đó là hai đường chéo nhau.

  Đây là một bài học mở đầu rất lớn của 3D: *đừng tin mắt ngay*. Trong không gian, phải luôn có một cơ chế kiểm tra cấu trúc chứ không chỉ dựa vào hình vẽ.
]

#core-box[
  Quyển này được xây trên ba bước:

  - nhìn khối và quan hệ theo tinh thần Euclide,
  - ổn định trực giác bằng hình chiếu và vectơ,
  - rồi nén toàn bộ không gian vào Oxyz khi cần tính mạnh.
]

== 2. Euclide Trong Không Gian: Song Song, Vuông Góc, Thiết Diện

#history-box("Từ hình học khối cổ điển tới không gian hiện đại")[
  Trước khi Oxyz ra đời, con người đã nghĩ rất sâu về lăng trụ, hình chóp, mặt cầu, thiết diện và các quan hệ song song-vuông góc trong không gian. Hình học không gian cổ điển không yếu hơn vì thiếu tọa độ. Nó chỉ buộc trí óc làm nhiều việc hơn bằng trực giác và lập luận tổng hợp.
]

#vd-box("2", "Một mặt phẳng cắt hình chóp nên bắt đầu từ đâu?")[
  Với bài thiết diện, người học yếu thường cố vẽ thật đẹp rồi đoán. Người học tốt hơn lại hỏi: mặt phẳng này đi qua những cạnh nào, cắt các mặt nào, và nên tìm giao tuyến theo thứ tự nào.

  Đó là tinh thần Euclide trong không gian: trước khi tính, hãy dựng đúng cấu trúc.
]

#eye-box[
  Không gian cổ điển dạy ta một phản xạ rất quý: luôn tìm các mặt phẳng phụ đơn giản hơn. Rất nhiều bài 3D khó trở nên sáng ra ngay khi được kéo về một tam giác vuông, một mặt phẳng chứa đường vuông góc, hay một thiết diện dễ đọc.
]

== 3. Vectơ: Khi Quan Hệ Không Gian Được Nén Thành Hướng Và Độ Dài

#why-box[
  Vectơ không chỉ là một ký hiệu mới. Nó là một thiết bị nén hướng, độ lớn và quan hệ song song-vuông góc vào một đối tượng đại số có thể thao tác được.
]

#vd-box("3", "Đường bay của một vật thể cần gì ở vectơ?")[
  Nếu biết một điểm xuất phát và một hướng bay, vectơ cho ta ngay cách viết đường thẳng không gian. Khi bài toán chuyển động đi vào 3D, vectơ trở thành cầu nối cực mạnh giữa hình học và mô hình hóa.
]

#meta-box[
  Vectơ là bước chuyển trung gian tuyệt đẹp: vẫn còn giữ trực giác hình học, nhưng đã cho phép tính toán gần với đại số hơn hẳn.
]

== 4. Oxyz: Khi Không Gian Có Một Bộ Nhớ Tọa Độ

#history-box("Descartes và bước nén cuối cùng")[
  Descartes mở đường cho tọa độ trong mặt phẳng; hậu duệ của ý tưởng ấy đưa ta tới Oxyz trong không gian. Khi đó một điểm thành bộ ba số, đường thẳng và mặt phẳng thành phương trình, khoảng cách và góc thành công thức, còn nhiều bài toán không gian được chuyển thành đại số.
]

#vd-box("4", "Một mặt phẳng qua điểm và vuông góc với vectơ pháp tuyến")[
  Trong ngôn ngữ Euclide, ta nghĩ về mặt phẳng bằng vị trí và quan hệ. Trong Oxyz, chỉ cần một điểm và một vectơ pháp tuyến, mặt phẳng đã được nén thành một phương trình.

  Chính chỗ này làm Oxyz mạnh: nó không thay hình học, nhưng nó ghi nhớ hình học dưới dạng rất tiện cho tính toán.
]

#tech-box[
  Oxyz cho phép:

  - nén điểm, đường, mặt thành dữ liệu số,
  - dùng vectơ chỉ phương và pháp tuyến để kiểm tra quan hệ,
  - tính khoảng cách, góc, giao tuyến theo quy trình chuẩn hóa,
  - và đưa bài toán không gian thực tế vào mô hình có thể xử lý được.
]

== 5. Bản Đồ Tư Duy Của Quyển 3D

#core-box[
  Nếu nén quyển này vào vài dòng:

  - 3D đòi nhiều thiết bị tư duy hơn 2D vì trực giác mắt yếu đi nhanh.
  - Không gian cổ điển luyện cấu trúc: song song, vuông góc, thiết diện, khoảng cách.
  - Vectơ là thiết bị nén hướng và quan hệ.
  - Oxyz là thiết bị nén toàn bộ không gian thành hệ tọa độ có thể tính.
  - Người học giỏi 3D không chỉ biết công thức, mà biết khi nào phải quay lại một mặt phẳng phụ để nhìn cho sáng.
]

#bridge-box("Từ phần khai mở sang xưởng chiều sâu")[
  Phần sau của quyển 3D sẽ chia thành hai xưởng:

  - xưởng vectơ và hệ trục 3D như lõi kỹ thuật nền,
  - xưởng Oxyz ứng dụng, mô hình hóa, chuyển động, mặt cầu, giao tuyến và cực trị không gian.

  Đây là nơi trực giác hình khối của Euclide và thiết bị tính toán của Descartes gặp nhau rõ nhất.
]

#include "01b-hinh-chieu.typ"
#include "01c-thiet-dien.typ"
#include "01d-vecto-thiet-bi.typ"
#include "01e-oxyz-mo-hinh.typ"
#include "01f-ngo-nhan-3d.typ"
#include "01g-khoang-cach-va-goc.typ"
#include "01h-khi-nao-doi-ngon-ngu.typ"
