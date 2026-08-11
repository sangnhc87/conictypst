CREATE TABLE IF NOT EXISTS products (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  eyebrow TEXT NOT NULL,
  description TEXT NOT NULL,
  image TEXT NOT NULL,
  image2 TEXT,
  color TEXT NOT NULL,
  price_vnd INTEGER NOT NULL,
  active INTEGER NOT NULL DEFAULT 1,
  starter INTEGER NOT NULL DEFAULT 0,
  sort_order INTEGER NOT NULL DEFAULT 0,
  file_key TEXT,
  file_name TEXT,
  file_size INTEGER,
  updated_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

INSERT OR IGNORE INTO settings (key, value, updated_at) VALUES ('starter_combo_price', '79000', datetime('now'));

INSERT OR IGNORE INTO products VALUES
('teal-pro','Teal Pro','Chuyên nghiệp','Sắc xanh ngọc hiện đại, rõ ràng và cân bằng cho đề kiểm tra chính thức.','/previews/teal-pro.png',NULL,'#0f766e',19000,1,1,1,'products/teal-pro.zip','sang-math-teal-pro.zip',NULL,datetime('now')),
('aurora','Aurora','Nổi bật','Dải màu chuyển sắc trẻ trung, phù hợp phiếu học tập và chuyên đề sáng tạo.','/previews/aurora.png',NULL,'#7c3aed',19000,1,1,2,'products/aurora.zip','sang-math-aurora.zip',NULL,datetime('now')),
('navy-gold','Navy Gold','Sang trọng','Xanh navy phối vàng học thuật, lý tưởng cho đề thi thử và tài liệu cao cấp.','/previews/navy-gold.png',NULL,'#b88a22',19000,1,1,3,'products/navy-gold.zip','sang-math-navy-gold.zip',NULL,datetime('now')),
('lotus','Lotus','Thanh lịch','Cảm hứng hoa sen Việt, mềm mại nhưng vẫn chuẩn mực và dễ đọc khi in.','/previews/lotus.png',NULL,'#be185d',19000,1,1,4,'products/lotus.zip','sang-math-lotus.zip',NULL,datetime('now')),
('ocean-hexagon','Ocean Hexagon','Cá tính','Hình học lục giác và màu đại dương tạo nhận diện mạnh cho lớp học hiện đại.','/previews/ocean-hexagon.png',NULL,'#0369a1',19000,1,1,5,'products/ocean-hexagon.zip','sang-math-ocean-hexagon.zip',NULL,datetime('now')),
('hyperlink','Hyperlink Tự Động','Tương tác PDF','Câu hỏi và mục lục có liên kết điều hướng trong PDF, mở nhanh đúng câu khi dạy hoặc chữa đề.','/previews/hyperlink.png',NULL,'#2457d6',19000,1,0,6,'products/hyperlink.zip','sang-math-hyperlink.zip',NULL,datetime('now')),
('beamer','Beamer Teal Pro','Trình chiếu 16:9','Bài giảng trình chiếu chuyên dụng, đồng bộ màu sắc và công thức Toán rõ nét trên màn hình lớn.','/previews/beamer.png',NULL,'#087f72',19000,1,0,7,'products/beamer.zip','sang-math-beamer.zip',NULL,datetime('now')),
('draft-duplex','Đề 70/30 — Nháp Đối Xứng','In hai mặt chẵn–lẻ','70% nội dung và 30% nháp: trang lẻ nháp bên phải, trang chẵn nháp bên trái khi in hai mặt.','/previews/draft-duplex-odd.png','/previews/draft-duplex-even.png','#0f766e',19000,1,0,8,'products/draft-duplex.zip','sang-math-draft-duplex.zip',NULL,datetime('now'));
