import os
import glob
import json
import requests
import concurrent.futures
import time

API_KEY = os.environ.get("DEEPSEEK_API_KEY")
if not API_KEY:
    print("Missing DEEPSEEK_API_KEY environment variable.")
    exit(1)

URL = "https://api.deepseek.com/v1/chat/completions"

SYSTEM_PROMPT = """Bạn là một chuyên gia Sư phạm Toán học xuất sắc và là một chuyên gia về Typst. Nhiệm vụ của bạn là nhận vào nội dung thô của một file Giáo án (môn Toán) và nâng cấp (rewrite) nội dung đó thành một giáo án đạt chuẩn cao nhất theo CTGDPT 2018 (Phát triển năng lực), đồng thời sử dụng triệt để các lệnh làm đẹp (Template Typst) sau:
1. Mở bài phải có hoạt động Khám phá / Khởi động bằng tình huống thực tiễn hấp dẫn, có vấn đề.
2. Hình thành kiến thức: Ứng dụng Năng lực số (dùng GeoGebra, phần mềm), thiết kế hoạt động khám phá thay vì chỉ đọc SGK. Đưa các ghi chú năng lực số vào lệnh `#nl-so("...")`.
3. Nhấn mạnh lỗi sai bằng `#du-kien[...]`.
4. Bọc các ví dụ bằng `#vi-du[...]`.
5. Phần Luyện tập phải chia dạng cụ thể `#dang("1", "Tên dạng")[ ... ]` và dùng `#bai("1", [Đề bài], dap-an: [A])`.
6. Giữ nguyên cấu trúc I. Mục tiêu, II. Thiết bị, III. Tiến trình.
7. Giữ nguyên các thẻ lệnh `#hd(...)`, `#hd-tp(...)`, `#mt-hd`, `#nd-hd`, `#sp-hd`, `#tc-hd`. 
8. Đầu file giữ nguyên phần khai báo biến (ví dụ `#import "../modules/giao-an.typ": *`, `#show: giao-an.with(...)`).

Lưu ý: TRẢ VỀ DUY NHẤT mã nguồn Typst (KHÔNG bọc trong markdown ```typst...```, KHÔNG giải thích gì thêm, KHÔNG nói "Đây là nội dung..."). Chỉ trả về code Typst.
"""

def process_file(filepath):
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

        # Skip if it already looks like it has been processed
        if "#nl-so" in content and "#vi-du" in content:
            return f"✅ {filepath} - ĐÃ ĐƯỢC NÂNG CẤP TỪ TRƯỚC"

        payload = {
            "model": "deepseek-chat",
            "messages": [
                {"role": "system", "content": SYSTEM_PROMPT},
                {"role": "user", "content": f"Hãy thiết kế lại toàn diện kịch bản sư phạm cho bài học này:\n\n{content}"}
            ],
            "temperature": 0.5,
        }

        headers = {
            "Authorization": f"Bearer {API_KEY}",
            "Content-Type": "application/json"
        }

        response = requests.post(URL, json=payload, headers=headers, timeout=120)
        response.raise_for_status()

        result = response.json()["choices"][0]["message"]["content"]
        
        # Clean up markdown formatting if the model still includes it
        if result.startswith("```typst"):
            result = result[8:]
        elif result.startswith("```"):
            result = result[3:]
            
        if result.endswith("```"):
            result = result[:-3]

        result = result.strip()

        # Write back to file
        with open(filepath, "w", encoding="utf-8") as f:
            f.write(result)
        
        return f"🚀 {filepath} - Tối ưu sư phạm thành công!"

    except Exception as e:
        return f"❌ {filepath} - ERROR: {str(e)}"

def main():
    target_dir = "typst/giao-an"
    files = glob.glob(f"{target_dir}/**/*.typ", recursive=True)
    # Exclude modules folder and test files
    files = [f for f in files if "/modules/" not in f and "test" not in f.lower()]
    
    print(f"Bắt đầu tự động tối ưu hóa sư phạm cho {len(files)} file giáo án với DeepSeek API (5 workers concurrent)...")
    
    success = 0
    failed = 0
    skipped = 0

    with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
        futures = {executor.submit(process_file, f): f for f in files}
        for future in concurrent.futures.as_completed(futures):
            res = future.result()
            print(res)
            if "ERROR" in res:
                failed += 1
            elif "ĐÃ ĐƯỢC NÂNG CẤP" in res:
                skipped += 1
            else:
                success += 1
                
    print(f"\n--- KẾT QUẢ: Thành công {success}, Bỏ qua {skipped}, Thất bại {failed} ---")
    
if __name__ == "__main__":
    main()
