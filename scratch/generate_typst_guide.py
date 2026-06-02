import math

# We will define the header of the Typst file:
HEADER = """#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("4A148C"), rgb("6A1B9A"), rgb("880E4F"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("6A1B9A")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("6A1B9A"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ─────────────────────────────────────────────
#let col-purple = rgb("4A148C")
#let col-violet = rgb("6A1B9A")
#let col-blue = rgb("1565C0")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-red = rgb("C62828")
#let col-pink = rgb("880E4F")

// ─── Hộp Lý Thuyết ─────────────────────────────
#let rev-box(title: none, body) = block(
  fill: rgb("EDE7F6"),
  stroke: (left: 4pt + col-purple, rest: 0.8pt + rgb("CE93D8")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-purple, size: 11pt, weight: "bold")[#title]
    #v(0.4em)
  ]
  #body
]

// ─── Hộp Nhận Xét ───────────────────────────────
#let note-box(title: [📌 Nhận Xét], body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ─── Hộp Kết Luận ───────────────────────────────
#let ans-box(body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[✅ Kết Luận]
  #v(0.3em)
  #body
]

// ─── Hộp Cách Giải ────────────────────
#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[🔵 Phương pháp lập hệ cấu trúc hàng và biện luận]
  #v(0.3em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D0030"), rgb("4A148C"), rgb("7B1FA2"), rgb("880E4F"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("CE93D8"), size: 12pt, weight: "bold", tracking: 2pt)[
      TÀI LIỆU TOÁN CHUYÊN ĐỀ PHỔ THÔNG
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "black")[💥 TƯ DUY ĐẾM CẤU TRÚC HÀNG TRÊN LƯỚI GHẾ 3 CỘT]
    #v(0.4em)
    #text(
      fill: rgb("E1BEE7"),
      size: 13pt,
    )[🎯 Kỹ Thuật Lập Hệ Và Biện Luận Nghiệm Nguyên Đơn Giản Nhất]
    #v(0.5em)
    #text(fill: rgb("CE93D8"), size: 10pt, style: "italic")[
      "Quy bài toán đếm tổ hợp phức tạp về giải hệ phương trình tuyến tính phổ thông"
    ]
  ]
]

#v(1.5em)
"""

