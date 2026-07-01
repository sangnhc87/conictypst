import os
import re

beamer_dir = "/Users/admin/conictypst/typst/beamer/ung-dung-dao-ham"
chuong_dir = "/Users/admin/conictypst/typst/sach/ung-dung-dao-ham"

preamble_template = """#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-UDDH-{ID}
// Toán 12 — Ứng Dụng Đạo Hàm  ·  GV: Nguyễn Văn Sang
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

#let c-p1 = rgb("#3b82f6") // blue
#let c-p2 = rgb("#8b5cf6") // violet
#let c-p3 = rgb("#ec4899") // pink
#let c-p4 = rgb("#f97316") // orange
#let c-p5 = rgb("#10b981") // emerald

#show: lecture-theme.with(
  title:       "{TITLE}",
  subtitle:    "TOÁN 12 — Chuyên đề: Ứng Dụng Đạo Hàm & Thực Tế",
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
#let chapter = exam-part
#let topic = exam-part
#let ppgiai = phuongphap
#let bt-header(color) = none
#let bt(..args) = none
#let resetstep() = none

"""

lessons = [
    {
        "id": "PHAN1-C1",
        "title": "P1.C1: TỐI ƯU HÓA HÌNH PHẲNG 2D CƠ BẢN",
        "history": """#slide[ = Gợi mở: Bác nông dân và Bài toán rào vườn ]
- Có một người nông dân có $60 "m"$ hàng rào. Ông ta muốn rào một khu vườn hình chữ nhật để nuôi gà. Làm sao để diện tích lớn nhất?
- Nếu dùng trực giác, chúng ta có thể thử rào $10 times 20$, $15 times 15$, v.v. Nhưng để tìm ra con số *tuyệt đối chính xác*, ta phải dùng toán học!
- Đạo hàm chính là chiếc "đũa thần" giúp ta tìm ra điểm chạm đỉnh của mọi hàm số. Đây là tiền đề cho một ngành khoa học khổng lồ: *Tối ưu hóa*.
""",
        "theory_file": "phan1/c1.typ",
        "output_file": "beamer-12-udh-phan1-c1.typ"
    },
    {
        "id": "PHAN1-C2",
        "title": "P1.C2: ĐỘNG HỌC TUYẾN TÍNH - ĐẠO HÀM THEO THỜI GIAN",
        "history": """#slide[ = Khám phá: Mọi thứ đều đang chuyển động! ]
- Quãng đường $s(t)$, vận tốc $v(t)$, gia tốc $a(t)$ - Tất cả đều được liên kết chặt chẽ bởi các nấc thang đạo hàm.
- Từ việc tính toán vận tốc của một chiếc xe máy trên đường cao tốc, đến việc dự báo tốc độ lây lan của một đại dịch, đạo hàm theo thời gian cho ta biết mọi thứ đang diễn biến nhanh hay chậm thế nào!
""",
        "theory_file": "phan1/c2.typ",
        "output_file": "beamer-12-udh-phan1-c2.typ"
    },
    {
        "id": "PHAN1-C3",
        "title": "P1.C3: KINH TẾ VI MÔ & GIÁO DỤC TÀI CHÍNH GEN Z",
        "history": """#slide[ = Kinh tế học: Tối đa hóa lợi nhuận! ]
- Tại sao một quán cà phê không bán với giá $100,000$ VNĐ để lãi nhiều nhất? Vì khi giá quá cao, lượng người mua sẽ giảm mạnh.
- Đạo hàm giúp ta tìm ra điểm cân bằng vàng: Mức giá nào mang lại lợi nhuận $P(x)$ đạt cực đại!
- Học phần này không chỉ là Toán học, nó là những kỹ năng tài chính cơ bản để trở thành một nhà kinh doanh đại tài!
""",
        "theory_file": "phan1/c3.typ",
        "output_file": "beamer-12-udh-phan1-c3.typ"
    },
    {
        "id": "PHAN2-C1",
        "title": "P2.C1: TỐI ƯU HÓA KHỐI ĐA DIỆN & CHI PHÍ CHÊNH LỆCH",
        "history": """#slide[ = Tối ưu 3D: Thiết kế hộp quà ]
- Trong ngành công nghiệp bao bì, thiết kế được một chiếc thùng các-tông đựng được nhiều đồ nhất với ít giấy nhất sẽ giúp công ty tiết kiệm hàng triệu USD!
- Bằng cách sử dụng thể tích không gian $3"D"$, đạo hàm một lần nữa chứng minh quyền năng trong thế giới thực tế.
""",
        "theory_file": "phan2/c1.typ",
        "output_file": "beamer-12-udh-phan2-c1.typ"
    },
    {
        "id": "PHAN2-C2",
        "title": "P2.C2: TỐI ƯU HÓA KHỐI TRÒN XOAY - TRỤ, NÓN, CẦU",
        "history": """#slide[ = Bí mật của lon bò húc ]
- Đã bao giờ bạn tự hỏi tại sao mọi lon nước ngọt (Coca, Pepsi, Redbull) đều có hình trụ tròn xoay với tỉ lệ chiều cao và bán kính gần như nhau?
- Đó không phải là ngẫu nhiên! Tỉ lệ đó chính là nghiệm của bài toán cực trị: $h = 2R$ (đối với lon kín). 
- Chỉ một phép tính đạo hàm đơn giản, ngành công nghiệp nước giải khát đã tiết kiệm hàng nghìn tấn nhôm mỗi năm.
""",
        "theory_file": "phan2/c2.typ",
        "output_file": "beamer-12-udh-phan2-c2.typ"
    },
    {
        "id": "PHAN2-C3",
        "title": "P2.C3: PHÂN TÍCH BIÊN TẾ TRONG DOANH NGHIỆP",
        "history": """#slide[ = Phân tích Biên tế (Marginal Analysis) ]
- Trong kinh tế, "biên tế" có nghĩa là "thêm một đơn vị nữa". Chi phí biên (Marginal Cost) là chi phí để sản xuất thêm đúng 1 sản phẩm nữa.
- Lợi nhuận sẽ đạt tối đa khi Chi phí biên = Doanh thu biên ($M C = M R$). 
- Bằng ngôn ngữ của đạo hàm: $C'(x) = R'(x)$!
""",
        "theory_file": "phan2/c3.typ",
        "output_file": "beamer-12-udh-phan2-c3.typ"
    },
    {
        "id": "PHAN2-REV",
        "title": "ĐỀ TỔNG HỢP PHẦN 2: HÌNH KHỐI & MÔ HÌNH KINH TẾ",
        "history": """#slide[ = Ôn tập tổng hợp ]
Hệ thống lại các bài toán tối ưu 3D và kinh tế vi mô. Những bài toán thực chiến này sẽ xuất hiện trong các kì thi Đánh giá năng lực!
""",
        "theory_file": "phan2/review.typ",
        "output_file": "beamer-12-udh-phan2-review.typ"
    },
    {
        "id": "PHAN3-C1",
        "title": "P3.C1: CHUYỂN ĐỘNG ĐA MÔI TRƯỜNG & NGUYÊN LÝ FERMAT",
        "history": """#slide[ = Bí ẩn: Sự thông minh của ánh sáng! ]
- Một nhân viên cứu hộ chạy trên cát với tốc độ $v_1$, bơi dưới nước với tốc độ $v_2$. Anh ta phải chọn đường nào để cứu nạn nhân nhanh nhất? Đường thẳng không phải là nhanh nhất vì bơi chậm hơn chạy!
- Đạo hàm cho ta câu trả lời chính xác về vị trí nên nhảy xuống nước.
- Kì diệu thay, khi ánh sáng truyền qua hai môi trường (như không khí vào nước), nó bị khúc xạ đúng theo góc mà đạo hàm vừa tính ra. *Ánh sáng dường như biết giải toán tối ưu (Nguyên lý Fermat)!*
""",
        "theory_file": "phan3/c1.typ",
        "output_file": "beamer-12-udh-phan3-c1.typ"
    },
    {
        "id": "PHAN3-C2",
        "title": "P3.C2: TỐI ƯU HÓA MẠNG LƯỚI CƠ SỞ HẠ TẦNG",
        "history": """#slide[ = Cơ sở hạ tầng: Bài toán tỉ phú! ]
- Đặt một trạm phát sóng ở đâu để phủ sóng 3 ngôi làng với chi phí dây cáp ít nhất? Xây đường ống dẫn dầu thế nào để tối thiểu hóa hao phí?
- Những bài toán này quyết định giá trị hàng tỷ USD trong các dự án quy hoạch quốc gia.
""",
        "theory_file": "phan3/c2.typ",
        "output_file": "beamer-12-udh-phan3-c2.typ"
    },
    {
        "id": "PHAN3-C3",
        "title": "P3.C3: TỐI ƯU GÓC NHÌN & CƯỜNG ĐỘ CHIẾU SÁNG",
        "history": """#slide[ = Vị trí đẹp nhất: Tối ưu góc nhìn ]
- Phải treo bức tranh ở độ cao bao nhiêu, hay bạn phải đứng cách màn hình rạp phim bao xa để có "góc nhìn" (visual angle) lớn nhất?
- Đây là những bài toán kết hợp giữa Lượng giác học và Đạo hàm để tìm ra điểm vàng trong thiết kế rạp hát, sân vận động.
""",
        "theory_file": "phan3/c3.typ",
        "output_file": "beamer-12-udh-phan3-c3.typ"
    }
]

