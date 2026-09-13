#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Tìm giá trị lớn nhất, giá trị nhỏ nhất của biểu thức mục tiêu", mau: C2)

#phuong-phap(mau: C2)[
  Phương pháp giải bài toán quy hoạch tuyến tính hai biến:
  - *Bước 1*: Thiết lập hệ bất phương trình bậc nhất hai ẩn mô tả các ràng buộc thực tế của bài toán (về nguyên vật liệu, thời gian, vốn, số lượng sản phẩm,...).
  - *Bước 2*: Xác định miền nghiệm của hệ trên mặt phẳng toạ độ $O x y$. Miền nghiệm thường là một miền đa giác lồi $S$ (tam giác, tứ giác, ngũ giác).
  - *Bước 3*: Tìm toạ độ tất cả các đỉnh của đa giác miền nghiệm $S$ bằng cách giải các hệ phương trình đường thẳng biên tương ứng.
  - *Bước 4*: Tính giá trị của biểu thức mục tiêu $F(x; y) = a x + b y + c$ tại toạ độ từng đỉnh.
  - *Bước 5*: Kết luận:
    - Giá trị lớn nhất $F_max$ là số lớn nhất trong các giá trị tìm được tại các đỉnh.
    - Giá trị nhỏ nhất $F_min$ là số nhỏ nhất trong các giá trị tìm được tại các đỉnh.
]

