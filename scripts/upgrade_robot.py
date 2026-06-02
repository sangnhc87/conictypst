import re

with open('/Users/admin/conictypst/typst/exams/Cánh-Tay-Robot.typ', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update Title
content = content.replace(
    'title: "CHUYÊN ĐỀ: Cánh Tay Robot"',
    'title: "CHUYÊN ĐỀ TRỌNG ĐIỂM 2026: TOÁN THỰC TẾ & MÔ HÌNH CÁNH TAY ROBOT"'
)

# 2. Update Header Box
header_old = """  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      CHUYÊN ĐỀ: CÁNH TAY ROBOT VÀ ĐOẠN GẤP KHÚC
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Mô hình hóa khớp nối cơ khí bằng tam giác, đường cao và bất đẳng thức tam giác.
    ]
  ]"""
header_new = """  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      DỰ ĐOÁN XU HƯỚNG ĐỀ THI 2026: TOÁN THỰC TẾ & MÔ HÌNH CÁNH TAY ROBOT
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Tích hợp kiến thức Hệ Thức Lượng, Tối Ưu Hóa (Đạo hàm), và Hình Học Không Gian (Oxyz) qua lăng kính Vật Lý - Cơ Khí.
    ]
  ]"""
content = content.replace(header_old, header_new)

# 3. Insert "Xu Hướng Đề Thi" section after the align center block
insert_pos = content.find("= Khung Đọc Hình Và Ý Tưởng Giải")
if insert_pos != -1:
    trend_section = """= Xu Hướng Đề Thi 2026: Tại Sao Lại Là Cánh Tay Robot?

#lythuyet[
  Đề thi THPT Quốc Gia từ năm 2025 bắt đầu chuyển mình mạnh mẽ sang định hướng đánh giá năng lực STEM và khả năng áp dụng Toán học vào đời sống. Đến năm 2026, dự đoán **Bài Toán Mô Hình Hóa Cơ Khí (Đặc biệt là Cánh Tay Robot)** sẽ trở thành "cú đấm thép" phân loại học sinh ở các mốc 8+, 9+.

  *Tại sao mô hình này lại được người ra đề ưa chuộng?*
  - **Tích hợp đa tư duy:** Một bài toán tay robot phẳng kiểm tra cùng lúc Định lý Cosin, Sin, Bất đẳng thức tam giác và Cực trị hàm số.
  - **Chống bấm máy (Casio):** Học sinh không thể dùng thủ thuật Casio nếu không tự mình mô hình hóa được đại lượng cần tối ưu (thường là góc, cạnh, khoảng cách tới mặt sàn).
  - **Khả năng mở rộng linh hoạt:** Từ không gian 2D (robot phẳng) có thể dễ dàng đẩy lên 3D (Oxyz, tọa độ hóa, mặt cầu, góc nhị diện, quỹ đạo giao tuyến không gian).
]

"""
    content = content[:insert_pos] + trend_section + content[insert_pos:]

# 4. Update `#ppgiai` blocks to have "Note Idea Giải" and add styling to Cetz
content = content.replace('= Khung Đọc Hình Và Ý Tưởng Giải', '= Khung Đọc Hình Và Ý Tưởng Giải Chuyên Sâu')
content = content.replace('#ppgiai(title: [Quy trình giải chuẩn sư phạm])', '#ppgiai(title: [Note Idea Giải: Quy trình giải chuẩn sư phạm 2026])')
content = content.replace('#ppgiai(title: [Đọc hình đúng trước khi lập công thức])', '#ppgiai(title: [Note Idea Giải: Đọc hình đúng trước khi lập công thức (Chống sai lầm)])')
content = content.replace('#ppgiai(title: [Nhìn hình để chọn đúng tam giác])', '#ppgiai(title: [Note Idea Giải: Tương phản hình học - Chọn đúng tam giác])')

# Enhance cetz canvases by injecting a grid. We find `import cetz.draw: *` and add the grid.
def inject_grid(match):
    return match.group(0) + '\n      grid((-2,-2), (9, 7), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))'

# We'll just inject grid to a few canvases to make them "chuẩn" (standard).
content = re.sub(r'import cetz.draw: \*', inject_grid, content)

# Make robot arms thicker
content = content.replace('thickness: 1.4pt', 'thickness: 2.2pt')
content = content.replace('thickness: 1.2pt', 'thickness: 2.0pt')
content = content.replace('fill: black', 'fill: rgb("2C3E50")')

# Add "Câu Chốt 10 Điểm" before "= Tổng Kết Nhanh"
vdc_section = """
= Câu Chốt 10 Điểm - Dự Đoán 2026: Tối Ưu Đa Biến & Không Gian Oxyz

#lythuyet[
  **Cảnh báo mức độ VDC 9+:** Trong đề thi 2026, câu phân loại thủ khoa thường đẩy bài toán vật lý vào không gian hệ tọa độ Oxyz. Kỹ thuật ở đây yêu cầu học sinh phải có tầm nhìn không gian: Gộp các ràng buộc về mặt phẳng, mặt cầu thành quỹ đạo giao tuyến, sau đó tính chu vi hoặc diện tích.
]

== Bài VDC 1 — Cánh Tay Robot Phun Sơn Trượt Trên Mặt Phẳng Oxyz

#tln(
  [Trong hệ tọa độ $Oxyz$, một cánh tay robot phun sơn có khớp neo trung tâm cố định tại $A(1;1;1)$. Cánh tay nối từ $A$ đến vòi phun $M$ có chiều dài không đổi $A M = 2\\sqrt{3}$ m. Dưới sự điều khiển của hệ thống CNC, vòi phun $M$ bắt buộc phải di chuyển trượt trên bề mặt thao tác là một mặt phẳng $(P): x+y+z=6$. Để hoàn thành một chi tiết, vòi phun vẽ thành một vòng tròn khép kín trọn vẹn giới hạn của hệ thống. Tính độ dài tổng cộng (m) quỹ đạo vòi phun $M$ đã vạch ra.],
  [$6\\pi$],
  fig: align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      let o = (0, 0)
      let x = (4.8, 0)
      let y = (-1.8, -1.6)
      let z = (0, 4.8)
      let a = (1.2, 1.2)
      let h = (2.8, 2.4)
      let m = (4.1, 2.4)

      line(o, x, mark: (end: "stealth", fill: rgb("2C3E50")), stroke: 1pt)
      line(o, y, mark: (end: "stealth", fill: rgb("2C3E50")), stroke: 1pt)
      line(o, z, mark: (end: "stealth", fill: rgb("2C3E50")), stroke: 1pt)

      line(
        (1.4, 1.2),
        (4.9, 1.7),
        (4.1, 3.6),
        (0.6, 3.1),
        close: true,
        fill: rgb("EAF4FB").transparentize(20%),
        stroke: 1pt + rgb("7FB3D5"),
      )
      
      circle(h, radius: 1.35, stroke: (paint: rgb("1F618D"), thickness: 1.5pt))
      
      line(a, h, stroke: (paint: red, thickness: 1pt, dash: "dashed"))
      line(a, m, stroke: (paint: rgb("C0392B"), thickness: 2.2pt))
      line(h, m, stroke: (paint: rgb("1F618D"), thickness: 1pt, dash: "dashed"))

      circle(o, radius: 2.5pt, fill: rgb("2C3E50"))
      circle(a, radius: 3pt, fill: white, stroke: 1pt+rgb("2C3E50"))
      circle(h, radius: 2.5pt, fill: red)
      circle(m, radius: 3pt, fill: rgb("C0392B"))

      content(o, $O$, anchor: "south-west", padding: 4pt)
      content(x, $x$, anchor: "south", padding: 3pt)
      content(y, $y$, anchor: "north-east", padding: 3pt)
      content(z, $z$, anchor: "west", padding: 3pt)
      content(a, $A$, anchor: "west", padding: 4pt)
      content(h, $H$, anchor: "south", padding: 4pt)
      content(m, $M$, anchor: "east", padding: 4pt)
      content((4.45, 3.45), [$(P): x+y+z=6$], anchor: "south-west", padding: 2pt)
      content((1.8, 1.9), [$d=\\sqrt{3}$], anchor: "south", padding: 3pt)
    })
  ],
  fig-pos: "center",
  fig-width: 56%,
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Giải Phẫu Quỹ Đạo Không Gian VDC])[
      - **Dịch mã đề bài:** $A M$ cố định $\\implies$ $M$ di chuyển trên **Mặt cầu tâm $A$**.
      - $M$ chạy trên $(P)$ $\\implies$ $M$ nằm trên **Mặt phẳng $(P)$**.
      - **Điểm quy tụ:** Tập hợp điểm $M$ chính là giao tuyến của mặt cầu và mặt phẳng. Nếu khoảng cách từ tâm $A$ đến $(P)$ nhỏ hơn bán kính cầu, quỹ đạo là một đường tròn. Kiến thức lớp 12 Nón-Trụ-Cầu được ứng dụng tuyệt đẹp vào đây!
    ]

    #step[Kiểm tra điều kiện cắt]
    Mặt cầu $(S)$ có tâm $A(1;1;1)$ và bán kính $R = A M = 2\\sqrt{3}$.
    Khoảng cách từ tâm $A$ đến mặt phẳng $(P)$ là:
    $ h = d(A, (P)) = \\frac{|1 \\cdot 1 + 1 \\cdot 1 + 1 \\cdot 1 - 6|}{\\sqrt{1^2 + 1^2 + 1^2}} = \\frac{3}{\\sqrt{3}} = \\sqrt{3}. $
    Vì $h = \\sqrt{3} < R = 2\\sqrt{3}$, mặt phẳng cắt mặt cầu theo giao tuyến là đường tròn $(C)$. Quỹ đạo robot là một đường tròn hoàn hảo.

    #step[Tính thông số đường tròn quỹ đạo]
    Gọi $r$ là bán kính đường tròn giao tuyến, ta có hệ thức Pitago cho khối nón/cầu cắt:
    $ R^2 = h^2 + r^2 \\implies r = \\sqrt{R^2 - h^2} = \\sqrt{12 - 3} = \\sqrt{9} = 3 \\text{ (m)}. $

    #step[Độ dài quỹ đạo]
    Chu vi của đường tròn quỹ đạo chính là quãng đường phun sơn:
    $ L = 2\\pi r = 2\\pi(3) = 6\\pi \\text{ (m)}. $
    
    #nhanxet[
      Bài toán chỉ gồm 3 phép tính, nhưng học sinh sẽ lúng túng nếu không nhận ra quỹ đạo tròn là giao tuyến của Cầu và Phẳng. Các bài toán thực tế 2026 sẽ không hỏi lộ liễu "Cho mặt cầu (S) và (P), tìm giao tuyến", mà sẽ giấu nó vào thuật ngữ của hệ thống Robot / CNC.
    ]
  ],
)

"""
end_pos = content.find("= Tổng Kết Nhanh")
if end_pos != -1:
    content = content[:end_pos] + vdc_section + content[end_pos:]

with open('/Users/admin/conictypst/typst/exams/Cánh-Tay-Robot.typ', 'w', encoding='utf-8') as f:
    f.write(content)
