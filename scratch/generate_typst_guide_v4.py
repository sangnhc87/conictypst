import math
import os

HEADER = r"""#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.2cm, y: 1.8cm))
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
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[🔵 Phương pháp: Lập hệ phương trình đếm cấu trúc hàng]
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
    #text(fill: white, size: 22pt, weight: "black")[💥 KỸ THUẬT LẬP HỆ ĐẾM CẤU TRÚC HÀNG (LƯỚI 3 CỘT)]
    #v(0.4em)
    #text(
      fill: rgb("E1BEE7"),
      size: 13pt,
    )[🎯 Phá tan sự trừu tượng bằng Tư duy Hệ phương trình Cases]
    #v(0.5em)
    #text(fill: rgb("CE93D8"), size: 10pt, style: "italic")[
      "Viết lại theo phong cách siêu dễ hiểu: Bóc tách tường minh từng điều kiện biện luận"
    ]
  ]
]

#v(1.5em)
"""

THEORY_SECTION = r"""= Chương 1 — Nền tảng tư duy Đếm Cấu Trúc Hàng

#note-box(title: [📌 Lời ngỏ: Sự khác biệt so với Xếp 2 hàng đối diện hay 1 hàng ngang])[
  Ở chuyên đề trước, ta học cách dùng PIE đếm dấu `+,-` rất thành công trên không gian 1 hàng ngang. 
  
  Tuy nhiên, trên lưới $R$ hàng $times 3$ cột, ranh giới hàng là tuyệt đối. Nếu một hàng đã chứa bạn E và bạn G, nó chỉ còn đúng 1 ghế trống. Ta không thể "ghép khối" các bạn E rồi trượt tự do đi khắp phòng được. PIE sẽ vô cùng phức tạp vì phải bù trừ cả cặp và bộ ba đan thiết.
  
  Do đó, tư duy "chân ái" và nguyên thủy nhất ở đây là *Đếm xem có bao nhiêu hàng chứa cấu trúc gì*. Phương pháp lập bảng Hệ phương trình dưới đây sẽ rất mượt mà và dễ hiểu nếu bạn nắm vững ý nghĩa thực tế của nó.
]

Bài toán xếp ghế lưới chữ nhật ($R$ hàng $times 3$ cột) yêu cầu điều kiện: *mỗi hàng không chứa quá 1 đối tượng thuộc mỗi nhóm đặc biệt E, G, F*. Vì mỗi hàng chỉ có đúng 3 ghế, nên tổng số đối tượng đặc biệt tối đa trong một hàng là $1+1+1=3$. Nhờ vậy, ta có thể tư duy theo *cấu trúc của từng hàng*.

Để giữ vững tư duy hoán vị siêu tốc, ta vẫn chia bài toán làm hai bước độc lập:
1. *Bước Khung xương:* Lập bảng đếm số cách phân bổ các cấu trúc hàng (chỉ xếp chỗ, chưa xếp người cụ thể).
2. *Bước Cuồng nhân hoán vị:* Tính xong bảng, ta lấy tổng số cấu trúc nhân với $E! dot G! dot F! dot "Còn lại"!$ để xếp người vào.

== 1. Thiết lập hệ phương trình các loại hàng (Cases)
Vì mỗi hàng có tối đa 1 ghế E, 1 ghế G, 1 ghế F, ta gọi số lượng các loại hàng bằng các ẩn số.
Đồng thời, ta nhẩm luôn *Số cách xếp vị trí ghế nội bộ* trong từng loại hàng đó:

- *Nhóm Hàng có Hệ số 6 (Chứa 3 hoặc 2 người):*
  - $x$: Số hàng chứa cả $E, G, F$. Xếp 3 người vào 3 ghế: $3! = 6$ cách.
  - $y$: Số hàng chứa $E, G$. Chọn 2 ghế từ 3 ghế để xếp E, G: $A_3^2 = 6$ cách.
  - $z$: Số hàng chứa $E, F$. Tương tự: $A_3^2 = 6$ cách.
  - $t$: Số hàng chứa $G, F$. Tương tự: $A_3^2 = 6$ cách.
- *Nhóm Hàng có Hệ số 3 (Chứa đúng 1 người):*
  - $u$: Số hàng chỉ chứa $E$. Chọn 1 ghế từ 3 ghế để xếp E: $C_3^1 = 3$ cách.
  - $v$: Số hàng chỉ chứa $G$. Tương tự: $C_3^1 = 3$ cách.
  - $w$: Số hàng chỉ chứa $F$. Tương tự: $C_3^1 = 3$ cách.
- *Nhóm Hàng Trống:*
  - $o$: Số hàng không chứa $E, G, F$ nào. Có đúng $1$ cách để trống.

Tổng số chỗ ngồi của $E, G, F$ và tổng số hàng $R$ cho ta hệ phương trình:
$
cases(
  x + y + z + u = E quad &(1) " (Tổng số chỗ E)",
  x + y + t + v = G quad &(2) " (Tổng số chỗ G)",
  x + z + t + w = F quad &(3) " (Tổng số chỗ F)",
  x + y + z + t + u + v + w + o = R quad &(4) " (Tổng số hàng)"
)
$

== 2. Cách biện luận "siêu dễ hiểu" không dùng công thức Max/Min
Từ hệ trên, ta rút các biến lẻ $u, v, w, o$ theo $x, y, z, t$:
$
u = E - x - y - z ; quad v = G - x - y - t ; quad w = F - x - z - t ; quad o = R - E - G - F + 2x + y + z + t
$

*Làm sao để tìm các trường hợp nghiệm (Cases) mà không bị rối?*
Ta luôn duyệt bộ $(x, z, t)$ trước vì $F$ thường nhỏ nhất ($x+z+t \le F$).
Sau đó, với mỗi bộ $(x, z, t)$ cố định, ta tìm biến $y$ bằng tư duy logic thực tế:
- *Giới hạn trên của $y$:* $y$ là số hàng chứa $E$ và $G$. Vậy $y$ không thể vượt quá số lượng E còn dư (là $E-x-z$) và cũng không thể vượt quá số lượng G còn dư (là $G-x-t$). Vậy:
  $y \le E - x - z$ và $y \le G - x - t$.
- *Giới hạn dưới của $y$:* $y$ ít nhất phải bằng 0 ($y \ge 0$). Đồng thời, số hàng trống $o$ không được âm ($o \ge 0$), nên từ công thức của $o$, ta chuyển vế: 
  $y \ge (E + G + F - R) - 2x - z - t$.
  *(Chỉ cần nhẩm đơn giản điều kiện này là xong!)*

#rev-box(title: "⚙️ Thuật toán tóm tắt")[
  - *Bước 1:* Lập bảng biện luận tìm $(x, y, z, t)$, sau đó tính $u, v, w, o$.
  - *Bước 2:* Với mỗi dòng, tính số lượng cấu trúc bằng:
    $ C = underbrace(frac(R!, x! y! z! t! u! v! w! o!), "Công thức Phân bổ Hàng") times underbrace(6^(x+y+z+t), "Xếp ghế (Hệ số 6)") times underbrace(3^(u+v+w), "Xếp ghế (Hệ số 3)") $
  - *Bước 3:* Tính $N_("thỏa mãn") = (sum C) times E! times G! times F! times "Số người còn lại"!$
]

#pagebreak()
"""

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
    
    # Updated table structure for better readability
    table_str = "    #align(center)[\n"
    table_str += "      #table(\n"
    # Make the first 8 columns very narrow, the "Phân bổ hàng" column much wider
    table_str += "        columns: (0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 4fr, 2.2fr, 2.5fr),\n"
    table_str += "        inset: 9pt,\n"
    table_str += "        align: center + horizon,\n"
    table_str += "        fill: (col, row) => if row == 0 { rgb(\"EDE7F6\") } else { none },\n"
    table_str += "        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],\n"
    
    for sol in solutions:
        row_formula = f"frac({R}!, "
        den = []
        for v_name in ['x', 'y', 'z', 't', 'u', 'v', 'w', 'o']:
            val = sol[v_name]
            if val > 0: # Only show non-zero factorials to save space
                den.append(f"{val}!")
        if len(den) == 0:
            den.append("1")
        row_formula += " dot ".join(den) + ")"
        
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
    
    total_arr_math = str(total_arrangements)
    total_ways_math = str(total_ways)
    
    # Custom theory reminder for 'y' calculation
    limit_e = f"{E} - x - z"
    limit_g = f"{G} - x - t"
    limit_o = f"{E+G+F-R} - 2x - z - t"
    if E+G+F-R <= 0:
        limit_o = f"{- (R-E-G-F)} - 2x - z - t"
    
    content = f"""== {title}
*Đề bài:* {statement}

#cach1-box[
  - *Bước 1: Thiết lập Hệ phương trình đếm cấu trúc*
    Số hàng $R={R}$. Đối tượng: $E={E}, G={G}, F={F}$. Còn lại: ${3*R - E - G - F}$ ({avg_word}).
    Từ số lượng chỗ ngồi, ta thiết lập hệ phương trình gốc:
    $
    cases(
      x + y + z + u = {E} quad &(E),
      x + y + t + v = {G} quad &(G),
      x + z + t + w = {F} quad &(F),
      x + y + z + t + u + v + w + o = {R} quad &("Hàng")
    )
    $
    Rút các biến độc lập $u, v, w, o$ theo $x, y, z, t$, ta được hệ điều kiện rút gọn:
    $
    cases(
      u = {E} - x - y - z,
      v = {G} - x - y - t,
      w = {F} - x - z - t,
      o = {R - E - G - F} + 2x + y + z + t
    )
    $
    *(Lưu ý: Ta phải duyệt $x + z + t <= F = {F}$ trước)*
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    #text(style: "italic", fill: rgb("616161"))[
      (Nhắc nhẹ lý thuyết: Với mỗi bộ $x, z, t$ đã chọn, $y$ bị chặn trên bởi E và G còn lại ($y <= {limit_e}$ và $y <= {limit_g}$). 
      Đồng thời $y >= 0$ và từ điều kiện $o >= 0$, ta chặn dưới $y >= {limit_o}$).
    ]
    
{table_str}
    
  - *Bước 3: Cuồng nhân hoán vị*
    - Tổng cấu trúc hợp lệ (chưa xếp người): $N_("cấu trúc") = {total_arr_math}$
    - Xếp cụ thể từng học sinh vào:
      $ N_("thỏa mãn") = N_("cấu trúc") dot ({E}! dot {G}! dot {F}!) dot {3*R - E - G - F}! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac({total_arr_math} dot {E}! dot {G}! dot {F}! dot {3*R - E - G - F}!, {3*R}!)$
    - Rút gọn: $ p = frac({total_arr_math}, P_{3*R}^{E+G+F}) dot {E}! dot {G}! dot {F}! approx {prob:.8f} $
    - Giá trị $10000p approx {p_val_10k:.4f} arrow.r$ làm tròn: *{p_rounded}*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *{p_rounded}*.
]
"""
    return content