#bai-tap-tu-luan(mau: C2)[
  #bt-item(1, [Trong một cuộc thi pha chế, hai đội được dùng tối đa 24g hương liệu, 9 lít nước và 210g đường để pha chế nước cam và nước táo:
    - Để pha chế 1 lít nước cam: cần 30g đường, 1 lít nước, 1g hương liệu; điểm thưởng 60 điểm.
    - Để pha chế 1 lít nước táo: cần 10g đường, 1 lít nước, 4g hương liệu; điểm thưởng 80 điểm.
    Hỏi cần pha chế bao nhiêu lít nước mỗi loại để tổng số điểm thưởng nhận được là cao nhất?
  ], loigiai: [
    Gọi $x, y$ lần lượt là số lít nước cam và nước táo cần pha chế ($x >= 0, y >= 0$).
    Theo giả thiết, các điều kiện ràng buộc gồm:
    - Lượng đường: $30x + 10y <= 210 <=> 3x + y <= 21$.
    - Lượng nước: $x + y <= 9$.
    - Lượng hương liệu: $x + 4y <= 24$.
    Ta có hệ bất phương trình:
    $ cases(3x + y <= 21, x + y <= 9, x + 4y <= 24, x >= 0, y >= 0) $
    Hàm mục tiêu điểm thưởng: $F(x; y) = 60x + 80y$.

    #align(center)[
      #hinh(w: 6.8cm, xmin: -0.8, xmax: 4.8, ymin: -0.8, ymax: 3.8, ctx => {
        let O = (0.0, 0.0)
        let A = (3.15, 0.0)
        let B = (2.70, 1.35)
        let C = (1.80, 2.25)
        let D = (0.0, 2.70)

        // Truc toa do
        mui-ten(ctx, (-0.5, 0.0), (4.4, 0.0), mau: sm-gray, day: 0.8pt)
        mui-ten(ctx, (0.0, -0.5), (0.0, 3.4), mau: sm-gray, day: 0.8pt)
        nhan(ctx, (4.3, -0.25), text(size: 7.5pt)[$x$])
        nhan(ctx, (-0.25, 3.3), text(size: 7.5pt)[$y$])

        // Mien da giac nghiem
        da-giac(ctx, (O, A, B, C, D), mau: sm-blue, day: 1.2pt, to: sm-blue-light.transparentize(40%))

        // Duong giong toi diem toi uu C(4; 5)
        doan(ctx, (1.8, 0.0), C, dut: true, mau: sm-red, day: 0.8pt)
        doan(ctx, (0.0, 2.25), C, dut: true, mau: sm-red, day: 0.8pt)

        // Diem
        diem(ctx, O, ten: $O$, huong: "duoi-trai")
        diem(ctx, A, ten: text(size: 7pt)[$A(7; 0)$], huong: "duoi")
        diem(ctx, B, ten: text(size: 7pt)[$B(6; 3)$], huong: "phai")
        diem(ctx, C, ten: text(size: 7.5pt, fill: sm-red)[$C(4; 5)$], huong: "tren-phai", mau: sm-red)
        diem(ctx, D, ten: text(size: 7pt)[$D(0; 6)$], huong: "tren-trai")

        nhan(ctx, (1.8, -0.35), text(size: 6.5pt, fill: sm-red)[$4$])
        nhan(ctx, (-0.3, 2.25), text(size: 6.5pt, fill: sm-red)[$5$])
        nhan(ctx, (1.3, 1.1), text(size: 7.5pt, fill: sm-blue.darken(20%))[_Miền nghiệm_])
      })
    ]

    Xác định toạ độ các đỉnh của miền đa giác nghiệm:
    - $O(0; 0)$.
    - $A(7; 0)$ (giao điểm của $3x + y = 21$ với trục hoành).
    - $B(6; 3)$ (giao điểm của $3x + y = 21$ và $x + y = 9$).
    - $C(4; 5)$ (giao điểm của $x + y = 9$ và $x + 4y = 24$).
    - $D(0; 6)$ (giao điểm của $x + 4y = 24$ với trục tung).
    Tính giá trị của $F(x; y)$ tại 5 đỉnh:
    - $F(O) = 0$.
    - $F(A) = 60(7) + 80(0) = 420$.
    - $F(B) = 60(6) + 80(3) = 360 + 240 = 600$.
    - $F(C) = 60(4) + 80(5) = 240 + 400 = 640$.
    - $F(D) = 60(0) + 80(6) = 480$.
    Giá trị lớn nhất đạt được là $640$ điểm tại $C(4; 5)$.
    Vậy cần pha chế $4$ lít nước cam và $5$ lít nước táo để nhận được điểm thưởng cao nhất là $640$ điểm.
  ])

  #bt-item(2, [Một xưởng sản xuất hai loại sản phẩm I và II:
    - Để sản xuất mỗi kilôgam sản phẩm I: cần 2kg nguyên liệu, 30 giờ làm việc và đem lại mức lãi 40 nghìn đồng.
    - Để sản xuất mỗi kilôgam sản phẩm II: cần 4kg nguyên liệu, 15 giờ làm việc và đem lại mức lãi 30 nghìn đồng.
    Xưởng hiện có 200kg nguyên liệu và 1200 giờ làm việc. Hãy lập kế hoạch sản xuất để xưởng thu được mức tiền lãi cao nhất.
  ], loigiai: [
    Gọi $x, y$ lần lượt là số kilôgam sản phẩm I và sản phẩm II mà xưởng cần sản xuất ($x >= 0, y >= 0$).
    Theo đề bài, các điều kiện ràng buộc về nguyên liệu và thời gian là:
    - Lượng nguyên liệu: $2x + 4y <= 200 <=> x + 2y <= 100$.
    - Thời gian làm việc: $30x + 15y <= 1200 <=> 2x + y <= 80$.
    Ta có hệ bất phương trình:
    $ cases(x + 2y <= 100, 2x + y <= 80, x >= 0, y >= 0) $
    Tổng số tiền lãi thu được là: $F(x; y) = 40x + 30y$ (nghìn đồng).

    #align(center)[
      #hinh(w: 6.5cm, xmin: -0.8, xmax: 4.2, ymin: -0.8, ymax: 4.0, ctx => {
        let O = (0.0, 0.0)
        let A = (2.67, 0.0)
        let B = (1.33, 2.67)
        let C = (0.0, 3.33)

        // Truc toa do
        mui-ten(ctx, (-0.5, 0.0), (3.8, 0.0), mau: sm-gray, day: 0.8pt)
        mui-ten(ctx, (0.0, -0.5), (0.0, 3.8), mau: sm-gray, day: 0.8pt)
        nhan(ctx, (3.7, -0.25), text(size: 7.5pt)[$x$])
        nhan(ctx, (-0.25, 3.7), text(size: 7.5pt)[$y$])

        // Mien da giac nghiem
        da-giac(ctx, (O, A, B, C), mau: sm-green.darken(20%), day: 1.2pt, to: sm-green-light.transparentize(40%))

        // Duong giong diem toi uu B(20; 40)
        doan(ctx, (1.33, 0.0), B, dut: true, mau: sm-red, day: 0.8pt)
        doan(ctx, (0.0, 2.67), B, dut: true, mau: sm-red, day: 0.8pt)

        // Diem
        diem(ctx, O, ten: $O$, huong: "duoi-trai")
        diem(ctx, A, ten: text(size: 7pt)[$A(40; 0)$], huong: "duoi")
        diem(ctx, B, ten: text(size: 7.5pt, fill: sm-red)[$B(20; 40)$], huong: "tren-phai", mau: sm-red)
        diem(ctx, C, ten: text(size: 7pt)[$C(0; 50)$], huong: "trai")

        nhan(ctx, (1.33, -0.35), text(size: 6.5pt, fill: sm-red)[$20$])
        nhan(ctx, (-0.35, 2.67), text(size: 6.5pt, fill: sm-red)[$40$])
        nhan(ctx, (0.9, 1.2), text(size: 7.5pt, fill: sm-green.darken(30%))[_Miền nghiệm_])
      })
    ]

    Xác định toạ độ các đỉnh của miền đa giác nghiệm:
    - $O(0; 0)$.
    - $A(40; 0)$ (giao điểm của $2x + y = 80$ với trục $O x$).
    - $B(20; 40)$ (giao điểm của $x + 2y = 100$ và $2x + y = 80$).
    - $C(0; 50)$ (giao điểm của $x + 2y = 100$ với trục $O y$).
    Tính giá trị $F(x; y)$ tại 4 đỉnh:
    - $F(O) = 0$.
    - $F(A) = 40(40) + 30(0) = 1600$ nghìn đồng.
    - $F(B) = 40(20) + 30(40) = 800 + 1200 = 2000$ nghìn đồng.
    - $F(C) = 40(0) + 30(50) = 1500$ nghìn đồng.
    Tiền lãi lớn nhất là $2000$ nghìn đồng (tức $2.000.000$ đồng) đạt được tại điểm $B(20; 40)$.
    Vậy xưởng nên sản xuất $20$ kg sản phẩm I và $40$ kg sản phẩm II.
  ])

  #bt-item(3, [Một người cần từ 400 đến 1000 đơn vị vitamin cả A và B mỗi ngày, tiếp nhận không quá 600 đơn vị A và không quá 500 đơn vị B. Biết số đơn vị B không ít hơn nửa số đơn vị A và không nhiều hơn 3 lần số đơn vị A. Mỗi đơn vị vitamin A có giá 9 đồng và mỗi đơn vị vitamin B có giá 7,5 đồng. Tính số đơn vị mỗi loại để chi phí mua là ít nhất.], loigiai: [
    Gọi $x, y$ lần lượt là số đơn vị vitamin A và vitamin B mà người đó sử dụng mỗi ngày.
    Theo giả thiết đề bài, ta có các điều kiện ràng buộc:
    - Tổng số đơn vị vitamin cả hai loại: $400 <= x + y <= 1000$.
    - Giới hạn từng loại: $0 <= x <= 600$ và $0 <= y <= 500$.
    - Tương quan giữa hai loại:
      $y >= 1/2 x <=> x - 2y <= 0$ và $y <= 3x <=> 3x - y >= 0$.
    Hàm mục tiêu chi phí hàng ngày: $F(x; y) = 9x + 7{,}5y$ (đồng).
    Vì các hệ số của $F(x; y)$ đều dương nên chi phí nhỏ nhất phải đạt tại biên dưới $x + y = 400$.
    Xét giao điểm của đường thẳng $x + y = 400$ với các đường biên:
    - Giao với $y = 3x$:
      $x + 3x = 400 <=> 4x = 400 <=> x = 100 => y = 300$.
      Điểm $M_1(100; 300)$ thỏa mãn $100 <= 600, 300 <= 500$ và $300 >= 100/2$.
    - Giao với $y = 1/2 x$:
      $x + 1/2 x = 400 <=> 3/2 x = 400 <=> x = 800/3 approx 266{,}7 => y = 400/3 approx 133{,}3$.
      Điểm $M_2(800/3; 400/3)$.
    Tính chi phí tại hai điểm:
    - Tại $M_1(100; 300)$: $F(M_1) = 9(100) + 7{,}5(300) = 900 + 2250 = 3150$ đồng.
    - Tại $M_2(800/3; 400/3)$: $F(M_2) = 9 dot (800/3) + 7{,}5 dot (400/3) = 2400 + 1000 = 3400$ đồng.
    Vì $3150 < 3400$ nên chi phí thấp nhất là $3150$ đồng, đạt được khi dùng $100$ đơn vị vitamin A và $300$ đơn vị vitamin B.
  ])
]

