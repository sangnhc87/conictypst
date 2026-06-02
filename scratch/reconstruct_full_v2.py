filepath = "CD-min-2-DuongTron-ChuyenSau.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

start_marker = "làm giảm số lượng biến số và phép tính căn thức."
end_marker = "    - *Quy trình giải tổng quát bằng đạo hàm một biến:*"

start_idx = content.find(start_marker)
end_idx = content.find(end_marker)

if start_idx != -1 and end_idx != -1:
    # We want to keep the start_marker, so start replacing after it
    replace_start = start_idx + len(start_marker)
    
    # We want to keep the end_marker, so replace up to its start
    replace_end = end_idx
    
    middle_content = """
          2. *Bán kính và tham số hóa:* Nên chọn chiếu điểm từ đường tròn có bán kính lớn hơn (hoặc dễ tham số hóa hơn) sang mặt phẳng chứa đường tròn nhỏ hơn, giúp việc lấy hiệu hai bán kính $|M_p J_2 - R_2|$ trong Pytago không bị vấp phải dấu trị tuyệt đối phức tạp khi biến đổi đạo hàm.

3. *Phương pháp đạo hàm & Công thức khoảng cách tổng quát (Giải pháp vạn năng bằng Casio/Đạo hàm):*
   Trong phòng thi trắc nghiệm, nếu không muốn dựng hình chiếu phức tạp, ta có thể thiết lập trực tiếp hàm số khoảng cách một biến số bằng cách sử dụng *Công thức khoảng cách vạn năng từ một điểm $M$ bất kỳ đến đường tròn $(C_2)$* có tâm $J_2$, bán kính $R_2$ nằm trên mặt phẳng $(P_2)$:
   - Xét tam giác vuông $M M_p J_2$ tại hình chiếu $M_p$ của $M$ trên $(P_2)$, ta có hệ thức Pytago liên kết:
     $ M J_2^2 = M M_p^2 + M_p J_2^2 = d(M, P_2)^2 + M_p J_2^2 $
     $ => M_p J_2 = sqrt(M J_2^2 - d(M, P_2)^2) $
   - Khoảng cách từ $M$ đến đường tròn $(C_2)$ trong mặt phẳng $(P_2)$ là:
     $ d(M, (C_2)) = sqrt(d(M, P_2)^2 + (M_p J_2 - R_2)^2) $
     $ = sqrt(d(M, P_2)^2 + M_p J_2^2 - 2 R_2 M_p J_2 + R_2^2) $
     Thế biểu thức $M_p J_2$ ở trên vào, ta có công thức rút gọn vạn năng:
     $ d(M, (C_2)) = sqrt(M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2)) $

    #align(center)[
      #block(stroke: 0.5pt + rgb("aaaaaa"), radius: 5pt, inset: 12pt, width: 95%)[
        #text(weight: "bold", fill: rgb("1A5276"))[Chứng minh hình học sư phạm của Công thức vạn năng:] \\
        #v(0.5em)
        Gọi $M_p$ là hình chiếu vuông góc của điểm $M$ xuống mặt phẳng $(P_2)$ chứa đường tròn $(C_2)$. 
        Do đó, đường thẳng $M M_p$ vuông góc với mặt phẳng $(P_2)$, dẫn tới $M M_p perp M_p J_2$ và $M M_p perp M_p N$. Ta có hai tam giác vuông không gian tại $M_p$:

        1. *Trong tam giác vuông $triangle M M_p J_2$ tại $M_p$:*
           $ M_p J_2^2 = M J_2^2 - M M_p^2 = M J_2^2 - d(M, P_2)^2 \\ => M_p J_2 = sqrt(M J_2^2 - d(M, P_2)^2) $
           Đây chính là khoảng cách phẳng từ hình chiếu $M_p$ đến tâm đường tròn $J_2$.

        2. *Trên mặt phẳng $(P_2)$ chứa đường tròn $(C_2)$:*
           Điểm $N$ thuộc đường tròn $(C_2)$ (bán kính $R_2$) gần $M_p$ nhất nằm trên đoạn thẳng nối $M_p$ và tâm $J_2$. Khi đó khoảng cách phẳng ngắn nhất là:
           $ M_p N = |M_p J_2 - R_2| $

        3. *Trong tam giác vuông không gian $triangle M M_p N$ tại $M_p$:*
           Bình phương khoảng cách không gian từ $M$ đến đường tròn $(C_2)$ là:
           $ d(M, (C_2))^2 = M N^2 = M M_p^2 + M_p N^2 = d(M, P_2)^2 + (M_p J_2 - R_2)^2 $
           Thế công thức $M_p J_2$ từ bước 1 vào:
           $ M N^2 = d(M, P_2)^2 + (sqrt(M J_2^2 - d(M, P_2)^2) - R_2)^2 $
           $ = d(M, P_2)^2 + (M J_2^2 - d(M, P_2)^2) + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
           $ = M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2) $
           
           Nhờ sự triệt tiêu tuyệt vời của chiều cao $d(M, P_2)^2$, ta thu được **Công thức vạn năng**:
           $ d(M, (C_2)) = sqrt(M J_2^2 + R_2^2 - 2 R_2 sqrt(M J_2^2 - d(M, P_2)^2)) $

        #v(1em)
        #cetz.canvas(length: 0.90cm, {
          import cetz.draw: *
          let prj(x, y, z) = { (y - 0.5 * x, z + 0.35 * x) }
          
          let Mp = (0, 0, 0)
          let J2 = (0, 4.5, 0)
          let N = (0, 3.0, 0)
          let M = (0, 0, 3.5)
          
          let pA = prj(-2.5, -1.5, 0)
          let pB = prj(-2.5, 7.0, 0)
          let pC = prj(2.5, 7.0, 0)
          let pD = prj(2.5, -1.5, 0)
          
          // Draw plane P2
          line(pA, pB, pC, pD, close: true, fill: rgb("fef08a15"), stroke: 0.5pt + rgb("#ca8a04"))
          content(prj(2.5, 6.2, 0), [$(P_2)$], anchor: "south-east", padding: 2pt)
          
          // Draw circle C2 as ellipse
          let pts = range(0, 365, step: 5).map(theta => prj(1.5 * calc.cos(theta * 1deg), 4.5 + 1.5 * calc.sin(theta * 1deg), 0))
          line(..pts, stroke: 1.2pt + rgb("#dc2626"))
          
          // Center J2
          circle(prj(0, 4.5, 0), radius: 1.5pt, fill: black)
          content(prj(0, 4.5, 0), [$J_2$], anchor: "north", padding: 4pt)
          
          // Projection Mp
          circle(prj(0, 0, 0), radius: 1.5pt, fill: black)
          content(prj(0, 0, 0), [$M_p$], anchor: "south-east", padding: 3pt)
          
          // Space point M
          circle(prj(0, 0, 3.5), radius: 1.8pt, fill: rgb("#16a34a"))
          content(prj(0, 0, 3.5), [$M$], anchor: "south", padding: 3pt)
          
          // Boundary point N
          circle(prj(0, 3.0, 0), radius: 1.8pt, fill: rgb("#dc2626"))
          content(prj(0, 3.0, 0), [$N$], anchor: "north-west", padding: 2pt)
          
          // Height line (height of M)
          line(prj(0, 0, 3.5), prj(0, 0, 0), stroke: (dash: "dashed", paint: rgb("#6366f1")), name: "height")
          content("height.mid", [$d(M, P_2)$], anchor: "east", padding: 3pt)
          
          // Base line MpJ2
          line(prj(0, 0, 0), prj(0, 4.5, 0), stroke: (dash: "dashed", paint: rgb("#6366f1")), name: "base")
          
          // Line MJ2
          line(prj(0, 0, 3.5), prj(0, 4.5, 0), stroke: (dash: "dotted", paint: gray), name: "hypot")
          content("hypot.mid", [$M J_2$], anchor: "south-west", padding: 2pt)
          
          // Space distance MN
          line(prj(0, 0, 3.5), prj(0, 3.0, 0), stroke: 2pt + rgb("#ea580c"), name: "dist")
          content("dist.mid", [$d(M, (C_2))$], anchor: "south-west", padding: 2pt)
          
          // Flat distance MpN
          line(prj(0, 0, 0), prj(0, 3.0, 0), stroke: (dash: "dashed", paint: rgb("#ea580c")), name: "base_n")
          
          // Radius R2
          content(prj(0, 3.75, 0), [$R_2$], anchor: "south", padding: 2pt)
          
          // 3D Right angle symbol at Mp
          let sq = 0.22
          line(prj(0, sq, 0), prj(0, sq, sq), prj(0, 0, sq), stroke: 0.5pt + gray)
          line(prj(sq, 0, 0), prj(sq, 0, sq), prj(0, 0, sq), stroke: 0.5pt + gray)
        })
      ]
    ]

"""
    content = content[:replace_start] + middle_content + content[replace_end:]
    print("Reconstructed successfully!")
