// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C4-BÀI 1.1: NGUYÊN HÀM CƠ BẢN (CHUYÊN SÂU BẢN CHẤT)
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 1.1: NGUYÊN HÀM CƠ BẢN",
  subtitle:    "Bản chất Đạo hàm ngược & Ứng dụng thực tiễn",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Tại sao cần Đạo hàm ngược?")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Câu chuyện Lịch sử & Thực tiễn:]
    
    Vào thế kỷ 17, Isaac Newton nghiên cứu chuyển động của các hành tinh. Ông biết rằng *gia tốc* $a(t)$ của một vật thể rơi tự do là hằng số (gia tốc trọng trường $g = 9.8 m/s^2$).
    
    *Vấn đề:* Nếu chỉ biết gia tốc (sự thay đổi vận tốc), làm sao để tìm lại được *vận tốc* $v(t)$ và *quãng đường* $S(t)$ vật đã đi được?
  ]
  
  #v(1em)
  #text(weight: "bold", fill: rgb("#0369a1"))[Giải pháp: Phép toán lật ngược thời gian]
  
  Ở Học kỳ 1, ta đã biết: Có Quãng đường $S(t)$ $arrow.r^("đạo hàm")$ Vận tốc $v(t)$ $arrow.r^("đạo hàm")$ Gia tốc $a(t)$.
  Bây giờ, ta cần một phép toán "ngược lại" để đi từ $a(t) arrow.r v(t) arrow.r S(t)$. Phép toán đó chính là *Nguyên hàm* (Anti-derivative).
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Bản chất: Hàm số $F(x)$ và Hằng số $C$")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    *1. Định nghĩa Nguyên hàm:*
    Hàm số $F(x)$ được gọi là *một nguyên hàm* của $f(x)$ trên tập $K$ nếu:
    $ F'(x) = f(x) quad forall x in K $
  ]
  
  #v(0.5em)
  #block(fill: rgb("#fffbeb"), stroke: 1pt + rgb("#fde68a"), inset: 10pt, radius: 5pt, width: 100%)[
    *2. Tại sao lại là "Họ" nguyên hàm (+C)?*
    Xét hàm $f(x) = 2x$. 
    - Ta thấy $(x^2)' = 2x$.
    - Nhưng $(x^2 + 5)' = 2x$.
    - $(x^2 - 100)' = 2x$.
    
    Rõ ràng, hằng số khi đạo hàm sẽ biến mất (bằng 0). Do đó, khi làm ngược lại (tìm nguyên hàm), ta không thể biết hằng số ban đầu là bao nhiêu. 
    Ta dùng chữ $C$ đại diện cho một hằng số bất kỳ.
    $ int f(x) d x = F(x) + C $
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Tính chất & Sai lầm kinh điển")[
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Tính chất tuyến tính (Giống hệt Đạo hàm):*
    1. Đưa hệ số ra ngoài: $int k dot f(x) d x = k int f(x) d x$ (với $k eq.not 0$).
    2. Tách tổng/hiệu: $int [f(x) +- g(x)] d x = int f(x) d x +- int g(x) d x$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#fecaca"), inset: 10pt, radius: 5pt, width: 100%)[
    #text(weight: "bold", fill: rgb("#991b1b"))[⚠️ SAI LẦM KINH ĐIỂN CỦA HỌC SINH:]
    
    Học sinh thường tự sáng tác công thức:
    - *Sai lầm 1:* $int [f(x) dot g(x)] d x = int f(x) d x dot int g(x) d x$ (SAI!)
    - *Sai lầm 2:* $int (f(x))/(g(x)) d x = (int f(x) d x)/(int g(x) d x)$ (SAI!)
    
    *Cách khắc phục:* Không có quy tắc nguyên hàm cho tích/thương trực tiếp. Gặp phép nhân/chia đa thức, phải *NHÂN PHÂN PHỐI* hoặc *CHIA ĐA THỨC* trước khi lấy nguyên hàm!
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Mở rộng với hàm hợp bậc nhất $a x + b$")[
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    Nếu đã thuộc Bảng nguyên hàm cơ bản $int f(x) d x = F(x) + C$, 
    thì với hàm hợp dạng bậc nhất $(a x + b)$, ta chỉ cần *nhân thêm $1/a$* ở phía trước:
    
    $ int f(a x + b) d x = 1/a F(a x + b) + C $
  ]
  
  #v(0.5em)
  #text(weight: "bold", fill: rgb("#166534"))[Ví dụ so sánh:]
  - Khởi điểm: $int e^x d x = e^x + C$.
  - Mở rộng: $int e^(3x+5) d x = 1/3 e^(3x+5) + C$.
  
  - Khởi điểm: $int cos x d x = sin x + C$.
  - Mở rộng: $int cos(5x - pi/4) d x = 1/5 sin(5x - pi/4) + C$.
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "V. Bài toán tìm $f(x)$ qua điều kiện ban đầu")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#166534"))[Ví dụ Tư duy Yêu cầu hằng số C:]
    
    Biết rằng đồ thị hàm số $y = F(x)$ đi qua điểm $M(1; 5)$ và $F'(x) = 3x^2 - 4x$. Hãy xác định hàm số $F(x)$.
    
    *Phân tích các bước giải:*
    *Bước 1 (Tìm họ nguyên hàm):* 
    Hàm số $F(x)$ là nguyên hàm của $F'(x)$.
    $ F(x) &= int (3x^2 - 4x) d x \
           &= 3(x^3/3) - 4(x^2/2) + C \
           &= x^3 - 2x^2 + C $
           
    *Bước 2 (Tìm hằng số cụ thể):*
    Đồ thị đi qua điểm $M(1; 5)$, nghĩa là $F(1) = 5$.
    $ F(1) = 1^3 - 2(1)^2 + C = 5 \
      <=> -1 + C = 5 \
      <=> C = 6 $
      
    *Kết luận:* Hàm số cần tìm là $F(x) = x^3 - 2x^2 + 6$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Khẳng định nào sau đây là *SAI* về bản chất của nguyên hàm?],
  (
    [Nguyên hàm của đạo hàm một hàm số chính là họ các hàm số đó sai khác một hằng số $C$.],
    [$int f'(x) d x = f(x) + C$],
    [Đạo hàm của nguyên hàm của hàm số $f(x)$ chính là $f(x)$.],
    [$int f(x) d x = f'(x) + C$]
  ),
  correct: 4,
  num: 1,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    Kí hiệu $int f(x) d x$ mang ý nghĩa là "tìm hàm số $F(x)$ sao cho $F'(x) = f(x)$", chứ không phải là đi đạo hàm $f(x)$. Vậy đáp án D sai, phải là $int f(x) d x = F(x) + C$.
  ]
)

