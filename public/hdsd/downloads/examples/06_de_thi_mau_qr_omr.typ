// ================================================================
// ĐỀ THI MẪU TÍCH HỢP MÃ QR ĐÁP ÁN OMR (SANG-MATH 1.0.6)
// Biên dịch: typst compile 06_de_thi_mau_qr_omr.typ
// ================================================================

// Cách 1: Dùng trực tiếp từ package sang-math:1.0.6 (khuyên dùng khi đã cài hoặc dùng trên Typst Universe)
#import "@preview/sang-math:1.0.6": *

// Cách 2: Nếu muốn import module con omr-qr cục bộ (khi dùng file rời)
// #import "omr-qr.typ": sang-omr-qr

#let ma-de = "101"
#let in-qr-dap-an = true // Đổi thành true để in trang mã QR OMR cho Giáo viên chấm bài

// Cấu hình Preset giao diện đề thi
#let preset = exam-preset(
  theme: "teal-pro",          // classic | ocean | emerald | royal | teal-pro...
  profile: "dethi",           // "dethi" (phát học sinh) hoặc "loigiai"
  two-columns: false,         // false: bố cục chuẩn cho trang in QR & đáp án
  opt-style: "circle",        // Ⓐ Ⓑ Ⓒ Ⓓ
  answer-key: true,           // In bảng đáp án A-B-C-D ở trang cuối
)

#let (tn, ds, tln, tl) = exam-mode(..preset.question)
#show: sang-setup.with(math-color: preset.accent)

#show: exam-theme.with(
  theme: preset.theme,
  school: "TRƯỜNG THPT SANG-MATH",
  exam-title: "ĐỀ KIỂM TRA CHẤT LƯỢNG ĐỊNH KỲ",
  subject: "TOÁN HỌC - KHỐI 12",
  duration: "90 phút",
  code: ma-de,
  ..preset.template,
)

// ════════════════════════════════════════════════════════════════
// PHẦN I. CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN (12 câu)
// ════════════════════════════════════════════════════════════════
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 12)

#tn([Cho hàm số $y=f(x)$ có đạo hàm $f'(x) = x(x-1)^2$. Số điểm cực trị của hàm số là], (
  [$0$],
  True([$1$]),
  [$2$],
  [$3$],
), loigiai: [$f'(x)$ chỉ đổi dấu qua nghiệm đơn $x=0$, không đổi dấu qua nghiệm kép $x=1$. Vậy hàm số có $1$ cực trị.])

#tn([Đồ thị hàm số $y = (2x - 1)/(x + 1)$ có đường tiệm cận ngang là], (
  [$y = 1$],
  [$x = -1$],
  True([$y = 2$]),
  [$x = 2$],
), loigiai: [$lim_(x -> +oo) (2x - 1)/(x + 1) = 2 => y = 2$ là tiệm cận ngang.])

#tn([Trong không gian $O x y z$, cho $A(1; 2; -3)$ và $B(3; 0; 1)$. Tọa độ trung điểm $M$ của $A B$ là], (
  [$(2; 1; -2)$],
  True([$(2; 1; -1)$]),
  [$(4; 2; -2)$],
  [$(1; -1; 2)$],
), loigiai: [$M = ((1+3)/2; (2+0)/2; (-3+1)/2) = (2; 1; -1)$.])

#tn([Tập xác định của hàm số $y = log_3 (2x - 4)$ là], (
  [$[2; +oo)$],
  [$RR \\ {2}$],
  True([$(2; +oo)$]),
  [$(0; +oo)$],
), loigiai: [Điều kiện: $2x - 4 > 0 <=> x > 2$.])

// ════════════════════════════════════════════════════════════════
// PHẦN II. CÂU HỎI TRẮC NGHIỆM ĐÚNG / SAI (4 câu)
// ════════════════════════════════════════════════════════════════
#exam-part([PHẦN II. Câu trắc nghiệm đúng / sai], count: 4)

