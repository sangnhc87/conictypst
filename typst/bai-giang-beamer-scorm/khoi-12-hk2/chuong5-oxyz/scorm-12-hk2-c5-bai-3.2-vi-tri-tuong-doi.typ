// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-HK2-C5-BÀI 3.2: VỊ TRÍ TƯƠNG ĐỐI TRONG KHÔNG GIAN OXYZ
// Toán 12 — GDPT 2018  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "/typst/giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.5.2"
#import "/typst/bbt.typ": *
#import "/typst/math-sym.typ": *

#show: lecture-theme.with(
  title:       "BÀI 3.2: VỊ TRÍ TƯƠNG ĐỐI TRONG KHÔNG GIAN",
  subtitle:    "Đường thẳng, Mặt phẳng và 'Đặc sản' Chéo nhau",
  author:      "Tổ Toán - Khối 12",
  institution: "Chương trình GDPT 2018 (Toán 12 - Tập 2)",
  base-size:   19pt,
  math-color:  rgb("#d81b60"),
  math-size:   1.05em,
  body-font:   ("Arial", "Times New Roman"),
)

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "I. Khởi động: Hai chiếc máy bay chéo nhau")[
  #block(fill: rgb("#fef2f2"), stroke: 1pt + rgb("#f87171"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#b91c1c"))[Sự khác biệt giữa 2D và 3D:]
    
    Trong mặt phẳng 2D (trên một tờ giấy), nếu bạn vẽ hai đường thẳng mà chúng *không song song*, thì chắc chắn chúng sẽ *cắt nhau*.
    
    Nhưng trên bầu trời 3D, hai chiếc máy bay bay theo hai hướng hoàn toàn không song song, liệu chúng có nhất thiết phải đâm vào nhau (cắt nhau)?
    
    *Câu trả lời là KHÔNG!* Chúng có thể lướt qua nhau ở hai độ cao khác nhau. Hiện tượng này gọi là hai đường thẳng *CHÉO NHAU* - một khái niệm chỉ tồn tại trong không gian 3 chiều!
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "II. Vị trí tương đối giữa Đường thẳng và Mặt phẳng")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt, width: 100%)[
    Cho mặt phẳng $(P): A x + B y + C z + D = 0$ và đường thẳng $d: cases(x = x_0 + a t, y = y_0 + b t, z = z_0 + c t)$.
    
    *Phương pháp "Thế là giải":* 
    Thay bộ $(x, y, z)$ của $d$ vào phương trình của $(P)$, ta được một phương trình bậc nhất theo ẩn $t$.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 10pt, radius: 5pt, width: 100%)[
    *Kết luận:*
    - Phương trình có *đúng 1 nghiệm $t$*: $d$ *cắt* $(P)$ tại một điểm. (Tọa độ giao điểm tìm được bằng cách thay $t$ trở lại $d$).
    - Phương trình *vô nghiệm*: $d$ *song song* với $(P)$.
    - Phương trình *vô số nghiệm* (luôn đúng): $d$ *nằm trong* $(P)$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "III. Vị trí tương đối giữa hai Đường thẳng")[
  Cho $d_1$ có $arrow(u_1)$ và đi qua $M_1$; $d_2$ có $arrow(u_2)$ và đi qua $M_2$.
  
  #block(fill: rgb("#fcf8e3"), stroke: 1pt + rgb("#faebcc"), inset: 10pt, radius: 5pt, width: 100%)[
    *Bước 1: Kiểm tra độ "Lệch hướng" (Cùng phương hay không)*
    - Nếu $arrow(u_1)$ và $arrow(u_2)$ *cùng phương* (tỉ lệ nhau): $d_1, d_2$ có thể *Song song* hoặc *Trùng nhau*. (Kiểm tra xem $M_1$ có nằm trên $d_2$ không để phân biệt).
    - Nếu $arrow(u_1)$ và $arrow(u_2)$ *không cùng phương*: $d_1, d_2$ có thể *Cắt nhau* hoặc *Chéo nhau*.
  ]
  
  #v(0.5em)
  #block(fill: rgb("#f8fafc"), stroke: 1pt + rgb("#cbd5e1"), inset: 10pt, radius: 5pt, width: 100%)[
    #text(weight: "bold", fill: rgb("#334155"))[Bước 2: Dùng Tích hỗn tạp phân biệt Cắt và Chéo]
    Tính đại lượng vô hướng: $D = [arrow(u_1), arrow(u_2)] dot arrow(M_1 M_2)$
    - Nếu $D = 0$: $d_1$ và $d_2$ *Đồng phẳng* $=>$ Chúng *CẮT NHAU*.
    - Nếu $D eq.not 0$: $d_1$ và $d_2$ *Không đồng phẳng* $=>$ Chúng *CHÉO NHAU*.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
