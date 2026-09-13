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
- Khi người dùng yêu cầu vẽ hình học (hình phẳng, hình không gian, đồ thị, thiết diện, Oxyz): BẮT BUỘC dùng thư viện `sang-math-geom.typ` (`public/hdsd/typst/sang-math-geom.typ`) với các hàm chuẩn `sm-*`. Tuyệt đối không tự hardcode toạ độ thô hay vẽ từ đầu bằng CeTZ cơ bản. Mọi hình vẽ mở rộng/dựng tiếp BẮT BUỘC dùng hook `them: (ctx, d) => { ... }` kết hợp các hàm đại số dựng hình `sm-trung-diem`, `sm-ti-le`, `sm-trong-tam`, `sm-giao-diem`, `sm-song-song`, `sm-hinh-chieu`, `sm-doan`, `sm-thiet-dien`, `sm-ve-goc-vuong`, `sm-ve-goc`, `sm-diem`. Chi tiết xem skill `.agents/skills/typst-geom-expert/SKILL.md`.