#ds([Cho hàm số $f(x) = x^3 - 3 x + 2$. Xét tính đúng/sai của các khẳng định:], (
  True([$f'(x) = 3 x^2 - 3$.]),
  True([Hàm số đạt cực đại tại điểm $x = -1$.]),
  [Giá trị cực tiểu của hàm số bằng $2$.],
  True([Điểm uốn của đồ thị là $I(0; 2)$.]),
), loigiai: [
  - a) Đúng vì $(x^3 - 3x + 2)' = 3x^2 - 3$.
  - b) Đúng vì $f'(-1) = 0$ và $f''(-1) = -6 < 0$.
  - c) Sai vì cực tiểu tại $x = 1$, $f(1) = 0$.
  - d) Đúng vì $f''(x) = 6x = 0 <=> x = 0 => y = 2$.
])

#ds([Trong không gian $O x y z$, cho mặt cầu $(S): (x-1)^2 + (y+2)^2 + (z-3)^2 = 16$.], (
  True([Tâm mặt cầu là $I(1; -2; 3)$.]),
  [Bán kính mặt cầu bằng $16$.],
  True([Mặt phẳng $(O x y)$ cắt $(S)$ theo một đường tròn.]),
  [Điểm $O(0; 0; 0)$ nằm ngoài mặt cầu $(S)$.],
), loigiai: [
  - a) Đúng: Tâm $I(1; -2; 3)$.
  - b) Sai: Bán kính $R = sqrt(16) = 4$.
  - c) Đúng: Khoảng cách từ $I$ đến $(O x y)$ là $|z_I| = 3 < 4 = R$.
  - d) Sai: $O I^2 = 1^2 + (-2)^2 + 3^2 = 14 < 16 => O$ nằm trong $(S)$.
])

// ════════════════════════════════════════════════════════════════
// PHẦN III. CÂU HỎI TRẮC NGHIỆM TRẢ LỜI NGẮN (6 câu)
// ════════════════════════════════════════════════════════════════
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)

#tln([Cho tam giác $A B C$ có $A B = 3, A C = 4, hat(B A C) = 60^circ$. Tính diện tích tam giác $A B C$ (làm tròn đến hàng phần mười).], [5.2], loigiai: [
  $S = 1/2 A B dot A C dot sin 60^circ = 1/2 dot 3 dot 4 dot (sqrt(3))/2 = 3 sqrt(3) approx 5{,}196 approx 5{,}2$.
])

#tln([Tìm giá trị lớn nhất của hàm số $f(x) = -x^2 + 4x + 5$ trên đoạn $[0; 5]$.], [9], loigiai: [
  $f'(x) = -2x + 4 = 0 <=> x = 2 in [0; 5]$. $f(0) = 5, f(2) = 9, f(5) = 0$. Vậy $max = 9$.
])

#het

// ════════════════════════════════════════════════════════════════
// TRANG MÃ QR ĐÁP ÁN OMR — BẢN GIÁO VIÊN
// Giáo viên mở ứng dụng Sang Math OMR, chọn "Quét QR trực tiếp" để nạp key và chấm bài
// ════════════════════════════════════════════════════════════════
#if in-qr-dap-an [
  #pagebreak()
  #align(center)[
    #text(weight: "bold", size: 15pt, fill: preset.accent)[QR ĐÁP ÁN OMR - BẢN GIÁO VIÊN]
    #v(0.5em)
    #text(size: 10pt)[Mã đề #ma-de. Mở Sang Math OMR, chọn “Quét QR trực tiếp” để nạp key và chấm bài.]
    #v(1em)
    #sang-omr-qr(
      ma-de: ma-de, 
      show-info: true, 
      pts: (mcq: 0.25, tf: 0.1, tf-full: 0.5, sh: 0.5)
    )
  ]
]

// In bảng đáp án truyền thống ở cuối trang
#if preset.template.at("answer-key", default: false) {
  print-answer-key()
}