else:
    print(f"Error: start={start_idx}, end={end_idx}")

# Also let's run all the terminology replacements in the reconstructed file
replacements = [
    (
        '2. *Phương pháp chiếu vuông góc và phân rã Pytago (Cho trường hợp hai mặt phẳng chéo nhau, vuông góc hoặc nghiêng):*\\n   Khi mặt phẳng chứa hai đường tròn cắt nhau (góc giữa hai mặt phẳng bằng $alpha$):',
        '2. *Phương pháp chiếu vuông góc và phân rã Pytago (Cho trường hợp hai đường tròn chéo nhau, nằm trên hai mặt phẳng cắt nhau hoặc vuông góc):*\\n   Khi hai mặt phẳng chứa hai đường tròn cắt nhau (góc giữa hai mặt phẳng bằng $alpha$):'
    ),
    (
        'Đây là bài toán cực trị khoảng cách giữa hai đường tròn nằm trên hai mặt đứng vuông góc và chéo nhau trong không gian. Ta áp dụng phương pháp quy giản hình học về tâm $J_2$ để tính toán nhanh gọn và chính xác.',
        'Đây là bài toán cực trị khoảng cách giữa hai đường tròn ở vị trí chéo nhau trong không gian, nằm trên hai mặt đứng vuông góc nhau. Ta áp dụng phương pháp quy giản hình học về tâm $J_2$ để tính toán nhanh gọn và chính xác.'
    ),
    (
        'Đây là cấu hình hai đường tròn nằm trên hai mặt phẳng vuông góc chéo nhau (lệch trục) ở dạng tổng quát. Ta áp dụng phương pháp quy giản khoảng cách về tâm $J_2$ của đường tròn $(C_2)$ để giải quyết nhanh chóng bài toán.',
        'Đây là cấu hình hai đường tròn nằm trên hai mặt phẳng vuông góc, lệch trục (hai đường tròn ở vị trí chéo nhau trong không gian) ở dạng tổng quát. Ta áp dụng phương pháp quy giản khoảng cách về tâm $J_2$ của đường tròn $(C_2)$ để giải quyết nhanh chóng bài toán.'
    ),
    (
        'Với cấu hình hai mặt phẳng chéo nhau góc $60^o$, ta dùng phương pháp lượng giác hóa để tham số tọa độ điểm $M in (C_1)$ và áp dụng phương pháp quy giản về tâm đường tròn $J_2$ để tính khoảng cách cực tiểu dễ dàng.',
        'Với cấu hình hai mặt phẳng cắt nhau tạo thành góc $60^o$ chứa hai đường tròn chéo nhau, ta dùng phương pháp lượng giác hóa để tham số tọa độ điểm $M in (C_1)$ và áp dụng phương pháp quy giản về tâm đường tròn $J_2$ để tính khoảng cách cực tiểu dễ dàng.'
    ),
    (
        'Trục của đường tròn thứ nhất song song với trục $O y$, trục của đường tròn thứ hai song song với trục $O x$. Đường thẳng nối hai tâm $J_1 J_2$ song song với trục $O y$, vuông góc với cả hai mặt phẳng chéo nhau chứa hai đường tròn. Đây chính là đoạn vuông góc chung của hệ thống.',
        'Trục của đường tròn thứ nhất song song với trục $O y$, trục của đường tròn thứ hai song song với trục $O x$. Đây là bài toán cực trị khoảng cách giữa hai đường tròn ở vị trí chéo nhau nằm trên hai mặt phẳng vuông góc.'
    ),
    (
        'Với cấu hình đồng phẳng chéo nhau hoặc rời nhau (tiếp xúc ngoài), khoảng cách cực đại giữa hai điểm đạt được khi hai điểm nằm thẳng hàng với hai tâm và ở phía đối diện xa nhất ngoài cùng:',
        'Với cấu hình đồng phẳng ngoài nhau hoặc tiếp xúc ngoài, khoảng cách cực đại giữa hai điểm đạt được khi hai điểm nằm thẳng hàng với hai tâm và ở phía đối diện xa nhất ngoài cùng:'
    ),
    (
        'tại các giao điểm $K_1, K_2$ của hai đường tròn).',
        'tại các giao điểm $K_1, K_2$ của hai đường tròn hình chiếu).'
    )
]

for old, new in replacements:
    old_raw = old.replace("\\n", "\n")
    new_raw = new.replace("\\n", "\n")
    if old_raw in content:
        content = content.replace(old_raw, new_raw)
        print(f"Replaced terminology successfully!")
    else:
        if old in content:
            content = content.replace(old, new)
            print(f"Replaced terminology successfully!")
        else:
            print(f"Warning: terminology block not found:\n{old[:50]}...")

with open(filepath, "w", encoding="utf-8") as f:
    f.write(content)
print("Finished patching file!")