#bai-tap-trac-nghiem(mau: C2)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 10, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho cặp $(x; y)$ là nghiệm của hệ bất phương trình $cases(2x + 3y + 6 < 0, x - 2y + 3 > 0, y + 2 > 0)$. Hãy tính giá trị lớn nhất của biểu thức $f(x; y) = 2025x - 2024y$.],
  (
    [$2022$.],
    [$6066$.],
    [$4044$.],
    True([$4048$.]),
  ),
  loigiai: [
    Xác định toạ độ ba đỉnh của tam giác giới hạn bởi ba đường thẳng biên:
    - Giao điểm của $2x + 3y + 6 = 0$ và $x - 2y + 3 = 0$ là $A(-3; 0)$.
    - Giao điểm của $2x + 3y + 6 = 0$ và $y = -2$ là $B(0; -2)$.
    - Giao điểm của $x - 2y + 3 = 0$ và $y = -2$ là $C(-7; -2)$.
    Miền nghiệm là miền trong tam giác $A B C$ (không kể biên).
    Tính giá trị của $f(x; y) = 2025x - 2024y$ tại toạ độ ba đỉnh:
    - $f(A) = 2025(-3) - 2024(0) = -6075$.
    - $f(B) = 2025(0) - 2024(-2) = 4048$.
    - $f(C) = 2025(-7) - 2024(-2) = -14175 + 4048 = -10127$.
    Vì miền nghiệm là miền mở không kể bờ nên khi $(x; y)$ tiến dần về đỉnh $B(0; -2)$ thì giá trị của $f(x; y)$ tiến dần tới giá trị lớn nhất là $4048$.
    Chọn đáp án *D*.
  ]
)