def clean_file_content(content):
    content = re.sub(r'#import\s+".*?":.*?\n', '', content)
    content = content.replace('#import "../bbt.typ": *', '')
    content = content.replace('#import "@preview/cetz:0.5.2"', '')
    # Adjust canvas length for beamer visibility
    content = re.sub(r'canvas\(\s*length\s*:\s*0\.[0-9]+cm', r'canvas(length: 1cm', content)
    
    # We will redefine #chapter and #topic in preamble to be #slide[= ...] instead of removing them entirely
    # But some #chapter commands in the files might have weird syntax. Let's just remove them and trust the slide generation.
    content = re.sub(r'#chapter.*?\]\)', '', content)
    
    content = re.sub(r'#lesson.*', '', content)
    content = re.sub(r'#q-label.*', '', content)
    content = re.sub(r'#show:\s*doc-setup.*?\n', '', content)
    content = re.sub(r'#include\s+".*?"', '', content)
    # Fix shadowed int(
    content = content.replace('int(', 'std.int(')
    
    # Fix typst bolding (Typst uses * for bold, not *)
    content = content.replace('*', '*')

    # Some old macros might be replaced
    return content

for lesson in lessons:
    preamble = preamble_template.replace("{ID}", lesson['id']).replace("{TITLE}", lesson['title'])
    
    out_content = preamble + "\n" + lesson['history'] + "\n\n"
    
    # Include Theory
    theory_path = os.path.join(chuong_dir, lesson['theory_file'])
    if os.path.exists(theory_path):
        with open(theory_path, 'r', encoding='utf-8') as f:
            theory_content = f.read()
            theory_content = clean_file_content(theory_content)
            out_content += theory_content + "\n\n"
    else:
        print(f"Warning: Missing theory file {theory_path}")
        
    # Write output
    out_path = os.path.join(beamer_dir, lesson['output_file'])
    with open(out_path, 'w', encoding='utf-8') as f:
        f.write(out_content)
        
    print(f"Generated {lesson['output_file']}")

print("All Beamer slide templates for Ung-dung-dao-ham generated successfully.")
