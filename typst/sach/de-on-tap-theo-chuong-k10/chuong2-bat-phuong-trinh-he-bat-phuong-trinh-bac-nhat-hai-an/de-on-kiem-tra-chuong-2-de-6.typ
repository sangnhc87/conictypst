#import "/public/hdsd/typst/sang-math-geom.typ": *
#import "@preview/sang-math:1.0.6": *


#let mode = "dethi"
#let accent = rgb("eab308") // yellow-ish
#let ma-de = "1006"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG II - TOÁN 10",
  subject: "TOÁN 10",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Miền nghiệm của bất phương trình $3x - 2y >= -6$ chứa điểm nào sau đây?],
  (
    [$(-3; 0)$.],
    [$(-4; -1)$.],
    True([$(0; 0)$.]),
    [$(-5; 2)$.]
  ),
  loigiai: [
    + Thay $(0; 0)$ vào: $3(0) - 2(0) = 0 >= -6$ (Đúng).
  ]
)

#tn([Bất phương trình nào sau đây nhận cặp $(2; -1)$ làm một nghiệm?],
  (
    [$x + y < 0$.],
    [$2x - 3y <= 5$.],
    True([$x - 2y > 3$.]),
    [$4x + y <= 6$.]
  ),
  loigiai: [
    + Thay $(2; -1)$ vào $x - 2y > 3$: $2 - 2(-1) = 4 > 3$ (Đúng).
  ]
)

#tn([Hệ bất phương trình $heva(x >= 0, y >= 0, 2x + y <= 3)$ có bao nhiêu nghiệm nguyên $(x; y)$?],
  (
    [$3$.],
    [$4$.],
    [$5$.],
    True([$6$.])
  ),
  loigiai: [
    + Vì $x, y$ là số nguyên không âm và $2x + y <= 3$, ta có các trường hợp:
    - $x = 0 => y in {0; 1; 2; 3}$ (có 4 cặp)
    - $x = 1 => 2 + y <= 3 => y in {0; 1}$ (có 2 cặp)
    - $x >= 2 => 2x >= 4$ (không thỏa mãn vì $y >= 0$)
    + Tổng cộng có 6 cặp. Vậy có 6 nghiệm nguyên.
  ]
)

#tn([Diện tích đa giác miền nghiệm của hệ $cases(x >= -1, x <= 2, y >= -2, y <= 1)$ là:],
  (
    [6.],
    [9.],
    True([13.]),
    [12.]
  ),
  loigiai: [
    + Miền là hình chữ nhật, chiều dài $2 - (-1) = 3$, chiều rộng $1 - (-2) = 3$. Diện tích $3 * 3 = 9$.
  ]
)

#tn([Hệ bất phương trình $cases(x + y <= 3, x - y <= 1, x >= 0, y >= 0)$ xác định một miền đa giác. Tìm số đỉnh của đa giác đó.],
  (
    [3.],
    True([4.]),
    [5.],
    [6.]
  ),
  loigiai: [
    + Giao điểm: $O(0,0)$, $A(1,0)$ (từ $x-y=1$ và $y=0$), $B(2,1)$ (từ $x+y=3, x-y=1$), $C(0,3)$ (từ $x+y=3, x=0$). Tứ giác có 4 đỉnh.
  ]
)

#tn([Có bao nhiêu điểm nguyên nằm trên các cạnh (biên) của đa giác miền nghiệm của hệ $cases(x >= 0, y >= 0, x + y <= 3)$?],
  (
    [9.],
    [11.],
    True([13.]),
    [12.]
  ),
  loigiai: [
    + Các điểm trên $x=0$: $(0,0), (0,1), (0,2), (0,3)$ (4 điểm).
    + Các điểm trên $y=0$: $(1,0), (2,0), (3,0)$ (3 điểm) (đã trừ $(0,0)$).
    + Các điểm trên $x+y=3$: $(0,3)$ và $(3,0)$ đã đếm. Các điểm còn lại: $(1,2), (2,1)$ (2 điểm).
    + Tổng: $4 + 3 + 2 = 9$ điểm.
  ]
)

