import re

def fix(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    content = re.sub(
        r'#exam-part\(\s*"Phần I[^"]*",\s*note:\s*"[^"]*"\s*,\s*\)',
        '#exam-part(\n    [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.],\n    count: 12,\n    reset-counter: true,\n  )',
        content
    )

    content = re.sub(
        r'#exam-part\(\s*"Phần II[^"]*",\s*note:\s*"[^"]*"\s*,\s*\)',
        '#exam-part(\n    [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4; trong mỗi ý a), b), c), d), thí sinh chọn đúng hoặc sai.],\n    count: 4,\n    reset-counter: true,\n  )',
        content
    )

    content = re.sub(
        r'#exam-part\(\s*"Phần III[^"]*",\s*note:\s*"[^"]*"\s*,\s*\)',
        '#exam-part(\n    [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],\n    count: 6,\n    reset-counter: true,\n  )',
        content
    )

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

fix('de-on-kiem-tra-chuong-1-de-4.typ')
fix('de-on-kiem-tra-chuong-1-de-5.typ')
