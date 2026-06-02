Hướng dẫn sử dụng Deepseek với Aider (workspace)

Tổng quan
- Ta đã cấu hình Aider để dùng provider `deepseek` trong workspace.
- Endpoint: `https://api.deepseek.ai/v1`
- Model mặc định: `v4-pro`. Các model hỗ trợ: `v4-pro`, `flash`.
- Khóa API được đọc từ biến môi trường `DEEPSEEK_API_KEY`.

Kiểm tra nhanh (terminal trong VSCode)
1) Kiểm tra biến môi trường đã có trong terminal của VSCode:

```bash
echo $DEEPSEEK_API_KEY
```

2) Nếu rỗng, tải lại `~/.zshrc` rồi thử lại:

```bash
source ~/.zshrc
echo $DEEPSEEK_API_KEY
```

Test trực tiếp bằng `curl` (không gửi file lớn):

```bash
curl -sS -X POST https://api.deepseek.ai/v1/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DEEPSEEK_API_KEY" \
  -d '{"model":"v4-pro","prompt":"Viết 1 câu chào ngắn bằng tiếng Việt."}'
```

> Lưu ý: endpoint và đường dẫn resource (`/completions`) có thể khác tùy API Deepseek bạn đang dùng. Nếu server yêu cầu đường dẫn khác, thay vào tương ứng.

Sử dụng trong VSCode với Aider
- Mở Command Palette (Cmd+Shift+P) → `Aider: Chat` hoặc `Aider: Fix code`.
- Aider sẽ dùng provider `deepseek` theo cấu hình workspace. Để đổi model tạm thời, tìm trong cài đặt Aider (nếu extension hỗ trợ override request) hoặc chỉnh `/.vscode/settings.json` thay `defaultModel`.

Thay model mặc định (nếu muốn):
- Mở `/.vscode/settings.json`, tìm phần `aider.providers.deepseek.defaultModel` và đặt là `flash` hoặc `v4-pro`.

Ví dụ minimal request body (JSON) cho developers
- Body cho completions (ví dụ chuẩn chung):

```json
{
  "model": "v4-pro",
  "prompt": "Tóm tắt file này in Vietnamese",
  "max_tokens": 800
}
```

Xử lý lỗi phổ biến
- 401 Unauthorized: biến môi trường chưa nạp trong shell của VSCode hoặc key sai.
- Kết nối lỗi/timed out: kiểm tra endpoint đúng và mạng.
- Lỗi JSON/Schema: kiểm tra body gửi đúng cấu trúc API yêu cầu (tham khảo docs Deepseek nếu có).

Bảo mật
- Không commit khóa API vào git.
- Đặt key trong `~/.zshrc` hoặc trong Credential Manager an toàn.

Muốn mình làm tiếp
- A: Thử gửi 1 request test (mình không gửi request thật để tránh lộ key, nhưng có thể tạo 1 script local bạn chạy).
- B: Thêm snippet VSCode (Command) để gửi prompt nhanh từ file hiện hành.
- C: Thay `defaultModel` sang `flash` ngay bây giờ.

Chọn A, B, hoặc C (hoặc gửi endpoint / endpoint path chính xác nếu khác `/completions`).