PROBLEMS_DATA = [
    {
        'index': 1,
        'title': "Bài toán 1 (Khởi động — Cabin cáp treo: Lưới 3 cột 2 hàng)",
        'statement': "Một cabin cáp treo có 6 ghế được xếp thành 3 cột 2 hàng. Có 6 hành khách gồm 2 Hướng dẫn viên (cấp E), 1 Khách nước ngoài (cấp G), 1 Khách VIP (cấp F) và 2 khách thường. Tính xác suất $p$ để không có hàng nào chứa quá 1 người cùng cấp E, hoặc cùng cấp G, hoặc cùng cấp F. Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 2, 'E': 2, 'G': 1, 'F': 1, 'avg_word': "khách thường"
    },
    {
        'index': 2,
        'title': "Bài toán 2 (Khởi động — Xe Limousine: Lưới 3 cột 3 hàng)",
        'statement': "Một xe Limousine cao cấp có 9 ghế xếp thành 3 cột 3 hàng. Có 9 hành khách gồm 2 người lớn tuổi (cấp E), 1 phụ nữ có thai (cấp G), 1 trẻ em (cấp F) và 5 thanh niên. Tính xác suất $p$ để mỗi hàng có không quá 1 khách cùng nhóm ưu tiên (cùng E, cùng G, hoặc cùng F). Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 3, 'E': 2, 'G': 1, 'F': 1, 'avg_word': "thanh niên"
    },
    {
        'index': 3,
        'title': "Bài toán 3 (Dễ — Phòng họp Hội đồng Quản trị: Lưới 3 cột 4 hàng)",
        'statement': "Một phòng họp có 12 chiếc ghế được xếp thành 3 cột 4 hàng. Có 12 đại biểu tham dự gồm 2 thành viên HĐQT (cấp E), 1 Giám đốc (cấp G), 1 Phó giám đốc (cấp F) và 8 nhân viên thường. Tính xác suất $p$ để không có hàng nào chứa quá 1 người cùng cấp E, hoặc cùng cấp G, hoặc cùng cấp F. Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 4, 'E': 2, 'G': 1, 'F': 1, 'avg_word': "nhân viên thường"
    },
    {
        'index': 4,
        'title': "Bài toán 4 (Dễ — Phân bổ Rạp chiếu phim: Lưới 3 cột 4 hàng)",
        'statement': "Một rạp chiếu phim mini có 12 ghế xếp thành 3 cột 4 hàng. Có 12 khách hàng gồm 3 khách VIP, 2 khách Hạng A, 1 khách Hạng B và 6 khách thường. Tính xác suất $p$ để mỗi hàng có không quá 1 khách cùng hạng (cùng VIP, cùng A, hoặc cùng B). Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 4, 'E': 3, 'G': 2, 'F': 1, 'avg_word': "khách thường"
    },
    {
        'index': 5,
        'title': "Bài toán 5 (Trung bình — Khoang hành khách Máy bay: Lưới 3 cột 5 hàng)",
        'statement': "Khoang hạng nhất của một máy bay có 15 ghế xếp thành 3 cột 5 hàng. Có 3 khách Thương gia, 2 khách Đặc biệt, 1 khách Thẻ vàng và 9 khách Thẻ bạc. Xếp ngẫu nhiên 15 hành khách này vào ghế. Tính xác suất $p$ để không có hàng nào chứa quá 1 khách cùng hạng Thương gia, hoặc cùng Đặc biệt, hoặc cùng Thẻ vàng. Tính $10000p$ (làm tròn kết quả đến hàng đơn vị)?",
        'R': 5, 'E': 3, 'G': 2, 'F': 1, 'avg_word': "khách Thẻ bạc"
    },
    {
        'index': 6,
        'title': "Bài toán 6 (Trung bình — Bố trí phòng thi chuẩn: Lưới 3 cột 5 hàng)",
        'statement': "Một phòng thi có 15 bàn xếp thành 3 cột 5 hàng. Có 15 thí sinh gồm 3 học sinh xuất sắc, 2 học sinh giỏi, 2 học sinh khá và 8 học sinh trung bình. Để đảm bảo phân loại, giám thị xếp chỗ ngẫu nhiên sao cho xác suất $p$ là khả năng không có hàng nào chứa quá 1 thí sinh cùng nhóm (xuất sắc, giỏi, khá). Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 5, 'E': 3, 'G': 2, 'F': 2, 'avg_word': "học sinh trung bình"
    },
    {
        'index': 7,
        'title': "Bài toán 7 (Khá — Xếp chỗ sự kiện Nhà hàng: Lưới 3 cột 6 hàng)",
        'statement': "Nhà hàng chuẩn bị 18 ghế (3 cột 6 hàng) cho một sự kiện kín. Danh sách khách mời gồm 3 khách hạng Kim cương, 3 khách hạng Vàng, 2 khách hạng Bạc và 10 khách hạng Tiêu chuẩn. Xếp chỗ ngẫu nhiên cho toàn bộ khách. Tính xác suất $p$ để không có hàng nào có từ 2 khách trở lên cùng hạng Kim cương, cùng Vàng, hoặc cùng Bạc. Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 6, 'E': 3, 'G': 3, 'F': 2, 'avg_word': "khách hạng Tiêu chuẩn"
    },
    {
        'index': 8,
        'title': "Bài toán 8 (Khá — Cuộc họp Đại hội đồng: Lưới 3 cột 6 hàng)",
        'statement': "Một hội trường có 18 ghế xếp thành 3 cột 6 hàng. Trong cuộc họp có 4 Bộ trưởng, 3 Thứ trưởng, 2 Cục trưởng và 9 chuyên viên. Ban tổ chức xếp chỗ ngẫu nhiên 18 người. Tính xác suất $p$ để mỗi hàng có không quá 1 người cùng chức vụ (Bộ trưởng, Thứ trưởng, Cục trưởng). Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 6, 'E': 4, 'G': 3, 'F': 2, 'avg_word': "chuyên viên"
    },
    {
        'index': 9,
        'title': "Bài toán 9 (Khó — Tuyển sinh Học bổng: Lưới 3 cột 7 hàng)",
        'statement': "Vòng phỏng vấn học bổng có 21 thí sinh gồm 4 sinh viên Y khoa, 3 sinh viên Bách khoa, 2 sinh viên Sư phạm và 12 sinh viên Kinh tế. Phòng chờ có 21 ghế xếp 3 cột 7 hàng. Xếp chỗ ngẫu nhiên. Tính xác suất $p$ để không có hàng nào có từ 2 sinh viên trở lên học cùng trường Y khoa, hoặc cùng Bách khoa, hoặc cùng Sư phạm. Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 7, 'E': 4, 'G': 3, 'F': 2, 'avg_word': "sinh viên Kinh tế"
    },
    {
        'index': 10,
        'title': "Bài toán 10 (Khó — Phân bổ đội hình Diễn tập: Lưới 3 cột 7 hàng)",
        'statement': "Một phân đội có 21 binh sĩ, trong đó có 5 đội trưởng, 4 lính bắn tỉa, 2 lính quân y và 10 lính bộ binh. Họ được xếp đội hình ngẫu nhiên vào 21 vị trí tạo thành 3 cột 7 hàng. Tính xác suất $p$ để không có hàng nào chứa quá 1 đội trưởng, hoặc quá 1 lính bắn tỉa, hoặc quá 1 lính quân y. Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 7, 'E': 5, 'G': 4, 'F': 2, 'avg_word': "lính bộ binh"
    },
    {
        'index': 11,
        'title': "Bài toán 11 (Thách thức — Buổi hoà nhạc Giao hưởng: Lưới 3 cột 8 hàng)",
        'statement': "Trên khán đài VIP của một buổi hoà nhạc có 24 ghế xếp thành 3 cột 8 hàng. Có 5 Nhạc trưởng, 3 Ca sĩ opera, 2 Nghệ sĩ vĩ cầm và 14 khán giả. Xếp chỗ ngẫu nhiên 24 người. Tính xác suất $p$ để mỗi hàng ghế không có quá một người cùng chức danh (Nhạc trưởng, Ca sĩ opera, Nghệ sĩ vĩ cầm). Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 8, 'E': 5, 'G': 3, 'F': 2, 'avg_word': "khán giả"
    },
    {
        'index': 12,
        'title': "Bài toán 12 (Chặn 10 Đỉnh cao — Kì thi chọn Đội tuyển: Lưới 3 cột 8 hàng)",
        'statement': "Kì thi chọn đội tuyển Olympic tổ chức tại phòng thi có 24 bàn (3 cột 8 hàng). Có 6 học sinh chuyên Toán, 4 chuyên Lý, 3 chuyên Hóa và 11 chuyên Sinh. Đánh số báo danh ngẫu nhiên và xếp chỗ. Tính xác suất $p$ để không có hàng nào chứa từ 2 học sinh trở lên cùng chuyên Toán, hoặc cùng chuyên Lý, hoặc cùng chuyên Hóa. Hãy tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 8, 'E': 6, 'G': 4, 'F': 3, 'avg_word': "học sinh chuyên Sinh"
    }
]

typst_content = HEADER + THEORY_SECTION + "= Chương 2 — Hệ thống 12 Bài tập Thực chiến (Cấp độ từ Cơ bản đến Khó)\n\n"

for p_data in PROBLEMS_DATA:
    content = generate_problem_typst(
        p_data['index'], p_data['title'], p_data['statement'],
        p_data['R'], p_data['E'], p_data['G'], p_data['F'], p_data['avg_word']
    )
    typst_content += content
    if p_data['index'] < 12:
        typst_content += "\n#pagebreak()\n\n"

with open("/Users/admin/conictypst/typst/exams/CD-XepGhe-3Cot.typ", "w", encoding="utf-8") as f:
    f.write(typst_content)

print("Generated 12 problems Typst guide successfully with max formatting!")
