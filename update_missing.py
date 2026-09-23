import re
import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")

replacements = {
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
    - Đặt $C'(x) = 0 <=> x^3 = 32 <=> x = root(3, 32) = 2 root(3, 4) approx 3.17$.
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
                out_content += block_type + new_text
                replaced = True
                break
                
        if not replaced:
            out_content += block_content
            
        i = end_idx

    if out_content != content:
        with open(path, "w") as fw:
            fw.write(out_content)
        print(f"Replaced missed modeling questions in {path}")

