import re

exams = {}

# Exam 2
exams[2] = [
    (r"#tln\(\[Cho hàm số \$f\(x\)\$.*?\]\n\)", r"""#tln([Một người uống một lượng rượu, nồng độ cồn trong máu (tính bằng mg/mL) sau $t$ giờ được mô hình hóa bởi hàm số $C(t) = (2t)/(t^2+1)$. Nồng độ cồn trong máu đạt mức cao nhất sau bao nhiêu giờ?],
  [1],
  loigiai: [
    Đạo hàm $C'(t) = (2(t^2+1) - 2t(2t))/(t^2+1)^2 = (2 - 2t^2)/(t^2+1)^2$.
    $C'(t) = 0 <=> 2 - 2t^2 = 0 <=> t = 1$ (do $t > 0$).
    Vậy nồng độ cồn đạt cực đại sau 1 giờ.
  ]
)"""),
    (r"#tln\(\[Giao điểm \$I\(x_0; y_0\)\$.*?\]\n\)", r"""#tln([Tốc độ một phản ứng hóa học phụ thuộc vào nồng độ của chất xúc tác $x$ (%) theo hàm số $v(x) = x(12-x)^2$ với $0 <= x <= 12$. Tốc độ phản ứng đạt lớn nhất khi nồng độ chất xúc tác $x$ bằng bao nhiêu?],
  [4],
  loigiai: [
    $v'(x) = 1 * (12-x)^2 + x * 2(12-x)(-1) = (12-x)(12-x - 2x) = (12-x)(12-3x)$.
    $v'(x) = 0 <=> x=12$ (loại) hoặc $x=4$.
    Bảng biến thiên cho thấy cực đại đạt tại $x=4$.
  ]
)"""),
    (r"#tln\(\[Gọi \$y_\(C D\)\$.*?\]\n\)", r"""#tln([Một nhà xưởng sản xuất có lợi nhuận hàng ngày (triệu đồng) được mô hình hóa bởi hàm số $P(x) = 1000 + 400x - x^2$, trong đó $x$ là số lượng công nhân làm việc. Để lợi nhuận trong ngày đạt mức lớn nhất, nhà xưởng cần huy động bao nhiêu công nhân?],
  [200],
  loigiai: [
    Đạo hàm $P'(x) = 400 - 2x$.
    $P'(x) = 0 <=> 2x = 400 <=> x = 200$.
    Parabol bề lõm quay xuống nên đạt cực đại tại đỉnh $x = 200$.
  ]
)""")
]

# Exam 4
exams[4] = [
    (r"#tln\(\[Điểm cực đại của hàm số \$y = 1/3 x\^3.*?\]\n\)", r"""#tln([Một quả đạn pháo được bắn lên theo phương thẳng đứng. Độ cao của quả đạn so với mặt đất (tính bằng mét) sau $t$ giây được cho bởi hàm số $h(t) = 100t - 5t^2$. Độ cao lớn nhất mà quả đạn pháo có thể đạt được là bao nhiêu mét?],
  [500],
  loigiai: [
    Đạo hàm $h'(t) = 100 - 10t = 0 <=> t = 10$.
    Độ cao lớn nhất là $h(10) = 100(10) - 5(10^2) = 1000 - 500 = 500$ (mét).
  ]
)"""),
    (r"#tln\(\[Cho hàm số \$y = \(-2x\^2 \+ 3x - 1\)/\(x \+ 1\)\$.*?\]\n\)", r"""#tln([Dân số của một thị trấn sau $t$ năm kể từ hiện tại được dự báo theo hàm số $P(t) = 10 + (50t)/(t^2+100)$ (nghìn người) với $t >= 0$. Hỏi sau bao nhiêu năm nữa thì dân số thị trấn đạt mức cao nhất?],
  [10],
  loigiai: [
    Đạo hàm $P'(t) = (50(t^2+100) - 50t(2t))/(t^2+100)^2 = (5000 - 50t^2)/(t^2+100)^2$.
    $P'(t) = 0 <=> 5000 - 50t^2 = 0 <=> t^2 = 100 <=> t = 10$ (do $t >= 0$).
    Vậy sau 10 năm dân số đạt mức cao nhất.
  ]
)"""),
    (r"#tln\(\[Đồ thị hàm số \$y = \(x\^2 - 4\)/\(x\(x\^2 - 3x \+ 2\)\)\$.*?\]\n\)", r"""#tln([Chi phí để sản xuất $x$ máy điều hòa không khí của một công ty được ước tính bởi hàm số $C(x) = 2x^2 + 108000/x$ (triệu đồng) với $x > 0$. Chi phí sản xuất sẽ đạt giá trị nhỏ nhất khi công ty sản xuất bao nhiêu máy điều hòa?],
  [30],
  loigiai: [
    Đạo hàm $C'(x) = 4x - 108000/x^2 = (4x^3 - 108000)/x^2$.
    $C'(x) = 0 <=> x^3 = 27000 <=> x = 30$.
    Bảng biến thiên cho thấy cực tiểu tại $x = 30$.
  ]
)""")
]

