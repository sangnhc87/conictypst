# -*- coding: utf-8 -*-
import os

filepath = "/Users/admin/conictypst/typst/exams/DaiBacVanNang.typ"

if os.path.exists(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()
        
    print("Verifying lines to replace:")
    for idx in range(273, 301):
        if idx < len(lines):
            print(f"{idx+1}: {repr(lines[idx])}")
            
    corrected_example_lines = [
        "  #v(0.3em)\n",
        "  *Lời giải chi tiết bằng cách áp dụng Bộ Quy Tắc Vạn Năng:*\n",
        "\n",
        "  *Bước 1: Tô Cột 1 (Quy tắc 1 - Cột khởi đầu cao 3 ô)*\n",
        "  - Số cách tô Cột 1 gồm 3 ô dọc độc lập là:\n",
        "    $N_(\"Cột 1\") = k(k-1)^2 = 3 times 2^2 = 12$ cách.\n",
        "\n",
        "  *Bước 2: Tô Cột 2 (Quy tắc 2 - Cột kề đầy đủ cao 2 ô)*\n",
        "  - Hãy quan sát: Cột 2 gồm 2 ô (Dòng 1 và Dòng 2). Nó nằm kề đầy đủ bên phải của 2 ô thuộc Cột 1 (cụ thể là ô Dòng 1 và Dòng 2 của Cột 1).\n",
        "  - Ô ở Dòng 3 của Cột 1 là ô khuyết ở trên, hoàn toàn không kề với bất kỳ ô nào của Cột 2, nên ta bỏ qua sự ảnh hưởng của nó.\n",
        "  - Do đó, bước chuyển tiếp từ Cột 1 sang Cột 2 thực chất là sự chuyển tiếp của một cột cao 2 ô tiêu chuẩn.\n",
        "  - Áp dụng *Quy tắc 2 (Chuyển tiếp cột đầy đủ cao 2 ô)*: Hệ số nhân thêm cho Cột 2 là:\n",
        "    $H = k^2 - 3k + 3 = 3^2 - 3(3) + 3 = 3$ cách.\n",
        "    $=> N_(\"Cột 2\") = 3$ cách.\n",
        "\n",
        "  *Bước 3: Tô Cột 3 (Quy tắc 3 - Chuyển tiếp khuyết giảm)*\n",
        "  - Cột 3 chỉ có duy nhất 1 ô ở Dòng 1. Ô này kề ngang với ô Dòng 1 của Cột 2 (phía trên nó khuyết rỗng).\n",
        "  - Áp dụng *Quy tắc 3 (Khuyết giảm - kề sát đúng 1 ô đã tô)*: Hệ số nhân thêm cho Cột 3 là:\n",
        "    $k - 1 = 3 - 1 = 2$ cách.\n",
        "    $=> N_(\"Cột 3\") = 2$ cách.\n",
        "\n",
        "  *Bước 4: Tổng kết số cách tô cho toàn lưới*\n",
        "  - Theo quy tắc nhân, tổng số cách tô màu là:\n",
        "    $N = N_(\"Cột 1\") times N_(\"Cột 2\") times N_(\"Cột 3\") = 12 times 3 times 2 = 72$ cách.\n"
    ]
    
    # Replace lines index 273 to 300
    lines[273:301] = corrected_example_lines
    
    with open(filepath, "w", encoding="utf-8") as f:
        f.writelines(lines)
    print("SUCCESS: Example steps corrected and rule-compliant!")
else:
    print("ERROR: File not found.")
