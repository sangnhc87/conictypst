import re
import glob

# Dictionary mapping question text snippets to their upgraded loigiai
upgrades = {
    # 1. Hộp không nắp từ tôn hình vuông cạnh 60 (Đề 1, Đề 8)
    "hình vuông cạnh 60 cm bằng cách cắt": r"""
    - Gọi $x$ là cạnh hình vuông bị cắt, điều kiện $0 < x < 30$.
    - Cạnh đáy hộp là $60 - 2x$, chiều cao là $x$.
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        line((0,0), (6,0), (6,6), (0,6), (0,0), stroke: 1pt + black)
        line((0,0), (1.5,0), (1.5,1.5), (0,1.5), (0,0), fill: rgb("ffcccc"), stroke: none)
        line((6,0), (4.5,0), (4.5,1.5), (6,1.5), (6,0), fill: rgb("ffcccc"), stroke: none)
        line((6,6), (4.5,6), (4.5,4.5), (6,4.5), (6,6), fill: rgb("ffcccc"), stroke: none)
        line((0,6), (1.5,6), (1.5,4.5), (0,4.5), (0,6), fill: rgb("ffcccc"), stroke: none)
        line((1.5,1.5), (4.5,1.5), stroke: (dash: "dashed"))
        line((1.5,4.5), (4.5,4.5), stroke: (dash: "dashed"))
        line((1.5,1.5), (1.5,4.5), stroke: (dash: "dashed"))
        line((4.5,1.5), (4.5,4.5), stroke: (dash: "dashed"))
        content((3, -0.4), $60 - 2x$)
        content((0.75, 0.75), $x$)
      })
    ]
    - Thể tích khối hộp: $V(x) = x(60 - 2x)^2 = x(3600 - 240x + 4x^2) = 4x^3 - 240x^2 + 3600x$.
    - Đạo hàm: $V'(x) = 12x^2 - 480x + 3600$.
    - Cho $V'(x) = 0 <=> 12(x^2 - 40x + 300) = 0 <=> x = 10$ hoặc $x = 30$ (loại vì $x < 30$).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "V'(x)",
        func: "V(x)",
        x-vals: ($0$, $10$, $30$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $16000$, $0$)
      )
    ]
    - Dựa vào BBT, thể tích hộp lớn nhất khi $x = 10$.
  ]
""",
    
    # 2. Chi phí tàu biển (v=10, c=400, C=1600) (Đề 1)
    "Chi phí nhiên liệu cho một chuyến tàu chạy trên biển tỷ lệ thuận": r"""
    - Gọi vận tốc của tàu là $v > 0$ (km/h).
    - Chi phí nhiên liệu trong 1 giờ là $c = k v^2$. Tại $v=10$, $c=400 => 400 = k(10) => k=4$. Vậy $c = 4v^2$.
    - Tổng chi phí trong 1 giờ (gồm nhiên liệu và cố định): $C_1 = 4v^2 + 1600$.
    - Thời gian đi hết 100 km là $t = 100 / v$ (giờ).
    - Tổng chi phí cho cả chuyến đi: $C(v) = C_1 times t = (4v^2 + 1600) times 100 / v = 400v + 160000 / v$.
    - Đạo hàm: $C'(v) = 400 - 160000 / v^2$.
    - Cho $C'(v) = 0 <=> 400 = 160000 / v^2 <=> v^2 = 400 <=> v = 20$ (do $v > 0$).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "v",
        der: "C'(v)",
        func: "C(v)",
        x-vals: ($0$, $20$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $16000$, $+oo$)
      )
    ]
    - Dựa vào bảng biến thiên, chi phí thấp nhất khi tàu chạy với vận tốc 20 km/h.
  ]
""",

    # 3. Màn hình điện thoại 96 cm2 (Đề 2)
    "Kích thước một màn hình điện thoại được thiết kế": r"""
    - Gọi $x, y$ lần lượt là chiều rộng và chiều dài của phần hiển thị ($x, y > 0$).
    - Diện tích phần hiển thị: $x y = 96 => y = 96 / x$.
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        line((0,0), (3,0), (3,5), (0,5), (0,0), stroke: 1.5pt + black)
        line((0.3,0.5), (2.7,0.5), (2.7,4.5), (0.3,4.5), (0.3,0.5), fill: rgb("e2e8f0"), stroke: 1pt + black)
        content((1.5, 2.5), $x y = 96$)
        content((1.5, -0.3), $W = x + 2(1.5)$)
        content((-0.5, 2.5), $H = y + 2(1)$)
      })
    ]
    - Chiều rộng toàn bộ màn hình là $W = x + 3$ (cm).
    - Chiều dài toàn bộ màn hình là $H = y + 2$ (cm).
    - Diện tích toàn bộ điện thoại: $S(x) = W times H = (x + 3)(y + 2) = (x + 3)(96 / x + 2) = 96 + 2x + 288 / x + 6 = 102 + 2x + 288 / x$.
    - Đạo hàm: $S'(x) = 2 - 288 / x^2$.
    - $S'(x) = 0 <=> x^2 = 144 <=> x = 12$ (do $x > 0$).
    - Từ đó $y = 96 / 12 = 8$. Diện tích nhỏ nhất là $S(12) = 102 + 24 + 24 = 150$.
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "S'(x)",
        func: "S(x)",
        x-vals: ($0$, $12$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $150$, $+oo$)
      )
    ]
    - Vậy diện tích toàn bộ nhỏ nhất là $150$ cm².
  ]
""",

    # 4. Thùng không nắp đáy vuông 500 dm3 (Đề 2)
    "Người ta muốn chế tạo một thùng chứa dạng hình hộp chữ nhật": r"""
    - Gọi $x$ (dm) là cạnh đáy hình vuông, $h$ (dm) là chiều cao của hộp ($x, h > 0$).
    - Thể tích: $V = x^2 h = 500 => h = 500 / x^2$.
    - Diện tích đáy $S_"d" = x^2$. Diện tích xung quanh $S_"xq" = 4x h = 4x (500 / x^2) = 2000 / x$.
    - Tổng diện tích tôn (không nắp): $S(x) = x^2 + 2000 / x$.
    - Đạo hàm: $S'(x) = 2x - 2000 / x^2 = (2x^3 - 2000) / x^2$.
    - $S'(x) = 0 <=> x^3 = 1000 <=> x = 10$. Suy ra $h = 500 / 100 = 5$.
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "S'(x)",
        func: "S(x)",
        x-vals: ($0$, $10$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $300$, $+oo$)
      )
    ]
    - Dựa vào bảng biến thiên, diện tích tôn tốn ít nhất khi $x = 10$ và $h = 5$.
  ]
""",

    # 5. Rào lưới 3 mặt 100m (Đề 3)
    "Người ta dùng 100m hàng rào lưới thép": r"""
    - Gọi $x$ (m) là chiều rộng của khu đất vuông góc với bờ tường ($x > 0$).
    - Do 3 mặt rào có tổng độ dài 100m nên mặt song song bờ tường có chiều dài $y = 100 - 2x$ ($0 < x < 50$).
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        line((0,3), (6,3), stroke: 3pt + gray) // Tường
        line((1,3), (1,0), (5,0), (5,3), stroke: 1.5pt + blue)
        content((3, 3.4), [Bờ tường])
        content((0.6, 1.5), $x$)
        content((5.4, 1.5), $x$)
        content((3, -0.4), $y = 100 - 2x$)
      })
    ]
    - Diện tích khu đất: $S(x) = x(100 - 2x) = 100x - 2x^2$.
    - Đạo hàm: $S'(x) = 100 - 4x$.
    - $S'(x) = 0 <=> 4x = 100 <=> x = 25$.
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "S'(x)",
        func: "S(x)",
        x-vals: ($0$, $25$, $50$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $1250$, $0$)
      )
    ]
    - Diện tích lớn nhất $S = 1250$ m².
  ]
""",

    # 6. Khúc gỗ lăng trụ tứ giác đều (Đề 3)
    "cắt ra một thanh gỗ hình lăng trụ tứ giác đều": r"""
    - Gọi $x$ là nửa đường chéo đáy của khối lăng trụ tứ giác đều (hình vuông nội tiếp đường tròn đáy của hình trụ). $0 < x <= 2$.
    - Diện tích đáy lăng trụ (hình vuông): $S_"d" = 1/2 (2x)^2 = 2x^2$.
    - Chiều cao hình trụ là $h$, đường kính đáy trụ là $2R = 4$. Lăng trụ dài $4$ nên $h=4$.
    - Thể tích thanh gỗ lớn nhất khi đáy lăng trụ lớn nhất, tức là hình vuông nội tiếp lớn nhất khi $x = R = 2$.
    - Diện tích đáy tối đa $S = 2(2)^2 = 8$. Thể tích lớn nhất $V = 8 times 4 = 32$.
    - Hiệu suất (phần gỗ bị bỏ):
    - Thể tích trụ: $V_1 = pi R^2 h = pi(2)^2(4) = 16pi approx 50.26$.
    - Tỉ lệ gỗ: $32 / (16pi) = 2/pi approx 63.66%$. Phần bị cắt đi là $100% - 63.66% = 36.34%$.
    - Gần với 36% nhất.
  ]
""",

    # 7. Bồn nước thể tích 1000pi (Đề 4)
    "bồn chứa nước hình trụ có thể tích $V = 1000pi": r"""
    - Gọi $R$ (m) là bán kính đáy, $h$ (m) là chiều cao của bồn trụ ($R, h > 0$).
    - Thể tích: $V = pi R^2 h = 1000pi => h = 1000 / R^2$.
    - Diện tích toàn phần (gồm nắp): $S = 2pi R^2 + 2pi R h$.
    - Chi phí: Đáy $300000/m^2$, nắp $200000/m^2$, thân $150000/m^2$.
    - Tổng chi phí: $C(R) = 300000(pi R^2) + 200000(pi R^2) + 150000(2pi R h) = 500000pi R^2 + 300000pi R (1000 / R^2)$.
    - $C(R) = 500000pi R^2 + 300000000pi / R$.
    - Đạo hàm: $C'(R) = 1000000pi R - 300000000pi / R^2$.
    - $C'(R) = 0 <=> R^3 = 300 <=> R = root(3, 300) approx 6.69$ (m).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "R",
        der: "C'(R)",
        func: "C(R)",
        x-vals: ($0$, $root(3, 300)$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $"Min"$, $+oo$)
      )
    ]
    - Chi phí thấp nhất đạt tại $R approx 6.69$ m.
  ]
""",

    # 8. Tuyến cáp biển AB=10 (Đề 5, 6)
    "Cần thiết kế một đường dây điện từ trạm phát A trên bờ biển tới một hòn đảo C": r"""
    - Đặt $"BM" = x$ (km) với $0 <= x <= 10$. Khi đó $"AM" = 10 - x$.
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        line((0,0), (10,0), stroke: 1.5pt + blue)
        line((0,0), (0,4), stroke: (dash: "dashed"))
        line((6,0), (0,4), stroke: 1.5pt + red)
        line((6,0), (10,0), stroke: 1.5pt + red)
        content((3, -0.4), $x$)
        content((8, -0.4), $10 - x$)
        content((-0.4, 2), $4$)
        content((0, -0.4), $B$)
        content((6, -0.4), $M$)
        content((10, -0.4), $A$)
        content((0, 4.4), $C$)
      })
    ]
    - Quãng đường trên bờ là $"AM" = 10 - x$.
    - Quãng đường dưới biển là $"CM" = sqrt("BM"^2 + "BC"^2) = sqrt(x^2 + 16)$.
    - Tổng chi phí: $f(x) = 30(10 - x) + 50 sqrt(x^2 + 16)$ (triệu đồng).
    - Đạo hàm: $f'(x) = -30 + (50x) / sqrt(x^2 + 16)$.
    - $f'(x) = 0 <=> 50x = 30 sqrt(x^2 + 16) <=> 25x^2 = 9(x^2 + 16) <=> 16x^2 = 144 <=> x = 3$ (do $x >= 0$).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "f'(x)",
        func: "f(x)",
        x-vals: ($0$, $3$, $10$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($500$, $410$, $10 sqrt(116)$)
      )
    ]
    - Chi phí nhỏ nhất khi $x = 3$. Quãng đường dưới biển: $sqrt(3^2+16) = 5$ km.
  ]
"""
}

# Apply upgrades to all 10 files
files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")
for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    new_content = content
    for text_snippet, new_loigiai in upgrades.items():
        if text_snippet in new_content:
            parts = new_content.split(text_snippet)
            if len(parts) > 1:
                sub_parts = parts[1].split("loigiai: [", 1)
                if len(sub_parts) == 2:
                    old_loigiai_and_rest = sub_parts[1].split("]", 1)
                    if len(old_loigiai_and_rest) == 2:
                        parts[1] = sub_parts[0] + "loigiai: [" + new_loigiai + old_loigiai_and_rest[1]
                        new_content = text_snippet.join(parts)
    
    if new_content != content:
        with open(path, "w") as fw:
            fw.write(new_content)
        print(f"Upgraded {path}")