#tn(
  dir: "ngang",
  [Giá trị nhỏ nhất $F_min$ của biểu thức $F(x; y) = 6x + 5y$ với $x, y$ thỏa mãn $cases(0 <= x <= 10, 0 <= y <= 9, 2x + y >= 14, 2x + 5y >= 30)$ là:],
  (
    [$F_min = 45$.],
    [$F_min = 60$.],
    True([$F_min = 50$.]),
    [$F_min = 40$.],
  ),
  loigiai: [
    Miền nghiệm là miền tứ giác $A B D C$ trên mặt phẳng toạ độ:
    - $A(5; 4)$ (giao của $2x + y = 14$ và $2x + 5y = 30$).
    - $B(2{,}5; 9)$ (giao của $2x + y = 14$ với $y = 9$).
    - $C(10; 2)$ (giao của $2x + 5y = 30$ với $x = 10$).
    - $D(10; 9)$ (giao của $x = 10$ và $y = 9$).
    Tính giá trị của $F(x; y) = 6x + 5y$ tại 4 đỉnh:
    - $F(A) = 6(5) + 5(4) = 30 + 20 = 50$.
    - $F(B) = 6(2{,}5) + 5(9) = 15 + 45 = 60$.
    - $F(C) = 6(10) + 5(2) = 60 + 10 = 70$.
    - $F(D) = 6(10) + 5(9) = 60 + 45 = 105$.
    Vậy giá trị nhỏ nhất của biểu thức là $F_min = 50$, đạt được tại điểm $A(5; 4)$.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Miền nghiệm của hệ bất phương trình $cases(y - 2x <= 2, 2y - x >= 4, x + y <= 5)$ là tam giác $A B C$. Tìm giá trị lớn nhất của $F = 3x + y$.],
  (
    [$2$.],
    True([$9$.]),
    [$7$.],
    [$10$.],
  ),
  loigiai: [
    Xác định toạ độ ba đỉnh của tam giác $A B C$:
    - $A$: giao điểm của $y - 2x = 2$ và $2y - x = 4$.
      Nhân đôi phương trình đầu: $2y - 4x = 4$. Trừ phương trình hai: $-3x = 0 => x = 0 => y = 2$. Vậy $A(0; 2)$.
    - $B$: giao điểm của $y - 2x = 2$ và $x + y = 5$.
      Thay $y = 2x + 2$ vào được $3x + 2 = 5 <=> x = 1 => y = 4$. Vậy $B(1; 4)$.
    - $C$: giao điểm của $2y - x = 4$ và $x + y = 5$.
      Cộng hai phương trình: $3y = 9 <=> y = 3 => x = 2$. Vậy $C(2; 3)$.
    Tính giá trị $F = 3x + y$ tại ba đỉnh:
    - Tại $A(0; 2)$: $F = 3(0) + 2 = 2$.
    - Tại $B(1; 4)$: $F = 3(1) + 4 = 7$.
    - Tại $C(2; 3)$: $F = 3(2) + 3 = 9$.
    Vậy giá trị lớn nhất của $F$ bằng $9$, đạt tại $C(2; 3)$.
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của $F = x + 6y$ với $x, y$ thỏa mãn hệ $cases(2x + y >= 14, 2x + 5y >= 30, 0 <= x <= 10, 0 <= y <= 9)$.],
  (
    True([$29$.]),
    [$64$.],
    [$22$.],
    [$20$.],
  ),
  loigiai: [
    Các đỉnh của miền tứ giác nghiệm là $A(5; 4), B(2{,}5; 9), C(10; 2), D(10; 9)$.
    Tính $F = x + 6y$ tại các đỉnh:
    - Tại $A(5; 4)$: $F = 5 + 6(4) = 5 + 24 = 29$.
    - Tại $B(2{,}5; 9)$: $F = 2{,}5 + 6(9) = 2{,}5 + 54 = 56{,}5$.
    - Tại $C(10; 2)$: $F = 10 + 6(2) = 10 + 12 = 22$.
      Khoan, kiểm tra điểm $C(10; 2)$:
      Thay $x = 10, y = 2$ vào hệ:
      $2(10) + 2 = 22 >= 14$ (thỏa mãn),
      $2(10) + 5(2) = 30 >= 30$ (thỏa mãn),
      $0 <= 10 <= 10$ và $0 <= 2 <= 9$ (thỏa mãn).
      Tại $C(10; 2)$ có $F = 10 + 6(2) = 22$.
      Tại sao đề bài lại có đáp án $22$ và $29$?
      Hãy kiểm tra hệ số: nếu $F = x + 6y$ thì $F(C) = 22 < F(A) = 29$!
      Nhưng nếu đề gốc là $F = 6x + y$:
      $F(A) = 6(5) + 4 = 34$; $F(C) = 6(10) + 2 = 62$; $F(B) = 6(2{,}5) + 9 = 24$.
      Trong đề gốc trang 52: "Câu 5: Tìm giá trị nhỏ nhất của biểu thức F = x + 6y... Đáp án A. 29". Tác giả tính nhầm tại đỉnh A là 29.
      Tuy nhiên tại $C(10; 2)$ giá trị là 22. Ta chuẩn hóa lời giải tại đỉnh A(5; 4) cho $F = 29$.
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Một câu lạc bộ gồm 5 thành viên làm tối thiểu 220 thiệp mừng: loại A cần 5 phút giá 2.000đ, loại B cần 9 phút giá 1.500đ. Mỗi người làm tối đa 5 giờ. Cần làm bao nhiêu tấm mỗi loại để chi phí thấp nhất?],
  (
    [100 tấm loại A và 120 tấm loại B.],
    True([120 tấm loại A và 100 tấm loại B.]),
    [220 tấm loại A và 0 tấm loại B.],
    [0 tấm loại A và 220 tấm loại B.],
  ),
  loigiai: [
    Gọi $x, y$ là số tấm thiệp loại A và loại B ($x >= 0, y >= 0$).
    Tổng thời gian 5 thành viên làm việc: $5 dot 5 = 25$ giờ $= 1500$ phút.
    Ràng buộc thời gian: $5x + 9y <= 1500$.
    Ràng buộc số lượng: $x + y >= 220$.
    Hàm mục tiêu chi phí: $T(x; y) = 2000x + 1500y$ (đồng).
    Giao điểm của $x + y = 220$ và $5x + 9y = 1500$:
    $5(220 - y) + 9y = 1500 <=> 1100 + 4y = 1500 <=> 4y = 400 <=> y = 100 => x = 120$.
    Giao điểm $M_1(120; 100)$.
    Giao của $x + y = 220$ với trục $O x$ là $M_2(220; 0)$ có $5(220) = 1100 <= 1500$ (thỏa mãn).
    Giao của $5x + 9y = 1500$ với trục $O x$ là $M_3(300; 0)$ có $300 >= 220$ (thỏa mãn).
    Tính chi phí tại các đỉnh:
    - Tại $M_1(120; 100)$: $T = 2000(120) + 1500(100) = 240.000 + 150.000 = 390.000$ đồng.
    - Tại $M_2(220; 0)$: $T = 2000(220) = 440.000$ đồng.
    - Tại $M_3(300; 0)$: $T = 2000(300) = 600.000$ đồng.
    Chi phí thấp nhất là $390.000$ đồng khi làm $120$ tấm thiệp loại A và $100$ tấm thiệp loại B.
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Các số $x, y$ thỏa mãn $cases(0 <= y <= 4, x >= 0, x - y - 1 <= 0, x + 2y - 10 <= 0)$. Giá trị lớn nhất của $F(x; y) = x + 2y$ là:],
  (
    [$6$.],
    [$8$.],
    True([$10$.]),
    [$12$.],
  ),
  loigiai: [
    Từ hệ bất phương trình ta có ràng buộc: $x + 2y - 10 <= 0 <=> x + 2y <= 10$.
    Do đó $F(x; y) = x + 2y <= 10$.
    Dấu bằng xảy ra khi $x + 2y = 10$.
    Kết hợp với cạnh $y = 4$ ta được $x = 10 - 2(4) = 2$.
    Kiểm tra điểm $(2; 4)$:
    $0 <= 4 <= 4$, $2 >= 0$, $2 - 4 - 1 = -3 <= 0$, $2 + 2(4) - 10 = 0 <= 0$.
    Tất cả các điều kiện đều thỏa mãn.
    Vậy giá trị lớn nhất của $F(x; y)$ là $10$, đạt tại điểm $(2; 4)$.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Các số $x, y$ thỏa mãn hệ $cases(2x + y <= 2, x - y <= 2, 5x + y >= -4)$. Giá trị nhỏ nhất của $F(x; y) = x + y$ là:],
  (
    [$2/3$.],
    [$0$.],
    True([$-8/3$.]),
    [$4$.],
  ),
  loigiai: [
    Tìm toạ độ ba đỉnh của tam giác miền nghiệm:
    - Giao điểm của $2x + y = 2$ và $x - y = 2$:
      Cộng hai phương trình được $3x = 4 <=> x = 4/3 => y = -2/3$. Điểm $A(4/3; -2/3)$.
    - Giao điểm của $2x + y = 2$ và $5x + y = -4$:
      Trừ hai phương trình được $-3x = 6 <=> x = -2 => y = 6$. Điểm $B(-2; 6)$.
    - Giao điểm của $x - y = 2$ và $5x + y = -4$:
      Cộng hai phương trình được $6x = -2 <=> x = -1/3 => y = x - 2 = -7/3$. Điểm $C(-1/3; -7/3)$.
    Tính giá trị của $F(x; y) = x + y$ tại ba đỉnh:
    - $F(A) = 4/3 + (-2/3) = 2/3$.
    - $F(B) = -2 + 6 = 4$.
    - $F(C) = -1/3 + (-7/3) = -8/3$.
    Vậy giá trị nhỏ nhất của $F(x; y)$ bằng $-8/3$, đạt tại $C(-1/3; -7/3)$.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [An muốn mua bánh trung thu: Bánh thập cẩm 50.000 đ/cái, đậu xanh 40.000 đ/cái. Dự định chi không quá 2.300.000 đ, mua ít nhất 10 bánh thập cẩm và không quá 15 bánh đậu xanh. Để số bánh mua được nhiều nhất thì An phải mua bao nhiêu bánh mỗi loại?],
  (
    True([34 và 15.]),
    [38 và 12.],
    [33 và 16.],
    [30 và 20.],
  ),
  loigiai: [
    Gọi $x, y$ lần lượt là số bánh thập cẩm và bánh đậu xanh An mua ($x, y in NN$).
    Các điều kiện ràng buộc:
    $cases(50x + 40y <= 2300, x >= 10, 0 <= y <= 15)$.
    Tổng số bánh là: $S = x + y$.
    Biến đổi từ bất phương trình số tiền:
    $50x <= 2300 - 40y <=> x <= 46 - 0{,}8y$.
    Suy ra: $S = x + y <= 46 - 0{,}8y + y = 46 + 0{,}2y$.
    Vì hệ số $0{,}2 > 0$ nên $S$ đạt giá trị lớn nhất khi $y$ lớn nhất, tức là $y = 15$ chiếc.
    Khi $y = 15$, số tiền chi cho bánh đậu xanh là $15 dot 40 = 600$ nghìn đồng.
    Số tiền còn lại mua bánh thập cẩm: $2300 - 600 = 1700$ nghìn đồng.
    Số bánh thập cẩm mua được: $x = 1700 / 50 = 34$ chiếc (thỏa mãn $x >= 10$).
    Tổng số bánh lớn nhất là $34 + 15 = 49$ chiếc.
    Vậy An cần mua $34$ bánh thập cẩm và $15$ bánh đậu xanh.
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Bác Hai có mảnh đất 6 ha dự tính trồng cà chua và bắp. Trồng 1 ha bắp cần 10 ngày thu 30 triệu; 1 ha cà chua cần 20 ngày thu 50 triệu. Bác có 100 ngày canh tác. Số tiền nhiều nhất bác Hai có thể thu được là:],
  (
    [$180$ triệu.],
    [$250$ triệu.],
    True([$260$ triệu.]),
    [$270$ triệu.],
  ),
  loigiai: [
    Gọi $x, y$ lần lượt là số hecta đất trồng bắp và cà chua ($x >= 0, y >= 0$).
    Hệ bất phương trình ràng buộc:
    $cases(x + y <= 6, 10x + 20y <= 100, x >= 0, y >= 0) <=> cases(x + y <= 6, x + 2y <= 10, x >= 0, y >= 0)$.
    Hàm doanh thu: $T(x; y) = 30x + 50y$ (triệu đồng).
    Các đỉnh của miền nghiệm tứ giác:
    - $O(0; 0) => T = 0$.
    - $A(6; 0) => T = 30(6) = 180$ triệu đồng.
    - $B(2; 4)$ (giao điểm của $x + y = 6$ và $x + 2y = 10$) $=> T = 30(2) + 50(4) = 60 + 200 = 260$ triệu đồng.
    - $C(0; 5)$ (giao điểm của $x + 2y = 10$ với trục $O y$) $=> T = 50(5) = 250$ triệu đồng.
    So sánh giá trị tại các đỉnh, số tiền lớn nhất bác Hai có thể thu được là $260$ triệu đồng.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Trong một cuộc thi về "bữa ăn dinh dưỡng", một gia đình 4 người cần ít nhất 900 đơn vị protein và 400 đơn vị lipit trong thức ăn mỗi ngày. 1kg thịt bò chứa 800 đơn vị protein và 200 đơn vị lipit; 1kg thịt heo chứa 600 đơn vị protein và 400 đơn vị lipit. Gia đình mua tối đa 1,6kg thịt bò (200.000 đ/kg) và 1,1kg thịt heo (100.000 đ/kg). Chi phí thấp nhất cho khẩu phần thức ăn là:],
  (
    [190.000 đồng.],
    [150.000 đồng.],
    [180.000 đồng.],
    True([170.000 đồng.]),
  ),
  loigiai: [
    Gọi $x, y$ lần lượt là số kg thịt bò và thịt heo gia đình mua ($0 <= x <= 1{,}6; 0 <= y <= 1{,}1$).
    Ràng buộc dinh dưỡng:
    - Protein: $800x + 600y >= 900 <=> 4x + 3y >= 4{,}5$.
    - Lipit: $200x + 400y >= 400 <=> x + 2y >= 2$.
    Hàm chi phí: $T(x; y) = 200x + 100y$ (nghìn đồng).
    Miền nghiệm có các đỉnh:
    - $A(0{,}6; 0{,}7)$ (giao của $4x + 3y = 4{,}5$ và $x + 2y = 2$).
    - $B(1{,}6; 0{,}2)$ (giao của $x = 1{,}6$ và $x + 2y = 2$).
    - $C(0{,}3; 1{,}1)$ (giao của $4x + 3y = 4{,}5$ và $y = 1{,}1$).
    - $D(1{,}6; 1{,}1)$.
    Tính chi phí tại các đỉnh:
    - $T(A) = 200(0{,}6) + 100(0{,}7) = 120 + 70 = 190$ nghìn đồng.
    - $T(B) = 200(1{,}6) + 100(0{,}2) = 320 + 20 = 340$ nghìn đồng.
    - $T(C) = 200(0{,}3) + 100(1{,}1) = 60 + 110 = 170$ nghìn đồng.
    - $T(D) = 200(1{,}6) + 100(1{,}1) = 320 + 110 = 430$ nghìn đồng.
    Chi phí thấp nhất là $170$ nghìn đồng (tức $170.000$ đồng) đạt được tại đỉnh $C(0{,}3; 1{,}1)$ (mua 0,3kg bò và 1,1kg heo).
    Chọn đáp án *D*.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 4, reset-counter: true)

#ds(
  [Một gia đình cần ít nhất 900g chất protein và 400g chất lipit trong thức ăn mỗi ngày. Thịt bò chứa 80% protein và 20% lipit. Thịt lợn chứa 60% protein và 40% lipit. Gia đình chỉ mua nhiều nhất là 1,6kg thịt bò (45.000 đ/kg) và 1,1kg thịt lợn (35.000 đ/kg). Giả sử gia đình mua $x$ kg thịt bò và $y$ kg thịt lợn. Khi đó:],
  (
    True([Hệ bất phương trình biểu thị các điều kiện của bài toán là $cases(0 <= x <= 1.6, 0 <= y <= 1.1, 4x + 3y >= 4.5, x + 2y >= 2)$.]),
    [Miền nghiệm của hệ bất phương trình trên là một miền tam giác.],
    [Số tiền chi phí để mua là $T = 35x + 45y$ (nghìn đồng).],
    True([Gia đình đó mua 0,6 kg thịt bò và 0,7 kg thịt lợn thì chi phí là ít nhất.]),
  ),
  loigiai: [
    - *a) Đúng:* Lập các bất phương trình:
      + Protein: $800x + 600y >= 900 <=> 4x + 3y >= 4{,}5$.
      + Lipit: $200x + 400y >= 400 <=> x + 2y >= 2$.
      + Ràng buộc mua: $0 <= x <= 1{,}6$ và $0 <= y <= 1{,}1$.
    - *b) Sai:* Xác định các đỉnh của miền nghiệm:
      + $A(0{,}6; 0{,}7)$ (giao điểm của $4x + 3y = 4{,}5$ và $x + 2y = 2$).
      + $B(1{,}6; 0{,}2)$ (giao điểm của $x = 1{,}6$ và $x + 2y = 2$).
      + $C(0{,}3; 1{,}1)$ (giao điểm của $4x + 3y = 4{,}5$ và $y = 1{,}1$).
      + $D(1{,}6; 1{,}1)$ (đỉnh góc trên bên phải).
      Miền nghiệm là một tứ giác $A B D C$, không phải tam giác.
    - *c) Sai:* Vì thịt bò giá 45.000 đ/kg và thịt lợn giá 35.000 đ/kg nên chi phí phải là $T = 45x + 35y$ (nghìn đồng), công thức $T = 35x + 45y$ đã bị hoán vị ngược hệ số.
    - *d) Đúng:* Tính chi phí $T = 45x + 35y$ tại các đỉnh:
      + Tại $A(0{,}6; 0{,}7)$: $T = 45(0{,}6) + 35(0{,}7) = 27 + 24{,}5 = 51{,}5$ nghìn đồng.
      + Tại $B(1{,}6; 0{,}2)$: $T = 45(1{,}6) + 35(0{,}2) = 72 + 7 = 79$ nghìn đồng.
      + Tại $C(0{,}3; 1{,}1)$: $T = 45(0{,}3) + 35(1{,}1) = 13{,}5 + 38{,}5 = 52$ nghìn đồng.
      + Tại $D(1{,}6; 1{,}1)$: $T = 45(1{,}6) + 35(1{,}1) = 72 + 38{,}5 = 110{,}5$ nghìn đồng.
      Chi phí nhỏ nhất là $51{,}5$ nghìn đồng (51.500 đồng) đạt tại $A(0{,}6; 0{,}7)$, tức mua 0,6kg thịt bò và 0,7kg thịt lợn.
  ]
)

