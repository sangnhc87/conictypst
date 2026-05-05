#import "template.typ": *

#show: stexgv-doc.with(
  doc-type: "bo-de",
  title: "BỘ ĐỀ ÔN THI THPT MÔN TOÁN",
  subtitle: "Khung tuyển tập đề thi có reset trạng thái từng đề",
  author: "GV Nguyễn Văn Sang",
  institution: "Tổ Toán - Tài liệu nội bộ",
  subject: "Toán",
  grade: "Lớp 12",
  series: "Ôn thi 2026",
  academic-year: "2025-2026",
  cover-note: [Mỗi `#de(...)` tự reset số câu, số phần và dữ liệu đáp án, phù hợp để ghép nhiều đề trong cùng một tài liệu.],
)

#luuybode[
  - Dùng `#de(...)` cho từng đề riêng biệt trong cùng bộ đề.
  - Nếu muốn in đáp án của đề nào thì bật `show-answer-key: true` ngay trong `#de(...)` đó.
  - Có thể chèn `#matran`, `#dacta`, `#huongdancham` trước hoặc sau mỗi đề.
]

#matran[
  - Nhận biết: khoảng 30% số câu.
  - Thông hiểu: khoảng 30% số câu.
  - Vận dụng: khoảng 25% số câu.
  - Vận dụng cao: khoảng 15% số câu.
]

#dacta[
  - Phần I: trắc nghiệm nhiều phương án lựa chọn.
  - Phần II: trắc nghiệm đúng sai.
  - Phần III: trả lời ngắn.
  - Phần IV: tự luận.
]

#let (tn, ds, tln, tl) = exam-mode()

#de(
  title: [Đề số 1. Hàm số và ứng dụng đạo hàm],
  department: "TRƯỜNG THPT MINH HOẠ",
  school: "TỔ TOÁN",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  code: "101",
  footer-left: [Bộ đề minh hoạ],
  show-answer-key: true,
)[
  #exam-part([PHẦN I. Trắc nghiệm nhiều phương án lựa chọn])

  #tn(
    [Hàm số $y = x^3 - 3x$ có bao nhiêu điểm cực trị?],
    ([$0$], [$1$], True([$2$]), [$3$]),
    loigiai: [Ta có $y' = 3x^2 - 3 = 3(x - 1)(x + 1)$ nên hàm số có hai điểm cực trị tại $x = -1$ và $x = 1$.],
  )

  #tn(
    [Tiếp tuyến của đồ thị $y = x^2$ tại điểm có hoành độ $x = 1$ có hệ số góc bằng bao nhiêu?],
    ([$0$], [$1$], True([$2$]), [$4$]),
    loigiai: [Đạo hàm là $y' = 2x$, tại $x = 1$ suy ra hệ số góc bằng $2$.],
  )

  #exam-part([PHẦN II. Trắc nghiệm đúng sai])

  #ds(
    [Xét hàm số $f(x) = x^2$. Đánh giá các khẳng định sau.],
    (
      True([Hàm số đồng biến trên khoảng $(0; +oo)$.]),
      True([Hàm số nghịch biến trên khoảng $(-oo; 0)$.]),
      True([Đồ thị hàm số nhận trục $O y$ làm trục đối xứng.]),
      [Giá trị nhỏ nhất của hàm số bằng $1$.],
    ),
    loigiai: [Ba khẳng định đầu đúng. Khẳng định cuối sai vì giá trị nhỏ nhất của hàm số là $0$ tại $x = 0$.],
  )

  #exam-part([PHẦN III. Trả lời ngắn])

  #tln(
    [Giải phương trình $2x - 5 = 7$.],
    [$6$],
    loigiai: [Ta có $2x = 12$ nên $x = 6$.],
  )

  #exam-part([PHẦN IV. Tự luận])

  #tl(
    [Khảo sát sự biến thiên và vẽ phác đồ thị của hàm số $y = x^3 - 3x + 1$.],
    loigiai: [
      Tính đạo hàm $y' = 3x^2 - 3$, lập bảng biến thiên, xác định cực trị tại $x = -1$ và $x = 1$, sau đó suy ra dạng đồ thị.
    ],
    lines: 5,
  )
]

#de(
  title: [Đề số 2. Xác suất và hình học tọa độ],
  department: "TRƯỜNG THPT MINH HOẠ",
  school: "TỔ TOÁN",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  code: "102",
  footer-left: [Bộ đề minh hoạ],
  show-answer-key: true,
)[
  #exam-part([PHẦN I. Trắc nghiệm nhiều phương án lựa chọn])

  #tn(
    [Trong không gian với hệ tọa độ $O x y z$, vectơ nào sau đây là vectơ pháp tuyến của mặt phẳng $x + 2y - z + 3 = 0$?],
    (True([$(1; 2; -1)$]), [$(1; -2; 1)$], [$(0; 2; -1)$], [$(3; 0; 0)$]),
    loigiai: [Với phương trình mặt phẳng $a x + b y + c z + d = 0$, một vectơ pháp tuyến là $(a; b; c)$.],
  )

  #exam-part([PHẦN II. Trả lời ngắn])

  #tln(
    [Một hộp có $5$ viên bi đỏ và $3$ viên bi xanh. Chọn ngẫu nhiên một viên bi. Xác suất lấy được viên bi đỏ bằng bao nhiêu?],
    [$5/8$],
    loigiai: [Xác suất cần tìm bằng số kết quả thuận lợi chia số kết quả có thể xảy ra, nên bằng $5/(5+3) = 5/8$.],
  )

  #exam-part([PHẦN III. Tự luận])

  #tl(
    [Trong mặt phẳng toạ độ, viết phương trình đường tròn tâm $I(2; -1)$ bán kính $3$.],
    loigiai: [Phương trình đường tròn là $(x - 2)^2 + (y + 1)^2 = 9$.],
    lines: 3,
  )
]

#huongdancham[
  - Với câu tự luận, nên tách thang điểm theo từng ý nhỏ: xác định công thức, biến đổi đúng, kết luận đúng.
  - Với câu trắc nghiệm, đáp án tự động đã đủ cho phần chấm nhanh, nhưng vẫn nên lưu lời giải mẫu để đối chiếu.
]