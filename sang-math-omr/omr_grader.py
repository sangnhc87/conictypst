import cv2
import numpy as np
import json
import os

def get_4_corners(contours, img_width, img_height):
    """
    Tìm 4 góc định vị bằng cách giới hạn vùng tìm kiếm ở 4 góc của trang giấy.
    """
    margin_x = int(img_width * 0.25)
    margin_y = int(img_height * 0.20)
    
    tl_largest = (None, 0)
    tr_largest = (None, 0)
    bl_largest = (None, 0)
    br_largest = (None, 0)
    
    for c in contours:
        area = cv2.contourArea(c)
        if area > 100: # Ngưỡng diện tích tối thiểu
            M = cv2.moments(c)
            if M["m00"] != 0:
                cx = int(M["m10"] / M["m00"])
                cy = int(M["m01"] / M["m00"])
                
                # Top-Left Corner
                if cx < margin_x and cy < margin_y:
                    if area > tl_largest[1]:
                        tl_largest = ((cx, cy), area)
                # Top-Right Corner
                elif cx > img_width - margin_x and cy < margin_y:
                    if area > tr_largest[1]:
                        tr_largest = ((cx, cy), area)
                # Bottom-Left Corner
                elif cx < margin_x and cy > img_height - margin_y:
                    if area > bl_largest[1]:
                        bl_largest = ((cx, cy), area)
                # Bottom-Right Corner
                elif cx > img_width - margin_x and cy > img_height - margin_y:
                    if area > br_largest[1]:
                        br_largest = ((cx, cy), area)
                        
    corners = [tl_largest[0], tr_largest[0], br_largest[0], bl_largest[0]]
    if None in corners:
        raise ValueError(f"Không tìm đủ 4 điểm neo định vị ở các góc biên: {corners}")
    return corners


def warp_page(img, corners):
    """
    Nắn thẳng trang giấy về kích thước chuẩn 1000x1500 dựa vào 4 góc.
    """
    tl_x, tl_y = int(20.29 * 1000 / 210), int(20.29 * 1500 / 297)
    tr_x, tr_y = int(189.71 * 1000 / 210), int(20.29 * 1500 / 297)
    br_x, br_y = int(189.71 * 1000 / 210), int(276.71 * 1500 / 297)
    bl_x, bl_y = int(20.29 * 1000 / 210), int(276.71 * 1500 / 297)
    
    pts_src = np.array(corners, dtype="float32")
    pts_dst = np.array([
        [tl_x, tl_y],
        [tr_x, tr_y],
        [br_x, br_y],
        [bl_x, bl_y]
    ], dtype="float32")
    
    M = cv2.getPerspectiveTransform(pts_src, pts_dst)
    warped = cv2.warpPerspective(img, M, (1000, 1500))
    return warped