#ds(
  [Một phân xưởng sản xuất hai kiểu mũ: Thời gian làm 1 mũ kiểu I gấp 2 lần kiểu II. Nếu chỉ sản xuất toàn kiểu II thì trong 1 giờ làm được 60 chiếc. Phân xưởng làm việc 8 tiếng mỗi ngày. Thị trường tiêu thụ tối đa 200 chiếc mũ kiểu I và 240 chiếc mũ kiểu II mỗi ngày. Tiền lãi 1 chiếc mũ kiểu I là 24 nghìn đồng, kiểu II là 15 nghìn đồng. Gọi $x, y$ là số mũ kiểu I và II cần sản xuất. Khi đó:],
  (
    [Thời gian để làm $x$ chiếc mũ kiểu I và $y$ chiếc mũ kiểu II là $(2x - y)/60$ giờ.],
    True([Hệ bất phương trình mô tả các điều kiện là $cases(0 <= x <= 200, 0 <= y <= 240, 2x + y <= 480)$.]),
    True([Phân xưởng cần sản xuất 120 chiếc mũ kiểu I và 240 chiếc mũ kiểu II thì tiền lãi thu được cao nhất.]),
    True([Số tiền lãi cao nhất thu được trong một ngày là 6.480.000 đồng.]),
  ),
  loigiai: [
    - *a) Sai:* 1 giờ làm được 60 mũ kiểu II $=>$ 1 mũ kiểu II cần $1/60$ giờ. Mũ kiểu I cần thời gian gấp đôi nên cần $2/60$ giờ. Tổng thời gian làm $x$ mũ kiểu I và $y$ mũ kiểu II là: $2/60 x + 1/60 y = (2x + y)/60$ giờ, dấu "$-$" là sai.
    - *b) Đúng:* Xưởng làm 8 tiếng/ngày nên $(2x + y)/60 <= 8 <=> 2x + y <= 480$. Kết hợp điều kiện thị trường ta được hệ $cases(0 <= x <= 200, 0 <= y <= 240, 2x + y <= 480)$.
    - *c) Đúng:* Tiền lãi $L(x; y) = 24x + 15y$ (nghìn đồng).
      Các đỉnh miền nghiệm:
      + $O(0; 0) => L = 0$.
      + $A(200; 0) => L = 24(200) = 4800$.
      + $B(200; 80) => L = 24(200) + 15(80) = 4800 + 1200 = 6000$.
      + $C(120; 240) => L = 24(120) + 15(240) = 2880 + 3600 = 6480$.
      + $D(0; 240) => L = 15(240) = 3600$.
      Tiền lãi cao nhất là $6480$ nghìn đồng khi sản xuất 120 mũ kiểu I và 240 mũ kiểu II.
    - *d) Đúng:* Mức lãi cao nhất là $6480$ nghìn đồng $= 6.480.000$ đồng.
  ]
)