THEORY_SECTION = """= Chương 1 — Phương pháp Lập hệ cấu trúc hàng và Biện luận

Trong các đề thi học sinh giỏi và các câu hỏi chặn 10 điểm của kỳ thi THPT, bài toán sắp xếp học sinh vào các hàng ghế thường đi kèm ràng buộc: *mỗi hàng không chứa quá 1 học sinh thuộc mỗi nhóm đặc biệt E (Xuất sắc), G (Giỏi), F (Khá)*. 

Khi số hàng ghế là $R$ và mỗi hàng có đúng $3$ chỗ ngồi (lưới $3$ cột $R$ hàng), ta nhận thấy rằng: do mỗi hàng có tối đa 1 học sinh $E$, 1 học sinh $G$ và 1 học sinh $F$, nên tổng số học sinh đặc biệt tối đa trong một hàng là $1 + 1 + 1 = 3$ (vừa vặn bằng sức chứa của một hàng). Do đó, sự phân bổ chỗ ngồi của các nhóm này chỉ phụ thuộc vào việc *mỗi hàng chứa những loại học sinh nào*.

Để giải quyết triệt để bài toán này một cách khoa học, dễ hiểu và không bị sót trường hợp, ta sử dụng *Phương pháp Lập hệ cấu trúc hàng và Biện luận*.

== 1. Định nghĩa các biến cấu trúc hàng
Do mỗi hàng ghế có thể chứa một tập con của $\{E, G, F\}$, ta phân loại các hàng ghế thành 8 loại cấu trúc sau. Gọi các biến nguyên không âm tương ứng với số lượng hàng của mỗi loại:
- $x$: Số hàng chứa cả $E$, $G$ và $F$ (Số cách xếp chỗ ngồi trong hàng: $3! = 6$).
- $y$: Số hàng chứa $E$ và $G$ (Số cách xếp chỗ ngồi trong hàng: $P_3^2 = 6$).
- $z$: Số hàng chứa $E$ và $F$ (Số cách xếp chỗ ngồi trong hàng: $P_3^2 = 6$).
- $t$: Số hàng chứa $G$ and $F$ (Số cách xếp chỗ ngồi trong hàng: $P_3^2 = 6$).
- $u$: Số hàng chỉ chứa $E$ (Số cách xếp chỗ ngồi trong hàng: $P_3^1 = 3$).
- $v$: Số hàng chỉ chứa $G$ (Số cách xếp chỗ ngồi trong hàng: $P_3^1 = 3$).
- $w$: Số hàng chỉ chứa $F$ (Số cách xếp chỗ ngồi trong hàng: $P_3^1 = 3$).
- $o$: Số hàng trống (không chứa học sinh đặc biệt nào) (Số cách xếp chỗ ngồi: $1$).

== 2. Thiết lập hệ phương trình bảo toàn
Vì tổng số hàng ghế là $R$, và tổng số lượng học sinh của các lớp $E, G, F$ lần lượt là $E, G, F$, ta có hệ phương trình bảo toàn sau:
$
x + y + z + t + u + v + w + o &= R quad &(1) \
x + y + z + u &= E quad &(2) \
x + y + t + v &= G quad &(3) \
x + z + t + w &= F quad &(4)
$
với $x, y, z, t, u, v, w, o$ là các số nguyên không âm.

== 3. Rút gọn hệ phương trình và điều kiện chặn
Từ các phương trình $(2), (3), (4)$, ta rút ra các biến đơn lẻ $u, v, w$ theo $x, y, z, t$:
$
u &= E - x - y - z \
v &= G - x - y - t \
w &= F - x - z - t
$
Thay ba biểu thức trên vào phương trình $(1)$, ta được phương trình bảo toàn cho số hàng trống $o$:
$
x + y + z + t + (E - x - y - z) + (G - x - y - t) + (F - x - z - t) + o = R \
arrow.r o = R - E - G - F + 2x + y + z + t
$

Để các biến $u, v, w, o$ là các số nguyên không âm, ta có các ràng buộc sau:
$
x + y + z &<= E \
x + y + t &<= G \
x + z + t &<= F \
2x + y + z + t &>= E + G + F - R
$

== 4. Thuật toán Biện luận nghiệm nguyên
Trong thực tế, số học sinh của nhóm nhỏ nhất (giả sử là $F$) rất bé (thường chỉ bằng $1, 2$ hoặc $3$). Do đó ràng buộc $x + z + t <= F$ giới hạn số bộ $(x, z, t)$ rất nhỏ. Quy trình biện luận như sau:
1. *Bước 1:* Liệt kê tất cả các bộ số nguyên không âm $(x, z, t)$ thỏa mãn điều kiện $x + z + t <= F$.
2. *Bước 2:* Với mỗi bộ $(x, z, t)$ cố định, tìm khoảng giá trị của $y$ thỏa mãn đồng thời các điều kiện:
   $
   y &>= 0 \
   y &<= E - x - z \
   y &<= G - x - t \
   y &>= E + G + F - R - 2x - z - t
   $
   Tức là: $max(0, E + G + F - R - 2x - z - t) <= y <= min(E - x - z, G - x - t)$.
3. *Bước 3:* Với mỗi bộ nghiệm nguyên $(x, y, z, t)$ tìm được, ta tính các giá trị $u, v, w, o$ tương ứng.
4. *Bước 4:* Tính số cách xếp cấu trúc hàng và vị trí ngồi tương ứng với bộ nghiệm đó:
   $ C = frac(R!, x! y! z! t! u! v! w! o!) dot 6^(x+y+z+t) dot 3^(u+v+w) $
5. *Bước 5:* Tính tổng số cách cấu trúc và xác suất:
   - Tổng số cách xếp ghế cho $E, G, F$: $N_("cấu trúc") = sum C$.
   - Số cách xếp toàn bộ học sinh phân biệt vào phòng thi:
     $ N_("thỏa mãn") = N_("cấu trúc") dot E! dot G! dot F! dot (3R - E - G - F)! $
   - Xác suất cần tìm:
     $ p = frac(N_("thỏa mãn"), (3R)!) $

#pagebreak()
"""

