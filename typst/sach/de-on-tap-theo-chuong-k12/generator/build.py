# -*- coding: utf-8 -*-
import sys
import os
import subprocess

curr_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, curr_dir)

import header
import ch1_khaosat
import ch2_vecto_oxyz
import ch3_thongke_phantan
import ch4_nguyenham_tichphan
import ch5_hinhhoc_oxyz
import ch6_xacsuat_nangcao
import ch_special
import ch7_khat_vong_nghien_cuu
import appendix

modules = [
    header.CONTENT,
    ch1_khaosat.CONTENT,
    ch2_vecto_oxyz.CONTENT,
    ch3_thongke_phantan.CONTENT,
    ch4_nguyenham_tichphan.CONTENT,
    ch5_hinhhoc_oxyz.CONTENT,
    ch6_xacsuat_nangcao.CONTENT,
    ch_special.CONTENT,
    ch7_khat_vong_nghien_cuu.CONTENT,
    appendix.CONTENT
]

full_content = "\n\n#pagebreak()\n\n".join(modules)

output_typ_path = os.path.join(curr_dir, "..", "TOAN-12-KHAI-MO-TRI-THUC-TAI-SAO-HOC-BAI-NAY.typ")
output_pdf_path = os.path.join(curr_dir, "..", "TOAN-12-KHAI-MO-TRI-THUC-TAI-SAO-HOC-BAI-NAY.pdf")

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