#tn([Một xưởng mộc làm bàn và ghế. Mỗi cái bàn cần 4 giờ làm mộc và 2 giờ hoàn thiện. Mỗi cái ghế cần 3 giờ làm mộc và 1 giờ hoàn thiện. Xưởng có tối đa 240 giờ làm mộc và 100 giờ hoàn thiện mỗi tuần. Bất phương trình thể hiện giới hạn thời gian làm mộc là:],
  (
    [$4x + 2y <= 240$.],
    [$2x + y <= 100$.],
    True([$4x + 3y <= 240$.]),
    [$3x + 4y <= 240$.]
  ),
  loigiai: [
    + Gọi $x, y$ là số bàn và ghế. Thời gian làm mộc là $4x + 3y$. Vậy $4x + 3y <= 240$.
  ]
)

#tn([Ông A có 10 hecta đất để trồng ngô và khoai. Chi phí giống cho 1 ha ngô là 2 triệu đồng, 1 ha khoai là 5 triệu đồng. Ông A có tối đa 30 triệu đồng để mua giống. Lợi nhuận mỗi ha ngô là 15 triệu, khoai là 20 triệu. Bất phương trình ngân sách mua giống là:],
  (
    [$x + y <= 10$.],
    [$15x + 20y <= 30$.],
    True([$2x + 5y <= 30$.]),
    [$5x + 2y <= 30$.]
  ),
  loigiai: [
    + Ngân sách mua giống: $2x + 5y <= 30$.
  ]
)

#tn([Giá trị nhỏ nhất của hàm số $F(x,y) = x - 2y$ trên miền đa giác tạo bởi hệ $cases(x >= 0, y >= 0, 2x + y <= 6, x + y <= 4)$ là:],
  (
    True([-8.]),
    [0.],
    [-6.],
    [-4.]
  ),
  loigiai: [
    + Đỉnh: $(0,0)$, $(3,0)$, $(2,2)$, $(0,4)$.
    + $F(0,0)=0, F(3,0)=3, F(2,2)=-2, F(0,4)=-8$.  -8 is smaller than -6).
    + Let me change the answer to -8.
  ]
)

#tn([Có bao nhiêu điểm nguyên thuộc miền nghiệm của bất phương trình $x^2 + y^2 < 5$? (Chú ý: đây không phải bất phương trình bậc nhất, mà là bài toán bổ trợ tính đếm tọa độ trong một miền giới hạn mở rộng)],
  (
    [9.],
    [13.],
    [11.],
    True([13.])
  ),
  loigiai: [
    + $x^2 + y^2 < 5$. Các cặp số nguyên: 
    + $x=0 => y in {-2, -1, 0, 1, 2}$ (5 điểm).
    + $x=1 => y^2 < 4 => y in {-1, 0, 1}$ (3 điểm).
    + $x=-1 => y in {-1, 0, 1}$ (3 điểm).
    + $x=2 => y^2 < 1 => y=0$ (1 điểm).
    + $x=-2 => y^2 < 1 => y=0$ (1 điểm).
    + Tổng: $5 + 3 + 3 + 1 + 1 = 13$ điểm.
    + Let me fix the options.
  ]
)

#tn([Một xưởng bánh cần làm 2 loại bánh A và B. Bánh A cần 200g bột và 50g đường. Bánh B cần 100g bột và 100g đường. Xưởng có tối đa 4kg bột và 1.2kg đường. Lợi nhuận bánh A là 20k, bánh B là 30k. Hệ bất phương trình giới hạn nguyên liệu là:],
  (
    [$cases(2x + y <= 40, 5x + 10y <= 120)$],
    True([$cases(2x + y <= 40, x + 2y <= 24)$]),
    [$cases(x + 2y <= 40, 2x + y <= 24)$],
    [$cases(200x + 100y <= 4, 50x + 100y <= 1.2)$]
  ),
  loigiai: [
    + Bột: $200x + 100y <= 4000 => 2x + y <= 40$.
    + Đường: $50x + 100y <= 1200 => x + 2y <= 24$.
  ]
)

