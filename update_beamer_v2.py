import re

# Read the base template (we will use the currently updated one and just swap the question block)
with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

old_mcq_start = content.find("// ════════════════════════════════════════════════\n// KHO BÀI TẬP TRẮC NGHIỆM TỔNG HỢP (48 CÂU)")
old_mcq_end = content.find("// ════════════════════════════════════════════════\n// TỔNG KẾT")

if old_mcq_start == -1:
    print("Could not find MCQ start")
else:
    with open("typst/beamer/extracted_questions_v2.typ", "r", encoding="utf-8") as f:
        questions = f.read()
    
    new_mcq = """// ════════════════════════════════════════════════
// KHO BÀI TẬP TRẮC NGHIỆM TỔNG HỢP (48 CÂU)
// ════════════════════════════════════════════════
#lt-section-link("sec-practice", "❓", [Kho Câu Hỏi Trắc Nghiệm Đầy Đủ])

#slide(title: none)[
  #lt-qbank-header("Tổng hợp 4 Đề kiểm tra", 48)
  #v(1em)
  #lt-two-col(
    ratio: (1fr, 1fr),
    lt-bullets(icon: "✅",
      [Các câu hỏi được trích xuất trực tiếp từ kho đề thi],
      [Hệ thống tự động chấm điểm và đánh số thứ tự],
    ),
    lt-bullets(icon: "✅",
      [Đầy đủ các dạng: Nhận biết, Thông hiểu, Vận dụng],
      [Hình vẽ minh họa chính xác (CeTZ)],
    )
  )
  #v(1em)
  #align(center)[
    #lt-nav-btn("lec-toc-main", icon: "◀", txt: "Quay lại Mục Lục")
  ]
]

""" + questions + "\n\n"

    content = content[:old_mcq_start] + new_mcq + content[old_mcq_end:]
    
    with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
        f.write(content)
    
    print("Beamer updated successfully with V2.")
