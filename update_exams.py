import glob
import re

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")
for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    # Check if already processed
    if "make-questions" in content:
        print(f"Skipping {path}, already processed")
        continue

    # 1. Update variables
    content = re.sub(
        r'(#let mode = "loigiai"\n)(#let accent = rgb\("[^"]+"\)\n)',
        r'\1\2#let ma-de = "1234"\n#let in-qr-dap-an = true\n#show math.cases: math.display\n',
        content
    )

    # 2. Update thpt-school-exam.with
    content = re.sub(
        r'(#show: thpt-school-exam\.with\([^)]+?\n)(\))',
        r'\1  structure: auto,\n  code: ma-de,\n  footer-left: [GV Nguyễn Văn Sang],\n  accent: accent,\n  show-topbar: false,\n\2',
        content,
        flags=re.DOTALL
    )

    # 3. Insert #include and #let make-questions() = [
    # Right after the #show: thpt-school-exam.with(...)
    content = re.sub(
        r'(#show: thpt-school-exam\.with\([^)]+\)\n)',
        r'\1\n#include "12-4-6ngang.typ"\n\n#let make-questions() = [\n',
        content,
        flags=re.DOTALL
    )

    # 4. Append to the end
    tail = """
]
#make-questions()

#if in-qr-dap-an [
  #pagebreak()
  #align(center)[
    #text(weight: "bold", size: 15pt, fill: accent)[QR ĐÁP ÁN OMR - BẢN GIÁO VIÊN]
    #v(0.5em)
    #text(size: 10pt)[Mã đề #ma-de. Mở Sang Math OMR, chọn “Quét QR trực tiếp” để nạp key và chấm bài.]
    #v(1em)
    #sang-omr-qr(
      ma-de: ma-de, 
      show-info: true, 
      pts: (mcq: 0.25, tf: 0.1, tf-full: 0.5, sh: 0.5)
    )
  ]
]

#print-answer-key()
"""
    content = content.rstrip() + "\n" + tail

    with open(path, "w") as f:
        f.write(content)
        
    print(f"Updated {path}")
