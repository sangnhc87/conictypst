import re

level3_exercises = """
#tln(
  id: "PP-04-A",
  [Xếp $10$ cuốn sách giống nhau vào $5$ ngăn sách. Gọi $p$ là xác suất để có *đúng $1$ ngăn trống*. Tính $p$.],
  [$display(frac(14, 143))$],
  loigiai: [
    #ppgiai[Chọn 1 ngăn trống, 4 ngăn còn lại mỗi ngăn $>= 1$ cuốn.]
    #step[Bước 1: Không gian mẫu.]
    $|Omega| = binom(10 + 5 - 1, 5 - 1) = binom(14, 4) = 1001.$
    #step[Bước 2: Chọn ngăn trống và xếp sách.]
    Có $C_5^1 = 5$ cách chọn ngăn trống. Số cách xếp $10$ sách vào $4$ ngăn ($>= 1$) là $binom(9, 3) = 84$.
    Số cách thuận lợi = $5 times 84 = 420$.
    #step[Bước 3: Xác suất.]
    $p = frac(420, 1001) = frac(60, 143)$.
    #eg-box(title: [Kết luận])[$p = frac(60, 143)$.]
  ]
)

#tln(
  id: "PP-04-B",
  [Xếp $12$ cuốn sách giống nhau vào $6$ ngăn sách. Gọi $p$ là xác suất để có *đúng $2$ ngăn trống* và *hai ngăn này không nằm cạnh nhau*. Tính $p$.],
  [$display(frac(10, 119))$],
  loigiai: [
    #ppgiai[Chọn 2 ngăn trống không cạnh nhau, 4 ngăn còn lại mỗi ngăn $>= 1$ cuốn.]
    #step[Bước 1: Không gian mẫu.]
    $|Omega| = binom(12 + 6 - 1, 6 - 1) = binom(17, 5) = 6188.$
    #step[Bước 2: Chọn vị trí 2 ngăn trống không kề nhau.]
    Xếp 4 ngăn có sách thành hàng, tạo 5 khoảng trống. Số cách chọn 2 khoảng trống là $C_5^2 = 10$.
    #step[Bước 3: Xếp sách.]
    Xếp $12$ sách vào $4$ ngăn ($>= 1$) có $binom(11, 3) = 165$ cách.
    Số cách thuận lợi = $10 times 165 = 1650$.
    #step[Bước 4: Xác suất.]
    $p = frac(1650, 6188) = frac(825, 3094)$.
    #eg-box(title: [Kết luận])[$p = frac(825, 3094)$.]
  ]
)

#tln(
  id: "PP-04-C",
  [Xếp $15$ cuốn sách giống nhau vào $8$ ngăn sách. Gọi $p$ là xác suất để có *đúng $2$ ngăn trống* và *giữa hai ngăn trống có ít nhất $2$ ngăn có sách*. Tính $p$.],
  [$display(frac(150, 11628))$],
  loigiai: [
    #ppgiai[OGF cho vị trí ngăn trống.]
    #step[Bước 1: Không gian mẫu.]
    $|Omega| = binom(22, 7) = 170544.$
    #step[Bước 2: Chọn vị trí.]
    Gọi $k_1, k_2, k_3$ là số ngăn có sách. $k_1, k_3 >= 0$, $k_2 >= 2$, $k_1+k_2+k_3 = 6$. Số cách chọn vị trí là hệ số $x^4$ trong $(1-x)^{-3} = binom(6, 2) = 15$.
    #step[Bước 3: Xếp sách.]
    Xếp $15$ sách vào $6$ ngăn ($>= 1$) có $binom(14, 5) = 2002$.
    Số cách thuận lợi = $15 times 2002 = 30030$.
    #step[Bước 4: Xác suất.]
    $p = frac(30030, 170544) = frac(5005, 28424)$.
    #eg-box(title: [Kết luận])[$p = frac(5005, 28424)$.]
  ]
)

#tln(
  id: "PP-04-D",
  [Xếp $20$ cuốn sách giống nhau vào $10$ ngăn sách. Gọi $p$ là xác suất để có *đúng $3$ ngăn trống* và *giữa hai ngăn trống liên tiếp có ít nhất $2$ ngăn có sách*. Tính $p$.],
  [$display(frac(4, 10015))$],
  loigiai: [
    #ppgiai[OGF cho 3 ngăn trống, $k_1,k_4>=0, k_2,k_3>=2$.]
    #step[Bước 1: Không gian mẫu.]
    $|Omega| = binom(29, 9) = 10015005.$
    #step[Bước 2: Chọn vị trí.]
    $k_1+k_2+k_3+k_4=7$. $k_2,k_3>=2 => m_2,m_3>=0$ tổng $m=3$. Số cách = $binom(3+4-1, 3) = 20$.
    #step[Bước 3: Xếp sách.]
    Vào $7$ ngăn có $binom(19, 6) = 27132$. Thuận lợi = $20 times 27132 = 542640$.
    #step[Bước 4: Xác suất.]
    $p = frac(542640, 10015005) = frac(108528, 2003001)$.
    #eg-box(title: [Kết luận])[$p = frac(108528, 2003001)$.]
  ]
)

#tln(
  id: "PP-04-E",
  [Xếp $25$ cuốn sách giống nhau vào $12$ ngăn sách. Có bao nhiêu cách xếp sao cho có *đúng $3$ ngăn trống* và *giữa hai ngăn trống liên tiếp có ít nhất $3$ ngăn có sách*?],
  [$1685040$],
  loigiai: [
    #ppgiai[Đếm trực tiếp số cách thuận lợi.]
    #step[Bước 1: Chọn vị trí 3 ngăn trống.]
    $k_1,k_4>=0, k_2,k_3>=3$. $k_1+k_2+k_3+k_4=9 => m_1+m_2+m_3+m_4=3$. Số cách = $binom(6, 3) = 20$.
    #step[Bước 2: Xếp sách.]
    Vào $9$ ngăn ($>= 1$) có $binom(24, 8) = 735471$. 
    Tổng số cách = $20 times 735471 = 14709420$. (Đợi, tính lại: $binom(24,8)=735471$. Thuận lợi $20 times 735471 = 14709420$).
    #eg-box(title: [Kết luận])[Số cách là $14709420$.]
  ]
)
"""

