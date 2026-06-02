import re
import codecs

with codecs.open('CD-ToMau.typ.bak', 'r', encoding='utf-8') as f:
    old_text = f.read()

# The new theory content
new_theory = r"""#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// CẤU HÌNH TRANG
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.88em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("004D40"), rgb("00695C"), rgb("00897B"), angle: 135deg),
  stroke: none,
  inset: (x: 16pt, y: 11pt),
  radius: 6pt,
  above: 1.9em,
  below: 1.3em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("00695C")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("00695C"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("BF360C"), size: 11pt, weight: "bold", "▸ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#let c-teal = rgb("00695C")
#let c-amber = rgb("BF360C")
#let c-green = rgb("1B5E20")

#let theory-box(body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 4pt + c-teal, rest: 0.8pt + rgb("80CBC4")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let cannon-box(title, body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 5pt + rgb("D84315"), rest: 0.7pt + rgb("FFAB91")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("BF360C"), weight: "bold")[🧨 #title]
  #v(0.35em)
  #body
]

#let note-box(title: "Ghi chú", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + c-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// TRANG BÌA
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("051F1A"), rgb("002B25"), rgb("004D40"), rgb("00695C"), angle: 150deg),
    inset: (x: 2.2cm, y: 1.8cm),
    radius: 12pt,
  )[
    #text(fill: rgb("80CBC4"), size: 11pt, weight: "bold")[CHUYÊN ĐỀ ĐỀ THI TUYỂN SINH 12]
    #v(0.6em)
    #text(fill: white, size: 28pt, weight: "black")[Tô Màu Ẩn Dụ: Đại Bác Vạn Năng]
    #v(0.15em)
    #text(fill: rgb("A7FFEB"), size: 14pt, style: "italic")[Một Nguyên Lý Bắn Nát Mọi Bài Toán Khó]
    #v(1.2em)
    #line(length: 60%, stroke: 1pt + rgb("80CBC4"))
  ]
]

#v(1.2em)

= Phần I: Vũ khí cốt lõi - Từ Súng Lục đến Đại Bác

Nhiều học sinh thường bối rối khi gặp các bài toán: "Lập số không có 2 chữ số kề nhau giống nhau", "Sơn nhà", "Tô màu bản đồ"... vì họ cố nhớ hàng tá công thức cho từng dạng. 
Chuyên đề này sẽ đập tan sự phức tạp đó. Bạn chỉ cần 2 vũ khí: **Súng Lục** (dùng cho hàng thẳng) và **Đại Bác Vạn Năng** (dùng cho vòng khép kín).

== 1. Súng Lục (Quy tắc nhân cho Hàng Thẳng)

Khi các đối tượng xếp thành 1 hàng ngang (hoặc 1 cành cây không khép kín).

#theory-box[
  **Tư duy Súng Lục:**
  - Ô đầu tiên được tự do chọn: có $k$ cách.
  - Từ ô thứ hai trở đi, mỗi ô chỉ cần KHÁC ô đứng ngay trước nó: có $k-1$ cách.
  
  **Công thức:** $N = k(k-1)^{n-1}$
]

== 2. Đại Bác Vạn Năng (Nguyên lý Xoá - Chập)

Khi đồ thị bị **khép kín** (tạo thành vòng tròn, lưới, bản đồ), "Súng Lục" bị vô hiệu hoá vì ô cuối cùng vừa phải khác ô áp chót, vừa phải khác ô đầu tiên. Lúc này, ta lôi **Đại Bác Vạn Năng** ra.

#cannon-box("Đại Bác Vạn Năng: Cắt Liên Kết - Trừ Dính Cục")[
  Muốn phá một vòng khép kín, ta chủ động **Cắt đứt một ranh giới (Xoá cạnh)** để nó duỗi ra thành hàng thẳng (hoặc hình dễ hơn). Nhưng khi cắt ranh giới, ta vô tình đếm thừa những trường hợp 2 ô đó bị trùng màu. Vậy ta phải **TRỪ ĐI** trường hợp 2 ô đó bị **Chập làm một (Chập đỉnh)**.
  
  $ \text{Đếm(Đồ thị gốc)} = \text{Đếm(Cắt 1 ranh giới)} - \text{Đếm(Chập 2 ô đó làm 1)} $
]

*Ví dụ minh hoạ sức mạnh Đại Bác với VÒNG TRÒN $n$ ĐỈNH:*
Cắt 1 cạnh của vòng tròn $n$ đỉnh $\rightarrow$ Ta được 1 hàng thẳng $n$ đỉnh.
Chập 2 đỉnh kề nhau của vòng tròn $\rightarrow$ Ta được 1 vòng tròn $(n-1)$ đỉnh.
Nên: $P_n = \text{HàngThẳng}(n) - P_{n-1} = k(k-1)^{n-1} - P_{n-1}$.
Giải hệ thức này, ta có công thức vòng tròn kinh điển: $(k-1)^n + (-1)^n(k-1)$. Nhưng bạn không cần học thuộc, chỉ cần nhớ cách Đại Bác bắn là ra!

#pagebreak()

= Phần II: Tám lớp vỏ bọc ngụy trang trong đề thi

Dưới đây là 8 "vỏ bọc" phổ biến nhất mà các đề thi thường ngụy trang. Tất cả đều sẽ bị bẻ gãy bởi Súng Lục hoặc Đại Bác Vạn Năng.

"""

# Extract the body from the old file starting from "== Đại Bác 1"
import re
match = re.search(r"==\s*Đại Bác 1(.*?)$", old_text, re.DOTALL)
if match:
    exercises_body = "== Lớp Vỏ 1" + match.group(1)
    # Replace "Đại Bác" with "Lớp Vỏ"
    exercises_body = re.sub(r"==\s*Đại Bác", "== Lớp Vỏ", exercises_body)
    # Also replace references to "đại bác" in text if needed
    exercises_body = exercises_body.replace("dùng đại bác", "dùng tư duy Đại Bác Vạn Năng")
else:
    exercises_body = ""

final_text = new_theory + exercises_body

with codecs.open('CD-ToMau.typ', 'w', encoding='utf-8') as f:
    f.write(final_text)

print("Done rewriting CD-ToMau.typ.")
