#import "../_theme.typ": *

== 17. Điều Kiện Đầu: Từ Họ Nguyên Hàm Tới Một Lịch Sử Cụ Thể

#why-box[
  Mỗi khi ta nói "tìm nguyên hàm", thật ra ta mới chỉ tìm được *một họ khả dĩ* của các câu chuyện. Điều kiện đầu là thứ chọn ra câu chuyện đang thực sự diễn ra.
]

#vd-box("16", "Biết tốc độ tăng trưởng chưa đủ để biết dân số")[
  Giả sử một quần thể có tốc độ tăng trưởng $P'(t) = r(t)$. Khi đó mọi hàm có dạng:
  $ P(t) = integral r(t) dif t + C $
  đều phù hợp với quy luật thay đổi cục bộ ấy.

  Nhưng muốn biết quần thể nào đang được nói tới, ta cần một mốc như $P(0) = P_0$. Chỉ khi đó, hằng số tích phân mới được khóa lại.
]

#core-box[
  Đây là điểm nối tự nhiên từ nguyên hàm sang phương trình vi phân sơ cấp:

  - đạo hàm cho ta quy luật biến thiên,
  - nguyên hàm phục hồi họ nghiệm,
  - điều kiện đầu chọn ra nghiệm của hiện tượng thực.

  Tức là giải tích không chỉ học công thức; nó học cách tái tạo một quá trình từ luật cục bộ cộng với dữ kiện gốc.
]

#bridge-box("Tại sao kỹ sư và nhà khoa học luôn quan tâm điều kiện đầu?")[
  Vì hai hệ có cùng luật biến thiên nhưng khác trạng thái khởi đầu có thể đi tới hai lịch sử hoàn toàn khác nhau. Trong chuyển động, đó là vị trí và vận tốc ban đầu. Trong tài chính, đó là vốn gốc ban đầu. Trong sinh học, đó là kích thước quần thể tại thời điểm xuất phát.
]

#open-q[
  Nếu đạo hàm cho ta luật cục bộ còn điều kiện đầu cho ta điểm xuất phát, vậy trong một mô hình thực, phần nào là "vật lý của hệ", phần nào là "hoàn cảnh riêng của ca đang xét"?
]