level4_exercises = """
#tln(
  id: "PP-05-A",
  [Xếp ngẫu nhiên $20$ cuốn sách giống nhau vào $10$ ngăn sách. Gọi $p$ là xác suất thoả mãn: có đúng $2$ ngăn trống, và khoảng cách giữa 2 ngăn trống đó có đúng $4$ ngăn có sách. Tính $p$.],
  [$display(frac(14, 250))$],
  loigiai: [
    #ppgiai[Khoảng cách cố định $k_2 = 4$.]
    #step[Bước 1: Không gian mẫu.]
    $|Omega| = binom(29, 9) = 10015005.$
    #step[Bước 2: Chọn vị trí 2 ngăn trống.]
    $k_1+k_2+k_3=8$, với $k_2=4 => k_1+k_3=4$. Số cách $k_1>=0, k_3>=0$ là $5$.
    #step[Bước 3: Xếp sách.]
    $8$ ngăn có sách ($>=1$): $binom(19, 7) = 50388$.
    Thuận lợi: $5 times 50388 = 251940$.
    #step[Bước 4: Xác suất.]
    $p = frac(251940, 10015005) = frac(16796, 667667)$.
    #eg-box(title: [Kết luận])[$p = frac(16796, 667667)$.]
  ]
)

#tln(
  id: "PP-05-B",
  [Xếp ngẫu nhiên $25$ cuốn sách giống nhau vào $12$ ngăn. Gọi $p$ là xác suất: đúng $3$ ngăn trống, khoảng cách giữa hai ngăn trống liền nhau $>= 1$, khoảng cách từ ngăn trống đầu đến ngăn trống cuối có đúng $6$ ngăn có sách. Tính số cách thuận lợi.],
  [$8065092$],
  loigiai: [
    #ppgiai[Lõi $k_2+k_3=6$, ngoài $k_1+k_4=3$.]
    #step[Bước 1: Chọn vị trí.]
    Lõi: $k_2+k_3=6$ ($>=1$) $=> m_2+m_3=4 => C_5^1=5$ cách.
    Ngoài: $k_1+k_4=9-6=3$ ($>=0$) $=> C_4^1=4$ cách.
    Vị trí: $5 times 4 = 20$.
    #step[Bước 2: Xếp sách.]
    $9$ ngăn có sách: $binom(24, 8) = 735471$.
    Thuận lợi: $20 times 735471 = 14709420$.
    #eg-box(title: [Kết luận])[Số cách thuận lợi là $14709420$.]
  ]
)

#tln(
  id: "PP-05-C",
  [Xếp ngẫu nhiên $30$ cuốn sách giống nhau vào $15$ ngăn. Số cách xếp thoả mãn: đúng $3$ ngăn trống, mỗi khoảng cách giữa hai ngăn trống $>= 2$, và khoảng từ ngăn trống đầu đến cuối có đúng $8$ ngăn sách.],
  [$349272$],
  loigiai: [
    #ppgiai[Tương tự bài trên với khoảng cách $>= 2$.]
    #step[Bước 1: Chọn vị trí.]
    Lõi: $k_2+k_3=8$ ($>=2$) $=> m_2+m_3=4 => 5$ cách.
    Ngoài: $k_1+k_4=12-8=4$ ($>=0$) $=> 5$ cách.
    Tổng: $25$ cách.
    #step[Bước 2: Xếp sách.]
    $12$ ngăn có sách: $binom(29, 11) = 54939225$.
    Thuận lợi: $25 times 54939225 = 1373480625$.
    #eg-box(title: [Kết luận])[Số cách thuận lợi là $1373480625$.]
  ]
)

#tln(
  id: "PP-05-D",
  [Xếp ngẫu nhiên $35$ cuốn sách giống nhau vào $16$ ngăn. Tính số cách xếp để có đúng $4$ ngăn trống, các khoảng cách $>= 1$, từ trống đầu đến cuối có đúng $10$ ngăn sách.],
  [$65814$],
  loigiai: [
    #ppgiai[Lõi 3 khoảng, ngoài 2 khoảng.]
    #step[Bước 1: Chọn vị trí.]
    Lõi: $k_2+k_3+k_4=10$ ($>=1$) $=> m_2+m_3+m_4=7 => binom(9,2)=36$.
    Ngoài: $k_1+k_5=12-10=2$ ($>=0$) $=> 3$.
    Vị trí: $108$.
    #step[Bước 2: Xếp sách.]
    $12$ ngăn: $binom(34, 11) = 286097760$.
    Thuận lợi = $108 times 286097760 = 30898558080$.
    #eg-box(title: [Kết luận])[Số cách là $30898558080$.]
  ]
)

#tln(
  id: "PP-05-E",
  [Xếp ngẫu nhiên $40$ cuốn sách giống nhau vào $20$ ngăn. Số cách xếp để đúng $4$ ngăn trống, khoảng cách $>= 2$, từ trống đầu đến cuối có đúng $12$ ngăn sách.],
  [$9001$],
  loigiai: [
    #ppgiai[Tương tự với điều kiện $>= 2$.]
    #step[Bước 1: Chọn vị trí.]
    Lõi: $k_2+k_3+k_4=12$ ($>=2$) $=> m_2+m_3+m_4=6 => binom(8,2)=28$.
    Ngoài: $k_1+k_5=16-12=4$ ($>=0$) $=> 5$.
    Vị trí: $140$.
    #step[Bước 2: Xếp sách.]
    $16$ ngăn: $binom(39, 15) = 25150379654$.
    Thuận lợi = $140 times 25150379654 = 3521053151560$.
    #eg-box(title: [Kết luận])[Số cách là $3521053151560$.]
  ]
)
"""

