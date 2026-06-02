import sys
import os

def rebuild():
    # 1. Read current corrupted content
    with open('typst/exams/CD-DaiSo-ToHop-content.typ', 'r', encoding='utf-8', errors='replace') as f:
        content = f.read()

    # Find where Example 3 of Topic 15 starts in the current content
    start_ex3 = content.find('#example-box(n: \"3 (Khó - Giải bằng 3 cách)\")[')
    if start_ex3 == -1:
        print('Error: Could not find start of Example 3 of Topic 15')
        sys.exit(1)

    print('Start of Example 3 is at position:', start_ex3)
    prefix = content[:start_ex3]

    # 2. Example 3 text (manually corrected & completed with 3 methods)
    ex3_text = """#example-box(n: "3 (Khó - Giải bằng 3 cách)")[
  Hai người chơi A và B luân phiên nhau tung một đồng xu cân đối. Người nào tung được mặt ngửa đầu tiên sẽ giành chiến thắng. Biết A là người được quyền tung trước. Tính xác suất để người A thắng cuộc.

  *Cách 1 (Tổng cấp số nhân lùi vô hạn):*
  Xét các lượt tung mà người A có thể giành chiến thắng:
  - A thắng ở lượt tung thứ 1: A tung được mặt ngửa ngay. Xác suất là $1/2$.
  - A thắng ở lượt tung thứ 3: Lượt 1 A tung sấp ($1/2$), lượt 2 B tung sấp ($1/2$), lượt 3 A tung ngửa ($1/2$). Xác suất là $(1/2)^3 = 1/8$.
  - A thắng ở lượt tung thứ 5: A sấp, B sấp, A sấp, B sấp, A ngửa. Xác suất là $(1/2)^5 = 1/32$.
  Tổng quát, A có thể thắng ở lượt thứ $2k+1$ với xác suất $(1/2)^(2k+1)$.
  Xác suất thắng cuộc của A là tổng của cấp số nhân lùi vô hạn:
  $
    P = frac(1, 2) + (frac(1, 2))^3 + (frac(1, 2))^5 + ... \
    = frac(1, 2) sum_(k=0)^(\\infty) (frac(1, 4))^k
  $
  Áp dụng công thức tổng cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 1/2$ và công vị $q = 1/4$:
  $ P = frac(u_1, 1 - q) = frac(1/2, 1 - 1/4) = frac(1/2, 3/4) = frac(2, 3) $

  *Cách 2 (Phương trình trạng thái có điều kiện - Markov):*
  Gọi $p$ là xác suất người tung trước giành chiến thắng trong trò chơi này từ thời điểm bắt đầu lượt tung của mình.
  Xét lượt tung của người A (đang đóng vai trò người đi trước):
  - A tung được mặt ngửa (xác suất $1/2$): A thắng cuộc ngay lập tức (xác suất thắng là 1).
  - A tung được mặt sấp (xác suất $1/2$): Lượt chơi chuyển sang người B. Lúc này, người B trở thành người đi trước trong lượt tung của mình. Theo định nghĩa, xác suất để B thắng trò chơi kể từ thời điểm này là $p$. Do đó, xác suất để A thắng trò chơi kể từ thời điểm này là $1 - p$.
  Ta lập phương trình tự liên hệ xác suất:
  $
    p = frac(1, 2) dot 1 + frac(1, 2) dot (1 - p) \
    \\leftrightarrow p = frac(1, 2) + frac(1, 2) - frac(1, 2) p \
    \\leftrightarrow frac(3, 2) p = 1 \\leftrightarrow p = frac(2, 3)
  $
  Xác suất thắng cuộc của người A là $2/3$.

  *Cách 3 (Sử dụng hàm sinh xác suất):*
  Ta có thể biểu diễn quá trình tung đồng xu bằng hàm sinh. Gọi $x$ đại diện cho lượt tung sấp (xác suất $1/2$) và $y$ đại diện cho lượt tung ngửa (xác suất $1/2$).
  Trò chơi kết thúc ngay khi có người tung được ngửa. Các kịch bản mà A (người đi trước) thắng cuộc tương ứng với các chuỗi lượt tung có dạng:
  - Lượt 1: $y$ (A tung ngửa và thắng ngay).
  - Lượt 3: $x x y$ (A sấp, B sấp, A ngửa và thắng).
  - Lượt $2k+1$: $x^(2k) y$ (sau $2k$ lượt sấp, A tung ngửa và thắng).
  Hàm sinh mô tả tất cả các kịch bản thắng cuộc của A là:
  $ P(x, y) = y + x^2 y + x^4 y + ... = y sum_(k=0)^(\\infty) x^(2k) = frac(y, 1 - x^2) $
  Thế các xác suất $x = 1/2$ và $y = 1/2$ vào hàm sinh ta được xác suất thắng cuộc của A:
  $ P(1/2, 1/2) = frac(1/2, 1 - (1/2)^2) = frac(1/2, 3/4) = frac(2, 3). $
]
"""

    # 3. Part II Header
    part2_header = """
#pagebreak()

// ══════════════════════════════════════════════════════════════
// PHẦN II: ĐỀ LUYỆN TỔNG HỢP
// ══════════════════════════════════════════════════════════════
= Đề Luyện Tổng Hợp

#align(center)[
  #block(
    fill: rgb("F8FAFC"),
    stroke: 1pt + c-navy,
    radius: 8pt,
    inset: (x: 20pt, y: 15pt),
    width: 100%,
  )[
    #text(fill: c-navy, weight: "bold", size: 12pt)[
      📋 Bảng Phân Loại Đề Thực Chiến 35 Bài Tập Điển Hình
    ]
    #v(0.8em)
    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 12pt,
      row-gutter: 8pt,
      align: (center, left, center),
      box(fill: rgb("DCFCE7"), stroke: 1pt + c-teal, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-teal, weight: "bold")[★ Cơ Bản]
      ],
      [Nguyên lý cộng nhân, hoán vị chỉnh hợp cơ bản, vách ngăn đơn giản],
      [Bài 1–3],

      box(fill: rgb("FEF9C3"), stroke: 1pt + c-gold, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-gold, weight: "bold")[★★ Khá]
      ],
      [Gộp khối khoảng trống, hoán vị lặp, đếm hình học, chữ số chia hết],
      [Bài 4–10],

      box(fill: rgb("FEE2E2"), stroke: 1pt + c-crimson, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-crimson, weight: "bold")[★★★ Khó]
      ],
      [Hàm sinh Euler, phân hoạch Stirling, song ánh Catalan, truy hồi bậc cao, Newton],
      [Bài 11–35],
    )
  ]
]

#v(1em)
"""

    # 4. Problems 1, 2, 3
    with open('scratch/replacement_331_clean.txt', 'r', encoding='utf-8') as f:
        prob1 = f.read().strip()
    with open('scratch/replacement_337_clean.txt', 'r', encoding='utf-8') as f:
        prob2 = f.read().strip()
    with open('scratch/replacement_341_clean.txt', 'r', encoding='utf-8') as f:
        prob3 = f.read().strip()

    problems_1_3 = prob1 + '\n\n' + prob2 + '\n\n' + prob3

    # 5. Problems 4 to 10
    with open('scratch/replacement_373_clean.txt', 'r', encoding='utf-8') as f:
        problems_4_10 = f.read().strip()

    # 6. Problems 11 to 19 (extracted cleanly from the corrupted file)
    # The first #tln( id: "2EX-11", starts after Example 3's corruption point.
    # In the corrupted file, it starts at 83112 (after A s). Let's find it.
    idx_p11 = content.find('#tln(\n  id: "2EX-11",')
    if idx_p11 == -1:
        print('Error: Could not find start of 2EX-11')
        sys.exit(1)
    
    # We want to extract up to the end of Problem 19.
    # Let's find where Problem 19's loigiai ends.
    # We know that after Problem 19, the corrupted file has `ợc tạo ra bằng cách chọn 2`
    idx_p19_end = content.find(')ợc tạo ra bằng cách chọn 2')
    if idx_p19_end == -1:
        # try without parenthesis
        idx_p19_end = content.find('ợc tạo ra bằng cách chọn 2')
        
    if idx_p19_end == -1:
        print('Error: Could not find end of Problem 19')
        sys.exit(1)

    print('Problem 11 start:', idx_p11, 'Problem 19 end:', idx_p19_end)
    problems_11_19 = content[idx_p11:idx_p19_end].strip()
    if problems_11_19.endswith(']'):
        # ensure it ends with close parenthesis
        problems_11_19 += '\n)'
    elif not problems_11_19.endswith(')'):
        # find the last closing bracket of #ans-box and append
        problems_11_19 += '\n  ],\n)'

    # 7. Problems 20 to 35 (tail of the file)
    idx_p20 = content.find('#prob(\n  \"20 ★★★\",')
    if idx_p20 == -1:
        idx_p20 = content.find('#prob(\n  \"20')
    if idx_p20 == -1:
        print('Error: Could not find Problem 20 start')
        sys.exit(1)
        
    print('Problem 20 start:', idx_p20)
    tail = content[idx_p20:]

    # Combine everything
    rebuilt = (
        prefix + '\n' +
        ex3_text + '\n' +
        part2_header + '\n' +
        problems_1_3 + '\n\n' +
        problems_4_10 + '\n\n' +
        problems_11_19 + '\n\n' +
        tail
    )

    with open('typst/exams/CD-DaiSo-ToHop-content.typ', 'w', encoding='utf-8') as f:
        f.write(rebuilt)
    print('File rebuilt successfully!')

if __name__ == '__main__':
    rebuild()