# Exam 5
exams[5] = [
    (r"#tln\(\[Giá trị nhỏ nhất của hàm số \$y = \(x\^2 \+ 4\)/x\$.*?\]\n\)", r"""#tln([Năng lượng thu được từ một tuabin gió phụ thuộc vào vận tốc gió $v$ (m/s) theo hàm số $P(v) = v^2(12 - v)$ với $0 < v < 12$. Tuabin sẽ thu được năng lượng lớn nhất khi vận tốc gió bằng bao nhiêu (m/s)?],
  [8],
  loigiai: [
    Ta có $P(v) = 12v^2 - v^3$.
    Đạo hàm $P'(v) = 24v - 3v^2 = 3v(8 - v)$.
    $P'(v) = 0 <=> v = 8$ (do $v > 0$).
    Bảng biến thiên cho thấy $P(v)$ đạt cực đại tại $v=8$.
  ]
)"""),
    (r"#tln\(\[Tọa độ giao điểm \$I\(x_0; y_0\)\$.*?\]\n\)", r"""#tln([Dung lượng dữ liệu truyền qua một cáp quang (Gigabyte) trong thời gian $t$ (giây) được mô hình hóa bởi $S(t) = -t^3 + 12t^2$ với $0 <= t <= 12$. Tốc độ truyền dữ liệu đạt mức lớn nhất tại thời điểm $t$ bằng bao nhiêu giây?],
  [4],
  loigiai: [
    Tốc độ truyền dữ liệu là $v(t) = S'(t) = -3t^2 + 24t$.
    Để tìm vận tốc lớn nhất, ta xét đạo hàm $v'(t) = -6t + 24 = 0 <=> t = 4$.
    Gia tốc đổi dấu từ $+$ sang $-$ nên tốc độ đạt max tại $t = 4$.
  ]
)"""),
    (r"#tln\(\[Đồ thị hàm số \$y = \(x\^2 - 5x \+ 6\)/\(x\^3 - 4x\^2 \+ 4x\)\$.*?\]\n\)", r"""#tln([Nhiệt độ của một động cơ sau $t$ giờ hoạt động được cho bởi hàm số $T(t) = 20 + (40t)/(t^2+16)$ ($^o C$) với $t >= 0$. Sau bao nhiêu giờ kể từ khi khởi động thì động cơ đạt nhiệt độ cao nhất?],
  [4],
  loigiai: [
    Đạo hàm $T'(t) = (40(t^2+16) - 40t(2t))/(t^2+16)^2 = (640 - 40t^2)/(t^2+16)^2$.
    $T'(t) = 0 <=> 640 - 40t^2 = 0 <=> t^2 = 16 <=> t = 4$ (do $t >= 0$).
    Bảng biến thiên chỉ ra động cơ đạt nhiệt độ cao nhất tại $t = 4$.
  ]
)""")
]

