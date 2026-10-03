import os
import re

beamer_dir = "/Users/admin/conictypst/typst/beamer/chuong3-day-so"
chuong3_dir = "/Users/admin/conictypst/typst/sach/day-so-chuong3"

preamble_template = """#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-{BAI}
// Toán 11 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer.typ": *
#import "../../bbt.typ": *
#import "../../modules/fractals.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)

#show: lecture-theme.with(
  title:       "{TITLE}",
  subtitle:    "TOÁN 11 — Chương III: Dãy số. Cấp số cộng và Cấp số nhân",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

#let c-book = rgb("#4338CA")
#let resetexamstate() = none
#let khoitao() = none
#let resetcau() = none
#let exam-part(title, ..args) = slide[= #title]
#let q-wrap(..args) = args.pos().at(0)
#let mybox(fill, stroke, ..args) = {
  let pos = args.pos()
  let title = if pos.len() > 1 { pos.at(0) } else { none }
  let body = if pos.len() > 1 { pos.at(1) } else { pos.at(0) }
  block(fill: fill, stroke: 1pt + stroke, inset: 10pt, width: 100%, radius: 4pt, [*#title* #body])
}
#let dn(..args) = mybox(luma(240), black, ..args)
#let vd(..args) = mybox(rgb("#e8f4f8"), blue, ..args)
#let tc(..args) = mybox(rgb("#fcf4cd"), orange, ..args)
#let kl(..args) = mybox(rgb("#eaf8e6"), green, ..args)
#let nx(..args) = mybox(rgb("#fce4ec"), red, ..args)
#let hq = kl
#let luuy = nx
#let ch = nx
#let ntkq = tc
#let chame = kl
#let ghinho = kl
#let phuongphap = tc
#let nhanxet = nx

#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd
#let tn = my-tn
#let ds = my-ds
#let tln = my-tln
#let tl = my-tln
#let tlu = my-tln

"""

lessons = [
    {
        "bai_id": "BÀI 1",
        "title": "BÀI 1: DÃY SỐ",
        "history": """#slide[ = Gợi mở: Mật mã của Tự nhiên ]
#lt-two-col(ratio: (50%, 50%), [
- Từ xa xưa, con người đã quan sát thấy quy luật kì lạ trong tự nhiên:
  - Số lượng cánh hoa cúc thường là $13, 21, 34,...$
  - Trôn ốc sên lớn dần theo một tỷ lệ vàng tuyệt mĩ.
- Khái niệm *Dãy số* ra đời không phải từ những công thức khô khan, mà từ nỗ lực "giải mã" sự sắp đặt của tạo hóa!
- *Leonardo Fibonacci (1170–1250)* đã mô phỏng lại sự sinh sản của loài thỏ và vô tình tìm ra *Dãy Fibonacci* nổi tiếng: $1, 1, 2, 3, 5, 8, 13,...$
], [
  #align(center)[
    #rect(fill: rgb("#eaf8e6"), stroke: 1pt, inset: 10pt)[Toán học không chỉ là tính toán, nó là sự cảm nhận quy luật của vạn vật!]
  ]
])
""",
        "theory_file": "c3-b1.typ",
        "quiz_file": "c3-b1-de1.typ",
        "output_file": "beamer-11-c3-bai-1-day-so.typ"
    },
    {
        "bai_id": "BÀI 2",
        "title": "BÀI 2: CẤP SỐ CỘNG",
        "history": """#slide[ = Lịch sử: Sự tăng trưởng tuyến tính ]
- Câu chuyện nổi tiếng về thần đồng *Carl Friedrich Gauss* lúc 7 tuổi: Thầy giáo yêu cầu cả lớp tính tổng từ $1$ đến $100$. Trong vài giây, Gauss đưa ra đáp án $5050$ bằng cách nhận ra $1+100 = 101, 2+99 = 101,...$
- Phép tính của Gauss chính là công thức tính tổng của một *Cấp số cộng*!
- *Ứng dụng:* Cấp số cộng được dùng để tính toán khấu hao tài sản đều đặn mỗi năm, thiết kế các bậc thang (mỗi bậc cao hơn bậc trước một khoảng không đổi), hay dự đoán sản lượng đều đặn của một nhà máy.
""",
        "theory_file": "c3-b2.typ",
        "quiz_file": "c3-b2-de1.typ",
        "output_file": "beamer-11-c3-bai-2-cap-so-cong.typ"
    },
    {
        "bai_id": "BÀI 3",
        "title": "BÀI 3: CẤP SỐ NHÂN",
        "history": """#slide[ = Sức mạnh khủng khiếp của Lãi Kép ]
- Giai thoại Ấn Độ: Người phát minh ra cờ vua xin phần thưởng là những hạt thóc trên bàn cờ. Ô thứ nhất $1$ hạt, ô thứ hai $2$ hạt, ô thứ ba $4$ hạt... Nhà vua tưởng rất ít, nhưng tổng số thóc lại đủ che phủ toàn bộ Trái Đất! Đó chính là sức mạnh của sự *tăng trưởng bùng nổ* của Cấp số nhân.
- *Albert Einstein* từng nói: "Lãi suất kép là kỳ quan thứ 8 của thế giới. Những ai hiểu được nó sẽ kiếm được nó, ai không hiểu sẽ phải trả giá cho nó."
- Việc lây lan của virus trong đại dịch, phản ứng phân hạch hạt nhân, hay gửi tiết kiệm ngân hàng... tất cả đều là hiện thân của Cấp Số Nhân.
""",
        "theory_file": "c3-b3.typ",
        "quiz_file": "c3-b3-de1.typ",
        "output_file": "beamer-11-c3-bai-3-cap-so-nhan.typ"
    }
]

