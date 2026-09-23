import re

files_replacements = {
    7: {
        "tn": r"""#tn([Một xưởng in ấn cần thiết kế một tờ áp phích quảng cáo hình chữ nhật có diện tích phần in là 384 cm². Các lề trên và dưới mỗi lề rộng 3 cm, lề trái và phải mỗi lề rộng 2 cm. Để diện tích toàn bộ tờ áp phích là nhỏ nhất (giúp tiết kiệm giấy), kích thước chiều cao (cạnh có lề 3cm) và chiều rộng (cạnh có lề 2cm) của phần in ấn lần lượt là bao nhiêu cm?],
  (
    [20 và 18],
    True([24 và 16]),
    [16 và 24],
    [32 và 12],
  ),
  loigiai: [
    - Gọi $x$ và $y$ là chiều cao và chiều rộng của phần in ấn ($x, y > 0$).
    - Ta có diện tích phần in: $xy = 384 \Rightarrow y = 384/x$.
    - Chiều cao toàn bộ tờ giấy: $H = x + 6$. Chiều rộng toàn bộ: $W = y + 4$.
    - Diện tích toàn bộ tờ giấy: $S(x) = (x+6)(y+4) = (x+6)(384/x + 4) = 384 + 4x + 2304/x + 24$.
    - $S'(x) = 4 - 2304/x^2 = 0 \Leftrightarrow x^2 = 576 \Leftrightarrow x = 24$.
    - Khi đó $y = 384/24 = 16$.
  ]
)""",
        "ds": r"""#ds([Một công ty du lịch dự định tổ chức một chuyến tham quan với sức chứa tối đa là 80 người. Nếu giá vé là 500 nghìn đồng/người thì sẽ có đúng 80 người đăng ký. Nghiên cứu cho thấy, cứ tăng giá vé thêm 50 nghìn đồng/người thì số lượng khách đăng ký sẽ giảm đi 4 người. Giả sử chi phí tổ chức cố định là 10 triệu đồng và chi phí phát sinh cho mỗi hành khách là 100 nghìn đồng. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Nếu tăng giá vé thêm 100 nghìn đồng, số khách tham gia là 72 người.]),
    True([Doanh thu cao nhất mà công ty có thể đạt được là 45 triệu đồng.]),
    [Để đạt lợi nhuận lớn nhất, công ty nên tăng giá vé thêm 4 lần (tức x = 4).],
    True([Mức giá vé mang lại lợi nhuận lớn nhất là 800 nghìn đồng/người.]),
  ),
  loigiai: [
    - Đặt $x$ là số lần tăng giá 50 nghìn đồng ($x \ge 0$).
    - a) Tăng 100 nghìn ($x=2$), số khách là $80 - 4(2) = 72$ người. (Đúng)
    - b) Giá vé: $500 + 50x$. Số khách: $80 - 4x$. Doanh thu $R(x) = (500+50x)(80-4x) = 40000 + 2000x - 200x^2$. Đỉnh parabol tại $x = 5$. $R(5) = 45000$ nghìn đồng = 45 triệu đồng. (Đúng)
    - c) Tổng chi phí $C(x) = 10000 + 100(80-4x) = 18000 - 400x$. Lợi nhuận $P(x) = R(x) - C(x) = 40000 + 2000x - 200x^2 - (18000 - 400x) = -200x^2 + 2400x + 22000$. Đạo hàm $P'(x) = -400x + 2400 = 0 \Leftrightarrow x = 6$. Vậy x=6 mới đúng, x=4 sai. (Sai)
    - d) Tại $x=6$, giá vé là $500 + 50 \times 6 = 800$ nghìn đồng. (Đúng)
  ]
)"""
    },
    8: {
        "tn": r"""#tn([Một người chèo thuyền xuất phát từ điểm A trên một hòn đảo và muốn đến điểm C trên bờ biển bằng cách chèo thuyền đến điểm M trên bờ biển (đoạn bờ biển thẳng) rồi chạy bộ từ M đến C. Gọi B là hình chiếu của A trên bờ biển. Biết khoảng cách $AB = 3$ km, $BC = 8$ km. Vận tốc chèo thuyền là 4 km/h, vận tốc chạy bộ là 5 km/h. Vị trí điểm M cách B bao nhiêu km để thời gian đến C là ngắn nhất?],
  (
    [2.5],
    [3],
    True([4]),
    [5],
  ),
  loigiai: [
    - Đặt $BM = x$ (km) ($0 \le x \le 8$). Khoảng cách $MC = 8 - x$.
    - Quãng đường trên biển $AM = \sqrt{AB^2 + BM^2} = \sqrt{x^2 + 9}$.
    - Thời gian đi: $t(x) = \frac{\sqrt{x^2+9}}{4} + \frac{8-x}{5}$.
    - $t'(x) = \frac{x}{4\sqrt{x^2+9}} - \frac{1}{5} = 0 \Leftrightarrow 5x = 4\sqrt{x^2+9} \Leftrightarrow 25x^2 = 16(x^2+9) \Leftrightarrow 9x^2 = 144 \Leftrightarrow x^2 = 16 \Leftrightarrow x = 4$.
    - Lập BBT thấy $t(x)$ đạt Min tại $x = 4$.
  ]
)""",
        "ds": r"""#ds([Một chiếc hộp không nắp được làm từ một tấm bìa các-tông hình vuông cạnh 12 cm bằng cách cắt bốn hình vuông nhỏ bằng nhau ở bốn góc rồi gập các cạnh lên. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Nếu độ dài cạnh hình vuông bị cắt là $x$ (cm) thì điều kiện của $x$ là $0 < x < 6$.]),
    [Thể tích hộp lớn nhất khi $x = 3$ cm.],
    True([Hàm số tính thể tích hộp là $V(x) = 4x^3 - 48x^2 + 144x$.]),
    True([Thể tích lớn nhất của chiếc hộp là 128 cm³.]),
  ),
  loigiai: [
    - a) Đúng. Tấm bìa cạnh 12, cắt 2 đầu x nên $12 - 2x > 0 \Rightarrow 0 < x < 6$.
    - c) Đáy hộp là hình vuông cạnh $12 - 2x$. Thể tích $V(x) = x(12 - 2x)^2 = x(144 - 48x + 4x^2) = 4x^3 - 48x^2 + 144x$. (Đúng)
    - b) $V'(x) = 12x^2 - 96x + 144 = 0 \Leftrightarrow x^2 - 8x + 12 = 0 \Leftrightarrow x = 2$ hoặc $x = 6$ (loại). Vậy thể tích lớn nhất khi $x=2$. Phát biểu cho $x=3$ là Sai.
    - d) Khi $x=2$, $V(2) = 2 \times (12 - 4)^2 = 2 \times 64 = 128$ cm³. (Đúng)
  ]
)"""
    },
    9: {
        "tn": r"""#tn([Trong nông nghiệp, năng suất lúa (tấn/ha) phụ thuộc vào lượng phân bón $x$ (kg/ha) theo mô hình $N(x) = -0.001x^2 + 0.4x + 10$. Tuy nhiên, để tối ưu hóa lợi nhuận kinh tế, nông dân phải trừ đi chi phí phân bón. Biết mỗi tấn lúa bán được 6 triệu đồng, mỗi kg phân bón giá 0.02 triệu đồng (20 nghìn đồng). Nông dân nên bón bao nhiêu kg phân bón cho mỗi hecta để lợi nhuận thu được lớn nhất?],
  (
    [150],
    True([198.33]),
    [200],
    [180],
  ),
  loigiai: [
    - Doanh thu: $6 \times N(x) = 6(-0.001x^2 + 0.4x + 10) = -0.006x^2 + 2.4x + 60$ (triệu đồng).
    - Chi phí: $0.02x$ (triệu đồng).
    - Lợi nhuận: $L(x) = -0.006x^2 + 2.4x + 60 - 0.02x = -0.006x^2 + 2.38x + 60$.
    - $L'(x) = -0.012x + 2.38 = 0 \Leftrightarrow x = 2.38 / 0.012 = 1190 / 6 = 198.33$ kg.
  ]
)""",
        "ds": r"""#ds([Một bồn chứa hóa chất có hình trụ tròn xoay (được đậy nắp kín) có dung tích không đổi là $V = 16\pi$ m³. Để làm mặt xung quanh bồn, vật liệu có giá 200 nghìn đồng/m², còn làm hai mặt đáy (cả nắp) vật liệu có giá 400 nghìn đồng/m². Đặt $R$ (m) là bán kính đáy, $h$ (m) là chiều cao của bồn. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Thể tích $V = \pi R^2 h \Rightarrow h = 16 / R^2$.]),
    True([Chi phí vật liệu làm hai mặt đáy là $800\pi R^2$ (nghìn đồng).]),
    [Để chi phí thấp nhất, bán kính đáy phải bằng 2 mét.],
    [Chi phí thấp nhất đạt được khi $h = \sqrt[3]{4}$ mét.],
  ),
  loigiai: [
    - a) Thể tích trụ: $V = \pi R^2 h = 16\pi \Rightarrow h = 16/R^2$. (Đúng)
    - b) Diện tích hai đáy là $2\pi R^2$. Chi phí làm 2 đáy là $400 \times 2\pi R^2 = 800\pi R^2$. (Đúng)
    - c) Diện tích xung quanh là $2\pi R h = 2\pi R (16/R^2) = 32\pi/R$. Chi phí xung quanh là $200 \times 32\pi/R = 6400\pi/R$.
      Tổng chi phí $C(R) = 800\pi R^2 + 6400\pi/R$.
      Đạo hàm $C'(R) = 1600\pi R - 6400\pi/R^2 = 0 \Leftrightarrow R^3 = 4 \Leftrightarrow R = \sqrt[3]{4} \approx 1.587$ m. Phát biểu C sai.
    - d) Khi $R = \sqrt[3]{4}$, $h = 16/R^2 = 16/4^{2/3} = 4\sqrt[3]{4}$. Phát biểu D sai.
  ]
)"""
    },
    10: {
        "tn": r"""#tn([Để thiết kế một máng dẫn nước bằng cách gấp một tấm tôn phẳng hình chữ nhật có bề ngang 30 cm. Người ta gấp hai mép lên trên tạo thành một mặt cắt ngang hình chữ U cân. Phần đáy máng là $x$ cm, hai cạnh bên gập lên có độ dài bằng nhau. Để lưu lượng nước qua máng là lớn nhất, diện tích mặt cắt ngang phải lớn nhất. Kích thước $x$ phải bằng bao nhiêu cm?],
  (
    [10],
    True([15]),
    [12],
    [20],
  ),
  loigiai: [
    - Bề ngang tấm tôn 30 cm, nên phần đáy là $x$, hai cạnh gập lên mỗi cạnh là $\frac{30-x}{2}$.
    - Giả sử gập lên vuông góc, mặt cắt ngang là hình chữ nhật. Chiều rộng là $x$, chiều cao là $\frac{30-x}{2}$.
    - Diện tích mặt cắt $S(x) = x \frac{30-x}{2} = \frac{1}{2}(30x - x^2)$.
    - $S'(x) = \frac{1}{2}(30 - 2x) = 0 \Leftrightarrow x = 15$.
    - Lập BBT, ta thấy $S(x)$ đạt lớn nhất khi $x = 15$ cm.
  ]
)""",
        "ds": r"""#ds([Một quả bóng được ném lên trên không. Chiều cao của quả bóng (tính bằng mét) sau $t$ giây kể từ khi ném được cho bởi hàm số $h(t) = -5t^2 + 20t + 2$. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Độ cao ban đầu khi ném bóng là 2 mét.]),
    True([Vận tốc của quả bóng tại thời điểm $t=1$ giây là 10 m/s.]),
    [Quả bóng đạt độ cao lớn nhất tại $t=3$ giây.],
    True([Độ cao lớn nhất mà quả bóng đạt được là 22 mét.]),
  ),
  loigiai: [
    - a) Tại $t=0$, $h(0) = 2$. (Đúng)
    - b) Vận tốc $v(t) = h'(t) = -10t + 20$. Tại $t=1$, $v(1) = 10$. (Đúng)
    - c) Bóng đạt đỉnh khi $v(t) = 0 \Leftrightarrow -10t + 20 = 0 \Leftrightarrow t = 2$ giây. Phát biểu cho t=3 là Sai.
    - d) Tại $t=2$, độ cao lớn nhất là $h(2) = -5(4) + 20(2) + 2 = 22$ mét. (Đúng)
  ]
)"""
    }
}

