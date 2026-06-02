import math
import os

HEADER = r"""#import "../sang-exam.typ": *
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
    )[🎯 Tư duy Hệ phương trình Cases & Cuồng nhân hoán vị]
    #v(0.5em)
    #text(fill: rgb("CE93D8"), size: 10pt, style: "italic")[
      "Quy bài toán đếm tổ hợp phức tạp về giải hệ phương trình và biện luận siêu dễ hiểu"
    ]
  ]
]

#v(1.5em)
"""

THEORY_SECTION = r"""= Chương 1 — Nền tảng tư duy Đếm Cấu Trúc Hàng

#note-box(title: [📌 Lời ngỏ: Sự đồng bộ với phương pháp PIE (Bù trừ ghép khối)])[
  Ở chuyên đề *Xếp ghế không kề (1 Hàng ngang)*, ta đã sử dụng vô cùng thành công phương pháp *PIE (Bù trừ đếm dấu +,-)* thông qua kỹ thuật ghép khối (glueing).
  
  Tuy nhiên, khi bước sang bài toán *Lưới 3 cột $times$ R hàng*, không gian không còn là một đường thẳng liên tục nữa mà bị *chặt đứt bởi các ranh giới hàng cứng nhắc* (mỗi hàng chỉ chứa đúng 3 ghế).
  - Nếu ta cố dùng PIE ghép cặp: Khi "ghép" 2 bạn E vào cùng một hàng, khối này sẽ chiếm 2 ghế, chỉ chừa lại 1 ghế cho hàng đó. Việc hoán vị các khối ghép này sẽ vấp phải rào cản sức chứa của từng hàng. Hơn nữa, PIE trên lưới sẽ phải bù trừ cả trường hợp 2 bạn E (1 cặp) và 3 bạn E (3 cặp), làm thuật toán bảng $i,j,k$ bị phá vỡ hoàn toàn.
  - Do đó, để vượt qua giới hạn của không gian 2D, ta nâng cấp tư duy: *Thay vì đếm từng cặp vi phạm, ta đếm trực tiếp Cấu trúc của cả một hàng.* 
  
  Bảng biện luận cấu trúc hàng dưới đây chính là "phiên bản nâng cấp" của bảng PIE, giữ nguyên tinh thần *lập bảng từng dòng, tính độc lập rồi cuồng nhân hoán vị ở bước cuối*.
]

Bài toán xếp ghế lưới chữ nhật ($R$ hàng $times 3$ cột) yêu cầu điều kiện: *mỗi hàng không chứa quá 1 đối tượng thuộc mỗi nhóm đặc biệt E, G, F*. Vì mỗi hàng chỉ có đúng 3 ghế, nên tổng số đối tượng đặc biệt tối đa trong một hàng là $1+1+1=3$. Nhờ vậy, ta có thể tư duy theo *cấu trúc của từng hàng*.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    // Draw a visual representation of 3 columns and some rows
    for r in range(0, 4) {
      for c in range(0, 3) {
        rect((c * 2, r * -1.2), (c * 2 + 1.6, r * -1.2 - 0.9), fill: rgb("E3F2FD"), stroke: 0.5pt + rgb("90CAF9"), radius: 0.2)
      }
      content((-1.2, r * -1.2 - 0.45), text(weight: "bold", size: 10pt)[Hàng #(r+1)])
    }
    
    // Fill the first row with E, G, F
    rect((0 * 2, 0 * -1.2), (0 * 2 + 1.6, 0 * -1.2 - 0.9), fill: col-pink.lighten(70%), stroke: 0.5pt + col-pink, radius: 0.2)
    content((0 * 2 + 0.8, 0 * -1.2 - 0.45), text(fill: col-pink, weight: "bold")[E (Xuất sắc)])
    
    rect((1 * 2, 0 * -1.2), (1 * 2 + 1.6, 0 * -1.2 - 0.9), fill: col-amber.lighten(70%), stroke: 0.5pt + col-amber, radius: 0.2)
    content((1 * 2 + 0.8, 0 * -1.2 - 0.45), text(fill: col-amber, weight: "bold")[G (Giỏi)])
    
    rect((2 * 2, 0 * -1.2), (2 * 2 + 1.6, 0 * -1.2 - 0.9), fill: col-green.lighten(70%), stroke: 0.5pt + col-green, radius: 0.2)
    content((2 * 2 + 0.8, 0 * -1.2 - 0.45), text(fill: col-green, weight: "bold")[F (Khá)])
    
    // Fill second row partially
    rect((1 * 2, 1 * -1.2), (1 * 2 + 1.6, 1 * -1.2 - 0.9), fill: col-pink.lighten(70%), stroke: 0.5pt + col-pink, radius: 0.2)
    content((1 * 2 + 0.8, 1 * -1.2 - 0.45), text(fill: col-pink, weight: "bold")[E (Xuất sắc)])
  })
]
#v(1em)

Để giữ vững tư duy hoán vị siêu tốc, ta vẫn chia bài toán làm hai bước độc lập:
1. *Bước Khung xương (Tương đương lập bảng PIE):* Đếm số lượng cấu trúc phân bổ chỗ ngồi cho các tập đặc biệt E, G, F (chỉ phân loại hàng và vị trí, chưa xếp người cụ thể).
2. *Bước Cuồng nhân hoán vị:* Sau khi tính xong tổng số cấu trúc ở bảng, ta mới lấy kết quả đó nhân với $E! dot G! dot F! dot "Còn lại"!$ để xếp người vào.

== 1. Thiết lập hệ phương trình các loại hàng (Cases)
Do mỗi hàng có tối đa 1 ghế E, 1 ghế G, 1 ghế F, ta phân loại $R$ hàng thành 8 loại cấu trúc. Hãy xem *số cách xếp chỗ nội bộ* trong từng loại hàng:

- *Nhóm Hàng Hệ số 6 (Chứa 3 hoặc 2 người):*
  - $x$: Số hàng chứa cả $E, G, F$. Xếp 3 người vào 3 ghế: $3! = 6$ cách.
  - $y$: Số hàng chứa $E, G$. Chọn 2 ghế từ 3 ghế để xếp E,G: $A_3^2 = 6$ cách.
  - $z$: Số hàng chứa $E, F$. Chọn 2 ghế từ 3 ghế để xếp E,F: $A_3^2 = 6$ cách.
  - $t$: Số hàng chứa $G, F$. Chọn 2 ghế từ 3 ghế để xếp G,F: $A_3^2 = 6$ cách.
- *Nhóm Hàng Hệ số 3 (Chứa đúng 1 người):*
  - $u$: Số hàng chỉ chứa $E$. Chọn 1 ghế từ 3 ghế để xếp E: $C_3^1 = 3$ cách.
  - $v$: Số hàng chỉ chứa $G$. Chọn 1 ghế từ 3 ghế để xếp G: $C_3^1 = 3$ cách.
  - $w$: Số hàng chỉ chứa $F$. Chọn 1 ghế từ 3 ghế để xếp F: $C_3^1 = 3$ cách.
- *Nhóm Hàng Trống:*
  - $o$: Số hàng trống (không chứa $E, G, F$). Chỉ có 1 cách để trống.

Ta có *Hệ phương trình đếm cấu trúc*:
$
cases(
  x + y + z + u = E quad &(1) " (Tổng số chỗ E)",
  x + y + t + v = G quad &(2) " (Tổng số chỗ G)",
  x + z + t + w = F quad &(3) " (Tổng số chỗ F)",
  x + y + z + t + u + v + w + o = R quad &(4) " (Tổng số hàng)"
)
$

== 2. Rút gọn hệ và Thuật toán lập Bảng (Cases)
Thay vì duyệt $i, j, k$ như PIE, ta duyệt $x, z, t, y$:
$
cases(
  u = E - x - y - z,
  v = G - x - y - t,
  w = F - x - z - t,
  o = R - E - G - F + 2x + y + z + t
)
$
Điều kiện để $w \ge 0$ là: $x + z + t \le F$.
Khi cố định một bộ $(x, z, t)$ thỏa mãn, ta tìm khoảng của $y$:
$ max(0, E+G+F-R-2x-z-t) <= y <= min(E-x-z, G-x-t) $

#rev-box(title: "⚙️ Thuật toán xử lý và Bí ẩn của số 6 và 3")[
  - *Bước 1:* Lập bảng biện luận tất cả các dòng nghiệm (cases) $(x, y, z, t)$ thỏa mãn.
  - *Bước 2:* Với mỗi dòng, số cách chọn các hàng để phân bổ cho 8 loại cấu trúc là: $frac(R!, x! y! z! t! u! v! w! o!)$.
  - *Bước 3:* Nhờ phân tích ở trên, mỗi hàng loại $(x,y,z,t)$ tự sinh ra 6 cách xếp ghế bên trong nó, mỗi hàng loại $(u,v,w)$ sinh ra 3 cách. Vậy số cách chọn ghế *thực tế* cho dòng đó là:
    $ C = underbrace(frac(R!, x! y! z! t! u! v! w! o!), "Chọn hàng cho cấu trúc") dot underbrace(6^(x+y+z+t), "Xếp ghế nội bộ (hệ số 6)") dot underbrace(3^(u+v+w), "Xếp ghế nội bộ (hệ số 3)") $
  - *Bước 4:* Tính tổng các cấu trúc $C$ của mọi dòng, gọi là $N_("cấu trúc") = sum C$.
  - *Bước 5:* Cuồng nhân hoán vị người cụ thể vào vị trí:
    $ N_("thỏa mãn") = N_("cấu trúc") dot (E! dot G! dot F!) dot (3R - E - G - F)! $
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
    
    table_str = "    #align(center)[\n"
    table_str += "      #table(\n"
    table_str += "        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.8fr, 1.8fr, 2.5fr),\n"
    table_str += "        align: center + horizon,\n"
    table_str += "        fill: (col, row) => if row == 0 { rgb(\"EDE7F6\") } else { none },\n"
    table_str += "        [*$x$*], [*$y$*], [*$z$*], [*$t$*], [*$u$*], [*$v$*], [*$w$*], [*$o$*], [*Phân bổ hàng*], [*Phân bổ ghế*], [*Số cách cấu trúc*],\n"
    
    for sol in solutions:
        row_formula = f"frac({R}!, "
        den = []
        for v_name in ['x', 'y', 'z', 't', 'u', 'v', 'w', 'o']:
            val = sol[v_name]
            den.append(f"{val}!")
        row_formula += " ".join(den) + ")"
        
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
    
    content = f"""== {title}
