# -*- coding: utf-8 -*-
import sys
import os
import subprocess

# Add current directory to path
curr_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, curr_dir)

import header
import ch1_luonggiac
import ch2_dayso
import ch3_gioihan
import ch4_songsong
import ch5_thongke
import ch6_mulogarit
import ch7_daoham
import ch8_vuonggoc
import ch9_xacsuat
import ch_special
import ch10_tu_hoc
import appendix

modules = [
    header.CONTENT,
    ch1_luonggiac.CONTENT,
    ch2_dayso.CONTENT,
    ch3_gioihan.CONTENT,
    ch4_songsong.CONTENT,
    ch5_thongke.CONTENT,
    ch6_mulogarit.CONTENT,
    ch7_daoham.CONTENT,
    ch8_vuonggoc.CONTENT,
    ch9_xacsuat.CONTENT,
    ch_special.CONTENT,
    ch10_tu_hoc.CONTENT,
    appendix.CONTENT
]

full_content = "\n\n#pagebreak()\n\n".join(modules)

output_typ_path = os.path.join(curr_dir, "..", "TOAN-11-KHAI-MO-TRI-THUC-TAI-SAO-HOC-BAI-NAY.typ")
output_pdf_path = os.path.join(curr_dir, "..", "TOAN-11-KHAI-MO-TRI-THUC-TAI-SAO-HOC-BAI-NAY.pdf")

with open(output_typ_path, "w", encoding="utf-8") as f:
    f.write(full_content)

print(f"Generated Typst file at: {output_typ_path} (Size: {len(full_content)} chars)")

# Compile using typst
cmd = [
    "typst", "compile",
    "--root", "/Users/admin/conictypst",
    output_typ_path,
    output_pdf_path
]

print("Compiling Typst to PDF...")
result = subprocess.run(cmd, capture_output=True, text=True)

if result.returncode == 0:
    print(f"Compilation SUCCESSFUL! Output PDF: {output_pdf_path}")
    # Check page count
    info_cmd = ["pdfinfo", output_pdf_path]
    info_res = subprocess.run(info_cmd, capture_output=True, text=True)
    for line in info_res.stdout.splitlines():
        if "Pages:" in line:
            print(f"Total Pages: {line}")
else:
    print("Compilation FAILED!")
    print("STDOUT:", result.stdout)
    print("STDERR:", result.stderr)
