import os

with open('gen_gioihan_p4.py', 'r') as f:
    content = f.read()

new_questions = r"""
#tln(
  id: "S3",
  [Một công ty nghiên cứu thị trường ước tính rằng doanh thu $R$ (tỷ đồng) thu được từ một chiến dịch quảng cáo phụ thuộc vào số tiền chi cho quảng cáo $x$ (tỷ đồng) theo mô hình: $R(x) = (150 x) / (2 + x)$ với $x >= 0$. Theo mô hình này, nếu công ty có thể chi một ngân sách khổng lồ (vô hạn) cho quảng cáo, doanh thu tối đa (mức bão hòa thị trường) mà công ty có thể đạt được là bao nhiêu tỷ đồng?],
  [150],
  loigiai: [
    *Bước 1: Thiết lập giới hạn* 
    
    Doanh thu tối đa khi ngân sách vô hạn chính là giới hạn của $R(x)$ khi $x -> +oo$:
    $ lim_{x -> +oo} R(x) = lim_{x -> +oo} (150 x) / (2 + x) $
    
    *Bước 2: Tính giới hạn* 
    
    Chia cả tử và mẫu cho $x$:
    $ lim_{x -> +oo} 150 / (2/x + 1) = 150 / (0 + 1) = 150 $ (tỷ đồng).
    
    *Bước 3: Kết luận* 
    
    Doanh thu không thể vượt quá $150$ tỷ đồng dù chi bao nhiêu tiền quảng cáo, vì thị trường đã bão hòa.
    
    #ans-box[Doanh thu tối đa tiệm cận là *$150$* tỷ đồng.]
  ]
)

#tln(
  id: "S4",
  [Để khuyến khích tiết kiệm, một công ty điện lực tính giá điện theo bậc. Nếu dùng $x$ kWh ($0 < x <= 200$), giá phải trả là $1.5$ nghìn đồng/kWh. Nếu dùng trên $200$ kWh, biểu giá cho *toàn bộ* số điện sử dụng chuyển sang hàm $P(x) = a x + b$. Biết rằng để biểu giá không bị "nhảy cóc" vô lý tại mốc $200$ kWh (hàm tổng tiền liên tục), và nếu dùng $300$ kWh thì khách hàng phải trả $500$ nghìn đồng. Tìm giá trị của $a$ (tính bằng nghìn đồng).],
  [2],
  loigiai: [
    *Bước 1: Tính số tiền tại mốc 200 kWh* 
    
    Khi $x = 200$, số tiền phải trả là:
    $ f(200) = 1.5 times 200 = 300 $ (nghìn đồng).
    Giới hạn trái $lim_{x -> 200^-} f(x) = 300$.
    
    *Bước 2: Sử dụng điều kiện liên tục* 
    
    Để hàm liên tục tại $x = 200$, giới hạn phải phải bằng giới hạn trái:
    $ lim_{x -> 200^+} (a x + b) = 300 => 200a + b = 300 \quad (1) $
    
    *Bước 3: Sử dụng giả thiết tại 300 kWh* 
    
    Tại $x = 300$, số tiền là $500$ nghìn đồng:
    $ 300a + b = 500 \quad (2) $
    
    *Bước 4: Giải hệ phương trình* 
    
    Lấy (2) trừ (1):
    $ 100a = 200 => a = 2 $
    (Và $b = 300 - 400 = -100$).
    
    #ans-box[Giá trị của tham số $a$ là *$2$*.]
  ]
)

#tln(
  id: "S5",
  [Trong quá trình luyện kim, một thỏi kim loại đang ở nhiệt độ $800$ độ C (Celsius) được đưa vào lò làm nguội. Theo định luật Newton, nhiệt độ của thỏi kim loại sau $t$ phút là $T(t) = 30 + 770 e^(-k t)$, với $30$ độ C là nhiệt độ môi trường. Biết rằng sau $10$ phút, nhiệt độ giảm xuống còn $415$ độ C. Hỏi giới hạn nhiệt độ của thỏi kim loại khi $t -> +oo$ là bao nhiêu độ C?],
  [30],
  loigiai: [
    *Bước 1: Đánh giá hàm nhiệt độ* 
    
    Ta cần tính $lim_{t -> +oo} T(t) = lim_{t -> +oo} (30 + 770 e^(-k t))$.
    
    *Bước 2: Phân tích thành phần mũ* 
    
    Vì $k > 0$ (hằng số làm nguội), khi $t -> +oo$ thì $-k t -> -oo$.
    Do đó, $e^(-k t) -> 0$.
    
    *Bước 3: Tính giới hạn* 
    
    $ lim_{t -> +oo} T(t) = 30 + 770 times 0 = 30 $.
    (Dữ kiện "sau 10 phút còn 415 độ C" chỉ để tìm $k$, không ảnh hưởng đến giới hạn khi $t -> +oo$. Nhiệt độ vật luôn tiệm cận nhiệt độ môi trường).
    
    #ans-box[Giới hạn nhiệt độ là *$30$* độ C.]
  ]
)

#tln(
  id: "S6",
  [Một hệ thống máy chủ xử lý dữ liệu đám mây có khả năng xử lý song song. Khi số lượng máy chủ (Node) là $n$, tốc độ xử lý của hệ thống (tính bằng Terabytes/giây) được mô hình hóa bằng hàm số $V(n) = (50 n^2 + 10 n) / (2 n^2 + 5)$. Nếu mạng lưới đám mây này được mở rộng vô hạn ($n -> +oo$), tốc độ xử lý lý thuyết tối đa (giới hạn băng thông) của toàn bộ hệ thống là bao nhiêu Terabytes/giây?],
  [25],
  loigiai: [
    *Bước 1: Thiết lập bài toán giới hạn* 
    
    Tốc độ tối đa khi mở rộng vô hạn chính là:
    $ lim_{n -> +oo} V(n) = lim_{n -> +oo} (50 n^2 + 10 n) / (2 n^2 + 5) $
    
    *Bước 2: Tính toán giới hạn của hàm phân thức* 
    
    Cả tử và mẫu đều là đa thức bậc 2. Ta chia cả tử và mẫu cho $n^2$:
    $ lim_{n -> +oo} (50 + 10/n) / (2 + 5/n^2) $
    
    Khi $n -> +oo$, các thành phần $10/n -> 0$ và $5/n^2 -> 0$.
    
    *Bước 3: Kết luận* 
    
    Giới hạn thu được là: $50 / 2 = 25$ (Terabytes/giây).
    Dù có thêm bao nhiêu máy chủ, do độ trễ truyền tải mạng (overhead), tốc độ cũng không thể vượt ngưỡng này.
    
    #ans-box[Tốc độ tối đa tiệm cận là *$25$* Terabytes/giây.]
  ]
)
"""

idx = content.rfind('"""')
content = content[:idx] + new_questions + content[idx:]

with open('gen_gioihan_p4.py', 'w') as f:
    f.write(content)
print("Updated gen_gioihan_p4.py")