#lt-tn(
  [Họ nguyên hàm của hàm số $f(x) = x(x+2)$ là:],
  (
    [$x^2/2 (x^2/2 + 2x) + C$],
    [$x^3/3 + x^2 + C$],
    [$x^3/3 + 2x + C$],
    [$1/3 x^3 + x + C$]
  ),
  correct: 2,
  num: 2,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    *Sai lầm phổ biến:* Học sinh lấy nguyên hàm từng nhân tử (Đáp án A) - Đây là lỗi rất nặng!
    *Cách làm đúng:* Nhân phân phối để phá phép nhân. 
    $f(x) = x^2 + 2x$. 
    $int (x^2 + 2x) d x = x^3/3 + x^2 + C$.
  ]
)

#lt-tn(
  [Biết $F(x)$ là một nguyên hàm của hàm số $f(x) = 1/x$ trên $(0; +oo)$ và $F(1) = 2$. Giá trị của $F(e)$ bằng:],
  (
    [$3$],
    [$2$],
    [$e+2$],
    [$1/e + 2$]
  ),
  correct: 1,
  num: 3,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    Trên $(0; +oo)$, ta có $x > 0$.
    $F(x) = int 1/x d x = ln|x| + C = ln x + C$.
    $F(1) = ln 1 + C = 0 + C = 2 => C = 2$.
    Vậy $F(x) = ln x + 2$. Suy ra $F(e) = ln e + 2 = 1 + 2 = 3$.
  ]
)

#lt-tn(
  [Họ nguyên hàm của hàm số $f(x) = e^(2x) - 3/(cos^2 x)$ là:],
  (
    [$e^(2x) - 3 tan x + C$],
    [$1/2 e^(2x) + 3 tan x + C$],
    [$1/2 e^(2x) - 3 tan x + C$],
    [$2 e^(2x) - 3 cot x + C$]
  ),
  correct: 3,
  num: 4,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    Sử dụng hệ quả hàm bậc nhất cho $e^(2x)$ (hệ số $a=2$ nên nhân $1/2$): 
    $int e^(2x) d x = 1/2 e^(2x)$.
    Nguyên hàm của $1/(cos^2 x)$ là $tan x$.
    Vậy kết quả là $1/2 e^(2x) - 3 tan x + C$.
  ]
)

#lt-tn(
  [Một vật chuyển động có phương trình gia tốc $a(t) = 3t^2 + t$ ($m/s^2$). Biết rằng tại thời điểm ban đầu ($t=0$), vận tốc của vật là $5 m/s$. Phương trình vận tốc $v(t)$ của vật là:],
  (
    [$v(t) = t^3 + t^2/2 + 5$],
    [$v(t) = 6t + 1 + 5$],
    [$v(t) = t^3 + t^2/2$],
    [$v(t) = 3t^3 + t^2 + 5$]
  ),
  correct: 1,
  num: 5,
  de: "Phần Luyện Tập Chuyên Sâu",
  loigiai: [
    Vận tốc là nguyên hàm của gia tốc:
    $v(t) = int a(t) d t = int (3t^2 + t) d t = t^3 + t^2/2 + C$.
    Tại $t=0$, $v(0) = 5 => 0^3 + 0^2/2 + C = 5 => C = 5$.
    Vậy $v(t) = t^3 + t^2/2 + 5$.
  ]
)
