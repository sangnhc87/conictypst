#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title: [Không Gian Mẫu & Biến Cố],
  subtitle: [TOÁN 10 — NHẬP MÔN XÁC SUẤT],
  author: [GV Nguyễn Văn Sang],
  institution: [THPT Nguyễn Hữu Cảnh],
  date: [Năm học 2026 – 2027],
  base-size: 19pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#let lt-tip(title: "Mẹo hay", body) = lt-note(title: title, icon: "💡", body)
#let lt-important(title: "Quan trọng", body) = lt-note(title: title, icon: "📌", body)
#let lt-warning(title: "Cảnh báo", body) = lt-note(title: title, icon: "⚠️", body)

// ════════════════════════════════════════════════
// MỤC LỤC
// ════════════════════════════════════════════════
#lt-toc(title: [🗺️ NỘI DUNG CHUYÊN SÂU])

// ════════════════════════════════════════════════
// PHẦN I: KHÔNG GIAN MẪU
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet-1", "📚", [I. Phép Thử & Không Gian Mẫu])

#lt-slide-back(title: "📚 Các Khái Niệm Cơ Bản")[
  #lt-definition(title: "1. Phép thử ngẫu nhiên")[
    Phép thử ngẫu nhiên là một phép thử mà ta không thể đoán trước được kết quả của nó, nhưng biết được tập hợp tất cả các kết quả có thể xảy ra.
    _Ví dụ: Tung một đồng xu, gieo một con xúc xắc, rút một lá bài._
  ]
  #v(0.2em)
  #lt-definition(title: "2. Không gian mẫu (Omega)")[
    Tập hợp *tất cả* các kết quả có thể xảy ra của một phép thử ngẫu nhiên được gọi là không gian mẫu.
    Ký hiệu: $Omega$ (Omega).
    Số phần tử của không gian mẫu ký hiệu là $n(Omega)$.
  ]
]

#lt-slide-back(title: "⚡ Ví dụ về Không gian mẫu")[
  #lt-example(title: "Ví dụ 1: Tung đồng xu và gieo xúc xắc")[
    *Tung một đồng xu 1 lần:* 
    Đồng xu có 2 mặt Sấp ($S$) và Ngửa ($N$).
    $=> Omega = {S, N}$. Số phần tử: $n(Omega) = 2$.
    
    *Gieo một con xúc xắc 1 lần:*
    Xúc xắc có 6 mặt đánh số từ 1 đến 6 chấm.
    $=> Omega = {1, 2, 3, 4, 5, 6}$. Số phần tử: $n(Omega) = 6$.
  ]
  
  #lt-example(title: "Ví dụ 2: Tung đồng xu 2 lần liên tiếp")[
    Kết quả mỗi lần là $S$ hoặc $N$. Ta liệt kê theo sơ đồ cây:
    $=> Omega = {S S, S N, N S, N N}$. Số phần tử: $n(Omega) = 2 dot 2 = 4$.
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: BIẾN CỐ
// ════════════════════════════════════════════════
#lt-section-link("sec-ly-thuyet-2", "🚀", [II. Biến Cố & Các Phép Toán])

#lt-slide-back(title: "🚀 Biến Cố Là Gì?")[
  #lt-definition(title: "Khái niệm biến cố")[
    Biến cố là một tập con của không gian mẫu. Ký hiệu thường dùng: $A, B, C, ...$
    - Tập rỗng $emptyset$ được gọi là *biến cố không thể* (không bao giờ xảy ra).
    - Tập $Omega$ được gọi là *biến cố chắc chắn* (luôn luôn xảy ra).
  ]
  
  #lt-example(title: "Ví dụ: Gieo xúc xắc 1 lần")[
    $Omega = {1, 2, 3, 4, 5, 6}$.
    Gọi $A$ là biến cố: "Mặt xuất hiện có số chấm là số chẵn".
    $=> A = {2, 4, 6}$. Số phần tử của $A$ là $n(A) = 3$.
    Kết quả thuận lợi cho $A$ là 2, 4, 6.
  ]
]