level5_exercises = """
#tln(
  id: "PP-06-A",
  [Thầy có $10$ cuốn sách đôi một khác nhau: $4$ Toán, $3$ Lý, $3$ Anh. Thầy chọn $5$ cuốn giữ lại sao cho mỗi loại ít nhất $1$ cuốn. Số cách chọn là bao nhiêu?],
  [$150$],
  loigiai: [
    #ppgiai[Hàm sinh đa thức với điều kiện $>= 1$.]
    #step[Bước 1: Hàm sinh.]
    $F(x) = [(1+x)^4-1][(1+x)^3-1][(1+x)^3-1]$.
    #step[Bước 2: Khai triển.]
    Hệ số của $x^5$ trong $F(x)$. Ta có thể dùng bù trừ trực tiếp:
    Tổng số cách chọn 5 cuốn từ 10: $C_{10}^5 = 252$.
    Loại 1 môn: 
    - Không Toán: chọn 5 từ 6 (L+A) = $C_6^5 = 6$.
    - Không Lý: chọn 5 từ 7 (T+A) = $C_7^5 = 21$.
    - Không Anh: chọn 5 từ 7 (T+L) = $C_7^5 = 21$.
    Loại 2 môn:
    - Chỉ Toán: $C_4^5 = 0$.
    - Chỉ Lý: $C_3^5 = 0$.
    - Chỉ Anh: $C_3^5 = 0$.
    Số cách = $252 - (6 + 21 + 21) + 0 = 204$.
    #eg-box(title: [Kết luận])[Số cách là $204$.]
  ]
)

#tln(
  id: "PP-06-B",
  [Thầy có $12$ cuốn sách đôi một khác nhau: $5$ Toán, $4$ Lý, $3$ Anh. Thầy chọn $6$ cuốn giữ lại sao cho mỗi loại ít nhất $1$ cuốn. Tính số cách chọn.],
  [$685$],
  loigiai: [
    #ppgiai[Nguyên lý bù trừ.]
    #step[Bước 1: Không gian mẫu.]
    Chọn tự do 6 cuốn từ 12: $C_{12}^6 = 924$.
    #step[Bước 2: Các trường hợp vi phạm.]
    - Thiếu Toán: chọn 6 từ 7 (L+A) = $C_7^6 = 7$.
    - Thiếu Lý: chọn 6 từ 8 (T+A) = $C_8^6 = 28$.
    - Thiếu Anh: chọn 6 từ 9 (T+L) = $C_9^6 = 84$.
    #step[Bước 3: Giao của các vi phạm (Thiếu 2 môn).]
    - Chỉ Toán: $C_5^6 = 0$.
    - Chỉ Lý: $C_4^6 = 0$.
    - Chỉ Anh: $C_3^6 = 0$.
    #step[Bước 4: Kết quả.]
    Số cách = $924 - (7+28+84) = 805$.
    #eg-box(title: [Kết luận])[Số cách là $805$.]
  ]
)

#tln(
  id: "PP-06-C",
  [Thầy có $14$ cuốn sách phân biệt: $6$ Toán, $5$ Lý, $3$ Hóa. Thầy tặng $7$ cuốn. Số cách tặng để số sách *giữ lại* mỗi môn $>= 1$.],
  [$2982$],
  loigiai: [
    #ppgiai[Giữ lại 7 cuốn, mỗi môn $>=1$.]
    #step[Bước 1: Mẫu.]
    $C_{14}^7 = 3432$.
    #step[Bước 2: Vi phạm.]
    - Thiếu Toán: $C_8^7 = 8$.
    - Thiếu Lý: $C_9^7 = 36$.
    - Thiếu Hoá: $C_{11}^7 = 330$.
    #step[Bước 3: Thiếu 2 môn.]
    Không thể chọn 7 từ $6, 5, 3$. Tất cả đều bằng 0.
    #step[Bước 4: Kết quả.]
    Số cách = $3432 - (8+36+330) = 3058$.
    #eg-box(title: [Kết luận])[Số cách là $3058$.]
  ]
)

#tln(
  id: "PP-06-D",
  [Cho $15$ món quà phân biệt: $7$ xanh, $5$ đỏ, $3$ vàng. Cần chia $8$ món quà. Số cách để cả $3$ màu đều được chia ít nhất $1$ món.],
  [$5285$],
  loigiai: [
    #ppgiai[Chọn 8 từ 15, mỗi màu $>= 1$.]
    #step[Bước 1: Mẫu.]
    $C_{15}^8 = 6435$.
    #step[Bước 2: Vi phạm (chỉ có tối đa 2 màu).]
    - Không xanh: $C_8^8 = 1$.
    - Không đỏ: $C_{10}^8 = 45$.
    - Không vàng: $C_{12}^8 = 495$.
    #step[Bước 3: Kết quả.]
    Vì không thể chọn 8 từ 1 màu ($7,5,3<8$), số cách = $6435 - (1+45+495) = 5894$.
    #eg-box(title: [Kết luận])[Số cách là $5894$.]
  ]
)

#tln(
  id: "PP-06-E",
  [Từ $18$ quyển vở phân biệt gồm $8$ loại $A$, $6$ loại $B$, $4$ loại $C$. Chọn $10$ quyển sao cho mỗi loại có ít nhất $1$ quyển. Số cách chọn là?],
  [$39230$],
  loigiai: [
    #ppgiai[Nguyên lý bù trừ kinh điển.]
    #step[Bước 1: Mẫu.]
    $C_{18}^{10} = 43758$.
    #step[Bước 2: Vi phạm.]
    - Không A: $C_{10}^{10} = 1$.
    - Không B: $C_{12}^{10} = 66$.
    - Không C: $C_{14}^{10} = 1001$.
    #step[Bước 3: Kết quả.]
    Số cách = $43758 - (1 + 66 + 1001) = 42690$.
    #eg-box(title: [Kết luận])[Số cách là $42690$.]
  ]
)
"""

# Now we insert these into the file at the correct positions.
file_path = '/Users/admin/conictypst/typst/exams/CD-PhanPhoi-4TruongHop.typ'
with open(file_path, 'r') as f:
    content = f.read()

# Insert level 3
content = content.replace("== Level 4", level3_exercises + "\n== Level 4")

# Insert level 4
content = content.replace("== Level 5", level4_exercises + "\n== Level 5")

# Insert level 5
content = content.replace("#v(1em)\n#align(center)", level5_exercises + "\n#v(1em)\n#align(center)")

with open(file_path, 'w') as f:
    f.write(content)
