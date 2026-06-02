#import "../_theme.typ": *

== 18. Khi Không Có Nguyên Hàm Đẹp: Tích Phân Số Và Phẩm Chất Của Sự Gần Đúng

#why-box[
  Một bước trưởng thành rất quan trọng là chấp nhận sự thật này: không phải tích phân nào cũng có nguyên hàm sơ cấp đẹp. Nhưng điều đó không làm bài toán chết. Nó chỉ buộc ta đổi chuẩn mực: từ *đúng tuyệt đối bằng công thức đóng* sang *đúng đủ tốt bằng phương pháp xấp xỉ có kiểm soát*.
]

#history-box("Newton, Cotes, Simpson và truyền thống xấp xỉ")[
  Trước thời máy tính, các nhà toán học và thiên văn học đã phải sống bằng xấp xỉ số. Newton–Cotes, hình thang, Simpson không phải công cụ phụ cho kẻ yếu; chúng là những cây cầu thực chiến nối lý thuyết tích phân với dữ liệu đo đạc thật.
]

#vd-box("17", "Diện tích được xấp xỉ như thế nào?")[
  Nếu biết giá trị của $f(x)$ tại nhiều điểm trên đoạn $[a,b]$, ta có thể thay đường cong bằng những hình chữ nhật, hình thang hay cung parabol ngắn, rồi cộng diện tích các mảnh ấy lại.

  Sự khác nhau giữa các phương pháp không nằm ở chuyện "bấm kiểu nào", mà ở việc hình nào mô phỏng tốt đường cong thật hơn trên từng đoạn nhỏ.
]

#essay-box("Chính xác không phải lúc nào cũng là biểu thức đóng")[
  Trong khoa học hiện đại, một kết quả số có sai số được kiểm soát đôi khi còn giá trị hơn một biểu thức đẹp nhưng không đọc ra được lượng nào cụ thể. Học tích phân số là học một phẩm chất nhận thức: biết khi nào nên truy cầu công thức, khi nào nên chuyển sang ước lượng.
]

#workshop-box("Ba câu hỏi trước khi xấp xỉ")[
  - Hàm đang biến thiên êm hay dao động mạnh?
  - Cần độ chính xác đến mức nào cho bối cảnh thực tế?
  - Sai số phát sinh từ bước chia lưới, từ mô hình, hay từ dữ liệu đo?
]
