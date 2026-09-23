import re
import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")

replacements = {
    # 1. Tax problem (replacing in de-1)
    "Có bao nhiêu giá trị nguyên của tham số $m$ thuộc đoạn": r"""Một doanh nghiệp độc quyền sản xuất một loại sản phẩm với hàm chi phí $C(Q) = Q^2 + 10Q + 50$, trong đó $Q$ là số lượng sản phẩm (đơn vị: nghìn chiếc) và $C$ tính bằng triệu đồng. Hàm cầu của thị trường đối với sản phẩm này là $P(Q) = -2Q + 70$, với $P$ là giá bán (triệu đồng/nghìn chiếc). Giả sử chính phủ đánh thuế $t = 10$ triệu đồng trên mỗi nghìn sản phẩm bán ra. Mức sản lượng $Q$ nào (nghìn chiếc) sẽ tối đa hóa lợi nhuận sau thuế của doanh nghiệp?],
  loigiai: [
    - Doanh thu: $R(Q) = P(Q) times Q = (-2Q + 70)Q = -2Q^2 + 70Q$.
    - Lợi nhuận trước thuế: $pi_0(Q) = R(Q) - C(Q) = -2Q^2 + 70Q - (Q^2 + 10Q + 50) = -3Q^2 + 60Q - 50$.
    - Tổng tiền thuế phải nộp: $T = t times Q = 10Q$.
    - Lợi nhuận sau thuế: $pi(Q) = pi_0(Q) - T = -3Q^2 + 60Q - 50 - 10Q = -3Q^2 + 50Q - 50$.
    - Điều kiện: $Q > 0$.
    - Đạo hàm: $pi'(Q) = -6Q + 50$.
    - Đặt $pi'(Q) = 0 <=> -6Q + 50 = 0 <=> Q = 50/6 = 25/3 approx 8.33$.
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "Q",
        der: "$pi'(Q)$",
        func: "$pi(Q)$",
        x-vals: ($0$, $25/3$, $+oo$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($-50$, $475/3$, $-oo$)
      )
    ]
    - Dựa vào bảng biến thiên, lợi nhuận sau thuế đạt giá trị lớn nhất khi mức sản lượng $Q = 25/3 approx 8.33$ nghìn chiếc.
    - Đáp số: 8.33.
  ]
)""",

    # 2. Real Estate problem (replacing in de-3)
    "Tìm giá trị của tham số $m$ để tiệm cận xiên của đồ thị": r"""Một chung cư cao cấp có 100 căn hộ cho thuê. Nếu giá thuê mỗi căn hộ là 5 triệu đồng/tháng thì tất cả 100 căn hộ đều được thuê hết. Cứ mỗi lần tăng giá thuê thêm 200 nghìn đồng/tháng thì sẽ có 1 căn hộ bị bỏ trống. Biết rằng chi phí bảo trì, dọn dẹp cho mỗi căn hộ được thuê là 500 nghìn đồng/tháng (căn hộ trống không mất chi phí này). Ban quản lý chung cư cần đặt giá thuê mỗi căn hộ là bao nhiêu triệu đồng/tháng để thu được lợi nhuận cao nhất?],
  loigiai: [
    - Gọi $x$ là số lần tăng giá thuê thêm 200 nghìn đồng ($x > 0$).
    - Giá thuê mỗi căn hộ khi đó là: $P(x) = 5 + 0.2x$ (triệu đồng/tháng).
    - Số căn hộ được thuê là: $N(x) = 100 - x$ (căn). Điều kiện $0 < x < 100$.
    - Chi phí bảo trì tổng cộng: $C(x) = 0.5 times (100 - x)$ (triệu đồng).
    - Doanh thu: $R(x) = P(x) times N(x) = (5 + 0.2x)(100 - x) = 500 - 5x + 20x - 0.2x^2 = -0.2x^2 + 15x + 500$.
    - Lợi nhuận: $L(x) = R(x) - C(x) = (-0.2x^2 + 15x + 500) - (50 - 0.5x) = -0.2x^2 + 15.5x + 450$.
    - Đạo hàm: $L'(x) = -0.4x + 15.5$.
    - Đặt $L'(x) = 0 <=> 0.4x = 15.5 <=> x = 38.75$.
    - Vì $x$ là số căn hộ trống nên $x$ phải nguyên. Ta tính hai giá trị lân cận $x = 38$ và $x = 39$.
      - Với $x = 38$: $L(38) = -0.2(38)^2 + 15.5(38) + 450 = 750.2$ triệu.
      - Với $x = 39$: $L(39) = -0.2(39)^2 + 15.5(39) + 450 = 750.3$ triệu.
    - Lợi nhuận lớn nhất khi $x = 39$.
    - Giá thuê tương ứng: $P(39) = 5 + 0.2(39) = 5 + 7.8 = 12.8$ (triệu đồng/tháng).
    - Đáp số: 12.8.
  ]
)"""
}

for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    out_content = ""
    i = 0
    replaced_any = False
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
                replaced_any = True
                break
                
        if not replaced:
            out_content += block_content
            
        i = end_idx

    if replaced_any and out_content != content:
        with open(path, "w") as fw:
            fw.write(out_content)
        print(f"Replaced missed questions in {path}")