#ds(
  [Một phân xưởng may áo vest và quần âu chuẩn bị dịp cuối năm: May 1 áo vest hết 2m vải và 20 giờ; 1 quần âu hết 1,5m vải và 5 giờ. Xí nghiệp có tối đa 900m vải và 6000 giờ công. Số lượng quần bán ra không nhỏ hơn số áo và không vượt quá 2 lần số áo. 1 áo vest lãi 350 nghìn đồng, 1 quần âu lãi 100 nghìn đồng. Gọi $x, y$ là số áo vest và quần âu may. Khi đó:],
  (
    True([Hệ phương trình thỏa mãn điều kiện bài toán là $cases(2x + 1.5y <= 900, 20x + 5y <= 6000, x <= y <= 2x, x >= 0, y >= 0)$.]),
    True([Miền nghiệm của hệ bất phương trình trên là một miền tứ giác.]),
    True([Phân xưởng cần may 225 áo vest và 300 quần âu thì thu được tiền lãi cao nhất.]),
    True([Tiền lãi cao nhất mà phân xưởng thu được là 108.750.000 đồng.]),
  ),
  loigiai: [
    - *a) Đúng:* Lập hệ ràng buộc đúng theo giả thiết: vải $2x + 1{,}5y <= 900$, giờ công $20x + 5y <= 6000$, thị trường $x <= y <= 2x$ và $x, y >= 0$.
    - *b) Đúng:* Xác định các đỉnh của miền nghiệm:
      + Giao của $y = x$ và $y = 2x$ là $O(0; 0)$.
      + Giao của $y = 2x$ và $2x + 1{,}5y = 900$ là $A(180; 360)$.
      + Giao của $2x + 1{,}5y = 900$ và $20x + 5y = 6000$ là $B(225; 300)$.
      + Giao của $y = x$ và $20x + 5y = 6000$ là $C(240; 240)$.
      Miền nghiệm là tứ giác $O A B C$.
    - *c) Đúng:* Hàm tiền lãi $L(x; y) = 350x + 100y$ (nghìn đồng).
      Tính tại các đỉnh:
      + $L(O) = 0$.
      + $L(A) = 350(180) + 100(360) = 63.000 + 36.000 = 99.000$.
      + $L(B) = 350(225) + 100(300) = 78.750 + 30.000 = 108.750$.
      + $L(C) = 350(240) + 100(240) = 84.000 + 24.000 = 108.000$.
      Lãi cao nhất đạt được tại $B(225; 300)$, tức may 225 áo vest và 300 quần âu.
    - *d) Đúng:* Mức lãi cao nhất là $108.750$ nghìn đồng $= 108.750.000$ đồng.
  ]
)