def clean_file_content(content):
    content = re.sub(r'#import\s+".*?":.*?\n', '', content)
    content = content.replace('#import "../bbt.typ": *', '')
    content = content.replace('#import "@preview/cetz:0.5.2"', '')
    # Adjust canvas length for beamer visibility
    content = re.sub(r'canvas\(\s*length\s*:\s*0\.[0-9]+cm', r'canvas(length: 1cm', content)
    
    # Remove #muc commands if present
    content = re.sub(r'#muc.*', '', content)
    # Remove #lesson commands if present
    content = re.sub(r'#lesson.*', '', content)
    # Remove #q-label commands if present
    content = re.sub(r'#q-label.*', '', content)
    # Remove #show: doc-setup 
    content = re.sub(r'#show:\s*doc-setup.*?\n', '', content)
    # Remove #include 
    content = re.sub(r'#include\s+".*?"', '', content)
    # Fix shadowed int(
    content = content.replace('int(', 'std.int(')
    
    # Fix typst bolding (Typst uses * for bold, not *)
    content = content.replace('*', '*')

    # Some old macros might be replaced
    return content

for lesson in lessons:
    preamble = preamble_template.replace("{BAI}", lesson['bai_id'].replace(" ", "")).replace("{TITLE}", lesson['title'])
    
    out_content = preamble + "\n" + lesson['history'] + "\n\n"
    
    # Include Theory
    theory_path = os.path.join(chuong3_dir, lesson['theory_file'])
    if os.path.exists(theory_path):
        with open(theory_path, 'r', encoding='utf-8') as f:
            theory_content = f.read()
            theory_content = clean_file_content(theory_content)
            out_content += "#slide[ = Cơ sở lý thuyết ]\n"
            out_content += theory_content + "\n\n"
    else:
        print(f"Warning: Missing theory file {theory_path}")
        
    # Include Quiz
    quiz_path = os.path.join(chuong3_dir, lesson['quiz_file'])
    if os.path.exists(quiz_path):
        with open(quiz_path, 'r', encoding='utf-8') as f:
            quiz_content = f.read()
            quiz_content = clean_file_content(quiz_content)
            out_content += "#slide[ = Bài tập Luyện tập ]\n"
            out_content += quiz_content + "\n\n"
    else:
        print(f"Warning: Missing quiz file {quiz_path}")

    # Write output
    out_path = os.path.join(beamer_dir, lesson['output_file'])
    with open(out_path, 'w', encoding='utf-8') as f:
        f.write(out_content)
        
    print(f"Generated {lesson['output_file']}")

print("All Beamer slide templates generated successfully.")
