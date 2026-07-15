# Bảo mật và bản quyền website ConicTypst

## Phạm vi

Lớp bảo vệ áp dụng cho ba website frontend công khai:

- `hdsd-conictypst.pages.dev`
- `chamthi-conictypst.pages.dev`
- `typstconichub.pages.dev`

Nó bảo vệ **mã website, giao diện và quy trình triển khai**. Nó không đổi giấy phép của các gói mã nguồn mở được công bố riêng, chẳng hạn `sang-math` và các dependency bên thứ ba.

## Giới hạn kỹ thuật cần hiểu đúng

Mã HTML, CSS và JavaScript chạy ở frontend bắt buộc phải được gửi xuống trình duyệt. Vì vậy không có giải pháp nào cấm tuyệt đối việc xem source hoặc DevTools. Chặn chuột phải, F12 hay tổ hợp phím chỉ gây khó cho người dùng hợp lệ và không ngăn được sao chép.

Hệ thống dùng các lớp bảo vệ có thể kiểm chứng:

1. Production build minify mã và không phát hành source map.
2. HTML và console hiển thị thông báo bản quyền rõ ràng.
3. Domain guard khóa bản sao được triển khai trên hostname không được cấp phép.
4. CSP, COOP/COEP, `X-Frame-Options`, `nosniff`, Referrer Policy và Permissions Policy giảm bề mặt tấn công.
5. Service Worker được đổi phiên bản khi lớp bảo vệ thay đổi để máy người dùng không giữ shell cũ.
6. Khóa API, secret và quyền quản trị phải nằm ở backend/Cloudflare/Firebase; không đặt trong frontend.

## Hostname được phép

Mỗi site chỉ chấp nhận domain production của chính nó, các preview subdomain thuộc project Cloudflare Pages, `conictypst.com` và môi trường phát triển cục bộ.

Không còn cơ chế `?unlock=conic` hoặc token mở khóa nằm công khai trong source. Nếu đổi domain chính thức, cần cập nhật allowlist trong source, build lại và triển khai một phiên bản mới.

## Thông điệp bản quyền

Việc xem source không tự động tạo quyền sử dụng. Không được sao chép, tái triển khai hoặc bán lại mã website khi chưa có sự đồng ý bằng văn bản của chủ sở hữu. Nội dung giáo viên tải lên và dữ liệu học sinh vẫn thuộc người dùng tương ứng.
