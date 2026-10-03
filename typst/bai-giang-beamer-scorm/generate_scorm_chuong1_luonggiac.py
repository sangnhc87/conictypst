import os
import re

beamer_dir = "/Users/admin/conictypst/typst/beamer/chuong1-luong-giac"
chuong1_dir = "/Users/admin/conictypst/typst/sach/luong-giac-chuong1"

preamble_template = """#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-{BAI}
// Toán 11 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer.typ": *
#import "../../bbt.typ": *
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
  subtitle:    "TOÁN 11 — Chương I: Hàm số lượng giác và Phương trình lượng giác",
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
        "title": "BÀI 1: GÓC LƯỢNG GIÁC",
        "history": """#slide[ = Bối cảnh lịch sử: Khởi nguồn của Góc Lượng Giác ]
#lt-two-col(ratio: (60%, 40%), [
- Tại sao một vòng tròn lại là $360^degree$? 
- Hơn 4000 năm trước, *người Babylon cổ đại* sử dụng hệ đếm cơ số 60 (lục phân). Họ cho rằng một năm có 360 ngày, và chia bầu trời thành 360 phần bằng nhau để lập bản đồ các vì sao.
- *Hipparchus (190 - 120 TCN)*, nhà thiên văn học Hy Lạp được mệnh danh là "cha đẻ của lượng giác", đã sử dụng các đo đạc này để dự đoán nhật thực và vị trí các vì sao.
- *Tại sao lại cần Radian?* Mặc dù $360^degree$ rất tiện để chia nhỏ, nhưng nó là một con số "nhân tạo". Khái niệm *Radian* ra đời vào thế kỷ 18 để tạo ra một đơn vị tự nhiên, liên kết trực tiếp giữa góc và độ dài cung tròn. Nhờ Radian, các công thức giải tích lượng giác trở nên cực kỳ gọn gàng.
], [
  #align(center)[
    #rect(fill: luma(240), stroke: 1pt, inset: 10pt)[Hình ảnh biểu diễn bảng đất sét Plimpton 322 của Babylon]
  ]
])
""",
        "theory_file": "c1-b1.typ",
        "quiz_file": "c1-b1-de1.typ",
        "output_file": "beamer-11-bai-1-goc-luong-giac.typ"
    },
    {
        "bai_id": "BÀI 2",
        "title": "BÀI 2: HÀM SỐ LƯỢNG GIÁC",
        "history": """#slide[ = Lịch sử & Nguồn gốc thuật ngữ "Sine" ]
- *Một sự dịch thuật nhầm lẫn thú vị*:
  - Ở Ấn Độ cổ đại, nhà toán học *Aryabhata* gọi nửa dây cung là "jya-ardha", sau đó gọi tắt là *"jya"* (dây cung).
  - Khi người Ả Rập dịch sách Ấn Độ, họ phiên âm thành *"jiba"*. Trong tiếng Ả Rập, nguyên âm thường bị lược bỏ nên viết là "jb".
  - Thế kỷ 12, khi học giả châu Âu dịch sách Ả Rập sang tiếng Latin, họ đọc nhầm "jb" thành "jaib" (nghĩa là "vịnh biển" hoặc "nếp gấp quần áo"), và dịch sang tiếng Latin là *"Sinus"*. 
  - Từ đó, chúng ta có từ *Sine*!

- *Ứng dụng vũ trụ*: Hàm lượng giác là công cụ tối thượng để mô hình hóa *mọi hiện tượng tuần hoàn* trong vũ trụ: thủy triều, nhịp tim sinh học, chu kỳ kinh tế, dao động của con lắc.
""",
        "theory_file": "c1-b2.typ",
        "quiz_file": "c1-b2-de1.typ",
        "output_file": "beamer-11-bai-2-ham-so-luong-giac.typ"
    },
    {
        "bai_id": "BÀI 3",
        "title": "BÀI 3: PHƯƠNG TRÌNH LƯỢNG GIÁC",
        "history": """#slide[ = Ứng dụng: Tại sao phải giải phương trình lượng giác? ]
