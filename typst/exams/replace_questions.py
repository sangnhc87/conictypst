import re

with open('CD-DaySo-ChuyenSau.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# Replace CÂU 54
q54_pattern = r'// CÂU 54\n#tn\(.*?\n\)\n'
q54_replacement = r"""// CÂU 54
#tn(
  [Một loại vi khuẩn được nuôi cấy trong phòng thí nghiệm. Ban đầu có 1000 vi khuẩn. Sau mỗi giờ, số lượng vi khuẩn tăng gấp đôi, nhưng đồng thời có 200 vi khuẩn bị chết đi. Ký hiệu $u_n$ là số lượng vi khuẩn sau $n$ giờ. Tính số lượng vi khuẩn sau 3 giờ.],
  (
    [$3400$.],
    [$7200$.],
    True([$6600$.]),
    [$6800$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Ta có $u_0 = 1000$.
    - Phương trình truy hồi số vi khuẩn sau $n$ giờ là: $u_n = 2u_(n-1) - 200$.
    - Giờ thứ 1: $u_1 = 2(1000) - 200 = 1800$.
    - Giờ thứ 2: $u_2 = 2(1800) - 200 = 3400$.
    - Giờ thứ 3: $u_3 = 2(3400) - 200 = 6600$.
    - Vậy sau 3 giờ có 6600 vi khuẩn. Câu hỏi mang tính ứng dụng thực tế rất phù hợp cho ĐGNL.
  ]
)
"""
text = re.sub(q54_pattern, q54_replacement, text, flags=re.DOTALL)


# Replace CÂU 55
q55_pattern = r'// CÂU 55\n#tn\(.*?\n\)\n'
q55_replacement = r"""// CÂU 55
#tn(
  [Một người thợ xếp các khối gỗ thành một hình tháp. Tầng trên cùng có 1 khối, tầng thứ hai có 3 khối, tầng thứ ba có 6 khối, tầng thứ tư có 10 khối... Hỏi tầng thứ 10 có bao nhiêu khối gỗ?],
  (
    [$45$.],
    True([$55$.]),
    [$66$.],
    [$50$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Quan sát số lượng khối gỗ ở các tầng:
      Tầng 1: $1$
      Tầng 2: $3 = 1 + 2$
      Tầng 3: $6 = 1 + 2 + 3$
      Tầng 4: $10 = 1 + 2 + 3 + 4$
    - Quy luật: Tầng thứ $n$ có số khối gỗ là tổng của $n$ số nguyên dương đầu tiên: $u_n = ( n(n+1) )/( 2 )$.
    - Tầng thứ 10 có số khối gỗ là: $u_(10) = ( 10(11) )/( 2 ) = 55$.
    - Dạng bài tìm quy luật (Pattern Recognition) này cực kỳ phổ biến trong đề thi ĐGNL.
  ]
)
"""
text = re.sub(q55_pattern, q55_replacement, text, flags=re.DOTALL)


# Replace CÂU 80
q80_pattern = r'// CÂU 80\n#tn\(.*?\n\)\n'
q80_replacement = r"""// CÂU 80
#tn(
  [Đóng lại chuyên đề: Một quả bóng cao su được thả rơi từ độ cao 10m. Mỗi lần chạm đất, quả bóng nảy lên độ cao bằng $3/4$ độ cao trước đó. Hỏi tổng quãng đường quả bóng di chuyển (kể từ lúc thả cho đến khi dừng hẳn) gần nhất với giá trị nào sau đây?],
  (
    [$40 "m"$.],
    [$80 "m"$.],
    True([$70 "m"$.]),
    [$60 "m"$.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Quãng đường rơi lần đầu: $S_0 = 10$.
    - Lần chạm đất thứ 1, bóng nảy lên độ cao $10 dot ( 3 )/( 4 )$ và rơi xuống $10 dot ( 3 )/( 4 )$. Quãng đường di chuyển là $2 dot 10 dot ( 3 )/( 4 )$.
    - Tương tự, lần thứ 2: $2 dot 10 dot ( ( 3 )/( 4 ) )^2$.
    - Tổng quãng đường di chuyển: 
      $S = 10 + 20 (3/4) + 20 (3/4)^2 + 20 (3/4)^3 + ...$
    - Đây là tổng của một Cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 20(3/4) = 15$ và công bội $q = 3/4$.
    - Tổng $S = 10 + ( 15 )/( 1 - 3/4 ) = 10 + ( 15 )/( 1/4 ) = 10 + 60 = 70$.
    - Vậy tổng quãng đường quả bóng di chuyển là 70 mét. Một bài toán tuyệt vời để luyện thi ĐGNL.
  ]
)
"""
text = re.sub(q80_pattern, q80_replacement, text, flags=re.DOTALL)


with open('CD-DaySo-ChuyenSau.typ', 'w', encoding='utf-8') as f:
    f.write(text)