#lt-slide-back(title: "🚀 Biến Cố Đối")[
  #lt-theorem(title: "Định nghĩa Biến cố đối")[
    Cho biến cố $A$. Biến cố "Không xảy ra $A$" được gọi là biến cố đối của $A$, ký hiệu là $overline(A)$.
    Về mặt tập hợp: $overline(A) = Omega \\ A$.
    Và ta luôn có: $n(A) + n(overline(A)) = n(Omega)$.
  ]
  
  #lt-tip(title: "Khi nào dùng biến cố đối?")[
    Khi tính toán trực tiếp biến cố $A$ quá phức tạp (có nhiều trường hợp, hoặc chứa từ "ít nhất", "tối thiểu"), ta tính $n(overline(A))$ rồi lấy $n(Omega) - n(overline(A))$.
  ]
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [III. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — XÁC SUẤT CƠ BẢN],
  questions: (
    (num: 1, type: "TN", desc: [Không gian mẫu gieo xúc xắc]),
    (num: 2, type: "TN", desc: [Không gian mẫu gieo đồng xu]),
    (num: 3, type: "TN", desc: [Xác định biến cố thuận lợi]),
    (num: 4, type: "TN", desc: [Biến cố đối của "ít nhất"]),
    (num: 5, type: "TN", desc: [Sử dụng phần bù để tính]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Gieo một con xúc xắc cân đối đồng chất 2 lần. Số phần tử của không gian mẫu $n(Omega)$ là:],
  (
    [$6$],
    [$12$],
    [$36$],
    [$64$]
  ),
  correct: 2,
  num: 1,
  de: "Không gian mẫu gieo xúc xắc 2 lần",
  loigiai: [
    Lần 1 có 6 kết quả. Lần 2 có 6 kết quả.
    Theo quy tắc nhân, số kết quả có thể là $6 dot 6 = 36$.
  ]
)

#lt-tn(
  [Tung một đồng xu 3 lần liên tiếp. Tập hợp các kết quả của không gian mẫu có bao nhiêu phần tử?],
  (
    [$3$],
    [$6$],
    [$8$],
    [$9$]
  ),
  correct: 2,
  num: 2,
  de: "Không gian mẫu gieo đồng xu 3 lần",
  loigiai: [
    Mỗi lần tung đồng xu có 2 kết quả ($S, N$).
    Tung 3 lần: $2 dot 2 dot 2 = 8$.
  ]
)

#lt-tn(
  [Gieo 1 con xúc xắc. Gọi $A$ là biến cố "Xuất hiện mặt có số chấm lớn hơn 4". Số phần tử của $A$ là:],
  (
    [$1$],
    [$2$],
    [$3$],
    [$4$]
  ),
  correct: 1,
  num: 3,
  de: "Liệt kê biến cố",
  loigiai: [
    $Omega = {1, 2, 3, 4, 5, 6}$.
    Biến cố $A$: Số chấm lớn hơn 4 $=> A = {5, 6}$.
    Vậy $n(A) = 2$.
  ]
)

#lt-tn(
  [Gọi $A$ là biến cố "Có ít nhất một học sinh nữ trong nhóm 3 người được chọn". Biến cố đối của $A$ là:],
  (
    [Có đúng một học sinh nữ],
    [Không có học sinh nữ nào (toàn nam)],
    [Có toàn học sinh nữ],
    [Có ít nhất một học sinh nam]
  ),
  correct: 1,
  num: 4,
  de: "Ý nghĩa biến cố đối",
  loigiai: [
    Phủ định của "Ít nhất một (có thể 1, 2, 3)" là "Không có cái nào cả (tức là 0)".
    Do đó, biến cố đối là "Không có học sinh nữ nào".
  ]
)

#lt-tn(
  [Trong 1 hộp có 5 bi xanh và 4 bi đỏ. Chọn ngẫu nhiên 2 viên bi. Số phần tử của không gian mẫu là:],
  (
    [$9$],
    [$20$],
    [$36$],
    [$72$]
  ),
  correct: 2,
  num: 5,
  de: "Không gian mẫu tổ hợp",
  loigiai: [
    Tổng số bi là $5 + 4 = 9$ viên.
    Chọn ngẫu nhiên 2 viên từ 9 viên (không phân biệt thứ tự), số phần tử không gian mẫu là:
    $n(Omega) = C_9^2 = (9 dot 8) / 2 = 36$.
  ]
)
