#import "../../giao-an/modules/lecture-beamer.typ": *

#show: lecture-theme.with(
  title: [Biến Cố Hợp, Giao & Độc Lập],
  subtitle: [TOÁN 11 — QUY TẮC TÍNH XÁC SUẤT],
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
// PHẦN I: BIẾN CỐ HỢP VÀ GIAO
// ════════════════════════════════════════════════
#lt-section-link("sec-hop-giao", "📚", [I. Biến cố Hợp và Biến cố Giao])

#lt-slide-back(title: "📚 Định nghĩa Hợp và Giao")[
  #lt-definition(title: "1. Biến cố hợp")[
    Cho hai biến cố $A$ và $B$. Biến cố "$A$ hoặc $B$ xảy ra" được gọi là biến cố hợp của $A$ và $B$.
    Ký hiệu: $A union B$.
    *Nghĩa là:* Ít nhất một trong hai biến cố $A, B$ xảy ra.
  ]
  #lt-definition(title: "2. Biến cố giao")[
    Biến cố "Cả $A$ và $B$ cùng xảy ra" được gọi là biến cố giao của $A$ và $B$.
    Ký hiệu: $A inter B$ (hoặc viết gọn là $A B$).
    *Nghĩa là:* Hai biến cố $A, B$ đồng thời xảy ra.
  ]
]

#lt-slide-back(title: "⚡ Hai biến cố xung khắc")[
  #lt-theorem(title: "Định nghĩa Xung khắc")[
    Hai biến cố $A$ và $B$ được gọi là xung khắc nếu chúng không thể đồng thời xảy ra.
    Ký hiệu: $A inter B = emptyset$.
  ]
  #lt-example(title: "Ví dụ trực quan")[
    Gieo một con xúc xắc.
    - $A$: "Mặt xuất hiện là số chẵn" = ${2, 4, 6}$.
    - $B$: "Mặt xuất hiện là số lẻ" = ${1, 3, 5}$.
    Rõ ràng $A$ và $B$ không có kết quả chung nào, nên $A$ và $B$ là hai biến cố xung khắc.
  ]
]

// ════════════════════════════════════════════════
// PHẦN II: BIẾN CỐ ĐỘC LẬP
// ════════════════════════════════════════════════
#lt-section-link("sec-doc-lap", "🚀", [II. Biến Cố Độc Lập])

#lt-slide-back(title: "🚀 Khái niệm Độc lập")[
  #lt-definition(title: "Định nghĩa")[
    Hai biến cố $A$ và $B$ được gọi là độc lập nếu việc xảy ra hay không xảy ra của biến cố này *không làm ảnh hưởng* tới xác suất xảy ra của biến cố kia.
  ]
  #lt-example(title: "Ví dụ về tính độc lập")[
    Bạn An gieo một đồng xu, bạn Bình gieo một con xúc xắc.
    - $A$: "Đồng xu ra mặt Sấp".
    - $B$: "Xúc xắc ra mặt 6 chấm".
    Rõ ràng kết quả của đồng xu không ảnh hưởng gì đến con xúc xắc. Do đó $A$ và $B$ là hai biến cố độc lập.
  ]
  #lt-warning(title: "Phân biệt Xung khắc và Độc lập")[
    - **Xung khắc:** Không thể cùng xảy ra (liên quan đến kết quả tập hợp).
    - **Độc lập:** Kết quả này không ảnh hưởng đến khả năng xảy ra của kết quả kia.
  ]
]

// ════════════════════════════════════════════════
// TRẮC NGHIỆM
// ════════════════════════════════════════════════
#lt-section-link("sec-quiz", "✏️", [III. Luyện tập Trắc Nghiệm])

#lt-exercise-hub(
  title: [📋 BẢNG ĐIỀU HƯỚNG BÀI TẬP — CÁC LOẠI BIẾN CỐ],
  questions: (
    (num: 1, type: "TN", desc: [Xác định biến cố hợp]),
    (num: 2, type: "TN", desc: [Biến cố giao là gì?]),
    (num: 3, type: "TN", desc: [Nhận diện biến cố xung khắc]),
    (num: 4, type: "TN", desc: [Nhận diện biến cố độc lập]),
    (num: 5, type: "TN", desc: [Phân biệt xung khắc và độc lập]),
  ),
  back-to: "lec-toc-main"
)