def calibrate_template(template_img_path, output_json_path):
    """
    Phân tích file phiếu OMR gốc (chưa tô) để tự động nhận diện và lưu tọa độ
    của 290 ô tròn đáp án (SBD: 60, Mã đề: 30, MCQ: 200).
    """
    img = cv2.imread(template_img_path)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    h, w = gray.shape[:2]
    
    # 1. Tìm các marker góc để nắn thẳng ảnh mẫu trước
    _, thresh_marker = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)
    contours, _ = cv2.findContours(thresh_marker, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    corners = get_4_corners(contours, w, h)
    warped_gray = warp_page(gray, corners)
    
    # 2. Ngưỡng hóa đơn giản để tìm các ô tròn đáp án sắc nét
    _, thresh_bubbles = cv2.threshold(warped_gray, 200, 255, cv2.THRESH_BINARY_INV)
    
    # 3. Tìm tất cả các contour của ô tròn
    contours, _ = cv2.findContours(thresh_bubbles, cv2.RETR_CCOMP, cv2.CHAIN_APPROX_SIMPLE)
    
    bubbles = []
    for c in contours:
        (x, y), radius = cv2.minEnclosingCircle(c)
        # Giới hạn bán kính chuẩn cho ô tròn 14pt (bán kính ~12.5px trong ảnh warped 1000x1500)
        if radius >= 11.0 and radius <= 14.5:
            (bx, by, bw, bh) = cv2.boundingRect(c)
            ar = bw / float(bh)
            if 0.70 <= ar <= 1.30:
                bubbles.append((int(x), int(y)))
                    
    # Loại bỏ các tọa độ bị trùng lặp sát nhau
    unique_bubbles = []
    for b in bubbles:
        if not any(np.linalg.norm(np.array(b) - np.array(u)) < 10 for u in unique_bubbles):
            unique_bubbles.append(b)
            
    print(f"Tổng số ô tròn phát hiện được: {len(unique_bubbles)}")
    
    # Phân nhóm các ô tròn
    sbd_bubbles = []
    made_bubbles = []
    mcq_bubbles = []
    
    for (bx, by) in unique_bubbles:
        if by > 725: # Phân định MCQ và SBD/Mã đề ở mức y=725
            mcq_bubbles.append((bx, by))
        else:
            if bx < 500:
                sbd_bubbles.append((bx, by))
            else:
                made_bubbles.append((bx, by))
                
    # ── Sắp xếp SBD (6 cột x 10 hàng = 60 ô) ──
    sbd_bubbles = sorted(sbd_bubbles, key=lambda p: p[1])
    sbd_rows = []
    for i in range(10): # 10 hàng từ 0 đến 9
        row = sorted(sbd_bubbles[i*6 : (i+1)*6], key=lambda p: p[0])
        sbd_rows.append(row)
        
    # ── Sắp xếp Mã đề (3 cột x 10 hàng = 30 ô) ──
    made_bubbles = sorted(made_bubbles, key=lambda p: p[1])
    made_rows = []
    for i in range(10):
        row = sorted(made_bubbles[i*3 : (i+1)*3], key=lambda p: p[0])
        made_rows.append(row)
        
    # ── Sắp xếp MCQ (50 câu x 4 đáp án = 200 ô) ──
    col1 = [] # x < 360
    col2 = [] # x >= 360 và x < 660
    col3 = [] # x >= 660
    
    for b in mcq_bubbles:
        if b[0] < 360:
            col1.append(b)
        elif b[0] < 660:
            col2.append(b)
        else:
            col3.append(b)
            
    # Sắp xếp từng cột dọc theo chiều y
    col1 = sorted(col1, key=lambda p: p[1])
    col2 = sorted(col2, key=lambda p: p[1])
    col3 = sorted(col3, key=lambda p: p[1])
    
    mcq_structure = {}
    
    # Cột 1: Câu 1 đến 17 (17 câu)
    for i in range(17):
        q_num = i + 1
        row = sorted(col1[i*4 : (i+1)*4], key=lambda p: p[0])
        mcq_structure[str(q_num)] = row
        
    # Cột 2: Câu 18 đến 34 (17 câu)
    for i in range(17):
        q_num = i + 18
        row = sorted(col2[i*4 : (i+1)*4], key=lambda p: p[0])
        mcq_structure[str(q_num)] = row
        
    # Cột 3: Câu 35 đến 50 (16 câu)
    for i in range(16):
        q_num = i + 35
        row = sorted(col3[i*4 : (i+1)*4], key=lambda p: p[0])
        mcq_structure[str(q_num)] = row
        
    template_data = {
        "sbd": sbd_rows,
        "made": made_rows,
        "mcq": mcq_structure
    }
    
    with open(output_json_path, "w") as f:
        json.dump(template_data, f, indent=4)
    print(f"Lưu cấu hình tọa độ thành công vào {output_json_path}")


def grade_sheet(student_img_path, template_json_path, correct_answers):
    """
    Chấm điểm một phiếu trả lời của học sinh.
    """
    with open(template_json_path, "r") as f:
        template = json.load(f)
        
    img = cv2.imread(student_img_path)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    h, w = gray.shape[:2]
    
    # 1. Tìm điểm định vị ở 4 góc
    _, thresh_marker = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)
    contours, _ = cv2.findContours(thresh_marker, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    corners = get_4_corners(contours, w, h)
    
    # 2. Nắn thẳng ảnh
    warped_gray = warp_page(gray, corners)
    warped_color = warp_page(img, corners)
    
    # 3. Ngưỡng hóa nhị phân để đếm lượng pixel màu đen (thích ứng với ảnh chụp thực tế hơn)
    # Dùng ngưỡng nhị phân 150 để đảm bảo nét vẽ bút chì/bút bi được phát hiện rõ
    _, thresh_img = cv2.threshold(warped_gray, 150, 255, cv2.THRESH_BINARY_INV)
    
    results = {
        "sbd": "",
        "made": "",
        "answers": {},
        "score": 0.0,
        "correct_count": 0
    }
    
    # ── Đọc Số Báo Danh (SBD) ──
    sbd_digits = [""] * 6
    for col_idx in range(6):
        col_darkness = []
        for row_idx in range(10):
            pt = template["sbd"][row_idx][col_idx]
            cx, cy = pt[0], pt[1]
            # Vùng quét ô tròn 6x6 pixel quanh tâm để tránh lem
            bubble_area = thresh_img[cy-6:cy+6, cx-6:cx+6]
            col_darkness.append(cv2.countNonZero(bubble_area))
        
        max_idx = np.argmax(col_darkness)
        if col_darkness[max_idx] > 35: # Ngưỡng diện tích tô (trên 35 pixel tô)
            sbd_digits[col_idx] = str(max_idx)
        else:
            sbd_digits[col_idx] = "?"
    results["sbd"] = "".join(sbd_digits)
    
    # ── Đọc Mã đề thi (Made) ──
    made_digits = [""] * 3
    for col_idx in range(3):
        col_darkness = []
        for row_idx in range(10):
            pt = template["made"][row_idx][col_idx]
            cx, cy = pt[0], pt[1]
            bubble_area = thresh_img[cy-6:cy+6, cx-6:cx+6]
            col_darkness.append(cv2.countNonZero(bubble_area))
        
        max_idx = np.argmax(col_darkness)
        if col_darkness[max_idx] > 35:
            made_digits[col_idx] = str(max_idx)
        else:
            made_digits[col_idx] = "?"
    results["made"] = "".join(made_digits)
    
    # ── Đọc đáp án 50 câu MCQ ──
    options = ["A", "B", "C", "D"]
    for q_str in range(1, 51):
        q_key = str(q_str)
        pts = template["mcq"][q_key]
        
        darkness = []
        for pt in pts:
            cx, cy = pt[0], pt[1]
            bubble_area = thresh_img[cy-6:cy+6, cx-6:cx+6]
            darkness.append(cv2.countNonZero(bubble_area))
            
        max_idx = np.argmax(darkness)
        
        if darkness[max_idx] > 35:
            ans = options[max_idx]
            results["answers"][q_key] = ans
            
            cx, cy = pts[max_idx][0], pts[max_idx][1]
            correct_ans = correct_answers.get(q_key, "")
            
            if ans == correct_ans:
                cv2.circle(warped_color, (cx, cy), 10, (0, 200, 0), 2)
            else:
                cv2.circle(warped_color, (cx, cy), 10, (0, 0, 255), 2)
                if correct_ans in options:
                    correct_idx = options.index(correct_ans)
                    ccx, ccy = pts[correct_idx][0], pts[correct_idx][1]
                    cv2.circle(warped_color, (ccx, ccy), 10, (255, 0, 0), 1)
        else:
            results["answers"][q_key] = "Bỏ trống"
            
        if results["answers"][q_key] == correct_answers.get(q_key, ""):
            results["correct_count"] += 1
            
    results["score"] = round(results["correct_count"] * 10.0 / 50.0, 2)
    
    output_dir = os.path.dirname(student_img_path)
    output_graded_path = os.path.join(output_dir, "graded_result.png")
    cv2.imwrite(output_graded_path, warped_color)
    
    results["graded_image_path"] = output_graded_path
    return results
