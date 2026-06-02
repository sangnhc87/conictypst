#import "../_theme.typ": *

= PHẦN I — KHAI MỞ: TỪ HÌNH VẼ CỦA EUCLIDE TỚI PHƯƠNG TRÌNH CỦA DESCARTES

== 1. Vì Sao Hình Học Phẳng Xứng Đáng Một Quyển Riêng?

#why-box[
  Hình học phẳng thường bị xé đôi trong cách học phổ thông: một bên là chứng minh tam giác, đường tròn, quỹ tích; bên kia là tọa độ, phương trình, conic. Nhưng nếu nhìn sâu hơn, chúng không phải hai môn khác nhau. Chúng là hai cách nhìn cùng một mặt phẳng.
]

#vd-box("1", "Một đường trung trực có thể được nhìn bằng hai mắt")[
  Với mắt Euclide, đường trung trực là tập hợp các điểm cách đều hai đầu đoạn thẳng. Với mắt Descartes, nó là nghiệm của một phương trình nhận được khi đặt hai khoảng cách bằng nhau.

  Hai ngôn ngữ khác nhau, nhưng cùng nói một sự thật. Chính chỗ này làm hình học phẳng đẹp: *một cấu trúc có thể được đọc bằng hình hoặc bằng công thức, và mỗi cách đọc làm sáng một mặt khác nhau.*
]

#core-box[
  Quyển này được xây trên ba câu hỏi:

  - trong một hình, quan hệ nào là bất biến,
  - khi nào nên chứng minh tổng hợp, khi nào nên tọa độ hóa,
  - và vì sao conic là chiếc cầu lớn nối Euclide với Descartes.
]

== 2. Euclide: Khi Hình Vẽ Là Một Lập Luận Cô Đọng

#history-box("Euclide và mô hình tiên đề")[
  Điều lớn lao ở Euclide không chỉ là nhiều định lý nổi tiếng. Điều lớn hơn là ông cho ta một cách tổ chức không gian bằng tiên đề, định nghĩa, rồi dựng nên cả một thế giới lập luận từ đó. Hình học vì thế trở thành trường học của suy luận chặt chẽ, không chỉ của trực giác.
]

#vd-box("2", "Tam giác cân không chỉ là một hình đẹp")[
  Khi thấy hai cạnh bằng nhau, học sinh mới thường nghĩ ngay tới “hai góc đáy bằng nhau” như một mẹo. Nhưng ở tầng sâu hơn, tam giác cân là nơi ta học đọc tính đối xứng: hai cạnh bằng nhau kéo theo hai góc tương ứng bằng nhau vì hình mang một cân bằng nội tại.
]

#eye-box[
  Euclide dạy một phản xạ rất mạnh: đừng nhìn hình như một ảnh tĩnh. Hãy nhìn nó như một mạng quan hệ. Điểm, đường, góc, đối xứng, song song, vuông góc và đồng dạng là những mắt lưới của mạng ấy.
]

== 3. Từ Tam Giác Và Đường Tròn Tới Ngôn Ngữ Của Bất Biến

#why-box[
  Nhiều bài toán phẳng tưởng khác nhau nhưng lại được giải bằng cùng vài ý lớn: góc nội tiếp, đồng dạng, công suất điểm, tiếp tuyến, đường tròn ngoại tiếp, trục đẳng phương, quỹ tích. Điều đó báo hiệu rằng phía dưới vô số bài lẻ có một bộ xương tư duy chung.
]

#vd-box("3", "Một bài quỹ tích thực ra đang hỏi điều gì?")[
  Nếu bài toán hỏi “tìm tập hợp các điểm $M$ sao cho $M A = M B$”, ta có thể vội trả lời “đường trung trực”. Nhưng một người học sâu hơn sẽ nói: bài toán đang hỏi *cấu trúc cân bằng nào giữ hai khoảng cách bằng nhau*.

  Một khi học cách đọc như vậy, rất nhiều bài quỹ tích khác trở nên gần nhau hơn nhiều so với cảm giác ban đầu.
]

