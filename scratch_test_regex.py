import re

lines = [
    "==== a) Mục tiêu",
    "- #strong[a) Mục tiêu:] Phát biểu được...",
    "==== b) Nội dung",
    "- #strong[b) Nội dung:]",
    "=== 1. Hoạt động 1: Xác định vấn đề/nhiệm vụ học tập/Mở đầu (Khơi gợi kiến thức)",
    "=== 2. Hoạt động 2: Hình thành kiến thức mới/giải quyết vấn đề (04 tiết)",
    "==== Hoạt động 2.1: Khái niệm tính đơn điệu của hàm số và mối liên hệ với đạo hàm"
]

for line in lines:
    m_mt = re.search(r'^(?:====|-).*?a\)\s*Mục tiêu[^\w]*(.*)', line, re.IGNORECASE)
    if m_mt:
        print(f"MT: '{m_mt.group(1)}'")
        continue
    m_nd = re.search(r'^(?:====|-).*?b\)\s*Nội dung[^\w]*(.*)', line, re.IGNORECASE)
    if m_nd:
        print(f"ND: '{m_nd.group(1)}'")
        continue
        
    m_hd = re.search(r'^===\s*(\d+)\.\s*Hoạt động\s*\d*:\s*(.*)', line, re.IGNORECASE)
    if m_hd:
        hd_so = m_hd.group(1)
        hd_rest = m_hd.group(2)
        # extract time if exists
        m_time = re.search(r'(.*?)\(([^)]+)\)\s*$', hd_rest)
        if m_time:
            hd_ten = m_time.group(1).strip()
            hd_phut = m_time.group(2).strip()
        else:
            hd_ten = hd_rest.strip()
            hd_phut = ""
        print(f"HD: so={hd_so}, ten={hd_ten}, phut={hd_phut}")
        continue
        
    m_hdtp = re.search(r'^====\s*Hoạt động\s*([0-9.]+):\s*(.*)', line, re.IGNORECASE)
    if m_hdtp:
        hdtp_so = m_hdtp.group(1)
        hdtp_rest = m_hdtp.group(2)
        m_time = re.search(r'(.*?)\(([^)]+)\)\s*$', hdtp_rest)
        if m_time:
            hdtp_ten = m_time.group(1).strip()
            hdtp_phut = m_time.group(2).strip()
        else:
            hdtp_ten = hdtp_rest.strip()
            hdtp_phut = ""
        print(f"HD-TP: so={hdtp_so}, ten={hdtp_ten}, phut={hdtp_phut}")
        continue