#lt-tn(
  [Cho hai biến cố $A$ và $B$. Biến cố "$A$ hoặc $B$ xảy ra" được ký hiệu là:],
  (
    [$A inter B$],
    [$A union B$],
    [$A \\ B$],
    [$A B$]
  ),
  correct: 1,
  num: 1,
  de: "Ký hiệu biến cố hợp",
  loigiai: [
    Biến cố hợp (ít nhất một trong hai xảy ra, chữ "hoặc") được ký hiệu là $A union B$.
  ]
)

#lt-tn(
  [Gieo một con xúc xắc. Gọi $A$ là biến cố "Xuất hiện mặt chẵn", $B$ là biến cố "Xuất hiện mặt chia hết cho 3". Biến cố giao $A inter B$ là tập hợp nào?],
  (
    [${6}$],
    [${2, 4, 6}$],
    [${3, 6}$],
    [${2, 3, 4, 6}$]
  ),
  correct: 0,
  num: 2,
  de: "Xác định biến cố giao",
  loigiai: [
    Ta có $A = {2, 4, 6}$ và $B = {3, 6}$.
    Biến cố giao $A inter B$ gồm các phần tử chung của $A$ và $B$, tức là ${6}$.
  ]
)

#lt-tn(
  [Hai biến cố $A$ và $B$ được gọi là xung khắc khi và chỉ khi:],
  (
    [$A union B = Omega$],
    [$A inter B = emptyset$],
    [$A$ độc lập với $B$],
    [$P(A) + P(B) = 1$]
  ),
  correct: 1,
  num: 3,
  de: "Định nghĩa xung khắc",
  loigiai: [
    Hai biến cố xung khắc khi chúng không thể cùng xảy ra, tức là tập hợp kết quả chung của chúng là rỗng: $A inter B = emptyset$.
  ]
)

#lt-tn(
  [Trong một bài thi trắc nghiệm, hai học sinh $X$ và $Y$ làm bài hoàn toàn độc lập với nhau. $A$ là biến cố "$X$ làm đúng câu 1", $B$ là biến cố "$Y$ làm đúng câu 1". Khẳng định nào sau đây ĐÚNG?],
  (
    [$A$ và $B$ là hai biến cố xung khắc.],
    [$A$ và $B$ là hai biến cố đối nhau.],
    [$A$ và $B$ là hai biến cố độc lập.],
    [$A$ và $B$ là cùng một biến cố.]
  ),
  correct: 2,
  num: 4,
  de: "Nhận diện biến cố độc lập",
  loigiai: [
    Vì 2 học sinh làm bài độc lập, việc bạn X làm đúng hay sai không ảnh hưởng đến khả năng làm đúng hay sai của bạn Y. Vậy $A, B$ là hai biến cố độc lập.
  ]
)

#lt-tn(
  [Phát biểu nào sau đây là SAI khi nói về biến cố xung khắc và độc lập?],
  (
    [Hai biến cố xung khắc thì không thể cùng xảy ra.],
    [Hai biến cố độc lập thì có thể cùng xảy ra.],
    [Hai biến cố đã xung khắc (và khác rỗng) thì chắc chắn không độc lập.],
    [Hai biến cố không xung khắc thì chắc chắn là độc lập.]
  ),
  correct: 3,
  num: 5,
  de: "Phân biệt xung khắc và độc lập",
  loigiai: [
    Câu D sai. Hai biến cố không xung khắc (tức là có thể cùng xảy ra) vẫn có thể phụ thuộc nhau (không độc lập). Ví dụ: Lấy 1 lá bài từ bộ 52 lá, $A=$ "Rút được lá Cơ", $B=$ "Rút được lá màu Đỏ". Rõ ràng có lá Cơ Đỏ nên không xung khắc, nhưng xác suất rút lá Cơ thay đổi tuỳ thuộc việc lá bài có màu đỏ hay không (chúng phụ thuộc).
  ]
)
