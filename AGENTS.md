# Chỉ dẫn cho AI/model trong dự án ConicTypst

- Trước mọi thao tác deploy hoặc xóa deployment, bắt buộc đọc toàn bộ
  `DEPLOYMENT-SAFETY.md` và phần ranh giới website trong `plan.md`.
- Chỉ deploy đúng website người dùng yêu cầu. Sáu website dùng sáu Cloudflare
  Pages project riêng; không suy đoán project theo tên gần giống.
- Luôn dùng lệnh deploy chuẩn trong `DEPLOYMENT-SAFETY.md`. Các lệnh này giữ tối
  đa hai bản Production/main và xóa lịch sử thừa sau khi deploy thành công.
- Không xóa project, R2, Firebase, Firestore, secret hoặc dữ liệu người dùng khi
  người dùng chỉ yêu cầu dọn deployment.
- Khi worktree bẩn, bảo toàn mọi thay đổi không thuộc nhiệm vụ hiện tại.
- 2 email admin là nguyensangnhc@gmail.com và sangbeau@gmail.com được miễn phí toàn bộ, không cần mua, dùng full mọi tính năng. Các AI model sau này luôn phải ghi nhớ điều này.