# Exam 6
exams[6] = [
    (r"#tln\(\[Giá trị lớn nhất của hàm số \$y = -x\^4.*?\]\n\)", r"""#tln([Huyết áp của một bệnh nhân phụ thuộc vào liều lượng thuốc $x$ (mg) được tiêm theo hàm số $P(x) = x(15 - x)^2$ với $0 <= x <= 15$. Huyết áp của bệnh nhân sẽ tăng cao nhất khi liều lượng thuốc tiêm vào bằng bao nhiêu mg?],
  [5],
  loigiai: [
    Đạo hàm $P'(x) = 1 * (15-x)^2 + x * 2(15-x)(-1) = (15-x)(15-x - 2x) = (15-x)(15-3x)$.
    $P'(x) = 0 <=> x=15$ hoặc $x=5$.
    Bảng biến thiên trên đoạn $[0; 15]$ cho thấy cực đại đạt tại $x=5$.
  ]
)"""),
    (r"#tln\(\[Đồ thị hàm số \$y = \(x-1\)/\(sqrt\(x\^2 \+ 3\) - 2\)\$.*?\]\n\)", r"""#tln([Chi phí trung bình để sản xuất một linh kiện điện tử là $\overline{C}(x) = x + 100 + 400/x$ (nghìn đồng), trong đó $x$ là số lượng linh kiện ($x > 0$). Sản xuất bao nhiêu linh kiện để chi phí trung bình là nhỏ nhất?],
  [20],
  loigiai: [
    Áp dụng BĐT AM-GM: $\overline{C}(x) = x + 400/x + 100 >= 2sqrt(x * 400/x) + 100 = 2(20) + 100 = 140$.
    Dấu "=" xảy ra khi $x = 400/x <=> x^2 = 400 <=> x = 20$.
    Vậy số lượng linh kiện tối ưu là 20.
  ]
)"""),
    (r"#tln\(\[Đồ thị hàm số \$y = \(x\^2 - 1\)/\(x\^3 - 3x \+ 2\)\$.*?\]\n\)", r"""#tln([Người ta muốn uốn một tấm tôn thành một ống hình trụ đứng có thể tích bằng $100 pi$ ($cm^3$). Gọi $R$ (cm) là bán kính đáy hình trụ. Để tốn ít vật liệu nhất (diện tích toàn phần nhỏ nhất), thì bán kính đáy $R$ phải bằng bao nhiêu (biết rằng $root(3, 50) \approx 3.68$, kết quả làm tròn đến chữ số hàng đơn vị)?],
  [4],
  loigiai: [
    Thể tích $V = pi R^2 h = 100 pi \Rightarrow h = 100/R^2$.
    Diện tích toàn phần: $S = 2pi R^2 + 2pi R h = 2pi R^2 + 2pi R (100/R^2) = 2pi R^2 + 200pi / R$.
    Đạo hàm $S' = 4pi R - 200pi / R^2 = 0 <=> R^3 = 50 <=> R = root(3, 50) approx 3.68$.
    Làm tròn đến chữ số hàng đơn vị là 4.
  ]
)"""),
    (r"#tln\(\[Tọa độ giao điểm \$I\(x_0; y_0\)\$.*?\]\n\)", r"""#tln([Diện tích lớn nhất của một tam giác vuông có cạnh huyền cố định bằng $10$ cm là bao nhiêu $cm^2$?],
  [25],
  loigiai: [
    Gọi hai cạnh góc vuông là $x$ và $y$ ($x, y > 0$). Ta có $x^2 + y^2 = 10^2 = 100$.
    Diện tích tam giác vuông: $S = 1/2 x y$.
    Áp dụng BĐT AM-GM: $x^2 + y^2 >= 2x y <=> 100 >= 2x y <=> x y <= 50$.
    Do đó $S <= 1/2 (50) = 25$.
    Dấu "=" xảy ra khi $x=y=sqrt(50)$. Vậy diện tích lớn nhất là $25$.
  ]
)""")
]

