import os

with open('gen_gioihan_p3.py', 'r') as f:
    content = f.read()

new_questions = r"""
#ds(
  id: "D3",
  [Trong động lực học, vận tốc $v(t)$ (đơn vị: m/s) của một vật thể rơi tự do có tính đến lực cản của không khí được cho bởi phương trình $v(t) = 50(1 - e^(-0.2 t))$, với $t >= 0$ là thời gian rơi tính bằng giây. Dựa vào mô hình toán học này, xét tính đúng sai của các nhận định sau:],
  (
    [a) Vận tốc ban đầu của vật thể tại thời điểm thả ($t = 0$) là $50$ m/s.],
    [b) Gia tốc rơi của vật thể (sự thay đổi vận tốc) ngày càng tăng khi thời gian trôi qua.],
    [c) Vận tốc tới hạn (vận tốc lớn nhất mà vật có thể đạt được khi rơi rất lâu) là $50$ m/s.],
    [d) Phải mất một khoảng thời gian vô hạn để vật thể đạt được chính xác vận tốc $50$ m/s.]
  ),
  (False, False, True, True),
  loigiai: [
    *Phân tích vật lý và toán học:* 
    
    - *a)* Tại $t=0$, $v(0) = 50(1 - e^0) = 50(1 - 1) = 0$ m/s. Vật bắt đầu rơi từ trạng thái nghỉ. (SAI).
    - *b)* Gia tốc $a(t) = v'(t) = 50 times 0.2 e^(-0.2 t) = 10 e^(-0.2 t)$. Khi $t$ tăng, $e^(-0.2 t)$ giảm, nên gia tốc *giảm dần* về 0 (lực cản dần cân bằng với trọng lực). (SAI).
    - *c)* Vận tốc tới hạn $lim_{t -> +oo} v(t) = 50(1 - 0) = 50$ m/s. (ĐÚNG).
    - *d)* Phương trình $50(1 - e^(-0.2 t)) = 50 => e^(-0.2 t) = 0$. Phương trình này vô nghiệm với mọi $t$ hữu hạn. Chỉ khi $t -> +oo$ thì giới hạn mới bằng 50. (ĐÚNG).
    
    #ans-box[a. Sai, b. Sai, c. Đúng, d. Đúng.]
  ]
)

#ds(
  id: "D4",
  [Một công ty sản xuất bao bì áp dụng chính sách chiết khấu lũy thoái cho khách hàng mua sỉ. Gọi $x$ là số lượng sản phẩm (nghìn cái) và $C(x)$ là tổng số tiền khách hàng phải trả (triệu đồng).
$ C(x) = cases(
  10 x &"khi" 0 < x <= 100,
  9 x &"khi" x > 100
) $
Do bộ phận kinh doanh thiết lập hàm giá không tinh tế, hệ thống giá này bị đứt đoạn. Xét tính đúng sai của các phát biểu:],
  (
    [a) Khách hàng mua $100$ nghìn sản phẩm phải trả số tiền là $1000$ triệu đồng (1 tỷ).],
    [b) Khách hàng mua $101$ nghìn sản phẩm chỉ phải trả $909$ triệu đồng.],
    [c) Hàm số $C(x)$ liên tục tại $x = 100$.],
    [d) Để hàm số liên tục và hợp lý hơn, công ty nên đổi chính sách thành: 100 nghìn sản phẩm đầu tính giá 10, từ sản phẩm thứ 100.001 trở đi tính giá 9.]
  ),
  (True, True, False, True),
  loigiai: [
    *Phân tích hàm chi phí:* 
    
    - *a)* Tại $x = 100$, áp dụng công thức trên: $C(100) = 10 times 100 = 1000$ triệu đồng. (ĐÚNG).
    - *b)* Tại $x = 101$, áp dụng công thức dưới: $C(101) = 9 times 101 = 909$ triệu đồng. (ĐÚNG).
    *(Đây là một lỗ hổng trong định giá: mua nhiều hơn lại phải trả ít tiền hơn một cách vô lý).*
    - *c)* Giới hạn trái: $lim_{x -> 100^-} C(x) = 1000$. Giới hạn phải: $lim_{x -> 100^+} C(x) = 900$. Giới hạn trái $!= $ giới hạn phải nên hàm số gián đoạn tại $x=100$. (SAI).
    - *d)* Nếu tính theo lũy tiến từng phần: $C_"new"(x) = 10 times 100 + 9(x - 100) = 1000 + 9(x - 100)$ khi $x > 100$. Khi đó $lim_{x -> 100^+} C_"new"(x) = 1000$, hàm số sẽ liên tục và triệt tiêu lỗ hổng định giá. (ĐÚNG).
    
    #ans-box[a. Đúng, b. Đúng, c. Sai, d. Đúng.]
  ]
)

#ds(
  id: "D5",
  [Trong y khoa, khi một bệnh nhân được tiêm một liều thuốc $D$ miligam, nồng độ thuốc trong máu sẽ giảm dần theo thời gian. Giả sử cứ sau mỗi khoảng thời gian $T$, lượng thuốc trong máu giảm chỉ còn một phần tư ($1/4$). Bệnh nhân được tiêm lặp lại liều $D$ cứ sau mỗi chu kỳ $T$. Gọi $A_n$ là lượng thuốc ngay sau lần tiêm thứ $n$. Xét các mệnh đề sau:],
  (
    [a) Lượng thuốc ngay sau lần tiêm thứ 2 là $A_2 = D + 0.25 D$.],
    [b) Lượng thuốc $A_n$ tạo thành một cấp số nhân có công bội $q = 0.25$.],
    [c) Khi điều trị kéo dài ($n -> +oo$), lượng thuốc tối đa trong máu ngay sau khi tiêm sẽ tiệm cận mức $4/3 D$.],
    [d) Giới hạn của lượng thuốc tối thiểu trong máu (ngay trước khi tiêm liều tiếp theo) tiến về $0$ khi $n -> +oo$.]
  ),
  (True, False, True, False),
  loigiai: [
    *Phân tích quá trình tiêm thuốc:* 
    
    - Lần 1: $A_1 = D$.
    - Lần 2: Lượng cũ còn $D/4$, tiêm thêm $D$ $=> A_2 = D + D/4 = 1.25 D$. (Mệnh đề a ĐÚNG).
    - Lần 3: $A_3 = D + A_2/4 = D + D/4 + D/16$.
    - Lần $n$: $A_n = D (1 + 1/4 + (1/4)^2 + ... + (1/4)^(n-1))$.
    
    *Xét các mệnh đề:* 
    - *b)* Dãy $A_n$ là tổng của một cấp số nhân (chuỗi hình học), bản thân $A_n$ KHÔNG phải là một cấp số nhân. (SAI).
    - *c)* Khi $n -> +oo$, $A_n$ tiến tới tổng của CSN lùi vô hạn với $u_1 = D, q = 1/4$:
      $ lim_{n -> +oo} A_n = D / (1 - 1/4) = D / (3/4) = 4/3 D $. (ĐÚNG).
    - *d)* Lượng thuốc tối thiểu ngay *trước* liều thứ $n+1$ bằng $1/4$ lượng thuốc tối đa ngay *sau* liều thứ $n$.
      $ lim_{n -> +oo} A_min = 1/4 times (4/3 D) = 1/3 D $. Không tiến về 0. (SAI).
    
    #ans-box[a. Đúng, b. Sai, c. Đúng, d. Sai.]
  ]
)

#ds(
  id: "D6",
  [Một kiến trúc sư thiết kế vòm của một đường hầm. Mặt cắt của vòm được ghép từ 3 đoạn cong khác nhau để tạo hiệu ứng thẩm mỹ. Phương trình cao độ của vòm (đơn vị: mét) là:
$ y = f(x) = cases(
  -x^2 + 4 &"khi" -2 <= x < 0,
  a x + b &"khi" 0 <= x <= 2,
  - (x - 4)^2 + 4 &"khi" 2 < x <= 4
) $
Yêu cầu bắt buộc là đường vòm phải liên tục và không bị "gãy khúc" (đạo hàm liên tục) tại $x = 0$ và $x = 2$.],
  (
    [a) Giới hạn bên trái của chiều cao vòm tại $x = 0$ là $4$ mét.],
    [b) Để vòm liên tục tại $x = 0$, hằng số $b$ bắt buộc phải bằng $4$.],
    [c) Để vòm không bị "gãy khúc" tại $x = 0$, hằng số $a$ phải bằng $0$.],
    [d) Có thể tìm được cặp tham số $(a, b)$ để toàn bộ vòm liên tục trên $[-2, 4]$.]
  ),
  (True, True, True, False),
  loigiai: [
    *Phân tích tại điểm nối $x = 0$:* 
    - Giới hạn trái: $lim_{x -> 0^-} (-x^2 + 4) = 4$. (Mệnh đề a ĐÚNG).
    - Giới hạn phải: $lim_{x -> 0^+} (a x + b) = b$.
    - Để hàm số liên tục tại $x = 0 => b = 4$. (Mệnh đề b ĐÚNG).
    - Đạo hàm bên trái tại $0$: $y' = -2x => y'(0) = 0$.
    - Đạo hàm bên phải tại $0$: $y' = a$.
    - Để không gãy khúc (đạo hàm liên tục), $a = 0$. (Mệnh đề c ĐÚNG).
    
    *Phân tích tại điểm nối $x = 2$:* 
    - Với $a=0, b=4$, đoạn giữa là hàm hằng $y = 4$.
    - Tại $x = 2$:
      + Giới hạn trái: $lim_{x -> 2^-} 4 = 4$.
      + Giới hạn phải: $lim_{x -> 2^+} (-(x-4)^2 + 4) = -(2-4)^2 + 4 = -4 + 4 = 0$.
    - Vì giới hạn trái $!= $ giới hạn phải ($4 != 0$), vòm bị nứt gãy (không liên tục) tại $x = 2$. Do ta đã cố định $(a, b) = (0, 4)$ từ điều kiện tại $x=0$, nên không tồn tại cặp $(a, b)$ nào thỏa mãn liên tục ở *cả 2 điểm* cùng lúc. (Mệnh đề d SAI).
    
    #ans-box[a. Đúng, b. Đúng, c. Đúng, d. Sai.]
  ]
)
"""

idx = content.rfind('"""')
content = content[:idx] + new_questions + content[idx:]

with open('gen_gioihan_p3.py', 'w') as f:
    f.write(content)
print("Updated gen_gioihan_p3.py")
