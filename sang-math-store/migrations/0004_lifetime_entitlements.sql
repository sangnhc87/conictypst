CREATE TABLE IF NOT EXISTS entitlements (
  id TEXT PRIMARY KEY,
  email TEXT NOT NULL,
  product_id TEXT NOT NULL,
  order_id TEXT NOT NULL,
  granted_at TEXT NOT NULL,
  revoked_at TEXT,
  UNIQUE(email, product_id)
);

CREATE INDEX IF NOT EXISTS entitlements_email_idx
  ON entitlements(email, revoked_at);

CREATE INDEX IF NOT EXISTS entitlements_order_idx
  ON entitlements(order_id);

INSERT OR IGNORE INTO products (
  id,name,eyebrow,description,image,image2,color,price_vnd,active,starter,
  sort_order,file_key,file_name,file_size,updated_at,product_type,
  fulfillment_type,access_model,access_days,delivery_url,badge,featured
) VALUES (
  'trieu-phu-tri-thuc',
  'Triệu Phú Tri Thức',
  'Game giáo dục',
  'Tự tạo trò chơi 15 câu với công thức KaTeX, hình ảnh, màu riêng và chế độ trình chiếu. Dữ liệu lưu trên máy, có thể xuất ZIP để chuyển thiết bị.',
  '/previews/trieu-phu.png',
  NULL,
  '#f0b429',
  50000,
  1,
  0,
  1,
  NULL,
  NULL,
  NULL,
  datetime('now'),
  'game',
  'web_access',
  'lifetime',
  NULL,
  'https://sang-math-store.pages.dev/games/trieu-phu/',
  'Mới',
  1
);