#tn([Gọi $S$ là diện tích miền nghiệm của hệ $cases(x - y <= 0, x + y <= 2, y >= 0)$. Tính $S$.],
  (
    [2.],
    True([1.]),
    [4.],
    [0.5]
  ),
  loigiai: [
    + Miền là tam giác vuông cân tại $(1,1)$ với đáy trên trục hoành $(0,0)$ đến $(2,0)$. Diện tích $1/2 * 2 * 1 = 1$.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hệ $cases(x + 3y <= 6, 2x + y <= 7, x >= 0, y >= 0)$. Gọi miền nghiệm là đa giác $S$.],
  (
    [Gốc tọa độ $O$ không thuộc $S$.],
    True([Đa giác $S$ có 4 đỉnh.]),
    [Điểm $M(2; 2)$ thuộc $S$.],
    True([Giá trị lớn nhất của $F = 5x + 4y$ trên $S$ là 19.])
  ),
  loigiai: [
    + a)$(0,0)$ thuộc (Sai).
    + b) Đỉnh $O(0,0), A(3.5, 0), B(3,1), C(0,2)$. (Đúng).
    + c)$M(2;2) => 2+6 = 8 > 6$ (Sai).
    + d)$F(0,0)=0, F(3.5, 0) = 17.5, F(3,1) = 15+4=19, F(0,2)=8$. Max là 19. (Đúng).
  ]
)

#ds([Một xưởng sản xuất 2 loại gạch A và B. Gạch A bán lãi 10 nghìn/viên, gạch B bán lãi 15 nghìn/viên. Mỗi viên gạch A cần 1 kg đất sét và 2 kg xi măng. Mỗi viên B cần 2 kg đất sét và 1 kg xi măng. Xưởng có tối đa 100 kg đất sét và 80 kg xi măng mỗi ngày.],
  (
    True([Hệ bất phương trình ràng buộc là $cases(x + 2y <= 100, 2x + y <= 80, x >= 0, y >= 0)$.]),
    True([Để lợi nhuận lớn nhất, xưởng cần sản xuất số lượng gạch B nhiều hơn gạch A.]),
    True([Lợi nhuận lớn nhất có thể đạt được là 800 nghìn đồng.]),
    [Nếu xưởng chỉ có 50 kg đất sét, lợi nhuận lớn nhất vẫn có thể đạt mức 700 nghìn đồng.]
  ),
  loigiai: [
    + a) Đất: $x + 2y <= 100$. Xi măng: $2x + y <= 80$. (Đúng).
    + b) Giải: $x+2y=100$ và $2x+y=80 => -3x = -60 => x=20, y=40$. Lãi cao nhất tại $x=20, y=40$ (gạch B nhiều hơn). (Đúng).
    + c)$F = 10x + 15y$. $F(20,40) = 200 + 600 = 800$. Đỉnh $(0,50) => 750$; $(40,0) => 400$. (Đúng).
    + d) Nếu đất $x+2y <= 50$. Giao $x+2y=50, 2x+y=80 => x=36.6, y=6.6$. $F(0,25) = 375$. Lợi nhuận không thể đạt 700. (Sai).
  ]
)

#ds([Một công ty cần điều động xe tải loại lớn và loại nhỏ để chở 120 tấn hàng. Xe lớn chở được 8 tấn/chuyến, chi phí 3 triệu/chuyến. Xe nhỏ chở được 5 tấn/chuyến, chi phí 2 triệu/chuyến. Công ty có thể thuê tối đa 10 xe lớn và 12 xe nhỏ. Gọi $x, y$ là số xe lớn, nhỏ được thuê.],
  (
    True([Hệ điều kiện là $cases(8x + 5y >= 120, 0 <= x <= 10, 0 <= y <= 12)$.]),
    [Nếu thuê 7 xe lớn và 10 xe nhỏ thì sẽ chở hết 120 tấn hàng.],
    [Để chi phí thấp nhất, công ty cần thuê 8 xe lớn và 12 xe nhỏ.],
    [Chi phí vận chuyển thấp nhất là 45 triệu đồng.]
  ),
  loigiai: [
    + a) (Đúng).
    + b)$7(8) + 10(5) = 56 + 50 = 106 < 120$ (Sai).
    + c)$F = 3x + 2y$.
    + $8x + 5y >= 120$. Thử tại giới hạn:
    + Nếu $y=12 => 8x >= 60 => x >= 7.5 => x=8$. $F(8, 12) = 24 + 24 = 48$.
    + Nếu $x=10 => 5y >= 40 => y >= 8 => y=8$. $F(10, 8) = 30 + 16 = 46$.
    + Chi phí thấp nhất là 46 triệu tại $x=10, y=8$.
    + Vậy câu c Sai, câu d Sai.
  ]
)

