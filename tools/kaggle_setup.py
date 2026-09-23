# ==============================================================================
# 🚀 SETUP 1 LẦN — Chạy cell này trên Kaggle để dùng mãi mãi
# ==============================================================================
#
# HƯỚNG DẪN TẠO KAGGLE DATASET (chỉ làm 1 lần):
#
# Bước 1: Trên Kaggle, vào https://www.kaggle.com/datasets → "New Dataset"
# Bước 2: Tên dataset: "sang-math-tools" (hoặc tùy ý)
# Bước 3: Upload 3 file sau:
#          - so_tay_sang_tac_de_toan.py
#          - sang_math_ai_studio_v3.py
#          - bank.json
# Bước 4: Bấm "Create" → dataset tạo xong
#
# Từ giờ mở bất kỳ notebook nào:
# 1. Bấm "+ Add Input" → search "sang-math-tools" → Add
# 2. Paste 1 trong 2 cell dưới đây → Run → xong!
#
# ==============================================================================

# ╔══════════════════════════════════════════════════════════════════╗
# ║  CELL 1: SỔ TAY SÁNG TÁC ĐỀ (đề mẫu → đề mới)              ║
# ╚══════════════════════════════════════════════════════════════════╝

# Uncomment 2 dòng dưới để chạy Sổ tay Sáng tác Đề:
# !cp /kaggle/input/sang-math-tools/bank.json /kaggle/working/bank.json
# %run /kaggle/input/sang-math-tools/so_tay_sang_tac_de_toan.py


# ╔══════════════════════════════════════════════════════════════════╗
# ║  CELL 2: AI STUDIO v3 (giải toán, OCR, Manim, đa năng)        ║
# ╚══════════════════════════════════════════════════════════════════╝

# Uncomment dòng dưới để chạy AI Studio:
# %run /kaggle/input/sang-math-tools/sang_math_ai_studio_v3.py
