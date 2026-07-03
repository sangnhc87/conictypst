#import "@local/sang-math:1.0.0": *

#let (tn, ds, tln, tl) = exam-mode(mode: "loigiai", accent: classic.blue)

#show: sang-setup

#show: thpt-school-exam.with(
  exam-title: [ĐỀ KIỂM TRA THỬ NGHIỆM LOCAL PACKAGE],
  school: [TRƯỜNG THPT CHUYÊN SANG MATH],
  watermark: "SANG MATH"
)

#tn(
  [Nghiệm của phương trình $2x - 4 = 0$ là:],
  (
    [$x = 2$],
    [$x = -2$],
    [$x = 4$],
    [$x = -4$]
  ),
  ans: "A",
  loigiai: [
    Ta có: $2x - 4 = 0 <=> 2x = 4 <=> x = 2$. 
    
    Vậy đáp án đúng là A.
  ]
)

#tn(
  [Bảng biến thiên của hàm số $y = x^3 - 3x$ có bao nhiêu điểm cực trị?],
  (
    [$0$],
    [$1$],
    [$2$],
    [$3$]
  ),
  ans: "C",
  loigiai: [
    Ta có $y' = 3x^2 - 3$. Cho $y' = 0 <=> x = +- 1$. Vậy hàm số có 2 điểm cực trị.
  ]
)

#tn(
  [Cho tam giác ABC có $A(1; 2)$, $B(-1; 0)$, $C(3; -2)$. Trọng tâm G của tam giác ABC có tọa độ là:],
  (
    [$G(1; 0)$],
    [$G(1; 2)$],
    [$G(-1; 0)$],
    [$G(3; -2)$]
  ),
  ans: "A",
  loigiai: [
    Tọa độ trọng tâm $G$ được tính bằng công thức: 
    $x_G = (x_A + x_B + x_C) / 3 = (1 - 1 + 3) / 3 = 1$
    
    $y_G = (y_A + y_B + y_C) / 3 = (2 + 0 - 2) / 3 = 0$
  ]
)
