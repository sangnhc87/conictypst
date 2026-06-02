import codecs

with codecs.open('CD-DoanhThu-ChiPhi-Thue.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Insert Problem 1b
prob1b = r"""

#v(1em)
#note-box(title: "Dành cho học sinh tự luyện")[
#tln(
  id: "DTCP-01b",
  [Một công ty sản xuất $x$ sản phẩm ($x in [1, 500]$). Biết hàm doanh thu là $F(x) = 0.001x^3 - 1.999x^2 + 810x + 100$ (nghìn đồng). Chi phí bình quân cho mỗi sản phẩm là $G(x) = 0.001x + frac(100, x) + 2$ (nghìn đồng). Nhà nước đánh thuế phụ thu $8$ nghìn đồng cho mỗi sản phẩm bán ra. Hỏi công ty cần sản xuất bao nhiêu sản phẩm để lợi nhuận đạt giá trị lớn nhất?],
  [$250$],
  loigiai: [
    #ppgiai[Học sinh tự giải theo các bước mẫu của giáo viên.]
    
    #step[Bước 1: Chuyển về hàm tổng]
    - Tổng chi phí: 
      $ C(x) = x dot G(x) = 0.001x^2 + 2x + 100 $
    - Tổng thuế:
      $ T(x) = 8x $

    #step[Bước 2: Lập hàm Lợi nhuận $P(x)$]
    $ P(x) &= F(x) - C(x) - T(x) \
           &= (0.001x^3 - 1.999x^2 + 810x + 100) - (0.001x^2 + 2x + 100) - 8x \
           &= 0.001x^3 - 2x^2 + 800x $

    #step[Bước 3: Tối ưu hoá]
    $ P'(x) = 0.003x^2 - 4x + 800 = 0 $
    Giải phương trình:
    $ 3x^2 - 4000x + 800000 = 0 $
    $ Delta = 16000000 - 9600000 = 6400000 => sqrt(Delta) = 2500 $
    $ x_1 = frac(4000 + 2500, 6) approx 1083 quad "(Loại vì " x > 500) $
    $ x_2 = frac(4000 - 2500, 6) = 250 quad "(Nhận)" $

    #step[Bước 4: Kết luận]
    Giá trị $x=250$ là số nguyên nên lợi nhuận cực đại đạt được khi sản xuất đúng 250 sản phẩm.
    #eg-box(title: [Kết luận])[Công ty cần sản xuất *250* sản phẩm.]
  ]
)
]
"""

text = text.replace(
    '#eg-box(title: [Kết luận])[Công ty cần sản xuất *333* hoặc *334* sản phẩm.]\n  ]\n)',
    '#eg-box(title: [Kết luận])[Công ty cần sản xuất *333* hoặc *334* sản phẩm.]\n  ]\n)' + prob1b
)

# Insert Problem 2b
prob2b = r"""

#v(1em)
#note-box(title: "Dành cho học sinh tự luyện")[
#tln(
  id: "DTCP-02b",
  [Một doanh nghiệp sản xuất $x$ sản phẩm ($x in [1, 1000]$). Doanh thu và chi phí tính bằng: $F(x) = -0.001x^3 + 3x^2 + 600x$ và $C(x) = 1.5x^2 + 200x + 500$. Chính sách thuế như sau: 300 sản phẩm đầu tiên được miễn thuế. Từ sản phẩm thứ 301 trở đi, mỗi sản phẩm bị đánh thuế $1200$ (nghìn đồng). Hỏi doanh nghiệp nên sản xuất bao nhiêu sản phẩm để lợi nhuận cực đại?],
  [$300$],
  loigiai: [
    #ppgiai[Lập hàm thuế phân nhánh, sau đó tối ưu.]
    
    #step[Bước 1: Lập hàm thuế đa trị $T(x)$]
    - Nếu $x <= 300$: $T(x) = 0$.
    - Nếu $x > 300$: $T(x) = 1200(x - 300) = 1200x - 360000$.

    #step[Bước 2: Lập hàm Lợi nhuận $P(x)$]
    $ P(x) = cases(
      -0.001x^3 + 1.5x^2 + 400x - 500 & "khi " x <= 300 \,
      -0.001x^3 + 1.5x^2 - 800x + 359500 & "khi " x > 300
    ) $

    #step[Bước 3: Tối ưu trên từng nhánh]
    *Nhánh 1 ($x <= 300$):*
    $ P_1'(x) = -0.003x^2 + 3x + 400 = 0 => x approx 1119 > 300 " (Loại)". $
    Hàm đồng biến trên $[0, 300]$. Cực đại đạt tại $x = 300$.
    $ P_1(300) = 227500 $

    *Nhánh 2 ($x > 300$):*
    $ P_2'(x) = -0.003x^2 + 3x - 800 $
    Ta thấy $P_2'(300) = -0.003(300)^2 + 3(300) - 800 = -170 < 0$.
    Hàm nghịch biến trên $(300, 1000]$.

    #step[Bước 4: So sánh và Kết luận]
    Vì nhánh 1 đồng biến lên đỉnh $x=300$, nhánh 2 nghịch biến đi xuống, nên cực đại toàn cục chính là tại điểm gãy $x = 300$.
    #eg-box(title: [Kết luận])[Nên sản xuất *300* sản phẩm.]
  ]
)
]
"""

text = text.replace(
    '#eg-box(title: [Kết luận])[Nên sản xuất *200* sản phẩm.]\n  ]\n)',
    '#eg-box(title: [Kết luận])[Nên sản xuất *200* sản phẩm.]\n  ]\n)' + prob2b
)

# Insert Problem 3b
prob3b = r"""

#v(1em)
#note-box(title: "Dành cho học sinh tự luyện")[
#tln(
  id: "DTCP-03b",
  [Một công ty luyện kim sản xuất $x$ tấn thép. Tổng doanh thu là $F(x) = -2x^3 + 150x^2 + 2000x$ và tổng chi phí sản xuất là $C(x) = 30x^2 + 800x + 5000$. Thuế bảo vệ môi trường được tính luỹ tiến 3 mức: 
  - 20 tấn đầu: Miễn thuế.
  - Từ trên 20 tấn đến 40 tấn: Thuế $200$ đ/tấn cho phần vượt.
  - Trên 40 tấn: Thuế $900$ đ/tấn cho phần vượt 40 tấn.
  Hỏi sản lượng $x$ tối ưu là bao nhiêu?],
  [$41$],
  loigiai: [
    #ppgiai[Lập $T(x)$ qua 3 mốc: 20 và 40. Xác định cực đại trên từng nhánh.]
    
    #step[Bước 1: Lập hàm thuế $T(x)$]
    - $x <= 20$: $T(x) = 0$.
    - $20 < x <= 40$: $T(x) = 200(x - 20) = 200x - 4000$.
    - $x > 40$: Thuế mốc 2 là $20 times 200 = 4000$. Cộng vượt 40:
      $T(x) = 4000 + 900(x - 40) = 900x - 32000$.

    #step[Bước 2 & 3: Lập hàm $P(x)$ và đạo hàm $P'(x)$]
    $ P(x) = cases(
      -2x^3 + 120x^2 + 1200x - 5000 & (x <= 20) \,
      -2x^3 + 120x^2 + 1000x - 1000 & (20 < x <= 40) \,
      -2x^3 + 120x^2 + 300x + 27000 & (x > 40)
    ) $

    - *Nhánh 1 ($x <= 20$):* $P_1'(x) = -6x^2 + 240x + 1200 > 0$ trên $(0, 20]$.
      $ P(20) = 51000 $
    - *Nhánh 2 ($20 < x <= 40$):* $P_2'(x) = -6x^2 + 240x + 1000 > 0$ trên khoảng này. Đỉnh nhánh 2 tại $x=40$.
      $ P(40) = 103000 $
    - *Nhánh 3 ($x > 40$):* $P_3'(x) = -6x^2 + 240x + 300 = 0 => x approx 41.2$.
      So sánh $x=41$ và $x=42$:
      $ P(41) = 103178, quad P(42) = 103084 $

    #step[Bước 4: Kết luận]
    So sánh 3 đỉnh: $P(20) = 51000$, $P(40) = 103000$, $P(41) = 103178$.
    Đỉnh tại $x=41$ là cao nhất.
    #eg-box(title: [Kết luận])[Sản lượng tối ưu là *41* tấn.]
  ]
)
]
"""

text = text.replace(
    '#eg-box(title: [Kết luận])[Sản lượng tối ưu là *51* tấn.]\n  ]\n)',
    '#eg-box(title: [Kết luận])[Sản lượng tối ưu là *51* tấn.]\n  ]\n)' + prob3b
)

with codecs.open('CD-DoanhThu-ChiPhi-Thue.typ', 'w', encoding='utf-8') as f:
    f.write(text)

print("Done inserting new problems.")