#slide(title: "IV. Ví dụ Thực chiến: Tìm giao điểm")[
  #block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#bbf7d0"), inset: 10pt, radius: 5pt)[
    #text(weight: "bold", fill: rgb("#166534"))[Bài toán Kỹ thuật Laser]
    Tia laser bắn dọc theo đường thẳng $d: x = 1+t, y = 2-t, z = 3+2t$. Hỏi nó sẽ đục thủng bức tường mặt phẳng $(P): 2x - y + z - 7 = 0$ tại vị trí nào?
    
    *Giải:*
    Thay $(x, y, z)$ của $d$ vào $(P)$:
    $ 2(1 + t) - (2 - t) + (3 + 2t) - 7 = 0 \
      2 + 2t - 2 + t + 3 + 2t - 7 = 0 \
      5t - 4 = 0 <=> t = 4/5 $
      
    Vậy tia laser đục thủng tường tại $t = 0.8$ (giây). 
    Thay $t = 0.8$ ngược vào $d$:
    $ cases(x = 1 + 0.8 = 1.8, y = 2 - 0.8 = 1.2, z = 3 + 2(0.8) = 4.6) $
    Giao điểm $M(1.8; 1.2; 4.6)$.
  ]
]

// ═══════════════════════════════════════════════════════════════════════════
// CÂU HỎI TRẮC NGHIỆM TƯ DUY & BẢN CHẤT

#lt-tn(
  [Để tìm giao điểm của đường thẳng $d$ và mặt phẳng $(P)$, phương pháp tối ưu nhất là:],
  (
    [Chuyển $(P)$ sang dạng tham số rồi thế vào $d$.],
    [Chuyển $d$ sang dạng tham số, lấy $x, y, z$ thế vào phương trình tổng quát của $(P)$.],
    [Lấy tích có hướng hai vectơ pháp tuyến.],
    [Vẽ đồ thị bằng tay trên giấy kẻ ô li.]
  ),
  correct: 2,
  num: 1,
  de: "Phần Luyện Tập Vị Trí Tương Đối",
  loigiai: [
    Phương pháp "Thế là giải" là chuẩn mực: thay toạ độ theo tham số $t$ vào phương trình tổng quát để giải ra $t$.
  ]
)

#lt-tn(
  [Cho đường thẳng $d$ có VTCP $arrow(u) = (1; 2; -1)$ và mặt phẳng $(P)$ có VTPT $arrow(n) = (2; -1; 0)$. Vị trí tương đối của $d$ và $(P)$ là:],
  (
    [$d$ vuông góc $(P)$],
    [$d$ cắt $(P)$ nhưng không vuông góc],
    [$d$ song song hoặc nằm trong $(P)$],
    [Chéo nhau]
  ),
  correct: 3,
  num: 2,
  de: "Phần Luyện Tập Vị Trí Tương Đối",
  loigiai: [
    Kiểm tra tích vô hướng: $arrow(u) dot arrow(n) = 1(2) + 2(-1) + (-1)(0) = 0$.
    VTCP của $d$ vuông góc với VTPT của $(P)$, nghĩa là đường thẳng $d$ đang "nằm bẹp" song song với mặt phẳng hoặc nằm hẳn trong mặt phẳng.
  ]
)

#lt-tn(
  [Hai đường thẳng $d_1$ và $d_2$ trong không gian có vị trí tương đối gọi là "chéo nhau" khi nào?],
  (
    [Khi chúng cắt nhau tại một điểm và tạo thành góc nhọn.],
    [Khi chúng không có điểm chung và nằm trên cùng một mặt phẳng.],
    [Khi chúng không có điểm chung và không cùng nằm trên bất kỳ mặt phẳng nào.],
    [Khi chúng vuông góc với nhau.]
  ),
  correct: 3,
  num: 3,
  de: "Phần Luyện Tập Vị Trí Tương Đối",
  loigiai: [
    Chéo nhau là trạng thái không đồng phẳng (không có mặt phẳng nào chứa cả hai đường) và tất nhiên là không có điểm chung.
  ]
)

#lt-tn(
  [Cho $d_1$ có $arrow(u_1) = (1; -1; 2)$ và $d_2$ có $arrow(u_2) = (-2; 2; -4)$. Khẳng định nào sau đây là ĐÚNG?],
  (
    [$d_1$ và $d_2$ chắc chắn cắt nhau.],
    [$d_1$ và $d_2$ chắc chắn chéo nhau.],
    [$d_1$ và $d_2$ song song hoặc trùng nhau.],
    [$d_1$ và $d_2$ vuông góc với nhau.]
  ),
  correct: 3,
  num: 4,
  de: "Phần Luyện Tập Vị Trí Tương Đối",
  loigiai: [
    Ta thấy $arrow(u_2) = -2 arrow(u_1)$, tức là hai VTCP cùng phương.
    Do đó hai đường thẳng này chỉ có thể song song hoặc trùng nhau.
  ]
)

#lt-tn(
  [Một tia laser được phóng từ $A(1; 1; 1)$ theo hướng $arrow(u)=(1; 0; 0)$ (song song trục Ox). Có một tấm gương phẳng mang phương trình $y = 5$. Hỏi tia laser có chạm được vào gương không?],
  (
    [Có, xuyên qua gương tại $t=4$.],
    [Có, xuyên qua gương tại $t=5$.],
    [Không bao giờ, vì tia laser bay song song với gương.],
    [Xuyên qua tại vô cực.]
  ),
  correct: 3,
  num: 5,
  de: "Phần Luyện Tập Vị Trí Tương Đối",
  loigiai: [
    Phương trình tia laser: $x = 1+t, y = 1, z = 1$.
    Thế vào phương trình gương $y = 5$ ta được $1 = 5$ (Vô lý!). 
    Vậy phương trình vô nghiệm, tia laser bay song song và không bao giờ chạm gương.
  ]
)
