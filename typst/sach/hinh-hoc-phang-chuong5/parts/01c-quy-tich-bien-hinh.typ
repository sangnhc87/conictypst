#import "../_theme.typ": *

== 8. Quỹ Tích Và Biến Hình: Khi Một Điểm Bắt Đầu Chạy

#why-box[
  Nhiều học sinh coi quỹ tích là một chương hơi cơ học: đọc điều kiện, nhớ mẫu, rồi đoán “đường trung trực”, “đường tròn”, “elip”, “hypebol”. Nhưng quỹ tích thực ra là nơi hình học bắt đầu sống động. Một điểm được phép chạy, và ta hỏi: dưới một ràng buộc nào đó, nó được phép sống trên vùng nào của mặt phẳng?
]

#vd-box("7", "Từ đường trung trực tới elip: cùng một ý tưởng, nhiều mức độ")[
  Nếu yêu cầu là $M A = M B$, ta được đường trung trực của $A B$. Nếu yêu cầu là $M A + M B$ không đổi, ta tiến gần tới elip. Nếu yêu cầu là $|M A - M B|$ không đổi, ta tiến gần tới hypebol.

  Điều quan trọng không phải là học thuộc ba đáp án ấy. Điều quan trọng là nhận ra: *quỹ tích được sinh ra bởi một ràng buộc*. Thay ràng buộc, quỹ tích đổi theo.
]

#history-box("Apollonius và tinh thần quỹ tích")[
  Truyền thống hình học Hy Lạp rất mạnh ở chỗ họ không chỉ quan tâm tới một hình vẽ cố định. Họ quan tâm tới cả một họ hình được sinh ra từ cùng một quy luật. Chính tinh thần ấy về sau nuôi dưỡng mạnh mẽ các nghiên cứu về conic, về quỹ tích, và xa hơn nữa là về tọa độ hóa các tập điểm.
]

#eye-box[
  Quỹ tích hiếm khi nên bắt đầu bằng công thức. Nó nên bắt đầu bằng câu hỏi: *điểm đang bị buộc bởi loại quan hệ nào*? Quan hệ đối xứng? Quan hệ khoảng cách? Quan hệ góc? Quan hệ tổng-hiệu? Chọn đúng loại quan hệ, nửa bài toán đã sáng.
]

#link-box[
  Biến hình là người bạn tự nhiên của quỹ tích. Phép đối xứng giúp nhìn những tập điểm cách đều. Phép quay giúp đóng gói những cấu hình góc cố định. Phép tịnh tiến và vị tự giúp biến các họ hình có vẻ rời nhau thành một mạch thống nhất.
]

#tech-box[
  *Phân loại các phép biến hình trong chương trình phổ thông:*
  
  - *Phép dời hình (Bảo toàn khoảng cách):* Gồm phép tịnh tiến $T_(vec(v))$, đối xứng trục $D_d$, đối xứng tâm $D_I$, và phép quay $Q_((O, alpha))$. Chúng bảo toàn khoảng cách giữa hai điểm bất kỳ và biến một hình thành hình bằng nó.
  - *Phép đồng dạng (Nhân tỉ lệ khoảng cách):* Gồm phép vị tự $V_((I, k))$ (tâm $I$, tỉ số $k$). Phép vị tự nhân mọi khoảng cách với $|k|$ và bảo toàn góc.
  
  *Mẹo tư duy:* Khi thấy hai hình giống hệt nhau nhưng có tỉ lệ kích thước khác nhau (đồng dạng), nghĩ ngay đến *phép vị tự*. Khi thấy hình bị xoay đi một góc cố định quanh một đỉnh, nghĩ ngay đến *phép quay*.
]

#open-q[
  Nếu một điểm $M$ di động trên một đường tròn $(C)$ cố định, và điểm $N$ được xác định sao cho tam giác $A M N$ luôn là tam giác đều hướng ra phía ngoài (với $A$ là một điểm cố định). Quỹ tích của điểm $N$ sẽ là hình gì? Hãy thử lập luận bằng phép quay tâm $A$ góc quay $60^degree$!
]
