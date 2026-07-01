import os
import re

beamer_dir = "/Users/admin/conictypst/typst/beamer/mu-logarit"
chuong_dir = "/Users/admin/conictypst/typst/sach/mu-logarit"

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
  subtitle:    "TOÁN 11 — Chương: Hàm Số Mũ và Hàm Số Logarit",
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
        "title": "BÀI 1: LŨY THỪA",
        "history": """#slide[ = Gợi mở: Ký hiệu của quyền lực và sự bùng nổ ]
- Vào thế kỷ 17, nhà toán học và triết học vĩ đại *René Descartes* đã đưa ra một phát kiến tưởng chừng đơn giản nhưng thay đổi hoàn toàn cục diện toán học: thay vì viết $a times a times a$, ông viết $a^3$.
- Sự ra đời của *Lũy thừa* không chỉ giúp tiết kiệm giấy mực. Nó mở ra cánh cửa cho các nhà khoa học khám phá thế giới vĩ mô (khoảng cách giữa các thiên hà) và vi mô (kích thước của nguyên tử).
- Hãy tưởng tượng, nếu bạn gấp đôi một tờ giấy $0.1 "mm"$ liên tục $42$ lần, độ dày của nó sẽ đủ để vươn tới Mặt Trăng ($0.1 "mm" times 2^{42} approx 440,000 "km"$). Lũy thừa chính là ngôn ngữ của *sự bùng nổ*!
""",
        "theory_file": "c2-b1.typ",
        "quiz_file": "c2-b1-de1.typ",
        "output_file": "beamer-11-mu-bai-1-luy-thua.typ"
    },
    {
        "bai_id": "BÀI 2",
        "title": "BÀI 2: LOGARIT",
        "history": """#slide[ = Lịch sử: Phép màu của John Napier ]
- Hãy thử tưởng tượng bạn phải nhân bằng tay hai số vô cùng lớn: $3.14159 times 2.71828$. Đối với các nhà thiên văn học thế kỷ 16, công việc này tốn cả đời người.
- Năm 1614, một quý tộc người Scotland là *John Napier* đã công bố một phát minh chấn động thế giới: *Logarit*.
- Logarit có một phép màu: *"Nó biến phép NHÂN thành phép CỘNG"* ($log(A times B) = log A + log B$).
- Nhờ Logarit, những cỗ máy tính toán khổng lồ được thu gọn vào những cuốn "Bảng tra Logarit". Nhà toán học Laplace đã ca ngợi: *"Logarit đã nhân đôi tuổi thọ của các nhà thiên văn học"*.
""",
        "theory_file": "c2-b2.typ",
        "quiz_file": "c2-b2-de1.typ",
        "output_file": "beamer-11-mu-bai-2-logarit.typ"
    },
    {
        "bai_id": "BÀI 3",
        "title": "BÀI 3: HÀM SỐ MŨ VÀ LOGARIT",
        "history": """#slide[ = Ứng dụng: Nhịp đập của tự nhiên và vũ trụ ]
#lt-two-col(ratio: (50%, 50%), [
- *Hàm số mũ $a^x$:* Kẻ thù của trực giác con người. Khi đại dịch COVID-19 nổ ra, đường cong lây nhiễm bùng phát theo hàm mũ, khiến hệ thống y tế thế giới quá tải. 
- *Hàm số Logarit $log_a x$:* Thuốc giải cho sự bùng nổ. Khi dữ liệu quá khổng lồ (như năng lượng động đất), hàm Logarit giúp "bóp nhỏ" chúng lại để con người dễ hình dung. 
- Độ Richter đo động đất, cường độ Decibel của âm thanh, và cả thang độ pH trong hóa học... tất cả đều là các *thang đo Logarit*!
], [
  #align(center)[
    #rect(fill: rgb("#e8f4f8"), stroke: 1pt, inset: 10pt)[Mũ tạo ra sự bùng nổ. Logarit làm phẳng dữ liệu!]
  ]
])
""",
        "theory_file": "c2-b3.typ",
        "quiz_file": "c2-b3-de1.typ",
        "output_file": "beamer-11-mu-bai-3-ham-so.typ"
    },
    {
        "bai_id": "BÀI 4",
        "title": "BÀI 4: PHƯƠNG TRÌNH, BẤT PHƯƠNG TRÌNH MŨ VÀ LOGARIT",
        "history": """#slide[ = Công cụ dự báo Tương lai và truy tìm Quá khứ ]
- Giải phương trình Mũ và Logarit chính là giải bài toán tìm *thời gian*!
- *Tìm về quá khứ:* Bằng cách giải phương trình phân rã phóng xạ của đồng vị Carbon-14 ($N(t) = N_0 . e^{-lambda t}$), các nhà khảo cổ học có thể xác định chính xác tuổi của xác ướp Ai Cập và hóa thạch khủng long hàng triệu năm.
- *Dự báo tương lai:* Giải bất phương trình lợi nhuận ($P(1+r)^t > M$), các chuyên gia tài chính có thể tính được mất chính xác bao nhiêu năm để khoản đầu tư của bạn tăng gấp đôi.
""",
        "theory_file": "c2-b4.typ",
        "quiz_file": "c2-b4-de1.typ",
        "output_file": "beamer-11-mu-bai-4-pt-bpt.typ"
    },
    {
        "bai_id": "BÀI 5",
        "title": "BÀI 5: ỨNG DỤNG THỰC TẾ CỦA MŨ VÀ LOGARIT",
        "history": """#slide[ = Khám phá: Toán Học Thực Chiến ]
- Hàm số Mũ và Logarit không phải là những thứ xa vời trên giấy nháp. Chúng điều khiển cuộc sống thực:
  1. *Lãi suất ngân hàng:* Lãi kép và sự tích lũy tài sản.
  2. *Vật lý:* Cường độ âm thanh (Decibel) và thang độ phóng xạ.
  3. *Địa lý:* Đo cường độ địa chấn bằng thang Richter.
- Trong bài học này, chúng ta sẽ áp dụng các công thức giải tích vào những vấn đề sinh tử và tiền bạc của thế giới thực!
""",
        "theory_file": "c2-b5.typ",
        "quiz_file": "none",
        "output_file": "beamer-11-mu-bai-5-ung-dung.typ"
    },
    {
        "bai_id": "BÀI 6",
        "title": "BÀI 6: LUYỆN TẬP TỔNG HỢP",
        "history": """#slide[ = Luyện Tập Tổng Hợp ]
Hãy vận dụng toàn bộ kiến thức Mũ - Logarit để giải quyết các bài toán hóc búa!
""",
        "theory_file": "none",
        "quiz_file": "c2-b6-de1.typ",
        "output_file": "beamer-11-mu-bai-6-luyen-tap.typ"
    },
    {
        "bai_id": "BÀI 7",
        "title": "BÀI 7: CASE STUDY - TOÁN HỌC THỰC CHIẾN",
        "history": """#slide[ = Chuyên đề: Case Study Thực tế ]
Trong thực tế, một kỹ sư hay một nhà đầu tư không bao giờ gặp một bài toán có sẵn dạng $log_2 x = 3$. 
Họ gặp những vấn đề ngổn ngang của thực tiễn và phải tự thiết lập mô hình toán học để giải quyết. Hãy cùng trải nghiệm cảm giác của một chuyên gia!
""",
        "theory_file": "c2-b7-casestudy.typ",
        "quiz_file": "none",
        "output_file": "beamer-11-mu-bai-7-casestudy.typ"
    },
    {
        "bai_id": "BÀI 8",
        "title": "BÀI 8: BÁCH KHOA TOÀN THƯ THỰC TẾ",
        "history": """#slide[ = Chuyên đề Mở rộng: Bách Khoa Toàn Thư ]
Hệ thống các bài toán thực tế phức tạp bậc nhất, giúp học sinh vươn tới đẳng cấp cao trong kì thi đánh giá năng lực và tư duy!
""",
        "theory_file": "c2-b8-bachkhoa-thucte.typ",
        "quiz_file": "none",
        "output_file": "beamer-11-mu-bai-8-bachkhoa.typ"
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
    if lesson['theory_file'] != "none":
        theory_path = os.path.join(chuong_dir, lesson['theory_file'])
        if os.path.exists(theory_path):
            with open(theory_path, 'r', encoding='utf-8') as f:
                theory_content = f.read()
                theory_content = clean_file_content(theory_content)
                out_content += "#slide[ = Cơ sở lý thuyết ]\n"
                out_content += theory_content + "\n\n"
        else:
            print(f"Warning: Missing theory file {theory_path}")
        
    # Include Quiz
    if lesson['quiz_file'] != "none":
        quiz_path = os.path.join(chuong_dir, lesson['quiz_file'])
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

print("All Beamer slide templates for Mu-Logarit generated successfully.")
