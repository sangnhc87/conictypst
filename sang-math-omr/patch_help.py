import re

with open('index.html', 'r') as f:
    content = f.read()

tab_btn = """
  <button class="tab-btn" onclick="switchTab('tab-help')" id="btn-tab-help">
    <span class="tab-icon">📖</span>Hướng Dẫn
  </button>
</div>
"""
content = content.replace("</div>\n\n<!-- ===================== TAB 1: CHẤM BÀI ===================== -->", tab_btn + "\n\n<!-- ===================== TAB 1: CHẤM BÀI ===================== -->")

tab_panel = """
<!-- ===================== TAB: HƯỚNG DẪN ===================== -->
<div class="tab-panel" id="tab-help">
  <div class="card">
    <h2 style="font-size: 18px; margin-top:0; color:var(--accent);">Hướng Dẫn Vận Hành & Chấm Cả Lớp</h2>
    <p>Hệ thống OMR này được thiết kế để chạy <strong>100% Offline trên trình duyệt</strong>, do đó bạn có thể dùng trên cả <strong>Máy tính (PC/Laptop)</strong> lẫn <strong>Điện thoại di động (Mobile)</strong>.</p>
    
    <hr style="border:0; border-top:1px solid var(--border); margin:15px 0;">
    
    <h3 style="font-size: 15px; margin-top:0; color:var(--text);">📱 1. Vận hành trên Điện thoại (Nhanh, tiện lợi)</h3>
    <ul style="margin-left: 20px; line-height: 1.6;">
      <li>Mở trang web này trên trình duyệt điện thoại (Safari/Chrome).</li>
      <li>Vào tab <strong>Chấm Bài</strong>, bấm nút <strong>Tải ảnh / Chụp ảnh</strong>.</li>
      <li>Điện thoại sẽ cho phép bạn chọn <em>"Chụp ảnh (Take Photo)"</em>. Bạn có thể chụp liên tiếp từng bài của học sinh.</li>
      <li>Hoặc bạn có thể chụp sẵn toàn bộ 40 bài của lớp lưu vào thư viện ảnh (Gallery), sau đó quét chọn toàn bộ 40 ảnh và bấm Tải lên.</li>
      <li>Bấm <strong>Bắt đầu chấm</strong>. Hệ thống sẽ tự động lướt qua 40 bài chỉ trong vài giây!</li>
    </ul>

    <h3 style="font-size: 15px; margin-top:20px; color:var(--text);">💻 2. Vận hành trên Máy tính (Khuyên dùng cho số lượng lớn)</h3>
    <ul style="margin-left: 20px; line-height: 1.6;">
      <li>Nếu trường học có máy Photo/Scan: Hãy quét (scan) nguyên một xấp bài thi của lớp thành 1 file PDF duy nhất.</li>
      <li>Sử dụng các công cụ chuyển PDF sang JPG (như <em>pdf2image</em> hoặc các trang web online) để tách file PDF thành một thư mục chứa 40 ảnh (JPG/PNG).</li>
      <li>Trên trang web này, bấm <strong>Tải ảnh lên</strong>, bôi đen (Ctrl+A) toàn bộ thư mục ảnh đó và tải lên cùng 1 lúc.</li>
      <li>Hệ thống sẽ chấm nguyên một lớp trong chớp mắt và hiển thị Bảng điểm tổng kết. Bạn có thể bấm <strong>Xuất Excel</strong> để lấy điểm vào sổ!</li>
    </ul>
    
    <h3 style="font-size: 15px; margin-top:20px; color:var(--text);">🤖 3. Công nghệ Human-in-the-loop (Chống gian lận)</h3>
    <p style="line-height:1.6; margin-top:5px;">
      Trong lúc hệ thống đang tự động chấm cả xấp bài, nếu phát hiện ra một bài thi có dấu hiệu đáng ngờ (học sinh tô 2 ô cùng 1 câu, hoặc tẩy xóa mờ mờ nửa đen nửa trắng), hệ thống sẽ lập tức:
    </p>
    <ul style="margin-left: 20px; line-height: 1.6;">
      <li><strong>Phát ra tiếng BÍP cảnh báo.</strong></li>
      <li><strong>Tạm dừng</strong> quá trình chấm hàng loạt.</li>
      <li>Hiển thị hộp thoại báo lỗi chi tiết (Ví dụ: "Cảnh báo bài số 5: Câu 14 tô nhiều ô").</li>
    </ul>
    <p style="line-height:1.6;">Giáo viên có thể dùng mắt kiểm tra lại ảnh trên màn hình, tự chốt điểm, sau đó bấm <strong>OK</strong> để hệ thống tiếp tục chấm các bài còn lại. Không lo sai sót!</p>
    
    <h3 style="font-size: 15px; margin-top:20px; color:var(--text);">🔲 4. Nhận diện Mã Đề Tự Động (QR Code)</h3>
    <p style="line-height:1.6; margin-top:5px;">
      Mỗi mẫu phiếu in ra đều có mã QR Code ở góc phải. Hệ thống sẽ quét mã này trước tiên để biết phiếu đó là loại nào (A4, A5, bao nhiêu câu). Do đó bạn <strong>không cần phải phân loại phiếu</strong> trước khi chấm, cứ trộn lẫn vào nhau hệ thống vẫn tự hiểu!
    </p>
  </div>
</div>

"""

content = content.replace("<!-- ===================== TAB 1: CHẤM BÀI ===================== -->", tab_panel + "\n<!-- ===================== TAB 1: CHẤM BÀI ===================== -->")

with open('index.html', 'w') as f:
    f.write(content)