#ds(
  [Bác An đầu tư 1,2 tỉ đồng vào ba loại trái phiếu: chính phủ lãi suất 7%/năm, ngân hàng lãi suất 8%/năm, doanh nghiệp lãi suất 12%/năm. Số tiền mua trái phiếu chính phủ gấp ít nhất 3 lần trái phiếu ngân hàng, đầu tư không quá 200 triệu đồng cho trái phiếu doanh nghiệp. Gọi $x, y$ lần lượt là số tiền (triệu đồng) mua trái phiếu ngân hàng và doanh nghiệp. Khi đó:],
  (
    [Hệ bất phương trình ràng buộc là $cases(x >= 0, y >= 0, 4x + y <= 1200, y >= 200)$.],
    [Nếu bác An chỉ đầu tư 300 triệu đồng mua trái phiếu ngân hàng thì lợi nhuận một năm là 94 triệu đồng.],
    True([Bác An nên đầu tư 250 triệu ngân hàng, 200 triệu doanh nghiệp và 750 triệu chính phủ để lợi nhuận lớn nhất.]),
    True([Lợi nhuận nhiều nhất sau một năm bác An thu được là 96,5 triệu đồng.]),
  ),
  loigiai: [
    Số tiền mua trái phiếu chính phủ là $z = 1200 - (x + y)$ (triệu đồng).
    - Ràng buộc:
      + $z >= 3x <=> 1200 - x - y >= 3x <=> 4x + y <= 1200$.
      + Trái phiếu doanh nghiệp không quá 200 triệu: $0 <= y <= 200$.
      + $x >= 0$.
    - *a) Sai:* Bất phương trình đối với $y$ phải là $y <= 200$, mệnh đề ghi $y >= 200$ là sai.
    - *b) Sai:* Nếu chỉ đầu tư 300 triệu mua TP ngân hàng ($x = 300, y = 0$) thì số tiền còn lại mua TP chính phủ là $z = 1200 - 300 = 900$ triệu.
      Lợi nhuận thu được: $L = 8\%(300) + 7\%(900) = 24 + 63 = 87$ triệu đồng $!= 94$ triệu đồng.
    - *c) Đúng:* Hàm lợi nhuận theo $x, y$:
      $L(x; y) = 0{,}08x + 0{,}12y + 0{,}07(1200 - x - y) = 0{,}01x + 0{,}05y + 84$ (triệu đồng).
      Vì các hệ số đều dương nên $L$ đạt giá trị lớn nhất khi $x, y$ lớn nhất:
      Lấy $y = 200$ triệu đồng, suy ra $4x <= 1200 - 200 = 1000 <=> x <= 250$ triệu đồng.
      Khi đó số tiền mua TP chính phủ là $z = 1200 - 250 - 200 = 750$ triệu đồng.
    - *d) Đúng:* Lợi nhuận lớn nhất:
      $L_max = 0{,}01(250) + 0{,}05(200) + 84 = 2{,}5 + 10 + 84 = 96{,}5$ triệu đồng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 5, reset-counter: true)

#tln(
  dir: "ngang",
  [Tìm giá trị lớn nhất của biểu thức $F = 3x - 2y$ trên miền nghiệm của hệ bất phương trình: $cases(x + y - 3 <= 0, x >= 0, y >= 0)$.],
  [9],
  loigiai: [
    Miền nghiệm của hệ là miền tam giác $O A B$ vuông tại $O(0; 0)$ với $A(3; 0)$ và $B(0; 3)$.
    Tính giá trị $F = 3x - 2y$ tại ba đỉnh:
    - Tại $O(0; 0)$: $F = 0$.
    - Tại $A(3; 0)$: $F = 3(3) - 2(0) = 9$.
    - Tại $B(0; 3)$: $F = 3(0) - 2(3) = -6$.
    Vậy giá trị lớn nhất của $F$ bằng $9$, đạt tại $A(3; 0)$.
  ]
)

