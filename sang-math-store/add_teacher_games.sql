-- Insert products
INSERT OR REPLACE INTO products (id, name, eyebrow, description, image, color, price_vnd, active, sort_order, updated_at, entitlement_key) VALUES 
('rung-chuong', 'Rung Chuông Vàng', 'Đấu trường toàn lớp', 'Học sinh ghi bảng, trả lời để bám trụ đến cùng', '/previews/rung-chuong.png', '#eab308', 100000, 1, 160, CURRENT_TIMESTAMP, 'rung-chuong-vang'),
('bong-da', 'Bóng Đá Luân Lưu', 'Hai đội sút phạt', 'Đáp án đúng là một cú sút tung lưới đối phương', '/previews/bong-da.png', '#22c55e', 100000, 1, 170, CURRENT_TIMESTAMP, 'bong-da-luan-luu');

-- Insert packages for Rung Chuông Vàng
INSERT OR REPLACE INTO packages (id, product_id, title, duration_days, price, original_price) VALUES
('rcv_30k', 'rung-chuong', 'Gói 3 tháng', 90, 30000, 50000),
('rcv_50k', 'rung-chuong', 'Gói 6 tháng', 180, 50000, 100000),
('rcv_100k', 'rung-chuong', 'Gói 12 tháng', 365, 100000, 200000);

-- Insert packages for Bóng Đá Luân Lưu
INSERT OR REPLACE INTO packages (id, product_id, title, duration_days, price, original_price) VALUES
('bd_30k', 'bong-da', 'Gói 3 tháng', 90, 30000, 50000),
('bd_50k', 'bong-da', 'Gói 6 tháng', 180, 50000, 100000),
('bd_100k', 'bong-da', 'Gói 12 tháng', 365, 100000, 200000);
