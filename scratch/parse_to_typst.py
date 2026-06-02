import re
import os

text_path = "/Users/admin/conictypst/typst/sach/lich-su-to-hop/extracted_text.txt"

with open(text_path, "r", encoding="utf-8") as f:
    text = f.read()

pages = text.split('\f')

def clean_text(t):
    # Strip carriage returns and leading/trailing whitespace
    return t.strip()

# Let's map page numbers to manual overrides for math formulas
# This allows us to handle complex math layouts that were split by pdftotext
page_overrides = {
    # Page 7: Pythagoras sum of first n integers
    7: [
        (r"Pythagorean đã chứng minh.*?\nSố tam giác thứ 𝑛.*", 
         'Số tam giác thứ $n$: $T_n = 1 + 2 + 3 + dots.h + n = frac(n(n+1), 2)$\n\nNgười Pythagorean đã chứng minh điều này bằng cách sắp xếp các điểm thành hình tam giác — một phương pháp đếm hình học đẹp.')
    ],
    # Page 8: Pythagoras Binet-like connection and formula
    8: [
        (r"𝑇1 = 1, 𝑇2 = 3,\n\n𝑇3 = 6, 𝑇4 = 10,\n\n𝑇5 = 15",
         "$T_1 = 1, T_2 = 3, T_3 = 6, T_4 = 10, T_5 = 15$"),
        (r"𝑛\+1\n𝑛\(𝑛 \+ 1\)\n\)=\n\)\n2", ""), # strip split formula
        (r"Nhận ra điều gì không\? Số tam giác chính là hệ số nhị thức \(.*?\)! Người Pythagoras.*?\nCông thức: 𝑇𝑛 = \(",
         "Nhận ra điều gì không? Số tam giác chính là hệ số nhị thức $binom(n+1, 2)$! Người Pythagoras chưa biết điều này, nhưng họ đã chạm tay vào nó.\n\nCông thức: $T_n = binom(n+1, 2)$")
    ],
    # Page 10: Varahamihira fraction
    10: [
        (r"16\n16 × 15 × 14 × 13\nLời giải: \( \) =\n= 1820\n4\n4×3×2×1",
         "Lời giải: $binom(16, 4) = frac(16 times 15 times 14 times 13, 4 times 3 times 2 times 1) = 1820$")
    ],
    # Page 11: Sum of integers and sum of squares
    11: [
        (r"∑𝑘 =\n𝑘=1\n\n  𝑛\(𝑛 \+ 1\)\n  ,\n  2", 
         "$sum_(k=1)^n k = frac(n(n+1), 2)$"),
        (r"∑ 𝑘2 = 𝑛\(𝑛 \+ 1\)\n  𝑘=1\n\n  2𝑛 \+ 1\n  6",
         "$sum_(k=1)^n k^2 = frac(n(n+1)(2n+1), 6)$"),
        (r"• Tổ hợp chập 𝑟 của 𝑛: \( \) =\n𝑟\n𝑟!\(𝑛 − 𝑟\)!",
         "- Tổ hợp chập $r$ của $n$: $binom(n, r) = frac(n!, r!(n-r)!)$")
    ],
    # Page 12: Bhaskara combination
    12: [
        (r"8\n8!\n8×7×6×5\nLời giải của Bhāskara: \( \) =\n\)=\n\) = 70\n4\n4! ⋅ 4!\n4×3×2×1",
         "Lời giải của Bhāskara: $binom(8, 4) = frac(8!, 4! dot 4!) = frac(8 times 7 times 6 times 5, 4 times 3 times 2 times 1) = 70$")
    ],
    # Page 14: Yang Hui combination
    14: [
        (r"𝑛\n𝑛\n𝑛\nTính chất kỳ diệu: Hàng thứ 𝑛 \(bắt đầu từ 𝑛 = 0\) chứa các số \( \), \( \), …, \( \).\n0\n1\n𝑛",
         "Tính chất kỳ diệu: Hàng thứ $n$ (bắt đầu từ $n=0$) chứa các số $binom(n, 0), binom(n, 1), dots.h, binom(n, n)$.")
    ],
    # Page 17: Ibn Mun'im combination
    17: [
        (r"• Chứng minh công thức tổ hợp \( \) = \(\n\)\+\(\n\)\n𝑘\n𝑘−1\n𝑘\n𝑛\n𝑛−1\n𝑛−1",
         "- Chứng minh công thức tổ hợp $binom(n, k) = binom(n-1, k-1) + binom(n-1, k)$")
    ],
    # Page 18: Fibonacci golden ratio & relation
    18: [
        (r"𝐹𝑛 = 𝐹𝑛−1 \+ 𝐹𝑛−2", "$F_n = F_(n-1) + F_(n-2)$"),
        (r"𝐹𝑛 =\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nvới 𝜑 =\n\(tỉ lệ vàng\)\n5\n2\n𝜑𝑛 − 𝜓 𝑛\n1\+ 5\n√\n√", 
         "$F_n = frac(phi^n - psi^n, sqrt(5))$ với $phi = frac(1 + sqrt(5), 2)$ (tỉ lệ vàng) và $psi = frac(1 - sqrt(5), 2)$"),
        (r"⌊𝑛/2⌋\n𝑛−𝑘\n𝐹𝑛\+1 = ∑ \(\n\)\n𝑘\n𝑘=0",
         "$F_(n+1) = sum_(k=0)^(lfloor n/2 rfloor) binom(n-k, k)$")
    ],
    # Page 29: Taxi cab number
    29: [
        (r"1729 = 13 \+ 123 = 93 \+ 103", "$1729 = 1^3 + 12^3 = 9^3 + 10^3$")
    ],
    # Page 37: RSA formula
    37: [
        (r"𝑎𝜑\(𝑛\) ≡ 1\(mod 𝑛\)", "$a^(phi(n)) equiv 1 pmod(n)$"),
        (r"𝜑\(𝑛\) = \(𝑝 − 1\)\(𝑞 − 1\)", "$phi(n) = (p-1)(q-1)$")
    ]
}

