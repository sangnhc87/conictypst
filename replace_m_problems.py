import re
import glob

# Mapping old text snippets to the new replacement (full #tn or #tln block with solution)
replacements = {
    # 1. Tax problem (replacing in de-1)
    "Có bao nhiêu giá trị nguyên của tham số $m$ thuộc đoạn $[-10; 10]$ để hàm số $y = x^3 - 3m x^2 + 3(m^2 - 1)x + 2$ đồng biến trên khoảng $(2; +oo)$?": r"""Một doanh nghiệp độc quyền sản xuất một loại sản phẩm với hàm chi phí $C(Q) = Q^2 + 10Q + 50$, trong đó $Q$ là số lượng sản phẩm (đơn vị: nghìn chiếc) và $C$ tính bằng triệu đồng. Hàm cầu của thị trường đối với sản phẩm này là $P(Q) = -2Q + 70$, với $P$ là giá bán (triệu đồng/nghìn chiếc). Giả sử chính phủ đánh thuế $t = 10$ triệu đồng trên mỗi nghìn sản phẩm bán ra. Mức sản lượng $Q$ nào (nghìn chiếc) sẽ tối đa hóa lợi nhuận sau thuế của doanh nghiệp?],
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
    "Tìm giá trị của tham số $m$ để tiệm cận xiên của đồ thị hàm số $y = (x^2 + (m+1)x + 2)/(x - 1)$ đi qua điểm $A(2; 6)$.": r"""Một chung cư cao cấp có 100 căn hộ cho thuê. Nếu giá thuê mỗi căn hộ là 5 triệu đồng/tháng thì tất cả 100 căn hộ đều được thuê hết. Cứ mỗi lần tăng giá thuê thêm 200 nghìn đồng/tháng thì sẽ có 1 căn hộ bị bỏ trống. Biết rằng chi phí bảo trì, dọn dẹp cho mỗi căn hộ được thuê là 500 nghìn đồng/tháng (căn hộ trống không mất chi phí này). Ban quản lý chung cư cần đặt giá thuê mỗi căn hộ là bao nhiêu triệu đồng/tháng để thu được lợi nhuận cao nhất?],
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
)""",

    # 3. EOQ problem (replacing in de-4)
    "Tìm tất cả các giá trị của $m$ để hàm số nghịch biến trên $RR$.": r"""Một cửa hàng điện máy dự báo cần bán được 12.000 chiếc tivi trong năm tới. Cửa hàng nhập hàng từ một nhà máy với chi phí mỗi lần đặt hàng (bất kể số lượng) là 2 triệu đồng. Chi phí để lưu kho một chiếc tivi trong một năm là 300 nghìn đồng (0.3 triệu đồng). Biết rằng tốc độ tiêu thụ tivi là đều đặn quanh năm. Để tổng chi phí (gồm chi phí đặt hàng và chi phí lưu kho) trong năm là nhỏ nhất, cửa hàng nên nhập bao nhiêu chiếc tivi mỗi lần đặt hàng?],
  (
    [200 chiếc],
    [300 chiếc],
    True([400 chiếc]),
    [500 chiếc]
  ),
  loigiai: [
    - Đặt $x$ là số lượng tivi nhập mỗi lần đặt hàng ($x > 0$).
    - Số lần đặt hàng trong năm: $n = 12000 / x$.
    - Tổng chi phí đặt hàng trong năm: $C_d = n times 2 = 24000 / x$ (triệu đồng).
    - Vì tiêu thụ đều đặn nên lượng hàng lưu kho trung bình trong năm là $x/2$. Tổng chi phí lưu kho: $C_k = 0.3 times x/2 = 0.15x$ (triệu đồng).
    - Tổng chi phí: $C(x) = C_d + C_k = 24000 / x + 0.15x$.
    - Đạo hàm: $C'(x) = -24000 / x^2 + 0.15$.
    - Đặt $C'(x) = 0 <=> 0.15 = 24000 / x^2 <=> x^2 = 24000 / 0.15 = 160000 <=> x = 400$.
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "C'(x)",
        func: "C(x)",
        x-vals: ($0$, $400$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $"Min"$, $+oo$)
      )
    ]
    - Dựa vào bảng biến thiên, chi phí nhỏ nhất đạt được khi mỗi lần nhập 400 chiếc tivi.
    - Đáp án: 400 chiếc.
  ]
)""",

    # 4. Fishery problem (replacing in de-5)
    "Tìm giá trị của $m$ để hàm số đồng biến trên các khoảng xác định.": r"""Một hồ cá thương mại có hàm sinh trưởng của quần thể cá được mô hình hóa theo phương trình Logistic: $G(P) = 0.2P(1 - P/1000)$, trong đó $P$ là khối lượng cá hiện có trong hồ (tấn), $G(P)$ là tốc độ gia tăng khối lượng cá tự nhiên (tấn/năm). Nếu hồ cá duy trì khối lượng cá ở mức $P$ ổn định, lượng cá được đánh bắt hàng năm chính bằng tốc độ gia tăng $G(P)$. Hỏi chủ hồ cá nên duy trì khối lượng cá trong hồ ở mức bao nhiêu tấn để sản lượng đánh bắt hàng năm là lớn nhất?],
  (
    [400 tấn],
    True([500 tấn]),
    [600 tấn],
    [750 tấn]
  ),
  loigiai: [
    - Sản lượng đánh bắt hàng năm bằng tốc độ gia tăng tự nhiên: $Y(P) = G(P) = 0.2P(1 - P/1000)$.
    - Khai triển hàm số: $Y(P) = 0.2P - 0.0002P^2$.
    - Đạo hàm: $Y'(P) = 0.2 - 0.0004P$.
    - Đặt $Y'(P) = 0 <=> 0.2 = 0.0004P <=> P = 0.2 / 0.0004 = 500$.
    - Hàm số $Y(P)$ là một parabol quay bề lõm xuống dưới (hệ số $a = -0.0002 < 0$) nên đạt giá trị lớn nhất tại đỉnh parabol $P = 500$.
    - Khi đó sản lượng đánh bắt lớn nhất là $Y(500) = 0.2(500)(1 - 500/1000) = 100(1 - 0.5) = 50$ (tấn/năm).
    - Khối lượng cá cần duy trì trong hồ là 500 tấn.
    - Đáp án đúng là 500 tấn.
  ]
)""",

    # 5. Price ticket / airline problem (replacing in de-6, 7, 8, 9, 10)
    "Đường thẳng $y = m$ cắt đồ thị tại 3 điểm phân biệt khi $m$ thuộc khoảng $(-a; a)$. Giá trị $a$ bằng bao nhiêu?": r"""Một hãng hàng không quy định giá vé khứ hồi cho một tuyến đường bay là 4 triệu đồng/vé. Với giá vé này, mỗi chuyến bay luôn có 120 hành khách. Hãng khảo sát và thấy rằng, cứ giảm giá vé 100 nghìn đồng thì số lượng hành khách trên chuyến bay sẽ tăng thêm 5 người. Tuy nhiên, chuyến bay chỉ có tối đa 200 ghế. Hãng hàng không nên bán vé với giá bao nhiêu (triệu đồng) để doanh thu của mỗi chuyến bay là lớn nhất?],
  loigiai: [
    - Gọi $x$ là số lần giảm giá vé 100 nghìn đồng (hay $0.1$ triệu đồng) ($x >= 0$).
    - Giá vé mới: $P(x) = 4 - 0.1x$ (triệu đồng).
    - Số hành khách dự kiến: $N(x) = 120 + 5x$.
    - Điều kiện về số ghế: $N(x) <= 200 <=> 120 + 5x <= 200 <=> 5x <= 80 <=> x <= 16$.
    - Doanh thu: $R(x) = P(x) times N(x) = (4 - 0.1x)(120 + 5x) = 480 + 20x - 12x - 0.5x^2 = -0.5x^2 + 8x + 480$.
    - Đạo hàm: $R'(x) = -x + 8$.
    - Đặt $R'(x) = 0 <=> x = 8$ (thỏa mãn điều kiện $0 <= x <= 16$).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "R'(x)",
        func: "R(x)",
        x-vals: ($0$, $8$, $16$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($480$, $512$, $480$)
      )
    ]
    - Dựa vào bảng biến thiên, doanh thu lớn nhất đạt được khi $x = 8$.
    - Khi đó, mức giảm giá là $8 times 0.1 = 0.8$ triệu đồng.
    - Giá vé cần bán để đạt doanh thu lớn nhất là: $4 - 0.8 = 3.2$ triệu đồng.
    - Đáp số: 3.2.
  ]
)"""
}

# Apply to all files
files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")
for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    new_content = content
    for old_text, new_text in replacements.items():
        if old_text in new_content:
            # We need to replace the whole question block. 
            # Easiest is to find the index of old_text, then trace back to `#tn` or `#tln` and forward to `)`
            
            # Since the user requested removing "m" questions, replacing the text snippet AND its choices/solution is tricky
            # Instead of regex, I will just find `#tn([` or `#tln([` containing the old_text.
            pattern = re.compile(r'#(?:tn|tln)\(\[\s*' + re.escape(old_text) + r'.*?(?:loigiai:\s*\[.*?\]\s*\)?\n)', re.DOTALL)
            
            # If pattern doesn't match directly because old_text is just part of it:
            # We can use a simpler approach: 
            # find all `#tn(` or `#tln(` blocks, check if `old_text` is in them, and replace the whole block.
            
    # Custom block replacer
    blocks = re.split(r'(#(?:tn|tln)\(\[)', new_content)
    # blocks will be: [text, '#tn([', block_content, text, '#tln([', block_content, ...]
    # wait, re.split with group keeps the delimiter. But we need to find the matching ')' for the block.
    # Let's do it manually.
    
    out_content = ""
    i = 0
    while i < len(new_content):
        # Find next `#tn([` or `#tln([`
        match = re.search(r'#(?:tn|tln)\(\[', new_content[i:])
        if not match:
            out_content += new_content[i:]
            break
        
        start_idx = i + match.start()
        out_content += new_content[i:start_idx]
        
        # Now find the end of this block by counting parentheses
        paren_count = 0
        end_idx = start_idx
        for j in range(start_idx, len(new_content)):
            if new_content[j] == '(':
                paren_count += 1
            elif new_content[j] == ')':
                paren_count -= 1
                if paren_count == 0:
                    end_idx = j + 1
                    break
        
        block_content = new_content[start_idx:end_idx]
        
        # Check if block contains any of the old texts
        replaced = False
        for old_text, new_text in replacements.items():
            if old_text in block_content:
                # Replace the whole block!
                # Wait, new_text doesn't have the starting `#tn([` or `#tln([`, I need to keep the type.
                block_type = match.group(0) # `#tn([` or `#tln([`
                out_content += block_type + new_text
                replaced = True
                break
                
        if not replaced:
            out_content += block_content
            
        i = end_idx

    if out_content != content:
        with open(path, "w") as fw:
            fw.write(out_content)
        print(f"Replaced 'm' parameter questions in {path}")