#lt-two-col(ratio: (50%, 50%), [
- Việc tính $f(x) = sin(x)$ cho ta biết "kết quả" ở một thời điểm (Ví dụ: tính mực nước thủy triều lúc 6h sáng).
- Tuy nhiên, trong thực tế, các kỹ sư thường phải giải quyết *bài toán ngược*:
  - "Vào lúc nào thì mực nước đạt độ sâu 2 mét để tàu thủy có thể cập cảng an toàn?"
  - "Góc quay của súng đại bác phải là bao nhiêu để đạn trúng mục tiêu ở khoảng cách $L$?"
- Đó chính là lúc chúng ta cần phải giải các phương trình như $cos(x) = m$, hay $sin(x) = m$.
], [
  #align(center)[
    #rect(fill: rgb("#e8f4f8"), stroke: 1pt, inset: 10pt)[Phương trình lượng giác là chìa khóa để "quay ngược thời gian" trong các bài toán tuần hoàn!]
  ]
])
""",
        "theory_file": "c1-b3.typ",
        "quiz_file": "c1-b3-de1.typ",
        "output_file": "beamer-11-bai-3-phuong-trinh-luong-giac.typ"
    },
    {
        "bai_id": "BÀI 4",
        "title": "BÀI 4: CÁC CÔNG THỨC LƯỢNG GIÁC",
        "history": """#slide[ = Lịch sử: "Prosthaphaeresis" - Máy tính của thế kỷ 16 ]
- Trước thế kỷ 17 (khi Logarit ra đời), các nhà thiên văn học phải đối mặt với một cơn ác mộng: *Nhân các số thập phân cực kỳ dài với nhau* bằng tay.
- Thế kỷ 16, các nhà toán học đã phát minh ra kỹ thuật *Prosthaphaeresis* (tiếng Hy Lạp nghĩa là "Cộng và Trừ").
- Họ sử dụng *công thức biến đổi tích thành tổng*:
  $ cos(A)cos(B) = 1/2 [cos(A+B) + cos(A-B)] $
- Bằng cách tra bảng lượng giác, họ biến bài toán nhân khổng lồ thành một bài toán cộng/trừ đơn giản. Đây chính là tiền thân của máy tính!
""",
        "theory_file": "c1-b4.typ",
        "quiz_file": "c1-b4-de1.typ",
        "output_file": "beamer-11-bai-4-cong-thuc-luong-giac.typ"
    },
    {
        "bai_id": "BÀI 5",
        "title": "BÀI 5: TỔNG HỢP & ỨNG DỤNG LIÊN MÔN",
        "history": """#slide[ = Ứng dụng Liên Môn: Cơ học & Điện từ ]
- Lượng giác không chỉ nằm trong Toán học. Nó là ngôn ngữ của Vật Lý.
- Nhờ lượng giác, Nikola Tesla đã thiết kế hệ thống *dòng điện xoay chiều (AC)* vận hành thế giới ngày nay:
  $ i = I_0 cos(omega t + phi) $
- Chuỗi *Fourier* chứng minh rằng: Bất kỳ một âm thanh nào, dù phức tạp đến đâu (tiếng nói, tiếng đàn Piano), đều có thể được phân tích thành tổng của các hàm $sin$ và $cos$ đơn giản.
""",
        "theory_file": "c1-b5.typ",
        "quiz_file": "c1-b5-de1.typ",
        "output_file": "beamer-11-bai-5-ung-dung-lien-mon.typ"
    },
    {
        "bai_id": "BÀI 6",
        "title": "BÀI 6: HÀM SỐ y = a sin x + b cos x",
        "history": """#slide[ = Khám phá: Sự giao thoa của hai làn sóng ]