def clean_page(p_num, text):
    lines = text.splitlines()
    cleaned = []
    for l in lines:
        l_strip = l.strip()
        if not l_strip:
            continue
        # Strip running headers and page footers
        if "Lịch Sử Đại Số Tổ Hợp" in l_strip:
            continue
        if "Nguyễn Văn Sang" in l_strip:
            continue
        if re.match(r'^—\s*\d+\s*—$', l_strip):
            continue
        cleaned.append(l)
    return "\n".join(cleaned)

# Rebuild page contents by applying overrides and regex
def process_content():
    # Write setup
    output = []
    
    # We can read setup from known_lines.txt or write it directly
    setup = """// ═══════════════════════════════════════════════════════════════════════
// LỊCH SỬ ĐẠI SỐ TỔ HỢP — TỪ ĐẾM ĐẾN TOÁN HỌC HIỆN ĐẠI
// Một hành trình xuyên thời gian qua các bài toán, phát minh và con người
// Biên soạn: Nguyễn Văn Sang
// ═══════════════════════════════════════════════════════════════════════

#set page(
  paper: "a4",
  margin: (x: 1.7cm, top: 2.4cm, bottom: 2.8cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8pt, fill: rgb("#6B4A1E"), style: "italic")[
            Lịch Sử Đại Số Tổ Hợp — Từ Đếm Đến Toán Học Hiện Đại
          ]
        ],
        align(right)[
          #text(size: 8pt, fill: rgb("#7B1D1D"), weight: "bold")[
            Nguyễn Văn Sang
          ]
        ],
      )
      v(2pt)
      line(length: 100%, stroke: 0.5pt + rgb("#C4A265"))
    }
  },
  footer: align(center, context {
    let n = counter(page).get().first()
    if n > 1 {
      line(length: 100%, stroke: 0.4pt + rgb("#E8D9C0"))
      v(2pt)
      text(size: 9pt, fill: rgb("#8B7355"))[— #counter(page).display() —]
    }
  }),
)

#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.92em, first-line-indent: 1.2em)
#set list(indent: 1.2em, body-indent: 0.6em)
#set enum(indent: 1.2em, body-indent: 0.6em)
#show math.equation: set text(fill: rgb("#1a0a00"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display
#show heading: it => {
  set par(first-line-indent: 0em)
  it
}

// ─── Màu sắc chủ đạo ───────────────────────────────────────────────
#let C-PARCHMENT  = rgb("#FFFBF0")
#let C-BROWN      = rgb("#5C3A1E")
#let C-GOLD       = rgb("#C9A227")
#let C-AMBER      = rgb("#B45309")
#let C-WINE       = rgb("#7F1D1D")
#let C-FOREST     = rgb("#1B5E20")
#let C-NAVY       = rgb("#1F3A5F")
#let C-TEAL       = rgb("#00695C")
#let C-PURPLE     = rgb("#5B21B6")
#let C-SLATE      = rgb("#334155")
#let C-ORANGE     = rgb("#C2410C")

// ─── Hộp nội dung ──────────────────────────────────────────────────
#let era-box(period, place, body) = block(
  fill: rgb("#FFF7ED"),
  stroke: (left: 6pt + C-ORANGE),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 10pt),
  width: 100%,
  above: 1.4em,
  below: 1.4em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-ORANGE, weight: "bold", size: 11pt)[
    📅 #period  ·  🗺 #place
  ]
  #v(0.6em)
  #body
]

#let author-box(name, info, body) = block(
  fill: rgb("#F0FDF4"),
  stroke: (left: 6pt + C-TEAL),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 10pt),
  width: 100%,
  above: 1.4em,
  below: 1.4em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 11pt)[
    👤 #name (#info)
  ]
  #v(0.6em)
  #body
]

#let discovery-box(title, body) = block(
  fill: rgb("#EFF6FF"),
  stroke: (left: 6pt + C-NAVY),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 10pt),
  width: 100%,
  above: 1.4em,
  below: 1.4em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-NAVY, weight: "bold", size: 11pt)[
    💡 PHÁT MINH — #title
  ]
  #v(0.6em)
  #body
]

#let problem-box(title, body) = block(
  fill: rgb("#FEF2F2"),
  stroke: (left: 6pt + C-WINE),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 10pt),
  width: 100%,
  above: 1.4em,
  below: 1.4em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-WINE, weight: "bold", size: 11pt)[
    🔥 #title
  ]
  #v(0.6em)
  #body
]

#let insight-box(title, body) = block(
  fill: rgb("#FFFBEB"),
  stroke: (left: 6pt + C-AMBER),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 10pt),
  width: 100%,
  above: 1.4em,
  below: 1.4em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-AMBER, weight: "bold", size: 11pt)[
    🧠 #title
  ]
  #v(0.6em)
  #body
]

#let bridge-box(title, body) = block(
  fill: rgb("#F5F3FF"),
  stroke: (left: 6pt + C-PURPLE),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 10pt),
  width: 100%,
  above: 1.4em,
  below: 1.4em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 11pt)[
    🌉 #title
  ]
  #v(0.6em)
  #body
]

#let meta-box(title, body) = block(
  fill: rgb("#F8FAFC"),
  stroke: (left: 6pt + C-SLATE),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 10pt),
  width: 100%,
  above: 1.4em,
  below: 1.4em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-SLATE, weight: "bold", size: 11pt)[
    🔑 #title
  ]
  #v(0.6em)
  #body
]

#let quote-block(author, quote) = block(
  fill: rgb("#FFFBF0"),
  stroke: (left: 3pt + C-GOLD),
  inset: (x: 12pt, y: 8pt),
  radius: (right: 4pt),
  width: 100%,
  above: 1em,
  below: 0.5em,
)[
  #set par(first-line-indent: 0em)
  #text(style: "italic", size: 10pt)[#quote]
  #align(right)[#text(size: 9.5pt, fill: C-AMBER, weight: "bold")[— #author —]]
]

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(
    fill: gradient.linear(C-BROWN, rgb("#3d1f08"), angle: 90deg),
    inset: (x: 18pt, y: 12pt),
    radius: 5pt,
    width: 100%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-GOLD, weight: "black", size: 15pt)[#it.body]
  ]
  v(1em)
}

#show heading.where(level: 2): it => block(
  fill: rgb("#FFFBF0"),
  stroke: (left: 3pt + C-GOLD),
  inset: (x: 12pt, y: 8pt),
  radius: (right: 4pt),
  width: 100%,
  above: 1.5em,
  below: 0.8em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-AMBER, weight: "bold", size: 11.5pt)[#it.body]
]

// ═══════════════════════════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════════════════════════

#block(
  width: 100%,
  fill: gradient.linear(rgb("#1A0A00"), rgb("#3D1F08"), rgb("#5C3A1E"), angle: 145deg),
  inset: (x: 30pt, y: 44pt),
  radius: 16pt,
  clip: true,
)[
  #align(center)[
    #text(fill: C-GOLD, size: 10pt, weight: "bold", tracking: 5pt)[
      BỘ SÁCH KHAI MỞ TOÁN HỌC
    ]
    #v(1.2em)
    #text(fill: white, size: 28pt, weight: "black")[
      LỊCH SỬ ĐẠI SỐ TỔ HỢP
    ]
    #v(0.6em)
    #text(fill: rgb("#FFD580"), size: 17pt, style: "italic")[
      Từ Đếm Đến Tất Cả
    ]
    #v(0.4em)
    #text(fill: rgb("#C8E6C9"), size: 13pt, style: "italic")[
      Một Cái Cây Xuyên Suốt Lịch Sử Toán Học
    ]
    #v(1.4em)
    #box(stroke: 1pt + white.transparentize(40%), inset:(x:22pt,y:13pt), radius:8pt)[
      #text(fill: white, weight: "bold", size: 13pt)[★ GV Nguyễn Văn Sang]
      #linebreak()
      #text(fill: white.transparentize(30%), size: 10pt)[
        SĐT: 0389.821.115 · Tổ Toán – Tài liệu Thực chiến THPT
      ]
    ]
  ]
]

#pagebreak()

// ═══════════════════════════════════════════════════════════════════
// MỤC LỤC
// ═══════════════════════════════════════════════════════════════════

#outline(title: text(fill: C-BROWN, weight: "bold", size: 16pt)[MỤC LỤC], depth: 2, indent: auto)

#pagebreak()
"""
    output.append(setup)
    
    # We will loop through the pages starting from Page 4 (which is the Introduction)
    for p_num in range(4, len(pages) + 1):
        p_text = pages[p_num - 1]
        
        # Clean page first
        p_text = clean_page(p_num, p_text)
        if not p_text.strip():
            continue
            
        # Apply page-specific manual overrides
        if p_num in page_overrides:
            for pattern, replacement in page_overrides[p_num]:
                p_text = re.sub(pattern, replacement, p_text, flags=re.DOTALL)
                
        # Parse text into lines
        lines = p_text.splitlines()
        
        output.append(f"\n// --- PAGE {p_num} ---\n")
        
        # Parser state variables
        in_box = None
        box_args = []
        box_body = []
        
        def flush_box():
            nonlocal in_box, box_args, box_body
            if in_box:
                body_content = "\n  ".join(box_body)
                if in_box == "era-box":
                    output.append(f'#era-box("{box_args[0]}", "{box_args[1]}")[\n  {body_content}\n]\n')
                elif in_box == "author-box":
                    output.append(f'#author-box("{box_args[0]}", "{box_args[1]}")[\n  {body_content}\n]\n')
                elif in_box == "quote-block":
                    output.append(f'#quote-block("{box_args[0]}", "{body_content}")\n')
                else:
                    output.append(f'#{in_box}("{box_args[0]}")[\n  {body_content}\n]\n')
                in_box = None
                box_args = []
                box_body = []
                
        for l in lines:
            l_strip = l.strip()
            if not l_strip:
                continue
                
            # Detect Chapter Headings (level 1)
            if "CHƯƠNG " in l_strip or "PHỤ LỤC " in l_strip or "LỜI KẾT " in l_strip:
                flush_box()
                # If chapter title spans multiple lines, we join them later or clean them
                output.append(f"\n= {l_strip}\n")
                continue
                
            # Detect Era Box
            if l_strip.startswith("📅"):
                flush_box()
                parts = l_strip.split(" · ")
                period = parts[0].replace("📅", "").strip()
                place = parts[1].replace("🗺", "").strip() if len(parts) > 1 else ""
                in_box = "era-box"
                box_args = [period, place]
                continue
                
            # Detect Author Box
            if l_strip.startswith("👤"):
                flush_box()
                # Format: 👤 Name (Info)
                # Let's extract the name and info
                m = re.match(r'^👤\s*(.*?)\s*\((.*?)\)$', l_strip)
                if m:
                    name = m.group(1).strip()
                    info = m.group(2).strip()
                else:
                    name = l_strip.replace("👤", "").strip()
                    info = ""
                in_box = "author-box"
                box_args = [name, info]
                continue
                
            # Detect Problem Box
            if l_strip.startswith("🔥"):
                flush_box()
                title = l_strip.replace("🔥", "").strip()
                in_box = "problem-box"
                box_args = [title]
                continue
                
            # Detect Discovery Box
            if l_strip.startswith("💡"):
                flush_box()
                title = l_strip.replace("💡", "").strip()
                in_box = "discovery-box"
                box_args = [title]
                continue
                
            # Detect Insight Box
            if l_strip.startswith("🧠"):
                flush_box()
                title = l_strip.replace("🧠", "").strip()
                in_box = "insight-box"
                box_args = [title]
                continue
                
            # Detect Bridge Box
            if l_strip.startswith("🌉"):
                flush_box()
                title = l_strip.replace("🌉", "").strip()
                in_box = "bridge-box"
                box_args = [title]
                continue
                
            # Detect Meta Box
            if l_strip.startswith("🔑"):
                flush_box()
                title = l_strip.replace("🔑", "").strip()
                in_box = "meta-box"
                box_args = [title]
                continue
                
            # Detect Quote block
            if l_strip.startswith("—") and len(l_strip) > 2 and in_box is None:
                # This might be the author citation of a quote-block.
                # If previous lines exist, we can turn the last paragraph into a quote-block.
                # However, quotes are usually short, so we can handle them manually or by simple heuristics.
                pass
                
            # Detect level 2 subheadings (e.g. short standalone line without periods)
            # Make sure it's not inside a box and not starting with lists
            if in_box is None and len(l_strip) < 70 and not l_strip.endswith(".") and not l_strip.startswith("•") and not l_strip.startswith("-") and re.match(r'^[A-ZẮẰẲẴẶẤẦẨẪẬẾỀỂỄỆỐỒỔỖỘỚỜỞỠỢỨỪỬỮỰÝỲỶỸỴĐa-z][a-z0-9A-ZẮẰẲẴẶẤẦẨẪẬẾỀỂỄỆỐỒỔỖỘỚỜỞỠỢỨỪỬỮỰÝỲỶỸỴĐ\s,\-’\':()–]*$', l_strip):
                flush_box()
                output.append(f"\n== {l_strip}\n")
                continue
                
            # Process normal paragraph lines
            # Replace italic variables like 𝑎, 𝑏 with $a$, $b$
            line_processed = l_strip
            
            # Simple conversion map for italic math symbols
            math_chars = {
                '𝑎': '$a$', '𝑏': '$b$', '𝑐': '$c$', '𝑑': '$d$', '𝑒': '$e$', 
                '𝑓': '$f$', '𝑔': '$g$', 'ℎ': '$h$', '𝑖': '$i$', '𝑗': '$j$',
                '𝑘': '$k$', '𝑙': '$l$', '𝑚': '$m$', '𝑛': '$n$', '𝑜': '$o$',
                '𝑝': '$p$', '𝑞': '$q$', '𝑟': '$r$', '𝑠': '$s$', '𝑡': '$t$',
                '𝑢': '$u$', '𝑣': '$v$', '𝑤': '$w$', '𝑥': '$x$', '𝑦': '$y$',
                '𝑧': '$z$',
                '𝐴': '$A$', '𝐵': '$B$', '𝐶': '$C$', '𝐷': '$D$', '𝐸': '$E$',
                '𝐹': '$F$', '𝐺': '$G$', '𝐻': '$H$', '𝐼': '$I$', '𝐽': '$J$',
                '𝐾': '$K$', '𝐿': '$L$', '𝑀': '$M$', '𝑁': '$N$', '𝑂': '$O$',
                '𝑃': '$P$', '𝑄': '$Q$', '𝑅': '$R$', '𝑆': '$S$', '𝑇': '$T$',
                '𝑈': '$U$', '𝑉': '$V$', '𝑊': '$W$', '𝑋': '$X$', '𝑌': '$Y$',
                '𝑍': '$Z$',
                '𝜋': '$pi$', '𝜑': '$phi$', '𝜓': '$psi$'
            }
            # Replace character by character
            # If the character stands alone or is surrounded by spaces/punctuation, we replace it
            for char, repl in math_chars.items():
                line_processed = line_processed.replace(char, repl)
                
            # Fix double $$ when multiple characters are replaced kề nhau
            line_processed = re.sub(r'\$\$', '', line_processed)
            # Remove double spaces
            line_processed = re.sub(r'\s+', ' ', line_processed)
            
            if in_box:
                box_body.append(line_processed)
            else:
                output.append(line_processed + "\n")
                
        flush_box()
        
    return "\n".join(output)

# Run process
rebuilt_typ = process_content()

# Save to typst file
out_typ_path = "/Users/admin/conictypst/typst/sach/lich-su-to-hop/lich-su-dai-so-to-hop.typ"
with open(out_typ_path, "w", encoding="utf-8") as out_f:
    out_f.write(rebuilt_typ)

print("Typst file generated successfully!")