for doc in range(7, 11):
    path = f"typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-{doc}.typ"
    with open(path, "r") as f:
        content = f.read()

    # Split the file by "#tn" and "#ds" and just find the ones containing the words "hộp bí ẩn" and "Bốn học sinh"
    
    # regex to match #tn(...) block that contains "Hộp bí ẩn"
    # We match #tn followed by balanced parens? It's easier to match #tn\(\s*\[Có ba hộp bí ẩn .*?\)\n\)
    # Let's use a non-greedy match that ends at the end of the loigiai block.
    # loigiai: [\n ... \n  ]\n)
    tn_regex = r'#tn\(\s*\[Có ba hộp bí ẩn.*?loigiai: \[.*?\]\n\)'
    ds_regex = r'#ds\(\s*\[Bốn học sinh A, B, C, D tham gia một cuộc đua.*?loigiai: \[.*?\]\n\)'
    
    new_content = re.sub(tn_regex, lambda m, d=doc: files_replacements[d]["tn"], content, flags=re.DOTALL)
    new_content = re.sub(ds_regex, lambda m, d=doc: files_replacements[d]["ds"], new_content, flags=re.DOTALL)
    
    if new_content == content:
        print(f"Warning: Nothing was replaced in {path}")
    else:
        with open(path, "w") as fw:
            fw.write(new_content)
        print(f"Fixed {path}")

