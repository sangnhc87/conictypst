ALTER TABLE products ADD COLUMN entitlement_key TEXT;

CREATE INDEX IF NOT EXISTS products_entitlement_key_idx
  ON products(entitlement_key, active, access_days);

CREATE TABLE IF NOT EXISTS access_grants (
  id TEXT PRIMARY KEY,
  email TEXT NOT NULL,
  access_key TEXT NOT NULL,
  source_product_id TEXT NOT NULL,
  last_order_id TEXT NOT NULL,
  starts_at TEXT NOT NULL,
  expires_at TEXT,
  revoked_at TEXT,
  updated_at TEXT NOT NULL,
  UNIQUE(email, access_key)
);

CREATE INDEX IF NOT EXISTS access_grants_email_idx
  ON access_grants(email, revoked_at, expires_at);

CREATE INDEX IF NOT EXISTS access_grants_order_idx
  ON access_grants(last_order_id);

CREATE TABLE IF NOT EXISTS product_trials (
  id TEXT PRIMARY KEY,
  email TEXT NOT NULL,
  access_key TEXT NOT NULL,
  started_at TEXT NOT NULL,
  expires_at TEXT NOT NULL,
  UNIQUE(email, access_key)
);

CREATE INDEX IF NOT EXISTS product_trials_email_idx
  ON product_trials(email, access_key, expires_at);

-- Giữ nguyên mọi quyền vĩnh viễn đã từng được cấp trước khi đổi chính sách.
INSERT OR IGNORE INTO access_grants (
  id,email,access_key,source_product_id,last_order_id,starts_at,expires_at,
  revoked_at,updated_at
)
SELECT
  id,email,product_id,product_id,order_id,granted_at,NULL,revoked_at,granted_at
FROM entitlements;

UPDATE products SET
  name='Triệu Phú Tri Thức · 1 năm',
  eyebrow='Game giáo dục · Gói 1 năm',
  description='Tự tạo game với KaTeX, hình ảnh, màu riêng và chế độ trình chiếu. Dùng thử full 24 giờ một lần; dữ liệu lưu trên máy và chuyển thiết bị bằng ZIP.',
  price_vnd=30000,
  access_model='subscription',
  access_days=365,
  entitlement_key='trieu-phu-tri-thuc',
  badge='Dùng thử miễn phí',
  updated_at=datetime('now')
WHERE id='trieu-phu-tri-thuc';

INSERT OR IGNORE INTO products (
  id,name,eyebrow,description,image,image2,color,price_vnd,active,starter,
  sort_order,file_key,file_name,file_size,updated_at,product_type,
  fulfillment_type,access_model,access_days,delivery_url,badge,featured,
  entitlement_key
) VALUES
(
  'trieu-phu-tri-thuc-2y','Triệu Phú Tri Thức · 2 năm',
  'Game giáo dục · Gói 2 năm',
  'Tự tạo game với KaTeX, hình ảnh, màu riêng và chế độ trình chiếu. Dùng thử full 24 giờ một lần; dữ liệu lưu trên máy và chuyển thiết bị bằng ZIP.',
  '/previews/trieu-phu.png',NULL,'#f0b429',50000,1,0,2,NULL,NULL,NULL,
  datetime('now'),'game','web_access','subscription',730,
  'https://sang-math-store.pages.dev/games/trieu-phu/',
  'Phổ biến',1,'trieu-phu-tri-thuc'
),
(
  'trieu-phu-tri-thuc-5y','Triệu Phú Tri Thức · 5 năm',
  'Game giáo dục · Gói 5 năm',
  'Tự tạo game với KaTeX, hình ảnh, màu riêng và chế độ trình chiếu. Dùng thử full 24 giờ một lần; dữ liệu lưu trên máy và chuyển thiết bị bằng ZIP.',
  '/previews/trieu-phu.png',NULL,'#f0b429',100000,1,0,3,NULL,NULL,NULL,
  datetime('now'),'game','web_access','subscription',1825,
  'https://sang-math-store.pages.dev/games/trieu-phu/',
  'Tiết kiệm nhất',1,'trieu-phu-tri-thuc'
);