*Đề bài:* {statement}

#cach1-box[
  - *Bước 1: Hệ phương trình đếm cấu trúc*
    Ta có $R={R}$ hàng, tổng $3R={3*R}$ ghế. Các đối tượng đặc biệt: $E={E}, G={G}, F={F}$. 
    Số đối tượng còn lại: ${3*R - E - G - F}$ ({avg_word}).
    Hệ điều kiện rút gọn:
    $
    cases(
      u &= {E} - x - y - z,
      v &= {G} - x - y - t,
      w &= {F} - x - z - t,
      o &= {R - E - G - F} + 2x + y + z + t
    )
    $
    Điều kiện biện luận chính: $x + z + t <= {F}$ và các biến phải là số tự nhiên.
    
  - *Bước 2: Lập bảng biện luận các nghiệm (Cases)*
    Với mỗi bộ $(x, z, t)$ ta suy ra khoảng của $y$: 
    $ max(0, {E + G + F - R} - 2x - z - t) <= y <= min({E} - x - z, {G} - x - t) $
    Lập bảng và tính số cấu trúc $C = frac({R}!, x! y! z! t! u! v! w! o!) dot 6^(x+y+z+t) dot 3^(u+v+w)$ cho mỗi Case:
    
{table_str}
    
  - *Bước 3: Cuồng nhân hoán vị đối tượng cụ thể*
    - Tổng số lượng cấu trúc ghế hợp lệ cho E, G, F là: $N_("cấu trúc") = {total_arr_math}$
    - Xếp cụ thể người vào các cấu trúc này, và người còn lại vào chỗ trống:
      $ N_("thỏa mãn") = N_("cấu trúc") dot (E! dot G! dot F!) dot ({3*R - E - G - F})! $
      $ N_("thỏa mãn") = {total_arr_math} dot ({E}! dot {G}! dot {F}!) dot {3*R - E - G - F}! $
      
  - *Bước 4: Tính xác suất*
    - Xác suất $p = frac(N_("thỏa mãn"), {3*R}!) = frac({total_arr_math} dot {E}! dot {G}! dot {F}! dot {3*R - E - G - F}!, {3*R}!)$
    - Rút gọn: $ p = frac({total_arr_math}, P_{3*R}^{E+G+F}) dot {E}! dot {G}! dot {F}! approx {prob:.8f} $
    - Giá trị $10000p approx {p_val_10k:.4f}$, làm tròn đến hàng đơn vị được *{p_rounded}*.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *{p_rounded}*.
]
"""
    return content

PROBLEMS_DATA = [
    {
        'index': 1,
        'title': "Bài toán 1 (Dễ — Phòng họp Hội đồng Quản trị: Lưới 3 cột 4 hàng)",
        'statement': "Một phòng họp có 12 chiếc ghế được xếp thành 3 cột 4 hàng. Có 12 đại biểu tham dự gồm 2 thành viên HĐQT (cấp E), 1 Giám đốc (cấp G), 1 Phó giám đốc (cấp F) và 8 nhân viên thường. Tính xác suất $p$ để không có hàng nào chứa quá 1 người cùng cấp E, hoặc cùng cấp G, hoặc cùng cấp F. Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 4, 'E': 2, 'G': 1, 'F': 1, 'avg_word': "nhân viên thường"
    },
    {
        'index': 2,
        'title': "Bài toán 2 (Dễ — Phân bổ Rạp chiếu phim: Lưới 3 cột 4 hàng)",
        'statement': "Một rạp chiếu phim mini có 12 ghế xếp thành 3 cột 4 hàng. Có 12 khách hàng gồm 3 khách VIP, 2 khách Hạng A, 1 khách Hạng B và 6 khách thường. Tính xác suất $p$ để mỗi hàng có không quá 1 khách cùng hạng (cùng VIP, cùng A, hoặc cùng B). Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 4, 'E': 3, 'G': 2, 'F': 1, 'avg_word': "khách thường"
    },
    {
        'index': 3,
        'title': "Bài toán 3 (Trung bình — Khoang hành khách Máy bay: Lưới 3 cột 5 hàng)",
        'statement': "Khoang hạng nhất của một máy bay có 15 ghế xếp thành 3 cột 5 hàng. Có 3 khách Thương gia, 2 khách Đặc biệt, 1 khách Thẻ vàng và 9 khách Thẻ bạc. Xếp ngẫu nhiên 15 hành khách này vào ghế. Tính xác suất $p$ để không có hàng nào chứa quá 1 khách cùng hạng Thương gia, hoặc cùng Đặc biệt, hoặc cùng Thẻ vàng. Tính $10000p$ (làm tròn kết quả đến hàng đơn vị)?",
        'R': 5, 'E': 3, 'G': 2, 'F': 1, 'avg_word': "khách Thẻ bạc"
    },
    {
        'index': 4,
        'title': "Bài toán 4 (Trung bình — Bố trí phòng thi chuẩn: Lưới 3 cột 5 hàng)",
        'statement': "Một phòng thi có 15 bàn xếp thành 3 cột 5 hàng. Có 15 thí sinh gồm 3 học sinh xuất sắc, 2 học sinh giỏi, 2 học sinh khá và 8 học sinh trung bình. Để đảm bảo phân loại, giám thị xếp chỗ ngẫu nhiên sao cho xác suất $p$ là khả năng không có hàng nào chứa quá 1 thí sinh cùng nhóm (xuất sắc, giỏi, khá). Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 5, 'E': 3, 'G': 2, 'F': 2, 'avg_word': "học sinh trung bình"
    },
    {
        'index': 5,
        'title': "Bài toán 5 (Khá — Xếp chỗ sự kiện Nhà hàng: Lưới 3 cột 6 hàng)",
        'statement': "Nhà hàng chuẩn bị 18 ghế (3 cột 6 hàng) cho một sự kiện kín. Danh sách khách mời gồm 3 khách hạng Kim cương, 3 khách hạng Vàng, 2 khách hạng Bạc và 10 khách hạng Tiêu chuẩn. Xếp chỗ ngẫu nhiên cho toàn bộ khách. Tính xác suất $p$ để không có hàng nào có từ 2 khách trở lên cùng hạng Kim cương, cùng Vàng, hoặc cùng Bạc. Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 6, 'E': 3, 'G': 3, 'F': 2, 'avg_word': "khách hạng Tiêu chuẩn"
    },
    {
        'index': 6,
        'title': "Bài toán 6 (Khá — Cuộc họp Đại hội đồng: Lưới 3 cột 6 hàng)",
        'statement': "Một hội trường có 18 ghế xếp thành 3 cột 6 hàng. Trong cuộc họp có 4 Bộ trưởng, 3 Thứ trưởng, 2 Cục trưởng và 9 chuyên viên. Ban tổ chức xếp chỗ ngẫu nhiên 18 người. Tính xác suất $p$ để mỗi hàng có không quá 1 người cùng chức vụ (Bộ trưởng, Thứ trưởng, Cục trưởng). Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 6, 'E': 4, 'G': 3, 'F': 2, 'avg_word': "chuyên viên"
    },
    {
        'index': 7,
        'title': "Bài toán 7 (Khó — Tuyển sinh Học bổng: Lưới 3 cột 7 hàng)",
        'statement': "Vòng phỏng vấn học bổng có 21 thí sinh gồm 4 sinh viên Y khoa, 3 sinh viên Bách khoa, 2 sinh viên Sư phạm và 12 sinh viên Kinh tế. Phòng chờ có 21 ghế xếp 3 cột 7 hàng. Xếp chỗ ngẫu nhiên. Tính xác suất $p$ để không có hàng nào có từ 2 sinh viên trở lên học cùng trường Y khoa, hoặc cùng Bách khoa, hoặc cùng Sư phạm. Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 7, 'E': 4, 'G': 3, 'F': 2, 'avg_word': "sinh viên Kinh tế"
    },
    {
        'index': 8,
        'title': "Bài toán 8 (Khó — Phân bổ đội hình Diễn tập: Lưới 3 cột 7 hàng)",
        'statement': "Một phân đội có 21 binh sĩ, trong đó có 5 đội trưởng, 4 lính bắn tỉa, 2 lính quân y và 10 lính bộ binh. Họ được xếp đội hình ngẫu nhiên vào 21 vị trí tạo thành 3 cột 7 hàng. Tính xác suất $p$ để không có hàng nào chứa quá 1 đội trưởng, hoặc quá 1 lính bắn tỉa, hoặc quá 1 lính quân y. Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 7, 'E': 5, 'G': 4, 'F': 2, 'avg_word': "lính bộ binh"
    },
    {
        'index': 9,
        'title': "Bài toán 9 (Thách thức — Buổi hoà nhạc Giao hưởng: Lưới 3 cột 8 hàng)",
        'statement': "Trên khán đài VIP của một buổi hoà nhạc có 24 ghế xếp thành 3 cột 8 hàng. Có 5 Nhạc trưởng, 3 Ca sĩ opera, 2 Nghệ sĩ vĩ cầm và 14 khán giả. Xếp chỗ ngẫu nhiên 24 người. Tính xác suất $p$ để mỗi hàng ghế không có quá một người cùng chức danh (Nhạc trưởng, Ca sĩ opera, Nghệ sĩ vĩ cầm). Tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 8, 'E': 5, 'G': 3, 'F': 2, 'avg_word': "khán giả"
    },
    {
        'index': 10,
        'title': "Bài toán 10 (Chặn 10 Đỉnh cao — Kì thi chọn Đội tuyển: Lưới 3 cột 8 hàng)",
        'statement': "Kì thi chọn đội tuyển Olympic tổ chức tại phòng thi có 24 bàn (3 cột 8 hàng). Có 6 học sinh chuyên Toán, 4 chuyên Lý, 3 chuyên Hóa và 11 chuyên Sinh. Đánh số báo danh ngẫu nhiên và xếp chỗ. Tính xác suất $p$ để không có hàng nào chứa từ 2 học sinh trở lên cùng chuyên Toán, hoặc cùng chuyên Lý, hoặc cùng chuyên Hóa. Hãy tính $10000p$ (làm tròn đến hàng đơn vị)?",
        'R': 8, 'E': 6, 'G': 4, 'F': 3, 'avg_word': "học sinh chuyên Sinh"
    }
]

typst_content = HEADER + THEORY_SECTION + "= Chương 2 — Hệ thống 10 Bài tập Thực chiến (Cấp độ từ Dễ đến Khó)\n\n"

for p_data in PROBLEMS_DATA:
    content = generate_problem_typst(
        p_data['index'], p_data['title'], p_data['statement'],
        p_data['R'], p_data['E'], p_data['G'], p_data['F'], p_data['avg_word']
    )
    typst_content += content
    if p_data['index'] < 10:
        typst_content += "\n#pagebreak()\n\n"

with open("/Users/admin/conictypst/typst/exams/CD-XepGhe-3Cot.typ", "w", encoding="utf-8") as f:
    f.write(typst_content)

print("Generated 10 problems Typst guide successfully!")