# Exam 7
exams[7] = [
    (r"#tln\(\[Giá trị nhỏ nhất của hàm số \$y = x \+ 16/x\$.*?\]\n\)", r"""#tln([Tốc độ tiêu thụ điện năng của một khu dân cư trong một ngày (tính từ 0h) được mô hình hóa bởi hàm số $E(t) = 1/3 t^3 - 4t^2 + 12t$ (MW), với $0 <= t <= 24$. Vào thời điểm nào trong ngày thì tốc độ tiêu thụ điện năng giảm nhanh nhất?],
  [4],
  loigiai: [
    Tốc độ thay đổi của tốc độ tiêu thụ là đạo hàm $E'(t) = t^2 - 8t + 12$.
    Ta cần tìm thời điểm $E'(t)$ đạt cực tiểu (giảm nhanh nhất).
    $E''(t) = 2t - 8 = 0 <=> t = 4$.
    Do hệ số $a = 1 > 0$ nên parabol đạt GTNN tại đỉnh $t=4$.
  ]
)"""),
    (r"#tln\(\[Đường tiệm cận xiên của đồ thị hàm số \$y = \(2x\^2 - x \+ 3\)/\(x - 1\)\$.*?\]\n\)", r"""#tln([Năng suất của một vụ mùa theo mật độ gieo hạt $x$ (số hạt/$m^2$) được mô hình hóa bởi $N(x) = (100x)/(x^2+25)$ (kg/$m^2$). Để đạt năng suất lớn nhất, người nông dân cần gieo bao nhiêu hạt trên một mét vuông?],
  [5],
  loigiai: [
    Đạo hàm $N'(x) = (100(x^2+25) - 100x(2x))/(x^2+25)^2 = (2500 - 100x^2)/(x^2+25)^2$.
    $N'(x) = 0 <=> x^2 = 25 <=> x = 5$ (do $x > 0$).
    Bảng biến thiên cho thấy năng suất lớn nhất tại $x = 5$.
  ]
)"""),
    (r"#tln\(\[Gọi \$M\$ là giá trị lớn nhất của hàm số \$y = sqrt\(4 - x\^2\)\$.*?\]\n\)", r"""#tln([Một người thợ có một sợi dây thép dài 20m. Người đó uốn sợi dây thành một khung hình chữ nhật. Diện tích lớn nhất của hình chữ nhật đó là bao nhiêu $m^2$?],
  [25],
  loigiai: [
    Gọi hai cạnh của hình chữ nhật là $x, y > 0$. Ta có $2(x+y) = 20 <=> x+y = 10$.
    Diện tích $S = x y$. Áp dụng BĐT AM-GM: $x y <= ((x+y)/2)^2 = (10/2)^2 = 25$.
    Dấu "=" xảy ra khi $x = y = 5$ (hình vuông).
    Diện tích lớn nhất là $25 m^2$.
  ]
)"""),
    (r"#tln\(\[Đồ thị hàm số \$y = \(x\^2 - 1\)/\(x\^3 - 1\)\$.*?\]\n\)", r"""#tln([Hiệu quả của một loại thuốc trừ sâu sau $t$ giờ phun (tính bằng % vi khuẩn bị tiêu diệt) được đo bằng hàm $p(t) = (100t)/(t^2+100)$ với $t >= 0$. Sau bao nhiêu giờ phun thì thuốc trừ sâu phát huy tác dụng mạnh nhất?],
  [10],
  loigiai: [
    $p'(t) = (100(t^2+100) - 100t(2t))/(t^2+100)^2 = (10000 - 100t^2)/(t^2+100)^2$.
    $p'(t) = 0 <=> 100t^2 = 10000 <=> t^2 = 100 <=> t = 10$.
    Vậy sau 10 giờ thuốc phát huy hiệu quả tốt nhất.
  ]
)""")
]

