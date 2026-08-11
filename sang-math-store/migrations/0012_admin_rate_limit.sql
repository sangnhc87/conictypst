-- Rate-limit đăng nhập quản trị theo IP, chống dò mật khẩu (brute-force).
-- An toàn: code đọc/ghi bảng này trong try/catch, nếu bảng chưa tồn tại thì
-- tự fallback về hành vi cũ (chỉ kiểm tra ADMIN_KEY) — không chặn admin thật.
CREATE TABLE IF NOT EXISTS admin_auth_attempts (
  ip TEXT PRIMARY KEY,
  fail_count INTEGER NOT NULL DEFAULT 0,
  first_fail_at TEXT NOT NULL,
  blocked_until TEXT
);

CREATE INDEX IF NOT EXISTS admin_auth_attempts_blocked_idx ON admin_auth_attempts(blocked_until);