# Let's write the solver that returns the detailed Vietnamese explanation text and data tables for each problem.
def generate_problem_typst(index, title, statement, R, E, G, F, avg_word):
    solutions = []
    
    for x in range(F + 1):
        for z in range(F + 1 - x):
            for t in range(F + 1 - x - z):
                w = F - x - z - t
                min_y = max(0, E + G + F - R - 2*x - z - t)
                max_y = min(E - x - z, G - x - t)
                
                for y in range(min_y, max_y + 1):
                    u = E - x - y - z
                    v = G - x - y - t
                    o = R - (x + y + z + t + u + v + w)
                    
                    ways_rows = math.factorial(R) // (
                        math.factorial(x) * math.factorial(y) * math.factorial(z) *
                        math.factorial(t) * math.factorial(u) * math.factorial(v) *
                        math.factorial(w) * math.factorial(o)
                    )
                    ways_seats = (6**(x + y + z + t)) * (3**(u + v + w))
                    ways = ways_rows * ways_seats
                    
                    solutions.append({
                        'x': x, 'y': y, 'z': z, 't': t,
                        'u': u, 'v': v, 'w': w, 'o': o,
                        'ways_rows': ways_rows,
                        'ways_seats': ways_seats,
                        'ways': ways
                    })
                    
    total_arrangements = sum(sol['ways'] for sol in solutions)
    ans = total_arrangements * math.factorial(E) * math.factorial(G) * math.factorial(F) * math.factorial(3*R - E - G - F)
    total_ways = math.factorial(3*R)
    prob = ans / total_ways
    p_val_10k = prob * 10000
    p_rounded = round(p_val_10k)
    
    # We build the tables in Typst
    # Header of table
    table_str = "    #align(center)[\n"
    table_str += "      #table(\n"
    table_str += "        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.8fr, 1.8fr, 2.5fr),\n"
    table_str += "        align: center + horizon,\n"
    table_str += "        fill: (col, row) => if row == 0 { rgb(\"EDE7F6\") } else { none },\n"
    table_str += "        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách xếp*],\n"
    
    for sol in solutions:
        # rows formula string
        # e.g., 5! / (0! * 2! * ...)
        row_formula = f"frac({R}!, "
        den = []
        for v_name in ['x', 'y', 'z', 't', 'u', 'v', 'w', 'o']:
            val = sol[v_name]
            den.append(f"{val}!")
        row_formula += " ".join(den) + ")"
        
        # seats formula string
        # e.g., 6^2 * 3^2
        seats_formula = ""
        exp6 = sol['x'] + sol['y'] + sol['z'] + sol['t']
        exp3 = sol['u'] + sol['v'] + sol['w']
        if exp6 > 0 and exp3 > 0:
            seats_formula = f"6^{exp6} dot 3^{exp3}"
        elif exp6 > 0:
            seats_formula = f"6^{exp6}"
        elif exp3 > 0:
            seats_formula = f"3^{exp3}"
        else:
            seats_formula = "1"
            
        table_str += f"        [{sol['x']}], [{sol['y']}], [{sol['z']}], [{sol['t']}], [{sol['u']}], [{sol['v']}], [{sol['w']}], [{sol['o']}], [${row_formula} = {sol['ways_rows']}$], [${seats_formula} = {sol['ways_seats']}$], [*{sol['ways']:,}*],\n"
        
    table_str += "      )\n"
    table_str += "    ]\n"
    
    # Format total arrangements and other numbers without commas for math blocks
    total_arr_math = str(total_arrangements)
    total_ways_math = str(total_ways)
    
    content = f"""== {title}
*Đề bài:* {statement}

#cach1-box[
  Áp dụng *Phương pháp Lập hệ cấu trúc hàng và Biện luận*:
  
  - *Bước 1: Xác định các thông số:*
    - Số hàng ghế: $R = {R}$. Tổng số chỗ ngồi là $3R = {3*R}$.
    - Số học sinh đặc biệt: $E = {E}$ (Xuất sắc), $G = {G}$ (Giỏi), $F = {F}$ (Khá).
    - Số học sinh trung bình: ${3*R - E - G - F}$ em.
    
  - *Bước 2: Thiết lập hệ thức liên hệ:*
    Các biến đơn lẻ $u, v, w, o$ được tính theo bộ bốn $(x, y, z, t)$:
    $
    u &= {E} - x - y - z \
    v &= {G} - x - y - t \
    w &= {F} - x - z - t \
    o &= {R} - {E} - {G} - {F} + 2x + y + z + t = {R - E - G - F} + 2x + y + z + t
    $
    Với ràng buộc biện luận chính: $x + z + t <= F = {F}$ và các biến không âm.
    
  - *Bước 3: Biện luận nghiệm nguyên:*
    Do $x + z + t <= {F}$, ta lập bảng giá trị của các bộ nghiệm $(x, y, z, t)$ hợp lệ và tính số cách xếp tương ứng cho từng bộ:
    
{table_str}
    
  - *Bước 4: Tính tổng số cấu trúc và xác suất:*
    - Tổng số cách xếp vị trí cho 3 nhóm đặc biệt $E, G, F$ là:
      $ N_("cấu trúc") = {total_arr_math} $
      
    - Số cách xếp toàn bộ học sinh phân biệt vào phòng thi:
      $ N_("thỏa mãn") = N_("cấu trúc") dot E! dot G! dot F! dot (3R - E - G - F)! $
      $ N_("thỏa mãn") = {total_arr_math} dot {E}! dot {G}! dot {F}! dot {3*R - E - G - F}! $
      
    - Xác suất cần tìm:
      $ p = frac(N_("thỏa mãn"), {3*R}!) = frac({total_arr_math} dot {E}! dot {G}! dot {F}! dot {3*R - E - G - F}!, {3*R}!) $
      
      Rút gọn biểu thức trên, ta được:
      $ p = frac({total_arr_math}, P_{3*R}^{E+G+F}) dot {E}! dot {G}! dot {F}! $
      $ p approx {prob:.8f} $
      
    - Tính giá trị $10000p$:
      $ 10000p approx {p_val_10k:.4f} $ (làm tròn đến hàng đơn vị được *{p_rounded}*).
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *{p_rounded}*.
]
"""
    return content