# Exam 8
exams[8] = [
    (r"#tln\(\[Cho hàm số \$y = x\^3 - 3x\^2 \+ 2\$.*?\]\n\)", r"""#tln([Một nhà hàng tổ chức tiệc buffet có mức giá thay đổi tùy theo số lượng khách. Doanh thu của nhà hàng được mô hình hóa bởi $R(x) = x(200 - x)$ (nghìn đồng), với $x$ là số lượng khách. Nhà hàng thu được doanh thu lớn nhất khi có bao nhiêu khách?],
  [100],
  loigiai: [
    $R(x) = 200x - x^2$.
    Đạo hàm $R'(x) = 200 - 2x = 0 <=> x = 100$.
    Parabol quay bề lõm xuống dưới nên đạt cực đại tại đỉnh $x = 100$.
  ]
)"""),
    (r"#tln\(\[Đường tiệm cận xiên của đồ thị hàm số \$y = \(x\^2 \+ 3x - 1\)/\(x \+ 1\)\$.*?\]\n\)", r"""#tln([Độ cao của mực nước tại một bến cảng phụ thuộc vào thời gian $t$ (giờ) trong ngày theo hàm số $h(t) = 3 sin((pi t)/6) + 5$ (mét). Mực nước cao nhất tại bến cảng là bao nhiêu mét?],
  [8],
  loigiai: [
    Do hàm số sin nhận giá trị lớn nhất là 1, ta có:
    $h(t) <= 3(1) + 5 = 8$.
    Vậy mực nước cao nhất là 8 mét.
  ]
)"""),
    (r"#tln\(\[Gọi \$M\$ và \$m\$ lần lượt là giá trị lớn nhất.*?\]\n\)", r"""#tln([Lượng nước trong một hồ chứa sau $t$ tháng được cho bởi $V(t) = t^3 - 9t^2 + 24t + 100$ ($m^3$). Tốc độ thay đổi của lượng nước là hàm $v(t) = V'(t)$. Tốc độ này đạt giá trị nhỏ nhất tại tháng thứ mấy?],
  [3],
  loigiai: [
    Tốc độ thay đổi $v(t) = V'(t) = 3t^2 - 18t + 24$.
    Để tìm cực tiểu của tốc độ, xét $v'(t) = 6t - 18 = 0 <=> t = 3$.
    Do hệ số $a=3 > 0$, parabol quay lên nên đạt giá trị nhỏ nhất tại $t=3$.
  ]
)"""),
    (r"#tln\(\[Hàm số \$y = \|x\^2 - 4x \+ 3\|\$.*?\]\n\)", r"""#tln([Một loại thuốc hạ sốt khi tiêm vào cơ thể sẽ làm giảm nhiệt độ $T$ của cơ thể phụ thuộc vào liều lượng tiêm $x$ (mg) theo hàm $T(x) = x^2(6-x)$ ($0 < x < 6$). Hỏi nên tiêm liều lượng bao nhiêu mg để nhiệt độ cơ thể giảm nhiều nhất?],
  [4],
  loigiai: [
    Ta cần tìm giá trị lớn nhất của $T(x) = 6x^2 - x^3$.
    $T'(x) = 12x - 3x^2 = 3x(4-x)$.
    $T'(x) = 0 <=> x=0$ (loại) hoặc $x=4$.
    Bảng biến thiên cho thấy cực đại đạt tại $x=4$.
  ]
)""")
]

for idx, changes in exams.items():
    filepath = f"/Users/admin/conictypst/typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-b123-de-{idx}.typ"
    with open(filepath, "r") as f:
        content = f.read()
    
    for pattern, replacement in changes:
        content = re.sub(pattern, replacement, content, flags=re.DOTALL)
        
    with open(filepath, "w") as f:
        f.write(content)