- Điều gì xảy ra khi hai sóng gặp nhau?
- Bài toán xét hàm số $y = a sin x + b cos x$ chính là việc tìm kết quả của *sự tổng hợp hai dao động điều hòa* cùng tần số.
- Thay vì xử lý hai thành phần rời rạc, các nhà toán học đã tìm ra phép biến đổi kỳ diệu để gộp chúng lại thành một biên độ duy nhất $R$ và một pha ban đầu $phi$. 
- Đây là cốt lõi của hiện tượng *giao thoa* trong âm học và quang học!
""",
        "theory_file": "c1-b6.typ",
        "quiz_file": "c1-b6-de1.typ",
        "output_file": "beamer-11-bai-6-ham-tong-hop.typ"
    },
    {
        "bai_id": "BÀI 7",
        "title": "BÀI 7: BẤT PHƯƠNG TRÌNH LƯỢNG GIÁC",
        "history": """#slide[ = Tầm quan trọng của miền giới hạn ]
- Trong kỹ thuật cơ khí và thiết kế hệ thống nhún của ô tô, việc dao động vượt qua một giới hạn cho phép có thể gây vỡ kết cấu (hiện tượng *Cộng hưởng*).
- Bất phương trình lượng giác ($sin x < m$) giúp các kỹ sư thiết lập "miền an toàn".
- Bài toán tìm khoảng thời gian mà một nhà máy điện có thể hoạt động tối ưu dựa theo sự lên xuống của thủy triều cũng được mô hình bằng bất phương trình.
""",
        "theory_file": "c1-b7.typ",
        "quiz_file": "c1-b7-de1.typ",
        "output_file": "beamer-11-bai-7-bat-phuong-trinh.typ"
    },
    {
        "bai_id": "BÀI 13",
        "title": "BÀI 13: ĐỊNH LÝ SIN VÀ ĐỊNH LÝ CÔSIN",
        "history": """#slide[ = Lịch sử: Chinh phục không gian bằng tam giác ]
- Việc đo khoảng cách đến các ngọn núi cao, khoảng cách giữa các vì sao, hay thậm chí khoảng cách từ Trái Đất đến Mặt Trăng được thực hiện thông qua kỹ thuật *"Tam giác đạc"* (Triangulation).
- *Al-Kashi*, một nhà toán học thế kỷ 15, đã công bố Định lý Cosin ở dạng tổng quát để sử dụng trong thiết kế đài thiên văn và tính toán vị trí hành tinh.
- Nhờ Định lý Sin và Cosin, nhân loại đã có thể đo đạc thế giới mà không cần phải dùng thước dây đi từng mét!
""",
        "theory_file": "c1-b13-ly.typ",
        "quiz_file": "c1-b13-de1.typ",
        "output_file": "beamer-11-bai-13-dinh-ly-sin-cos.typ"
    }
]

def clean_file_content(content):
    content = re.sub(r'#import\s+".*?":.*?\n', '', content)
    content = content.replace('#import "../bbt.typ": *', '')
    content = content.replace('#import "@preview/cetz:0.5.2"', '')
    # Adjust canvas length for beamer visibility
    content = re.sub(r'canvas\(\s*length\s*:\s*0\.[0-9]+cm', r'canvas(length: 1cm', content)
    
    # Remove #muc commands if present
    content = re.sub(r'#muc\(\[.*?\]\)', '', content)
    # Remove #lesson commands if present
    content = re.sub(r'#lesson\(.*?\)', '', content)
    # Remove #q-label commands if present
    content = re.sub(r'#q-label\(.*?\)', '', content)
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
    theory_path = os.path.join(chuong1_dir, lesson['theory_file'])
    if os.path.exists(theory_path):
        with open(theory_path, 'r', encoding='utf-8') as f:
            theory_content = f.read()
            theory_content = clean_file_content(theory_content)
            out_content += "#slide[ = Cơ sở lý thuyết ]\n"
            out_content += theory_content + "\n\n"
    else:
        print(f"Warning: Missing theory file {theory_path}")
        
    # Include Quiz
    quiz_path = os.path.join(chuong1_dir, lesson['quiz_file'])
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