# Let's define the 5 problems:
PROBLEMS_DATA = [
    {
        'index': 1,
        'title': "Bài toán 1 (Dễ — Khởi động: Lưới 3 cột 5 hàng)",
        'statement': "Một phòng học có 15 chiếc ghế được xếp thành 3 cột 5 hàng. Thầy giáo xếp ngẫu nhiên 15 em học sinh gồm 3 em xuất sắc, 2 em giỏi, 1 em khá và 9 em trung bình vào các ghế, mỗi em một ghế. Tính xác suất $p$ để không có hàng nào chứa quá 1 học sinh cùng xuất sắc hoặc cùng giỏi hoặc cùng khá. Hãy tính $10000p$ (làm tròn kết quả đến hàng đơn vị)?",
        'R': 5, 'E': 3, 'G': 2, 'F': 1, 'avg_word': "học sinh trung bình"
    },
    {
        'index': 2,
        'title': "Bài toán 2 (Trung bình — Lưới 3 cột 6 hàng)",
        'statement': "Một hội trường nhỏ có 18 chiếc ghế xếp thành 3 cột 6 hàng. Ban tổ chức xếp ngẫu nhiên 18 đại biểu gồm 4 lãnh đạo xuất sắc, 3 lãnh đạo giỏi, 2 lãnh đạo khá và 9 thành viên thường vào phòng họp, mỗi người một ghế. Tính xác suất $p$ để mỗi hàng có không quá 1 người cùng xuất sắc hoặc cùng giỏi hoặc cùng khá. Nhập kết quả dưới dạng $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 6, 'E': 4, 'G': 3, 'F': 2, 'avg_word': "thành viên thường"
    },
    {
        'index': 3,
        'title': "Bài toán 3 (Khá — Lưới 3 cột 7 hàng)",
        'statement': "Phòng học bồi dưỡng có 21 chiếc bàn xếp thành 3 cột 7 hàng. Người ta xếp ngẫu nhiên 21 học sinh gồm 5 học sinh xuất sắc, 4 học sinh giỏi, 2 học sinh khá và 10 học sinh trung bình vào phòng học, mỗi học sinh ngồi một bàn. Tính xác suất $p$ để không có hàng nào chứa quá 1 học sinh cùng xuất sắc hoặc cùng giỏi hoặc cùng khá. Hãy tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 7, 'E': 5, 'G': 4, 'F': 2, 'avg_word': "học sinh trung bình"
    },
    {
        'index': 4,
        'title': "Bài toán 4 (Khó — Lưới 3 cột 8 hàng)",
        'statement': "Trong phòng học gồm 3 dãy 8 hàng, mỗi hàng có ba chiếc ghế. Xếp ngẫu nhiên 24 học sinh gồm 5 học sinh giỏi xuất sắc, 3 học sinh giỏi, 2 học sinh khá và 14 học sinh trung bình vào các ghế, mỗi em một ghế. Gọi $p$ là xác suất để mỗi hàng ghế không có quá một học sinh cùng xuất sắc hoặc cùng giỏi hoặc cùng khá. Hãy tính $10000p$ (làm tròn kết quả đến hàng đơn vị)?",
        'R': 8, 'E': 5, 'G': 3, 'F': 2, 'avg_word': "học sinh trung bình"
    },
    {
        'index': 5,
        'title': "Bài toán 5 (Thách thức — Chặn 10: Lưới 3 cột 8 hàng)",
        'statement': "Một phòng thi đặc biệt có 24 chiếc bàn xếp thành 3 cột 8 hàng. Giám thị xếp ngẫu nhiên 24 thí sinh gồm 6 học sinh xuất sắc, 4 học sinh giỏi, 3 học sinh khá và 11 học sinh trung bình vào phòng thi, mỗi thí sinh một bàn. Tính xác suất $p$ để không có hàng nào chứa quá 1 học sinh cùng xuất sắc hoặc cùng giỏi hoặc cùng khá. Hãy tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 8, 'E': 6, 'G': 4, 'F': 3, 'avg_word': "học sinh trung bình"
    }
]

# We assemble the Typst document content:
typst_content = HEADER + THEORY_SECTION + "= Chương 2 — Hệ thống Bài tập Thực chiến\n\n"

for p_data in PROBLEMS_DATA:
    content = generate_problem_typst(
        p_data['index'], p_data['title'], p_data['statement'],
        p_data['R'], p_data['E'], p_data['G'], p_data['F'], p_data['avg_word']
    )
    typst_content += content
    # Add a pagebreak between problems except for the last one
    if p_data['index'] < 5:
        typst_content += "\n#pagebreak()\n\n"

# Write to file
with open("/Users/admin/conictypst/typst/exams/CD-XepGhe-3Cot.typ", "w", encoding="utf-8") as f:
    f.write(typst_content)

print("Generated Typst guide successfully!")