#meta-box[
  Hình học phẳng không mạnh vì có nhiều định lý. Nó mạnh vì nhiều định lý ấy thường là các avatar khác nhau của cùng vài ý tưởng bất biến.
]

== 4. Descartes: Khi Hình Được Nén Thành Phương Trình

#history-box("Descartes và cuộc đổi ngôn ngữ")[
  Với Descartes, hình học không còn buộc phải sống hoàn toàn trong hình vẽ. Một điểm có thể thành cặp số, một đường có thể thành phương trình, một quỹ tích có thể thành phương trình của tập nghiệm. Đây không phải là việc “giết chết hình học”. Nó là việc mở thêm một ngôn ngữ mới để hình học có thể tính toán mạnh hơn.
]

#vd-box("4", "Đường tròn qua Euclide và qua Descartes")[
  Euclide nhìn đường tròn như tập hợp các điểm cách đều một tâm. Descartes viết nó thành phương trình như $x^2 + y^2 = R^2$ hay $(x-a)^2 + (y-b)^2 = R^2$.

  Cái đầu giúp ta thấy đối xứng. Cái sau giúp ta tính giao điểm, tiếp tuyến, khoảng cách. Khi ghép hai cái lại, đường tròn mới thật sự trở thành một đối tượng giàu sức mạnh.
]

#tech-box[
  Tọa độ hóa là một phép nén thông minh:

  - điểm thành số,
  - quan hệ hình học thành phương trình,
  - giao cắt thành hệ phương trình,
  - và quỹ tích thành tập nghiệm.
]

== 5. Conic: Cây Cầu Lớn Giữa Euclide Và Descartes

#why-box[
  Nếu phải chọn một chủ đề trung tâm để nối hai nửa của quyển này, đó là ba đường conic. Chúng vừa là các quỹ tích hình học rất đẹp, vừa là các đường cong có phương trình chuẩn tắc rất mạnh.
]

#vd-box("5", "Parabol vừa là quỹ tích, vừa là phương trình")[
  Với mắt Euclide, parabol là tập hợp các điểm cách đều một tiêu điểm và một đường chuẩn. Với mắt Descartes, nó hiện ra như $y^2 = 4 p x$ sau khi chọn hệ trục phù hợp.

  Đẹp nhất là hai cách đọc này không cạnh tranh nhau. Chúng làm giàu lẫn nhau.
]

#link-box[
  Conic là nơi hình học phẳng chạm cơ học, quang học, thiên văn học và tối ưu. Chúng là một ví dụ tuyệt vời về việc một khái niệm sinh ra từ hình học thuần túy có thể đi rất xa vào thế giới thật.
]

== 6. Bản Đồ Tư Duy Của Quyển 2D

#core-box[
  Nếu phải nén quyển này vào vài dòng:

  - Euclide dạy ta nhìn quan hệ và bất biến trong hình.
  - Descartes dạy ta nén hình thành tọa độ và phương trình.
  - Tam giác, đường tròn, quỹ tích và biến hình là xương sống của nửa Euclide.
  - Oxy, đường thẳng, đường tròn, conic và cực trị phẳng là xương sống của nửa Descartes.
  - Người học giỏi không chỉ biết giải một bài, mà biết khi nào nên đổi ngôn ngữ.
]

#bridge-box("Từ phần khai mở sang xưởng chiều sâu")[
  Phần sau của quyển 2D sẽ chia làm hai xưởng:

  - xưởng Euclide: chứng minh, quỹ tích, tam giác, đường tròn, biến hình,
  - xưởng Descartes: Oxy, đường thẳng, đường tròn, conic, tối ưu hình phẳng và các mô hình hóa bằng tọa độ.

  Mục tiêu không phải tách đôi hai thế giới này, mà là tập cho người học đi qua lại giữa chúng một cách có ý thức.
]

#include "01b-bat-bien.typ"
#include "01c-quy-tich-bien-hinh.typ"
#include "01d-chon-he-truc.typ"
#include "01e-conic-va-the-gioi-that.typ"
#include "01f-doi-ngon-ngu.typ"
#include "01g-ngo-nhan-phang.typ"
#include "01h-hinh-hoc-va-toi-uu.typ"
