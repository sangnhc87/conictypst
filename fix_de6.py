import re

path = "typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-6.typ"
with open(path) as f:
    content = f.read()

replacement_tn = r"""#tn([Một doanh nghiệp bán một loại sản phẩm. Biết rằng nếu bán với giá $x$ (nghìn đồng) một sản phẩm thì số lượng sản phẩm bán được trong một tháng là $2000 - 10x$. Chi phí sản xuất mỗi sản phẩm là 50 (nghìn đồng). Để lợi nhuận thu được trong một tháng là lớn nhất, doanh nghiệp nên bán sản phẩm với giá bao nhiêu?],
  (
    [100],
    True([125]),
    [150],
    [175],
  ),
  loigiai: [
    - Số lượng bán: $q(x) = 2000 - 10x$.
    - Lợi nhuận trên mỗi sản phẩm: $x - 50$.
    - Tổng lợi nhuận: $P(x) = (x - 50)(2000 - 10x) = -10x^2 + 2500x - 100000$.
    - $P'(x) = -20x + 2500 = 0 <=> x = 125$.
    - Lập BBT, ta thấy $P(x)$ đạt Max tại $x = 125$.
  ]
)"""

content = re.sub(
    r'#tn\(\[Có ba hộp bí ẩn đựng vàng.*?\)\n\)',
    lambda m: replacement_tn,
    content,
    flags=re.DOTALL
)

replacement_ds = r"""#ds([Một công ty cần xây dựng một đường ống dẫn dầu từ trạm khoan trên biển A đến nhà máy lọc dầu C trên bờ biển. Bờ biển được coi là một đường thẳng. Gọi B là hình chiếu vuông góc của A lên bờ biển. Khoảng cách $AB = 6$ km, $BC = 10$ km. Đường ống được đặt thẳng từ A đến một điểm M trên đoạn BC, rồi từ M dọc theo bờ biển đến C. Biết chi phí đặt ống trên biển là 5 triệu USD/km, và trên bờ là 3 triệu USD/km. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Nếu điểm M trùng với B, tổng chi phí là 60 triệu USD.]),
    True([Chi phí ống dẫn dầu trên biển được tính bằng hàm $C_1(x) = 5\sqrt{36 + x^2}$ triệu USD, với $x = BM$.]),
    True([Để tổng chi phí là nhỏ nhất, khoảng cách $BM$ phải bằng 4,5 km.]),
    [Tổng chi phí nhỏ nhất để xây dựng đường ống là 45 triệu USD.],
  ),
  loigiai: [
    - a) Nếu $M \equiv B => BM=0, MC=10, AM=6$. Chi phí $C = 5 \times 6 + 3 \times 10 = 60$. (Đúng)
    - b) Theo Pytago $AM = \sqrt{AB^2+BM^2} = \sqrt{36+x^2}$, chi phí $C_1(x) = 5\sqrt{36+x^2}$. (Đúng)
    - c) Tổng chi phí $C(x) = 5\sqrt{x^2+36} + 3(10-x)$.
      Đạo hàm $C'(x) = \frac{5x}{\sqrt{x^2+36}} - 3$.
      $C'(x) = 0 \Leftrightarrow 5x = 3\sqrt{x^2+36} \Leftrightarrow 25x^2 = 9(x^2+36) \Leftrightarrow 16x^2 = 324 \Leftrightarrow x^2 = 20.25 \Leftrightarrow x = 4.5$. (Đúng)
    - d) Khi $x = 4.5$, $C(4.5) = 5\sqrt{4.5^2+36} + 3(10-4.5) = 5(7.5) + 3(5.5) = 37.5 + 16.5 = 54$ (triệu USD). Phát biểu cho là 45 nên Sai.
  ]
)"""

content = re.sub(
    r'#ds\(\[Bốn học sinh A, B, C, D tham gia một cuộc đua.*?\]\n\)',
    lambda m: replacement_ds,
    content,
    flags=re.DOTALL
)

with open(path, "w") as f:
    f.write(content)
print(f"Fixed {path}")
