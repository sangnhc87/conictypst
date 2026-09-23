import re
import glob
import os

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")

replacements = {
    # 1. Ròng rọc (De 7 and others if any) - keep text, add figure
    "Cho một hệ thống ròng rọc. Một điểm P chuyển động dọc theo trục Oy với phương trình $y(t) = t^3 - 6t^2 + 9t$. Tại thời điểm nào (giây) hệ thống có gia tốc bằng 0?": r"""Cho một hệ thống ròng rọc. Một điểm P chuyển động dọc theo trục Oy với phương trình $y(t) = t^3 - 6t^2 + 9t$. Tại thời điểm nào (giây) hệ thống có gia tốc bằng 0?
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Vẽ trục Oy
      line((0, -1), (0, 4), mark: (end: ">"))
      content((-0.4, 3.8), [$y$])
      content((-0.3, -0.3), [$O$])
      
      // Vẽ bánh ròng rọc
      circle((2, 3), radius: 0.5, fill: gray.lighten(50%))
      circle((2, 3), radius: 0.1, fill: black)
      
      // Vẽ dây
      line((1.5, 3), (1.5, 1))
      line((2.5, 3), (2.5, -1))
      
      // Vẽ vật P
      content((1.5, 1), box(fill: blue.lighten(50%), inset: 5pt, [$P$]))
      
      // Vẽ đối trọng
      content((2.5, -1), box(fill: red.lighten(50%), inset: 5pt, [$m$]))
    })
  ]],
  [2],
  loigiai: [
    - Vận tốc: $v(t) = y'(t) = 3t^2 - 12t + 9$.
    - Gia tốc: $a(t) = v'(t) = y''(t) = 6t - 12$.
    - Để gia tốc bằng 0 thì $a(t) = 0 <=> 6t - 12 = 0 <=> t = 2$ (giây).
    - Đáp số: 2.
  ]
)""",

    # 2. Máng dẫn nước (De 7) - keep text, add figure
    "Để thiết kế một máng dẫn nước bằng cách gấp một tấm tôn phẳng hình chữ nhật có bề ngang 30 cm. Người ta gấp hai mép lên trên tạo thành một mặt cắt ngang hình chữ U cân. Phần đáy máng là $x$ cm, hai cạnh bên gập lên có độ dài bằng nhau. Để lưu lượng nước qua máng là lớn nhất, diện tích mặt cắt ngang phải lớn nhất. Kích thước $x$ phải bằng bao nhiêu cm?": r"""Để thiết kế một máng dẫn nước bằng cách gấp một tấm tôn phẳng hình chữ nhật có bề ngang 30 cm. Người ta gấp hai mép lên trên tạo thành một mặt cắt ngang hình chữ U cân. Phần đáy máng là $x$ cm, hai cạnh bên gập lên có độ dài bằng nhau. Để lưu lượng nước qua máng là lớn nhất, diện tích mặt cắt ngang phải lớn nhất. Kích thước $x$ phải bằng bao nhiêu cm?
  #align(center)[
    #cetz.canvas(length: 1.5cm, {
      import cetz.draw: *
      // Hình tấm tôn ban đầu
      line((-2, 0), (2, 0), stroke: 1.5pt)
      content((0, -0.3), [30 cm])
      
      // Hình mặt cắt máng chữ U
      line((3, 1), (3, 0), (5, 0), (5, 1), stroke: 2pt + blue)
      content((4, -0.3), [$x$])
      content((2.4, 0.5), [$(30-x)/2$])
      content((5.6, 0.5), [$(30-x)/2$])
      
      // Ký hiệu góc vuông
      line((3.2, 0), (3.2, 0.2), (3, 0.2))
      line((4.8, 0), (4.8, 0.2), (5, 0.2))
      
      content((1, 0.5), [$\rightarrow$])
    })
  ]],
  (
    [10],
    True([15]),
    [12],
    [20]
  ),
  loigiai: [
    - Bề ngang tấm tôn 30 cm, nên phần đáy là $x$, hai cạnh gập lên mỗi cạnh là $(30 - x)/2$.
    - Giả sử gập lên vuông góc, mặt cắt ngang là hình chữ nhật. Chiều rộng là $x$, chiều cao là $(30 - x)/2$.
    - Diện tích mặt cắt $S(x) = x (30 - x)/2 = 1/2 (30x - x^2)$.
    - $S'(x) = 1/2 (30 - 2x) = 0 <=> x = 15$.
    - Lập BBT, ta thấy $S(x)$ đạt lớn nhất khi $x = 15$ cm.
  ]
)""",

    # 3. Gấp hộp không nắp (De 6, 7, 8, 9, 10 - replaced Airline)
    "Một hãng hàng không quy định giá vé khứ hồi cho một tuyến đường bay là 4 triệu đồng/vé": r"""Một người thợ cần làm một chiếc hộp không có nắp từ một tấm bìa carton hình chữ nhật có kích thước 80 cm x 50 cm. Người thợ cắt bỏ 4 hình vuông bằng nhau ở 4 góc của tấm bìa rồi gấp phần còn lại lên để tạo thành hộp (như hình vẽ). Hãy tính cạnh của các hình vuông bị cắt bỏ (theo cm) sao cho thể tích của chiếc hộp nhận được là lớn nhất?
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Vẽ hình chữ nhật ngoài
      rect((0, 0), (8, 5), stroke: 1pt)
      // Vẽ các đường đứt nét bên trong tạo thành nếp gấp
      rect((1.5, 1.5), (6.5, 3.5), stroke: (paint: gray, dash: "dashed"))
      // Vẽ 4 hình vuông bị gạch xéo (cắt đi)
      let cross_square(x, y, w) = {
        rect((x, y), (x+w, y+w), fill: gray.lighten(70%))
        line((x, y), (x+w, y+w))
        line((x, y+w), (x+w, y))
        content((x + w/2, y - 0.3), [$x$])
        content((x - 0.3, y + w/2), [$x$])
      }
      cross_square(0, 0, 1.5)
      cross_square(6.5, 0, 1.5)
      cross_square(0, 3.5, 1.5)
      cross_square(6.5, 3.5, 1.5)
      
      content((4, -0.4), [80 cm])
      content((-0.6, 2.5), [50 cm])
    })
  ]],
  [10],
  loigiai: [
    - Gọi $x$ là cạnh của hình vuông bị cắt đi ($x > 0$, tính bằng cm).
    - Sau khi cắt và gấp, đáy hộp là hình chữ nhật có kích thước là $(80 - 2x)$ và $(50 - 2x)$.
    - Chiều cao của hộp chính là cạnh $x$.
    - Điều kiện để đáy hộp tồn tại: $80 - 2x > 0$ và $50 - 2x > 0 => 0 < x < 25$.
    - Thể tích của hộp là: $V(x) = x(80 - 2x)(50 - 2x) = 4x^3 - 260x^2 + 4000x$.
    - Đạo hàm: $V'(x) = 12x^2 - 520x + 4000$.
    - Đặt $V'(x) = 0 <=> 3x^2 - 130x + 1000 = 0 <=> x = 10$ hoặc $x = 100/3$ (loại vì $100/3 > 25$).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "V'(x)",
        func: "V(x)",
        x-vals: ($0$, $10$, $25$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $18000$, $0$)
      )
    ]
    - Dựa vào bảng biến thiên, thể tích hộp đạt giá trị lớn nhất khi $x = 10$ (cm).
    - Đáp số: 10.
  ]
)""",

    # 4. Min-max di chuyển (De 1 - replaced Tax)
    "Một doanh nghiệp độc quyền sản xuất một loại sản phẩm với hàm chi phí": r"""Một hòn đảo $C$ cách bờ biển thẳng đứng 3 km. Người ta muốn xây dựng một đường dây điện từ một trạm biến áp $A$ trên bờ biển đến hòn đảo $C$. Điểm $B$ trên bờ biển là hình chiếu vuông góc của $C$ lên bờ biển, khoảng cách $A B = 5$ km. Chi phí nối dây điện dưới nước là 50 triệu đồng/km và trên bờ là 30 triệu đồng/km. Người ta chọn một điểm $M$ trên đoạn $A B$ để nối dây từ $A$ đến $M$ (trên bờ) và từ $M$ đến $C$ (dưới nước). Tìm khoảng cách $A M$ (km) để tổng chi phí là nhỏ nhất?
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((0,0), (6,0), stroke: 2pt)
      line((5,0), (5,3), stroke: (dash: "dashed"))
      line((0,0), (3,0), stroke: red + 1.5pt)
      line((3,0), (5,3), stroke: blue + 1.5pt)
      
      content((0, -0.3), [$A$])
      content((5, -0.3), [$B$])
      content((5, 3.3), [$C$])
      content((3, -0.3), [$M$])
      content((1.5, 0.3), [30 tr/km])
      content((3.6, 1.8), [50 tr/km])
      content((5.4, 1.5), [3 km])
    })
  ]],
  [2.75],
  loigiai: [
    - Đặt $B M = x$ (km) với $0 <= x <= 5$. Khi đó $A M = 5 - x$.
    - Chiều dài đoạn cáp dưới nước $M C = sqrt(B M^2 + B C^2) = sqrt(x^2 + 9)$.
    - Tổng chi phí: $T(x) = 30(5 - x) + 50 sqrt(x^2 + 9)$ (triệu đồng).
    - Đạo hàm: $T'(x) = -30 + 50 x / sqrt(x^2 + 9)$.
    - Đặt $T'(x) = 0 <=> 50 x = 30 sqrt(x^2 + 9) <=> 25 x^2 = 9(x^2 + 9) <=> 16 x^2 = 81 <=> x = 9/4 = 2.25$.
    - Do $B M = 2.25$ nên $A M = 5 - 2.25 = 2.75$ (km).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "T'(x)",
        func: "T(x)",
        x-vals: ($0$, $2.25$, $5$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($300$, $270$, $50 sqrt(34)$)
      )
    ]
    - Chi phí nhỏ nhất khi $x = 2.25$, tức là điểm $M$ cách $A$ một khoảng $A M = 2.75$ km.
    - Đáp số: 2.75.
  ]
)""",

    # 5. Bể nước nắp hở (De 3 - replaced Real Estate)
    "Một chung cư cao cấp có 100 căn hộ cho thuê": r"""Một người thợ cần xây dựng một bể nước hình hộp chữ nhật không có nắp đậy, đáy là hình vuông. Bể cần có thể tích chứa được $32 \text{ m}^3$ nước. Biết chi phí mua vật liệu để xây đáy bể là 500 nghìn đồng/m², chi phí xây các thành bên là 250 nghìn đồng/m². Hỏi người thợ phải thiết kế cạnh đáy của bể bằng bao nhiêu mét để tổng chi phí mua vật liệu là nhỏ nhất?
  #align(center)[
    #sm-hop-chu-nhat(
      a: 4, b: 4, h: 3, 
      ten-dinh: ("", "", "", "", "", "", "", ""),
      them: (ctx, d) => {
        sm-diem(ctx, d.A, ten: "x", huong: "duoi")
        sm-diem(ctx, d.B, ten: "x", huong: "dong")
        sm-diem(ctx, sm-trung-diem(d.B, d.C), ten: "h", huong: "dong")
      }
    )
  ]],
  loigiai: [
    - Gọi $x$ (m) là cạnh đáy của bể ($x > 0$), và $h$ (m) là chiều cao của bể.
    - Thể tích của bể: $V = x^2 h = 32 => h = 32 / x^2$.
    - Diện tích đáy bể là $S_d = x^2$. Chi phí xây đáy: $500 x^2$ (nghìn đồng).
    - Bể có 4 mặt bên, mỗi mặt là hình chữ nhật kích thước $x times h$. Diện tích 4 mặt bên là $S_x = 4xh = 4x(32 / x^2) = 128 / x$. Chi phí xây mặt bên: $250 times 128 / x = 32000 / x$ (nghìn đồng).
    - Tổng chi phí vật liệu: $C(x) = 500 x^2 + 32000 / x$.
    - Đạo hàm: $C'(x) = 1000 x - 32000 / x^2 = (1000 x^3 - 32000) / x^2$.
    - Đặt $C'(x) = 0 <=> x^3 = 32 <=> x = 2 sqrt(3) 2 approx 3.17$, tuy nhiên bài toán này ta lấy căn bậc ba $x = root(3, 32) = 2 root(3, 4) approx 3.17$. (hoặc nếu số liệu khác để ra chẵn, ví dụ nếu $V = 32$ và chi phí bằng nhau thì $x=4$, ở đây $x = root(3, 32)$). Để kết quả chẵn, giả sử ta xét $V=32$, chi phí đáy $500$, chi phí vách $250$, $x^3 = 32 => x = 2 root(3,4)$. Thôi ta cứ giải chính xác $x = 2 root(3,4)$.
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "C'(x)",
        func: "C(x)",
        x-vals: ($0$, $root(3, 32)$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, "Min", $+oo$)
      )
    ]
    - Chi phí đạt giá trị nhỏ nhất khi $x = 2 root(3, 4)$ mét.
    - Đáp số: $2 root(3, 4)$.
  ]
)""",

    # 6. Cắt quạt gò nón (De 4 - replaced EOQ)
    "Một cửa hàng điện máy dự báo cần bán được 12.000 chiếc tivi": r"""Từ một mảnh tôn phẳng hình tròn bán kính $R = 1$ mét, người ta cắt bỏ một hình quạt tròn góc ở tâm $x$ (radian) rồi cuộn phần còn lại thành một chiếc phễu hình nón (không đáy). Ký hiệu $V(x)$ là thể tích của khối nón được tạo thành. Hỏi góc $x$ (radian) bằng bao nhiêu để phễu hình nón có thể tích lớn nhất?
  #align(center)[
    #cetz.canvas(length: 1.2cm, {
      import cetz.draw: *
      // Hình tròn bị cắt
      circle((0,0), radius: 2)
      line((0,0), (2,0))
      line((0,0), (1.414, 1.414))
      arc((0,0), start: 0deg, stop: 45deg, radius: 0.5)
      content((0.7, 0.3), [$x$])
      content((-2.5, 0), [Mảnh tôn])
      
      content((4, 0), [$\rightarrow$])
    })
    #sm-non(r: 1.5, h: 2, 
      them: (ctx, d) => {
        sm-diem(ctx, sm-trung-diem(d.O, d.A), ten: "r", huong: "tren")
        sm-diem(ctx, sm-trung-diem(d.S, d.O), ten: "h", huong: "tay")
        sm-diem(ctx, sm-trung-diem(d.S, d.B), ten: "R", huong: "dong")
      }
    )
  ]],
  (
    [$x = 2pi(1 - sqrt(2/3))$],
    True([$x = 2pi(1 - sqrt(2/3))$]),
    [$x = pi/2$],
    [$x = pi$]
  ),
  loigiai: [
    - Phần hình quạt dùng để gò nón có góc ở tâm là $2pi - x$. 
    - Chiều dài cung tròn của phần quạt này là chu vi đáy của hình nón: $l = R(2pi - x) = 2pi - x$ (vì $R = 1$).
    - Bán kính đáy của hình nón là $r = l / (2pi) = (2pi - x) / (2pi) = 1 - x / (2pi)$. Đặt $r$ làm biến số ($0 < r < 1$). Khi đó đường sinh của nón chính là bán kính $R = 1$ của hình tròn ban đầu.
    - Chiều cao của hình nón: $h = sqrt(R^2 - r^2) = sqrt(1 - r^2)$.
    - Thể tích khối nón: $V(r) = 1/3 pi r^2 h = 1/3 pi r^2 sqrt(1 - r^2)$.
    - Xét hàm $f(r) = r^4 (1 - r^2) = r^4 - r^6$ trên khoảng $(0, 1)$.
    - $f'(r) = 4r^3 - 6r^5 = 2r^3(2 - 3r^2)$. Đặt $f'(r) = 0 <=> r^2 = 2/3 <=> r = sqrt(2/3)$.
    - Khi đó thể tích lớn nhất đạt được. Góc ở tâm $x$ tương ứng là:
      $1 - x / (2pi) = sqrt(2/3) <=> x = 2pi(1 - sqrt(2/3))$.
    - Đáp án đúng là $x = 2pi(1 - sqrt(2/3))$.
  ]
)""",

    # 7. Hình trụ hộp sữa (De 5 - replaced Fishery)
    "Một hồ cá thương mại có hàm sinh trưởng của quần thể cá được mô hình hóa theo phương trình Logistic": r"""Một công ty muốn sản xuất các lon đựng sữa hình trụ có thể tích $V = 330 \text{ ml} = 330 \text{ cm}^3$. Chi phí nguyên vật liệu để làm hai mặt đáy là 40 đồng/cm², và chi phí để làm thân lon là 20 đồng/cm². Để chi phí sản xuất lon là thấp nhất, bán kính đáy $R$ của lon (cm) phải xấp xỉ bằng bao nhiêu? (Làm tròn đến 2 chữ số thập phân).],
  (
    [2.35 cm],
    True([2.97 cm]),
    [3.12 cm],
    [4.05 cm]
  ),
  loigiai: [
    #align(center)[
      #sm-tru(r: 1.5, h: 3)
    ]
    - Gọi $R$ và $h$ lần lượt là bán kính đáy và chiều cao của hình trụ ($R, h > 0$).
    - Thể tích khối trụ: $V = pi R^2 h = 330 <=> h = 330 / (pi R^2)$.
    - Diện tích toàn phần để tính chi phí gồm 2 đáy và mặt xung quanh:
      + Diện tích hai đáy: $S_d = 2 pi R^2$. Chi phí làm đáy: $40 times 2 pi R^2 = 80 pi R^2$ (đồng).
      + Diện tích xung quanh: $S_"xq" = 2 pi R h$. Chi phí làm thân: $20 times 2 pi R h = 40 pi R h = 40 pi R (330 / (pi R^2)) = 13200 / R$ (đồng).
    - Tổng chi phí: $C(R) = 80 pi R^2 + 13200 / R$.
    - Đạo hàm: $C'(R) = 160 pi R - 13200 / R^2 = (160 pi R^3 - 13200) / R^2$.
    - Đặt $C'(R) = 0 <=> 160 pi R^3 = 13200 <=> R^3 = 13200 / (160 pi) = 82.5 / pi$.
    - Suy ra $R = root(3, 82.5 / pi) approx 2.97$ (cm).
    - Đáp án là 2.97 cm.
  ]
)"""
}

# Apply to all files
for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    out_content = ""
    i = 0
    while i < len(content):
        match = re.search(r'#(?:tn|tln)\(\[', content[i:])
        if not match:
            out_content += content[i:]
            break
        
        start_idx = i + match.start()
        out_content += content[i:start_idx]
        
        paren_count = 0
        end_idx = start_idx
        for j in range(start_idx, len(content)):
            if content[j] == '(':
                paren_count += 1
            elif content[j] == ')':
                paren_count -= 1
                if paren_count == 0:
                    end_idx = j + 1
                    break
        
        block_content = content[start_idx:end_idx]
        
        replaced = False
        for old_text, new_text in replacements.items():
            if old_text in block_content:
                block_type = match.group(0)
                # Note: new_text does NOT include the `#tln([` or `#tn([` prefix, so we prepend block_type.
                out_content += block_type + new_text
                replaced = True
                break
                
        if not replaced:
            out_content += block_content
            
        i = end_idx

    if out_content != content:
        with open(path, "w") as fw:
            fw.write(out_content)
        print(f"Replaced modeling questions with geometric problems in {path}")

