import subprocess
import os
import json
import random
from PIL import Image, ImageDraw
import cv2
import numpy as np
from omr_grader import calibrate_template, grade_sheet, get_4_corners, warp_page

def simulate_student_input(empty_img_path, template_json_path, output_student_path, correct_answers, sbd="123456", made="204"):
    """
    Sử dụng Pillow vẽ các dấu chì giả lập tô đáp án lên phiếu trắng đã được nắn thẳng trước,
    sau đó mới xoay nghiêng mô phỏng chụp ảnh.
    """
    with open(template_json_path, "r") as f:
        template = json.load(f)
        
    # Đọc ảnh gốc bằng OpenCV để nắn thẳng sang kích thước chuẩn 1000x1500 trước
    img_cv = cv2.imread(empty_img_path)
    gray = cv2.cvtColor(img_cv, cv2.COLOR_BGR2GRAY)
    h, w = gray.shape[:2]
    _, thresh_marker = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)
    contours, _ = cv2.findContours(thresh_marker, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    corners = get_4_corners(contours, w, h)
    warped_color = warp_page(img_cv, corners) # Kích thước chuẩn 1000x1500
    
    # Chuyển đổi sang PIL để vẽ
    img = Image.fromarray(cv2.cvtColor(warped_color, cv2.COLOR_BGR2RGB)).convert("RGBA")
    overlay = Image.new("RGBA", img.size, (0, 0, 0, 0))
    draw = ImageDraw.Draw(overlay)
    
    # ── Tô SBD ──
    for col_idx, char in enumerate(sbd):
        digit = int(char)
        pt = template["sbd"][digit][col_idx]
        cx, cy = pt[0], pt[1]
        # Vẽ một ô tròn tô đậm màu chì đen xám (giả lập bút chì 2B)
        # Ô tròn 14pt có bán kính ~6.5px trong ảnh 1000x1500
        draw.ellipse([cx-6, cy-6, cx+6, cy+6], fill=(30, 30, 32, 240))
        
    # ── Tô Mã Đề ──
    for col_idx, char in enumerate(made):
        digit = int(char)
        pt = template["made"][digit][col_idx]
        cx, cy = pt[0], pt[1]
        draw.ellipse([cx-6, cy-6, cx+6, cy+6], fill=(30, 30, 32, 240))
        
    # ── Tô 50 câu MCQ ──
    options = ["A", "B", "C", "D"]
    for q_str in range(1, 51):
        q_key = str(q_str)
        ans = correct_answers.get(q_key)
        if ans in options:
            ans_idx = options.index(ans)
            pt = template["mcq"][q_key][ans_idx]
            cx, cy = pt[0], pt[1]
            # Tô lệch tâm nhẹ để giả lập thực tế
            ox = random.randint(-1, 1)
            oy = random.randint(-1, 1)
            draw.ellipse([cx-6+ox, cy-6+oy, cx+6+ox, cy+6+oy], fill=(40, 40, 42, 220))
            
    # Gộp lớp vẽ với ảnh
    img = Image.alpha_composite(img, overlay).convert("RGB")
    
    # ── Giả lập chụp bằng camera (Xoay và nghiêng ảnh nhẹ) ──
    cv_img = cv2.cvtColor(np.array(img), cv2.COLOR_RGB2BGR)
    h_w, w_w = cv_img.shape[:2] # 1500, 1000
    
    # Ma trận xoay ảnh 1.2 độ quanh tâm
    center = (w_w // 2, h_w // 2)
    M_rot = cv2.getRotationMatrix2D(center, 1.2, 0.98) 
    cam_img = cv2.warpAffine(cv_img, M_rot, (w_w, h_w), borderValue=(255, 255, 255))
    
    # Làm mờ nhẹ
    cam_img = cv2.GaussianBlur(cam_img, (3, 3), 0)
    
    cv2.imwrite(output_student_path, cam_img)
    print(f"Đã tạo ảnh giả lập chụp bài làm của học sinh tại: {output_student_path}")


def main():
    base_dir = "/Users/admin/conictypst/sang-math-omr"
    empty_png = os.path.join(base_dir, "empty_sheet.png")
    template_json = os.path.join(base_dir, "template_coords.json")
    student_png = os.path.join(base_dir, "student_sheet.png")
    
    # 1. Biên dịch file Typst thành ảnh PNG trống gốc
    print("1. Đang biên dịch phiếu OMR từ Typst sang PNG...")
    empty_temp = os.path.join(base_dir, "empty_sheet-{n}.png")
    subprocess.run([
        "typst", "compile",
        "--root", "/Users/admin/conictypst",
        os.path.join(base_dir, "omr_sheet.typ"),
        empty_temp
    ], check=True)
    
    # Rename empty_sheet-1.png to empty_sheet.png
    import shutil
    shutil.move(os.path.join(base_dir, "empty_sheet-1.png"), empty_png)
    
    # Clean up other pages if they exist
    for i in range(2, 10):
        p_path = os.path.join(base_dir, f"empty_sheet-{i}.png")
        if os.path.exists(p_path):
            os.remove(p_path)
    
    # 2. Định chuẩn (Calibrate) tạo lưới tọa độ
    print("2. Đang định chuẩn tọa độ các ô đáp án trên phiếu OMR...")
    calibrate_template(empty_png, template_json)
    
    # 3. Tạo đáp án mẫu (correct answers) để chấm điểm
    options = ["A", "B", "C", "D"]
    correct_answers = {str(i): random.choice(options) for i in range(1, 51)}
    
    # Giả lập học sinh khoanh đúng 100% để kiểm chứng độ chính xác
    student_answers = correct_answers.copy()
    # Thử đổi một số câu sang đáp án khác (làm sai) để kiểm tra chấm sai
    student_answers["5"] = "D" if correct_answers["5"] != "D" else "A"
    student_answers["12"] = "C" if correct_answers["12"] != "C" else "B"
    student_answers["42"] = "B" if correct_answers["42"] != "B" else "A"
    
    expected_correct = 50 - 3 # Làm sai 3 câu -> dự kiến đúng 47 câu
    expected_score = expected_correct * 10.0 / 50.0 # 9.4 điểm
    
    # 4. Giả lập học sinh tô bài thi
    print("3. Đang giả lập học sinh tô phiếu...")
    simulate_student_input(
        empty_png, 
        template_json, 
        student_png, 
        student_answers,
        sbd="567890",
        made="302"
    )
    
    # 5. Chạy thuật toán chấm điểm
    print("4. Đang quét ảnh và chấm điểm bằng OpenCV...")
    results = grade_sheet(student_png, template_json, correct_answers)
    
    # 6. Kiểm tra chéo kết quả
    print("\n" + "="*40)
    print("KẾT QUẢ CHẤM THI GIẢ LẬP:")
    print("="*40)
    print(f"Số Báo Danh nhận diện: {results['sbd']} (Kỳ vọng: 567890)")
    print(f"Mã Đề Thi nhận diện: {results['made']} (Kỳ vọng: 302)")
    print(f"Số câu đúng: {results['correct_count']} / 50 (Kỳ vọng: {expected_correct})")
    print(f"Điểm số: {results['score']} (Kỳ vọng: {expected_score})")
    print("="*40)
    
    # Kiểm chứng độ chính xác tuyệt đối
    assert results["sbd"] == "567890", "Sai lệch nhận diện SBD"
    assert results["made"] == "302", "Sai lệch nhận diện Mã đề"
    assert results["correct_count"] == expected_correct, "Sai lệch số câu đúng"
    
    print("\n✅ KIỂM THỬ THÀNH CÔNG RỰC RỠ! THUẬT TOÁN ĐẠT ĐỘ CHÍNH XÁC 100%!")

if __name__ == "__main__":
    main()