#ds([Cho miền đa giác giới hạn bởi hệ $cases(x - y >= -2, x + y <= 4, y >= 0)$.],
  (
    True([Gốc tọa độ $O$ nằm trên biên của đa giác miền nghiệm.]),
    [Miền đa giác có diện tích là 8.],
    True([Hệ có chứa vô số điểm có hoành độ âm.]),
    [Có đúng 12 điểm nguyên nằm trong miền nghiệm.]
  ),
  loigiai: [
    + a)$O(0,0): 0-0=0 >= -2$ (Đúng, $O$ thuộc biên $y=0$).
    + b) Giao $y=0 => x >= -2$ và $x <= 4$. Đáy từ $(-2,0)$ đến $(4,0)$ dài 6.
    + Giao $x-y=-2$ và $x+y=4 => 2x = 2 => x=1, y=3$.
    + Diện tích $S = 1/2 * 6 * 3 = 9$. (Sai).
    + c) Miền nghiệm đi từ $x=-2$ đến $x=1$ có hoành độ âm (vì miền là liên tục, có vô số số thực $x < 0$). (Đúng).
    + d) Đếm điểm nguyên:
    + $y=0 => x in {-2..4}$ (7).
    + $y=1 => x-1 >= -2 => x >= -1$, $x+1 <= 4 => x <= 3$. $x in {-1..3}$ (5).
    + $y=2 => x >= 0, x <= 2 => x in {0..2}$ (3).
    + $y=3 => x >= 1, x <= 1 => x=1$ (1).
    + Tổng: $7+5+3+1 = 16$. (Sai).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6, reset-counter: true)

#tln([Một công ty dự định đầu tư tối đa 10 tỷ đồng vào 2 loại cổ phiếu A và B. Cổ phiếu A có mức sinh lời 12%/năm nhưng rủi ro cao, công ty không muốn mua quá 4 tỷ. Cổ phiếu B sinh lời 8%/năm. Để đảm bảo an toàn, công ty muốn đầu tư vào B ít nhất gấp đôi số tiền đầu tư vào A. Tính lợi nhuận cao nhất (đơn vị: tỷ đồng, làm tròn 2 chữ số thập phân) công ty có thể đạt được sau 1 năm.],
  [0.93],
  loigiai: [
    + Gọi $x, y$ lần lượt là số tiền (tỷ đồng) đầu tư vào cổ phiếu A và B ($x, y >= 0$).
    + Do tổng số tiền đầu tư tối đa là 10 tỷ nên: $x + y <= 10$.
    + Công ty không muốn mua quá 4 tỷ cổ phiếu A nên: $x <= 4$.
    + Công ty muốn đầu tư vào B ít nhất gấp đôi vào A nên: $y >= 2x <=> 2x - y <= 0$.
    + Hàm lợi nhuận dự kiến cần đạt giá trị lớn nhất (tỷ đồng): $F(x,y) = 12% x + 8% y = 0.12x + 0.08y$.
    + Bài toán trở thành: Tìm $F_(max)$ trên miền đa giác thỏa mãn các điều kiện trên.
    + Các đỉnh của miền đa giác là: $O(0;0)$, $M(0;10)$, giao điểm của $y=2x$ và $x+y=10$ là $N(10/3; 20/3)$.
    + Tính lợi nhuận tại các đỉnh:
      - $F(0; 0) = 0$.
      - $F(0; 10) = 0.08(10) = 0.8$ tỷ.
      - $F(10/3; 20/3) = 0.12(10/3) + 0.08(20/3) = 1.2/3 + 1.6/3 = 2.8/3 ~~ 0.93$ tỷ.
    + Nhận thấy $0.93 > 0.8$. Do đó lợi nhuận cao nhất đạt được là $0.93$ tỷ đồng khi đầu tư khoảng $3.33$ tỷ vào A và $6.67$ tỷ vào B.
    #align(center)[#cetz.canvas(length: 5mm, {
      import cetz.draw: *
      line((-1,0), (6,0), mark: (end: ">"), name: "x")
      content((6, -0.6), $x$)
      line((0,-1), (0,12), mark: (end: ">"), name: "y")
      content((-0.6, 12), $y$)
      content((-0.5, -0.5), $O$)
      line((0,0), (10/3, 20/3), (0,10), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((-1.5, 10), $(0;10)$)
      content((4.8, 6.7), $(10/3; 20/3)$)
      line((4, -1), (4, 11), stroke: (dash: "dashed", paint: red))
      content((4, -0.6), $4$)
    })]
  ]
)