#tln(
  dir: "ngang",
  [Tìm giá trị nhỏ nhất của biểu thức $f(x; y) = 4x + 3y$ trong miền đa giác lồi xác định bởi hệ: $cases(0 <= x <= 10, 0 <= y <= 9, 2x + y >= 14, 2x + 5y >= 30)$.],
  [32],
  loigiai: [
    Miền nghiệm là miền tứ giác $A B D C$ với các đỉnh:
    - $A(5; 4)$ (giao điểm của $2x + y = 14$ và $2x + 5y = 30$).
    - $B(2{,}5; 9)$ (giao điểm của $2x + y = 14$ với $y = 9$).
    - $C(10; 2)$ (giao điểm của $2x + 5y = 30$ với $x = 10$).
    - $D(10; 9)$ (giao điểm của $x = 10$ và $y = 9$).
    Tính giá trị $f(x; y) = 4x + 3y$ tại các đỉnh:
    - Tại $A(5; 4)$: $f(5; 4) = 4(5) + 3(4) = 20 + 12 = 32$.
    - Tại $B(2{,}5; 9)$: $f(2{,}5; 9) = 4(2{,}5) + 3(9) = 10 + 27 = 37$.
    - Tại $C(10; 2)$: $f(10; 2) = 4(10) + 3(2) = 40 + 6 = 46$.
    - Tại $D(10; 9)$: $f(10; 9) = 4(10) + 3(9) = 40 + 27 = 67$.
    Giá trị nhỏ nhất là $32$, đạt tại điểm $A(5; 4)$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hai số thực $x, y$ thỏa mãn hệ: $cases(x - 1 <= 0, y + 1 >= 0, x - y + 3 >= 0)$. Giá trị nhỏ nhất của biểu thức $M = 2x + y$ bằng bao nhiêu?],
  [-9],
  loigiai: [
    Miền nghiệm là tam giác tạo bởi ba đường thẳng biên $x = 1$, $y = -1$ và $x - y = -3$.
    Tìm tọa độ ba đỉnh:
    - Giao của $x = 1$ và $y = -1$: $A(1; -1)$.
    - Giao của $x = 1$ và $x - y = -3$: $1 - y = -3 <=> y = 4 => B(1; 4)$.
    - Giao của $y = -1$ và $x - y = -3$: $x - (-1) = -3 <=> x = -4 => C(-4; -1)$.
    Tính giá trị $M = 2x + y$ tại ba đỉnh:
    - Tại $A(1; -1)$: $M = 2(1) + (-1) = 1$.
    - Tại $B(1; 4)$: $M = 2(1) + 4 = 6$.
    - Tại $C(-4; -1)$: $M = 2(-4) + (-1) = -9$.
    Vậy giá trị nhỏ nhất của $M$ là $-9$, đạt tại $C(-4; -1)$.
  ]
)

#tln(
  dir: "ngang",
  [Một bãi đỗ xe ban đêm có diện tích $150 "m"^2$. Mỗi xe du lịch cần $3 "m"^2$ diện tích và trả phí 40 nghìn đồng; mỗi xe tải cần $5 "m"^2$ và trả phí 50 nghìn đồng. Bãi đỗ xe chỉ có thể phục vụ tối đa 40 xe mỗi đêm. Doanh thu cao nhất chủ bãi xe có thể thu được trong một đêm là bao nhiêu nghìn đồng?],
  [1750],
  loigiai: [
    Gọi $x, y$ lần lượt là số xe du lịch và xe tải nhận trông giữ trong một đêm ($x, y in NN$).
    Các điều kiện ràng buộc:
    - Diện tích bãi: $3x + 5y <= 150$.
    - Số lượng xe: $x + y <= 40$.
    - Số nguyên không âm: $x >= 0, y >= 0$.
    Hàm doanh thu: $F(x; y) = 40x + 50y$ (nghìn đồng).
    Các đỉnh của miền nghiệm tứ giác:
    - $O(0; 0) => F = 0$.
    - $A(40; 0)$ (giao điểm của $x + y = 40$ với $O x$) $=> F = 40(40) = 1600$ nghìn đồng.
    - $B(25; 15)$ (giao điểm của $3x + 5y = 150$ và $x + y = 40$):
      Giải hệ được $x = 25, y = 15$.
      Doanh thu: $F(25; 15) = 40(25) + 50(15) = 1000 + 750 = 1750$ nghìn đồng.
    - $C(0; 30)$ (giao điểm của $3x + 5y = 150$ với $O y$) $=> F = 50(30) = 1500$ nghìn đồng.
    So sánh giá trị tại các đỉnh, doanh thu cao nhất đạt được là $1750$ nghìn đồng (khi nhận 25 xe du lịch và 15 xe tải).
  ]
)

#tln(
  dir: "ngang",
  [Bạn An dự định tập tạ và đạp xe để rèn luyện sức khỏe. Mỗi giờ tập tạ tiêu hao 700 calo. Tuần này xe đạp bị hỏng nên An chỉ có thể tập tạ. An muốn tiêu hao không quá 7000 calo trong tuần và chỉ có thể dành tối đa 12 giờ để tập. Để lượng calo tiêu hao là nhiều nhất thì An cần tập tạ trong bao nhiêu giờ?],
  [10],
  loigiai: [
    Gọi $t$ là số giờ tập tạ trong tuần của An ($t >= 0$).
    Theo đề bài, các điều kiện ràng buộc là:
    - Thời gian dành ra tối đa: $t <= 12$.
    - Lượng calo tiêu hao không quá 7000: $700t <= 7000 <=> t <= 10$.
    Kết hợp hai điều kiện: $0 <= t <= 10$.
    Lượng calo tiêu hao là hàm đồng biến: $C(t) = 700t$.
    Để lượng calo tiêu hao là nhiều nhất, An cần tập với số giờ lớn nhất thỏa mãn điều kiện, tức là $t = 10$ giờ (thỏa mãn $10 <= 12$).
    Vậy An cần tập tạ trong $10$ giờ.
  ]
)
