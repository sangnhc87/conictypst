import os

with open('gen_gioihan_p2.py', 'r') as f:
    content = f.read()

# Replace the closing """ with the new questions and then """
new_questions = r"""
#tn(
  id: "M9",
  [Một vận động viên nhảy dù nhảy khỏi máy bay. Do lực cản của không khí, vận tốc rơi của người đó (tính bằng m/s) được mô hình hóa bởi hàm số $v(t) = 55(1 - e^(-0.2 t))$, trong đó $t$ là thời gian tính bằng giây kể từ lúc bắt đầu rơi. Tính vận tốc rơi tối đa (vận tốc tới hạn) mà người đó có thể đạt được khi rơi trong một thời gian rất dài.],
  ([$0$ m/s], [$22$ m/s], True([$55$ m/s]), [$+oo$ m/s]),
  loigiai: [
    *Bước 1: Hiểu ý nghĩa vật lý* 
    
    Khi thời gian rơi rất dài ($t -> +oo$), lực cản không khí sẽ cân bằng với trọng lực, làm cho vận tốc không tăng thêm nữa mà đạt một "vận tốc tới hạn" (terminal velocity).
    
    *Bước 2: Tính giới hạn toán học* 
    
    Vận tốc tới hạn chính là giới hạn:
    $ lim_{t -> +oo} v(t) = lim_{t -> +oo} 55(1 - e^(-0.2 t)) $
    
    Khi $t -> +oo$, số mũ $-0.2 t -> -oo$. Do đó $e^(-0.2 t) -> 0$.
    
    *Bước 3: Tính toán kết quả* 
    
    $ lim_{t -> +oo} v(t) = 55(1 - 0) = 55 $ (m/s).
    
    #ans-box[Vận tốc rơi tối đa đạt được là *$55$ m/s*.]
  ]
)

#tn(
  id: "M10",
  [Một khoản tiền gửi ngân hàng $P$ được tính lãi kép liên tục với lãi suất danh nghĩa $r$ mỗi năm. Hàm số mô tả số dư trong tài khoản sau $t$ năm là $A(n) = P(1 + r/n)^(n t)$, với $n$ là số lần ghép lãi trong một năm. Khi ngân hàng ghép lãi liên tục (tức là $n -> +oo$), số dư tài khoản sẽ tiệm cận công thức nào sau đây?],
  ([$A = P(1 + r)^t$], [$A = P(1 + r t)$], True([$A = P e^(r t)$]), [$A = P e^(r/t)$]),
  loigiai: [
    *Bước 1: Nhắc lại giới hạn cơ bản* 
    
    Trong giải tích, giới hạn cơ bản liên quan đến số $e$ là:
    $ lim_{x -> +oo} (1 + 1/x)^x = e $
    Hoặc tổng quát hơn: $lim_{n -> +oo} (1 + k/n)^n = e^k$.
    
    *Bước 2: Biến đổi hàm số $A(n)$* 
    
    Ta cần tính giới hạn:
    $ lim_{n -> +oo} P(1 + r/n)^(n t) = P ( lim_{n -> +oo} (1 + r/n)^n )^t $
    
    *Bước 3: Áp dụng giới hạn cơ bản* 
    
    $ lim_{n -> +oo} (1 + r/n)^n = e^r $.
    Do đó, $A = P (e^r)^t = P e^(r t)$.
    Đây chính là công thức lãi kép liên tục nổi tiếng trong tài chính.
    
    #ans-box[Số dư tiệm cận công thức *$A = P e^(r t)$*.]
  ]
)

#tn(
  id: "M11",
  [Trong một mạch điện RC, điện áp trên tụ điện khi đang sạc được cho bởi $V(t) = 12(1 - e^(-t/5))$, trong đó $t$ tính bằng giây và $V$ tính bằng vôn (V). Nếu để mạch sạc trong một thời gian vô hạn, điện áp trên tụ điện sẽ tiến gần đến giới hạn nào?],
  ([$5$ V], True([$12$ V]), [$0$ V], [$2.4$ V]),
  loigiai: [
    *Bước 1: Tính giới hạn điện áp* 
    
    Ta tính $lim_{t -> +oo} V(t)$.
    $ lim_{t -> +oo} 12(1 - e^(-t/5)) $
    
    *Bước 2: Đánh giá thành phần mũ* 
    
    Khi $t -> +oo$, biểu thức $-t/5 -> -oo$.
    Hàm số mũ $e^(-t/5)$ sẽ tiến về $0$.
    
    *Bước 3: Kết luận* 
    
    Thay giá trị giới hạn vào hàm:
    $ V_max = 12(1 - 0) = 12 \ (V) $.
    Đây chính là điện áp của nguồn (bão hòa tụ).
    
    #ans-box[Điện áp trên tụ sẽ tiến tới *$12$ V*.]
  ]
)

#tn(
  id: "M12",
  [Theo "đường cong kinh nghiệm" (Learning Curve) trong quản trị sản xuất, chi phí trung bình để sản xuất một đơn vị sản phẩm sẽ giảm dần khi công nhân làm quen với công việc. Giả sử chi phí trung bình $C(x)$ (đơn vị: nghìn đồng) để sản xuất chiếc áo thứ $x$ được mô hình hóa bởi $C(x) = 150 + 400/x$. Giới hạn của chi phí trung bình này khi $x -> +oo$ có ý nghĩa thực tế là gì?],
  ([Chi phí sẽ giảm về 0 nếu sản xuất vô hạn.], [Chi phí trung bình thấp nhất có thể đạt được là 550 nghìn đồng.], [Chi phí nguyên vật liệu bị triệt tiêu theo thời gian.], True([Dù công nhân có thành thạo đến đâu, chi phí sản xuất mỗi chiếc áo không thể giảm xuống dưới 150 nghìn đồng.])),
  loigiai: [
    *Bước 1: Tính toán giới hạn* 
    
    Tính $lim_{x -> +oo} C(x)$:
    $ lim_{x -> +oo} (150 + 400/x) = 150 + 0 = 150 $ (nghìn đồng).
    
    *Bước 2: Phân tích ý nghĩa thực tế* 
    
    Thành phần $400/x$ đại diện cho chi phí "học việc", rèn luyện kỹ năng, hao phí ban đầu. Nó giảm dần về 0 khi công nhân làm đủ nhiều.
    Thành phần hằng số $150$ đại diện cho chi phí cứng không thể tối ưu thêm (tiền vải, chỉ, khấu hao máy móc tối thiểu).
    
    *Bước 3: Kết luận* 
    
    Giới hạn này chứng tỏ chi phí luôn bị chặn dưới bởi 150 nghìn đồng, không thể tối ưu hóa thấp hơn mức này chỉ bằng cách tăng số lượng.
    
    #ans-box[Chi phí không thể giảm xuống dưới mức sàn là *$150$ nghìn đồng*.]
  ]
)

#tn(
  id: "M13",
  [Một lượng chất thải hữu cơ được xả vào hồ. Mức độ ô nhiễm (tính bằng miligam/lít) sau $t$ ngày được ước tính bởi hàm số $C(t) = 5 + 45 e^(-0.15 t)$. Hỏi sau một thời gian rất dài ($t -> +oo$), mức độ ô nhiễm trong hồ sẽ là bao nhiêu?],
  ([$0$ mg/l], True([$5$ mg/l]), [$45$ mg/l], [$50$ mg/l]),
  loigiai: [
    *Bước 1: Đánh giá hàm số theo thời gian* 
    
    Mức độ ô nhiễm gồm một phần phân hủy theo hàm mũ $45 e^(-0.15 t)$ và một mức nền không đổi là $5$.
    
    *Bước 2: Tính giới hạn vô cực* 
    
    $ lim_{t -> +oo} C(t) = lim_{t -> +oo} (5 + 45 e^(-0.15 t)) $
    Khi $t -> +oo$, $e^(-0.15 t) -> 0$.
    $ lim_{t -> +oo} C(t) = 5 + 45(0) = 5 $.
    
    *Bước 3: Diễn giải* 
    
    Mặc dù tự nhiên có khả năng tự phân hủy chất thải, nhưng hồ vẫn còn tồn dư một mức ô nhiễm nền là $5$ mg/l mà quá trình phân hủy sinh học không thể làm sạch hết.
    
    #ans-box[Mức độ ô nhiễm tiệm cận *$5$ mg/l*.]
  ]
)

#tn(
  id: "M14",
  [Cước phí gửi một bưu kiện được bưu điện tính theo hàm bậc thang: $15.000$đ cho $50$ gam đầu tiên (kể cả đúng $50$g). Với mỗi $50$ gam tiếp theo (hoặc phần lẻ của $50$g), khách hàng phải trả thêm $5.000$đ. Khẳng định nào sau đây là *SAI* khi nói về tính liên tục của hàm chi phí $C(x)$ (với $x$ là khối lượng bưu kiện, tính bằng gam)?],
  ([Hàm số $C(x)$ bị gián đoạn tại $x = 50$.], [Giới hạn trái $lim_{x -> 50^-} C(x) = 15.000$.], True([Giới hạn phải $lim_{x -> 50^+} C(x) = 15.000$.]), [Tại $x = 100$, hàm số bị nhảy bậc từ $20.000$đ lên $25.000$đ.]),
  loigiai: [
    *Bước 1: Viết tường minh hàm cước phí $C(x)$* 
    
    - Với $0 < x <= 50$: $C(x) = 15.000$.
    - Với $50 < x <= 100$: $C(x) = 15.000 + 5.000 = 20.000$.
    - Với $100 < x <= 150$: $C(x) = 20.000 + 5.000 = 25.000$.
    
    *Bước 2: Kiểm tra các mốc gián đoạn* 
    
    Tại $x = 50$:
    - Giới hạn trái: $lim_{x -> 50^-} C(x) = 15.000$.
    - Giới hạn phải: $lim_{x -> 50^+} C(x) = 20.000$. (Do vừa lố 50g đã phải trả thêm 5.000đ).
    
    *Bước 3: Đánh giá các mệnh đề* 
    
    Mệnh đề "Giới hạn phải $lim_{x -> 50^+} C(x) = 15.000$" là sai, vì giới hạn phải bằng $20.000$.
    
    #ans-box[Mệnh đề sai là: *Giới hạn phải bằng 15.000*.]
  ]
)

#tn(
  id: "M15",
  [Trong hệ thống đường sắt đô thị, để chuyển từ một đoạn đường thẳng sang một đoạn đường cong tròn, người ta dùng một đường cong chuyển tiếp (ví dụ đường cong Clothoid) để tránh lực ly tâm thay đổi đột ngột gây lật tàu. Yêu cầu tối thiểu về toán học đối với quỹ đạo tại điểm tiếp nối giữa hai đoạn đường ray là gì?],
  ([Đạo hàm tại điểm nối phải bằng 0.], [Chỉ cần giới hạn trái bằng giới hạn phải của phương trình quỹ đạo.], True([Hàm số và đạo hàm bậc nhất của nó đều phải liên tục tại điểm tiếp nối.]), [Quỹ đạo không được phép là hàm liên tục.]),
  loigiai: [
    *Bước 1: Ý nghĩa của sự liên tục hàm số* 
    
    Nếu hàm số quỹ đạo $y = f(x)$ không liên tục tại điểm nối ($lim_{x -> x_0^-} f(x) != lim_{x -> x_0^+} f(x)$), đường ray sẽ bị đứt gãy, tàu sẽ trật bánh. Do đó nó *bắt buộc* phải liên tục.
    
    *Bước 2: Ý nghĩa của đạo hàm liên tục* 
    
    Đạo hàm $f'(x)$ thể hiện hệ số góc (hướng tiếp tuyến). Nếu $f'(x)$ không liên tục, đường ray sẽ có một "góc nhọn" (corner). Tàu đi qua góc nhọn sẽ bị bẻ lái đột ngột, gây sốc lực và tai nạn. Do đó đạo hàm cũng phải liên tục (tiếp tuyến phải khớp nhau).
    (Trong thực tế kỹ thuật, đạo hàm bậc 2 cũng cần liên tục để tránh bước nhảy lực ly tâm).
    
    *Bước 3: Kết luận* 
    
    Yêu cầu tối thiểu là cả hàm số và đạo hàm bậc 1 đều phải liên tục.
    
    #ans-box[Cả hàm số và đạo hàm bậc 1 đều phải *liên tục*.]
  ]
)
"""

if content.endswith('"""\n'):
    content = content[:-4] + new_questions + '"""\n'
else:
    # Just in case there is no newline at end
    content = content.replace('"""', new_questions + '"""', 1) # wait, replacing first might fail if there are multiple.
    # It's better to find the last occurrence.
    idx = content.rfind('"""')
    content = content[:idx] + new_questions + content[idx:]

with open('gen_gioihan_p2.py', 'w') as f:
    f.write(content)
print("Updated gen_gioihan_p2.py")