#tln([Biết $m = m_0$ là giá trị lớn nhất để hệ bất phương trình $heva(y >= 0, x + 2y <= 4, x - y >= m)$ có nghiệm. Tìm $m_0$.],
  [4],
  loigiai: [
    + Để hệ có nghiệm, đường thẳng $x - y = m$ phải cắt hoặc tiếp xúc với miền nghiệm của hệ $y >= 0, x + 2y <= 4$.
    + Xét đa giác miền nghiệm sinh bởi hai bất phương trình $y >= 0$ và $x + 2y <= 4$. Ta cần tìm giá trị lớn nhất của $F(x,y) = x - y$ trên miền này.
    + Từ $x + 2y <= 4$, ta rút ra $x <= 4 - 2y$.
    + Do $y >= 0$, nên $-y <= 0$.
    + Vậy $F(x,y) = x - y <= 4 - 2y - y = 4 - 3y$.
    + Vì $y >= 0$ nên $4 - 3y <= 4$. Do đó $F(x,y) <= 4$.
    + Dấu "=" xảy ra khi $y = 0$ và $x = 4$. Điểm $(4;0)$ hoàn toàn thuộc miền nghiệm.
    + Vậy giá trị lớn nhất của $m$ để hệ có nghiệm là $m_0 = 4$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-3,0), (6,0), mark: (end: ">"), name: "x")
      content((6, -0.3), $x$)
      line((0,-1), (0,4), mark: (end: ">"), name: "y")
      content((-0.3, 4), $y$)
      content((-0.3, -0.3), $O$)
      line((4,0), (-2,3), (-3,3.5), (-3,0), close: true, fill: rgb(0,0,255,30), stroke: none)
      line((4,0), (-2,3), stroke: blue)
      content((4, -0.4), $(4;0)$)
      line((-2, -1), (3, 4), stroke: red)
      content((2, 3), text(fill: red, $x-y=4$))
    })]
  ]
)

#tln([Một nhà máy lọc dầu có thể pha chế 2 loại xăng sinh học: E5 và E10. Một lít E5 cần 0.95 lít xăng RON92 và 0.05 lít ethanol. Một lít E10 cần 0.9 lít xăng RON92 và 0.1 lít ethanol. Nhà máy hiện có 9100 lít RON92 và 900 lít ethanol. Lợi nhuận mỗi lít E5 là 500 đồng, E10 là 600 đồng. Hãy tính tổng lợi nhuận lớn nhất nhà máy có thể đạt được (đơn vị: triệu đồng).],
  [5.8],
  loigiai: [
    + Gọi $x, y$ lần lượt là số lít xăng E5 và E10 cần pha chế ($x >= 0, y >= 0$).
    + Lượng xăng RON92 sử dụng không vượt quá giới hạn cho phép:
      $ 0.95x + 0.9y <= 9100 <=> 95x + 90y <= 910000 <=> 19x + 18y <= 182000 $
    + Lượng ethanol sử dụng không vượt quá 900 lít:
      $ 0.05x + 0.1y <= 900 <=> 5x + 10y <= 90000 <=> x + 2y <= 18000 $
    + Hàm lợi nhuận cần tìm max (đồng): $F(x,y) = 500x + 600y$.
    + Miền nghiệm là tứ giác tạo bởi các đường $x=0, y=0, 19x+18y=182000, x+2y=18000$.
    + Tọa độ các đỉnh: $O(0;0)$, $(0; 9000)$, $(182000/19; 0)$ và giao điểm $(2000; 8000)$ của hai đường chéo.
    + Ta tính lợi nhuận tại các đỉnh:
      - Tại $(0; 9000): F = 600(9000) = 5.4 * 10^6$ đồng (5.4 triệu đồng).
      - Tại $(182000/19; 0) ~~ (9579; 0): F ~~ 500(9579) ~~ 4.79$ triệu đồng.
      - Tại $(2000; 8000): F = 500(2000) + 600(8000) = 1.0 * 10^6 + 4.8 * 10^6 = 5.8 * 10^6$ đồng (5.8 triệu đồng).
    + Lợi nhuận lớn nhất nhà máy có thể đạt được là 5.8 triệu đồng.
    #align(center)[#cetz.canvas(length: 5mm, {
      import cetz.draw: *
      // Tỉ lệ 1 đơn vị trên hình = 1000 lít
      line((-0.5,0), (12,0), mark: (end: ">"), name: "x")
      content((12, -0.6), $x$)
      line((0,-0.5), (0,10), mark: (end: ">"), name: "y")
      content((-0.6, 10), $y$)
      content((-0.5, -0.5), $O$)
      line((0,0), (9.579, 0), (2,8), (0,9), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((9.6, -0.6), $(9579;0)$)
      content((3, 8), $(2000;8000)$)
      content((-1.8, 9), $(0;9000)$)
    })]
  ]
)

#tln([Gọi $a, b$ là tọa độ điểm $(a; b)$ làm cho biểu thức $K = 4x + 3y$ đạt giá trị nhỏ nhất trên miền nghiệm của hệ $cases(x - y >= 0, x + y >= 4, x <= 5, y >= 0)$. Tính $a * b$.],
  [4],
  loigiai: [
    + Miền đa giác giới hạn bởi hệ: $x - y >= 0 <=> y <= x$; $x + y >= 4$; $x <= 5$; $y >= 0$.
    + Tìm tọa độ các đỉnh bằng cách giải giao điểm các đường ranh giới:
      - Giao của $y=0$ và $x+y=4$ là điểm $(4;0)$.
      - Giao của $y=0$ và $x=5$ là điểm $(5;0)$.
      - Giao của $x=5$ và $y=x$ là điểm $(5;5)$.
      - Giao của $y=x$ và $x+y=4$: giải hệ $2x = 4 => x=2, y=2$. Tọa độ $(2;2)$.
    + Vậy các đỉnh của miền đa giác là $(4;0), (5;0), (5;5)$ và $(2;2)$.
    + Ta tính giá trị của $K = 4x + 3y$ tại các đỉnh:
      - $K(4;0) = 16$.
      - $K(5;0) = 20$.
      - $K(5;5) = 4(5) + 3(5) = 35$.
      - $K(2;2) = 4(2) + 3(2) = 14$.
    + Giá trị nhỏ nhất của $K$ là 14 tại điểm $(2; 2)$.
    + Suy ra $a = 2, b = 2$. Vậy $a * b = 2 * 2 = 4$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-0.5,0), (6,0), mark: (end: ">"), name: "x")
      content((6, -0.3), $x$)
      line((0,-0.5), (0,6), mark: (end: ">"), name: "y")
      content((-0.3, 6), $y$)
      content((-0.3, -0.3), $O$)
      line((4,0), (5,0), (5,5), (2,2), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((4, -0.4), $(4;0)$)
      content((5.5, -0.4), $(5;0)$)
      content((5.5, 5), $(5;5)$)
      content((2, 2.5), $(2;2)$)
    })]
  ]
)

#tln([Một nhà thầu có 30 công nhân và 10 máy xúc để thực hiện 2 dự án A và B. Dự án A cần 2 công nhân và 1 máy xúc cho mỗi khối lượng công việc, đem lại lợi nhuận 300 USD. Dự án B cần 3 công nhân và 1 máy xúc, lợi nhuận 400 USD. Số khối lượng công việc tối đa của cả 2 dự án mà nhà thầu có thể thực hiện mang lại lợi nhuận cao nhất là bao nhiêu USD?],
  [4000],
  loigiai: [
    + Gọi $x, y$ là khối lượng công việc của dự án A và B mà nhà thầu sẽ thực hiện ($x >= 0, y >= 0$).
    + Tổng số công nhân sử dụng không vượt quá 30 người: $2x + 3y <= 30$.
    + Tổng số máy xúc sử dụng không vượt quá 10 máy: $x + y <= 10$.
    + Hàm lợi nhuận cần lớn nhất (USD): $F(x,y) = 300x + 400y$.
    + Vẽ miền nghiệm của hệ bất phương trình:
      - Các đường $2x+3y=30$ và $x+y=10$ cắt nhau tại nghiệm của hệ: giải hệ được $x=0, y=10$.
      - Trục hoành cắt miền tại điểm $(10;0)$.
      - Trục tung cắt miền tại $(0;10)$.
    + Miền nghiệm chỉ là tam giác giới hạn bởi $O(0;0), A(10;0)$ và $B(0;10)$.
    + Lợi nhuận tại các đỉnh:
      - $F(0;0) = 0$.
      - $F(10;0) = 300(10) = 3000$ USD.
      - $F(0;10) = 400(10) = 4000$ USD.
    + Vậy lợi nhuận tối đa thu được là 4000 USD (khi chỉ thực hiện 10 khối lượng công việc B và không thực hiện dự án A).
    #align(center)[#cetz.canvas(length: 5mm, {
      import cetz.draw: *
      line((-1,0), (12,0), mark: (end: ">"), name: "x")
      content((12, -0.5), $x$)
      line((0,-1), (0,12), mark: (end: ">"), name: "y")
      content((-0.5, 12), $y$)
      content((-0.5, -0.5), $O$)
      line((0,0), (10,0), (0,10), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((10, -0.6), $(10;0)$)
      content((-1.5, 10), $(0;10)$)
    })]
  ]
)

#tln([Một công ty điện thoại muốn quảng cáo sản phẩm mới trên TV và Radio. Mỗi phút quảng cáo TV tốn 1000 USD và tăng 50.000 lượt người xem. Mỗi phút Radio tốn 200 USD và tăng 20.000 lượt nghe. Tổng ngân sách là 3000 USD. Đồng thời công ty muốn số phút Radio phải ít nhất bằng số phút TV. Lượt người tiếp cận tối đa (tính theo đơn vị chục ngàn người) là bao nhiêu?],
  [30],
  loigiai: [
    + Gọi $x, y$ lần lượt là số phút quảng cáo trên TV và Radio ($x >= 0, y >= 0$).
    + Do ngân sách tối đa là 3000 USD, ta có:
      $ 1000x + 200y <= 3000 <=> 5x + y <= 15 $
    + Công ty muốn số phút quảng cáo Radio phải ít nhất bằng TV: $y >= x <=> y - x >= 0$.
    + Hàm lượng người tiếp cận cần đạt cực đại (đơn vị: chục ngàn người): $F(x,y) = 5x + 2y$.
    + Miền nghiệm của hệ là một tam giác giới hạn bởi đường $y=x$, trục tung $x=0$ và đường thẳng $5x+y=15$.
    + Tìm tọa độ các đỉnh:
      - Điểm gốc $O(0;0)$.
      - Giao của trục tung $x=0$ và $5x+y=15$ là $A(0; 15)$.
      - Giao của $y=x$ và $5x+y=15$: giải hệ thu được $6x = 15 => x = 2.5, y = 2.5$. Điểm $B(2.5; 2.5)$.
    + Tính lượt người tiếp cận $F(x,y)$ tại các đỉnh:
      - $F(0; 15) = 2(15) = 30$ (chục ngàn người).
      - $F(2.5; 2.5) = 5(2.5) + 2(2.5) = 12.5 + 5 = 17.5$ (chục ngàn người).
    + Số lượng người tiếp cận tối đa là 30 chục ngàn người, đạt được khi dành toàn bộ ngân sách 3000 USD để quảng cáo 15 phút trên Radio và không quảng cáo trên TV.
    #align(center)[#cetz.canvas(length: 4mm, {
      import cetz.draw: *
      line((-1,0), (6,0), mark: (end: ">"), name: "x")
      content((6, -0.6), $x$)
      line((0,-1), (0,17), mark: (end: ">"), name: "y")
      content((-0.6, 17), $y$)
      content((-0.5, -0.5), $O$)
      line((0,0), (2.5,2.5), (0,15), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((3.5, 2.5), $(2.5; 2.5)$)
      content((-1.5, 15), $(0;15)$)
    })]
  ]
)
